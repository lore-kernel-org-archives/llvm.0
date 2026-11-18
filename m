Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989796;
	b=duNwBRISBqbnUv9xCvdj6Iaj0BC/1zAzbfI0IClNhwbPDB7RNiL7tlaa+6HNnLsdwp01
	 mLtyxVLpauZCb2IORIRHlm4MN+uMXld2wMxu9FgKWiz1KSfyJ2pfj8l3BbX8F3ACptaQu
	 tMxBG9z+FSnnMe1GSNHmnJ4pE6uo/n5bU155+GI/yFb9fD5g0tB/QdaZwQYeeXfhBUslK
	 /rBAiF1zk2SOjNLf1Y+ah+oxjmGJYCXsZHMc53JrXsE4GMXJnhU2itr2c+Iz636eknWUx
	 D9v7vhmjTbXClSuU1EzOs6Hm1ATJUNLV/4+3rnscjVoglXt5u56saKFIMF0mtiTcSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=4mBT1ASn+OA+Se9javtqzRVglWUivVHfZqQEYi0fWw6lYBnG8IJboqwx9OcFFTRoD3K9
	 6zYUfpQKMwMnlHFLESn89Id/Wenk0x9fh/KCNK0PwU2C9kYczCRg5BbRj7O1Whb/xE8wH
	 fvgCeK+BdS3uY35mXw2p3HSSmezxf0eYqAfZcXpFW97ou2dLvPdxP/pkCimurTI9y5W5Z
	 +oaqWHM8pZoH5PPsffWJvnIoTgJ2i2x8WzFQFpTc7nNmR8TS3tahscOogxtaKjrIkL7J6
	 qBTrbMJQR8CZTgpBKmfo0fMe1/Rd0yZJQ/Y25AlrjlX7SR+HhTwZW9zydr5gDFzny3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UWgA0MtU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7D606A33E
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E7D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM+xRzUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UWgA0MtU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8AJ8r1959636
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=NM+xRzUPozTCkio9
	Ga3Or0rnc0N2U8LowpUKl9AV6iCNmh7Jkua+sQSU2SfgCVGJOjeb/6eaxUL8QCsf
	A2Hk5eLWetzmefWWNBPqjHHd2W+Qpr2XqRdP0VV7MzMlurQWshTgzoUKV6SdgZwe
	o4z9P1FxfdiyhS6pmqrAF5ZY7Ny8bz5hp39QnyGwWrRlz9dtXQvRdV8D8B7dsFnL
	q4Wg4QnQof2oyi/wxAGZHQA7w5rkl5+Ih22cXn0y8iJHT2Ub/sj0nPk0Tpa+audW
	ZxwQBBJokqCqdiIJwNafszWCEeTkq3ixs6E4BMQbXq/4MP/8DoAIfHvb9gFMI9dP
	OnWRsw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hyt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1563303a91.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989794; x=1795594594; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=UWgA0MtU6DvB2zUafzFbCa6t0B1hU9BwmdkT6LPQIF9nAgr2+lH3C/DwpaR3Mc6vFv
         gWe8zBlXpS7lxaqdsS1G+1/lDb5cjn2Ekf3rDz4j/OjlTPxihPN6vA0p1oq43DVebc0a
         z13TKEEy0BaYPlDGFlAkHsYBYLDrSog+rFr9A4QRjAtskHD8pbxh7Y5fei51LrjzTN80
         3fq4IhwImLOGAtEKjBa77kCtpP7QE9YLHZe1Oo/0o8Or3anJc5WpqNnOJ/nqM2ZmZLBh
         YF1r7BUmRJcGlsRS5OhyOF8Bo2wdbjGSghgbYgK/Z7oX2w/21uzJmrm5YQ2/bOLti0hp
         jXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989794; x=1795594594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=YzMjY8eBPKvFqdCxFEGXhNuVtfzHjxLnnmG5kTRzIaTmetSdsMsn0ZaJ4wCGHdUK6j
         B3L3oycWih7Ntmj89XKRGkdzrSfgx6eMfEYWLrKkMDNXTjWyLv3r42zZwdDT/M5UiyWE
         hKkn8zRcnMPpEFJpBMB9pe27dztpHI6XD+ZFaYQ/DmvqnJnjaak9Cyf5N/1Z0IVdik2E
         hRSTCuQ20qSPaivg7T4oNmvnlIJEFp30v+Q6f8HhnaWEv0pV91nSphBrLRe1uhWGc12S
         DB2veNC/bad7yfdMSoX0HSGDIFKrI2tQ+jhhQlS9gZctmAObcpc5Yya5IIbu5QI7Bsdr
         3lDA==
