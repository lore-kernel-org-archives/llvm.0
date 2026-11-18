Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989812;
	b=X3E0xtzkrzsO8AMZrSdPF14ZSk6tXRe24r4yg+uSayxcqpZm0UBVeorQHm4i24MqIJBU
	 5NOhUWxb8y2+T6M7HiNpWIC3Ez/pHv39fLRROTIdT8O5z0qU/l3sA4b8wZ9C5KcfU+cXV
	 dUYHxBfk5bKNLBqT69SEjaUNVKuNIHz7kMdTVFRUqgatrn9e+tDVGU/V8WjVyHGuI1W/Y
	 kncArBnW5LdPx0U5qJL8T1pWoftIBADlaMSUBKF2/kWoUK2N0zUVlAhPx2PHLC4SlIySC
	 BljdoTvZhJC32nlKQapMwDjdQEZPpAzZpDWuLG6JCz9WMfSV71LVhjF22nTdybjQdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
	b=EfYPShr6gtZ8zk1u9Vrm6mHjpCWCZNKu0Fq6kCQe+6hot6SJ9EWbVBXSoPDmU3vfqm9U
	 EZ/+1+wIhM9TayX4MFpj0YNVHXtpweTS8hpirFwSLp415W+CJYbAzDYOE1NzzggaZd6iB
	 dyjSNTIy56WuO1ncEeVdkx4HTzAi786vbKM+xiJCDiWE7gVGzKGS1iExtR5n0BjkkgtJh
	 14vO7nHAeK5Qwt1SfC0Aj9ZQ3IAQTRaHedgYdv2xNxeNSv6NS1rxuE3/Z9hpK+OVU53kl
	 A+yOeUkb+ylyanLVt5q4GYoI4G1U8ZkhpXYP+JhVevXFZJC8hQ05J52UJ5e6wxbEVfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JBY7sesU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M739RaGr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1959A606A8A8
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1959A606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JBY7sesU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M739RaGr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VDZZ2106647
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=JBY7sesUIbidjWgg
	Ql2d8Y5ASHRZJZr+/adbwbzV2GZw3O2aIA5JRAOTxCBih4H91kNosboaDGHMi//v
	ZdvXfKIuPakMoM35vaFbOPg0ksdZRS3S0pwCQSAi/RBlDWBo5gGxD/wlrVOPPPXJ
	bFkCNBq+tPb1O8jFISU6u/Eaa5hd7bwpYuNGSooNwumbC4h0sSuNasohNhmlKhan
	Fa3bKvaQhrsbiumXSvHq8FL8Iov+9Wy82ZphJzDZwUIsYKkaAZpmkfYdpEwxTJJ/
	BO7ozYNZbUuIs2NcX+wkKDzvFQQIt7bWyHLG69OOT+1chXXuUQgH7A57mU6O+UpE
	GYn0JA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sxrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so568885a12.3
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989810; x=1795594610; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=M739RaGrDK4Mk1TKFNuG7onFcZW/OJe57tR4YBvY4JW7NeF+wef1Qo23chICuCHYdd
         hV9HusdqIMMuNzEXfJiFs/boXBBQtXxj8a6GuoN1LiOCDyb7fSbqtkDaTFb1hT2cG4gY
         x0+E0iS1LSL2G8obCK/gvOIjyvhJvoDHdNOwn0FDtvABBWIDuuwW4y4BVpUzWKO9hvig
         8Z6CDUDGZFw0/+aNid0a7/gxTg13I8F9kPYq6QH0lTLFe2n7dtWU8gzknwmySjpXMWWT
         ISzEYVCGt6aLtVceRXDsM0vV3HQsKN3GgPRtfPC11BE3Gh3yQkhGua+muWGbeV4ZgrzT
         Ippw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989810; x=1795594610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=EauegCPn3rDOz/7R16+gDAGg36A2AMuUZR3BCBoIdV8EJ8WL50BxUanstNixNt+bDG
         46obRAeRzJZbgyEsim8bij0fzy2+IAGBfLOlBHxwqVfTa5H2Xd9m06vKGc3W3N8AzPjY
         M+lIR6OpPCCtc3Piumth018cybk0f2iQ9TSKwnC+eSVK6XT79uLupbr4wcCiuMKNf4nX
         EMBxqzDGQR2/JbV7oOi80b4CKDZ8tV6n7EX1uq3rXgxk8tuwb09o4JrYL8BDXkdOVprb
         W/8lJ65Vz7kmgdGlCW7ODgVnbeCTETxLeAZCXTxfpU5bdsCRxXUZBvCdpWZd41FnD0E0
         1GHw==
