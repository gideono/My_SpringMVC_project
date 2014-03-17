package se.visma.bbs.components;

/**
 * Created by gideon on 2014-03-03.
 */
public class Option {
    private String text;
    private String value;
    private String returnValue;
    private String numValue;
    private String txtValue;
    private String english;
    private String finnish;
    private String norwegian;
    private String german;
    private String danish;
    private String polish;
    private boolean _default;
    private boolean invalid;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getReturnValue() {
        return returnValue;
    }

    public void setReturnValue(String returnValue) {
        this.returnValue = returnValue;
    }

    public String getNumValue() {
        return numValue;
    }

    public void setNumValue(String numValue) {
        this.numValue = numValue;
    }

    public String getTxtValue() {
        return txtValue;
    }

    public void setTxtValue(String txtValue) {
        this.txtValue = txtValue;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getFinnish() {
        return finnish;
    }

    public void setFinnish(String finnish) {
        this.finnish = finnish;
    }

    public String getNorwegian() {
        return norwegian;
    }

    public void setNorwegian(String norwegian) {
        this.norwegian = norwegian;
    }

    public String getGerman() {
        return german;
    }

    public void setGerman(String german) {
        this.german = german;
    }

    public String getDanish() {
        return danish;
    }

    public void setDanish(String danish) {
        this.danish = danish;
    }

    public String getPolish() {
        return polish;
    }

    public void setPolish(String polish) {
        this.polish = polish;
    }

    public boolean is_default() {
        return _default;
    }

    public void set_default(boolean _default) {
        this._default = _default;
    }

    public boolean isInvalid() {
        return invalid;
    }

    public void setInvalid(boolean invalid) {
        this.invalid = invalid;
    }

    @Override
    public String toString() {
        return "Option{" +
                "text='" + text + '\'' +
                ", value='" + value + '\'' +
                ", returnValue='" + returnValue + '\'' +
                ", numValue='" + numValue + '\'' +
                ", txtValue='" + txtValue + '\'' +
                ", english='" + english + '\'' +
                ", finnish='" + finnish + '\'' +
                ", norwegian='" + norwegian + '\'' +
                ", german='" + german + '\'' +
                ", danish='" + danish + '\'' +
                ", polish='" + polish + '\'' +
                ", _default=" + _default +
                ", invalid=" + invalid +
                '}';
    }
}