Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472374;
	b=RY8+X4QBNxTovMPEl23C0Rgjm8PzFMTzBnDt5tCoIrqfrEB3/J5EgjmnqeX7ZwDtCjE5
	 s8Ae3sDxPN0E207SmL5thZjogUC9F2jHvePeeQA8/XthQCKlnBCA2A/qILJ9GZzTSei8O
	 BDiEpoW23Kz7QXECLvL+mYmIRXyo39fF9s254NEpTuungta/DA3smfXbltLLwKmK1lmAj
	 jlMZphFg6xnSAZmzuAYvfx8I0nFsOdtFHxP32Dc1Ok2LagwTu8kV9w7h4Wcisa+B6GfHK
	 Hv2TPI3UdeuXNAEQdwVQNwI81awON5PyOfgSDbOsBYOLXmXWe0evhPdIU11FBvyTH7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=O4dTzadfQp3nsJDpCFvG8YbW/MwPeb+ABKujwoHpMROhzRrF6Fd5hB9IV2bUlfOK3qzJ
	 r3agMsjdlMGHRoyDVKgjL69/bxchjDV6ey51KYv/EEdWXXGzg/9iqm5u75GEc/t3J+xoh
	 2Bf5kn3hkh+aCB6eTdDAuB+fnVKHy6DYVcnros5Q8aIM8txn2GZYgmKnLnTwTBYTPd7IZ
	 MJ+v9MB7XcjhoiJ0vTBq8WGcJAFYPnMzUYm3P6OPVKmskIVpEig3eBJUYCeYgVsmpa3IU
	 93tNTR8dlW3SD8ysNvvWvyR3xRg//Rpn7nVBtU5yPvSebrBFNHgCFV6L+yAmVGz7brg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Abv6gwTb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96406606B70C
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96406606B70C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Abv6gwTb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2a0vY597692
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UY1mprCalcSCyaMg
	MmkNtghlBAC0H6EiCe6XvvllNqmTib3KbZm9udLxwwIKi473iAeZmCO4NbKVBY8J
	2nDvywiAotO5zhBeUFWdpag7pZeUttW9/qsCyd1SE7nV7erVjhtJ2Li6HFQpc8CQ
	99rg4kAo0xDPHs3Xh12jSSaAkPxQJYb46l5CHLVtiDsUWFgDd3kylGzYV1TDH688
	sPLUe+PsICH27xpQZl7JGizW7J5ZKyR/n5QLTkR86tOQmcn3rpiHv5Ec/ucNcROj
	nhB1iLLxYlVO+qKXc0J+54Az4Qu9uodyKQMLQzYwuxusREkSNQQBrWqpdX+tYMog
	5ZFPcQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153uqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so5045100a91.3
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472371; x=1795077171; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=Abv6gwTb9ae1Ak6QeJwnCwsOMuFor3rUFRTw9VjlnEnZ3eHkYk+ZEVvDe3nciprq4P
         fyCa0tJhDdwOzoL7kgsjprHcXXZW+++HSAR1mHdlqz748QxETmBBMXjolgHO0Llyf+Qa
         84v2r1og0UQA1bzVCqW4gebkzvkQzJo9ZqYMCOHtMQAmxzNpOyRNSnKUXyWZ2eBKvuTb
         NCYq/egeIfdM7Ea4OmCQZ3M8ctp/r/QoGdcaKNQwGIa+UCzpnMZ1eH555cVuTd2aE4WS
         +XD2t8eCfzQnTf7qV17wH3tro6IAjvH6PN4pJ4eRVSjq+Exe2++FOrAG+y4unr8x4H8E
         em0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472371; x=1795077171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=j4HLASwjQr+/x/5PD43f5WfPoF/3U7Z2IJ4N+JxvC1f3kmcJu0QqfpunA50V0Fi047
         J1G13HrWth9H0oAGLvi1KaoIC4VqIrIsnq7dnv2JWux3brcuGK5CMJ6vq8dUGWk5Dbc7
         VySt0EWV6Zxw1S7/EIm0e8Jvo/az7TOPF2S13EBj3F9WX9rCB1Rvb+qt7XA5bqygSfv2
         ntVTQt5DkntZA8hPchUMwssHXnwIr8YbSPpjEwyJxYm1LqRRzF/scSCTGHttBRQpEf5B
         k0xu7IV5tuC4xwMNffALodJ0GQ3iKNXW448LFtEU6fJ8wJ2hwk2faJj8epQPC8bkQzj9
         yG3g==
