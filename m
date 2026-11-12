Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472412;
	b=s3pT/9758iNu1sq9wDZdfpOqXgD/uVXKJScvnvShFGcw4U8/6duSzEJ3YUicvdLb43LW
	 40ApFvYp8hwfWp6F7tcCj1A5M2YGvvYIda+vxwjYQUP5UZ0uwbYSz3xXmXg9auiihav9R
	 aAjwKFrDk8LCeJU1uGxZt0tqjzzmGqYRIzjXNM36vwAVmWbObQeJzNfi7aoUdNOjsY0wM
	 hxSGguBnC0z+alWzfJtjGTf0pzFOfDzxybXYWoEDJdS+CnfzuuStp6IDV0w+g75d0zlrV
	 LxnlkgaqLw8dlUCZeUhmJsLW1Y96M6tEbfSdt3BuoKsuxsoIhdMGclMeQSIfSHwTFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=CrNkU8DxJ9Kci2O6NCj6eU/A2JgXj6uJ7UPVFEl7YroaZe1Nh2utjocFdMEvFRvyPcz8
	 pSNodC4ZzNWbcIdy5P/EMyw4U2SKEu9H0WXr6V+fWlEmNGCqZ/A4CX1zj8XZQB1K4q6EP
	 btTgUNMOGfGZ7mgt7dDk/6FWqq8brpyXtqu/ntJC4dOvidey4jeZ7GPMPMwjxfdaoLGRU
	 sQvZu6VRzhuhsX/F81Y0oY7fnr41G9oC8ZB1M2wnV5lqM+bSzc+PRnr1/7kbGpgWzAtcl
	 o7IWnEZQ5uZJNL78UYCg8NHGzxxc5vwcOoHsV2jy4sljUKEM47rLTGCgIJO3HbYBPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YjHh/NWS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbheSeL4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C96071A5D
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121C96071A5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjHh/NWS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbheSeL4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nm3u442019
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=YjHh/NWSxVqpHQQX
	6O/19nLrWv3JzxjaKQ0N4A59qitzmX81mdV3g+XWNi9RGD1YURuekKgBGU4WkqL8
	msqEpZX+c/3dJiiuXE5nFUCrEInIP47NEqeLviLLpiUSdK84OOqKvcDS4SSvKPIC
	uvHBIsoGQkRTZQVeNbz/rNJuyqWPlfbLjnCpIH9NJhjLZy3sCiFwlB1DOIWkXgFx
	TvpSx85jDMwU7WfKwmX/7b/eSyIp6ykyeV7kUUU7R8AHYdJm2JJ3s5MJGJWKlq6D
	q/N71X7zNwRC7RNkn/9NZr8P5G3Wf+WZDMNj+yX31xHhCCN7ds7WrS8oB6hWFChu
	QdMDpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0k54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so157453a91.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472410; x=1795077210; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=fbheSeL4Op3m3RPN8Lf79rLkRBiA7e7w3awiOp4vywc4BJXdmIdyWZ2MQPWmb6Gqh4
         mc4WZRL0Jz//kibMzuXostWqZQISkvihhbE2JeTnzzcMhy/aogzWZt2GwbFVKIEblX+U
         orVhFy07wPRtKVuvf1u0V0VsciaeoMEdd5+buQZextOBtBj6358UdxFxHXmcH17Sps72
         nah+GlE2FHFghNt9A6F2W3KVdeYNPqoVKVMxHBWRhO19jXCNw3e+uLxcWrBDQwVBAd5+
         TJKE5VdejN2LEA7vrZABJ2odhXRxu8x8QUNQpaxGuXU6hUTePxNE2TTxX3irzENCvFJY
         9jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472410; x=1795077210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=YWKecNc9DYVD7ffzPY9vMOkYQiFEmLVWK2T+m2/tUd4K43QmU0+LVC4i+vKndPtzt7
         dkEGpD8inooNnfmD3QJHzr8IH2YvHxQNZsLo9tajZAbxgwNlGfN7bLeCIy6YDh44awyQ
         FHsVEvgK1WNy+rl6Mgw12FF82HsYc2YKl06iKqY8dXxTYBny1AlP6yZqdrfoqm6AAvWY
         0w1d178VeEmimUGRhQrZIOtkAtsJH99cXxbT0niyq1DSL43ML1fgHJbwQXdve1spZTTG
         2ytm6uyJBSH4Ey617XNi1dJEritjo81vtE/AsKPIMiSHvY4wuoiTKplaESwwO9t3ryLb
         +REA==
