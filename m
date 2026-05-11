Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13A3CA491
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494544; cv=none; b=BzlH2KYmd9zPf51Pw3MGgIS0h4pudAsAByLWfF61Tk9za2PoI4jekS1Ngw55+9KjPmkYLEHTNe9H9pT3Khi4QQDzaShVbfD/IvWDaPK1pf72WZBPuqptzOqUQscY/7OuPR4B4XWXDKy3NkqavjR9P+Sv8SCQ+VZWxGK+X5XJg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494544; c=relaxed/simple;
	bh=qCFmi2WE0b/9isfH5tCK0ORAKQGM0Sscv4pL6+8J+Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HenUL9AcvS1OnVXiROgfA/3xXXdBG9rEzIJc2IgvyAdMkD3lbIb89v8bkby6EA0AJOwS4+c6u5P/15aT2f4kvxNfWXdl0IysYh2DeJgTpnfhZGQfNjx2fikGUlEtZZHbRgtluHilRcAdDusfyyk/kR8e3rgxJL1nSQaHO8gqecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiNq7fq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2FPT85z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiNq7fq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2FPT85z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9Jhiv654469
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 10:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=; b=TiNq7fq0PpZDTTly
	jdqX083tF06dpnsjyRtgiHPFiFm+Byg0zh9Zj1itwJZVecdiaXQnEC2Fuynd1o53
	qEFA2hMmkSNwfiNEvaty+oL1sMe3WD7ChjkEZkfpEuKsGmASk0wDk50w0gcm+uvO
	0tCrC07fpez1j/KsZ+clmTXFMEL3HDwgyOEYMLsVuNtj/3dynz0haiDn3/tvEXzg
	Yp2FJH2h9cf+B3Dufya71vE2ccz1OTEBVL5DX3zoDYpsjk4axnwL858kSq0IVQki
	KN2r09PmuHeQQfB6bAKNtkyEhLli39T4oZfG9ZEakoM1/KRKFPtByLNyqg/GMBD+
	y0yD0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu98b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 10:15:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so100229161cf.3
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778494540; x=1779099340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=;
        b=K2FPT85zxlJ/3oVWfb/dweacvwhGnEYkm4CcHfeY8wpiqOvAlAgUaSPKAe/BZJl6OW
         GT8PLwDeX/QuY9KOd5f5IioN+2CRtKUtVKPP822/8MKfK/AiPDq9YlISCr5Yn0eAeyPO
         siqBjY+NG32C8jvijn9K9VP839IzK/+j5HbKIyvMbyBHdzZmJ7XTvOTB2k7Y0LFZuiZh
         c75ZHs3yRfb/SoxSvCCYaf0eohFXwldMXn3wPbj64hRUkuze5FTRhXZ783lT9hdqAjkB
         Xmt+QRly9JgHDnNv1Kepeng2RVjzycLmAjPKDtLWeKN3QS8f/df3FSsm72XBcS5si0Px
         jDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494540; x=1779099340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IW6Mbyowp1qrDASdEwXlyxz7dThpdfwBkhdUssH0xU=;
        b=PHWmEKseoRiCPmPeHxmgRp6MeVxHhepsVwxO5dFpL7Zg+fpqE/EhrM4TP8OcUB8wg3
         3JVqIUC5wCNJ4Jo9TOWWGycjdJ2EjernC5J8ThZlVgn8yFTpaZ/Gl/74KS9dc0RXkJa7
         O7t1LtqKoCtbgt19AMMsYjebHzzGJfoGGLnnLCG0QinF2I0BdRyyJxEUwygEtMtVCBOY
         K+woVbCAFusifpBVWb+RXxjfqFqEqEONmlCW3cv4czW4gMOyQ59FZLT+yGuyD6plv9Kd
         m64s9KKgXxDB92Z2TyjwxxNkJqRlO39aCeo+404i3P2s77hex473pCFzhQOQ12R5PJ3V
         yRHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lIjSHhRayG05JOtx9SWroCJfNp12fHbdHfH8Vw/KaJp6lxzg+DwvInWG1pSm04M5R/RjW@lists.linux.dev
