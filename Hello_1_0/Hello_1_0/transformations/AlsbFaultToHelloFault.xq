(:: pragma bea:global-element-parameter parameter="$fault1" element="ns1:fault" location="../../CommonResources/schemas/alsbfault.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../schemas/commonsoapfault.xsd" ::)

declare namespace xf = "http://soa.o2.co.uk/Hello_1_0/transformations/AlsbFaultToHelloFault/";
declare namespace ns0 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns1 = "http://www.bea.com/wli/sb/context";
declare namespace ns3 = "http://soa.o2.co.uk/hellodata_1";
declare namespace ns2 = "http://soa.o2.co.uk/coredata_1";

declare function xf:AlsbFaultToHelloFault($transactionId as xs:string,$fault1 as element(ns1:fault),$operationName as xs:string)
    as element(ns0:Fault) {
        <ns0:Fault>
            <faultcode xmlns:env="http://schemas.xmlsoap.org/soap/envelope">env:Server</faultcode>
            <faultstring>{ data($fault1/ns1:reason) }</faultstring>
            <detail>
            {
             if($operationName = "testFault") then
                <ns3:testFaultFault>
                    <ns2:SOAFaultOriginator>{ data($fault1/ns1:location/ns1:stage) }</ns2:SOAFaultOriginator>
                    <ns2:SOAFaultCode>{ data($fault1/ns1:errorCode) }</ns2:SOAFaultCode>
                    <ns2:faultDescription>{ data($fault1/ns1:reason) }</ns2:faultDescription>
                    <ns2:SOATransactionID>{ $transactionId }</ns2:SOATransactionID>
                </ns3:testFaultFault>
                else  if($operationName = "testHello") then
                <ns3:testHelloFault>
                    <ns2:SOAFaultOriginator>{ data($fault1/ns1:location/ns1:stage) }</ns2:SOAFaultOriginator>
                    <ns2:SOAFaultCode>{ data($fault1/ns1:errorCode) }</ns2:SOAFaultCode>
                    <ns2:faultDescription>{ data($fault1/ns1:reason) }</ns2:faultDescription>
                    <ns2:SOATransactionID>{ $transactionId }</ns2:SOATransactionID>
                </ns3:testHelloFault>
                else ""
                }
            </detail>
        </ns0:Fault>
};

declare variable $transactionId as xs:string external;
declare variable $fault1 as element(ns1:fault) external;
declare variable $operationName as xs:string external;

xf:AlsbFaultToHelloFault($transactionId,
    $fault1,$operationName)