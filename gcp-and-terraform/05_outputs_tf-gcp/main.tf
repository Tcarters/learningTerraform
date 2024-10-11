provider "google" {
  project = var.project
  region  = var.region
}

# Service account resource (if you don't have one created already)
# resource "google_service_account" "cloudfunction_sa" {
#   account_id   = "cloudfunctionsa"
#   display_name = "Cloud Functions Service Account"
# }

# Create a Google Cloud Storage bucket for the function stage
resource "google_storage_bucket" "bucket" {
  name     = "${var.project}-bucket"
  location = "US"
  uniform_bucket_level_access = true

}

# Create the Bucket object
resource "google_storage_bucket_object" "object" {
  name = "code-source.zip"
  bucket =  google_storage_bucket.bucket.name
  source = "code-source.zip"
}

# Pub/Sub Topic that triggers the function
resource "google_pubsub_topic" "cf_demo" {
  name = "cf-demo"
}

# Cloud Function (2nd Gen) deployment
resource "google_cloudfunctions2_function" "nodejs_pubsub_function" {
  name        = "nodejs-pubsub-function"
  location    = var.region

  build_config {
    runtime       = var.runtime
    entry_point   = "helloPubSub"
    environment_variables = {
        BUILD_CONFIG_TEST = "build_test"
    }

    source {
      storage_source {
        bucket = "${var.project}-bucket" #google_storage_bucket.bucket.name
        object = google_storage_bucket_object.object.name
        # "source.zip" # Assume the code is packaged and uploaded to this location
      }
    }

  }

  
  service_config {
    available_memory = "256M"
    timeout_seconds = 60
    environment_variables = {
      FUNCTION_TARGET = "helloPubSub" # Entry point for the function
    }
    
    # service_account_email = google_service_account.cloudfunction_sa.email
  }

  event_trigger {
    event_type = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic = google_pubsub_topic.cf_demo.id
    retry_policy = "RETRY_POLICY_RETRY"

  }
}

# Allow unauthenticated invocations
resource "google_cloudfunctions2_function_iam_member" "allow_unauthenticated" {
  project        = google_cloudfunctions2_function.nodejs_pubsub_function.project
  # region         = google_cloudfunctions2_function.nodejs_pubsub_function.location
  #google_cloudfunctions2_function.nodejs_pubsub_function.location
  cloud_function = google_cloudfunctions2_function.nodejs_pubsub_function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
