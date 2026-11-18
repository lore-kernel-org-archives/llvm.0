Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989807;
	b=ajVHv4LvhJ8HyvpduXQb3q2XFTePI2TcxzybqfM2GbAHioRw9XveblXNtRhs0VeKKFCg
	 dYPnp9H/h1Kc0+eOsF2gt9/1VlXhfMGyP+Mc9VvseAb+26r5xrtc+Yoa5mMNGTuA4VjR9
	 q+APdqlDde2/cYqOy7f+X6CRp/a4K70y7n3cPDuWBgyWOIkHKfq42d9C8iaqOwttkF1S/
	 mZ02zhKyBJsz7/AO0VbAmQWHIsEsprDPn8JRdQk/BpoIuJhpXzYYabxXybJeu5N+saEZ2
	 b6ZDZTh+2JC1fbpPjKqjoh1XxG4nE2A93rylusak0Jo5Fu5X6wJ0e3XpkS281QeOLAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=WJMNCS2CbqrhcLH5NFT2aRAdZIPc/3b3SfWDBVt/Iu24GlJymX2qljQ6k52aNzkWarQx
	 WROxaKs79+kx8ExZ4LJT698V7npxoDoN4naqwWJzD6fiFviOb87S3rQ2lT2HI8c0YoW64
	 RKChp1KE4Nc/3A8+k6dKmBmuF+VIaW4/lxsM0LtXVhH4srNjYitdULMfwGlQPLV4yj0WA
	 rCduefB4xnmuBAuPmdFELG7SuUOtG4CrQ1Ds4Bbc9jxicLMG18bqEgYiuueuy51ykMANi
	 Rsg8TC609i4K2/Hi3SpI4zGU1xp93UdlwAxQPWbpAl+E8ZBqV0WVzGPiSVZ24XeyA9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILQLY9H+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2760A2608
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF2760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILQLY9H+
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1cu2106311
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=i37Fqcqr0WtKm1La
	dCTCT8Q8n9GLoaab3+q9uT7sbKLcrOEZiKgW5mGoBoPWE53ksCBnAK69W8bU5Ffr
	zik154VIWhmqetbNcC09qOrkMhOv+enxhywW0B4CLNbNeS4zAH3ZsILH/dFv/OqM
	vNi7jwugqr9VuLLr/oGInFgcswoHhixpoVkVeQIK7DSNNsS+LT19SFrZ2onZsA41
	pRY7UX+TE6NJbmahpIVzvkCboy12o/SYjitHGvSR545i08N0x4V0Jjoxp+69NrIY
	I5jGg62mE3/gHFepn08/5hU9Q3g7JtaE/VBLCzrMx73jdaQ9vHXklEIEcJEX5vXP
	3HpHRg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sxqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso587740a91.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989805; x=1795594605; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ILQLY9H+Sx9LdeNwdPQqoTmyB/EQEz1KZjHDJak+hZtUG69FrT65Ev35VwMD0nX7zZ
         xSf/a/iW3DAnV5NISQwWTxkEnP4NG7BbGRBC1h1cFgKPayYkhDQs1wcoSweX1owScatA
         UTEE/xJvtrydqXdwbbPtpvgrxAWNtbPwJkktvawTvtm5ajsbh69egevW8jGlbhrROU/7
         gRKhzfskcytVJmdWrVAyThvUeeVYrQocoSS6C8Z0Hx7Q5ZGJkpbXHV+19F/x215AgXvc
         sa8LFu5yWkoIwPv/5vweTYuCQj3MVI8LeimGh6H6TYTQrTl1zVglhzo0Q+eAtFrwGFr+
         3gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989805; x=1795594605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=0BkZg3lgUCvPRiOE7IO/jb/vRQ8WPl045VWGAnifpOTmtgzH5Z5ZaA9fA8SvLqwdNR
         l930qhchUWMDObqqTCeQN6edYVkEkYWnrBsA3r9XgboCTQRY1Uy4VcPsDZ0PKDsdnsQm
         gV2NU84pDTgqFCfw5fe6bmwSO/MceDNN2s+ajlbStmcMQMmRN09liHaVqwuqYjmLeiBW
         CeEOWrShNvinOwtOdVZY07zImnQeByUO4s284ud/QYtngpGeudOvfMqD1W5wnBEEXZ+K
         QCquPcUVGLmkqNQoL8sIESn1ZhN72JfGkNnRjTi4Wr6Lj4ln9n69VVcDfnGHBpyxb/Ui
         KN8w==
