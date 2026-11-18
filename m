Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989802;
	b=VI/R1Do4E23d4fWHrAWsLOSk/HdU9EtjhE+f9502fD9YqSvNhNHSX7vyuXJikSXtcknE
	 tVPZhfFZFK68g59MSomYvj/dnt5rWrZjJK5s7aKL4iVHUPk4PYn1U3W0WPL8McwyjwfZv
	 77fdXzO2CporXnDPcAD1zEIhKA0E3PhGvd5/u9tfZ7Si971XfhNiZf69kRt2eTponWbsu
	 SA7YRUiIQNl6/axCGnZrILUzT2lzm/H2WpAJt0rLFNKRBH+Uh9ASK9MQdsjYmZdiwrIRj
	 LxUxW3O2JFCf/sRKOsBwhwD9KhpfTHH3+P15B1ugV/7bKFzX4oEVokMY8g5sxTriG0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=P7uML6te5cbaSo96DLZ/SkGGWNMRLTXg8yvp20f2G5MeJrW3kZ4DQdxGqWpye85QDFrz
	 ELXMTPbLQU6nEplOF3cTbWHVJNgmcLyc1mQHZI9NbmVyEVo7SyVI24j7q5kwCx1vZ6ZsD
	 g+JBDWRdF0zuRL/CjCkXDUefwk1JrqhTncMLIz0VyMjsAPmJwUp+n5D72ZbE9bm51/in/
	 PNge2ruVadQHJZOCsaEVDKnhL12tfwMn1FI/chFXOEiijWrmnZ3UKRTrMe3V2T3zFCi3j
	 nX9s7Es17cVjxa7P82hurZAxQtDHdmFqFXOxaaKTzNpg94LM6FFbzAESADTse2Cc/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlbcUarm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF9606A896
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFF9606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpVrs0Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YlbcUarm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBg42106531
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=FpVrs0Bha0w/0rn0
	aXJhKN/JmYwXtN/rPG/vJzue0PU8ZxPmj6NBMtxe4mUsnR8BnqGKZvU9kR1FZVhc
	qtTYZwuc0NDyeaJJ0HeKlg1WS1OitJdRQ3h2vfXeaM9bO/8gqdOJ5z/Nv8sP6fut
	QKa0CmmZbO3qEecQkqbdhQmyOYcr9s6mrguRhpIRd0uSaELLDPOlOTHBLbatd0/Y
	Zq8HYZeNB3LXxIBWfeFDRWXKVMOl/+kCHaTPAA4TGHN0aUKo6IkhR8WxsUO+JoIp
	LtzOPwErN33XFku0tzlH8qXUO9ALcwXp9RB49c1qGAAN8SOOVtCzE1G7ldvZg0lS
	tQsT1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 08:16:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08904845so9442695ad.3
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989799; x=1795594599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=YlbcUarms1XdLqvkwJ6U4BmI7EylXgoBqqPQOj9Crlrd+tU2d6gpuhHwh+g6LFCWX3
         FmfWPuU/ESxzmZRP0aNC2T8oE6Y2kQrmdgKVeqdSu38hu14OM8J5SmlnoIsw25eJ/Or1
         hV00pmoMFAs65P2zEN3BHulDMq6Nar4+Z65IulKPCssHrxhRc1DSpIT19u+6mdbobAz2
         PZRU22gKJARwr/8Ak6x5s9FG1Iwqdjq90DCEYGOtA4+ZkddQDd0MUgXeeibd6KfY4KCe
         Sk+zeCWxfIp4vUrCPtFkGNmrkMBAJolpDYRzk5lkLYQkNXAG+Oesy79C+QGd3PHjDEWP
         CWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=AHLT4bRarqGZtTSejwTwhpOOgp1koE1y0kqmLA3YFFGpkn0qf7a/Jl5bDAOXDULUyv
         cJPnD/lNBxwdsKDHiUoYLvowmgbuVZzJplZfyFYOHBjuo6+dpe4U78hoB7QhXKlH3jou
         tabw2fB4i4Ag1Y/kX8oOGKBdrjdp1WeurrWR5sRWaN4GSII0OSY20IQO51DJoUlMSCYV
         iBbkmQsaaCVGf8UqEfMZ6hBd9Xd/YbN5jtQ3bF2McSG+QCc2G+bDiKPCIw/6vyKdmrWi
         /OlSb31qoO5G6vRJjii3ki9pdmQeB0p6PEr0Y/sUUtd/2VeuDSXFfl03MzkWCQVthLIm
         Fs5g==
