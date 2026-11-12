Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472421;
	b=DnavmdhX+UzmEcdU16HjNDfcEIiNWagZhXjerNgWtj4N7nwtvEfEj/fhpDrFLhztxE1u
	 eX4b8+zuq5MJ3FAaM6C52TLDWRIsx2G1cp/j9eG9IBkjlCC786gJtYOCPqT462TpxjJ3p
	 /cKPVpJXIHbV8L5dIR1hHQOVybdeoNV90M1piMbQj0CsOtYCW1SpxU7L4tpj/vjPM598p
	 /MjQjvhAmRUVWunu9a68duxU/EdR/AAp4m7Ni+cLE9ARovmBD6bHmWiko6di3o+uZQPgV
	 lTyS87IgcZeQpWHvnWmcggI0ZZV51mC9oDZ1iSBDicERPnsieeDOGYl34QP68Ak549w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=BT8GirYIGq8tJx14RTBAbvn/M3amPURH/ePZS1Tqdxww905+oui7nDy7dqPV47u2I4Yt
	 0s0slBmvM5LZzVKm16LyLU0CeHfP8w+H0OWSgMTMZjL0f/U3aZ3RyBhC+XbqSe/YnHdlL
	 05UzlDpmGy6kxRSnJTiCt/ex9RNk+IFvWGz0c2NMQylsPd/k9hX6001g3+osP8168B9TD
	 k8SKFNskg6XYPtK7X6qZ9rLOhsOpDYaBtxggxKOC4p9+U6hc03yJiLLUvYRE0sFtNP2oU
	 d2gcOtemsehhhPRgCnrzJWiAULJd8AfMYlLNb9QXMOawAeY2M6QrLfnx/9arDGAzaeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdjY9OuS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gDTtaBM4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B54606E9B6
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B54606E9B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdjY9OuS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gDTtaBM4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZOrI4092370
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=UdjY9OuSvQm3A81k
	05cL+rGaENhnUBUtacA+EpTYh3vzW4TRXM48Dp0DqmBrTMot8rWrepuLxNoN+6gm
	eJGJM8puKjezRz1IHTUtQw1MSxxfh3bGh/fLtHVXRWoHBaWP2gc8X+3I+ZNboNoY
	aWVMErVNDLoJGlrqrR3GAsRgEjyk0g6CQW/PiAJOrOxtYTBWNDH2cqWHLTgs781g
	5B8iXQyRq6KjiQRhOxqSbbGZEx5I6qmTj49tReKwaY0FVKdIbmiocT1JOL205GSj
	686TSYXBms/+3a+aLY0j9YJA9VWVtnMhJhLnVvJQcsGtMomtEWLzJ81BKJFZTOpB
	Lk7tPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so4670567a91.3
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472420; x=1795077220; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=gDTtaBM4ZpxxvVnRwG9e4AQzqAKAqwtvPcpEGvzKuftUhtTo5IUbogFz/4gq5vLdBi
         tr8MCWGO5BXiiyztGIwPHe/11w+TyKQXQDHkDLQP4Cn4e9QBFyjOHuH3SBn3GmXkGme3
         p1/AzHZim87VwuYrV9YHZFjOMD0oOZDeAsR6AXxvcWvH3kjlxQFd4pBSvDG6DH7JdIwC
         o+Fv1Gwlpvrx6sz+RS227XxyEsjRyOU4IQWFLIIQbqSEFvZ6wtFJ2GfRD06F7gs0512p
         XM4gKDE8gkWzkqrIJ8ED3qfKlj2wegXpzwX7UmrAyv+3CTP742hhWMvApS09K2cQk3VT
         cGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472420; x=1795077220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=ZkOI8Z50mhLdtUnpAjCzvXdYgJT/DaSvRCYO6IS2ismuj/7O7GuhNBEmSscTv1aYAI
         G87jRe8ZLMZ9MpJI9ZnODJuK0pxKlSMvxVshdwXQAVLfBiM6LQt+A10TZoQhnrZE0iUT
         vaKmESclTHuRqP6mL+6LOYpFDeLvA0xf1Glxb9SnfmxKFaoxzN4Ohbz7PDkzO6ZoQY2W
         GSXeDef3I7VgyKfbVeXe3KWUUjrrA1ZcSnfeZp2CatylTX5PkOmKEuYKeUldzcxLUV+f
         W598UmDo/aFtwUbJzgewMmuaqGIPH6WvUtWd8HCsEdmlXghsG25k6VeW7SIwu6vaZVYD
         isOw==
