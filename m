Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982830;
	b=q0zHPM5xWgXBNbH7+uBQex147Mzsk8smZx82C/n8DKygK4K0x+myceUwZ9Ef9w7kPilc
	 aKc6l4G8oqd/KFnS9L9S2KmlNqs0DOf32575euNt8PTdBwwbz0iLHX1+rbfMpFiCafpgI
	 KNB84fYNq+dRbIEsyVtZDOJApiz4oORXj4EnY+xkjroYwjP8m3WPuLuAB//aiqB8K2NjK
	 ctSQrHKY7bvl4j6F8nLSQdNoxQS5nD93CiAD3huhYK8Xlc7KRW1BN+TAj+ilDabbNPglt
	 cCPzs5cGI2kGfJ6EJkiAZB5pzscVwQsh7AH63axm+0Jqxm3z278QDNf+4+QBmQRapuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
	b=wKET6Hdec309qDm8m7l1cQFplp47k55+WR1+oEyQBLKAO0F/Ji+3BZd0iaQ6lf6riq7z
	 9LtLtjRTxCMCwdovxOk11UL19Iir0EnuGgLxW/pq+/ADomVbqjEUF75zj4vy4SLAsSYce
	 Eu1lX5xmYkI0td74UMOSStebP6sJy6nVXZj/5iGbyXsVVuGogiLE0b5Gb+/QNgiTddSnt
	 PqzuYUeP1BFz3WTfFEuG4yk4K63K7CT5tL+Y82iQLbNNAXM1AiTuUxTEAL9IBpmYx/AmR
	 /HsNdZQAOK9t86dX+Hc54sVsb0DhpX7+/8O5IjpPnsMn6CLGgWlOBYmBiNMGOMnvFdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXVvHTtN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZNYBdPaL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED1606A32C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1ED1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXVvHTtN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZNYBdPaL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uq692383049
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=; b=SXVvHTtNrwJvpxSy
	AlF9OO6nb4C1vJwxBDsrp8tNoDtkMO1Sx2WFMTa7l8qXfSwTxn7QGlIbhQpynf0z
	saYZ5UTcsvidABxC+Z5meezLe3+reHdwyE/dPA1qDNhKxeOYq8rwW9VAg3JNr3Mt
	k8D6V9rDcJY+m+/MrZHRCfq28DpaPzH7ZTkpkViERdbGHriyFc2YCKesukL/HCQo
	/41gZxvLj5jtsh6cMHu+4xZexoA7TFydvRiCWGMMXvBeKv5GQy9+Mfg9duJea/t+
	6E5Zb+revK1pICH3Ot6DGHpNeodtXqfTwqLc2r8Q0bQgaBQbXX/hQBQMdxXaenfp
	13yf2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasjjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so803619a91.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982828; x=1795587628; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=ZNYBdPaLlhwhRRYgaZwwfp8IIqlpJlDnBjMr6S1YMs2mXm772XURqzOiayck8F1SGs
         sjE45J11vJtrI9PKUro5S2VacRahtqaruZUVxCjTEdEvfE09s+F8jsAukoOZplzwzoMf
         eYLNGQo9ZNRcGCDZBZ9Z/9Eg+y1MDzLdhhAfcleGD85rV7Ydaq6Vui9ZWcdGWGK6HSPV
         mvaXDb8kpvuHpfCdcjatVsjexFEaoxNWSZyU3W/Dae2d6A82tbg0OyxTysXGFjKYZQLc
         YyfhKqExkHi2CpSNN77WkvBZbQ1+sVN4j7gF2Vo6WEaERIPwoLaPha5Ui8jAMp5pRZBB
         k/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982828; x=1795587628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGHk1lKx9fhpkROokS8msd5mQrKtp8s2wwpEU0HQOUY=;
        b=TMlsLrA51ACQP6RnujblWgMyhNiR6dMMJMMGAe0Kjax7fxfvSkCFegrmkyPMXzPt/w
         MS2F+uTnCiXayWEO3lJ+49HXYQ7bnItiyDrnOzdoQacBYaYKfBxMX2+Rs2IrlhrJSSB6
         AyvqDQrVtnTZLXGf+NaFg/eYw4RlyS1JmLsI47+y+n04aioMPDJGY2C0eS/qDXobgrRH
         henJQD2VpIva+LHxjlKfPXsVdzEn0qtn7qgcii4RYfO532ZDvJH1hQVw2IsW7cL3M5WC
         8h9FZBtuqks6xO5Kk+soihU5c44l4B3e+HZF932mbXTdZQ8/ZGsEZY9oq5n1WCb1UrS2
         OM/Q==
