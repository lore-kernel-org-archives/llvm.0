Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472416;
	b=wHQbcHaXVGduJDZ2ifLnNB1OYYHBhDkouM7Tr7j7MXFdNW2S1TidVIbsqOSj4VdbDtjG
	 po2LrMHAgBAikNaGZ3qPxf8BG8aQ8X8k+f5xM3MBPYHniiMIegJIqZUSUXhmoNAMP81xR
	 fOEjqLgVdcCPVbR533vr8IskmDwbrnlNb5JX9i/p/tjV6VHkMSNM85kJxfWt6m/5Zl34L
	 fHB3e/S8Aa5z9fe9QuK7vHZTVpE0WtoVugrpSNxP01TPXKsbVUX3gUDXDFm6teQZprfJP
	 dgO2ZmiStuVmvxajxZd5fc7LGN9tNHSVPc3iUD683tXLRMINDZ0eBBs/P+wGZIfurcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=X0Hf3tcB9EH+AZG/RnDsZKHIRNj9APgdhTHTA6KHD67tVqR0dSOBt3WhHHBi8CpOqQHp
	 WgXaftyff5T43EOhjin6WKhoQO3bbVdyWs5oJVfGA0VDxxKf1bp8vVGUyUKJfZgq+O4HO
	 4RqgJmg9qxi9yz07HVMQMdktEsbu/KPcl38qI7+27S3UpydCz9LqitfuylQe7wAtW23q9
	 UY6bA9TN8x8vLwwLA4giL8tWwp35sSI16nhMnvgh4TIA73kYHdQIXGGd3pEopJ2UzOSrT
	 rdCAzK1w/gCqGhzrd7t6ZBgRqs9iGW+r/VY0cCxYOWUkQ+LciOUXqVgX58E0HzeZGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SIQVL8f9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6D606A8B8
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF6D606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SIQVL8f9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53tEY3477246
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=SWriODnmPpc/SBBi
	0q6R/aCwq/KQ2bAtKHOgUHD4F81ZtbBCe/1K8PSBm6gtQoOebum03cNuH0DXtNX4
	f5/ATLZ+MmMCYJZgtUn2FWwQ3enjBvucPWgQq4c/eqjNoec0QHrclkcx98GrmCIb
	jtpDFLfKC8CmkalpgileOhawn9axF+crHcwcRwOOSJTfuMHeeG2gMS4ooj/KnErM
	TtSxsxgIAQY0q8J2dFQBDdYMZCjjgMLdIjhScdAoU9FxUeZzaRnPt9qlXEnMH/PU
	7eVa7a5EaFthpT14BwLQoQoWU4A5B9WICjbl4S4HG65n7Kp3OVOthMNZTSujrh78
	10LFnw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugpwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 08:33:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd66551e02cso4414168a12.2
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472415; x=1795077215; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=SIQVL8f90VLQNa477vBjgQwV40DFeps75fw4IyVxYs9UknS7hajMqoxVZvLPqaRiW0
         aGnx3dy70OIKHr+BubwZAv2RILN/KZcYH/unhXyUudOxc1GjyuxtZEa/kqTDi1YNN64U
         ybVLoEdua2lebNVtsK9c30cdZsM2qAgAh4qIZUu6xtIFSNxEIsgCb/lwiHTgWvDWdbPC
         CdFf0p7Zema7YmmDsG+h5KZR8J5fyx2utVPu0+ti/o25shcrKmJupVq1ODZIze/kZ1zq
         BVdiOybdTMU7rRfcaQXi4D+3YdNODyFrtnwb2TXwtjKiq8zwETm8Ufwtz8+WU2qoaIXi
         K75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472415; x=1795077215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=V/oxkzmRr3KjM8QA589x9fqopAU1OGL3gN3jDeqekUwdbmHuc4Q2/zChMNd+n7Pqzd
         YybumWnZzqwQ2/sOxIxbWGV7WACzMhskriCNGoQ5CDFDy5Jyqv0m6WjmlS+BehkTjJ4v
         mvi/Z3CAklye3eR1e3bF9rqz9iwB1Pt6cmDR8kcxBZhzz24xL3z2ez1DeaEh3x9o5t3h
         gJR7JlfnSUxmqkt6lda04T1AUZQb26DZAc+76WgPq4MoRYBXpveJZXzbLzViHyDTx64Q
         RrNnpIMngd7h2n0oq1UpLwAY3BsanSJ0gJcoPdAQtHRZGxAu4wtBPxbURv3htobkOysp
         EalQ==