X-Forwarded-Encrypted: i=1; AL+hErFsXgh5EFFutN4Nuc8WWFAPWraGYCglVBVRHlXgb85NPsvq60Jf+CBlnZU+4tb+1eoRlLlv@lists.linux.dev
X-Gm-Message-State: APuU4Z8P6qclbQEqy+mLkvX+9bzypzuFclPK6wZlbOoS+tgD+82RVbnS
	Qijn1DjrvUFtj1Gw50Z7gVoP+W07sDmUdNg49Tlm3LnirJFyT/t2u7v4C+lDMWEvY9RPfRXXLim
	Tx+LSH0MeT2N1FPbS38oGVLPCJKjxLyYXLjNTUHNmX88bVkcUeAtqajda
X-Gm-Gg: AYBFou2c1wopx7xq4BdrEOEmNJNZNNbXdHKaG1tlgYYnex5i48vWNy/QpNejoKHLqO+
	1gLzVqJn/cPBM6gphdDtvyOgYuyOf4XLULvk40fp/sX4Oe3/gapGWSr309MS2s0zEtYfrguJhV2
	I6IHLji1FGkHmC5/soZGKcc7bsVBn80WyRM8EMTYovaDYvu7yMYNlaIehWkVtyWo8Kr7iKc5Ogj
	EUl/vklCwd3zQ2tDIwrv3aB8Xv7KGAQIQ0fRdH8cssfXzD7P4zkJQzdF9ycOawLaGMOi2hzI6Al
	TI4zZK743bkg3eUdJ109skW40rlFHH9UO7DdZA/GZi9vMKu1ZZFRRKVW0bE7jaVjbdCA3Y1NIZ+
	jDjskoh/a8mEhfHZAHWBlsQmDBV/33EFGWONtbjz6zNsQBqaO3GXC9//0PtALj2CFkiE/thJAnq
	Kj8f5ARHX0LWzEksqUzhbzH4Q2SYhNoF409rM1wfXV1HxFIocoxZcmrf4Ec+yDpUol8J/FMymDE
	Q==
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525577a91.26.1794472419913;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525548a91.26.1794472419328;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:28 +0530
Subject: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8 mac80211
 ops skeleton for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX27zu8Nrubwo9
 FoPqmwBnH0c4RoQfiNivefKypkuS8J2mIx+OwIo24/U/GNkmURCLxdy0l/+n6xSN8aoyxQx2y1D
 uQms8XNsKSj7NRifbqmMzC2UR8xATHg=
X-Proofpoint-GUID: 9lEvEFTMu-MOLgmH8GDkXmZyBNcZ4oo7
X-Proofpoint-ORIG-GUID: 9lEvEFTMu-MOLgmH8GDkXmZyBNcZ4oo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4FkRMNBHsJSC
 xrXuQ5uPQpVvmVggWxyA0vY5b1QTVQ5B3BPoKg1Dj7lMi9zbOBXwvRunO8uUTHHqs64hn/UrSVh
 S6tKyPxQfadLab3/n6TMzy26Jo0SfE8i37wFcXZ4QLHiiHkGKazxxUCw9UL/geALcD4lMKux+KP
 ncrp1TSLgDw6JdGrExOugpHVLMCL5fzC2Pxj+/CiLVKxcLk4GFbK9V2AZVVd5YdxCgRF1VF6UMy
 /Drl+RFqsiBvTFTYeSWLn2fOwlc0D0kApd9xaIB++aHvJTXgGH4pu5lmgWC4xLPAA4hAAXv3eYy
 t25E0bcNegR8O0ZAwYggJvRUVFag+nI5V3hTAHPUiZrB+0OrIkBDIlH4wWKsYSPWKO8M/AU/bAK
 ppM/C7DaXUhWwmJ8/NZca7pcqz8SBNwUo1d/ZVCNMwl/7MkdIjdHUNrN3mpmza+yW1ee4IYQOiz
 U3SOrSV9MFuGSsxPnHA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579e4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

