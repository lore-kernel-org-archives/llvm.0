Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989760;
	b=yXJ5/H4cgxLVzMIRvfxcjAJANochjcQSlSUelBQcHyd5l9hl+kfOWsmwjcQ+QgRfpO+E
	 cpwRkYnFo0+z2YnstFcflOuNi5wdTEJJD16KsduZaI9hDlWLV1thbAbw4VVLhBrCGVRiw
	 voZwrVK6eYT3oGoWusw6jhdSXb8lg7tXqd88U9d6OM+0/1LRz8GhNQyV3DNaGrJzcF91v
	 I/idrD9jI/vMdJj4pVKqYn+MKYO3TjUIncYpBDg4JvEurGAS4no9EZb0JYGcM6HpFLudF
	 H8zIKcO1/MRaXU0s3B8HCfRCZUrbuZhjL64u0eqKMDg2LjOpxI145nnkwUqDJJ5uSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
	b=AdWomiEYLv8utMZB0nxfY9mpjXIhmUhgg18xCtKK5lz2e4N3Df1BDOuzPJ0qUfRoJWW8
	 mlKlAekS33Xhy9u/B/93X7MLxtNZsJ6TZ2mjrmfEUhiKkywK4cyLbCuef21VQUVrj6pP7
	 l01/T1HHksChEn2K4ZdttW8lWk4Ty09RT+VBQ7yOa5gSH+ymDQxMH8kpmqLZVBAsH9vc0
	 h/lMqvWICdH4nSyHTz1BAtdF5fBUuuGLzHoPgGtuI7g1Z1TSgFxvqw5Wq4jjYwtf9qJoU
	 rPE+jELzVPJ9FzCt1dHSIAFsCEl7n+hibgyYuWv21H1j+GmRhmgl/EvxQkN04d8KMWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyvwRAJQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB2606A325
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EB2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kdvNyEWi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyvwRAJQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UoAj3371286
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=kdvNyEWi/U/p+6+M
	V6KYr8FfRVflyAMRZndqMoFsRh9Jb8IFHGO59POUAAQ+AQwXw0v27Y6M/BPxQciv
	kHEFNWT6V0FJAS0w7vrHuwjU22dwrmR5A+08r+ajss/Uisw3zqqm1/DaqdoeXraX
	67fpFcYFyIHz4wu3H2SZ0rJgybsXhIHbDDBfEMrAy+Bc1mbWmr9gS9FhuEGY2kA/
	p1hjkNdRCVmxHXztf672tTfCt4c5Yf/1NeJzGtQIbqcrBAtyJ8upjxzn1vB4bUfk
	jOSvqAbWINAvTR3xXdw7EgS7VW4Wb5j27Ve+9pMAdgVt+1Ga5hm6mToY0gDn0kxy
	ihwaLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:15:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso949016a91.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989758; x=1795594558; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=NyvwRAJQ4Ug3rJjbduMv0FtzQPSxrKP0uLIvvUI1lBLo9hQDsuKonhlRaGTqsc6SLU
         Jf4AdOOd8GWur8bra4FInJVU3sfOMvfIPwjS/ciaokuVwGsyXiiblgMrhA9P0TsYu5PC
         y6vZr8RsS6iCmlaOvUW7rkxJCNHyy5bgwpMKjEFHJhG33vmW8lQsE5RTj/l33SarUtah
         fqHnIF/+4+kuvDUrxPAAVQwwHdPehhgDOdlukrCnVbFxC37BaQ7tSpXQIu2nlZkD9Ted
         XAq/Ps+6QfRYHrMsm7C4VOgrLP4uHDPk+Q3yVR8c/z2QH+ZfhosYOZqWIgC2NQVqHNEm
         VaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989758; x=1795594558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=dpJXm5KygbEhNgG4sUM0GeYUvDcb6YJIGUSNucx2rxb+tNQBLHVYDxgWB+jT2DqA2s
         dc96N4V3yHvR8lZYV2MubC7VCV+SI6V1kr9YVf4uvNtU916yI0/YoMLxeUITZoMeZDVP
         24Z1DoqHH9BEvjKHbQa5w3cbYYvMzKcPwf8fOpOOujdI6ZQiLE233QlrIXRl3UW+Bk1Y
         KKXdluaiXeTL0TtnEkPJy4hborKTvj59AnJm1xDQILTI6/T9aHeb8NAqKW8WJTGFMnOI
         vcSJlcb9WbDSKyttHb+rkjwuDr7Qx73SMvD4TtPxVMGKpEh365b9Wors5K/v2a45caz0
         UzyQ==
