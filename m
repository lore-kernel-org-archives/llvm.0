Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A33218B3
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358251; cv=none; b=h0SUw6ipvd+1MDLy3pmg3qE9S/m0PpwZ3fjypJhzt0ctyEQCMMwwbtTfqMC99/rbdbIify/EOtLt5zj9RzGHcEfpXLc8wVR8/SOn/qM6EkPzICBy5eTWQHszdE6ydPoDzfmQdSBDAx/YHpcorqlgjYevhXP0V3BG34etCt0tTJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358251; c=relaxed/simple;
	bh=bF6I3Il5StjpcdVfuPvLmyNYtVe2Yc4DUSHgz9j7Kc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDNxDmjV+iUM0AjthNH+gitynmnFZF85j+ASqysIML3YzClaYEFKGMkNPb1RZr3sHqQ1L/gYeYt8EcgUe9lKAL+BDv/BWslCE3y3Ls/xP7F54BI0iFz1l6pDFEPgDFan3NLKaX7nLyWIIluOx5LWehonuj9CroiLUiAp4dYvhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPsT48SG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAucy1uX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPsT48SG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAucy1uX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEPI824541
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 12:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nUcD6pb0PVl
	Z39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=; b=lPsT48SGumWSYeYLa9JC9HNNgaW
	4tkT81SK3bG69TQVI9+jNnhST4lXfdbVwlFdHUb9ydRTqO1slc/lN0m4mUthbYiX
	X24ImfTWNqtIvSRjMirxBxWYpEZZinjkjfQgCXWKjSbQywkm7/cBUCumCUl/qlF7
	yGEo3xTFPJfJ4cp3pdeo/u2cdg0G7calDrldsVxVLxZOAqavtr0xOzKM90zf0WFq
	nRXjLErqpX99Qlu4Iz9Af0LYEMIIkDZ/LTkNrv3NJL8eLRWzsPRTHdqmTBL2TaJz
	wGZkcO+DTSiAPOyeqwOw3V/GjttYjl1gIHUh0N6kW71A/wEgysrotduNvNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 12:50:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee04f4c632so238212031cf.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358248; x=1767963048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUcD6pb0PVlZ39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=;
        b=DAucy1uXxvXM3uj0ZWfUxxTjA1a5KEIAy7DTJLPOwg7OFCX6Mz1MTF+xv04SVTaC7q
         65J0LMuCUxvJib/FwJwrem3THTjNkgdHCNhU5ovdeVwzmiliN6h6U/jRAplHlkQ3MVbG
         BkE1NTncWaPBBKv74LuAgG2uoB/Nb2fktag+IgOFmv5FWeJn+5QACxmQXsTgY+o0i+Ii
         DeO3ekWAMUCwNBBk8exkUz5aYT+RJeFOT2HXgyND4XcITRxLc5rsFDqMqYxPk8jGdnJX
         Ck7pNlOBsssN1llUF47J4xxjaNNQx0VeKfL4nvrPRC4N5m3a0k3MlOaiwJNqpjnAPur3
         kQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358248; x=1767963048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUcD6pb0PVlZ39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=;
        b=enOegpEqYQjKnxHcCSSnbiGj69vVjj+GGnWfkcuFcSL/C/qx4c3Tom8eqBL/1I2Ykq
         f5Wh6wTOINk3rFed4vufo4BfGO74++IChKYCxGpNiVJGbS5HPIRFk8iao/dYfTAqU5hd
         xEeG2BnpsH4JdcolCCjHMHcma2OZB2Q5ercslj8O3kcHX0ua/3YdIhrOk2Mlm+aIMvio
         809TJalKoe9/klXcUOz5kSrCcyVYrxuvJPuzWRLTr6gQVwpWlf9YwIqaN72M3mzTmMW3
         hVhidC/MUZKAuSluJrfayoByQ1jxHxTG1SPIeRKhu5/iep6rdYCkiMRxYS+q1vTgotgI
         8isw==
X-Forwarded-Encrypted: i=1; AJvYcCVgPlmLRvSD5PNNfZsbhs0yTSCuhWOJXfIK0wQIdzcS79TXhJz07fdJtonx5mh0bVivGxi3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxp2WNGeuX81rurWdrWlHorZF3kfhCf1bhlqk47+yYCxg1IgWj
	k75apVu29YfD6PV3WXjiCn/IDPbAn5HpJSNbPBR2RL7bO2/KMsT81WWVfyVXGKGwSFNc6hrsCG7
	gInMrIcxf//rUMCknuQ7Hisn4JtKi/LQQgm/pjuca5Zfy9OTiqnDOrvxm
X-Gm-Gg: AY/fxX6qh1mVzj3aw0RlgV1OQgT7cqppY6w/Yn8HXdFAGvffH5oHL9q+j4qHmajO/lm
	ud5ivOB0KW2ica1el1vzMPPDzlqkBtRuUc4EMTmAYrg70Kns+h7gnANGbEEfIvfNbVUDGjD9VyP
	DltB+Bp6f6ZkTWGHEpctzTbWZrLrGthylfImgt0dczOj0H7Jf1hS0m62TYzdiSJOKfew6nsOHBR
	MCVk0mvCd6EhBeRFz8YvqeZ2Qir9fUUrcUKjpv4GJhmtJw+DyX+jqzrev0tfUFS3mHzSt3GxBkd
	T7wjgdsU9KymiKXLdaDhtiQlWEgLZc6ZJVe4CLewLKVsmt2gHgjiMk35k8JGkw9akLX/u/h8vXq
	maWlHOdB2E7XypmrkGr6/l7SzzQ==
