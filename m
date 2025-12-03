Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68DC22D7B1
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771413; cv=none; b=W9AX2z9Dxyjl+2972FLDzb/xfrqpXGDL5BjIvCBdq9rMqIxqGS9n527yzbO6GkE5+ajpXVpFn3DDxZPkmW4It0k8twMoM8rXXi4gSPNgWEptSDqXd3Zii7dSylMS1z3abp2bhcqgIk+XpHvLEozTU92/rDLEH8rNSk7QNabbxA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771413; c=relaxed/simple;
	bh=e+l7lF/YaKWFOMlUcwXbeT1V4Fhpjbegvq3plNh6NC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qs97xULw1uGF9ytFu8xHXJrai9m4KHJh1caEcz8ucm/eU2Nyc1jcqvtQ2Eu5wyuVGS+8Bq3tRaCz4OfwG/1yuHsyYChFk+ns2QESLcLKwr7CAG8h2dBUu7XnqePAJ1K69+Bape30QFYdanTQomF3AJSauBTbuCqcDRtnnD8wiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4Nvj6PW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7oUI5S5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4Nvj6PW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7oUI5S5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B4p3X2627183
	for <llvm@lists.linux.dev>; Wed, 3 Dec 2025 14:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J1NXnOkK/Qmx+2DM8A9HAXXFuC7IO83iTO9
	9OYxwL7k=; b=T4Nvj6PW7LMBuAD4C3nSKwZb/0hdzFJFRE0hQLWgBJ3r1BEdDpv
	sEomukT3/gukYo22s1tVbVTNdg7KfUx7L1bFYAOlRLWzm36RfqFYM5BwNN9tkKAP
	kMCWkESEvpCwB75lnXbBuUJQN9BEah5MwIYa66YsAjY4Ymtw6PUFOypQsVEv+nRl
	+cFANBqT77/uoPovBH0DDSMuq6wHOpdXhzchK1KqO7pvG0nizQRDs9JF8C74us3Y
	jAYTnlHrvzaf5YLczsKY4ooIFKVL1EIM5llfzMAP2oUFADdO8MeHX1AmJilrKjSQ
	7l3UAqxTNn3lmk9im1tH8fXtTxhyX6s3KMA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm128fea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 14:16:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9353174a042so2484263241.0
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764771410; x=1765376210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1NXnOkK/Qmx+2DM8A9HAXXFuC7IO83iTO99OYxwL7k=;
        b=T7oUI5S54Y2IUKdUEPpJ2QYLHnE0esYyJURWa0Vz2DHG7g7HZwIVsPbwF4eeoD8GwK
         /s3HfBQ7rAwjrdQavD/wIaNmEXKyzVFIIiNgtjPcwv3Be4sH3NXRjm1/LkP9/Bop5r9d
         fEhvbJl3UG+AVegbO6uA4sy9ciPqhSpO43+YKslRhM7XmiwYQOYyLNuyiSJ20Sjb9yVV
         70g3/lAMQRZfXHSu1m82x5xO06OMx0VhS/sBoTyzlyGKXm4gOtIO9wRByzPRAt9jvCVy
         qFYOkN7a7OoRv/Pfwl5K/J9NsfQBnvzrr4iBu+Y/vYl8gK8ymCnmKRLu9HXfXgnJUSC9
         G4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771410; x=1765376210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1NXnOkK/Qmx+2DM8A9HAXXFuC7IO83iTO99OYxwL7k=;
        b=lyJxTux0IQA40My6E4KzFs/mJ9ZBojEPbihWfd4nwbQCStqt7u3U3vXY1WD2YyEfLk
         GPSKUSHh3pAQyB9xDew33AKXN1rTfbDf9qKl+j0srJr9WSSCTvz4VFkr2AIx2zFdKhJd
         /zoJ32YkokRQWCxL/tTsklMC8+T5EQR4LMVpE0Bq8+3xytIhrs7oco9/8zVpGsEUphFb
         hAKaLOW72BPOllU1ljieiQi/nmNY0XWsoy45hpBiDkKJcj0FPCRLseuLQFEY44vT1l8U
         C6cxWwMf1fJvSS/dP7SFl2Us5Xek1W6YMAbwThfIElsP+/bFGXME+i79k8dYeuAsPQJU
         v7/w==
X-Forwarded-Encrypted: i=1; AJvYcCXMm8QPLdO8jkPraSeIDHc776fvwX57UDaxFn76VtsLTG4urJFtQDCQzzKkunZwxOfyvzW5@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4b/MbmOfLOaU6NkFMbvSuopKQfrdDRVqS9PrKjg+AmjSVyM2w
	FI9wv76IMKbPOxSLU4VhVTYUml0gqB6ZRC2DgoEGJpYHLSfD+Sr2YuRIh6R7DJBKE+r/8Y5Gnin
	XGU+ZAwNxDrIQd4NpY6u3EUIhAjZoXLHHol7bZXqmjTO/Ukt+4yn48PKo
X-Gm-Gg: ASbGncuJc7RJTRptKillUMOcvxejlbRtszsFe0LGVn8VJw19hrVsA52X7RWi2c6laRU
	5pDVwOGBASELOEHYivFMhntEZsUcc/IszjcunsP2FzH+V8UVxNm1hv8pLH3S3MGLxBEkDE6wlAl
	sBbXOxIr/m804UDRDuOtG/xH4P9XfStOkrMEpt+TbgI1KJse3SZQ3A47YhXhm/3h/1jf0V3yuom
	dom5j7P3pdvGj9eRprjYiVsF7bq4dbXYg3tSoRzNnLltWnHwU0GdzORQ6En+xC4LNTcJfwUuxKn
	dsckD6vNQXOIUsd4qaSR1GjvdG5OxdIGnbR7gD13kfCpncdl+6maPpDah1jkQvzNBcuFfAMHfVY
	SURNRgxG0XWVOS9u7Uzv4I1ykKg==
