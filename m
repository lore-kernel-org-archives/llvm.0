Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538685;
	b=oobVeVKNlEWxz9FuL/5TJL5HYSGO0cZ+PZM21mGKOf82Y1x/G3lwvOwo6/xpVzkfJeKT
	 to6TbQ1QJPkPK/AiK2CSnp0bDNgtmiVMPD/1qrs55sPPkxsgUnt9Khds1dXeUcX8ytqG5
	 kNmXv60PqgQv1L5L2qHWyDO7Kc7AGk5+QEreUzcgeMcxvtwWLsRVPoFNHGyFMBRsqeTnZ
	 nR0OicE3Rx3ySrM62TVXswComZBpGzPaSPGidw/7hXZ5gPDMP4hzMNBdEmXorLR0kTQDI
	 nob0c/49+x3JTg4xSmgJpH1f7js5vWHQ3amw/ufI0zY9lt6ZHuwBQXMiu6Zlcn0yDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=pRZ/FG/2NOTI/tQxznkod1vzNufGTbc5rh51x5kwR5w86yYEnu7whYjBvetexw6fik+C
	 3Ap9AJmsDbSW+lR8FVmmjvuwa4GeutA5PxzDbrEmhFhKw0ZhY9jtfHC1yVgdXIuEnWEhw
	 onDR6+g/5caPQsM/ubaErpuAzU1EGvXsoYEnaVD1P9e60T/SMtdgsdCJoXgQXx6cJALPJ
	 0AbYkg2C+4vgH+yz5p6Uvz1vvtH6v6aU4q/vQ9Mv16y+GtTZxkIIL+DBUB3aiohxODmXo
	 FDqdPAD+3gDXxz3t6/yWvvznHa0QN53SXVOGvWgm9V3LbilNXWsA/P/mXaXLIID2sSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FjBgYfw/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1ebbxCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC4606A32A
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BC4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjBgYfw/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1ebbxCd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKFb3267102
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=FjBgYfw/UuQ0Gigp
	+T2S8w0NBV8TzmUzal3sfMRjAwMh9ySrHe1fyG1MA3pYOIRCO/D7BGQzb2JuFPuQ
	UF04CSih9O1MjRsqR4gupHuNMYAR0lp75ETxJbmsSsgNU6YtuHK1tahTJSzz8Yhb
	HMP8TNks0bA02rkP/bcapjJwz9Vsm3FcVnKOZk1c8Eq/xPsbPwuQUGog6zbiSxS/
	J1wU4CldLAg+t7sbOHKuAWPbuR7h9ZxjG6GUL+Dqa7+8Txn+SthJIzsFAdhOwXin
	UCsbA26gszoDrLHsVSLe0mjQVixdD1ZZtfTAXlTuhMrMm68o+tIiC8xAig9Yy5qt
	iTXdbQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:44:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8286796eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 08:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538683; x=1796143483; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=L1ebbxCd493gJBIDuwxOLXKVv7xh90TD8LArKoXiIi3DTtsauMKG5SV0Tp37Xx4Dqq
         +1i+1NgRUGxMGnj9O7+JHs/TYZgv2jXC/rBcXy9W31ck+o6oHfbGu6AGPvPbZ0fkxnK1
         +L5cklm0TpXex+on324i2Lp2zhvrwwzjTxudm63MhSZLh+OsF2wpjiIXyCVYev4egP2i
         bMG3XJrL1RB1cn75SlBryG2XdP3YpSY5PLx5dfD16jY8sJeVLkaAOeFzyepA1957ygb6
         cgDET6oIc2IozAUV0ThE1L5XpzK6Ao3leP0rQFHfrtLH/2ty+hLQO/u+KGEq4k33gDdk
         JOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538683; x=1796143483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=DDnRbCIhc71QKiBuZQ7ld0MOJg3DfZr/eLt77Fs5h+feuWZVlvGC4QTG9tY8CYIUst
         kHYk6pPTs4tT/uD45M1LQSD6o+YnsKXjuFa9b9wlS3hmOO55TZd7F08CQ1mTdY96n7YE
         ZDSiHUQz53SlY6gHW5VB+b2FXN9TEyDbtL4ErEBVzPCS4pdSyiDOS2HkkopRZsQNbdqM
         koY4/0Zd19TM4OHuFvXoZvE0Pyf/IGEcViY6bVe2pz0QHXfz29KASFd9F/RXxgFrRnBJ
         QmtwNPijasez0P6iVIkR/giTaIDoR1OTNaURPZXMba2DpY5NVnMeBMnA19DrOqeQv0Oz
         KiLw==