X-Forwarded-Encrypted: i=1; AL+hErHyONLQOqGErYKp1//ULxO7fFA674BvVIYhfCIZiqTzZZbAXPRKJn/uQVc3lNKbk/jGs5h7@lists.linux.dev
X-Gm-Message-State: APuU4Z/F/uIf2tAXaQHIuW5YTdDIx/wNXsZUIHV7KSD38UDH1rkuOwRb
	c8cb55tD/6HH2u12D2ljjxEIR1MbJjSP/4N/1BuuZywobaRCf7xJujMKTp1DSpoHHAWjQd+jYFV
	9aXlpeSQrYmpIDSLhlw0B5DaPkG+GWQcB+YOV9ZQXo5Vn6Y2x+R7c6/hB
X-Gm-Gg: AZFdTZdv1tHR3VQq50uwVn6iZLk1hW9isJdb2uurHOp1Nsm5jMtYpskfYBb/bd9GncQ
	doDEv61Qq253UdhMmpvo8xU1WXzmprcVYRLaQetzYdhzhindYrY6TwNlP4yEgn6ABf97xc+EpV9
	z7279xwRN/c4iMR7wLBJAgZY4lqCLunhUIcb/+Li3JOfdHFWAp2mw6oOxlpGSNQKAW9D2MlHnoZ
	9w+Jis7Gx/SJ6EQkTNOQd+r+D5CkOosTSEM4R0lAoPxhUUJ8C1P5nwJDVzzrHUjX7LcFp5SwUo1
	HTk2C3Y6OKtvaLVFPsnkYbyUB/7c8qPZz7xeWaaojEVD/12feaAe3qiSUmlUYf96JKW4rwl0oEv
	Zx0TDtyOKX8RMLNbZjsSN0/WF+OEY1yEHEqf/3ilW8ffA5TowhRp4xklhxuKc1AtZB0kzl2dBFJ
	6YjsgWBGAjd40dlHLo0KvcS9pBJ5e8sxaWLLktz1TLmSk3Feq3jP8ntSpm9Ibrc+yiPUfR+NZ2g
	g==
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583869a91.10.1794989809581;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1583842a91.10.1794989809062;
        Wed, 18 Nov 2026 00:16:49 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:38 +0530
