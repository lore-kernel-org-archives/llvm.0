Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472427;
	b=4+5pR9jiIGMQaNnfEHUUCilSaU5H/HI3ygR7YlrB1b/xGcTwIJW6if0E+kpuR1TK6HZm
	 UJQpd7LVi7bjaHF0MU08J6aUrhQDKbuRETFYifhNeJD4KPVz/Zz0OVxN7P0iMrT4j2zZz
	 +LNC6ZqJg9P3kavirihfpRHVn/CuU5efaBMm2PhU3VPIqw1NY3gbX7kXYegTq046Hhr5x
	 o0hNNMOviUUHtYs6Aa/dw7laVCwcQutni4bw9NNin3RtmY0ejKIryIQ2E1my2/UeGTcqg
	 LKr00YHyrYN42nDEIL5srsVeYJxDxtJhBEnJvX4oe+v/jrbmums+o3T4x0x4tuG2A8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
	b=QuXOs/8PyN5LD6xulvkCIG8qSsByVQvePvMDGqFHCA6TOEWJi8UQSoQ9DMJQTYsxiMSA
	 lkedkeaqjjM/zK/bhTHTwOoJwze89yf11wAaJ2gdyTJtLULXV7fuWdySij65UlCDZ6orM
	 8hE/N/DOXo3aGkWmxnqvMyTPWoFN5QeTJOyEd9Od454ABfaOXvFhdinESG/kF8liGFUh6
	 NT7fexeSUfik48lrf9qrpZIovRmp++o5Uyia63vX1f7KcnRNzLkwEyD243x23ZXpHFbEP
	 88KNW36yncq83fDQAoV3CEOK5da7aDHasFTpaXgH662TqntBtrVRD9IZ53kUoRNiSdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYQWdY2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DgBuyQhu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F226073497
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F226073497
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYQWdY2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DgBuyQhu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVsY4149298
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=DbYQWdY2G08fGYKn
	rD8BCQaeHv7WnPY8FaHdOiPcwGrAOD9cpcknX+mJX/c2qpdABeOSySnBzXeOxw15
	yxSQ1STDmXxVqAmsO+lSxbiI17dV9sBys8/LhDlpeqKiRSVUU7wBX6FmPB+ZNk6y
	20n0Rb8Zts8VNBKm0kALtorUymBW+biwCQ7G2MTOW2AH/q6j6zaBLem4zXR6TBk+
	DSU2DOk7gw036Z9L7lRe6W8UmjKAycsIo6qjN3kV6zmderZsdNrWuNBmk4Ozmno+
	DjrObXXGJOSsAwozoJ5pmSzKKFZp5sqo/nJbCWtJ2UZ3eymmIpNbttbKj5TwWggi
	eDQWfg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62j5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so110840a12.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472425; x=1795077225; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=DgBuyQhuIySA3XZKg2LN9QwnaWjluhN+G30HS4RbtKFJ29olOTAu0NRd1fQotQqbE3
         q3C+zsGHGzdTyclgsaIZiPMXiNRqH+V14tt2x8b073bnE9OtoBddxlR2n+pLiHVw51Ty
         U0TgUiCA8qxnU8asOMkErH4SvV1+/BBa0beJr/zhU14nAkUF+SVJavGT4IRTjEMl3U/X
         fTt17BKLlY5x/knzAcwvOAs0io+VGp2Cv74U/BDizMXzYCmg9mrgs9JXNZtfHr3LC1Sn
         IDRhYaCzdZ9wp73kjvn/x0VFCpgii/A8s5z9eDR+SOPuN9t3XMXqiv6iTA+46zaGpKY1
         2YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472425; x=1795077225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=qOu9bFV26oXEVqlyAYC0ynUAQU+kCAKbQuBQ8FoNOmyNgUhtLa/xA3ZiVnotW/kmmz
         imZarXDafTmsWooVrOYa7ShpnlyHdgOg2ZpOPvIfAC5iCRoMzmyunkhHuINERyANKuvC
         r2wLVcgiRzDxVAIE/EuH3eJRpMsboukdUkHdLYV4Et0sO9IaUaokGe8lAPcXYMsQ15JB
         yiGBtF/qG8UrRnawhbySyj8BUOQu6KlaWPyEGVUQ1Y9gQ5qbotzpB+s6A+DpmlWK46sz
         4dMI9GLiD+LZP34sdGMaugNoqRtcvo40FMRsyv6Jq7aFjqf4KghBNVnlL6ZisY9iDmpX
         whZA==