X-Forwarded-Encrypted: i=1; AL+hErHmvWJO/qoizak9IrAusZtVfb8ZruQtGaMg/lkGbPunjwODbS7jl2o/XSxr4VZR34CMZXll@lists.linux.dev
X-Gm-Message-State: APuU4Z/QIn9KM91tiDNVdQDsU/b1EYJkGvSbZmLuSgy6OMfpJ8AF8lSl
	a/pmUMJV5uM64fXLLUwLIoLrOFm2quaWCu48IFERHFcziwb686ifQcLcqOEdq9XZeuzEi9ksBEJ
	UchN3dDMvM3EIjHYJAFV2N+FQQx+MgPsdO8J+5bDUz/ZUCPJ3gs4RAjdH
X-Gm-Gg: AZFdTZdqM8RTHKQfQ/7vVg2g8YsTx0F8sp1C8iguScrp6D25XrOaGBC3w11iFap+nYN
	9CcfLdZRlIAvxsuBv5aVWPEqzw/Vmyq4Q6OWjWnbSberzzyPAm4wrJAs4IRpDrOmcpBKod5UbN/
	iQmcx+XKx0FDEXT3TwwbaRTVQGdzO95PdnUhLLeoi1Quj2OWHcduvr/5i9dG3Mx1+6W0VkpSinH
	keFEz42idEW46LFe1eP5eKM1wECcXxwuqYfhUGkDB3SAVSspO9BsDH9jMkExgi7q/DdDJ0hH3vJ
	zUqS/g+U7e9KQDUKZ7LZz57/V60oL/1utDiSJbEei/OlPKlRQjo2zGd5d+gIrmSrcJ0+NNdK7x0
	2fx8aixBaRDQif4vfyvRfCil6GhQPpf3PTMcRNYiQgwoPc5rRzlQBmlXPaelZM0IkXymKljTxT7
	g5chN65OWH9zhUUUiSwpjJm/YXFp6FlRnvCWtCdmuc1ukX2F0l4/sbd6ie9cW36RQ2pf2v+DIBL
	Rk=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562836eec.22.1795538682942;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr17562805eec.22.1795538682417;
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:42 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:39 +0530
Subject: [PATCH ath-next v4 13/14] wifi: ath12k: add and hook Wi-Fi 8
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
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-13-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX7iCtNaTHc9EI
 O8X9aWOIjezPW+Qf4RQ5cZggvpXEQ+W3TW28IAyN6cI0u3Eu/68FQXu1gSmmpyOsJuQCTt5EOAb
 w54ryeQqzezhieHUciyggeebnvg9p1M=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05befc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXwc51eQLfkwc4
 Q8UKi8+n3/OOGgP6PKp+zGHXo/YFu5yAUlttZ3o2V4PQqNVy6qfmPFNLc7RlOYGKy0ePdfKNua9
 DrTbTxjn7HwhLQKh7v3h35oTj5jsU73aY/9k2T7tUCFJwvjmW+R5mnRFWDWjToONz3EbouYeCsC
 /4Et6IqNnp4ryonZVWKsDAo0Mf3yA8kWx+FaLD1st6WvsG19eSEMF1TTonanJo/xmVoO38j2mru
 0hn23vzANYEOp5oEWxxrR+hJl+PYPzVZm8/qU991jP2TMrj5toJR3a9PL8J6pkJNQC5FU4p+elH
 9tG5UZHdDZXRMtviU0JoV9fk3NVIofEVJjLhgYuD4sZZ8KCeCjJIL/HKZRnyr3SP5KTTyJzzNmr
 WLEAfKhymlwMnR1RFcipXeQXRkk7SLeIbjKda/DtzXT4XNCPPrJT3m8V2/IE+mbFFhf2R+FzN5w
 6UIdlaZHJnoeleVgvyA==
X-Proofpoint-ORIG-GUID: pKOf-sCx0RG-JhwGeXowP4OLw0AHJHhp
X-Proofpoint-GUID: pKOf-sCx0RG-JhwGeXowP4OLw0AHJHhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065

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

