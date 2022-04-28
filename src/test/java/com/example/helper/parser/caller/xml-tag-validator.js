function fn(args) {
	var XmlValidator = Java.type('com.example.helper.parser.XmlValidator');
	var verify = new XmlValidator(args._xmlcontent.toString());
	var result = verify.isTagPresent(args._xpath.toString());
	return result;
}