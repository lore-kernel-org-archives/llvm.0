Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AD348477
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283533; cv=none; b=oGd4heTw04xtwYhoSseQLK7dGE17UKlg1ZTnmIiGLYehG12nG9GkJIbzBE3nW9tF244Zymc3wq9KxQpWxQzqU8Fxe2lRlovRvOzr/n1ALkc6mhhM9iIgE0T7jW3rjCHrG3OR+3A/miUph0oLmPInmLsOYT9/ynDFuPeqMUoxD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283533; c=relaxed/simple;
	bh=dpBzg9zlTDjazIxohgR7RWnyk6NZm9rP0R7pOhYKmYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=py7VGjMmVBnZp5oSCKCyFpy0Mo2qRotQXj1Bv/1akw41p0e/8nDAt5VOsaKu1gCdLROLzEyMOHoYUrbbmP4hoaY1yje0YhRdgQbHzjcXhwV5+jsKUsZGD9BG1HuVVfRgUyA8kGCGoD5cDS5hdU0d9wToZfKM6kTz4/KAlFAgnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGIXG3wK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kcl4x9Tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGIXG3wK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kcl4x9Tb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCUB2B1725558
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=; b=lGIXG3wKhLv4+KbX
	sfFu0jOizzrssOI+O6DIpaskgCaWcbzM6TnRGvmBha16Ku8l9A856Pa+fbvCrEVN
	fH/77OYCewMxqVzgDof1YTxt21TcAdYiqwqLvqxosl3mEGl9kRRrHxFe3gpDwPiL
	b58f51hj3mWqglfq8L//4rDDAcelIugB8YLPKHO5W6GoSXARrbP1MP2EoMUQPMEe
	VN5mzVFnVS4mwN82zmHe7nR/HAyiilY7fcanY0E9CgV5M6gHh0R3guXMi3xCvnqV
	5IiFZSuYOF3XLPMmHl6jP46QWpxUAFQaSNEGj9zYu7GKk8Pp6yTh75IkRRtDVnBO
	o0JoPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmwk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63271d633b5so3281222137.3
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283531; x=1779888331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=;
        b=Kcl4x9Tbt/RdcBI4ZYkXvpCXSHtPzHsPhqYuO9A7yMlyWSoh0KmvNG3vb7gQMdc/Xp
         85wx1h6Awpns/Nr5ukVlLrTU+6Rz0nPlJ+mBccixWk7HWvAtJpaldl+6UYJ6gpstEfn8
         b59r4ClqB0UBK+jpmw9h+vtQyP3NIcMGXxMQ4hNsUi/dnDoaUNkph97Yf8uIi2SwaTyK
         qF1Kw+DMst/B1kWTdPGsDQohdndYqA/1AHGMEv6supGNlUSUGRSiUF7zflXqmL7HxT68
         JC5xrNeGbmQgQPQLbyxiK2n08LwWGyzvb8RuAdNR/JpCTSJZfOKgQ6uG5h1DwPzg8KRx
         w1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283531; x=1779888331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GH1S6x8/f0fwRU6JS2rGdz1EF99sFIqi+K1xw1yVSeE=;
        b=StWV9jqLMGtWUEljVS6vub4K613V4XX3qi3EYbOAO/bauImC3TTKDvo+MjcpIenPDB
         3wcpPMzDS7MK/MuAPBO7OX6WPjj+x8IGYIgqG+OYQVka4HvOpEGYfkHNzwpigP6/suXq
         htSDdC7kHegU5vZRC8wnEwfA9kY7gF/NBjQs6L2tVozvOU9nOvq26oqTjKeKO7Nl5+cJ
         0X0Fpb33RKCGwhH8wwdQE7Autc/FP9G517CSwalm6lxK/exlSJv7cLe+woaWtuCBCZOX
         cVqhqLL4fOJmWqnwSocjMeQUcBnZhCQnnJhysDwuhVC2kCxVs/PBmfNo1tMTxupVbCxG
         ql9w==