X-Forwarded-Encrypted: i=1; AL+hErHbfwAIB8Syefr8UY7HssHxUzp1RuTYv94fzSXvHKeGnGAFDq0Q5AmSkw6Lun9xB3qRpWli@lists.linux.dev
X-Gm-Message-State: APuU4Z+zQMUGmCOqDxQYX27dsftwcV/BeLNm1FmkkKk/6XTj1AEZhBnF
	gc0n/fRNwSC4wf+aYtH0qdXLz7g0i885BwZZfSFtUjlIanBd0YryfFuJyUcCAsosATcyqu+6ONy
	RcJlgazBmc3lhA4MXR/QzAyG4SMz9euw3tF6Sl6uaXamr4kLNXnAtfm/T
X-Gm-Gg: AYBFou3zMKMsKpDHYOrHmh2klEgCHsdp5S0RQKIezOE1bf9iH/6VvBTpvm8H62EX0al
	VsFYOBB+K30u/c0JpDD3LJY4+wnAs5gAL6IAa774yjFdOgfXkiWp+6OHrNNO+IWB0YtxXZTApkn
	RVpsY/7OlBGqFhvwYcoU4sgYZ1/zk/YC3bq9ojZtsZhN4rdQ1HTQE86eATLLupp6tsIpZ0YS9yt
	EKRZr8CtZ7My0qE40QuQV6xTiwXGzp/4R69dUhluWpdsRZe2UKExhzTt9tIdjEo3/haI0MAqtG1
	BIQe47EUZ+r+4ZQJKCWsST6+x11/Vq1JWXDeifMZXcG80Ei5Qxz5kWUktkdQrYuDfDTCszhQiU/
	/dcB9BdldXOMw6RUYD7/3jMfo4iIpEoYh59Tk+JNsyL8UAxZ4OGileqdGOdtREuZBTfO68DNTgK
	zR/u3QD1d/Y+l2hgeBq8SBHGNvgFaZyGx/UtO5113V4k6ECJIByBOitx9nGqD9ZKP3BzKIKomRN
	w==
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671814a91.7.1794472409306;
        Thu, 12 Nov 2026 00:33:29 -0800 (PST)
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671784a91.7.1794472408781;
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:26 +0530
Subject: [PATCH ath-next 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-12-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8hp2xoUhmZDJn6n9vKdzg7gzTc5gukcF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/IC/v/Q5G7MX
 s/ouWsXNtOTNN3V4SIUPlH1mrx5E0M8aRpgWDH1yoFoFMItSzgPNP7pTqXsZ+l7NM4w8WYjXGWt
 isi3Tc8D0n47MRhIzo8zk6doQ0Yg2SI=
X-Proofpoint-GUID: 8hp2xoUhmZDJn6n9vKdzg7gzTc5gukcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/3Coa2CfDzLO
 pBnlZXLjOBk65/S5+N7QHZHodEPo4juSMXj8jegn9W2HrBFlib7HD1TEXF4GoyOWJ3kseOPTKwZ
 u9FkkDfApRwaFzCUmz6y1jeMoyqZm3ZCdC77U+1L3L8CNs6dpdYwCX4WyS93CWE2cwapWL8rc8J
 j9sxWQ9mk/mwI7E52j+tzhRlgZQ+qDsTvAQEildWXrwAh3LFmj5TvZYIoDNGTcl+wsqEEvRkUZA
 NmTBzcbJWUILIobEf17S5TftL/6Zjoyo9wqUAsbgHrsg42Dt8mcho1p3eNV8vOxCOiH46H4vI8i
 woGvv7Gf5W74NOWfpeoq7Ooq628CUHi9kZv0kAke55z64hdkOpJVBBPXDVxS9ljz8Z7XPnMXjbC
 vFV+sHD7y2FxmvXobiIDxPAcbmwJKc6uEWErMkvTjQ4izJHdoZLxcP/dcYG5Npt7evqwsTaKl42
 d88q3Bi1YRd7ZxAotGQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af579da cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033

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

