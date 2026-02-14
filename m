Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC65D2DCF72
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072810; cv=none; b=EBkLjSCFYxoSXuIv+jB8JBD1pYuKzxNPXTMz9ovnY1wLSPYRSBt6Gcaoc/rCP64Jl6mgOT4yO2s0aTWHxLqy9ci4CNBoI2VYTpZpzdk6FDhppKsdMDqYBPPYXvRm9q4JMq4PRHHFYl/Xn7A2JxVSj92NNNkGHET3r9zLn4q78XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072810; c=relaxed/simple;
	bh=w435g/GTAg/kMgq1giPwYvIojjRMpMrrnfqyw5prOlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gX3WQoSRxIPAU5jSyCuQNnW2Z6eZ44uVh+6ouy/mivI2feTqrbkmuFKHOn45tVXDOB2K/kU/rxKkdqLdrY+5o+b3XFHLQzNsc4cdOvMUUjRDNgxqHKKSmTvmW3uCBLoimqisCmIkTlZBg9Bxex/B9Ob9q0wXf74ROKXIHlEywLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSc4FFvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPwn12EQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSc4FFvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPwn12EQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61E9RuNM3398689
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 12:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=; b=SSc4FFvdVoziifDe
	uTvMLMdo5irHvi+JR/jOUaVgrHNb/xvZX84LaiCbwDjXNINRkxADhS4yQMzubt/Q
	pI7+cT3gM9k03Gv1M87FKDCIzODxUJJgw5zUFXMvScg9rloDdcr9sWlx6S7/V1K5
	MKQtutL5RuQ67RVo3r9JU4+hdxi9vYNrx5BR/Y2G5fbajbINuwvOvqbBb3Fh1yAD
	6Ow/xW8LEQ8cQwUJdrAFOB0U9JjyYefkDa23n5MBYkq/N7TMSKCFyWSLmv+w5mch
	9fbV47h7GtF1GYcLBVU+MN+6aC0wKu+5tTIGgBwEhMySHvxIZJJ1LllWpOZxPnkK
	+VfP8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag248u69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 12:40:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so694327985a.0
        for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072801; x=1771677601; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=;
        b=VPwn12EQffZI1S5kYAzeRT0O9FCgkiePcsKe6jll6TrXRF/PFZGBRm0mi8VKbAUqyJ
         ampZIRHeXgUBQMsork/k2u0l8cFn3QTHMj6OXkgugl+nafshm5i9J/rjNHwcASE8mhnB
         Qt0c/8TtEpqE1bx2K6LI2/dnAdAkJbqOsdq/9yCR6DvPYRAkW0EQrvzEJGQPXEQTE/XH
         pq5tJcwC30Gx0ETXvXKfYqJx9jqdOps9UWubXsC/okh8vBshE6Hlvza/823KD3mxRmQH
         rDg3BqSxfcJXvQA6OQKEFkFyZy1BoBgOC5a4Fac7O+j+yKPRjN8oFZ8w8TlhWLSDMFaa
         8fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072801; x=1771677601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=;
        b=Vx1OWhC/f1tGZtqCM1APBfczSV4jE8gV/Vl++s4WGCgKcf5r+mJKyk2EX7zj9dlQyZ
         yZ4OlImw2QICccimC7YgB1c9qXUSqTAH4udloXwILxeGFjRIaZQXwxTSMJiqrIZrXKmR
         uavU+DEB2Ws9ZqHZNJmz0r42G++DzhTBylBUkb2uWT7NvW8Lk+xfjOI1J6H+Dx168Rp8
         DlDJhsUYwJvwhDu25dPLIfXVQGRGrkHj9RwH9sjdwRFsQayS4gBmdzmtl/8N3Hxl87SQ
         nUmopcQamKymPsIC5QBxBbq3+WBUadrOXHDMB61GJb4bnWGbHDzdjsoZAmk9yTvUB6Mu
         7yzg==
X-Forwarded-Encrypted: i=1; AJvYcCXsq8EVV8IotIbpUHJrEtEyYuLBj2ONvzI7vPjdOciU0nmw6z3ki9QUqxAbCo8D4EQF5gFf@lists.linux.dev
X-Gm-Message-State: AOJu0YydCi8nRqHJGfnMrnnlg+ombmKLmte4lln3hxQq+ybiflUbej4j
	JYfg7MWWoMFIuXy4FupxNLg7b+rCNZsfJEzkZtFO+HdDQOVv//vDRtbl4unZcUoZDsP4ezdSSFD
	5jeWMd/jYZgNuLSMqMnrhqGvOFrg5cW8GntOlRaxfC7sfK6vTfFDJgtIW
