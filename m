Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472351;
	b=OWU2C99iHdWPMhetsUy4mvnCSxB5f7WRmSzZmW2pzqgC2bIdxDnM/hm0vHfxNYwzh2cM
	 DN7fP3gpmb+qrKl0gKKCR2Dy3FOY8bX5ccd1uh+Ik2C7ObFDFEHch0QcAOspS7Ms75PtU
	 4VEol7fOz/ZRSLav0cn2mdGHMO5ycO1f+CHLCxIltII0+f4OKllNqDYSwOeeHBBaMNex/
	 +LDTsINoVE+3buVJXCKLA4gQHdqSBIR9WMgtNgk4Yj4rdBH6fBuhyp2/0kLf9Eezt25lE
	 cXhkCU20RCeNLVYxOomJJEI4oYh8qr4ndJWnF3ukk9xiCESUF2E+Ml69XgjLLgI2h1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=QbpzWG7/IGlG7koMFoSTawbgKElwazWSGc8jQlxZji9mysQSYVtacsYEEjJ/YOsGyakr
	 MMEEPZhj4/wiE9TmaWqcZNj1nonFNs6xSDKFvKIwdGJl0fixlN+j7LOzbdt/zh+vBIpi1
	 kDRdG2/wqOevGGia1kawQm+ZLD38taeYInukSoVuBQxpDUbN5yWHased9oQ3m8mU0zBUs
	 nfUmvlPuumvJIk3B9iD9xCAsckvnc/D/yTDof5+yLNEdlZ92tvDcxqATd7oSRAl1ecJiS
	 pPL4xUB8Mu520s8DiqPYhRanEX0IqLFwaxYbdaPnkxRpMZtVlfo0fJAPjGZzkl4TRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTOBKeuF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD960A261B
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BD960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9Iftrr8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTOBKeuF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j8Ug126726
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=k9Iftrr8S/3KqYgm
	wmIq9ZLs3f7XOGvc5UgbHulW5ZWkPDV0byyDU+/QSnmBiJKElbdbJqVARzC4zcB3
	HOk/+fVqf4wMB0N5UpLlrbtojhgI1FveXZLeH5YucY/ZyzdzRK709zxm7JnsgTdY
	c9baOQMfRVkFPyfBFWQp3+HO6/4afvBjifCckxY1InLPiet421krTutcCvtVy7ms
	OQrtK8PRrDbjZn46oH+4cT6mHlmr2/5QMRhFcPxXKlXLFOgnm2uozC4aMGyrfQwy
	VlNR+u1F8rsg4Mr7nA4hVXYkQPM/CiH0KfzMFWZ+2KE2jo5iesPrpSb8w53NFaW9
	Qp+9iA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a086b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3781485a91.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472349; x=1795077149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=kTOBKeuFVBpF26jaaBRRMCLp1JpiGoSDwhQ8WScbGz2s/mRS+CzIfh2IPpruordU04
         XiFD2OhPd7O/oUKiAiZIuErB6jFOrcvdsnwF5PZul1YU1/4nw67HDhei3H/vxpvDf3gX
         +sfQ45pXw3IX/keihGQ4k4uBXUxLA8uL241aMyjvFL/zakyKTblLQsg0xsZmV2hXgh73
         ZKrcJ0xOVxZaDhZ3NmrN/Zzg/cyLNKp2+I0XuF2o2f1gGyyhr6XDuKGis6m7VLbNu9vS
         g0wy44VJje/B3zhEt07ok87siD0oIuefYGBVdg4qiLUPAFYK/mn9ft/MjyKMgP4M1Izb
         O2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472349; x=1795077149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=LO0x/q3cjbpt8+wFudVREgo4xdr+Zc6kJFa3wnQEN7KDxArR03jMyhCAXH8hbHU8oA
         HKKX65STqOJQCUKNe5QVgh2jXsR387rO3n1OrGuBcHSSEwbGHsHTzSEKSVGWb8GScWSY
         xr19Rq5GW/2ggjuBIhCsZQNrsdYSQWh7Wy11ma5xDKlh2XVGVm34vdlZseIdxg2nnIlV
         sBqyAK8vjavGOXZHaTUzdvGmW/D9/XJm9fvJX/2+LJAC6kmP0NgACtD1BoXQRkV2Naik
         QoC5/fuhWOww8YHKaeeWAXFMnXSlfjQ4qshOumeMhSZbIImtH9QD573pQS7eGXtKwFpv
         pIkw==