X-Forwarded-Encrypted: i=1; AL+hErE9Kg0TARleQjO9pULxSpp8P3e3XIlXPxDS2Q9YmJLS2LRF1x4y+iJFdYDD54uQuDOJx+t6@lists.linux.dev
X-Gm-Message-State: APuU4Z9MI3xMp2Jm/nQ1lAJPHUVLSNeOPlb0r9uqqBdVkTeNzFyxJyO3
	IbXcjvpmJXjtX1KPzba94Yh8hRjhuzuwldTCCTBn6lQT8/fqCr5vwu3T+kuno1oRHY6EvjsaZh8
	dNWny7csaWafQL0TqSEFi4J7FDewic+YaFKJMy4Twf08h8Bf6boddLWdR
X-Gm-Gg: AYBFou2wxxYjoWCx8CLdmb4etFv8dMXfitnH22wwY4OkdZHQWFJwDzb/wYaok+H6pju
	NpoA0fKxKiWbyXU1iDWC9Gl+aa8cf7tPxYy6TjkjHoiaToqghoHXuXlD4mTegkCHqXjyuHAF/bf
	r14Mpr79EmaTGFAH+dZzq6exVdkRB7YR3GPSYNdni+DS2qxmwenBt0disfE7VpeBPnQ09g80RGa
	m961ea4orwKxO4Doh0twdOXk5Ub61RXSgoP0Ws1s78JVb+fDe5rBs2AMFCqCHjJKXRB2r/YEjRi
	h+uJ/2WKTDsq79vpl80+DnSisZPNEO9jSrTpcUkQ/hEtzuCpavXXbCa1t14HEjTls63mLhXJ/ag
	hcTE2rg93JNo4NVfis9bU+07xXhj3bbSC1gudZsJWec3lCPIip+IvpQg1Z0JP1l2F0s3i4NPdcK
	r3WUoZ+alDgTvjSUaOY71hB/Twc2DgS8QQp1yAUstngVLFL0eUB0HX94lh9euB7AsMHWSJ+2zt2
	w==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554121a91.43.1794472414875;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554086a91.43.1794472414096;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:27 +0530
Subject: [PATCH ath-next 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-13-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7SyaUM9C9rKTrNNLIDfKHfXIXWyK2Xmy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXy4Fj2Xx6YAD6
 OtcbpR0iG76zybf8X27iLpO4B7xEfq+AeV1JeIwO2/NHWpJCM/MA3b6won5q4oNhnuWp/l1/Cch
 fSt+CQAQ/At7eEbqO/YPQ/dczM4K/IA=
X-Proofpoint-ORIG-GUID: 7SyaUM9C9rKTrNNLIDfKHfXIXWyK2Xmy
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af579df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX5rdcF/tDUvDh
 Baa8sZhBHxkkNLcoABxsuQcTQi2PqwP21H4+eEi2Nmi0Dq0UGbsRKYLVozRCoON1OdB5WOlFsSM
 frA37DsO1RdZCGbyNGr7+bcbLpYELxB3N98hJtnEH4+Ulw4X1IhbIYSyO2hH/7aQiqbAerNUwxC
 CltGZsli49BH00pb4VQAXayFB4qG93Gr+++EmaraLrjtqs8DLG10I/WeZYG+nOFR4wHVb350B9h
 voYSHK3wlUXdaVYKgSCWXqe+wNIToqcb1fJDbhSpZcnOOwSvCAUDntk1oYp4xmZKbb6yEMc1rPI
 v0WQUy3DvW3vkUwcFP0kSpNlpLPcs9VuDq5KM1fdlK/6FmaY+zafSJRaHknTXoI208rvpvvRny7
 wEkKIp7jRjRlwX2ys6isKdaRaaztGlUSrGjXizLgula/51sHqMhvTjkOQ+VZYhpKFmmHCtC23x0
 rQjdEqFivkADMdvGPuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

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

