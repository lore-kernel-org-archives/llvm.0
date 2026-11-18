Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982821;
	b=nj9nAeDPjv4UMJm2ZljNToaj55YPXbi19/2gf1+QjrsKSSyZktBdJfs1HUBz9V3ZhhQJ
	 etBQTzBWyxeI+CEf0MRB/gOjZ4OAhDkkDCZzs0UoiIMX7HqhDpReeGHAgNPLRCRo7thmp
	 +OI8p1435Esy6NOPIaxjkjORxO/cjK9iGUS0gxqSHoJ2sa+Xn2qmzmm+On8O2DK5E3D5k
	 yBEtB2kbotH9GIz6XdntKEYBfyHkxADSGhERv9z0Oh454/9ZEEbrKIHmXyPe5NSJV7VR5
	 vrt/w96b4Nvf/w5v+URNKr25QR/SlrzGilIY7Ig49zx5LGQxZVqNRgLUuUDrTe9SrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=VqDrPBxHfd6FcsI5pkjPBnxhAwzAJOGZI6yP0kGlrAP3OYmiVWKP9zheSC74gi8rmamJ
	 pz4sZ3doDVa7y/rsgCDQUbDhWzhDkc1qb5GTwqWxudsxfqMFf/R53X/i4GtP6BJfIptr+
	 Hgdaoh+GsVP43yOEKdse3hcNm/y/jdsH5mow0R8CSS26ZftenAvyUqMhQ392E3rMtQZ7t
	 0UgfURazRAawYe055Gm1DCepyt8/wizhrJhG/yC3XA0uQG3GCbLl2P69AgVgr/W1JVB9d
	 88X17+S0Tw/IseigXCQRPDa8vBJz7Vlb4D7VlcKC8LJo/XrMhpOneqkC/VQWWT0pJxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgjJjHor;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0660A2614
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F0660A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kgjJjHor
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuKA2453524
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=Y3jPPzR8mOV/BonK
	lBRvXmtMYaTAitKtjPjJC3235gUB87lBOZ+Yq+QA2ZsGdo5PhG9GJwPsSJ7gOPGQ
	UA0EXrG2UXygeyQnPdOsRf/q6GrnKDgfGQ77VLFP2gxuKRaLhNFCCDk/lcE8Tllv
	BluwG3MoHd8j4ikhPrWCy0xVLtVpK/bAdTrmbtM19vHPJPWfAVpEU7ULwL9jyMtV
	bBc+oL3Mi5gce+CU/Wc3CQyOAywRr8pautqHw+jbA7/Q1CHxwlAdHcIPSwIevhYx
	zvzXX6Cx48reYBN4DzWAA6+0bMOXUDdIiLaBsvpg/dniVlVA4admmHH6IwdjX3PA
	9UaghQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99grk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 06:20:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so803386a91.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982818; x=1795587618; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=kgjJjHorQWAcnAodYP/HxSHACWRD4iiAtQB6NLLVJgZ0YwD2Ak8RfgFAZWyKvPEndQ
         q05VxcwBvd0haulRxA3L+9ckB8hn7t+1WddNetpXPEFBGheCWDkJnRghAU0nRPnnKamR
         DnFKVnRXPzup3nDVliHsfHs9nQkmKHyagDomiADO8BPAS1czNH5DHO/HU2zyQs4U67De
         fs6Z8yU8xnT3UTsLlUNb5Jh5tAhD8Gy5U9GInjj9/ISOKe0foaueuH3Rv7Uy5Qp4MpDO
         EzwR/2Z3h2QP9csibA5THgSsTid9nDNwfsU3fL/A5SudQf3VgBqfazoDJm2zYoFK5Sha
         P2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982818; x=1795587618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=Ql39Ip7QeuXH7zWr0hdIiVl8OpREaenjYqv3779EUdN/hgsG5bm6BGzCRwnipriAYE
         JSNG/E3RXuVYEjLHK1uLxgf0g+3K+mNWSlyQM16rg/T8SL6r3pCZUXXWzVr72IqQ/eAa
         6BuizOogsnkOHZtmKmfkLsa+N7OIxy03nP3VifvDpEd3nzaDrSM1U+5xkLRx/VwgaYDq
         WxKYa6KAOafVC+pMZct2SexMvJQFwJ8eWo8qqDw7t2sULWdEHm11omznF4dHraoJL0D3
         kmaal5ozQw+WCO4ECX3cnJl03aI2VVK8CKah+Nm31pws6/NQ/6Yl1hsEBZMpU5jSUiii
         MTmA==
