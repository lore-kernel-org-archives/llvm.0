Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D433396FE
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580290; cv=none; b=jZFV2iXcvZ7XO0xRXUfdPKJbZIbWHOkHsWJ/47BnWyLfEZ4yeX4Ghh/TUlxb2yan4CVBpQnS+54fjSeYP0F1YhabYv7oOn6cOZAqSfW6LsrAOgrHx1PGTDqG/FpD0s6kbjOfBPfQOidOhLyqG6V/okKv5X0bPjb0+rjT0eRQj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580290; c=relaxed/simple;
	bh=k3fIiJQnt3//kLj8p1O4BhrfyE8J8CFmxoc44wKmiXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrRzIRYDpMfyQ3Rp31z7GNx23DHV/CNdirQUJejhnwhxluFwAkiaVFeJKTuOOkDSIwgsy1N3aI7oI0qx48mhSkH/ZhR2h0GBUn2mpCAFnlcuWWyleGAD7W5kVLchVfnBsF/Comh8G2rs6kRZlwwWeuHBUj+3jit1pzQZm/+/Nqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmVfTXwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXbBiZ3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmVfTXwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXbBiZ3/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9RsQu1530450
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pIBKnWae4ca
	tNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=; b=YmVfTXwSg+dzYWqzDS2Fpsnl+k+
	SoCPXSRlgSckh5iv5ayAMfxhfXcHJOkKcOHnKH8GO+G+PiIEOqh5yxvfzsvHvagh
	DsfzldtCWsLRZYfFfMiyj4BBioW9ZIbpAmldVI2UZI+qRHzxOuer4u5TqfyiuuHl
	bACTzaQOJHgjRDbHTNTpnL9981mFYhB5FqCtQQeIjKlpeVDTHcG2+McanmvDXwBi
	LPforIBOwwkdCel6R8oWLCRoBnJkER8aYz3DGpb93+EsTNsEcEqGtmlpfBAjdAbj
	WRgUUrxD5HDQbiZhGy+FNKF/BgDimrPDuNV872iYi/jr1GpII2a2ac7jPpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu6fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 12:44:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so114772381cf.0
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580286; x=1767185086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=OXbBiZ3/KJzUZ/mlxKRZEvrncU3NE5gRfar/T5x6TyFYCQcCQI2hZx/e+Qx9wSI5Pp
         6jaXw/Nq7p0UhKf1zWQq0N76+KYnq8oh8hIhmeosN4wU32x70tTzdUcz3shAmvIhOxNz
         Qg4D0qFdMZMAS5eaOxr1CAy/gYJ95eYoJX1HKZ+7gbPLJK5xmkhIfJJPtP+21eBbM+Tf
         kDnbNpqbT864EMuffHIXeBUKbTJSTHekUGCV33pnUiiMS99Swhw7FvPxYcahI7ESkUz/
         7frQYiiSzzs/yJa8y/Osrhq+Ij4O94Ewh+d3WEHlT0/MtcWqoxVrU67qVvNX+BhKTD+Y
         73JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580286; x=1767185086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=icqzYjE78po8gtZOZsRyTs1y8H3nN/L6ZzZpiKB74qbzU/DvLkTBUXqlXpi1MQJhEd
         XsJlxL7L4OfEQZtyXrEuqdxMN7Fm6MNtvLGe4lGkiVDx7dFJnNbF5TOb/TLXJgqijJxO
         tJA7eRXl3lELAkLSkZXY31c9tYaqEin1suNa4DnR091+nGNBJzQAj51lfxRaQGf4W22s
         X8P6b/jX0RG3F7Xhkxx0LgUcA/a6Fq+jaAGY73MnJnp7JriDh4yMNLgVHiJCt7QdH5eP
         n4cS6hlAOSLhhAuO3P1sCxFEiOjxoDefGnau+vuj/c8Vnnjt+rE/1LLzikn6aGHIWJyx
         crBg==
X-Forwarded-Encrypted: i=1; AJvYcCXIAcM5SYbpdhg9kVMsgwIDi4XfBjpgb3+DO2c/9GXbUwPbqJ9YxEwxxnmz8PrqTeaPuMcA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1DNhSKGyrMz7+GsSiUpnUuziXI+/mi7b05NfAdqxET9rW29Ny
	nA6msOspGpAYEl0CLWSjcveMa0PLElScWigfSRub/ykX2LKHokZ8kC0ibYMIJVzoAcHsJK25144
	83jVJwN+qWx7aeffUoOhaZUeHANYCwQLdmUk1olKGgdKmVPY1oIzckkMR
