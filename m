Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B9C27F4CE
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181387; cv=none; b=eOfbMAfPp02DOp2JNMWeHVfecWzEf81h33P4A9OlQ11d0ixjjlMAUBXpukUue+acO2DHVUcpZMB+9YlFQOE4oq8XAle5taYpX4ZpsUInqKw9e5k0XIXssCE2vqFSCFqLjnFei48qi2t6P7GmX0vpb9LIRex3yQuCgSJkma6Xa78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181387; c=relaxed/simple;
	bh=vwfiZ4bLwtpw5TOi9+RULxI2UWcZPIUJbyUFhsCi78M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fzl5exAZsRFPrPlkXfOFktuC+NhZKpyfyFa4HcZCQOZwFhhCaW/SvKs2TWVV6jMlCaJKFhQXjkIBUvsNbaowAuZkSzdgRnsUvoeKwiZk1Fqlww7LuEDaEOpJApiKLjQ54GtV4kCfppGiimvSxx+0qmmZHFokTrOPyy0a29iSBMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3gC4FKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTM3PZKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3gC4FKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTM3PZKa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVlgQ2355773
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8
	036RW3n8=; b=O3gC4FKT/6ghTBqt89NGwUogfyeq72C795ge7u7OIMuKySooCwo
	IvDc+FUzhEHHRO7I41JHttbHTHQ0u4git87zBc2sShc1O+WhSyo062JM6/PUvO4G
	Itdh+GgvMfbfNq5zl6iHeAFJB/KjCHHKE9svvzs/q5tNRlMNGhZE1IrHT7tz21Sg
	LnRekNma5Z4Uqtn7OUGIWQKVPlEAjN9oSWH34XvK+rsBUhAO+EZdhqvEyUJSP/lV
	qEWV1fNO63n3c+rpVAZLl8seXY3NRV6bhn5ZrvHFdUhKmAdVPt/oDMPZf8sY9L0w
	I0phSscHwpG74j7Kfj0h70WcZloYOu3UxBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1gq49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b259f0da04so6667385a.0
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181384; x=1764786184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=JTM3PZKaf6WfD9W8DsyvlwcWxIWZOKaggLIWqiH8Kn6s3SBc1XyQl1JYtM9soiGHbk
         XltqsePdlDlbys15Ptvs0ftSWgRXzOaK5CKkiwsQFgdr8qgueAMFFmXJcGVqk3qE122f
         XntyZf6iy8WVQVQSzualXPjuwKVLi+bQpw5bfKSMmD1U65b3eLionfGTpU6Ns2zDLlKi
         zmVScMPSv6+SzwG9WxI8AhmWX8tuvjfKNk9v4ewXsltaQuGu4PAvzk5J51lw5FWpYV6o
         JFqSycKbkYe15AXKjOgijUfebfd3fMcoE1ESPLzPys7ZFFzkDyndfGXsOCs9bGs4Gs6C
         /KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181384; x=1764786184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=I0xbjoaVokFnkV3hhz2sbGtPHHZyUF5fh3mr+PgjEmPiZ+p/WlUJtrfU1oyfWZxU+u
         pM1p14O6m7Je8TlVbDsTcYt/ddDOOtuaHAM62CIc8LdGubNDKNDzDrIDqLfwcWT647wq
         yUBgrwBZOLowWkrOl2ja1w3PVq87zofKpqNp8x5KTbGSu54FY1PZS4kF28aDydrUnA1n
         OyFtQ5Q7mAQeNOTCHponQp71JlJmjFFbYhUTPagtQniq6b4QFLUun/ULKhO3iAv6eHM9
         1KD2W2KZABE+tEXZK5qmRtA4vCtZIGI8hny+VJ3MUHhyeuRSVcWTbRrK8XbdjqjApQ8P
         f+rg==
X-Forwarded-Encrypted: i=1; AJvYcCVvXVG6TBTyeWUaS7F8q0kGhK95Kzz5pcSdnTS7IFR3AKRVm+o3lbwnvhZDGDvZiswA6koG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9obIWzjUakzAYKg1Z/DTKWP4NoOetqhWNTPv3w5S9n4fs7Ccb
	vWuxn5xnWkkA/bVi7E4peKIPcL15ovcbxl/Vg8sWGp0VZWh103qpwoW4+fIBTEfC9ELvfWDvxd8
	Di2KBZG+VbHNqqhrWhwKxGyrw8XHVfVcVKhDagbtj/7LT9Yt05TVAk5ox
X-Gm-Gg: ASbGncuhiMzVUBhLfmtYEne899srPwJiNjw2gK4NOVFXYXKbhhFWQMx9PE6wHNB5O1e
	FrPlRGjZ8e0ZwPOrj40gDraEf3wwKGeJgXrIf9s+HRB/YN/2LxxAVfTAeM1pBsFkruJokYtFAf2
	4o9f0Tte0s24OB1lmaBz38/NUt96YqIWswy8UQ4vVFFs4/irXIY9SzR30wUP3KMFnV6H1pNVPcj
	R+DsufkYPPNI/Vnmadp+eFR5sGhbwcAX1BWtS8CIzIWIw2nMlfLdU0vo7fu6YXNc0I/WnS1+erb
	HlvVzgLqMrybkJS4i27QbmxyTh4pgYgwean8Ae827yaWJApwkeL5gLuwgOtpxWAQSnqBhch9vd1
	ob8b8CS5Nzs0doDVj5uKSsGYSJf7g
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555117985a.45.1764181384156;
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDOHb+nGWB7edLXVL3nT2Zi3o2R10JG4cWMbkYw+mo3CYHYakTXwoxRZ4cxy/DzgqTRgGE5g==
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555114485a.45.1764181383764;
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
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
Subject: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:58 +0100
Message-ID: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y1S_bkEhx-ka4euDQADzx005z1Sds437
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=69274588 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: y1S_bkEhx-ka4euDQADzx005z1Sds437
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX2N7dKFYTBdPd
 NGoNZoza0u9RPIM+1Ybjzp/UudabkgN2FLQwIqTPuJlNrzvHQqq1heBB+8yO0KJa/Wc6VnwmV8I
 6jcXkwIgwcgiAKKXv5FyJcdnpwzz0wukCN+2q29E0KPa0XPXyHybWoD9OJJBw7oqEHLxoAiYyRb
 YdWNBCyjUIpIhMVOpuKE0kvU1Xq8G8rOsf5eLMHUgCiQO10O4+aGp9CE/L3oQP2Vkx7tOzaPaWs
 HH17KDARDaF2IQVQoFCs4m4PjFoL5Nckk/n16JIlV11Pgj1JdmEhVGDUudHF4ilHjiiyoh5eAWh
 mIkxrxaLmXH963ppfB7Ns7Tyb5jVoo8QR1T+cjkPJNK1Q6cIBDBdkgLsV3d4mYiPXddnZGhnsEI
 4KwjvsL+yovkOsD5JA7HfPwiQGz5vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260150

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

kernel_ulong_t is the preferred cast for such cases.
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e418a4f23f15..b5629cffe99b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
-	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.48.1

