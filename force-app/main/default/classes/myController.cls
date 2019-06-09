public class myController {
    public String myString {
        get {
            if (myString == null) {
                myString = 'Hello';
            }
            return myString;
        }private set;
    }
    public String getMyString() {
        return 'getMyString';
    }
    public String getStringMethod(){
        if (myString == null) {
            myString = 'b';
        }
        return myString;
    }
}