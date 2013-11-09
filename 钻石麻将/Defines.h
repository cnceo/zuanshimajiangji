#define IMAGE_WITH_NAME(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:name]]
#define image_bundle_path(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:name]]
#define DOC_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define DOC_PATH_FILENAME(fileName) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:fileName]

#define WEBSERVICE_URL @"http://CardsChina.chinaxyl.com/WebService/WebService.asmx"

#define GET_URL @"http://CardsChina.chinaxyl.com/CardMS/ICommon/CardsInterface.aspx?type=hbpath"

#define NEW_MARKS @"GetNewT_seal"//获取新邮戳信息
#define NEW_PROS @"GetNewT_designers_words"//获取新卡片信息

#define WEBSERVICE_BODY(mothedName) [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n""<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">\n" "<soap:Body>\n" "<%@ xmlns=\"http://tempuri.org/\">\n" "<webServiceID>86F877F827E4417dA34F9CA53389C4B8</webServiceID>\n" "<webServicePwd>C33BA857E3674328BCA8C8CEF7F45D1A</webServicePwd>\n" "</%@>\n"                                                               "</soap:Body>\n"                                                                    "</soap:Envelope>\n",mothedName,mothedName]
#define WEBSERVICE_BODY_MUTABLE(mothedName,string) [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n""<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">\n" "<soap:Body>\n" "<%@ xmlns=\"http://tempuri.org/\">\n" "%@" "<webServiceID>86F877F827E4417dA34F9CA53389C4B8</webServiceID>\n" "<webServicePwd>C33BA857E3674328BCA8C8CEF7F45D1A</webServicePwd>\n" "</%@>\n"                                                               "</soap:Body>\n"                                                                    "</soap:Envelope>\n",mothedName,string,mothedName]

#define APP_DELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]


#define imagePath(name,type) ((UIImage *)[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]])
