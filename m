Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989739;
	b=BZJU+6qaA2McMYYihnghzsgo3Z6w00vfZoV7PCBXIEdl98V/MXBUT3rpRspWRk9L2pin
	 PWo+S7GEce80bz6/aZj+5bxjKWxvoOb/Rk3KK0KIO/+YBu8Mp63MW5UHtIkfK5EaCHetQ
	 erHPBDc+UHRKqTeMpq9M1HcQCCWKI5JogHOowHllMZrEaHDxSBp/18Co6u1XADwkAlSBS
	 asdhrRou0FcDn1aHXrH7dtClnzJLMfJ+GP5zeNW94m7S/IBQKnp+V4FYh6WMmMjjUpLdF
	 0Z/+ZBYgRfaYmNYK2T501JbEKMLk2bzLSWJrMoF5lg1fMFlWzQKpEaQFlx/af/oND+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=DaRkFhapzU/LXSW7NOTbR6QDbxWuM6INUDlfpcVh+EMR3zwFU/xw8tBXks/3uY3plpwX
	 6E5bW6pxZrpyCiV3fYzZg4S/QXXeTsVRD+gO1gQRN9tD6wxhjcJomIV6Xtao0OyoIxZmD
	 VvQy+QNfg8HTwvt3kZPrKfSM1ZIkn5jDL4NLauWhgKf1GXFCEX1Ivb3Ks7GH1VAlyLMQm
	 OwmfkrvQ0tC+RBqyW0fejm7UNXXGT36BclWcliZ0/uXP6i5G65NlGB4vtB4heTDw7OLTg
	 LpYpqzvIYxXNaSKopUxdbF84Y0CHlweaTI/HCWWPfyh86vrpkEhxlmR2e0HuteZ5ZwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Af3QGIlu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073E606A31C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7073E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Af3QGIlu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtPa3371421
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Hsav1JFm+eHuNh9f
	ltj6VIwk0l+z5kUBBl1BWoPUOHlFmLfmwQyiu+IjbCvP3mS8nLsSfApZOi96G2tz
	uXfGsZZxV3ZSS6R8/WRHgGZfRG7g7EodUaFkvRzfLnqY8XpuYgvCXZfUHjUIGuij
	eCCvsrmbjydv1hOStFf86yWFhIlVS3hPgYvoZVilK2Ushp5b0HJJdUPIN0TopjGN
	3a8dFQyS1LXWdSHe7nmEgW2dd9ofSMRVQjeqjRh2H1oz+u3LpMxsdxiBORvNXFyz
	KMaH76bOnpyvZQJxFJqUg78UOBUoOFBia8/CKzqnxohESC3krJAR5cyIecHsrhqH
	aE762w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so621107a12.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989737; x=1795594537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=Af3QGIlua+A2fDb1kqdVaE3O+BlGCk0liwrxjopy9+6NLBPn4yq+xb1yYJ2IXmI/5W
         YRXaZ3eZrhULApOUXJTjSKpMWMFfeRiOICoT/4FLllHz+h26jgeYthv7wwgZY4Udt7Ww
         O8tboowuNDwQPwmjo5wddY3NdCPKRqjADb5KbrwkyBvPPsF/Fc0Ap0LC8UkH/6wxabYe
         3btD5Xq8+XddVJEvV75j+41ZPvS4trXuOCIwWTyWIccOOI1P2J69Ip0e+ptwHaeSAgaR
         bvgL58lxR9sGO3ppCqmmR1YQGERbxTouliK+CupIsUW4hWaNqLVaCSfrljQ/8ZzbdNtV
         lUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989737; x=1795594537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=inXo1PzLEuZGvzJZChEfyS95EovgLhbntqgEZasXleenMsXrORbEaNsby2+QZlSAwY
         9NEvSnQkkmDhusnL/mafroFOGU5hvHeqf9XSwGMUKclTxYUQGi/fkU4QjWmCfnEqcsSU
         G+lsqnhJlyQqOL2yF/e6v5xg2Hw4A+CqGbBQKSxXx8He8cXyrmAODAc5zlE+t+cHQGVv
         8DCL2ByB1UBimk7F72P1HmVa1lwFuh9hFWb0pZrZzX/Hhe+YEUE+kJd205XLd1l+2r/5
         xuPbLIMrKuqV2mbFmsjLLDBzxAtd9uyihialUNcz6BhfKQDZqWF+ci1sg9Acatvt7pmY
         kFaA==
