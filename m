Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538666;
	b=Zkrrx0+pLLd/DXjt2bhIVRbwwWkui441RuV3Ca+HNQ4x7p2l0ify9IQMNATyTNV7mf12
	 h5yb8Gpun6yrzzk1z6dh6WO51z81WcBcwJ3TKFKbwOgkloGEyYlBxwRGKEuMTgAGA0AXd
	 koNj+b7oTEBc9Gzz/+5kGt2Hb1OkqdU3h2DA4nWGuL9b+SrFzGDZFlCFzl5BFFusrxNyN
	 U0DZJobHhPfr/4pYLgqydM43mV5Lmq0gmhmnyFEmS52DcoN8VvfgUEjEH5S8C7iXye5ma
	 IhtgVN4s501+/NkfK9o8UDN7zX+FyAu87hEqHithySs6ZxTCPtteqO9PzypGqy7zrDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
	b=hpOyP+HWsQcRf8Q1fpXFNkweRyie5sW5uN3/ivknANSz8Qi7ADPneejo1rC8p8A2VFvk
	 EvbyTuPqxgtRi2enbU/cez3QDaLDE2rL9uYuFotLp+y7m4uH1ozGuymPg4PzHai4EkpaF
	 5omu8B27ZNvCw07BhnQqpPiNUnTIm4LqODwTd/wsODGiLPvzs477/n0fBedCX5QWTtimy
	 jp9zAqekoTrZYAqyHKpMjBhePpfagY4MXEG9VWh45w5ZC2LHIu8L+ggQbguu19Scn2v0C
	 Jlz2DuhyTqrI8sJ+ERwB9iUOuRI5UXtgXRGXuge6mWOnYfuqtij5vS8pVKe45a6Ch7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNevnlX7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89453606A33B
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89453606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNevnlX7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLeKp1332056
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=iXwnYJ5fW9xOmc+g
	7aXFmwPg/z5qHfsqTJt3QKfvtf5geKOF4Hjp4kZrPtqRdGHL1c/uw6pySXrhFq6L
	gFOPW98tSyYWj86I8kqjdfMMqNWRl1TGXCpTBUXzZ55hMPsCfDGEfAG8rNcSleAi
	Lfe+pnyy1kIeDk7ElD+WzxC1C4mE3Wk/GnKG9qJ69f981dT8lqfJxGkGfxVq62dK
	oIswBrUR6p7V63fKlQQMPkMyeiyIYQfRk+NO4BUVmNe+2aHM4WMAtJIHOlMCWTcW
	452W2WbZFRp4qNIPhgT9kbaFeTDWeHqtnhwnE8RdBKqUnDfgKAY7xDjN7uL8c9vl
	WZES7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3v7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso5363440eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538663; x=1796143463; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=QNevnlX72CZSO6S/Fghmt3VfnYUG0X5jgTG6Rvp4uT5MdmYRueoxKlw2KK5pPI4/WX
         lUqKQhClq/+l01qTCt5ZeAWX3PfkjflHrQY47U95hxx0D4FVSKoru8BPy7kud0jvnR2x
         K1nedYB4xuXyfcEeDwNj+6fbjst5++9cHu1AF6rp2maX0zwN7SvDMGtxSkixn+E+J6Wn
         V8OFvU/ImoNG49l3v0Z7EuIWqwDvP/163j6RcxWPDrQMVdkhUdL0eZFkbuA5F0lCVZxu
         fbCL+tQzu+S0U5CUKIm8iYpgVzQpjn54oQIqbx94LVFM/QTQUWOQQTdWo9HHZFgot6jg
         3Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538663; x=1796143463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=2MqsCxaMcf1kvzhXQZ4eRtwYlVHhz8WWuLN72ZS2ssjln5WQi25V19CQmHF+Ggkvq7
         1mIlTSn1k0GnCUr+IUvaB8EvOMUUrAYByFd8KapqXTd/iV6/F9nVAiEbrGlzYkxXXQfS
         P+nvbH0MaFHngdVMDigpl+VnO1ie8FEiyCkOXdvGjZpQsksXWvkG3hcNz25y9I4uo0pD
         wcpYbXFy4OvUcCxSrBz3KrHm8Dz1u0ZKk8kVjQF1lZhPBPXlCPMs5AkZxEz52mQB1m5y
         43BBUCYsf4Dh9PQUDX6twrTBVj2wlazQ1SC46WaB5QCgqmzhQ+/E0hq2m76OQteHxd9L
         T5hA==
