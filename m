Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969412F25EF
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615615; cv=none; b=L47XCQJHW6VQftdgVYC0xj5l9/XIIub6lOIK3KBk19pX530YzDWQvYFy6qC4ef44XXnrUXVqU4W+/PMH+lREwyWfQnW4V6TSEWOYJNBZKT4gGLsftlv8qeTdjPUjWo5JHhgbFiueHzViUTfl+Pu7axynHuOt6WUx85vmCAtmcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615615; c=relaxed/simple;
	bh=iSes7NtggCn9rDTi47Zj5IlDGgC6owxwceTMoGtsOuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPmjCBL72yQFs4SCpN6avkk5Fz5UX8jKNruRu5Zym5KyhLQSQ0z2ZJ62Sa/B5XRUjaSBAxERwtN3Puk/AkiPIJyEJ80S+/338KJ/aBZZEorWJjS22r16tkaqYExqzctgA3p9J3F29PyVdkfdFnYPtsqQktXFiA9u1VW6eAskCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+yezn0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwVbduZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+yezn0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwVbduZ4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058N5dr3875883
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 12:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJB
	cBn5HkZs=; b=e+yezn0WLbtG/0D8yFEAPm7beZpEby05uLzJZ4mTBJDzt6483wk
	i7ZM4NYRBULvAYvIKnav+PJALvmTf/pVFpVz3DCGBUXJRDrguTL3v8N/R6EWXsVV
	acRGxUvATipI9UeZO7eQnoF8txzx/5raLaeF/rwTV10gCWN0IZDpa91AaEe8lKZ6
	v1JL9bcPJ5dsTxeQQwsL82p0pqP3NT3vxTjVmiFrcoUUOzdlHhY1+wsUc5RtgsEg
	H6PpW/0MejkhGJa3n8acynlJm8VVbwDDPgx8EIXdR7disAga88wZE+pnvY8jLil/
	VYteAr9UhNUov7f784YEdIuckYFP/nPwU4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hwkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 12:20:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so521525821cf.3
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 04:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615612; x=1768220412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJBcBn5HkZs=;
        b=hwVbduZ4O9PBabTGaVG+9Qkgjo5Odjc7orgNJdVZaNvvijNwzmBQl0/yIV7EZqshFS
         0uuegBFueL1Y0B8ZKOy4ld7DzVrU3V2QfPDZlXGLb3PBEVnW5sg1srrMH+9966iSn8O9
         1zJIfMGODmko9CtCelvdPD+AGTZJV1mXltTSfSUyOFgq7OyL+tNHG/0chxO0HIQaJtDO
         EDOxbbpayAILetQF+eeMuVCwBf/BwcrPyXcr4ekUyjout9ngmX2g2sZvsSjrrSwVxqLj
         2Z6QYmW+Vw1xMU40g/qjk5hTM4ELmElSEKBSqdR+jKayYXx83Eg9wEoAbYv6mrjddD3p
         k0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615612; x=1768220412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Od1ux7NUKeympDQjHbBfnoZQCpLUBPeJBcBn5HkZs=;
        b=jL5F9YeLhmi1WE1GlRtjMLmCD7wM7u9UJgJa1UvWM8qweHnk4OEm4lmi80DZNg40Jo
         3GJl6WQH6gFbuDdP9DyRnAIpckpjwT9cUrlvYFf7FczYIHhpnyzPS1XWkRZbMzI7iAs8
         3RACMjrdoVLWimzJXn0xWvEuhE7MR3G1rpyZFmX3e/jer1Gra5y6G87XebpSkgd3Oamh
         6NOi1RCe3xe7njjIPVphUq7KYXAX5AfsfRGvwBHxurwbosp8cMgG1Owh938feHIVq8R5
         M9sK2zzdsCbKM+hytmx/ZnZx42Pj18HKeRkAWiJKPpP60hxOQm23r2jyGyUYvwUX3vVt
         P2dw==
X-Forwarded-Encrypted: i=1; AJvYcCW+qQvNf9Zf4+Q6XBWb3QizKDgjs4tBsc0VknL/CGjrDUe/H8bumUwlSfU3e53+I/Wd1YLw@lists.linux.dev
X-Gm-Message-State: AOJu0Yycu92OixeKEO8M8dmP7tG+EZuR4A3H4X21u3KA7Z2zJH840zeG
	FilA1XcI2cDd0FyFcNbpv8z4FHCviqsFTjZXnxQ+P++HeOvtiFXmsW6DeTuk6TD4fQfnQ/7PAh0
	nGeUwDjf9QjQEDgVk8klCF9+Dd3tNlHj2s0WMd0RRJvH+jeEUC1NM1Jcl
X-Gm-Gg: AY/fxX6jlcyW8kKwHPhJ99vqtCzSBwE66NghydflSzAYpFSxY3k1rnWkr55Qr+JGgoY
	UQvtw7fm4Tc2cV8JVnhRa2iWErBlF6LmP9GCKlgnGSDWff6pHeUV3FyOVyf9m9DDvGHvjEYTFIl
	5T3lLlqsmkHPbtOQLZ6NPn/0R8zVpYuOf+J0oO2ufWwXZZ7SqlLGHFVL82IHuSt3wMRjjwMoo/S
	NshO79cummsWRftc7nK0fYrrGQ37G+xkzt65UkJneCle32D3LTBXNsSR+IbXLihajm6N5soOnqJ
	cb2VCufDJdOAxKThtVpbemdENXlYDiSEan4ag502REszns6jaMk4u9Hl/ZNnlnsmHlPBMof+OX2
	gzHglY+vW7Up2ItmX+0mejGrzkQ==
