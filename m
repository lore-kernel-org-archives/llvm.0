Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982779;
	b=a9xFdIBfpCOJ75zt/tpfJaeip05/KUkPKmsAuRlmIVnv2MTdXtSpsM7eqsItyXRpzBcd
	 X/TWi+ex7Gc0xiB0IP+TJzZzZMdN0BJGaD0DxTCcvWUZjKWhWeXIQjZGZBFGe5qjUcDYR
	 /OHCR2IFHEdGPPoVDnxcVVEJ8DMyOx7Fd1ai5XVIKfZV0eKaF7+O8PYUbO9ipG1fLB+ZG
	 HV6Tb5kIT6uTWG+UN1qBoWKB+w2UFMSWLeSRhKfHoAzEgMUDqfIDjqo7erpKoijQGeHUe
	 vWGTz2G4GNpWOI+ydo558o4/uHg2AAWIAHjBzO1sH/JsSTvst8Hjn/E5za9dp+Agvxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=d18Fzqq4RDJqHj8l40PoWz3NUdPrAEGhrihGBCtj1061r2jIkypc1QL5xvm7T6UcxZmW
	 5nWH1TX7QhBfwjqp4dS2YsSyGw1YkUMfsnV3T4kltsCf/B6jh/53bZpSMFckCbwFDo2ih
	 Ai2O7ml+yyOWAoc00iuDjb4KRLVGCTWERZKzBnn1QanpTJUnyXmYL45WQtfwWdXI4jlMY
	 7lx4ZllqWKGxwM7apGGnHE8zt8nY75GyQt6T44lM9BO55K94iz04I832MDULNvycH3pyd
	 rveRR9kyerA/1luqvJtiPggCXDz0bKglZVJoOFnPJoVGdZNQT8HwxPgOepTqjKmHd3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UKdBPY8/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M+oDED54;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAFE606A331
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UKdBPY8/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M+oDED54
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuX42383162
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UKdBPY8/WEkzKPHd
	VZXuIJDlXiO6GvbW/ddla52LU4seCudxBkX1qAFPQfpC/Smh5yDMrIfZM65rwTlq
	AyDvfaxkSfWoZjChhOEFr6unurC1lbk8Xc1Wic58kJIhQthAIgVEGzOV9XUdDoHO
	ejOdNStfYWcZIqgQr4p8SWADrh2DYU7PNGA+8O8rBZfXEoQjtX4tVhmGYL0B62f1
	UNHwipGJ4Y4qXzkPvfDfSpatwR8EM0gPNutzlxaqZEjo5Wu+5PAUZeNHfQT2eMuZ
	0+p+3Im8s3+pr1cOeipPYVFw2E5c6ShkHfSsxzDe+GZRh2ZXoPLWs1RGJXUlpkkN
	fV7dWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasjar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:19:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so465475a12.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982777; x=1795587577; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=M+oDED54QYrpRh6w/FoGs3cNzG0dqRkCpb+bN+eP8XWI1WwxHJPCziyIE34Alqp9Ks
         +tY3fb022KEb8M8YH536uF0cUtbrSdKBebNEniPKD0rTMrbcC57s2mnCzdv099H5bgW/
         8tiBUzrggZUav1XbRQeNXlixdAJvWvqOnuYbjY4WPbmNV8Ep1j7f/8hiwmsrI0cbMc/6
         juEjpV2WDw4t5EZoAO0Sfrc4eUt71hRFhzdKirsChRpPxhQpBEy5aQ1gIEDfdhSJUUZv
         WS8tazeGNDWPPD0trUyCYIpBQTDpoqV1o1FPbB4dtutWM0O7NAtx5xOUDiLNciW2aH3R
         CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982777; x=1795587577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=08n96QPp4CXRIEJhQwse0Mly4lg/HjmJXB5xirX0MWGjE75d2kq/FYwF9grKvc8jih
         i7JrRs9AC+Ke9LQ+nRyqOWS6DOI2CAeuRblTyrr1oafenBGto1j5GEv1BM/50CyWA1K+
         OFOu5eKgGVBGYBsQCOpTgefOoPCYvrUgKKIYtnmthqKU2ahwuHugLTfTz2CHGauLqeKZ
         ItfV0Dk9mdKUlUrUWQ208Vpxy32HFCLTVFQsYJjEpWRPLT4B1EyUEDT7ZYZaJ7xvtPfW
         VBYfK1JGs2UQkt1rIRXJhL1cyP7XIxQhixGpw+OGLU5JvNiHoQF0AS1om8rs27KJttMs
         CIhg==
