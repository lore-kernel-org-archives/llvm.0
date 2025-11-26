Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E231283D
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181391; cv=none; b=PDbPmt+bG2x1Pb7LRryBhmPoddJX0qgq45v+gcEcRgQ13mgys1VsW49ftnhmoQMFZglPg3TqUPZC2hYpwi8pDyG7K3cWdQk/0Y4E+UpD2/ddd07TmCIGBl3oZVV73/Ddst6VVBXAoAkLm2EKWrQaOUI/kV8Y8/KNlC06oXgxjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181391; c=relaxed/simple;
	bh=/22vU4YyhoreGSVE+8dNtnPv0bjJh/n7NQdBBkBHaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWtECy31A7s4+/m9KvMBPI2xtOIdeRLuXZ3dmPJYUSbeg+ZXydnGeEpyA5St83henYaXrjDUET0C/0OFEQ1QrwvXZCKOpwotVrme+qZa+f6XDNrDcNz+C7W6/eZ73SLA1xBoQH9dQmbhKNuvlWDsVfCGoFhlPOPoNbGvK5VpF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwtoBXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S20n5X1K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwtoBXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S20n5X1K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEbHe83890959
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l0+YTwJt14x
	VeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=; b=EwtoBXyIL3bBO5AhGzHoP87LeF1
	AgTsfLEU4ja/LlNrZ0vEkz0wC1aRYjqnHliVP1hp2RdkRzs+oEabu5ryiSAMsKGc
	CnoEYC+squlLbOck6iOSv59abeIo//8FsXXeryl+10as/CMJnv68G0bJHyksXR2X
	lSpTuMyXL7I/wJTpJSeRhoDcVwjsLD6Dp+Ag2GiLUPVjV2bwIe4f6UHv5PqYFr0H
	eBdPj6jKQU18b4Y1ojzWbiTt/a7m5YeqWsO/Iw4/N86wB2OE7H23rNvyQYMgFcR6
	6DKpxSnw4x+2hHKjeow7/4eH4NqvuNcvJMX1PeDyBktmvl4PL4iNqj+8vZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmebswc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 18:23:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b245c49d0cso3829185a.3
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181388; x=1764786188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=S20n5X1Kyo9ahb5EZfv+O4UU2Jy22PwD9Oooz97akLnI0CdCwZFmDKnr0La8oL8cEE
         X3MJpcV3qMYVKf/T3Ezq3mb1RyOc/4F4MCYzeeG0pSIxsi7AdEttjK8IPnFET1K8HsyM
         zCld25q8wpTRpoODE+eKk8LMxhBPPWPSHYzpzwLG5b41uTa9im1th8bOLmVJx3Ai4ItB
         /4WX1SQe2icqweaO9swHyg5/2nXveWtSJfHt2JOuf887vVmHo6C3BedtXMsavlgd3Ryn
         vquhWDwgfwlUvvxCN63LFhDLeKfUON8Gd53L0ykRh/mrI+4xWUHYuoUzEChSlrlWXGSA
         YY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181388; x=1764786188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=AwOV0SnbDDxZYB3NdTXzIIcTCWql/QcLZR/d9jRye3vIVfmnrAfiNRdxX938t+0oaz
         tjc64HXVLf3xnsn0J7GcjI30rcLmNFD1q+SIvleYTpviiwcLsL5C5HmtJq2J88oAVbEM
         ryJ0Rca23kiZkaYlQB/h2J0Ci4dspKaL6CMf/+pqMRMLRDsRVlssUw6xriu+ZPKKDEyh
         qsfH+pnRcT6NbBI6EzAaS7o9stJ+JkfGvI/zp9n8e6LcMRTVj55G2rOZhyzWS3JRLWYI
         PWLyg+MD7nrd/q8bmNZtwnBdjQp04EFosH1jHXYtXrwvKfGVE7Dov/UGVwTYoB3lbNlP
         SFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNiIhOcKzCCDsdYdVRKff3GTCQca1RYu1pqdv6tWEWzfN9jCSu65e8AKN3UuMkGpmZeU8N@lists.linux.dev
X-Gm-Message-State: AOJu0YzbUXzUNlhzO+awTnFI6obesQNGlfARQg6wuKmp5KuDV/wLGO+m
	fb6g+3kqApjoRb6TpS4P2d6EV1K36gL/6U/aBlxVh3JMquqdWDxJZWXoEHH1GyAbhgZ4AFIb7se
	8rmydeQft1fwHOWgD9swQHZMnmb/V3K09FSSFva88xTXGianmxEyQx6Oh
X-Gm-Gg: ASbGncuA7y8p5FYq+f2Z5dWv7iT4PrKoYKQ+XJL/O9ylk+qCSSnGn9NBMXP0B4GyzMR
	UslysCCktvS5xIdnxHo7de4EWlKWy70UvKCUvPSp5yid1k0HRaOZydpv3OgAOVFR0KEs4Ex6tz+
	9BshruhHGnyE9pKaW8t5yFLY6CwE2pIBJPtvWPAMD3oDYIfHtC8WyBzGP3DJMpGpbFLAcslKBGq
	TOCU2ARbEgUSMXzSlS/znmladRJzmu12hWYGApHgJp9TyKt9SWItUAQ3VEpvUmhRnCeXb/JPo/G
	MsFdcESVdN2IYwkxKGiQ+gzgHENWQNsii4PMbBMGqUTH7w6CNesbOeeUWW15vHiSA0HZGuDvpFk
	7xTS+w5MBadhk+2io1dnRL1IXaL1+
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792630785a.42.1764181387758;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2mLxW/D2Z12EY0+agf2CZ+NW9zLRlloli4DWeMWWCw7bKngIVu3ZKUo7gwIs2SgNmvD00Wg==
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792623585a.42.1764181387148;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:06 -0800 (PST)
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
Subject: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:23:00 +0100
Message-ID: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6927458c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX+veFK1agsp5i
 yArjgKYet+wr5MjOjKzPQW1dYIq1+M6w/VyesOauI6xo48QcBnMclSFiuna62sIOUGlnLU8Ff8Y
 ItIYUr1lLlpNkPj0P+bypvVQ+wccu9p6IvWWh8ex01V6NIbrv08qPJbVheamzofDijKfVvimM1U
 /mieUKDQFc2ngqzEop/5gpfTtUBgLgvtVHSGkG1ovjwopHz16/F1Xp1wL87U1KMQCAnAGK+Feb9
 5AiYvDFA1x4d7Ua5yYIepygCdRuFNhc8blhFhZA66zaWG5NQfCPO8oE1U0RGv/aA59PXlV+YbXU
 cV3cT3Ex5if68QjuB8bK8cK42lnMCuRH8y34IDx1MSeReYFmFQT1dZh57pm+ARHyi300caCZmcW
 OAEGm6YSySPO+++nxeuji+zGtvyiag==
X-Proofpoint-GUID: ChY9d1ZZC3ByoDJpaDdMorUzK9j256L_
X-Proofpoint-ORIG-GUID: ChY9d1ZZC3ByoDJpaDdMorUzK9j256L_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d51884ab99f4..5ce8f8e4856f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;
-- 
2.48.1

