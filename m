Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE8231ED7D
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345624; cv=none; b=DeCBBp22tXMcxH070VAoWWobOfxMss34/t4VKhclAwxFMkl1qI5tXzOIDtcCrrBwi7aaMSQaGJuq47KKgSAlcY7MxNDCzAo7WsGuqBvpnwZG1LlklKHjBUHGVZ+dKUGri+ASRshLXDQYKQYkA83MAjlPRUw3lnQ3xrbOrfFHmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345624; c=relaxed/simple;
	bh=viziuRWu3cmIYW7KJ4As+2Yaz3LssnrQtJgI6ai/NA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKwCtJhbV3onSkGV6enMu5Ehl/YP8dm5lQXvJSxJ4iYV5Q+pAylDAHOENKEei74d4mQHiQVu2/HtED8fQbdzUPsZkCoLwM4Ovrz32xefyP2aovOuP9jcuaPCO8pYIjTNsokvVPmCn/wxBupgpQGgOo38+RwBNaPvPcNraaTjFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1Zuk3yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGlRPYuL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1Zuk3yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGlRPYuL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEeP401619
	for <llvm@lists.linux.dev>; Mon, 6 Jul 2026 13:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=; b=B1Zuk3yigUJ+FfBQ
	IJL6kp42xLSI9m4C96UnNlFoDpC0Hv+keCZwarJTlvNZEC106BVlG+QpMHk/S29/
	Xwra5jhOjUPCHhNyBCZ17mM2AyJttWu82IomZikWK9iwTI2GRGPgTDSPxAGI4ByP
	IU3JsyLdkPUwfoL25FxlvkfjrkYM43t+X7MlJELYd6hIUu1yVpj6gf1xyv4u7B2N
	Q+cw7rSOfqNoSzA4e3GWFOCtt01xazyOPviJuy5Si+FJLiYcJmDiMz6dnB++Z4cr
	znBVQxM8hAlcxQ9DOygXt7iWgBRH6a7vYA47wY0KFcOxXxo+D7ena4m0s1YmZgJ6
	6hnQWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grw18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 13:47:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so11796941cf.2
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345621; x=1783950421; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=aGlRPYuLdiikeRc/AcUUAI79kupynyxJLbQIBVdtcowNkjOaNDJGHgWmyOs6mr2OZy
         JLpKZyzC/GroxEO32WtVCnsiNPESGS/nJM+wxfRjzTQA2OPGETwnuKc/rvzCv3RD7pVQ
         A4E/6nFpw0SkIoTGEzZpDDcl0AZ+lsldK4M2Dos2sUX1ST1onnqwAaPQYpOu2m+UJa4R
         XeqiS3FYHjGdfW/XlL5FLuQDzJPZ2BqeXvNpgsFb4HgAhBDhhyrkT6cmS1dqfk2tYOZJ
         /Wlwxqnr/Yz3dblsXLzFKY4BCPpXWWMmWxsfpeeEUM6J173F8x89mDYkwX2j51L9zIcq
         HZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345621; x=1783950421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9//kA78ASIVOr5machFeqRo1Ify7TeABEBtMdzpknE4=;
        b=NWQW1afZw+J9bowfyY3uCln37LRjqfR/fxBpnbmUgvFTxJ52Ki0V9ks8r2ogU9Gn2v
         4E0+V7cjbUoOJGyo3POwvY6w46zSrhK+SU8x6KNEOwGD/jHrstgUlsAnLceM3c4kJGK+
         u7bl99NsrVv0jHYnP+xRW1HSmyR2jwrEbu+atQ/We8K+dXWPrGPbD8b5RXTRHqq5q4B0
         M5dK1d+AVsnpsz5UEDKoGb7beTtWvU6kGQNBn717Wo6Nk8wqLFk08t6ZN1vxl5CMLbSZ
         /s5nxbjSlUXftWQlNU2SV7341BQbTt3xh9pdfWmOyQslXv6D/Ph0ACICpu8HLRM7QYBE
         bbNA==