X-Forwarded-Encrypted: i=1; AL+hErF31YAD1jfYFr+HH9CFankcvjxwK7OkzjFy9OYoIkOwldcZzsU2LHAZkmaaAmA0ttoQMbeE@lists.linux.dev
X-Gm-Message-State: APuU4Z/XQttzANpkgtbaxwqPJv/55VnPeAau47AbW1LkIG/0Fvqg71dx
	dtMH+a63PuvdR2xAqaKQgq1kO9AqvhohN1H0RJYgZ5BsUCfaWiuEVIhyPgqVIzTcTZG+yY4eI8R
	vJtdAKVPXD2uTW7APomuXz6JHj7qiQgW90ttSnsQLEYazAYr8B5wO11yP
X-Gm-Gg: AZFdTZdm5EyBTsMnxU2xCYEcRHqnPfIZ9j0NR7Dcm67bTcjmhvaUumUdrRqzajxiSW5
	8LgE7bi+V15JXqMxNxrbWA07GDJlULKwv0El0kzqlAdTk7s2uXtf3Tk4fQtnO+y/eWKx+HeqP3b
	bqODPK+/HntXf5knLBVvZYQvWN8FIkMqgnm1JzjU/9EpSCAjygVINwZ3XoOwnk4za6/WCSb+fmP
	0AYwZ9sioiC+B6EBBSATapHrIoTWJPQH6kN5yTaYal9+3SZRXnJxV4THkvSsEckHrh2YpsVWXF3
	RgvCFIAwRWIANKYxNDFdP6u+pH+hhovsGkYri820C23cwfxSVPZgnIs+YEtxVwq6bPh2BwEAfrQ
	18vVHNn33JcaG+TkGb0nABpf898HTt5tULSx0x5kRQpqeLkTWKNxNz44T/PxGm51K0PC6OdOByW
	ByprgnPW2nK0/0ZOc+LTsaLFitdpi+PbOymGJcMIB8G7SrxtqozeYt8WO3XbBCan6DRktFTunHW
	A==
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115722a91.0.1794989804474;
        Wed, 18 Nov 2026 00:16:44 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115693a91.0.1794989803982;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:37 +0530
Subject: [PATCH ath-next v3 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-14-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZtCWxRqZsrcrOvD9mfAYlun1h0k1NxHE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX66CcNuslSoAq
 e92KgzBeAqh8ZadHgC6qAZWJEZvTUVdlw+0ympbBZwUzv2kf7ANmksTSzCyMo2dUb0WyNAKx3zm
 bhK1kqDBa9mUYJiobJTBAnUFyYMEUE0=
X-Proofpoint-GUID: ZtCWxRqZsrcrOvD9mfAYlun1h0k1NxHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX8nTTHaPFJGkP
 XDX0EillO4+zCGP+J+OpI3q2ytlPjqW3eHZKRFyLwBHLisgY+kVo48ncQxV0lLcfvQ7ON3iwDHs
 nZiCMQdliik6E6EZCA/cvZeY1sh6nzYTBuVZFLLutb/hZkcSWe/xpVzSPDzQnR7Bpmw6XrlfehC
 wbg6x/NwwoExPfWDmqL8RzxPGUbfwVrVRiU6oaD5XeQgcLACfEEYdD6PpxI8G5D9oWfVv8URHC4
 wPDP0oPFpFvlkB2UqFxzniYUU6gi36eRXBPcE6ZOtTOf+oH4I/UUgnESbdGKhqil39PJ+eSjrWR
 8BNRZ0VUpjVUgns6Los9LxxX/wHe4d65rSF+5BymXNFxGT7y40rnbGvd32FjaGU+AwyUEIsXHRs
 MZpZB4jgbaVcayXsDb3iMxJkEFX+YTBjTvvXZJv1+0qINvHxdjRT6rH4oLvifFXA/MMwpLdzaru
 IFzyXiBR+2Rmp3mjtrA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5eee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1

