Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC1101E7
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 09:05:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3945skwR010880;
	Wed, 4 Oct 2023 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=pl0XitQlQbuU4A8mQQ0bS01oCfOmc+xlq+Q+YQKCFCA=;
 b=XBSQE0PFhGFOuV9j1IEBuR9oPwtgyq8fGuGceBaur4UgzIhoZrPgYtHmP3DZCIdqTbZ4
 JFXZjUrCvuO6cu6M/G7rfMylklDTuhJKCIOE0g0uYz4JllGyWPDZtZG0QyHxMnoys8dI
 JY165VbyJ/yi4iMXXL+AXyrpfu5+G8XD4Er0693Bz3/zc7Y2nxh5EqDvb275nZKc9qLD
 JhQTkYkfYMtFejTXjkXHNTKevgGlusfD9BJ7ww0MSqH496g8glmaa0mj5loYCPDe1WIx
 LTrjQTsanC9wnh4vGQ8f4ngvnjr8Uz1jXnMGBjIjxxpxsLtCJDNmA+w/ck/c+1FP/YPC FQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgxrjrrdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 09:05:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39495Qft022348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 09:05:26 GMT
Received: from hu-devipriy-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 4 Oct 2023 02:05:20 -0700
From: Devi Priya <quic_devipriy@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <ndesaulniers@google.com>,
        <trix@redhat.com>, <baruch@tkos.co.il>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH V13 3/4] dt-bindings: mfd: qcom,tcsr: Add simple-mfd support for IPQ6018
Date: Wed, 4 Oct 2023 14:34:48 +0530
Message-ID: <20231004090449.256229-4-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004090449.256229-1-quic_devipriy@quicinc.com>
References: <20231004090449.256229-1-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u8xJiPeF6VzvtIaXNlmr20g6uXStt41g
X-Proofpoint-ORIG-GUID: u8xJiPeF6VzvtIaXNlmr20g6uXStt41g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310040064

Update the binding to include pwm as the child node to TCSR block and
add simple-mfd support for IPQ6018.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
---
V13:

 Added simple-mfd support for IPQ6018 based devices

 Added support to include pwm as the child node to TCSR

 Included syscon node found on IPQ6018 to the examples

 .../devicetree/bindings/mfd/qcom,tcsr.yaml    | 100 ++++++++++++------
 1 file changed, 69 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 33c3d023a106..14267a493b15 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -15,41 +15,58 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,msm8976-tcsr
-          - qcom,msm8998-tcsr
-          - qcom,qcs404-tcsr
-          - qcom,sc7180-tcsr
-          - qcom,sc7280-tcsr
-          - qcom,sc8280xp-tcsr
-          - qcom,sdm630-tcsr
-          - qcom,sdm845-tcsr
-          - qcom,sdx55-tcsr
-          - qcom,sdx65-tcsr
-          - qcom,sm4450-tcsr
-          - qcom,sm8150-tcsr
-          - qcom,sm8450-tcsr
-          - qcom,tcsr-apq8064
-          - qcom,tcsr-apq8084
-          - qcom,tcsr-ipq5332
-          - qcom,tcsr-ipq6018
-          - qcom,tcsr-ipq8064
-          - qcom,tcsr-ipq8074
-          - qcom,tcsr-ipq9574
-          - qcom,tcsr-mdm9615
-          - qcom,tcsr-msm8226
-          - qcom,tcsr-msm8660
-          - qcom,tcsr-msm8916
-          - qcom,tcsr-msm8953
-          - qcom,tcsr-msm8960
-          - qcom,tcsr-msm8974
-          - qcom,tcsr-msm8996
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,msm8976-tcsr
+              - qcom,msm8998-tcsr
+              - qcom,qcs404-tcsr
+              - qcom,sc7180-tcsr
+              - qcom,sc7280-tcsr
+              - qcom,sc8280xp-tcsr
+              - qcom,sdm630-tcsr
+              - qcom,sdm845-tcsr
+              - qcom,sdx55-tcsr
+              - qcom,sdx65-tcsr
+              - qcom,sm4450-tcsr
+              - qcom,sm8150-tcsr
+              - qcom,sm8450-tcsr
+              - qcom,tcsr-apq8064
+              - qcom,tcsr-apq8084
+              - qcom,tcsr-ipq5332
+              - qcom,tcsr-ipq6018
+              - qcom,tcsr-ipq8064
+              - qcom,tcsr-ipq8074
+              - qcom,tcsr-ipq9574
+              - qcom,tcsr-mdm9615
+              - qcom,tcsr-msm8226
+              - qcom,tcsr-msm8660
+              - qcom,tcsr-msm8916
+              - qcom,tcsr-msm8953
+              - qcom,tcsr-msm8960
+              - qcom,tcsr-msm8974
+              - qcom,tcsr-msm8996
+          - const: syscon
+      - items:
+          - const: qcom,tcsr-ipq6018
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
 
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "pwm@[a-f0-9]+$":
+    $ref: ../pwm/qcom,ipq6018-pwm.yaml
+
 required:
   - compatible
   - reg
@@ -57,8 +74,29 @@ required:
 additionalProperties: false
 
 examples:
+  # Example 1 - Syscon node found on MSM8960
   - |
     syscon@1a400000 {
         compatible = "qcom,tcsr-msm8960", "syscon";
         reg = <0x1a400000 0x100>;
     };
+  # Example 2 - Syscon node found on IPQ6018
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+
+    syscon@1937000 {
+        compatible = "qcom,tcsr-ipq6018", "syscon", "simple-mfd";
+        reg = <0x01937000 0x21000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x1937000 0x21000>;
+
+        pwm: pwm@a010 {
+            compatible = "qcom,ipq6018-pwm";
+            reg = <0xa010 0x20>;
+            clocks = <&gcc GCC_ADSS_PWM_CLK>;
+            assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+            assigned-clock-rates = <100000000>;
+            #pwm-cells = <2>;
+        };
+    };
-- 
2.34.1