X-Forwarded-Encrypted: i=1; AHgh+RrnMv2G5QhukBF34sxD/J64dTjl6ZzHUzbftnOwhEgW67dg7K0TgPEeuYV0Im7feFjtOJh2@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5P1O4u5d16fxu1ZiN8Kmq9ilmIMSrY4crNZZcu1YaM87FPjqf
	j0TMkGmhBpPgzR5StavST5ZRPtJbR4Upn8/opaGEjIqddPBYIKEllYzgVjJPbourKqLJKBWHBDu
	MY0il2Ef0SBJ7L+s2hfNvVvJU46ZlWNXl8WMsgDnRinZzZr/fKaLoajBk
X-Gm-Gg: AfdE7cmBb9sqXoBigGwZnxi6xiH8q9MJ6SRcThWlZcbIBeFqh1kA5ur28eRQQT0rdxO
	V8ZCzxdbuDBvnXfX4rQY9g+KUAp9VQaykJue2yzVNjj+1K0dWbJPcmZIdTbubbXzlx1eHgh2WfC
	SORaHG4eKAMtdV2wpsSQ/WarpqteuamN9kIY09fyLzIsWrl3ScS/9/jGYCh5FSyMVl4DJhWGljA
	/QIj4Mnw0ONf6kRsGXLfYi1+PxOASebeICEFPkz82yUxD2/Oq1qlRE3Hz3G0umHd+GNK3zAQS90
	0chv/UQwCG5nJ5IEpzYhAKGAf3+NFEwQk+Ej/PNwhZLjQ3wDL/jXswdb7USGicMsLski0tUouKo
	H28PQbNQ21i5so8ubpGXQwqPDtYmd+kk2hPs=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401781cf.10.1783345621068;
        Mon, 06 Jul 2026 06:47:01 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr92401251cf.10.1783345620551;
        Mon, 06 Jul 2026 06:47:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628effcsm748307066b.34.2026.07.06.06.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:46:59 -0700 (PDT)
Message-ID: <180768d1-814f-440b-805b-61148720f81e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:46:56 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GitF3HAz49mA8vGMIrkPF5iKOHCvvSoZ
X-Proofpoint-ORIG-GUID: GitF3HAz49mA8vGMIrkPF5iKOHCvvSoZ
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bb1d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=N0UkSJE8pd8tNmhoSi4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX1SieCQOhbWql
 7i6M49Z/RhvJfld94hU42irJ/hcKvCLVsCLJXJiuj8XpAX7KYATtu+MOx5ZxiSEjnKiXZgvEIaq
 jS/GUENogSdswq1T4QF04PSz5nYbm9Bbx8aFwzUbLwm5q380fSEUDuDmJUjv6LA0vJlkF1PrYdL
 reBFWIlfbYOOthms0CD329KFMDa2jbhgaMggOg3CWDN0IjTUt6xrRdKnjlFQa2lfLIHLAefZ4My
 xpF5FLjA4JWidLsZmSTskuOZOUu7HqbWbd1LWF7weA72vaC/q0HdzX+P/66K3aP/VyxqtATpec5
 SmAOYT60cUI5+o8lXNDAGwghDr6MUxwz8JQJnWCChihUTf3NAA+emjXxyZeZr/Op0O+8Pc57VXa
 MV2wJtpPX2U+s3Hsnnb+ukySJ5GKG39E/TViJp3UHgoWQb+V8lgx83JwJsVtvg1EodJu9v1d5gZ
 D8X/clMlgwiMJDO28qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MCBTYWx0ZWRfX2tBIPPKm5DS3
 VfF4Nweb4ltDZF2l9YG5emxlwwqclZI/170TwvV7gOSm7pCOaL/P8LS1ZzzyHcYE1XmZFY+mMxL
 q/IbbVFqr/Cowauv/Hv8NbnnR4V4auw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060140

On 6/30/26 5:25 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
>
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
>
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +	prep->data = pattern;


the robot pointed out to me that this must be = no_free_ptr(pattern)
to prevent it being cleaned up

Konrad

> +	prep->len = actual_len;
> +	prep->delta_t = delta_t;
> +	prep->ping_pong = ping_pong;
>  
> -	mutex_lock(&lpg->lock);
> +	return 0;
> +}