X-Forwarded-Encrypted: i=1; AL+hErF8UE7QJ/188EPA6cpbvvZM0wRP2yGWUKbkFzmmM0Ns1v96xw/z+mScu/4GGFHV6g5sBuf5@lists.linux.dev
X-Gm-Message-State: APuU4Z93f/TJDBLIOAD8Ivm0Utu8arhp4hhQzeSjkg/4wb/yeKhEQYyW
	JeHgkfjgRJeLico6gDWTu3toC4x7jA3JQ//0uqqITzl4JQv94GgHowHVBcmGFjTD6ya+7cqHBVi
	ezNk3Vudg3gEoaKpmeDsuxGY2l3THET2ivytLhupq431hrSUr4OAJe6j7
X-Gm-Gg: AZFdTZdf85JEjc6ft12SaGuN1bliHiNNeyQ0XPoLEcctLDkJBwgN4Daii+4zTGrCOw0
	HWO7VIobrvEzBC0UmiFNb9NZkttzcBv0Y3DleN52WReNn7pjNqhbtdaqS6p1lWxLnYnBU/Io+Eo
	feXVV/atBwiFE+idXmG3v+FNGTDtSlQ8q+LK59x3DW3JnBOZOX3nrJcFSLoW46IbK0OPZWJI8GT
	Bpuh+CWD7Ly47n2NAr5JDiMmdXvLNGqG95GNelnfWlVWo0OkxtgyGXedwwFKKSE/8UTrh2MKYEY
	5KQR6dTY0qTLm9PXiANuCTt79LFHj8hN8yw5kouoFE9ozQ7nCVzO6XpI1uNMZ0sFz9qjVbPe44V
	x/PepojOMkABk+gnN1nF5Amh07AXf8ncP3UaMscdSAX8SAvUOodsQCMFzM5c2ILNGGcyFEDZgRF
	/0eCriEI10hYd3u/RGu+sc+l/sIo0x2VBTv1D6jYmbUFGCVbdRT5KsvA1XZBgbubF6N7bcZF0zK
	JU=
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493792a91.36.1794982776943;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
X-Received: by 2002:a17:90b:3c89:b0:3b1:8396:ebf8 with SMTP id 98e67ed59e1d1-3b3d076895fmr1493753a91.36.1794982776388;
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:36 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:08 +0530
Subject: [PATCH ath-next v2 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-5-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4379 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: lPr6idBZm9d4aXR7MEZgFyceNkzgIdyz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxHcelJUOeUqv
 qXzKgd/OucM+g/NHzfkvntXzt+atPL5SIU46mQJ3kdCDB2dkJbGxmWGzCNtm1leGkh9Me+WXaei
 neYwavNZD331gDPysAUw3d6f8b/QHwhC3h+X0wlyinu3j8MH6E0FxUKVpNr4KgsV8nsgU/wCmyO
 upT4vrhAmfZV/ZJ5XYvGXOfq5Iq2Woo9pMrj+WmU89i0eaFtQnnx6L9VDsPC6Njjbqpj8/Ft/1x
 43IFE7wPj1AheD1leSWaL9kZJcyksQ8xI83N0gpHHLrouVkki1jynEQLWr3BP1nfriufgZCtBSh
 vy4n9suBIbRV4IT6JNoSpvNeDwFHR2wGKcxBGiX4KNWfaVm4T0iqbfvSjwv6XbWz+GjJUtgOjug
 LXYTBnQ89jTPQyatML6A0mWY57aN0XMJaj4DuxCHIB1HQgk1/Q4qqXgv1BwYzQiPWLYb/CiD1zA
 TyAvR7Fy7B1xvAroRRQ==
X-Proofpoint-ORIG-GUID: lPr6idBZm9d4aXR7MEZgFyceNkzgIdyz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxQdsiNVSq7GE
 +9Ws16ArY1YzcGn84sZs/NNJXTC2cbs9J6kYxeycrqE0dUNVMYeLtzO247IXyHSqzlc+Hw/GJOB
 pzWqjVeOAMWVPQocONFelzP6DNsf+a4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1

