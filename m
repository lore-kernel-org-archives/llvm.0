Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AED311C39
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181389; cv=none; b=Z4eGszxa1tiphm2IJgm4XBmnY+5t3/6v4h9g5QrRM+CfGZMGjFgE6lxMdLNG0rtclBv/+1Wk7CTASwALz0aiIj2YAVf1RU/H+2JB53WECkpOW8otFetllU8+nyY3/Azac9ys2nqKwHvjAUqZz3D1zuYdeeGsSrg30ktMjYgupro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181389; c=relaxed/simple;
	bh=NFFsdkSV+yVrTmxojDPz5w6sZ+BskvrlquvOCjQNWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROuuQFH1lXLfVmsMWbIY+XPV1s036MvCJl8O1ILHgNe1YDaqyMaMldzygAEZDmHiurWYqJeAOkI2tQE8+/D93NpR5EqlNU2kS1urmqdINRHjXq0X/FfHY3BIRtsTUa015DzOlSDtE5ojPrkMQLgB9F1PA92r9LUWOLp0DDWTE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK1YVoN3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U97tmpjM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK1YVoN3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U97tmpjM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQGCxps2855082
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+9vRJxvQ1t
	q3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=; b=eK1YVoN37dVGXypQuoUFAnIJ8cn
	4ZN8jLi86Uf2O0eUEf64Ov0M+R78DEMFeVId2uhvSgKeBNZiE8LsVWuXVJIlX2+K
	d2a83n2oH19tsctUUwlWiV06dR/9Gp/oSMrYdpECEmRL0xQ2oDnIBvr82he8WfZO
	8Moo1U2fa/ANk0aQGZ6olHmgAsAnUafGRCQ/ViqiF/NOY1ZHIXcF2tlWFhFNiqeN
	Jq7R7xKmLVibbOkKwuUhSA4D8ogt7Egx6dn6290knSdOlPHWbExZ7Tu0orajxDSo
	NttKaNkSjKX5duXTplKyOCJ9jZ9XLHuZMxSGvi+avbs8YMfWQM8Iyba7pEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vh8byk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e41884a0so5365285a.1
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181386; x=1764786186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=U97tmpjMy67MZwZ1PJAEF2VzFkSlpQr6fPOdQBmpveaTUI9bqWRGQVNmr+Th+nY6uj
         RWxrkWbPvPTjZ8F6goGsWWooymM9Fnwcom/8sw8tJFiOyWGTEaHDhQGaLimrq9q3slQo
         DCaaeQZz3DjC+CO3hOBZ+OLBvmJpOA3RVDaTA36xEWgCrkJXIPEFYFm/ayqoUXjL6UAP
         jr3Jm9DMNnIFaud3/3j0eUe/eXxwFfQeMmUg2/n1BbvNVftdErpYG2ewxvZkBs+sjuWf
         eGbYtdNmlmPb3bR/0G+A3Xft5rgXB+4EWTyjEJNu4XuV3frvVoRxMTm52kYE+jNFX9wu
         yiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181386; x=1764786186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=bK5o7uZWFihBh6EcA9o7wC/COKlzR8tLs/vjrXzPhEb3GeVHzv+j9GK5IMBoWV+tmy
         cDKKgdeuAYs877BHB4Tka8fAgc0LNttlRomJ5w7sXRO1SEMLmpo8ITsEglnpBo8K7TH2
         CYDKB/DybPGJv4sHZb44CayaFzQFIXvJOQ/MNexi3IcjabXO2bN0bgfN96vIp5c7/hK+
         QYQHayZZQkRt4OIQauh6V+sf7Kxs4JSFFA4r3zcKBNXWSOMP38e2V2nKK1JFe8hCS6BE
         TCuRuUhSsIDdWWpOO7IjMlNYKMU4nK9JxgFJPq05gMzRD+5rIxitWPZwcyyQCI1+HRvb
         WDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWipc1YFy/p4rZbmPCIbbo7am+EPcupRvelb99WOWAwbeUExmvpsWWPqEEgIimsGJbjZZkf@lists.linux.dev
X-Gm-Message-State: AOJu0YxMAnbgcjdOw0eQx5CaLOjWm6J++vEcH31N1b3Cgezz/fj7KYLF
	f/xy5tieArlr6MjGZsDgs5T3BHLv9fHWmj/QZVKIkgKngoYWJ+9bLNvCSfIJ0MFbT2TAHbz1Zey
	F5x2dLJdQ9Qu6YIgcq4SIQP8A9flLFNAgXB9oY9LUQ5AfaWPLjfO9imYz
X-Gm-Gg: ASbGncsRO/y17tb6th8UmcQ60FTrWWHp+6EOtmvFZzqDs1FYmL89wkq75PdEzSSw/A2
	rwjA/kFKCx3spYxPBIohgnLof58SkcE6fIoDKmbKW9Zvtq4oVkGg554J292VfWwMU0mE8R6KD2o
	usO0oxc9t8RGusc/EpAmgaXNeYR4DIYd+qmLVTF5EDcJ9anJ4ecy2MyQLWGDCT2FwEPWKDVNUnt
	C/c2D9UQHk8sN1HsrrVJ03DvoCPB0VJOh+tV5JqhLHa8QmI3uImJVXcnwyDiM5BVGQB8WAditDe
	E/7eZhxDG8RHCeLzZ2+jhUliDwOeZXa5AoqCqv107XnyfSQdz6llPVZKDtniyz07VDVKlswDTLC
	FUuO9W8FfrUikHsMu/8U2IQEWqTFC
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654388585a.29.1764181385929;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAA+ANOolUOJpeYZQNlTAvuu6BHx4jvUZDLcOS+/JSPaaolDrtSLNNu1EpO7HNNR3BrnQAOw==
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654384885a.29.1764181385500;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:59 +0100
Message-ID: <20251126182257.157439-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX9HiQO5Dt+SZV
 DNLfN0qKfnRHloTtEVdqb+pgx+4Sr+/pTRzlrJYM569WvEuWbkJtA7JV4/KB6dqgmFL3jtOMb0y
 FQ3ybhuZrw3EtAKa2F2FX0948bjMmPgNqt42LTnrVle/Cj7KDvA1crmPvAAEEh1q4Dahx9i1p2A
 fZKBg1RI2XmhYaHM4BKFqi85LOgDgRgPdiOlsoHATPjCKd8M1z55/6uXhHcMlOY0K+seGYVBZng
 T8Z7ahe1o+Bthv//IKAmX0RlIAEpElE8cnYvh8ZYjmTZaZFumwxONlZcav2ON5XU8fihnCzCrwI
 vC2jCF/MCSE9euJ8/aQih7q03aVi2Y+7a8CzXcvH5+kYmZ/0D7Z998sgA8yyKFvKTBW0nyXccQx
 d2iYBYkHQVd9jdAPi273CupQKBCenQ==
X-Proofpoint-ORIG-GUID: -xiUb7oIX76YSpOthfZUcyvIT9ZSr9eV
X-Proofpoint-GUID: -xiUb7oIX76YSpOthfZUcyvIT9ZSr9eV
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=6927458a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-pxa.c:1269:15: error: cast to smaller integer type 'enum pxa_i2c_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794da..09af3b3625f1 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1266,7 +1266,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)device_get_match_data(&pdev->dev);
+	*i2c_types = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	return 0;
 }
-- 
2.48.1