X-Forwarded-Encrypted: i=1; AL+hErGi6INlWK2HwRMnog08rELqGnoP3YrGpeQjioqycnFuNkzxlCFZ50fA1XttJxIVlpcfSIUd@lists.linux.dev
X-Gm-Message-State: APuU4Z9iuD6CZ8GLeO8wHTkK+Xwh3T4HWafARtQr/AFzjyR+hBGccq0i
	cDiRaIUjhOZl7/8cpoQ0gvJGxzppVh3dht/7j3heIyzhOmxQMHWSndHdu/ARcN3K8wNtu4dIVWJ
	JAwSz+ZELN4lJ3B9X4JvkOvsG+W5q49boK0SSLxc1BfBPCk2fsY1vjgw4
X-Gm-Gg: AYBFou3i9TiyHRpdBPQ/zpwZxvM6Sj3D4ZlERvSKcOk3IJnePP+eSS81MOzdlUCVRk/
	/OKN20836Q+tKSyiDW0qxlwcjb+ivaUh28+5NnD9KVf5fyQ9fwUrOYl7xeQwhVkgJhqZn4SZKLA
	/DJI+Io5DoF7CI542WRVURrab7wPlwCDZEiuYNPsg5L2hUuNJiVmUcpHKMv7j/hxgJr90qVO8Jd
	vfWhZlH02LbbhnjWXH6sSgGKtiQ/ooxEh6K3mBG/AUcmOkd30eRkciB+T2RnOG4TqfHhbxJxQWd
	m8/uZehaUiVl09D+ClonzqzJMhW+86zrxLxelIOr7hvCqN7yGGC5fWTSnm0LMXQ2N3/vwNtabrT
	51r8wULmh+S/3jGW9Q/v84TssCZUmprUjmC0JG0NXNkFtavKlZLVaQk0VnNdWOwmSI4eX9yP965
	yqrTqZGRiH9/eHU5BguWpg4Piy4UGiT1KLlq3oRJ5EAUPE9+2y8lsTvukoqr9BXX18D5nnXp9Ne
	g==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031295a91.49.1794472371369;
        Thu, 12 Nov 2026 00:32:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031273a91.49.1794472370879;
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:19 +0530
Subject: [PATCH ath-next 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-5-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX8B9vmPQ2qphE
 zLorwC1YOowooJKmH5u3h8ke6gU8IhKz9gJGd48z++IMzA8J/CGgQhM7Jy+KIa1m1/Rpjp8GfVz
 p87+LslEyjn1QT68RcywfzqpM01CRbQ=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af579b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VagZeypcZCAVbu4_wmaOqUZ7G9WVCY-a
X-Proofpoint-ORIG-GUID: VagZeypcZCAVbu4_wmaOqUZ7G9WVCY-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwnshvXRAtglb
 rnNO2JpQoRLKniZIDylHe+4OsCXRg2wGYEx//rM5IQ5ENJbtVH+XlAF/j+eu4ZC2aFCcPLx5UKf
 scdCSezHmaOC+FfefhFKdLTjyQGAaPKQOIVZH/+4jgvuiA1v1ZYxcPkIMCadSR0KQjU9aCqRM4g
 vw+0RNim/seLNUg3pl7VKhOdmeWLtJOBX9f8dzxrtbapaAVTjEID3tfWcQhj7SNCAIiIA2SASEx
 8GYoAs372676sHnBJLDRI/1Wlh940qX3Sq0WriYJFxWA8vTFSsb9OJu+/7zYlkjmgamxAFz4TGl
 wVLamaJWsvXiABugHl4+qGzf9OH10q2sL/VT3QV7broMWsawBPA1Hj+VaczR/7D0zDKbmYFN3yp
 j+oNRMMqri0vcV4XhEKb07rUoDA/QqAZNrtjwB1l2PhTsa686opW35Xmppo2mAi2vULNkGaoLG/
 KB5QnE8R08wb0ttzvTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

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

