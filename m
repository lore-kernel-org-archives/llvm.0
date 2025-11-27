Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7132B9B8
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764243742; cv=none; b=r4ApRQ/cOl0T5sHhtn6wW2Xsf+lSVuHvK7MkSe+fGUnLztZJdSdzbFObQuoXoVARRPln9mXYC8W/vDi4PSNxUmvJFcOeavsZ0v3Ab4YeYTdr7E/RrnN5Tce2ontg4CbNCbwTwE4H2lZZbobV6x0Q28D3J/mdrIpIeOD1dEcXOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764243742; c=relaxed/simple;
	bh=GtE72Ankb4nUu2YrFan7jIWAfAtl5cnT0r2NZt+paZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFryvBbkmULH2Dkrrts+ce0ia/zltdyGNDs++L7H5nXg87okKYn9RlUVdoBw8vjLM2gPAFDDjE10BjjlJjdnnCp/4Sth+jwXiDJ0qNjFd9rv+fMuWFsGlcUbNjZYK5EOoDSDzmfh8hSSJjlQoMMGmr7WPqyCmu24/gafGJmMhuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRkc8HwR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SF2ypuMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRkc8HwR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SF2ypuMH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3blG848568
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=; b=IRkc8HwRf5t7IjA0
	RO3qR4JTom9HCGU4kHWfC6UTBxTo28ohnb89ooAe58qMUN75GeLNPD9951+i26Ep
	ttU/L5I03AxHOKkdT/TtKr4xz5maA6x4iCN5jOPA+ERGodQwVV9kYEQzTG+++fH0
	rLvRPW1h/eFLAhCPjsWKEOW6Y+ktEAElJe+CmEppq2CyTSh1AOqpLmUWQOs4613p
	Zzs9JNDvZnCg6eG/RyjT1fAh8SwsnpQAX0PU5WXMMeZ3LU/M1vbhuoIU4/GD6h/z
	Y5LVuqMQ2Wz1qa+4GaIda0HnGsT+dXUg27SPBC7zz/th62uhUdwk6OyZgvK14mNw
	bVTM/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd88jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 11:42:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1d8f56e24so176227185a.2
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764243738; x=1764848538; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=SF2ypuMH+xVb+4hgKujB2Rw3s9RlVz2sIvXP3lQglzQTlnNxcLSBl2wKj0okDU+yL4
         wMDuwN+NgOET0y0YQ9yiJxgXGPt0g7rXvWemIQV5xPamPsWxMqRFea7BA+25izIjh6z5
         Mp0NUxgmuS50TS6K5OiV5GxShLRg2vhFxcDZKydXJ5K8YI1CuEuBcdIO+z9FoAEAw8Ls
         j7WV0u7fCt0ZIw2Ks0Q+wT2qpWhEP/S3bx6VJLi8QK0E2rTB1cVxUnplRjRb91kL/tLG
         bebL8BywQrtYH6TG/LPXbXTOrnqa5hddlwqqg6MyXMS8sghcNNJpG7StM4GTxAs7MJZQ
         ktrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243738; x=1764848538;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=gKCEP4W+awyaczmLVEAKhyeLKzKwkxdZ52yScQQG/svanjsVqFmrnT94PN1IE9wPOc
         kCQLjbQU9T+FoeyAoD+2o0pks8gN9TLZ66kX2NjD9JYWQiZf7rnDCQSC2YvLV8+OXz9P
         1JG8hcV4tQTNT62q2HgVE20cRafAVv5OgKQUDlH4hnT1v9FCf3P2w3mM4YyGiLvJcFzC
         7sv+kDxlH2FPhpjF1XEDmCCcVoQyr0UaxFVYi4cXkRISBn1JoDi3FF4fS+JGb0XLF5in
         8oE/VryQplr4oP/kMDdMhftGOYRrwQbzBQFD0MFV3h7rR18s150Vwgad/6BHg53oX95x
         u3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVIjxheOe9+3r5r/0stk6Cz4Dkba3BtvA37jv10aygesPDQAr6GGU3NP3tuA6dgQ067jJtK@lists.linux.dev
