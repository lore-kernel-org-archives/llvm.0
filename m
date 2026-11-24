Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538675;
	b=Ozpp1pDC3OmeVAryGcuZqrI8wNnNddh2gnvhdkpwKK05eNPdS1aQaWNriKrl3AtVym21
	 utuGB+0VjyZb4/SHTdaoeM0eQd8C5okFXbc8fcnJK09QcG0uJHrTH/S7Nt37ceUs3ob9E
	 xOEgoEOOCeh9YqzDb+r3bJYq23uywOwWDYXLmbnokMb5FAjt63jlhUHYGWpPQ3U5cI95M
	 syWkHMy1CMcqnmZt+MoTVq0S1YJIpCSc7G8onDWyoAIMp56dmOcguQpx0utqG12HjxuAh
	 1GiXFCp2nTW4UNC5TGuuctT7KK+rtkmCRlAvYXiqBDc9GtM3lZl2LpDCevjeiGaWWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=Xrcjpr6DCaPxI/R0MdEn8EwL1u1mW8AzsDhypi5fiWPrMMpYnqbDNdm3LrQciXdQFOaD
	 kL57vuRY9tJg2jEGII4dl9QCFSE2W3yO8UUURG2ln7nlm2IVpPAa8jp275O7MzJjRlnox
	 NMFMLj50vglF52hN8Nfod8nTaYx6Pf48ozgi5323AjT9fwh0ebxM5XYlyfkG2r/0I1Tkg
	 C9G7Ls2rkSaMbvTnJEOuYIqlMswoBcbiC9urdhDzYGe+Q8x8jPiD+ACyQtsewyfBNQa5H
	 iQkdWWDnMw3SAPaOVSHQzgCF1fARQevhaGLd2DSksC32AVX2nn/oftSAIzBdrov8GlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNsXZNol;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbO6Q0RX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D371606A335
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D371606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNsXZNol;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VbO6Q0RX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL8sU1215322
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=mNsXZNol8vfyPhsw
	zeG5WqVZWU8/sAWBWY1u8YuTVKLvRYKLbjpx39IdL9MS47/6189Zrzql4j03lnXh
	a9skXeD9KxOwpG7w+91RJ++4l2PcjKX5W+1bFacaR0qZDY0kxz9mvvUyzFuKq4xl
	fcI+vO6Ds9H4QU9JaxdQeVT7PvjjPQuFIn5i7e2xDYMEKUOWGpcqR9Agn+/JXDNc
	yZxTe88XEg/42K9aeb+OHvypqYaHcb7kiPGVykzdmsTPz6VNWkLl7AOrKi2MfQmn
	scmT4O6y+tVSZfFMUJVWYmjCBhzzWnDcZeGCjADJR7oR4/gHmjNWBLyXn4T4469I
	6Kd5qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjudd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5867851eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538673; x=1796143473; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=VbO6Q0RXJDwPr4RjkL0amfx2y6zVYboyyw+uJToUc8Xr8AfTRaT7MwX9MNr6y1/DKe
         PW/nGKYXPrrtaa22ezg6ooXGmYALg8Erd94Q24y6fYaSwTGghcU/o8YQZXCUjp2oPA8j
         y+xUrlmbL8qaDHDVHPegLQT/IQ4fryR4UDyV8GI7s11/gEqY1p+vnGLRFA9PZeuHhMZi
         7v+Duj0OqKvSUQiIwl54JH5xeYDArpWNCAd7x6d4xSQFh352GbiY+Uh02SkSNBaQ5oNA
         BVXGOfz7JMfdakbZbDyMaD9fGEeY8SpfCSdaMcsl7dAAMkiEttDc6ev19EyCIl67YJkL
         BSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538673; x=1796143473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=ZPcytV/UjBujrn+cHgMgE3JEb1MN9cGAn4WK/4oKlKp0c0LW2Ve9fe+EPSCw4kq22J
         WJY0XQ62FUFpomVXtqvUw1e+1ACtMeugEICZMb04Dq/pS/sJ/W0TIOrOPO+JYDwArcYt
         gmX3iccbTR6SuQ964C2cXA/+xCAOxjkAEgR0eUchqeEtILihEB7fQB/fDIxyfPcd9YdD
         sTu3e7x7+Zc4KPxjmRosr9JMumPG2p9uA7NGzD0i5zmA9+TcDHNVpbr3qIaoKVBXFeT2
         K9STm7ZCfBWYFB0tlngTEFCDoRmVT57mGFPYVTBXDMSXGqDhb9X2HAkhGRayzLM5qT7q
         qzdg==
