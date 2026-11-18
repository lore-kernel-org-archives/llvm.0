Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982805;
	b=20+8b/CIGNs+TB+Uqr8BRmGFyCm8tgKJiHQrO8wNU5VnsAfp8YwANRVHZh8IuMVb6oS3
	 zOVM5iadMdlCaOiMu9TsMSxk1zvSuSVrcE2S4UElY5/HadIAfMbx2v59gomFqENYgmg2Q
	 np2JWLE1uGK9OP8Nv2dozjUX47SB1rt7UWZX7r6cmV1g0PibJ10t9Hu1rew/nareMjP6j
	 OjwIOYsc4P4HRE3o/LFx3idnlqBWVOuvegJDMKH7WGlYNVFDgt9NvV5MRMYP+bDh0RlRY
	 TA0fXFyaKazfCPwncjVDNIqBBm0byVopNxpi33YEMi1kQYgTc9P+gChLyJb2p1zlyew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=Oaw7iEEmrq4Ys3pqW4cQpJjT5kvMA6/b+n4Lyqi2r28UOmAmEkPMXeuTU8x7gULsvyOc
	 I+O/K7D4hmKbL7+JO4wvf+uYwAX0mh/w41uiiyIrbbC0gbJBIht2/VGiip0IeHQx/o/6I
	 ygFVV2QpmPFOId1d1BBoectfEv3leD1hVrCoEAbPoTAYTAKz1IpczU5TELWbjLFrhFRGW
	 6uBGQQJtIiAmPMrNCIrmK7wfYqX/u55Pd8xzYi4lQ5JHdpNO01B0EUXBB5kvnNcldww3A
	 5QyUFmKeRrHbzKqA3/OhGs9DSMNfFkG8KlBrOuwoxXc4C4IEKJFgHB+quFNO32c4kEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMwa1oyB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C42606A33B
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C42606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdDHqycK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMwa1oyB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uv0u2453546
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=bdDHqycKeNp830rw
	4GqOPocZ7c1YohlPh9QZTQDWVtfTfNcZVlFLEDdZPfr5wAW9vIcLDjUJsA83SOut
	wBF9VRaPmnf3a0kpy+6S/N2sgjuy2IDb81BzOzhE05Nyz+nqAStVZZjGkv5u7O7x
	uBJFrVNnSkSk7vZlMOl7U7GThTaT3q9GD2YR5lOMMHW3MJ0XE/uQJNIL1FtlKRDv
	qLG6nn3j0JQ3q5uggqGsNMnQhMWNW/Ma2waVInwLlqIdA6JCNrgtm+wW65tC2oVM
	KteKAsQRU1+fAcrBvYVZVd3NM0NQ/vP5YaK6t5Zg9K71NKo8BQYexnBKB52eNRHT
	f33i7Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99gns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso384008a12.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982803; x=1795587603; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=XMwa1oyBGIM0tOZXMUqPNBuuKqQn4AJYGwT6DdXRHxt5Sl+xyB3n7BMjuTNT5TWTv7
         cP9c9rT8RguNVdyNvceolg5y8PW5/eloDh+qG8evxUY9BXckim/WbssdSq7n1hEQ9oiS
         MIA7WP+Zszf/PnIhbRRCAk4UkFPKSZZVUtMnfzMqr0B+VE/Wx8TWQHHrk+dMRsyreXmG
         U/Eamd6TRlqgphbLs+A+UDwKelG2KNsEJaPyDmC7Rr9ImX5iAI+sG3wtpooFG1roLpS4
         rta3/Yx0vAzppMPjt98G2WA3ScBO+jhO4tHi3et1XeqC3k5IwhCBWu0t/UlJC8oCjTTo
         BEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982803; x=1795587603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=bJYGE0EayPPRf0eo07Zgp8DRb5dttmKGL8+ErgRUtc4yznQxLawDFH04yDKtD2FeEY
         cXTVWo78NL1NddzjPA2N2TIDMxCdInli34dYCR6Nmfn3JI5Er0abpNkWJtMmNig1SHAQ
         iUa3NIGa3chzrH+mS3er0dj0ljZLS2XDTOFyc1Jk2x07CIP4SpNqlK3Law8Gvyk5pMFI
         iI9b9m90lYbknfLJayq/9rl0/EEY/hJf4rF/PY/cXsGaAOLmvByRTRniTZhUT5rNms2J
         wB2LjNt1QYOwVkmecj0wSFHtbvBuZcAeAGAkSwD1jaj1vavKPKDOaXWic/modpJYzzGB
         Pjng==