X-Received: by 2002:a05:622a:2b43:b0:4ee:15af:b938 with SMTP id d75a77b69052e-4f4abdb9888mr636639641cf.70.1767358248094;
        Fri, 02 Jan 2026 04:50:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgMLeHLiaApDhr4y+t46crL0OCq2r5fx6YzaQIeAPiktL/EPDH+eFPWsNm9PgPDb379iiEJg==
X-Received: by 2002:a05:622a:2b43:b0:4ee:15af:b938 with SMTP id d75a77b69052e-4f4abdb9888mr636639121cf.70.1767358247588;
        Fri, 02 Jan 2026 04:50:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] ata: ahci-imx: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:50:42 +0100
Message-ID: <20260102125040.65256-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bF6I3Il5StjpcdVfuPvLmyNYtVe2Yc4DUSHgz9j7Kc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78htTPTsLhXFjjjfDr74HmSdB3AHf42Z5Y8+
 c1TGemZXLWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IQAKCRDBN2bmhouD
 16n1D/4pE1qzGL1s8HEKW7GRJAes9KGNCUeOwpOsXUDMiez4dAEYFZhEy46nbNa5OMSgone+q9h
 yrZ8uiKuxnkXHDAOXKLpMWFByOe6oLQveIr/8nhyuDQcSDJtiYGXQARD8rrHNhyajEYXHoo0xNy
 2HhL6FHPA9t5cHJZ6yRFqlax3bogb/yaWfk3WAmZF8rZE/2lrSt2Prs9uuO7C8rq0wlnuqXu6Zb
 2/M0eJSJkkt9nv8BgLYYVRXnSFxzfeCIHh3wqRFRDYERcnTfh56xYZ+6n0J2iTPufvt/JNsjzR4
 DCjmaN0hnlgsVXaae5MZGbTql8qCwp957eS6EpUu1WIQ+HBXnR2dESKNPm3+olmAMTODlNLxG1T
 o9pttb+XTBJ+wQb25WVA++EKFElhU6qE6v7fxRqe2Jf+gxFuLdpHiSZQnmDx1euYkm7SYF9AtK1
 /VpX4wqa+NSmv9QNCaSrjxzqnUTfzIusIOOQolhuDOl/N1lMu4ZxzQ1vt0GNtAoCggXyb3LG672
 EGfA2BlognhlEtOIyR2VPms7t9G6jM+br3Ek4U2GB7qYdjCOxsI/WfV2BqfPG8lpo3dt++PpxiF
 yQsOyAwt6i/AACbE4f5wsRpGpIAawtWaqnfER33Y3I9gh2Cjx0TrYY/8H8Gpl1urFlgt8Z4eHET 7k3nYo5wutjTiVg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gNcp-qnZ34gpuC7ExmxwxuOwI61bc40f
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7zQf0MV6msiRB6oW4MAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gNcp-qnZ34gpuC7ExmxwxuOwI61bc40f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXxo9Se6LDMrQT
 GqQmibGhm9l5DX3PHNrtipbDNLWmbYwKOnZ3/tWwbqVZiiTk90Bh9mlPT9ftIHUGqmCd+2lzJ/K
 Rb12jmqObThf/zETSw6ceCt6mvANvWxsSxvC0cYHXh4nu66Xy8o25X7y5ad5g6f3VnwIRP/jpCP
 AANiNfWXrO2Hf1ZK/3JR+DJXAeFs4EFOFpM4P47tIIpUtLGIZfpxyPm4CahYeYZcH1tPm+eHEdS
 ZEyocNKaXBZg4+qDh7CAQRV2G0fhv6kM0jOMAs7On3av9YldVhUXVqfpXoYYqB2xdptLcm9ZfZ4
 MgzGBAR2QTaL8u9ER4LY5qLFV+/fvq8e217N7BNAhLEueWnfTwpjxYmxzHFsXWA6EmGLsZ0/MiJ
 bYY9Z2b/dAKW26Ksp5C58dAnXiNHxdMWRgnnYM4Fd+aIxVGQv32EpnhnaZl17N4+YSzS9m6xzR1
 wLv/G4NOr6kWNbZXm/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114

"imxpriv->type" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  ahci_imx.c:872:18: error: cast to smaller integer type 'enum ahci_imx_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 86aedd5923ac..3d26595524d3 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -869,7 +869,7 @@ static int imx_ahci_probe(struct platform_device *pdev)
 	imxpriv->ahci_pdev = pdev;
 	imxpriv->no_device = false;
 	imxpriv->first_time = true;
-	imxpriv->type = (enum ahci_imx_type)device_get_match_data(dev);
+	imxpriv->type = (unsigned long)device_get_match_data(dev);
 
 	imxpriv->sata_clk = devm_clk_get(dev, "sata");
 	if (IS_ERR(imxpriv->sata_clk)) {
-- 
2.51.0