Subject: [PATCH ath-next v3 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-15-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -Fa3i7-01OMKtljTS6uRVgeYRfatIDw9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0GYj92WDFYKi
 ZiTUN3EtDdxU0SgMVkMa3y7F/wpv9+ebkhBzam1khcZF9740HRDzjQfpjv3ZUnvt4J9+3dvuG/v
 uV0tFH12eXTdtWS0N3wyzhCHo5hA5Fw=
X-Proofpoint-GUID: -Fa3i7-01OMKtljTS6uRVgeYRfatIDw9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXxSNNUYD0Log0
 Ec/RS2WIA12W35/0N5il+qOX5M6XVoq+v+cSGWp/PXYdJ1gxYEqnZLqcV0V20HdVr/YGrrHVfZK
 twm9aqoXJsUM+gzPdzrxIbcEgrds5RT4jnLqVajBvoV9eQMJAmWhywxOZVMPKAWIBSTxkVK0ddH
 FNJ+e9SrtNd0N8KywIDhfEDghzPahiDyZx6kDtcN+FMFCJ2BwQ6O3jy7SBm+CV/v/DLT28pEEJ+
 Jxpqm526RVRoXbCOpnu0mBQ+ALvgz02REHXOeiMG+J4chivUrFtdANvw/hgklIqTO1BlomEdzx6
 UDW2c/wi0UazDMQkYbarkFzgi77Xwl5295Czk+Kixxat9Nbgwv4s7O77KtiFY7PuJd9l+qMj7rT
 5H2QZRuybXX9rf48/foOeCr1Dt/DT6wups9pNTjN92zc+yUluQiFM47ciYwpxqWjkDHVkZGwy7M
 JdrsAE+W7OGck1z1IOA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5ef2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Add QCN9575 PCI window register constants (WINDOW_VALUE_MASK [25:19],
WINDOW_STATIC_MASK [31:7], CE_WINDOW_MASK [13:7], UMAC_WINDOW_MASK
[20:14]) and a Wi-Fi 8 reg_base instance (ath12k_wifi8_reg_base) for
per-device window selection. Implement ath12k_wifi8_pci_probe() to
configure QCN9575-specific PCI settings: MSI vector layout (3 MHI, 5 CE,
8 DP vectors), static window mapping, window register address (0x3278),
and hardware revision. Call ath12k_wifi8_hw_init() at the end of probe
to complete hardware initialization. Define the Wi-Fi 8 PCI driver
struct with the probe callback, and register it with
ath12k_pci_register_driver() in ath12k_wifi8_pci_init().

This series only adds Wi-Fi 8 platform scaffolding; QCN9575's CP, DP,
and MAC datapath support will be posted as a follow-up series.
QCN9575_DEVICE_ID is intentionally left out of
ath12k_wifi8_pci_id_table for now, so no physical device can match and
probe until that follow-up series lands. The id_table entry will be
added in the final patch of that series, once QCN9575 is actually
functional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h |  2 -
 drivers/net/wireless/ath/ath12k/wifi8/hal.h |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c | 89 ++++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9e88bdf4a93b..b30a8039b2ec 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -11,6 +11,8 @@
 
 struct ath12k_base;
 
+#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
+
 #define HAL_DESC_REO_NON_QOS_TID	16
 
 #define HAL_INVALID_PEERID	0x3fff
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.h b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
index 19e02bb16ff2..fe880b0befcb 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.h
@@ -31,8 +31,6 @@
 	((hal)->regs->umac_ce1_dest_reg_base)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
-#define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
-
 #define HAL_TCL_SW_CONFIG_BANK_ADDR		0x00a4408c
 
 /* SW2TCL(x) R0 ring configuration address */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
index c99521abdcb3..89fa9a7f3fd9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -11,6 +11,7 @@
 #include "hal_desc.h"
 
 /* WCSS Relative address */
+#define HAL_SEQ_WCSS_UMAC_OFFSET		0xf00000
 #define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
 	((hal)->regs->umac_ce0_src_reg_base)
 #define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
index 3975081d167b..fd0489f8333f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -5,14 +5,101 @@
 
 #include <linux/pci.h>
 
+#include "../core.h"
+#include "../hal.h"
+#include "../hif.h"
+#include "../mhi.h"
+#include "../pci.h"
+#include "hal.h"
+#include "hw.h"
+#include "mhi.h"
 #include "pci.h"
 
+#define QCN9575_DEVICE_ID		0x1113
+#define WINDOW_REG_ADDRESS		0x3278
+
+#define WINDOW_VALUE_MASK		GENMASK(25, 19)
+#define WINDOW_STATIC_MASK		GENMASK(31, 7)
+#define CE_WINDOW_MASK			GENMASK(13, 7)
+#define UMAC_WINDOW_MASK		GENMASK(20, 14)
+
+static const struct pci_device_id ath12k_wifi8_pci_id_table[] = {
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, ath12k_wifi8_pci_id_table);
+
+static const struct ath12k_pci_ops ath12k_wifi8_pci_ops_qcn9575 = {
+	.wakeup = NULL,
+	.release = NULL,
+};
+
+static int ath12k_wifi8_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pci_dev)
+{
+	struct ath12k_pci *ab_pci;
+	struct ath12k_base *ab;
+	int ret;
+
+	ab = pci_get_drvdata(pdev);
+	ab_pci = ath12k_pci_priv(ab);
+
+	switch (pci_dev->device) {
+	case QCN9575_DEVICE_ID:
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->static_window_map = true;
+		ab_pci->pci_ops = &ath12k_wifi8_pci_ops_qcn9575;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
+		ab->hw_rev = ATH12K_HW_QCN9575_HW20;
+		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
+		break;
+
+	default:
+		dev_err(&pdev->dev, "Unknown Wi-Fi 8 PCI device found: 0x%x\n",
+			pci_dev->device);
+		return -EOPNOTSUPP;
+	}
+
+	ret = ath12k_wifi8_hw_init(ab);
+	if (ret) {
+		dev_err(&pdev->dev, "Wi-Fi 8 hw_init failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct ath12k_pci_reg_base ath12k_wifi8_reg_base = {
+	.umac_base = HAL_SEQ_WCSS_UMAC_OFFSET,
+	.ce_reg_base = HAL_CE_WFSS_CE_REG_BASE,
+	.window_value_mask = WINDOW_VALUE_MASK,
+	.window_static_mask = WINDOW_STATIC_MASK,
+	.ce_window_mask = CE_WINDOW_MASK,
+	.umac_window_mask = UMAC_WINDOW_MASK,
+};
+
+static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
+	.name = "ath12k_wifi8_pci",
+	.id_table = ath12k_wifi8_pci_id_table,
+	.ops.probe = ath12k_wifi8_pci_probe,
+	.reg_base = &ath12k_wifi8_reg_base,
+};
+
 int ath12k_wifi8_pci_init(void)
 {
-	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	int ret;
+
+	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
+					 &ath12k_wifi8_pci_driver);
+	if (ret) {
+		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 void ath12k_wifi8_pci_exit(void)
 {
+	ath12k_pci_unregister_driver(ATH12K_DEVICE_FAMILY_WIFI8);
 }

-- 
2.34.1