X-Gm-Gg: AY/fxX4UUhVe5fgEwDZXDx0VOOHvsXvhqabqeywTQvAnuKoywgE8LE/ed8s+iF52uhm
	pVANFNzrGW6ZJJw4MwM+6kV7ZAi2nmDUGobFIk4ZS9Klmwy26rOTreQ4UVCKOGe1fnqwjCDNAz2
	2ksNcvahsm3Lt5je/K5ENsxS6CdLms85TT3Vyjd50LSIxEX47+LLyT+Rn0gCcGtPkXsw3d1mvV5
	c5JmFm8vozVwyRGotmvrneOWzMz6ZW4PXuVi2F5Ht7YDTsSSh/+aDuA+X6eBi2ETM8iPuZcLGLx
	NEOvBptyK9JpY2p+zKVkqnRAp/klsJ4NBvrV4K6/4N9YLgirkHPRaOrf6hmwM7DC3iAMXZ74FbR
	uRF+PHBzD8zmS2JxHyrExY1MPx2Lb0I+QNdthDtFpL9Pb/LNO3RyNULJpjIq5jYy4S+JiKA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248360181cf.26.1766580286431;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTZXliHT1pgcb3I+/DNRDGU4Mh4keA+YHzBcuOF/mpCrQZKYCA78vOX3Oe8oOjwDHK4oJOAA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248359981cf.26.1766580286049;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:35 +0100
Message-ID: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k3fIiJQnt3//kLj8p1O4BhrfyE8J8CFmxoc44wKmiXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AxsqyFxFGGpeZZHIhCyKOnvdjTJf+CTZuIW
 G78x7Z+JzWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMQAKCRDBN2bmhouD
 17GWD/9Ixj1ULpYkMSdzu/q3hf0Kyx/91sewvClr8ICZPurrL/DEHrytAOup7j0UsUf2tqG+OyT
 q6YcG4NKAewr+dd4p6QyFCs6nsZ4iElL7Poc82/r2gIRHtRdWcCDaRZWlFvKMiR4pbqXC95Z0Zz
 s9fK2CprxcJVIOTMdjDqP0zIsBY7bn23YlXQmVkcnwj6tyDPDVeppRSNuLAC380N2f7msIhKcJQ
 hJkCfAP/LP92Cb8Yui3UoJ0pk0mYh2q1irGN9ANWu1j7Yv1py9TbXofb32r0aNUPL4eCkt6i9AX
 zFwqoAPZYFBnvUNpXZYwSzVTgpo+JA5kT7t1vKdt6z102UMhDrrYhFl/n/s7UnUZZnk+DiC45Xc
 GZeD1kOX3T1q3SuYwV8kE+G8vr+p1QLOS5wuBWwEidmkJfHGc/KRDVwreOXDAgeSMK93UbZqiDx
 +TXPEPeJ4QH2Y67axdeOdhhhsHD8xZ7XWxKOcjNoXkyIe26f4zdZ0F0NUBD47rgPILROWsCmicy
 waGD9LyfGuE8rVmiOhslBqiSQ3/fyNbBSlOfegAl1K/1fQHLCdl5E+ckDPH5j+NnzSiJGl/Ebvf
 jiLZwczT4DSEMogX90P/8nlA/WHEX+S/g9SdtVK2prE1TUsOpmany/Fame9afDjdsGeXptNT+8J g0yiZTEko+NQNlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qpKtRCFqIHZ3XdVjKaw2PUWmyLwTWRi9
X-Proofpoint-ORIG-GUID: qpKtRCFqIHZ3XdVjKaw2PUWmyLwTWRi9
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694be03f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=v5e_MpXYYeFlSKZv_FQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXyKMgWNpPdJPi
 pxTrQM81ho2EnwiXqm96rbkCo+aenYFyFb+pJP9Ph24y+iTAgK72vXwKsCagw2JM0bKw8VSdMc4
 7VgpFPnqmnyzLBB55uSxl0ilZHX3cBFAKfJeJM7OvMU32eD9VS1T79tAHSK7sZFVUhPpSG0/HrE
 ws6GQRkaN/ZDYN42mAQglFRnqyATIKCP5m8a91vYCG1YxdbGvOHilLJP/BObuDk0Coef0DTMuO8
 dH3AOJchl5hfBz5yJH810KYWP67XMZITA22dUamr8i0+Gvj3lQbcNDnVGX8E2VTmS9O8imkha1U
 FYLDEeS2WzyWJrdeDFaznSYjn2Qbr/DDDXWv9WitNSwrHNejIesdPLYfo6Xcu6xmdE7g2MLjRD1
 EC7+nnkL6jJ8CmmNl3dEuGRbmWcCCP0KsRAO9u7dbkKbLDk6gXlb7gnT+NoNrv7dKvR+Z3Gff1Y
 quLRX9/86WC7nYyt2eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ca97b01996b1..4296def69436 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
 static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
-	struct device_node *parent, *child;
+	struct device_node *parent;
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-	for_each_available_child_of_node(parent, child) {
+	for_each_available_child_of_node_scoped(parent, child) {
 		struct platform_device *cpdev;
 
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto err_clk;
 		}
-- 
2.51.0

