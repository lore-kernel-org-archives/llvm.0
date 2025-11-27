Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A9329E4A
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244088; cv=none; b=pg77XzUdagmdQpL2Gp+f1A1qcI3NGSxO5a1ivb5oKIU5xMCeO1azGg8bGre54qa6xdrYr71A48vNrdNNJ1rKmZ5BvOObVTjKv3FQmiQbHfXFIINcw1PpdeK9cGpBgZ5Axzbv6p6uXvZ97at1LWNbH5SseneF6rsCwabBXo8y1gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244088; c=relaxed/simple;
	bh=nKkbcqfYG3LHG04a4RygWErz9v8LS6PmuMbISXn6AZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZvtpIN3iALDAHpdijqeZNJQOsi7CHoGaa2stlTwFVhqBiVrNvm4bqy8VoBOTn5syg+fEBqO7mDIr8MpIS0I5fbT9Rr6p2OFJajaTbAT46i0ucGEhmue5D+CXqvPC643HtFhlCGaRMiee29tpSuPrQ7VZS1wAj/ez6qPlMTBzvAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ir8pvPzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2h+dtcK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ir8pvPzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2h+dtcK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBVXn9721976
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=; b=Ir8pvPzjvFpmI3Qj
	0jIZnpxA3DEwegMteN8JROxPskNkQc3lQnleuAnXf9CHemvf/7w7Osz664I3c5yI
	5EQEQrHBUijbciNdQNdnhZYfyLTBubdqssdAfd7/XE4HOu380ZFGtT03cOIihB/C
	A2LPYNczLg4j8v5EflWz7Kz9jv1XW5/ratAuI48hyL2KeMkvNWnnoz+LJSTSgp/P
	ZohEIzqALKyjdbBsHFZaf2W7JDGJn3QF8xtx/bSuKRJW5jvg9Y1z7bNQYfbglXqF
	HF5B0bNkjzTmwy+y26sGQgv62N5clU4enjYbHBLPLks0jgrGdlY4Fv6a/Hx0GIjY
	I+nyQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnud811a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:48:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee04f4c632so11650901cf.3
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244085; x=1764848885; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=e2h+dtcKBj+avxzcj1k4MJcrfxOaJy2wu041QCCRf7JT65lPOB2h+BySlBEm/0CW2c
         FB4HZsM3Rnk6sQwK9hG2Q06+1/JhsESZWplFvrGLDWI8MqRU95TVsPNs6Ismdz3ERTqH
         J9k4UHrIYWZvX5+Up+dYXqS2JgrnXRJsma9eABukDS0OJ5fMPra74Z1vrdh6tJwxx/Lq
         jG60wHq9Je6X2AAya9jysXM7WCpRh2QOfizAFI07kMqO6SC5AkFwutgQkuN1tkusfsHw
         0ZNj4mxx3Ucz5ZWYx0fXNrUwoMFBqYmoyXgUUmdKmXu3V4ushcKZU3WLqZ/nsSukLA5I
         Ad0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244085; x=1764848885;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=Ka1FTWNbmGUmhJ8irZyyWqCXRB1vjfjtm57NqWbczb8sbRj16YCMFSExardezhnhfH
         85gPfaNdAwIGXlOtF4KN2Mt8lpHuiZQy4W/KIGf82aRbjXtWfZaYdjmo/m5n751nA7n3
         toqkeJAOIY+Slrr7KdUexk1+7YTGse0VzTpRNrqYi1xzpzuzO2k56Y9gDoc5GxTEKxcL
         VF7JoJki4P+7ginOVrLzRtVUqLBOWE7pWO4RfjSQBHKMO7vmrPlL8CSnO0dw3aDfI52j
         XsRk2LPbP4KiZaPp4H5MDspP0pFbKPt+Q+xXo8g72QxD/Y8WMHSlDpAM0Pqkwrpzrvik
         I+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXMVeI5biJIf7Fg0j+JN+PMArgo6HVpzYx0T9f/hJJY4rVdF0xmx86BfamLymRsO9LrVLp9@lists.linux.dev
