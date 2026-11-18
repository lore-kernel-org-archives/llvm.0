Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989786;
	b=a5MqMlwR/1yrG6rV+Din7AutOQXib39pv5qtYU4fmHY07z7eTChtBo+o0ThumN28R6CQ
	 5rNdcoGgf/OPJmKBHO5P3f7lpg2OP/fZaj9kZ574wkSb4jNPCcZ38+bxtleUIykQ6nIme
	 DgRlQ20Ut7ClyubwoxjkJmkOjrK9OyX8gtigS0Q7oAt1WWBC2zJ+xEqiP4wGMTEsyMhya
	 DRPK65eexfd+Owi+L4D0HVjtM0h1W4f3wflVyXxbyZNghwWMY9EKHdFwYNdq6zW6k6x0H
	 qat1XE9Z5qavji45wPkSqqEv2sSXyJGWWnNwhlaol9M2AeP3ZwuYZU0Nj5Y5rFbHCRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=lY1HuyapYgW+nhR6eFh4HgMBPsV/wWjc+Wn6rD/YP8WyFGXGEwPjT7kvAyhdoIKxbQDd
	 yvhQvj7/iQ5WsGSUvRdDWuO/V6jYb6tVjr4hfns5QC5eeqHvThZ7wZbaPClWHNujb0B5y
	 LIO+3x20XcVmvjZ4yydw6WIZkI/dcxuueIp0nuf40/mrN2yd1/YztaeFAxpHBa+wKbNFh
	 acLma6HnMiWdhSpfe0nLaiqNjoUo8ZMvud/8aM5+vY2aHarcY+/wgEEFu606F9kaEbskU
	 ESh+Lt2oXSgkPOXIJQSGtXzr9k5QS/GBsfb5z4OvrWyw04IlT5Og2Kr7PC6kCATaS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yxbv39Ch;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F430606A32A
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F430606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzCboT7D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yxbv39Ch
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI80viM2602436
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=DzCboT7Dhn4gGb+i
	TKOVZRY4KjDy1mBZpGu3EEkyjoEsvlCkOvJksE4Rjgq5yUOJHiEDO7cUGcbMcdLU
	YDu7rJfTvsgwFBD+IipYzt4X3XhRNfgcjPC8e0JXIBpU3v3Bt/EaLN3/xHOAE4t2
	gAA0sk8RB8umQ+qZ3mJHt0gWfYHl8Ni8EfHuyj54kpTTcPvkwoa+TcrleTNl31Ai
	IQ0Z2Fs3XXOqRhEupUNC7Wd4mv7jdt7xfwIiEcp6rot7Xu5oP6jwJY7cc/k/H2I3
	MpkVyI8B1Zm/PnkPp3UXkoY0JUzHfS6zhWd+zMNsVy067//RjR2PTXXXd9SIXHo4
	TDcMVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv721br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso897001a12.2
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989784; x=1795594584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=Yxbv39ChnCz6JYJbQFGXFtYYFh02v7FGmZO3TPDIQNL2/G2No5RLBnONpeKpJ3+jMZ
         yTw5wjHvd8V628OCJ4IU8+MKrs+EUBxl63LoObW1ylqA3axZ4rzbCWtaTdZc73dX0X+4
         yDOTxlvoJ/asJRsdmxYT5iihMOsgXeVgVndwJ/cZLGC8GsiEww/GTLvZcu0hv4G5DbWz
         DveQcOtXzKLWYajy8rq6nGIWW80XWxrvFH3p3m+AKZtJFpbEAlyPYLU8K4X2U9H5V3Hq
         55SDxh9PkrG0hgoLoYJRzqWf8AOLe4o5RmFn4tIrjuDyh4nGvS61DufJrVWWCiQ0rsaK
         ul9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989784; x=1795594584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=u7T7ZyQibV3DTT47FMkhiqXsp0Qe/d6BvL01gfTyrdM4pFnOl0gMB24GNbn4t7H+6X
         BkUzNgIB1aTYJZ1lAAN+jj1ZBAOyzlWfXvnCShAqDSHqIn8QOA0nMBK2t1VEkzPnwxt4
         j0XDfr59I46GlwZ3wjOAecteJFJ/rsxTBTfY2VrsYXaLMJF/KU5CPwbuYt/7vkuokton
         kiLs599MOnnAPhiJbUOFlUHX4Kcy6f5fM8m+y6xIBpJtG7W7igGiZ9UsxFDu1VIz+4Pt
         1kvJ/MuyC97Xa4Mmm0VMRXQP/IeTOQWyFCvDlaf/S3WhQc3wGcmm0llo4tBFGAwQl4Y1
         9p3Q==
