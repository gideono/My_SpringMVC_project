package se.visma.bbs.components;

/**
 * Created by gideon on 2014-02-27.
 */
public class Languages {
    private String language = null;
    private String phrase = null;

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getPhrase() {
        return phrase;
    }

    public void setPhrase(String phrase) {
        this.phrase = phrase;
    }

    @Override
    public String toString() {
        return "Languages{" +
                "language='" + language + '\'' +
                ", phrase='" + phrase + '\'' +
                '}';
    }
}