X-Forwarded-Encrypted: i=1; AL+hErHvoiFoKS+oO+CzASvNYH6BSh7quFq0oec/fKrVMB7Nw4AEJW+qZ6ZwssqX3qSeZnnGOaHL@lists.linux.dev
X-Gm-Message-State: APuU4Z/p2CU9/6z8UZ9pFx0xuhDKiArWXzNoilLivgeafIsee08t49kh
	MUt69LFPvApKBoreyXzCARn7wk6184U+9O+iUN5J/uyv6uy/AgZmoCarLarhZ/TnEBiZaUXFfJy
	ZDJFn8qHk3fUhYViFn0nLvh3ISmU9dU+Fffj8RSxkh92L04tswfyQHomr
X-Gm-Gg: AZFdTZcGbVfPuA80zGoOpNEbjMTJ25eizqQRUM7rwyxcIyx5m5x2ZpCAnu/OSYPx44Z
	Yfag0uhfqQIWfye/ySsKpR7icW/3bUHeuTlKsD4EjWnVu1XYILdt/ZhO3cjyn52SwQ5Ujxsoc2v
	Yfpnum3Jjaa8wQnnH6R8qaJgCOWioCopJ7pFwXntnKzYDmjocwJvBZoOX+XpaOfnc1GLBe4tzm7
	uOe5CB6KLdYsdBOYSTFnEi2indYVqjCfUYbr0PQAnBTzNOLAI9yULXqcmG7dVxSfO4XrZkP3XAU
	9BCktP3Jt4eZoH4sYqQNaFl/wfS7i/CW21nLf5EkcDKKgt4ISIef9A1IYJacqbRl3HVfuPxJUVQ
	LNyLowOy/QYPh1rPKktz4vYzJDe/2yDyx2PZrHf7oY6MSCVwwj8ex4mcJu8yPXYNMxW/KpwEP1S
	obZKN0BeDvqMct3QaPVw3n5GhoH9bv3/cH2CIJt1GArC6OpK2ibNMRaiSHqPhNSnj11BN9nnzG0
	4o=
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762551a91.52.1794982802659;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
X-Received: by 2002:a17:90b:4d82:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b3d07c9e1bmr1762502a91.52.1794982802139;
        Tue, 17 Nov 2026 22:20:02 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:01 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:13 +0530
Subject: [PATCH ath-next v2 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-10-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX/gNUedvGV2Ha
 o74n5piva4uS8onfedIQSscuwhELDCAqVSZlAl0QGExXVq7Dt8lBaSIKccOtlkiqV1/ZIr79ljs
 tLSchjsYCkr1KEpVIpWfCtuC18V77P8=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd4394 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX8vsUFZ5mJqGV
 97V6jqqGnHElkemMCmR/dLohopg0HvtTzcSMyvJAwZFXvFF/yY24apbcCAqiczYA1nwMUSaviCZ
 L4jYffZhUSY8pfNa57bDZ5AGnjzUcEO/6mla3+XS/gIrkbSAMDfSdjfE3uKtvqlmiAnrbc0UnQ2
 ouOk0TgJHk3tg0PJi3KL0P5+L1juBGHHugLtEOEjTxsheo7uZhERSPjKeSxOGQuuwLkGdVU0/jg
 K6zPQo+6NAWtpe3P/Stxy4tysvtNVVDEG+jz8XZ+l8YXicvhgg/+kebvDe/HkNWgQOl8BtYzaP1
 i0+/FMQsHD6k+Wr2mzW9p49rpUx8QyqJ2rFVN4q3uJgAE6e0J+qytxEjqxC+ihILP8bsbpJgNPj
 nGjV2IGTSDN35oKhlY0qhL1G9IkGz8rUdjvHzfk9TsHLb5EQ436SxHBlKg4j9gkdqpv1KDjSpnM
 bGHp3qtR9RlZOdtO/5Q==
X-Proofpoint-ORIG-GUID: S-Gwrp0PN477aeRXIzLNcldUzOA_9O9l
X-Proofpoint-GUID: S-Gwrp0PN477aeRXIzLNcldUzOA_9O9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1