X-Forwarded-Encrypted: i=1; AL+hErGCbAKzbIk2mFCdNtKDA4UuRM1z1R02mbINbzuZtRugeB7HkSWbcPlsNJax6cawWV3J0c3C@lists.linux.dev
X-Gm-Message-State: APuU4Z+bjX1d+pKIojsXzTxF3X5FKcDtjtGznyKum46nqrQTsM/Ri+CJ
	HEZxz2rWL2+pxWzSyXS2ezWc4nISc0OpurcniscRMQv/HHQLGwy6hKkTAsaH4f+26sB5dvyPkrP
	jeqJisP2wpMDXkmpWKRDS5qzl5M1S/Zmrfb+D+5VaCUvwqGi/xEDXoVAm
X-Gm-Gg: AZFdTZfgm9MmBRPJxWr54kFMvCYMggDGXtRfebCUqJtxRHbAJm0RdFXvBOTI1pWCOoc
	bDMDF7giLG+1NME08KSGLQX7NUrgU0I+V6Ux46oF2R1ZM0TeigckRoaYu0leRVO5bZWMpDQEbIc
	7OoPfWlNJY4h3Ql3glghFccKV//SvTWDFnWR6cqckwsyike+S6mvlqsCIUMjuj7dthk3UIiQf/1
	B4uieN3crfn6FXaG6DzaCFtKdr91LdmR+jY+2d0oImsU/SXKBm0xT5/y9H0Jl3cU5JzBbLG6da1
	yhSI4Iw6tAPcmLZK9MnUVwUMjP0Qu5xnOX8GMgakPDQxctlfsa3UT7ZWgQ/qCn83NrAHPboUhWz
	dPyFgqx+dDju/XDj3o/i1lzpVstdE3riqpVpudHQ64FXJkItUWouj/jrGChkQjuXwuy09w8gfsO
	/aRAPd6XRV5iLAISi7qcBicWBiB08qbnb2cAm1FrexO1CIZyFtJCbysY5xZwaMZ4Z5c2WiNjfEW
	Q==
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897031a91.60.1794989783737;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
X-Received: by 2002:a17:90b:3908:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b3d07cb4bamr1897016a91.60.1794989783284;
        Wed, 18 Nov 2026 00:16:23 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:33 +0530
Subject: [PATCH ath-next v3 10/15] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-10-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-GUID: epRX9C2KEFEmpvgxEFLDucvc0k79Mi5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0GxC5Cn3Wd2c
 2S5iFyA1PcDkD31+IxvqsAvE1t9QiVN4Qa4U5EjuRIEYdbgkJh09qNJloEG5N1qUKaFL5N0kgC6
 avmmU2q11CW//mtIicmxmuqdAki1WVojWXesom+t9In5Hv4lA0vWFUhmcR9Aomp3htk/sv0M7oO
 +XGPjMOEQ+KplFOu50qqJF1oHPeQrUrI5dPCQLgLUc+lpnpi+JSEaQpd3zK0A1+hPCZ2tl2hlur
 GGSm2ipoKdt0861yM8XHNIxWectflu229293WtyAWIfPKpW6hckNBolyAcxa1dKdoJHRLvB4wCo
 WDLZX9UorI72OjkcYxnWhQJndalpRAwdeQrArXwbeg7pxLARaBF69vhDyiua+dSltsNnG+vpCFk
 1LGablf3hP4HPFudn+QbeGJTIlrX3V/ss6b3qfgDh5Lkc2ySNakYe+f5tRhAJfing+sFtZxZvz1
 +KRsU/UNXXfrXb7uQCQ==
X-Proofpoint-ORIG-GUID: epRX9C2KEFEmpvgxEFLDucvc0k79Mi5c
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5ed8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwShZhEV3UOyV
 fy/P7YfWhhbD7RIId02UtjbZlSjyqh4GElH5D7vid7ViLhP8WbqhdYYk9kNqzxxQ1w12YvdOOuX
 cg4AV84ENGIEsLtfyr3mYcXUJFZMQDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

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