X-Forwarded-Encrypted: i=1; AL+hErH0hpsKXFEIEV66G+oTO1JPsVkgNSB+1jdEKKAYcnaZ71WgRogCv+rXzdczBwPgqvpliyGc@lists.linux.dev
X-Gm-Message-State: APuU4Z85f0UX6shzUG17bvfvO83PqCk4ntHGSJQ9qjutiK0Mb2n4z6by
	b1xXrQsxOUFvjGGYXf9EjBJFer/sNnkJ4FqPMlYKyR+rBPeAuyzL3+dtcqksP5l1ArQ1i8bwIQ0
	OZA0vrwz7yYU6wQbzIR3ktjr7mCZk9t1Q7thbvv353Lfd2hSPHJ/wN0rA
X-Gm-Gg: AZFdTZdRZ1UijaDZvOTNADT2C2MzbrBfjU7R1/xeoPfkKfDtEyhWb8uw1+9KwErUiDA
	E4NadKOYY5VCaTGCgZHOAIEKpxlgaZEfMRowNvrerQAuYtAa7UptA9DTKNB4VPwiSz36im1DmnS
	sBcJBmVVnTo8EqXpLwRfUmY9psUXdoxKPVuoWoWsFi//F5iWcmr1hteRxv+eFNYMnoT9dZN5iAn
	LTctmlY8OYhETi+IXrw9sa/+XKTYKQIrXIr2jgtPiaHkRSdCY4aT8XjTM6biy4zMJZBwJ+ScSpe
	Ru1pIL4KnNYWQX/QIuPBPBFj3eXZwHqJc9Bp6P/OV2M/FPAH5NRfc/8vp9nR3chFUI8nQ3TgY1U
	YuwpIkWLkwuS5rzYHvxmTIfRZRx42NxWCRwXDS1kXTiRRbyix+V0Y77jDf2P4JbzQzVuEpXOcK3
	jxGMBjBZPNrrQWttH8iDw04K7u9Q1V7FxupNEslm9XB6/y+e9tI7TwpZ6TBlZcOfI1OmPxjInY+
	uE=
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781539eec.33.1795538663017;
        Tue, 24 Nov 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781515eec.33.1795538662394;
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:35 +0530
Subject: [PATCH ath-next v4 09/14] wifi: ath12k: add Wi-Fi 8 MHI config for
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-9-1f5b87ece6a3@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bee8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ruy0OlkX7TcMGjI_RJm8p3x05V4I1vQE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX948RqIgbK7Lu
 /ppgodFmGXlaU3N1GHsHFkjY0byZ+3Dg74ALg5Y4DXQ9crXM97yME0XIGyerNM9i81QxPTwg46T
 vpeyiX2sah/YGDnLNuc/xMeIU6rCptE=
X-Proofpoint-GUID: Ruy0OlkX7TcMGjI_RJm8p3x05V4I1vQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXy4m2gwasmkwk
 kUYnTix2elqW8SyTy9tPuNi1dKnxpQSPGKa8+pi/nw5CZSc6SsotqGfiH35lsdmIRh2VYhn5LSc
 4coO+z+HB2gMVWSOpC6omPkvcLqlnqSL4Fq1zt4YHxOfZtkzmDPkET9UpgEcHieIAdm0ehzEPku
 ZYLr4Da+tf2epZ5vBa6c2uY689D05SLBAqzr1PqGJ0QINkn0hZjHJg4dEWRuJSlqICvdGXvXAvy
 q3x9L6IjDf1EN5O6eq9wEyvwdmVPQXR+Bh7XN/zFF5GtFoIEN/s2x87aHlhuz5TAWYqfC874scO
 0cu+603DCf4ANIKMl/ph/mJjMwvUjS4aU6KfBoy4WRePKj5X46eMYocQNcBU4hhkQXsex+qOX34
 OQcbnxgKT6PDqgPevb7XgPddFg94rHjVdsdmtzBYjuPEHQoUWlBEBm9iMr356I5PwZCQnuPx5GJ
 /X3ShibbD0TjQcjhQ+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

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