X-Forwarded-Encrypted: i=1; AL+hErHO+brY+Tj2EeZClWEaGUyFm5PAhCL4R38e/musF1OrT3Tj/5L+BhdKzpUlznb/ZTf6FNtv@lists.linux.dev
X-Gm-Message-State: APuU4Z8TNnndcBoQpT4cCGrJQcNyfv4A5nJ/nUbtfwFZBVVI6VTRWfSp
	u0ASj9yuQ5oLZcv3D+02Dtex6B5pPJr1Mzbac9npZOn7k0wDfJ2Ud0PwPuAZwN4asedtYF56DVq
	RgiFbTUMngmp8/bjckFJB/4uQJKWFIjVIBBnYBSiMYcWnGsz2WZ89Icsh
X-Gm-Gg: AZFdTZcZZJGmppYO93Cs1XTgMHRWBv8vpfST2zCZaqthxi28l8eRPCGLsg8YcVG4KmX
	EpzWiN06l1iwCcVOcwDB4iexLyOv0/bcIpP5rABWrKplZVhdL84zq+GAVT/thGqn9iQqxK6n38v
	rHivMtLqXiU9TwBiREHlSE8PlEUzEc37N0Zna7nFsdRm4lhTmit5uN3B8UsVzSrDfFqxjT+u5Rs
	hSmL5jXusrLSYykTYEGSUTa+06HUDZfIZvNbytJdMuM3av64at0mqYE0gWP9pWd36MDtbGPw1yk
	m1D3sGntt0rt/Jjl3yNe5FfPEzB4sXfmfwRe1rqOK+eci0NZN/OOR9/M+v3HaUjcw6NIb7r7AeE
	55oYr+gOqGzHWWVllAWkIp/emVb3yA35lkLR9JicVm9mEyc+Unqbst4XEjxxLopCeEgM1w9LIUT
	PGbyzIZSjPLurf9BX7O1Mvh/9zxqhOaFogRxkgA8VRs1er2tzvSXPRBsz5aggOZ+387kV8Ayp78
	lk=
X-Received: by 2002:a17:90b:1e4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b3d07e0fc3mr1968965a91.55.1794982828308;
        Tue, 17 Nov 2026 22:20:28 -0800 (PST)
X-Received: by 2002:a17:90b:1e4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b3d07e0fc3mr1968948a91.55.1794982827817;
        Tue, 17 Nov 2026 22:20:27 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:18 +0530
Subject: [PATCH ath-next v2 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-15-d81a3046290e@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd43ad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Yi4xBBFUvw6BgwE4oHQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Lep4C85wc9jlMUXHp0GFfVxzJlXP1pZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX0e+MYtLMIeox
 H5JRT3Xob1KvckabjqHVJXcVSF8tk5zHc2Jq/dv3lbPTioIUrYnPXOzSnu73ah4QUK6YjxNXpVT
 OLBUGx4UEWT/qlnGUwkBhMr6v1+wkA0rE4HYzjtcAW9034igXytIAxo+Hvxm1eeucgnf5hLr1vi
 CRK5KdXeWWwM5KjDYJGp6W3mouh6lKMItQhoAdwY6nwGhicJYQiy0T+xiQAxtkC4oxTGRjOmuqX
 QqsU4wwKYg7XV+dc7vUdTfQQKTadrZTHTetSAmPT/CBx2ATncAw4qi3Qrdy37tE+ysq6yFCe4H5
 5Zmv5ATXQfV2vPx9VMyWVNsHi+rC7OZBO9Cb6kMJDgZwyyYsV6j4fb5XzRdKmqSvfDEqfbzETf5
 M4V33xSIGPQ1kMYvf72I7pqGGrn24n8hE6B6jaKwcaizbVV1elL/CD2Lq96mzhaIdWhhqmyUBMM
 BK2CQmVbjmcvGPrAbxQ==
X-Proofpoint-ORIG-GUID: Lep4C85wc9jlMUXHp0GFfVxzJlXP1pZq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9pyn2p2auyev
 uh86Dk/FMqvXu+8v/FG+fr4Am95rmr9xiZgsBcNjQ8tXTcs4IXgysH589UqFfeyiM3BtcQqDlf5
 kSbpLm7sTly38A1sZUiJblnXLmPWNm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

