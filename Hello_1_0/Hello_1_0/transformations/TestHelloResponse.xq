(:: pragma bea:global-element-parameter parameter="$testHelloResponse1" element="ns0:testHelloResponse" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$testHello1" element="ns0:testHello" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:testHelloResponse" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Hello_1_0/transformations/TestHelloResponse/";
declare namespace ns0 = "http://soa.o2.co.uk/hellodata_1";

declare function xf:TestHelloResponse($testHelloResponse1 as element(ns0:testHelloResponse),
    $testHello1 as element(ns0:testHello),$message as xs:string)
    as element(ns0:testHelloResponse) {
        <ns0:testHelloResponse>
            <ns0:message>{data($message)}{ data($testHello1/ns0:name) }</ns0:message>
            
        </ns0:testHelloResponse>
};

declare variable $testHelloResponse1 as element(ns0:testHelloResponse) external;
declare variable $testHello1 as element(ns0:testHello) external;
declare variable $message as xs:string external;

xf:TestHelloResponse($testHelloResponse1,
    $testHello1, $message)