X-Gm-Message-State: AOJu0YwAPnNmQljrbjkLB67HDblHsm+kbGWP9gPNjUtgremg9/cNp89T
	SWCA1q8xojhiMrHpRLr5UoLGWeupnGmDvyL0tgHdLRIt0/mIKjAS5GjOgGh0pSCMmLVEs081Uio
	rWP6D1PljkctUj2BS+uMyyAFeah92e+51ceu+v4mO3SsvTFrbfv0Cjc/E
X-Gm-Gg: ASbGnctYNXFwyXD4xsiLEDE5bm2vksxKalspNLJBvfxfqaz4wd/N8yjXgXIXNASSNJw
	/TyDTkdlvg2djljE7mYh0G1JCYNcS+mnJieW7g/7YKQYJpIpspkPXUnDx4kvc7ypz5PeQX82vBW
	vf9ZtjITJk/RXI5DVMHh3pa4+IcX785eDsPscz1sFZxwLuurMAiNRz7FAW7TvsELEBjIGNrFvRW
	6c+/23lmxaS4FBqj8YwmYdsa2ooGbDD+oCx78XV+AI4HnIucWD9tT9N4hWIo5fbxB3R7SI4Whwc
	21wJaqES7HYdt+kFklYxZkUucBM1hdHHKF6v1vGW1yQye2utUcMFrnH+oZs2uYm4l7K7WXyOaxn
	LcK5APAUOZ4/KGJG2A6Jqxr/hkjqYRXR81WUtOg==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423641cf.4.1764244084753;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnK3g/Js45TQqWNMcc2jVyW7gCrAWjZ1laKZXs6iAR7ymEJl4EhBft8ZMZWlF9n0vQcP/u6Q==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423421cf.4.1764244084319;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751050a63sm1383268a12.24.2025.11.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:48:03 -0800 (PST)
Message-ID: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:48:01 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A9bairXj9jz71s2RfPsbglkW_7bgtZyV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfX2iQjhlTBbfhJ
 u0pVrGtwCLeAFHm6oA5GoZnUUTA0PU0/HO3GTqSk+xWtd5q9rj95AfzC0H1tH5JFWTfW4GBCkuC
 MY8LNVWmjLzDJSS7aOQl0x5RXV0oVrV98J6pB59fA0458Ze1BEtlllt0v19NO1C1sg+BdNBjaqS
 ziuvbKkliFwRm08IR3osZFwU1gJoGTw1KJs5WUgMF5Ip2mHcjPXQ63Vrp7Os2tZjJu1QwFUBbJH
 U+f3y1QLmbuG9uq89rQRC2o+WHxrDWoYQqOH7dTFmsEgpgRMepa5Zri6B9Qwn2nzKcr1zt1UO75
 x775dswvIjSOvSCOfVVBo6hmokZMeCTovvaeNU5fWgeeaT5JNmwqysb2fsGZYAK0a0zV5wBicaK
 DX5LAkvuBbKKdyVRPIihErBDoqxnbA==
X-Proofpoint-ORIG-GUID: A9bairXj9jz71s2RfPsbglkW_7bgtZyV
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69283a75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BwDcOSWodqSW4K7DrzcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087

On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
>>
>> =
>>> --- a/drivers/i2c/busses/i2c-rcar.c
>>> +++ b/drivers/i2c/busses/i2c-rcar.c
>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>>         if (IS_ERR(priv->io))
>>>                 return PTR_ERR(priv->io);
>>>
>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
>>
>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
>> The former seems to be the least common option.
> 
> As I wrote in the first patch, because to my knowledge it is the
> preferred form for holding driver data which are in general pointers. We
> do not store pointers as unsigned long. It is also already used for the
> driver data types - see include/linux/mod_devicetable.h.

... and in case it is still not obvious: I do not cast here to final
type, because that cast is the reason for the warning.

I cast to an intermediary type to help compiler suppressing the warning
- to integer representing the pointer. Unsigned long is not representing
pointers in the kernel. Integer type representing the pointer is
kernel_ulong_t, I think.

Once you have integer type representing the pointer, you do not need
further casts to enum.

> 


Best regards,
Krzysztof
