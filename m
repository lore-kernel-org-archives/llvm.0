Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982815;
	b=qkZX5l2nAPKlySYzu64dFeb60BUVTttTzxsK+9m1GFhLIQZS5+UH3gjJRVt9nja2lVBq
	 x5wLjQkzBVmXJ3wg+VIh7u3s+c/fPBlh7lqfhV5d+AB5RoFcEl+fxThCiYPni28hPF0nq
	 CWwdrJpewNIGykKX4M3555yNJLZxiQG8eiI4QpwF+rpqCF0a9g7u8GE4TZXHd9l7Q7kyE
	 xe9QgUEXThwDMzQ2a9tmyAFUUSEkRMv+C5f4z7kzmxh84LqVZHBcGyUQZgJiDMuU/pJ2T
	 yAxYHXCDSxuEPLsbuVrHF9recnmThrAzu1a+sQ8LWgvACmgAVHe4ImTMEkOwaqeVPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=ZcqdBHIeQbY0yYBM1kyUxHv1y6ZjH7W6y+Z+Iv8j0KQ6dRG354/+d5gTvJTJ4X9k4BA4
	 tFnicj0juI5L+WAjjCNUHIVP+tc3BkIDd5nujsn3OT9/vLghC23xdh5TTGeXmdKMesKAM
	 h0JcKe7KR3RjtZmBxejIXiMxi+w2d6ZgUs5JGr7qj9fkhV5l8trijdQMxWIIze8VzUBGA
	 dX4rjE6GIeimaFo55CXzqB2VrgvEv8B6Su3z0V+hMgF+Kw34FAbKdAxc04B+Fn+EJnHi+
	 MosjqhQQaNd3D3pprfD0ZMsmbOBlm/9njDGZYWyApAVy+IaD5qtQWAzNt/5LIPwN4lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPd5xn2l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eh6ZkAjG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88092606A32C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88092606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPd5xn2l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eh6ZkAjG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3st764118
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=pPd5xn2lZWyPSzzF
	TikaJfsvltCor137uEgw10cH7SRjWWpJ/5g+4MYzNdqUC3XBNAfU8Tzl/5LBT0Z6
	/tmXoo8Dp3K5SoA+ce7dw4aoREQx//gJYf2Zl9xKKCRf/VWsueIUNBJCEgpCNYVm
	Ub9jpQgEf2K1ENymZ0AX8kCT7qYpVNXvuwOBPQ81+lkLGYNs44abcXZCGOfVZ7lp
	RoXKqrCUxDZ8keq6d8Z7Nf88YQh5e8vCDK9w0WPJJSRV9oz4jaU40NwXNKr0or4B
	mY9KdoDGMagmmja7BitAtRiC3RWW4XcAdVJWqwYonw37+L2oYxm0hQ+WBPH3RrZI
	ys7H2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9h5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so502924a91.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982813; x=1795587613; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=eh6ZkAjGFqr7tHmWfZXqANMh8v+3HPovF8xTXku59ipWwsHO+6dnB4Fi4dMxSGTt1j
         60Jjnfo2LhsYtLnQoUIf5ZV6DuiO4J2GbBfL63SG9BuL5ewaQc3TGEOdqpcCl2bsTX+h
         vuWJew+tP2O8qSdRTTmaiLIMDUZkwojEzDBUPO4+5x1PWjowj+zatTRDGOxR6RD6e6LJ
         QK1HN6GCIg6ZdC3AjW4Af3a/CyBHFb7oXKWGUxDoUTNuJgMqlomFH3OO6JbbzlZJpdqx
         xK7xA3ol834aM1tC2qXWKZ3HENE67ttj87Dup9B5g1LQ5AI2RWnDcb8TmD2X+aOtqoJD
         oXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982813; x=1795587613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=njTlFE8yIJrDvB4mGpxq+pTnCrNvTboP6VFqSuZa/n6Etifk6Cl6WmTaH0guqXB47I
         fHrtnc5KTiMp0+x1oMsZMRZIsL1F7Jet/nUnwVWMIT86eH1KJE0VymT95C9ywPQpzGrD
         OOqgQW1CTGuR1EOyBXJJNdkPrkq6V+6dKf5WuNssuQ3CcFLb9yTN0W0rrE3hsskju8C2
         cb2Gx7XduSKyhCJOZ26IrSPrS7bvSQt6op6iHnRVIWEIef/Ia+9IPWXkz1kkTC4NeFvQ
         +LB5kRLP2X/yxF4ZLsD0pakYK4yzBYY8bqPZaElQKJO5vdvpuM6VK4X80Vdv0TBNX0Ph
         nPGQ==