X-Forwarded-Encrypted: i=1; AL+hErE8Ida7powxB3yW8+kaFG01hhQTf3+9AH41/TEEijBNgb4m4BkZlmB4Zyv0qyhIP8dZjXBI@lists.linux.dev
X-Gm-Message-State: APuU4Z/DsybyKHQYP3qAmigILsqZ08KsrWSopUupQF25b1Y4fdrMUVmt
	hA3T2vI+iY/8E0Sf4cDZCm2LTLHAsPV0W8YIagc1Vwcncd0bzahAOxIKe9kuVrcVbGZlv442YP+
	UJ8RNAKiY7W5edaGO9L9JMvN//3jqUNVteGDi6NXaamNgIhoJwKMO6iOG
X-Gm-Gg: AZFdTZdCSEWZ7O91uk24M2FlnXWkFwYe6SBFvHd8r8Wb8G5YsEi5tD+jN/slEOuzqhE
	zobnnNTTppEtdBiLSp79TzvzVub3Mh4JtJ5NqcSeIoij98YEa1h1OtdM4O7a3YgvvF0SxbrlYsf
	Zo/7u1fRuPeFuPLwr1lzfNnDBuxgUcYUBYZF6TORImVptyGPE9xvmwh2AiwEOo/VGDINPT/hyBw
	oTX1haBec9sdfMXhU+z0T7IQDmC0BE/8+rkQboB3w1cbyFGUtZyT9vJtTKmJG7E0RvgH/v3nrhR
	VniashEcS0J8Q6f9gBaY2FAFM9WjrRcyr/b2X/s+sSDwBeFltM42OtZyQrnLwIO3pFZAk6ZU2D3
	+zfoRvYB85pmoZUjSvRaKwN+sfEZEKCuG3p2D+IdJJ7m8/T+kxbws6SwNTjbrLyyNgK0o+FKuR0
	GTuo1eATHJ6fOXhotsHeqMbJXDqs9BE6AakMBc1FBMCSHadiNx3oSFJb9TaZGE+4Z2DDvyW2yWT
	g==
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312796a91.0.1794989794278;
        Wed, 18 Nov 2026 00:16:34 -0800 (PST)
X-Received: by 2002:a17:90a:d2c8:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3d04c9de8mr1312777a91.0.1794989793795;
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:35 +0530
Subject: [PATCH ath-next v3 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-12-9875d2a3953f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5ee3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: quZ5h_gybxqcV3F-KUdQinTUy2Iwrw6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX34Jaz3S3+Aqv
 GwbAS2VVLHqkLt5M7d9kKqRQR3fbCQYQ0Ane87vnfDE0gBEU5AbjvdS/0jzEwrEVrEuVstV9bdz
 qnlYmtfRocgnyvqyxpjM3JRZ0i3PPWpQ57bT2ZScRxFSB0p85jfPDtXiuQ9rLqLsSpTBelMLapR
 zyojdPYZjb4pmTqkbvfyrViPJNjZIGvh46e6c5w1RcF+E8Rzc4nK3/XIQ8xDXJGkXOpo0ywbyId
 Wn6yOjRojFGOzRplpcFkilkk7YHbeuSvZMSGPjPRr4dXUP5fjj5WyRwwXM/95Fe4JCSyENOftVd
 JgjdWhdFirh+W01+48QUZKR9SY2dS/SZLJ4YYCQ054sRKCv0Fz9FXcBGmWKNfSi85pk8FD8tAyM
 6AGx5YsoWik5NwWTHwZ8E0/wUg1EbfEYpEKaF1+KEW4NJ/VtpuPlh/OCVmugqR2WU84KeI6QCYn
 jZdwGSeqvpRBYwEUoEQ==
X-Proofpoint-GUID: quZ5h_gybxqcV3F-KUdQinTUy2Iwrw6-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXw61B1OvU1wQr
 uku3zfJ90KeCmuzVfE6yLU+XRQwfTz1sNC21yDk/WDLokoGmV8+JfokKLBf2oXGWPLFq4xJDkw+
 5qm1ObB9xw+qdwHQi6i2ymWv3DwUjaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1