X-Forwarded-Encrypted: i=1; AL+hErGV82QUk8cfXSTqtIblPD73sV3G6BVA+XUNi1ElmuBoXFz21yy39m0JvxEed6p2yeua8wWG@lists.linux.dev
X-Gm-Message-State: APuU4Z8AfaGATkjehbpuhUU8jzAD4pGL96pVup8ueLfSgvcVw2ZAa/KP
	f9cO7HL302q+uuOjkchTuDLsfuW17vF913v3o21qO4Q7aZvABlmh1ptHpd9jpGdHrd/dlEEZO/c
	xazCenQYVJ5u2zvuDshm1jH8B4/wiz9agjJvp40wkM7+VFRzhvzZQVDEk
X-Gm-Gg: AZFdTZcfTGl+kY/1ude+ZYhHuhhPTfg3xrVIRscL6hOAJcEhk5TZlRtjp0qcpuCPfYc
	/JhYcKxkGX8IUzQPwSCc6/lKH8e1yDEUQ/F7NNN358x2V3YnXluyzcLsZZZL7wzi/WCWCApo3po
	uVh9WC3Ort/EpEQhbHwkQZ4VWCvcPFNQs8t17Dw5lQs6pZl0Dq7JhhIGhcRUyq+wDJz0ojDpM4h
	qWHoF/s46eHjI/GawZ2B9HkCviB7UOrc+DpetVii4OSr1rUMkmiVnDETeFbpdbZDszbecdLLW+Z
	vQjBhiZiz4w1X+54qMD0YVz1vtGySOVQuPFKrdAz85bFzl9QkT5Gjfb0LPUX2epzHob9vU0j9Pk
	4DLEPMI7E+caHKO2xNiM1yN52PdrEIvI99n+lo8SWWjPakziuoXjwHcM5cli6D/uibvjBbiNLCF
	fmdfj2f8y4oCrRkHNkUNq3xb9ops0XtlwG98V8a16cuWvkavoE6tYJDrgK3ZQ4dgxGzc6W+4Tl2
	xQ=
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653295a91.35.1794982818083;
        Tue, 17 Nov 2026 22:20:18 -0800 (PST)
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653276a91.35.1794982817603;
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:16 +0530
Subject: [PATCH ath-next v2 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-13-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX7PNDkoX6l+z5
 R05N8N4ZBsS+P51rxYqT/DMdnLCUtgt0y4nZb3nfaugiVdzQl/3mza7Dl36joe0zE5ZuWnTdHOV
 NDuMiJR0FbPqgBQiuslW4v8VJnPZGLA=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd43a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX+EPs6d8Xfpwr
 tG+Kq2fb6pqx+TfiHLQeOc3CURmHbhSgICcNycbNvZLrYs22VXpAgZL5KbgOKHIRg2KWi46eXVc
 wxl73IeLePqlELr7CVqkrGToBEOCH8p6ps8VTwfIhAubYIJsDMBfVVUneIWZfCAie2VfJJm7kgf
 n4eEuHEiFYWZN7ryQ7fDIAd4n6Krr6zDJZTkHc0LGbv7pSh3sPRsvSb1gXAt/Jo/Ypw+mPJkJT+
 ckaoWpISZ0swDCNc1u15RxYM0ORtlIh6nC8A62jn/HGMPIvm1sWnonSRSjU78ICPVQqq7vQyZ+k
 bEt95bqHHUUKmOPGehmfQRp2mF6zgzKwjIBBfMIxZqIl9AhixMg8E6M5XxzyGkNXbQVbSC9xo6i
 AgttCmmd03eIkAsn5xvYnVIv2IQIMyA73QKPOJrofGt6NhCpn2uK6QVUjFf7QYuQnduN+IxW63x
 OBVV55jkj7G/kEmni+Q==
X-Proofpoint-ORIG-GUID: AozRZtBWD8OtnAA1cbnnWdKd5yh3vtkC
X-Proofpoint-GUID: AozRZtBWD8OtnAA1cbnnWdKd5yh3vtkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