X-Forwarded-Encrypted: i=1; AL+hErE8x0lnXfHrkJUN8/lg472KM8wFoduxjjRWQrs4Lt6/RGSflnKSs3fCl7oNQT76r9/MlDQQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8S/shNhRqvI0z66hsH9qNSYZ3DN2d73fvoty+NQOcp5mb23kAd
	Ym15YPOXDfe9LvJYbUGEfnqoetzwzMWnxluvxPKAZOvfAkw9XIGt1N+fMOmBceuZ3FTnDwcDgtJ
	M84O1bm03MuKpEMsdb9XY4kxQqkjRCbitGkVpALAVslf9DU7WCsTQ3dOq
X-Gm-Gg: AZFdTZeWPZ90o5sc4Br1PoMBFfFYqIlGkYCYjVLtKaklC1ZC/nPMVdQXx5ET44Nd03C
	HfTlZ7KIe4ItMTccge0CoPqCzwoidpi9TMgE75+Ff4oGB2/ER7dxkpdgENO5hNlvNCGKhkUukUa
	zjiZjq+p7lqho8cfgqggZ81du5wV6S8JUzIKkZR0rBiify9h3ViIqQeQ/OvEFUq9+E3Fn5mCYJm
	fW2e2DsrOcpOaKMg8aHEVumTie2WgtysQ3U0S0aAYoHfT0SlJJDc5Ca4TWSvXlF58gdVE7xzm7K
	aEs5iGezVEN8zb5BwQ6E7IQacZuqRb8d3Wy9y2Q6XdxxNLZLB1bIRKMFvSuBFGxQypHR489z2sK
	9qVtZ6qPgNkWAukkBXVs1bgKFl4tNgBfCkFDfFcueJt2OehqRFNuYsBPI89KJN//EjTumMdzJZC
	XqYfwbr5gTkNTIAbu7AA1LF1ATCFujFw/pjFTAW+IGhC+vxawXE+F3Ityq9zpIQH65ZPdQiVIRP
	q8=
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743258a91.21.1794982813034;
        Tue, 17 Nov 2026 22:20:13 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b0:91ce:6726 with SMTP id 98e67ed59e1d1-3b3d07649d1mr1743240a91.21.1794982812539;
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:12 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:15 +0530
Subject: [PATCH ath-next v2 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-12-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-GUID: UE3OsE2d4K_UC37cY4UFxorNFLvtTBrw
X-Proofpoint-ORIG-GUID: UE3OsE2d4K_UC37cY4UFxorNFLvtTBrw
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd439d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5UdHFaj06oTZ
 /DTY66AYmsCsApgKUozhdaTxACIo71ESRL0SEdo3HjIi1Vlzxz53Xf4BPfQBOSj8JYqAP3AcLXy
 0rvm/PgY5wkmFAQUOZIuoTEGLU4W9gI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX4o5xT8c4nLaQ
 Y0NJSj8V8kHauhLWFl/ePXHfvTBBvizmCQFll9FfX7WFKFd0W9eeAu9XRAWG1hiz+ePVoZX6qKl
 bSGRgKnQsaEI9TledaSPKAPO6JuLgJmj/B9MfzMHLiOxGfnqPV4zJo51UCw5MWqmMJx0F9j7Xdk
 rpGxYZVE/TWCN7X9A7MIdPkor5XAISPM31cQ6SV/rbrsp9+GCc2gN1sOj95tzhj2nIMQMIGwo8Z
 UVAP2T+NyizUBo8Mt0HRyVJwJqqOkLho/dzPguwvRQP3eZImJDAvOMpHEyPHpSh3ZWGH5obZK/5
 P/f7H5h5u1aMQsZXjm0wPnkYScUdmWuAEv1oxOSOgj4rrsGe+MsG90s1qGSe68MauBANtA2DOxN
 16KX9G2fN40X6PPf6HdzwuRJhC8d+N3KCgT7ECzdCuKctI/5vqmHtAwarVw4CkHH1Z+T7wveJSw
 cMZ0PTwSoNaPkumXp5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