X-Forwarded-Encrypted: i=1; AL+hErHBiurSh8yfDQVH2erhNMKkU8Tme82qAZX4qFsuo5zAMCh+Fja0+MW1YDSH0+fvBVQQRn9F@lists.linux.dev
X-Gm-Message-State: APuU4Z89hgs09kEc/pBpQfJ+VzbNdTdYyg96vCIUrqOX6SnvwSacJUEV
	YkMnXlBq6+F9J/WQgdAqeN/cuLLrhUGwFkTEdReog7dIALlaVm0axEGstOpEBCPT4ZCbe9Dud50
	izxFi2atNfT/jcwAMEiP7dpmoPjySAVHIglx6M4s/rEeFv+ukY5UYx+o2
X-Gm-Gg: AZFdTZfJkxMq/9URtjXyu5TgOt3ZfNx7MuWDhMi8V0EVbgPQ88CGlmGjF7AxBTeVQez
	lTPeHKPsnb9XxjVb4ri0r+7oS3djnuhDRXieyxQZgyi77/rOe1ASEA6luyNsVk1cGOsAJ6Aisne
	1iwRXler0J8/s2TfXh9MiPhgctrSS1ugFnX8kmgdca9fs0cPNPlawrYim8u0IgZzEfbx4wLkldt
	9QyTsDgKrdUAfJCwPr9VLuFJWFVRLWBKAJDWQzAsxJHcykbFp/ogpIkfWbWLm47R6sx4Dw5MEMX
	M6soXD3JkubOeqW8p7RdQdOWKp+mM3/bEyUpXxDMsBKlbAFnmWCj9qCAqhEwpuewwXss82sYuc1
	PaAZrOUztsJZQqh9RF+khRRxRa9ZfJ1OChQ+7JW6vnvEedCjNVV4czXzym+VjVmD1EFai1cX13K
	iRxRVNb91IWGTmpKRKztkWGIl2DjCZ4s8jCavhGhbqUYFL4qxvlcyMFPOGWrg4UmJoMA6ws8I/7
	w==
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995817a91.10.1794989736671;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995795a91.10.1794989736199;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:35 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:24 +0530
Subject: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ea9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: C06yMxN8PrYiweZfcZH3lgdppI29OXk1
X-Proofpoint-ORIG-GUID: C06yMxN8PrYiweZfcZH3lgdppI29OXk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX47ziKi077OGt
 APWbiE7zq9tzqt6dCWNfUBwQ/Wa5aQMJ8paor5QNFbEJWURtcgBVb5WSl7Fvwl4gjI9hrelJf40
 lzyNyhHQZf+YrWsNjtEsqFNCbbh/tAeNZduYI0j87hlOhD9JG/g6MyEI0BZ9MC5I+DF6xVig76s
 m2yPlFf+ZaPsPllrNi+1SKbG7BFpSowYfHwCgBDb4hVgLLFBEHEIykhQPSqsuUmQECOR+PNf2IL
 W1LKq2jenoAJQuNxx87jld6LEVML8u4552FtWwBXilz7rM0W7FB/fM5ufWgv1/1d1mLBYdmFexn
 kHr8eD+soxuJ2QsCAKcJ67JDehLpe1LTTvr/Wl/JJJnjuAbwIS1dVmqRm4yWFDwA21sqq18iNFS
 KvPcQZeKoI5ke1fS/IlTPbfbAqyttjt62Vf9EPlYUe/OmUZoTMOc7xO8ON/qkjwFcikGCK6v0pm
 xRFKHajsr5cjMVZneXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6Bg1QKhxUdeI
 KrIt7k/jqPGh7LqI4AJef/UnGLg4L1QsDD0jzxEPM7CrzSPyGMVKmVrQg1HWNijS+qZ9IrNGHZn
 Qm2K0P0AAdy6/WKsUSpd/ItgXynSF+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

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