X-Gm-Gg: AZuq6aJbO83BcYrxhgqk6SaXs9DbdbN92XJFw5lJ+lVEzM7RSoCavSQRHjPCHCdMvRR
	BkhySnEKQNJz4O45uTWxF3FVaabGHM4VZiAr2xU3i4ZxjrhF9GAQbQhFjcptwblVT1dG1wrJ2GY
	FIEPrBAWBOUkqYlcpo0FVzVe1nxFIbXY3aNAKxdWAlehw7mZqtaFNvAJE+0cHP5/gcEMdrvL/B3
	8zt+LpM3d/D/PmyupUifcRA2kQtF6+lWgVZvoUT4igHljc2dWLgo+7DUB2whA8IM6pDHu/tdBM3
	b8FRUtBUHLyj8tgM6vbl8R/njEs+S0+rrK31CopQ7yGRK7EMnmAmqnKSe9x8oFulVcYc/vBb45Z
	4MQtBzti5NoeP+qz6ViOKry4+GDxc2V7qsclphnpzBqQQWw==
X-Received: by 2002:a05:620a:458f:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cb42292883mr566295285a.40.1771072800715;
        Sat, 14 Feb 2026 04:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cb42292883mr566292085a.40.1771072800313;
        Sat, 14 Feb 2026 04:40:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:39:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:40 +0100
Subject: [PATCH RFT 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
In-Reply-To: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w435g/GTAg/kMgq1giPwYvIojjRMpMrrnfqyw5prOlY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0auJjvWvtViwj+3URxBEvdS6l5B5NcdVtxv
 f+Z4/iY2h6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtGgAKCRDBN2bmhouD
 10r7D/wJqITFeImOTZQlvOwL27IQZS47P++ONtfI8h5qsE9Pp1HRktjJRqETP98wEorF31QPEcR
 oMhw0XVawmHexSktb5UlEYwCTh2j7wxnOuf3nrCCbSSbPn77dRIErJwFOY6s30txx1ptjxsyw3w
 F9klOwufj/mEEzAKcvVy8Ngn4fpyyh0aumuL27rSjq0t1bWlwNmU76Wfzv8A9sMwYB8ZqIqzF3Y
 84RiTNLmQMw13KF1ejQC4cwCC/d05bDMzNrKB6HfBuC+dmVdIW4JueGss5gTNAu+GfLbynIed61
 lF+D071KcR4zN8U7RJV1IBd0Wrfj5Qmbsm/cO/fGh4zhEhfbMck5VpKv9qUrpCSu0S6m+wgrfqR
 ycbgklph6fR6gw8OssuZnltif/VmlChgxMVyumhxocllux6CNxdp+nSkl3xGQ6ER32ifq4BNdWz
 Zaef6zUcaM77f/tEeUBo33hduoPaCI7F776hvFjDxJwFTtwCahabOTdwUy9xhZ8PCU6TdzezIEd
 YlnoQMsQZMxu6wnbHJt0VKg5EjKpr/CO/yH2m5CCRF0VyWgVglLlARPjjDU72c9R9F0/oJcrxrM
 0x7ev/F0qbnAyvYgLksvgEdCxYTqJVO6e/V4BM7m3d77AWW0kMajvN9WZ2npwdCJtJ/wi9w/JeV
 Egz2vz70AG/whEw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: UG2yzVJeXzzE5r5dEXmRnnikknko_u4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX1YN9BFlvnnoL
 nRDVbMNo4Lz+CUFec7e5diYCF3jDbMkZnAe0AFLTKoInL3a7qxPt6RkXzE9JNb+9obyKwb5wn6o
 shDSluABj9rhYbILViSvGIWKSa7Z8Ed7BaLoJjwxX+IroMsalOBLoMfmZty2YBKVhsM5EGEVnJb
 /SWVSqD1CsAzoLm23x2EKwUIPbwvEBzC8jh5AXDt6k71QCRkPSWwd1lSLGAoDtcM1MYJmiblTfY
 kHb8MSuIlFiF0SxEI1aqYB3aMnWULWWk7XvZCneL4yAKlOne7xolW34yQLL0Jj+fATGmIeck1MT
 Kw7Xf2jCVitJu1a6G3i/42f3xn8TdGGks+0QDH9J+hzLPQ1coq8dCqFu0G7bctVjAp7eFhPTCM0
 Gy6zIA15mrViUHw1psIJGyOVdC22jgB4Cn9Q/zFFVHPiBjClGgXZ+8CQEK22NH5e3DZpe++5nUO
 3KxlI2Ih+3PtdyPiQsQ==
X-Proofpoint-ORIG-GUID: UG2yzVJeXzzE5r5dEXmRnnikknko_u4_
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69906d21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=sC1DaKbfRzUqm1tOYCAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140102

acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
as index of array to map them to error codes.  Array index cannot be
negative, so make that explicit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..44265db34ae6 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
 	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
 };
 
-static int acpm_pmic_to_linux_err(int err)
+static int acpm_pmic_to_linux_err(unsigned int err)
 {
 	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
 		return acpm_pmic_linux_errmap[err];

-- 
2.51.0