X-Received: by 2002:a05:622a:41c3:b0:4fb:f92d:bc8b with SMTP id d75a77b69052e-4fbf92dbfaemr177037111cf.18.1767615611636;
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiXk6WzEWxpsp/D38WOTClmOKqYEW5uwRDvmLLQhUeX+3nrB/Q919pNYmXR0aBWy3IZu3dcg==
X-Received: by 2002:a05:622a:41c3:b0:4fb:f92d:bc8b with SMTP id d75a77b69052e-4fbf92dbfaemr177036701cf.18.1767615611067;
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm95467266f8f.2.2026.01.05.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:20:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] powerpc/ps3: Drop redundant result assignment
Date: Mon,  5 Jan 2026 13:20:06 +0100
Message-ID: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iSes7NtggCn9rDTi47Zj5IlDGgC6owxwceTMoGtsOuM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW6x1ve0G7zzWPLkVMTQao552w1nzbW3QZQ4AS
 IM+Jx1TlnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVusdQAKCRDBN2bmhouD
 1+BJD/9u84ujTaomEfOILbLgHUm5i+2BLe6EE7dMcZBuJyMrPbHOuJH34yy1JXs99mLQkSSwEbB
 VW0aV1KTdPhzlyZCumj/QMMzpWi8giZoDNVWXlsh3ErnETjBMY6lsi8pJgWfsfLr3rI3BT1NtM6
 QBJSF/LEpYx0kVTB2LyGaGa0eHWRTS+i7XsVL1dsZxIkF6DHWjySf3f4bA7kG0YEgupQQaekDJT
 iaFoXjRzNvCcFNk/mrDFw09TKOK1aowdmg76RFErqVxEe8zcUDj4shP5Z0V+1sx/kJRLpn5g8tD
 SDOjYZ/wXiC3x4VLAfYkFFPTtsaG+RdfXcHlD1iFcbXcs4C7nRxNPRQQnqbqt6PLjEeo5OcGb9T
 5ySR1H9oRab2fsWYhIuK60YWZYoa143FlWa1siWgjFaWSRgRF1GuW1b6O/fDaIJ9QFhEqAS+8sM
 qgpK5BNvstxNw7TaySwqiaKY0Pt7BIpVeNn75+Hb4AJn179Zn8PoeeOHxcBgxvHQBc2W2spEOTy
 zhhpMNx9ApD4C3OJoznFQwP3lD8RFDXp6gjR1uFlZjq2dXX28KRk8I9k0WAjpZjHdb7qARrw6gO
 +qx53BZ+X0vyKyCVtTHwsBYeylXIwXjAOEBVV/L6l7w7SLRHVscZlm6RRveoPbd9uFRDdZVyx4d 08rbYC28fRApO7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bac7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AlWDwjukKM133PY4UH8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOCBTYWx0ZWRfX9iS1Yz6ivefw
 cxeg2hNyevoYwy++SM8D2nUlWJi3Oj5wWHD1DBd/ULdpiQ8IJCG4/ow22stABBUo9LN7kX8EKYC
 pCVHLNXne7i23B7UZWQRV6ST8UGTngUkDIl3wO5pVfnos/15YEsJmJgCMqAyQJU3Vjlktb39wr3
 1MQVwVhWFWPZ0jonLBc24ht6OWSJ+Pw/YxHh5dwQUr8vPXDJCJ5lXlIfIUT/1qwnixRgHILE0JB
 3j3g6S/LFZthnhsXdpR2olxiF6/KBpDYOgmH0MhBbghMtKe2+3uEFvvzGt99l6yhZVY7Bu2Idm3
 cB0GsZacSTF1tZMNXvkj1yJZWbcj/vCgS/j2oXu0zM/fKw195y2SUvcKUS0aAYNNlRyOy9d/L8J
 vnb8C4psizLLoMLXykHqsN/jqiU52Uc/3Hv/EFCiuACDxQlYavnh3ij2LfGAjSlfeYuVFr1PDjz
 ctuz2dGhPLDLdhjrYIg==
X-Proofpoint-GUID: xnt47mSyVSQlLiyYRgazNbTBP51Zofp2
X-Proofpoint-ORIG-GUID: xnt47mSyVSQlLiyYRgazNbTBP51Zofp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050108

Return value of ps3_start_probe_thread() is not used, so code can be
simplified to fix W=1 clang warnings:

  arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/powerpc/platforms/ps3/device-init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 22d91ac424dd..3ee77f0b42af 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -950,8 +950,6 @@ static int __init ps3_start_probe_thread(enum ps3_bus_type bus_type)
 
 static int __init ps3_register_devices(void)
 {
-	int result;
-
 	if (!firmware_has_feature(FW_FEATURE_PS3_LV1))
 		return -ENODEV;
 
@@ -959,7 +957,7 @@ static int __init ps3_register_devices(void)
 
 	/* ps3_repository_dump_bus_info(); */
 
-	result = ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
+	ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
 
 	ps3_register_vuart_devices();
 
-- 
2.51.0

