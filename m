Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCAB21B918
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770794; cv=none; b=knVr8Tdf4pwU01QeEMtCoE0YxHFnt0HMz2PwBTFmFSKo+h2bhTuq3OM1IefUCUKfGwX2VWZ6H3PsqbdqK2RDhm9TUMsJX4SNwr5DsKcfqldZgB67d/UQ8zKze5fJi2sEo4KSV92VaSbchYsi2q3HLsa5j3/tx7Zyn1FZ8FGWDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770794; c=relaxed/simple;
	bh=ULORD3Nee9iQt6IG5z5ND4VmHm+dsifxczAT6/IsbVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzSk3ag8Y05XbDllmK8zMfmfToAWgnvaR7FVP6hview3A7qLBoZV5A/KvY9vZmL05O3o9EiDRXd++nu0o4gi9OdaTDoFdnuxC3PjdzJ928QIUXFpJr4yNNGxiXWji84C6CcBPvi5t3YrANQqh/oJK69O7fU7PppZek74M7ATWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtVkBttU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfktfrCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtVkBttU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfktfrCm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3BReP71968405
	for <llvm@lists.linux.dev>; Wed, 3 Dec 2025 14:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQ
	UmRxj4gU=; b=XtVkBttU/VErFv7rMCFAUD7QY0m/9kah7KTLM0Pzk6wHEEpWkKx
	NWJa4X3j55fEBgLmeeVEYVqKM2juJ59s+zBYgvNp/sGNrJMJaV6Bfc6/AySV5FRw
	xvQ8rlW/DFVEM0AhzRPvtsBVnPCxv/kETk+peSdXPje7tXa8S5b4RwXBpl9z2mW/
	742KNUZRYO0/KlDXzh4QyoysYHGW9sB+VSXnHsKGRT1W9wdXOG+xMUvYEERMCkfm
	toObCEFMd9K8XHDZNSEGVim0cI0gD/SLm+cqtVa11nKUhwSu+i57xANg2VoV8+BB
	fMym8WFz+pD+OORobG8MmbMr8Wuo7Bh14fA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtgcy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 14:06:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-937213d39a5so8324342241.2
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764770791; x=1765375591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQUmRxj4gU=;
        b=GfktfrCmNQMh5CDVYl9uUG2eXchVCWKdWnBgjKgRiX49eHrfIbyDhiDtBzOFZxoYD+
         tXRb6Dp9c2WvE9gOfsAT6nv+KaLRKSldPYtbEN1NnFJ2n7g6XbIwpiglkxdpegwE2q4M
         yLJC4d+9BlD/yraMdByYv3EBiowxV7OVFBXx9LUbsdUnwNdIdfExRxDFHKwm55u01ayM
         z/ITgdwqFFBj7StC//72olC2BjTSCim751ED7KXSFUJj2ldZZrJc51OKwQh2fMxsE3S/
         kGP4jCgDzp/TPJ+x/Ep9TWverR0udvay1dyICn+PgZqF02XLe48ADnVDYFfVJf9mPXC5
         GKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770791; x=1765375591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUOiQ+4tRELv6WOPEPoKfZ0qRhT6spqTIFQUmRxj4gU=;
        b=CIh8lVrSH5BUwkk6oRhjP4ixIJwYPygACfosHBuSZN2QjRlpN3c5qnmmFQJAHE6s4a
         FGYd4H4TD3nP2VDEcddPDJ2eTdvYjX7iAxGpQZUx4foPtyXYcCxe0ds2k3TivTWRo6c7
         Atj5UX+DpvKHlU4tfRyJv8A63Yfm8hK4fQr9zGTbsjRUXq1pyy8AbXcfyBFlySw96jQY
         aLgzCNMrLmD2gGxn0bFikwh1XtyPqITATp2RUrsXvkFaMfBbs4Nu85KcIQ/zY6pxuVnj
         61585g0csmogLt5+mFhw7GMRhcdwidEQsJ1M9sTwSV44b6/0F1z4AIA9zLjmRs1jUJLK
         ilxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnx8G2uvtYYzonZjUF/5PKrrxUEfVCmvLHo0f5a1YROElDYvkVq8NqrWB2CDbgvZtoA9o1@lists.linux.dev
X-Gm-Message-State: AOJu0YwgX0f21K0RlFHYuiD+oM9pb6E2JJmBzXLpJo4G3EbjcXpBmXCd
	V1bVa2Ie423zs8sqwaBw9Hlw/AhfIwZ3u3CEiffjuoW2d70HOHyxIrwusgK0AIrEXi3unMA8Hj8
	1xqNnqmKjiAzeGY51EUcylUR1XYngxlnk6qETbo/NzNnluztUve6C2m5y
X-Gm-Gg: ASbGncuLfcayRgRSse66QIzpT894vVoxDN1U9EK8x50ZsM9dxyKbk5B3ubM0q2TN+gp
	A0pK8HXdFRiVr2yGXnxPEYqzwWjEU55PtOakfEA4sigVjslv1E5zNEvNZmaDBOvGmjWb4xa0TsP
	9r+7R5kz3zxUm6at3rU2AdUcyAL6k+WKafx+aUoO59x4NMUxgj21rtJZBrz6Fev7GM0GV1w4KXN
	tNZYWXxys5OC7tzklxVzmAPCqkNC4z8g0LpRjyIVsjvvY686N1HZR5pA0T9qa7jJ9Zs5q+cABV9
	7oGfBPMLDO4FP0zWhzPi1ZHc2YZu5RuePE80kpRv9kpil0rWLftKlLY/dZ/u9mUcQzqUg3WiE82
	VxrUfC15mByhwB7TMHMHU8sjSqA==