X-Forwarded-Encrypted: i=1; AL+hErHGRaw1uXBvLW3GnKHLYjgvzCJo7vzpjPh4vYiVr26RWZ5pTwztG6gg5XoYRFdciCAGQ0xx@lists.linux.dev
X-Gm-Message-State: APuU4Z/eJRjtkRbd0AljxduRp1yfjn3lf/3glAprzDMrJh02AlpRlzdm
	Uh/P5kRvHGDpSvlB8qCAfWMcFckIj+obf1cP/csmPmM4wiboUljy8KgBncdFOG4aOglcNHICeSk
	m6uuV3YXlf60y9KpjPnDzTUKlhAFlXN5IWH5YgUX3L4H49pHxVFmYJtt/
X-Gm-Gg: AZFdTZdz4VzSrXAcAOQ1oCtAHIZ+oxsT1LVn0gBUfhB3TfnCXJmrqgyTEl6BUpZ0eN1
	Xl/xW9yC/+cyJwyYJlEwrXHgexxcJNso2yiFVr/yEF+b3dT/ESdMlijE8bxoQpNfuDJmpGKUpT+
	zfszsuLDXhgXlE8Xew07K+gXhL2N/bisZ3pPP4QdYgL9qeety8WjH55dNdsmPvjgFPnj9EYKlc4
	+jwL5lZhmDzwTvVG1FAiUCrA3tAzKSeB7cGwSZBi3+CInhr28Qw/PI/ZP2J8MEzu8Of1FJgK54J
	y9mHMozirv7vAPrFeE4fJwZ+XXlmfNzFlyPeTy3zPcSOIq/PdSOxjKFzayNOKQLy1cFX5PntbMH
	JOXY1s9st9+2Ap6LqxlRPwvbVeqYY9pOuPBWwiQ5j9Wr1rQy2uL/PBCscDbBHlN6RqFwdfQk2a5
	UQ19lBLxg1H1SvUqZvxbOKyOoPO00du3R/tVLo9Wio2zIpSBd2j5gSXJGkeFhsN4ZSFcBR9vxFl
	DU=
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013367eec.22.1795538673033;
        Tue, 24 Nov 2026 08:44:33 -0800 (PST)
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013337eec.22.1795538672382;
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:37 +0530
Subject: [PATCH ath-next v4 11/14] wifi: ath12k: add Wi-Fi 8 WMI init for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-11-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX5LxqAbhsFNUn
 LE6jfgXPOy1fvQ4hLS7JM2Bp11ndserTkb/o2T33RIKyQlNduH/BDVzEcvGLGhMIsZjFF9SxyBN
 oz4j/qdJ2jH6sB3q8+1tTLPIU5zpxBjIvUpX4WcJhMvarYKlkXKI1wDue1wH+m8Uh49Zv1BEj4Z
 P77CN8+OKNwY2R/+J40UgJVlSUFzlkMZcnVyXgyvA5z535Sa2Qpg0gnzmqNL0iIxKhwmybxVK0l
 K+5jwJSDFs2D7lmJzxMBUq2WxUnoHrUOMm7uGJbx5TYg/oH7MZEimla97CjxMjIEHmTiOXGNUK+
 lExl/Enm2dbNq01tIgNstszgUVJqlmfzq7BV3Q63G23MbOa/++wccpzPX9KDxzUeuWpiYTWnkBz
 +pqWg7RkyRG51enfTjUNA3XGsiR92weVlxu8YF4Ttn4vWr0et06ArIjt8mTcfvrKzGP/w0kPNSc
 K+xjnjsLVS2PjYLUBpg==
X-Proofpoint-GUID: AjYB_jK4X7l7E5pGRHUYb246oTbjWQut
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05bef2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4WddIMkX1S0B
 NkB7ZY6cyjkVZizmS7Q8J0iso33+bxV5ITltdBPnH0qCCcPKps6blWyvqz4rDmleeEtS+GjR1Gf
 QavF3lu+ks2TxYz6ejOIH6sPphlisi0=
X-Proofpoint-ORIG-GUID: AjYB_jK4X7l7E5pGRHUYb246oTbjWQut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

