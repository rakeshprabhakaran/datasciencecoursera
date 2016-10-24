(:: pragma bea:global-element-parameter parameter="$testFault1" element="ns2:testFault" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../schemas/commonsoapfault.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Hello/transformation/TestFaultFaultResponse/";
declare namespace ns0 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns1 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://soa.o2.co.uk/hellodata_1";

declare function xf:TestFaultFaultResponse($testFault1 as element(ns2:testFault),
    $transId as xs:string,$configData as element(*) )
    as element(ns0:Fault) {
        <ns0:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{data($configData/faultDescription)}</faultstring>
            <detail>
                <ns2:testFaultFault>
                    <ns1:SOAFaultOriginator>{ data($testFault1/ns2:name) }</ns1:SOAFaultOriginator>
           			<ns1:SOAFaultCode>{data($configData/faultcode)}</ns1:SOAFaultCode>
					<ns1:faultDescription>{data($configData/faultDescription)}</ns1:faultDescription>
                    <ns1:SOATransactionID>{ $transId }</ns1:SOATransactionID>
                </ns2:testFaultFault>
            </detail>
        </ns0:Fault>
};

declare variable $testFault1 as element(ns2:testFault) external;
declare variable $transId as xs:string external;
declare variable $configData as element(*) external;

xf:TestFaultFaultResponse($testFault1,
    $transId,$configData)