X-Forwarded-Encrypted: i=1; AL+hErEzpB5u3VnnITWM6C4WDfih6+5upy3KVOmYHutZjfc5S5bnMYTiN14Zhike7BlOzqr8mNHK@lists.linux.dev
X-Gm-Message-State: APuU4Z+ScQZexiULZHrbrSZU7Tf05zkm9a7kZkFFOCdjix9psOgAFJlZ
	mIGPDuLrxLfKcrNnc9GNUVI86EqQuYg++0BvsbESEe7sd7y4AnvXoTzETABVPT5w6GxubE8zqFt
	75v2kBCmZ/kh9Di+0wuv/uGABCJ2YlHNDhbXMD0RA9Ml+3eYhyZZgYGO6
X-Gm-Gg: AZFdTZeBezf1d0x/onPNazru+3VNmDpT2OSC8OopjO+9HtFAlC5+rN+5qujHrHxogii
	Wb/qgUd8I/Do1gp9a5Hv4CRq0d4cX3JDdESXsgI7gBxqfIfmAZt4ZPIagxoLgHIqXc0HssBCVKb
	FFWhbcd+8uLOZcjV1DqxQ/JiH1VIVOlwTZV4uIdsmuur9QYgNc8qO2e6S/00LIZxM7QOobH2u/j
	oNfDtr4bgnQDNrL/NqEQJiyEyE2b01sKp7BUD44o9FPhV+u03L65NLP9uSIQWWQwpd4K/qMAA6u
	0pQf6xaeQfGRdvl+ALwgIVxnH+dFfxBRU0i7cNbJ86+ZiFY/21z5e08nk/n51MfM7Hcsh60Sfk1
	Edp/CEaN74l+j5Y6ulfKDYI9mwtQJcoN++Pjw8DXYE9CJrPixzX7SbnTRGvIF5N2x6S5EmcckJ9
	04iIAlVP6nW96mWjbbGp8WVwY0C7byfmf23tytNDIUrC/SjXlePX9Wa/UlIEuMW0IV7QGsslrsp
	w==
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014436a91.21.1794989758261;
        Wed, 18 Nov 2026 00:15:58 -0800 (PST)
X-Received: by 2002:a17:90b:518c:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3b3d07a24f6mr2014405a91.21.1794989757579;
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:57 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:28 +0530
Subject: [PATCH ath-next v3 05/15] wifi: ath12k: add Wi-Fi 8 directory and
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-5-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ebf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aSTodJaV7czkhuKPkD6KW4aBk3CqS2R2
X-Proofpoint-ORIG-GUID: aSTodJaV7czkhuKPkD6KW4aBk3CqS2R2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX/zrQrFFs2v42
 eHLan98AWCnWjaq8uIOA9/7pWbOSt7ctQ+3ZCUrlKKw13eoOTtLLAqbGj1csFR69WKrJydX3Ujw
 zyEbaT3NxvEAo1kPRAh8TeDUV7oF5yVGDIxW2ESg2f8exlHk+qIlM+AwIWuvcGVKpqFvp60M08y
 HY5E5UrjrIZbivxXCSl4+JE99Ga4w/7+LrGQZtRkjb0HjJdRtHAzm0V2rUSfOq3iNPxZFLCv73a
 sjqYzyN07016TNExAF0yRSZmm/6UHesWqTZQtzT894ngIGy75iHsKU4f+hp1qw6jIFo8gceR9NM
 ljVV5F+GeG6nt03RL7qBPXZKMYzrEh4OTRTUzz/ICuE0ztJ4759ZLpa4zm6vlrb7S8cNgLe/81o
 UXRGp8XYyhbxK4AGLGPgVP9anCqhRom+tenP4QE4dTmUXpFf+C1dMu8m0kJd6N6GGWjEsxSjC4E
 4lxuK3+Y8Wq/ZCLGKWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXw58S6MVrkzQF
 b3VkPHYNrUhktc1be9DkHM0KuwF7WM+P0mfRI6NeTTyr/OTQYPCJ1pmSKNsrcHnQU7RExlImnUO
 upyEfe2XMNeMaDm3FlfbtDhgivgzN20=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

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