X-Forwarded-Encrypted: i=1; AL+hErE+APNKgMUaex41smeEjQfxn9HOZvHy/dla5tajMtSbC0u3pKgGYieJlJtHBzoEt6PNR8BZ@lists.linux.dev
X-Gm-Message-State: APuU4Z9SuJMvIovLLbq0dcQK+Y0NxzCj7NBuv9jFfxQLk80OPiOge6ve
	1+xPwf75qYP+9YstXOUcg8xVDuPu5Iap5Ls7cYCbJsAXZ+BkpYGtq1Y8QBMXTBP8kjMK5mYK2Ei
	AV3Bgil1t/1lRHKsEiAQO+oX8519l4X+r6K2zp82ghO0y45I8MG6XXQ/Y
X-Gm-Gg: AYBFou0mjhtJW3xO2TG082/0Tmxt3q3g7gTMyquUY3V5w4LR+LbNt4LM1pZ6lEmy2Pt
	aJuE8JjZwxnH2O8aQ2ZZ0DoqJRQO/zZzquyDeY6Cojvvmt8uDtSpjbJ8hcfRNjYpQua5OlF/n0M
	vG7uqp/QkxfvgZYS1BEWf2bIGHGjDH0T7hiPq9f9icGoX7xMMH1cD9Ue/J5/NG8bQ7UbgpYx55m
	y1AF6uqDF5bNsDN7gzxgH9vCGHSRPtw0jZx7FSnLfGxMmoCKhy651Jtt4xUtIAJ6TCvOeBHfg7O
	7ItKji01yZu53J8loBDmeGTRb417phPVz2wQfnq2Q8pc5lFb0LN/OZYzoI4GnQ9nup/n454H/sU
	8YLCCn9tTmAIa13nNkKUHMpJgB+O9gFrtHNL2HrWMCvwUFLN6IpTvECBYT8Fc+WLXc55RFjiPba
	6uFxgkO7PxRcXjfWXAFvzUqSCsS3vD0QtjrPeVQOu2hmQmCihAkjQSS5K0lS3M95Yj/jq3dVTbH
	g==
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532443a91.65.1794472348609;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
X-Received: by 2002:a17:90b:17c8:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3b182f8ba81mr4532415a91.65.1794472348126;
        Thu, 12 Nov 2026 00:32:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:15 +0530
Subject: [PATCH ath-next 01/15] dt-bindings: net: wireless: add ath12k wifi
 device QCN9575
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-1-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Tac02VmRysg7561xDndbfc0LiXW0n8hV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz9kG9yefmmDN
 htxKuQs4MaMeEMu352cD0xLqSYf5hsxIdpR4/J3Sjw0zK1KTiiT00kBtZNLFc4LSg7g93tzl9Uf
 Bbsxm1QaIXkPlALCnyq2E1Ex/cbabVGpEvqmbzZgrMMTOLeb0CY5PszrK7AKsnsbRgvd9xAdGDG
 AXLNlxUk42dOu60IMnbhHvrrm5UBq4OXYo9eiXU2xhJ53oW6SyTuLBi29D1qQgCa1tPhZEfNgsD
 Icx1rNvy29cSTODbqsY0sABT+4w09+1WhLPaZKP+hlZTBNKIGjGEW5u4OgpAkV5iPjqW+Ph87xh
 pkL4KJA7plC+ny1LxSjIkrks+dynNSkTR879CMfBEPjSARDI0A5bzjaxK6L+7mn4bJKF1VkNGpi
 4EGpLK2hBaiXmI8iUUKkG8J1KCTFBGkwGg8c1gMYo4IdlEqmpZFaVqQbpOmZHKqV7EBIu3nLGLj
 6bKxcMFl3HI7r5UZE5Q==
X-Proofpoint-ORIG-GUID: Tac02VmRysg7561xDndbfc0LiXW0n8hV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzBgftEOzf1Em
 YScbpORAk4zWK3c50ioz9p9qVZztXRcMHw94b36jqkX59pvtJC8QA/XpOVA1Nin7oaN7mDPhvkz
 PDYgwUnCocMSQxPlRH7t7SYAnZ8HxzI=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5799d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

