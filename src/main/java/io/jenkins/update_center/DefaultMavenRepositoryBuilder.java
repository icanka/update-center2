package io.jenkins.update_center;

import java.util.logging.Level;
import java.util.logging.Logger;
import io.jenkins.update_center.util.Environment;

public class DefaultMavenRepositoryBuilder {

    private static String ARTIFACTORY_API_USERNAME = "raflman";
    private static String ARTIFACTORY_API_PASSWORD = "uWqxMF3fMQvrLWp";
    private static final Logger LOGGER = Logger.getLogger(DefaultMavenRepositoryBuilder.class.getName());
    private DefaultMavenRepositoryBuilder() {

    }

    private static BaseMavenRepository instance;

    public static synchronized BaseMavenRepository getInstance() {
        if (instance == null) {
            LOGGER.log(Level.INFO, "BaseMavenRepository instance is null, creating it.");
            if (ARTIFACTORY_API_PASSWORD != null && ARTIFACTORY_API_USERNAME != null) {
                instance = new ArtifactoryRepositoryImpl(ARTIFACTORY_API_USERNAME, ARTIFACTORY_API_PASSWORD);
            } 
            else {
               throw new IllegalStateException("ARTIFACTORY_USERNAME and ARTIFACTORY_PASSWORD need to be set");
            }
        }
        return instance;
    }
}
