BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'STRAVA',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'strava',
      p_auto_rest_auth      => TRUE);
    
  ORDS.DEFINE_MODULE(
      p_module_name    => 'com.oracle.dbtools.dashboard.Strava Dashboard Powered by Oracle REST Data Services',
      p_base_path      => '/sdw/dashboards/Strava Dashboard Powered by Oracle REST Data Services/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => 'personal data as recorded via Garmin (watch) and Strava');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'com.oracle.dbtools.dashboard.Strava Dashboard Powered by Oracle REST Data Services',
      p_pattern        => 'dashboard_settings',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'com.oracle.dbtools.dashboard.Strava Dashboard Powered by Oracle REST Data Services',
      p_pattern        => 'dashboard_settings',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => NULL,
      p_comments       => NULL,
      p_source         => 
'SELECT
	''application/json'' AS CONTENT_TYPE,
	CONCAT( CONCAT( CONCAT( TO_CLOB( ''{
    "com.oracle.dbtools.dashboard": {
        "name": "Strava Dashboard Powered by Oracle REST Data Services",
        "description": "personal data as recorded via Garmin (watch) and Strava",
        "layout": {
            "gridOptions": {
                "column": 4
            },
            "widgets": [
                {
                    "views": [
                        {
                            "type": "chart"
                        },
                        {
                            "type": "grid"
                        }
                    ],
                    "itemOptions": {
                        "x": 0,
                        "y": 1,
                        "w": 1,
                        "h": 1
                    },
                    "chartName": "StravaActivityDistance"
                },
                {
                    "views": [
                        {
                            "type": "chart"
                        }
               '' ), TO_CLOB( ''     ],
                    "itemOptions": {
                        "x": 2,
                        "y": 0,
                        "w": 1,
                        "h": 1
                    },
                    "chartName": "StravaHeartRateType"
                },
                {
                    "views": [
                        {
                            "type": "chart"
                        },
                        {
                            "type": "grid"
                        }
                    ],
                    "itemOptions": {
                        "x": 1,
                        "y": 1,
                        "w": 3,
                        "h": 1
                    },
                    "chartName": "StravaHeartRate"
                },
                {
                    "views": [
                        {
                            "type": "chart"
                        },
                        {
                            "type": "g'' ) ), TO_CLOB( ''rid"
                        }
                    ],
                    "itemOptions": {
                        "x": 3,
                        "y": 0,
                        "w": 1,
                        "h": 1
                    },
                    "chartName": "StravaSumTime"
                },
                {
                    "views": [
                        {
                            "type": "chart"
                        }
                    ],
                    "itemOptions": {
                        "x": 0,
                        "y": 0,
                        "w": 1,
                        "h": 1
                    },
                    "chartName": "StravaActivityType"
                },
                {
                    "views": [
                        {
                            "type": "chart"
                        }
                    ],
                    "itemOptions": {
                        "x": 1,
                        "y'' ) ), TO_CLOB( ''": 0,
                        "w": 1,
                        "h": 1
                    },
                    "chartName": "StravaDayOfWeek"
                }
            ]
        }
    }
}'' ) ) AS BODY,
	''dashboard_settings.json'' AS FILE_NAME
FROM
	DUAL');

    
        
COMMIT;

END;