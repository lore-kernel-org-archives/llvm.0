Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB983EC2CD
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382570; cv=none; b=NO4BO7xg9QDC8RVm2xu1/QQP50Z4iPceWXmJovMAuNIOvYFfHGFMaVRIwGVVj0BDXkZfDzSbuF+X6fcE6wYcqLQfcVPC59DbU7wIAhi97xov9YmjVnaMQ8qOTXAevBn05Iz5gZ1xIHG63OL1pAtsZN8yP9KUzBbf5CtS9JyNT1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382570; c=relaxed/simple;
	bh=BdeMCITDlclHc0XgRy23UHrzIbGbkD4XwflEPUUgkv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rx5ntRawFpWsjsUgtRZl0DYmVMAufckG15PaIL9nZWXgPnxjBnjlaxYjDGyJ8Tr++eYt13WZIwa6TpwhKQpIqPMPCQkcnBcKxqBB5u4toyWDKvlApvTABI69pYx9YLNI2G9Hf8IWrxYjSysWkdnJS2hH17SpFsfynu18g1t85oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isowwp8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHcwhCD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isowwp8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHcwhCD7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2v2d985077
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 13:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eew3AfWV+nZ0YhkogIjTf3ZyKiO+xSxJ40Lv4P3DaCo=; b=isowwp8HsZtNLSFh
	r7r4yn2LPiURmnNtwPKDubRpHsVdqsH0IiBZ6kRd3qf1TYR+KTnaPMNxmzW0M8L7
	bWq9rRw8a+GeimCy8hL4fK92G/P1BIiv/Oq1OZXHsdtCwh/hXZNEn9qModCdY9Kv
	6SR4lkAebtNi4OeTqC4lon+hzuPnmi1QwHx0VusdrVhWwtZhdYRcw4T4kAUO/+59
	2e7cXN5iN0HY0Je/LWiMyMJbYifDtW1TF2oRNvlJyYfrtyCNfIGfcOWHlPh038p1
	Amy0s24Pc1cd/fhWE6W6oBMaJmQ2cWw0izWt2fHdJZ8bMfuw4WCYj7ypNuMFCttv
	WNsHUg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2rs34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 13:22:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-956732444ffso16157026241.1
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777382567; x=1777987367; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eew3AfWV+nZ0YhkogIjTf3ZyKiO+xSxJ40Lv4P3DaCo=;
        b=UHcwhCD7dRcgSTmDmELZ5bVxzC7k+doeIVfREplQZcXAjTwsX4/Dc6TydQDcBrXyin
         kZ20EjmJtv4JFJEvssHOTcyF8iwfEIGLZIR1aVQ69+1TZgo8WZXVIbvLP7v/yaF8tBXe
         b1PZ3xiHWBo5zj/LhdAvbS2OKPgj7iLth5YfG3Y/geMRf9+B+DqP93PVgOpiiJn/fbEb
         xamYmrx8ZkPU+Qc7eOMpcu8Z2dqyOOqfx84NpXre9HAEmjChq4kpQZIVdIGz79dSLwjM
         nDZ9OdtnGgxQQ9szodRSfuKN/Wi/chlg0R84hHi5cx/yEqli4nwfusmiFrR4uP0DAj+0
         Ai3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382567; x=1777987367;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eew3AfWV+nZ0YhkogIjTf3ZyKiO+xSxJ40Lv4P3DaCo=;
        b=Iis6ANr5usZhB4JhyipY+gShMrDvJKplJeCxRs1b63pPXmJ38JKHIE/jqZgL/EpWK4
         bPUNWBFpnZdduvfAjBYC6GSZVNZ+jpv5XzAUfXYeC2lFynMd+J6h8dlhmI2tfqLudLqs
         aImeisl+13FGWeYdTriCU4n8K1JNybEyCJuzGXB613U/l3y9yo0Akm1QTnQtgPCnvrDB
         L1VYw60jVEQDccFFWz0R7Jk6yF7BqrhW9jFfLJbJ7VlkKuelZ2Yb8ZK4j+A00CpL12w3
         WlTVEMH1NngTPu4K80zJUToDHu3Pcpo08dZod8NLzX3bj09TjtC6oOAmszO8zBM1xriH
         L/gA==