X-Forwarded-Encrypted: i=1; AFNElJ9n5LQ0qmJhK6vJ7aEb0LnT9FY8qV1FvwqBNgjM/qJ39DRQy8Iev4Ie3i0hsiRH+e8ACF2G@lists.linux.dev
X-Gm-Message-State: AOJu0YxCgxfAvypdPnztFU/A/sdOqUp7s7mLd73rlL0554tRvC/pqlMq
	YyrFxnuU36YVUSpHDwSHXLFEgeIazfdq6VrbVm4yUQ3bTzAMRPKovxi8gpIVBNkPIywIJkiaeT2
	0Py5moGpgxBM9LpaU2zItEkv/5IUqyjS4WlJo3vlv4wOxYDSS/88bFPXq
X-Gm-Gg: Acq92OGwuGq95+Lzl9u6wVGIiDZN/lBbPjr43OsiaFaRRbTb+lzss7uTdRs2oKfJSZC
	c+cs3ADKwmit2fDaIwUHge+//6PUU10LWBF/X/9QpUhGGQtHOVYyOm9vl51wO4pEbGjTnKX6ost
	5LNbuJOVhGQlOUh1tbDRzEbjFsVT5fWWb7dgVrte8pczeSY5QVdC6KnUC/k+TaOJxC8E5mLqiDb
	JfxktWrcSmjcJ5sNinS5JRgog+++EBKdycloQqql1SKFb7ON+U0ZkcRSj+bPsoTe7K9L67Ms8Cr
	JBUt9is3tOV+Q4KkLOkVKTQ+Pp92sS7jYIclbZsa+YhlyuiHvRMhjRvEbY3AzHu4q/RypQ9EDD8
	CLBOqaod0dAMD0/2paz1SNmpAsgZPhLt9XorP/frFQceVHEoSzw==
X-Received: by 2002:a05:6102:374b:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63a3f18505cmr10776415137.14.1779283530823;
        Wed, 20 May 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a05:6102:374b:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63a3f18505cmr10776195137.14.1779283528471;
        Wed, 20 May 2026 06:25:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm127925495e9.17.2026.05.20.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:25:27 -0700 (PDT)
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
Subject: Re: [PATCH] gpio: en7523: allow COMPILE_TEST builds
Date: Wed, 20 May 2026 15:25:23 +0200
Message-ID: <177928351979.51371.15501091389617115126.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519005912.628667-1-rosenp@gmail.com>
References: <20260519005912.628667-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX1/FbbRTVucTN
 frrqufM7JGlyMxwAmHm38pOv72qs+Po3lpMUeYq8BDuB7C+lWHASihFTB1MCecxD4M1vuL4dbet
 6vBfDzHvJ3gfkSY33F8Y/bEvVFQAwmClU/jmj2gn7JbWHmgVenp+yTj6tKDYOmL22VopTalCSnR
 zpTTdKpN/BFmd/qgakjvk1WNWgHWgjmnwQBePfHNA2ffEuK88X09+2UkCIDOOlvtnBNLHrmnF6d
 fE5irG5KMIFy1w2tH8mNyw9pbSKZKWkcG8/I1j7lpyoLO/8zEirB1+9gFS/eff/tSKH5cB1V0zs
 O7rhCYYtTnx6alfAJc2wEOvoYNGOB29NreD5H77OecK5WXJByckMQJn7AWCBL/eCpTYaEvUT6fa
 17XJD+3Za1D+7YVi2BxUXtixo7PF9ZDNkS7M+NY+daYILXurCWtsLmjQhgTs0Ch5LLCPFpKYYru
 FyW2zKnwD9howQ4/oBg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0db64b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dBzKjp2fhYOy3RD5rRUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 4BHU1jTzOXpq572z4VVTrExLZ7BO0UZc
X-Proofpoint-ORIG-GUID: 4BHU1jTzOXpq572z4VVTrExLZ7BO0UZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200130


On Mon, 18 May 2026 17:59:12 -0700, Rosen Penev wrote:
> The Airoha EN7523 GPIO driver uses generic platform, MMIO, and gpiolib
> interfaces.  Allow it to build with COMPILE_TEST so it gets coverage on
> non-Airoha platforms.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/gpio/gpio-en7523.o
> 
> [...]

Applied, thanks!

[1/1] gpio: en7523: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/292e7cab58e2ce1f9213a6a326eb314e18756459

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