X-Received: by 2002:a05:6102:3f08:b0:5db:25b5:9b4f with SMTP id ada2fe7eead31-5e48e336a73mr729333137.26.1764770789988;
        Wed, 03 Dec 2025 06:06:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Ehkc5vdz4n+xhETW2nUztusFVbDphsyvPLJ9Tv1PMzZwViPNNdecsSwshFOFC+SeK3YFng==
X-Received: by 2002:a05:6102:3f08:b0:5db:25b5:9b4f with SMTP id ada2fe7eead31-5e48e336a73mr729134137.26.1764770788498;
        Wed, 03 Dec 2025 06:06:28 -0800 (PST)
Received: from quoll ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccbf3sm52590115e9.12.2025.12.03.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:06:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: nau8325: Silence uninitialized variables warnings
Date: Wed,  3 Dec 2025 15:06:12 +0100
Message-ID: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ULORD3Nee9iQt6IG5z5ND4VmHm+dsifxczAT6/IsbVU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpMEPT2hovVVp8ix4DQsWVMCa+egexZ4u26M7Nx
 t2vT6lvEr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTBD0wAKCRDBN2bmhouD
 17RlEACFWTHmhEw+KG1nxyfifW2dapBHHiRzk06E6asHMNjeI7PMuStEij5EF8PdpUgs7JfW0sf
 iEqU/DmzX/fMBRXA/vg3d8rHcpBVdHJrK8lnUKvXRh0XLEp8zZCd/YPmhwBuheP+oUjor9hzmwO
 C2ccYrEYrlmYDz8QOKqOL9TuY+W5R3tVloVi8I58pDO/vLPpC+pFuW2tRvxqPXhf7VCaSPAA67F
 Wn3o4ybfQpfP6cGXHPg4mlyPWRyMg1OATOTJjVHGUfDvYcpTWEA8SoTktHSDKN/GcU9Fpw0sh93
 kjj3qSexXhfJCKFb55ht9Kzqb4gqmsgUlx+5XRWuYU5mnFo9j8sdYpmF4THSwyBDDu6btQyI/wP
 4Hb/DGtcx+5SQ8H6HUfrmbDgEoNB6pslnEfY+W5DfWfCaow30yBlXC03a4Dq4vGiRgthJwoFKor
 +rVeGHoWSQQ9nOLCjHNyNcVdFWREqTzvSOWnoZJ+CTPTmcodk5Lm6A+qbdsOb+AX8+GEBA4G87v
 xRoOGNY2tfafpzVPK6sQimj72Rrp5DnLE15e2DY6zeJwsfeuYaIjhhj5ngIo2N/72I6XY2MGm5U
 +1hDBnDJZ1NWpFdZoklqIbPmipY/FtztM9mKbd+p3J5HYvIipPZTh++mWtXcQrt8gB0LummFnLH y8PZYX7VK4xje/Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693043e8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uI0rWgL3eINdTr64SRQA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: A9dgUoMEalCxFdmM3WYKsTxKrnOOgA1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMiBTYWx0ZWRfX4oU20IS0ru8f
 55E86BULdFkqPA42M3g4OPIZ1AeS0h/QzLj1vZOsG1LeR/+l7pvxJi78RQcm/N8Nq0YDYY+cfn+
 XkCd4JYJIAsRaaNypGPNzCBEBwWuNRTmvGycDnq5vKAl9o0oW36lxndggqrTsPjNycSaMZLcgDe
 6aXwIsUe/knlDpHTRHtcuHMigBAaHQAXrxeW4NFM5H5snUVHsCzxj1Il/MNaKUj1krdf70dRzv6
 iTbPzO+zHB7+aKuluIfiie1X4lkawMHckrwzqfrqc5h7P6hpzrbP05Do54euzG6DRgiT+Y0KWfh
 p+fn9t3/QbwCC8lrvtlLUvbeiaPjwsI//1e14Rm4fCMnLgoXss1AS6N438OUjhpWxvgPK9jkBY8
 aERH+EBbbA59b03cPwGVVYOQOuJzOw==
X-Proofpoint-ORIG-GUID: A9dgUoMEalCxFdmM3WYKsTxKrnOOgA1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030112

clang W=1 builds warn:

  nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]

which are false positive, because the variables will be always
initialized when used (guarded by mclk_max!=0 check).  However
initializing them upfront makes the code more obvious and easier, plus
it silences the warning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/codecs/nau8325.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 3bfdb448f8bd..e651263a9812 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -386,7 +386,8 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 				 const struct nau8325_srate_attr **srate_table,
 				 int *n1_sel, int *mult_sel, int *n2_sel)
 {
-	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
+	int i, j, mclk, ratio;
+	int mclk_max = 0, ratio_sel = 0, n2_max = 0;
 
 	if (!nau8325->mclk || !nau8325->fs)
 		goto proc_err;
@@ -408,7 +409,6 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 	}
 
 	/* Get MCLK_SRC through 1/N, Multiplier, and then 1/N2. */
-	mclk_max = 0;
 	for (i = 0; i < ARRAY_SIZE(mclk_n1_div); i++) {
 		for (j = 0; j < ARRAY_SIZE(mclk_n3_mult); j++) {
 			mclk = nau8325->mclk << mclk_n3_mult[j].param;
-- 
2.51.0