X-Forwarded-Encrypted: i=1; AFNElJ92DXkv8bcqZmf8rTEOxgJeruZ7maNy965IcoqJPnD31QClpJIyLCbDMEBojQp4p+JfpFdN@lists.linux.dev
X-Gm-Message-State: AOJu0YxPwnGkd8OSTbQ6SYszmY8JHi1tgdV8nu6HxSRTmtnq87loTC9d
	P5566jwzUyDIGLp5tht0xonpbq0lVchTUPi5Bwh4vahWR7aqrwNNJMgN3PttjSs8tUIc+Z8adr4
	injhOQWkHyxuj53S/YawR+4bA/RGm4g3OFwSvmZtmMr1bIacpXj/v5mhQ
X-Gm-Gg: AeBDietN32usvTVf+7RuODfUcj05u8niOTZcnkyaFpWTF7JHoeMQ+nySSwv3p8oHBvk
	wgss1OhSMw9R/tjf6ybQ+tGZjdXzBVco7vnMD7E5etXxME+GV/v2Fk2n2U7fYAwWyuOtMcCgAcy
	bEgZpOblib/eb4LZjsCjriubjJZeyIKKvC81RtHSiqA59mPAJww4+g21RDpAKR0uRz345Szki8I
	vIOGrH8qCgSICc8NEJ7/ktY8D3n8WrPSPrSpkigeJgWlJyNSQl0ydgkqO3i8hNW3aOib7Aad3zI
	RUScjfhQlgcNd8pzZsazWmCm0//NNdKFfmSQL//b23KXgGaZsNdFQfJU1IR3wHc9q+hnWm6KR2W
	MDNbKPXagiSTSL5sBP7uzEEKOXHtgZR66WQ6BYy6r10ppgPMJSA/5KXy2udY=
X-Received: by 2002:a05:6122:311c:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-573a55155b5mr1411357e0c.1.1777382566765;
        Tue, 28 Apr 2026 06:22:46 -0700 (PDT)
X-Received: by 2002:a05:6122:311c:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-573a55155b5mr1411330e0c.1.1777382566322;
        Tue, 28 Apr 2026 06:22:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77afabcdsm83499125e9.8.2026.04.28.06.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:22:45 -0700 (PDT)
Message-ID: <90c122bc-3067-4e3d-8083-dd94844c31f2@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:22:43 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
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
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f0b4a8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ws6guhHAfqZ2DLpO_VEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: US8_Q5EQngEYcRsJo3Wv5C14Keq3aGej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyNSBTYWx0ZWRfX0K8gnF7xSKWp
 ccsMKgsUC5sZOMcnIbzVkfJI5nmBnV9rEgFJDt1e1vEz1uG7VyR9V3gBpP5b+VX/V9XjUlKhKgl
 i6SrQ9lZEUF5ox+cl/W858BoAlJuZhZx1wntJfT3KfBwW1NHHm2jjEWUYz2ngbd3Nvf0CvarZkm
 ST3XPBoeOmNFL202R1oSpxJfO3RWucgVK/lYBSov1oGOZUF3Tlo/NjHNP8xybHCsSApBvNyXGvk
 1/JJlN5QBFtKKWG9+wFUM0jyfYOTRh6mmgUD3ZYRCsTx6laVLW/bf9lKvVVieak8FKQcU10rccS
 m65YD2eAZJPRPzFPRjNb29g7BawSWX77F5wnVK55mvgMqQHrP1p07xpFelnI5F++PT0GcKAHBoT
 /v11MdlX9x6fVzHqwBNRNXBik5pm8SGGd1pGM0th0OzIvCx14QJjpOqryN3ILXPXPIANy67GsvL
 +wQ5WDr/Ze7CnExcy9g==
X-Proofpoint-GUID: US8_Q5EQngEYcRsJo3Wv5C14Keq3aGej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280125

On 17/03/2026 14:08, Krzysztof Kozlowski wrote:
> Return value of ps3_start_probe_thread() is not used, so code can be
> simplified to fix W=1 clang warnings:
> 
>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> 
> Resend after ~2.5 months
> 
>  arch/powerpc/platforms/ps3/device-init.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Ping. This also got a review.

I do not plan to resend second time... And I also understand if this is
somehow legacy and fixing warnings is not desired, but then it would be
great if you just responded "don't send such patches" and I would not
waste my time.

Best regards,
Krzysztof