X-Forwarded-Encrypted: i=1; AL+hErEH/tjKH8Z9DeLABxuXH9qZqOk7vEiDvzZsCxJNpXMCWixI5A/h8er5QBTWsiherNAjL4kM@lists.linux.dev
X-Gm-Message-State: APuU4Z8f58zd+Y13uL/SoiQz/ZP59BP4iYpg4O+MdnXrvkFkKTc5eTdG
	JEE48Cn1CbvbCcBLPY7FUGiHlBPUnCGnWOKbQaJtMlrhkkSeJOjH+cthLfP+XIRcfUkhJ3Mhnqz
	DoultS5xqUracZa04daPW6wum/s1PqLbB8d+5HRnQGEG80P63MnuVXSG7
X-Gm-Gg: AZFdTZe0EwMhFm2Sd1MvhiZtfdT4Kl2HM3PFuXK3ogidoAAeBFC/5lKo+NXCFNwd8o8
	ht0xoDaXdWk5NPqC6aW3k+xu54Ind3lufjmFPFCpAvnnGgK5L22u655A5mX7lLpl0ajnJ3BL7Ad
	+WqA/3PgDvjY1JgqWiMFMOKkeJ1EVSZocxk+BSORQnukYlR3X7UAmhc69eXdXHElddUOYX38OLk
	uzO/7iI9Ga38lwKsLxnWXL+9kp7EexPNlEaj41wMg+weGxwka003OClHyMGf5BlGzmKtszQ9GqG
	ed0sPJ2MViqNCWWhNqBxi39aHQAbyRAeALkynTaXGrwwSOs8be+HeYM9JZE+YnEja8E/2Z3KCyB
	PoltowsR3gcHHOdjg9vy0e+b2x8Z7iANKP+lBWoXAjXvFOvNAykgn2dPVVxNf8jdttJ1FDixrtR
	p6EwHQxQ7BfSymqkfYjwRwUse6HHX2zNBrbTQb6BivmQEP3AwQXrG1zAY0srwJxLyhzNKLyLMpO
	g==
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922931a91.49.1794989799355;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b3d07a92ffmr1922910a91.49.1794989798904;
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:36 +0530
Subject: [PATCH ath-next v3 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-13-9875d2a3953f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: TthX2dKZG1UqrQmJOAJQeRjma0wc24np
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX0ABTXMJVqNT+
 TRWqLAeZPLmBRdHCvki1fNWp43m38YwYX2FQ4EnWQdPxdI1c9SWL40+E9LflBqn4+DvVDvbnoYS
 w11inekxVTx4SJWti8FLhbcnH2MGvL0=
X-Proofpoint-GUID: TthX2dKZG1UqrQmJOAJQeRjma0wc24np
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX86Bh0VVStd7j
 OGUJK9xDhLL9Thjqr1akfBCbsHf8VUkPAdOf9W6og5XEujq/ugiFdkSq3TURMhfn+wHbepfTaw5
 CPqXhgu1qkQULWCw8DtWkKAoKG1rCr4qwHYyGJtjo9EnM0v8L3SC78dYUWe5lD9evnSYMSuvv+S
 yTNW5FLlE3yC5k0zI4cN/ITgA3jLui5gj67CkrKQykChQHIJMEJ8D2eVJSdAnfVlwc2PSmDAvqV
 s+0vA11QPaeFSrnoZRqJ/MUr+H8/EKjVteTNh2my2lvpmGgKT2NTgj+g5VqN2ijzd8vfNopkO6e
 UJVflzKhq+13x6kw3UoRuhX+UevEhajPW+AKuGpP/rQEErvipP/2w0L0Z17EtNI6TpNU4aiqNoM
 WYomCAii8gRPMbzEDfc5/uXkDRnx/fb0NIx3oWgYgNPryxaOYmP1FSLtgksmcDjs01UjrVdP+4U
 mtU3z3hlPPsQ8vQMeWw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5ee8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