X-Received: by 2002:a05:6102:41d0:b0:5dd:89d5:6e3a with SMTP id ada2fe7eead31-5e48e25c303mr433170137.13.1764771409982;
        Wed, 03 Dec 2025 06:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6UKsgel+cVaxSmIsAYQXFf/qA13T7aiQPxMIWubRyO4RrLdF4k4o44RBgxUeSLImnvFEcyw==
X-Received: by 2002:a05:6102:41d0:b0:5dd:89d5:6e3a with SMTP id ada2fe7eead31-5e48e25c303mr433111137.13.1764771409564;
        Wed, 03 Dec 2025 06:16:49 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccdfbsm54150365e9.14.2025.12.03.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:16:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Wed,  3 Dec 2025 15:16:45 +0100
Message-ID: <20251203141644.106459-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=e+l7lF/YaKWFOMlUcwXbeT1V4Fhpjbegvq3plNh6NC4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMEZNh7FzwkphP987MNUPpfj891znTilxMoU1S
 hQpihSCWvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBGTQAKCRDBN2bmhouD
 1z5+D/9AxU46a28I3HA5bV2iDbqiXwWVMuhAz8E7pGzces9eaJ9jsJWAiEZAQgDRFpf3xiNV60c
 jZESmF8c8nlzcjuZL6PVkLkIHWCI/e4vhym9/KBwVzzTOfgfTGBIdaaOZL819ewTdsv7Ys6z+go
 nj8JRixBSMCQUZFCpNmImlMyqvhsY8BW5J+Y7QE9s4PH3y4kyfcm6WRQ3uFL1+qLceX2x3mWBEE
 itsfGehzJzQVc5UrvZmYrmPPGlZhbxuRAEhsSPXFrI1/R47/7XHKlVRracnxV2YTxSXu15JdcvQ
 Yjfftl/HUci3zlqiA6YFLdbWQoNIZkHWiOJvz8k6Td4Du+qkI/pvXGU3sdac9FzYxKa2+HtcoOd
 Ppe28+7LWcDPno5IEUr+sv1EYp23K7i72un1hT7zJRB55NleInx4UNGj6pDn36CTBomGj+DDlp5
 I8g83A/kec1J8b1TyYOd32f+i8991NII2igO8nQe7aDVKaVhGpTThxglLySzZcrGFZHUleUv4QG
 yxEkbDf/fR4uLjPnzogYIeku43EVHxXUzgdYpM/eNx514fcH2jd7S7ugf6jG2sr18EygsWb3qki
 34KA+Kd7sFi4y0ffJJXa7abnQ+TddMEK5Oyl/Uq4gfoqvrDSYYO2MgTUq/Rgc1DFuJrGqoOB5fC 0Zxs0D5QfcpSxnQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNCBTYWx0ZWRfX7QvGyDW3rjdo
 txdbPm3+sdHrCIFjkUxQW5/wK6eSa8KP90LCZ1ivajbGJrXkC6Jt1W64MUMq5ycB+ISYGItvNLy
 vZd3SrdEgg/ASvWbaLdeBDVy0BhgubUzv9GXREMnCdhm84FIvOAfnsG5eNJMAbkFUuEnIn5lyG1
 GxtTMfytqkQWe4gsGHy+RcVSfY7ayO2II+G2ESkJkgY/QStu5rPmZn5jYQzpECRKYTGUt/yLKxC
 YmG1FG2Y8jyF33b6SW1xkeHsojQoqPUpLLovLcumaQ/hNe6TeRj6V2b0gDOHSRKXofRbzvMZALb
 T2bXq1vf8yDexFePYAIODX9TTFZCyfmHio9IFQl3wzLQFlToRgiafTuc4dAwJxbCuiSEruIItwo
 Pgd66H4OzJWPy+5D8irt3mjvCPv1Uw==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69304652 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=big8P1NimtFHDgLWMZ0A:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: R0WejF6CKbGXPwDaoslO-JMmdSiuwpQs
X-Proofpoint-ORIG-GUID: R0WejF6CKbGXPwDaoslO-JMmdSiuwpQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030114

'version' is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  rockchip_pdm.c:583:17: error: cast to smaller integer type 'enum rk_pdm_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

This was already fixed in commit 49a4a8d12612 ("ASoC: rockchip: Fix
Wvoid-pointer-to-enum-cast warning") but then got bad in
commit 9958d85968ed ("ASoC: Use device_get_match_data()").

Discussion on LKML also pointed out that 'uintptr_t' is not the correct
type and either 'kernel_ulong_t' or 'unsigned long' should be used,
with several arguments towards the latter [1].

Link: https://lore.kernel.org/r/CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com/ [1]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c1ee470ec607..c69cdd6f2499 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -580,7 +580,7 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 	if (!pdm)
 		return -ENOMEM;
 
-	pdm->version = (enum rk_pdm_version)device_get_match_data(&pdev->dev);
+	pdm->version = (unsigned long)device_get_match_data(&pdev->dev);
 	if (pdm->version == RK_PDM_RK3308) {
 		pdm->reset = devm_reset_control_get(&pdev->dev, "pdm-m");
 		if (IS_ERR(pdm->reset))
-- 
2.51.0