X-Gm-Message-State: AOJu0YygBXTU/MXdwBRCZy00YN5bFgXQVJ+xCgMKVqnllxVAj7su51T4
	iSJNTsE/6nvxHFCg1a4P7NVM4v/NRBH140VBN6K1fKapOWl2ojuB+Rur29hbGohgWbjhaLdlO/C
	7j6+mEHnFFwkueuQPjKunAdmGOvukwxuM4lFXLdheZfsWdqVLD0btUldB
X-Gm-Gg: ASbGnctL8jqPVDYjWPr6pihlJpvIbSYqdGfoDjvjaUHAJ9ZzxN+OXFw2XvcjrnVXpQ4
	ywYDW4SgTmzl6coEoMt8xmbMWMNnqyCYMjZqV8dNdxTu5EvAXbJsoMsTOso8UMlF+dWXLku9GTk
	D9DYPLkaIlpzuauc3VUiWnEM5cGW+bMiJaxAD1mm7RifpApiJrKFGf0hUwaN5KkigzyMoBQocmv
	WqPbv4HhuPABFKAmkpCTn9T1Ya0s2ce0ULtZi/8ppdpbTdt1f2qYWqaknydWOtGRAKSBM59yn4S
	9jmxURneS2Q/+0f0wTm6CSSfLXB/oCBxvDpdn61+9wNi64bX8pkjVsNJgEUC9IUlFx1WbtO7H84
	oHZoBO16tGj3MPuiPDRWCc2crNT/MZ1bmBilKhw==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333097685a.37.1764243738290;
        Thu, 27 Nov 2025 03:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLHuJkpysrZAeyvEty4uFC8IBgU2xb/kZ57e2oHNqTYOlrQ2/iZ42+5b2yAz3us3STsiX/Pw==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333094185a.37.1764243737838;
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a48c7bsm137242466b.64.2025.11.27.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Message-ID: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:42:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: peWBkPmzEe3U6ZOfXuZAwanvL2wF4xOd
X-Proofpoint-ORIG-GUID: peWBkPmzEe3U6ZOfXuZAwanvL2wF4xOd
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=6928391c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l25Wfm-L5A7WpkZik0gA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NiBTYWx0ZWRfXz7vmAJZaE18Z
 8OJbrhA5q5Wwwqkn1sN/eqmXwGYM2O9DZ2z6EUaw3C4Ey3aGrY3XphIJ9mZj42XjRnLLaEb1pdP
 7GiFrsAQFHO13dg1zoq/acGXlVCPT15xsBXCKkBK9+xszBS4TNe6H3bFeq8e2/OhA4hurbeNeJZ
 524OnUliJ4R9A56i5De5nS/oepSRUUjfLhthGjBduMV0iq82r8eoGoGEMj//P0J2ZO46q+D2gy/
 9IuIiAySixTISkhXQeWxd2CBtCMVAxIei58K+xAfOukDlPJF5BVf8oOInw21abiU1d0hFkMg3+5
 GpqNnRogGJR4kYMu7w0e78G4vInTAo9zhbGhz6qgU4bDobnFnxcQfswD+ULie+UzUz5Zt+xe/cv
 0tSHL3LTtrSj4RJj3PI7nNR+1Zv0NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270086

On 27/11/2025 10:02, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
>> clang and W=1 causes:
>>
>>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>>
>> One of the discussions in 2023 on LKML suggested warning is not suitable
>> for kernel.  Nothing changed in this regard since that time, so assume
>> the warning will stay and we want to have warnings-free builds.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks for your patch!
> 
> =
>> --- a/drivers/i2c/busses/i2c-rcar.c
>> +++ b/drivers/i2c/busses/i2c-rcar.c
>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>         if (IS_ERR(priv->io))
>>                 return PTR_ERR(priv->io);
>>
>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> 
> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> The former seems to be the least common option.

As I wrote in the first patch, because to my knowledge it is the
preferred form for holding driver data which are in general pointers. We
do not store pointers as unsigned long. It is also already used for the
driver data types - see include/linux/mod_devicetable.h.

> FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

Because it is discouraged in the kernel.

https://lore.kernel.org/all/2023081004-lapped-handbag-0324@gregkh/


Best regards,
Krzysztof