X-Gm-Message-State: AOJu0YyDTynukNZGcpFlSWsAO0KG7ohGRzuA0kiSJwBwmw0ri37CLLeE
	MFByddMIfINaj9gXxaBrFaQtn+MqumUr34ewQQneDIExdu5k7W2LE3rAQQ5EKoNDd1leujcIDjK
	f/8yavRPlOD76FY0I/tdMDE2pLUmNoIr/1LcGkj+zGVADgpV8MRM19qbd
X-Gm-Gg: Acq92OGrYA10lcGkKNpFEHSuvuAZdslQbGYt0WAyGsiinlrgHGd3C4V2gqpYVlMp08N
	m2OvlZIDXxO/dTARUbkVtYwGxlaoOiwwNio4stXnhhqjHMGQrZX2jhqGRUVjk3koy3u41w5pUfI
	ejh2hXVdH8/CEyhfngjbzCp9ltiUCmNJKteSE+uBOJZoHV2tv4GN0SLmKH0KAlpsrF0x5+AMQF0
	Bw7p1y7anbtwE3hT9dSg7iyUwqOTZzUPCWYK3GeglmIJdsH7jnS0r9GjbTntzL4odqkSAP900Z5
	7V2MDx6wkc3xGCmnF8Et4REwrATFsUqMeC1uhS3bZMpFPX5dUFX0W2aBBQ87cmCMBH8cvufqfEf
	MmApl5tiradj0vL3v2VuW4eJRTTVzDKXlDBkzh8azjhWgBZqVzg==
X-Received: by 2002:a05:622a:1ba5:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-514a0b23c5amr132024531cf.29.1778494540530;
        Mon, 11 May 2026 03:15:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba5:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-514a0b23c5amr132024291cf.29.1778494540157;
        Mon, 11 May 2026 03:15:40 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf496bsm85080275e9.4.2026.05.11.03.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:15:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] gpio: zevio: allow COMPILE_TEST builds
Date: Mon, 11 May 2026 12:15:37 +0200
Message-ID: <177849453421.42829.2470918922771750909.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509003438.956051-1-rosenp@gmail.com>
References: <20260509003438.956051-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01ac4d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VdHRNR7Al3-TMIprLfEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExMyBTYWx0ZWRfXxaVDLCUcA0hY
 B1aW2o5ciBpDJX0T4fkxLBbHujubuBx5u1kdEQJHZHUu9hL+12hSxU2+u5Pc7DNBk8LBrOYw6+y
 oDpvTqKbIXM9fePXUE10h11a7t2C8OdfNije+zS90Km5wRk5CtJaVax+r250Y2sEuEEsd1FOuqO
 9Y0m5m+ZgADgLmxDnXRNlKZdK7mG3oMwG66GVAzTQuoMucTCkJChFP4v658a61rbkf3TcxBzHoH
 rAEzzO9CvmhSIbF95VR3eM/xLS0taoFY5QGHaq71jtCmWIWELDLcJM7BuEIonsB4UhLRTePA1yE
 CnL3rgs6vua5POW87q9KZSBbgL6ueM5BvhkU13Jv5s/MIQtmMDujqVl1kaysZ3Ov3EU0RaLDC+A
 IDcyuXkxsS4ZmSY64g+xZ/BAi/IYl88AGVrxLfahhm/CSpDSi7WYoHIldgRc+3vo0X1VnDCzRnS
 /B/oU3Jnrt7AdMasMTw==
X-Proofpoint-ORIG-GUID: p7GkUv3hXnDgnBvt6O8w1rvx2luAk7F7
X-Proofpoint-GUID: p7GkUv3hXnDgnBvt6O8w1rvx2luAk7F7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110113


On Fri, 08 May 2026 17:34:38 -0700, Rosen Penev wrote:
> The ZEVIO GPIO driver uses generic platform, MMIO, and gpiolib interfaces.
> Allow it to build with COMPILE_TEST so it gets coverage on non-ARM
> platforms.
> 
> Drop the ARM-specific IOMEM() casts around the register pointer.  The
> pointer is already __iomem, so readl() and writel() can use it directly.
> 
> [...]

Applied, thanks!

[1/1] gpio: zevio: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/5d6f7ce387c09fbd30360f268168606803ee9ebf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