X-Forwarded-Encrypted: i=1; AL+hErETTKty4JFfSnKno6mk1547pR0wXJs9XNqTo5rXp0umFL1orHlO/SAEuPUyVB2mOPE4pD8C@lists.linux.dev
X-Gm-Message-State: APuU4Z+kV2SGSQVq7Y7Iy/KZTcIXg6hU7ZTZesW+4ca6/ykQueKLs11l
	tBvYqyxMZzkL7YhTehpdnUcHtBp7y4gApxpC+c6nSRjwHxHLFcWxB2YtyPJUOWwU/VaVAEp+2qB
	TOTOWxaaIe5WHj9WKAr3O4dUcWcy+pHDiTpNpRM2Avf+QhUeQNOodngKi
X-Gm-Gg: AYBFou0BeQ8qb8JY3w15Ae1X7ff6Mnw9ER9On17BD3Rbqys2dHucLrQ1FY5HDdtNjLt
	fuiRMO40WopVSk/jP8Iv69Pwj7QGFKHnMuiavCdD2IVMRVsEMMrzOOF+rq0KDKegVDAOjOHTc2s
	qB91/MlNk6DrjC2CiBMhZI466LJj/s7qL7qXpGcnPzp/fm2IXJDXp9yVBnFVoGIyLEcS2dRykSB
	LJNOzzV+xpibFS905MnWvrAPkG4amSK6aFYP+UzeMAuHOCqXsh2oOeVWQ0R/NGPSD4J1ESi+q3X
	imfGaPy/z1kjLUYeS0jZZCgQROscMQa1zyrIOGKIfvcnLPB2dPURf6wX3xeUbpOZ4C7K/jdrKwD
	HdJZw6QVdWTc4QkEs2kHAkKTIHTEk/PgkGnHj8lUFxOUTgLfwV8Hjvj66qmpWelNeLCkp7Go/Bb
	LijlXJSS3RRd5zfNU3+Klc6CfSYidaewIaAX+2evt4I5ogIrn5EQKwkZAS8zGS4b1W7NolvC5pZ
	w==
X-Received: by 2002:a17:90a:e7cd:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b182fb3074mr4911487a91.26.1794472425121;
        Thu, 12 Nov 2026 00:33:45 -0800 (PST)
X-Received: by 2002:a17:90a:e7cd:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b182fb3074mr4911466a91.26.1794472424567;
        Thu, 12 Nov 2026 00:33:44 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:44 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:29 +0530
Subject: [PATCH ath-next 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MYLvQT8IFk_DnFgCAf4rm86ZQUVGOqhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4HUR19mpj+FK
 mKy/ZYEmDkLfXBulmJceW5dydJdN2wyUsJTzf4MB0jcV1phh3ewwFbyocv1/3JGXnU5xq53bEXa
 9tcrLJWrecpJHJV6w3xfRdXO6AEbLIqqir0It3iS8DbRd0g39suivr+yIjrxe+psqbcNIKYBHR3
 cUm0R4QwAGmiod/tl4hguX46qlT/6mrhtvMEeCmtnFmUVx4Z8fIPxus1QsAPqZNnZhCV2g/7S6i
 8hY2JaWxlE7l3s5IdM2vLlsl7ZZ0t/i4KCZLu2Iekm9ru3PYVZCFcqWCvMrBLnlNggthTp7U5RB
 AFZ9kei8aJ/a5Z9yJli7YQiFbkjyf7jdJzGEr2zmoTamSDeVsdzOFnk/CHvCPTlRG34kKUZ4Hja
 D8DEAeBHSS4bksq5IlbRG+p5NExUanCPWMSEGRbVi25cUToM1lDvP9tMdZ0jQvk+VY/FmvqTnPz
 J5jPPyi1+Rmp6tV7Z0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX2tCZo1HZN3Xy
 bfZuVjFlVLqHuJVQdIUcWroQ5JMHCbahIedvJSlmgrTu3/cDgpyGZf606b6WS0ZRMi0YX82GKSV
 EbcRHdvLkYHw5k2euGOE4KDYtoF+hlQ=
X-Proofpoint-GUID: MYLvQT8IFk_DnFgCAf4rm86ZQUVGOqhV
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af579ea cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

