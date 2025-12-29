Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C2A30DD01
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008702; cv=none; b=bBgsIZcZRXWfKIHfgOnfiAvoi42Okr4kTE/P7AnYjroA6Ktjw/664vQVyh+AQs0KRfEdxFpwOppCxWZG9Jm0A3tK2Yk4E5Vx6D1/HeTQoasW9YsSzndp6U3guCOd4FtTn9KJ9rwXTFyNEpHWAU6qAFBec1kpXPtZ7VVdZADfPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008702; c=relaxed/simple;
	bh=dzy13qrj9gNOfWVk+f9fG0zzLtDEbH1xmJsZR+dQhu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JrZeebiCdT3LHjdZu3zQc+JZEeZJIqVvU+XWrXb1YiYQ2cOSOdf2k6z2n7+cFpwcoCeRqKabfi8h85aD2yfTctLrv5168N1r/p2fHkJIAoiJIgD8uiSqrI+br8Wzlu+e8Ry4zYtCvpnQl+mykEdPUwPgSgg2MpqXptpZHJkrz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXM4as36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jl8to9Sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXM4as36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jl8to9Sa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA2wDq043783
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=; b=GXM4as36hGtfQEt4
	XnBUNaKF34VMg618YSoDQ4DrMeHaPcAtzAZurMvqdLBYfF3b7mE2c7zrkvu0fzf4
	f3hXUBS/Y86O6ktneornkK7Zz8228JQj/Tz67sBwOd/oGSGF1Udbnwhty0tfvo7R
	JT29j9PF+h9ISMmTy2skB0/ev1cMp0sIK+F9XkZLvYvqIW/CYqpuxSi51pY47beN
	5LwLokf4Bgn6mLY1+aOS244EHgnQtfvKEeyyGVEur8erDbHaBnzt8GFCdFK1CTUt
	albXuSdCJVWR9msF6sv/DBGnmoBc+sZ7ITPOB4HxUUQhWhivzjA/JxGd9fpX4abC
	3yo3UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v1g5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 11:44:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so53115671cf.2
        for <llvm@lists.linux.dev>; Mon, 29 Dec 2025 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008696; x=1767613496; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=Jl8to9Sa0aCrmglpG/oXxmv7WdjU47UDmUK6e6cbYxZepsxRo2Ok6RwCjSR+KiMkzn
         MsX8VHfeqwVO+i4nDjepqKd/Pji6E1QCLo9kNAoD30YQlqpeJcxngATSQNt5IhodWTfA
         cMSVeQu5WM+Yd8mxFrIMn0USWGKXWV/kLnAtT4lbYE30BbV6S9PZgs7lSW5bM1XtHwPk
         ZpD0X+dKc6xhwRKsoRVl/zFbNNRGOjyg5p+7XQraIEpV+HDE3cF/UiQAqKbDDXBpsacV
         8DBiHJ4a//86FkGgCUbT/8nZ8OW/oDWcDjMZwhJe51z8xy8BW+IwQUQtxHf+Bn6plEDz
         bq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008696; x=1767613496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ucAJJrnBjVPWWwtZNg31IitMUWwp33Ja0WFe9A2IcQ=;
        b=dDocKCdAsAoZTIMgUngwBBqRAfc+4hbOuhg7u6W6yAR0o4BDHqYVGwWD+OSWGBNr93
         yD+hLYoKs6j/M21pS9TnTDQWrVxPialbWhkWax4iWCCVrVS3Wvs/gojSBVZnElE3aKGX
         sDDAdHuE0NbcJWuCV1uixzXxkLl8WGRLvovIavOEayvielf2JzNl+xWDDuL6dFeMQ/c+
         3iqDqsAaiX9vp0ytPTM8apHxc5Ah3jjoeN1G0qluCUArTLDJqKkXf2G6X4CJXf1QunUP
         Kc9KtA/dqkiWpg0xLFoTJZWcW3x3w7d07sVmndWqA6we5ag6hsZE8NIBDQNwQh/5nQGj
         9i8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1zdx5kg+kOVOzexFyeLzTz/lLjaS5DfxzLDk1xFBNcbMpDTOLSZedsVJIR3ttmhcNBuiA@lists.linux.dev
X-Gm-Message-State: AOJu0YzyLp2sYTaa23Xv3xIqXJp4V4uZYiknUZkzHzO09+KFc5EzHJKI
	AoOf34PNw+n8m/0JWcbXLE5e5zGnZdqbHI9yQzr0b7M+lnzLcXDenXtrgw9h0j/BEKMlsGLvAqv
	FeJSa7Tw+qKWq3RdR/doKky/SVBBV7zwPUcr5PeO1qAcSvCcLNwkItxzc
X-Gm-Gg: AY/fxX7gY7eDDHOdi22H+h8stMzGZRNJpYSMP9Tg6eCJ6c1ooBgCAUN0Q8vBE01cvwL
	gPmY+RKaT8N212MxQBTJzZfMKB0fBCW50EgxJSH3Etjtvyd5kNt5J1qfNjApy86yl8rQg0pLVQ9
	2aHX7PM1qD8HaMaDHJQlWRdwB/NY+nRCxSUFTzE8/vtI05uwWvsrWE1dURI24zcF49yLTk/gL13
	H43kygKPu8isEIa0voxaIECWxRe5yD3m7zPU3fA39jZL7UNspu99zPM3Bke/ESnXN5VO8unzEMH
	KLbVsMSHYM57AgkHpeSwum5VNEEwmJdsMDXeCWOw8MK6GkiEymorvGvhN7llAtmgq7aP732Dpj5
	iwZbb4CSo0HBOG2t5k74C8zn/UMtn0h0LMGb82vEJQaMyV7OHxEnTo8OCMuvaNcklGQ==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398681cf.0.1767008696128;
        Mon, 29 Dec 2025 03:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4JottHG+Jxzc0G7OmGsV87ONcdkVvVeRiYt9/yXxfUQBT1GQWAHX0HTrLAGlJKNNpbK04Q==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr320398451cf.0.1767008695663;
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494cd7sm31326686a12.16.2025.12.29.03.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:44:55 -0800 (PST)
Message-ID: <e7f7878e-3b04-4276-9d16-b19a4b922d6b@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:44:50 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-kaanapali: Fix double array
 initializer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mexkR816Kea5KBqnmJnUOzS-0qaP8cSK
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=695269b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=486DEghy8GcDG8TY6xEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX0p8wyMDmFTDj
 HYIrzZURPoSoiZ0LNurbXzcBPuXiBm0s4Jaof3sLIudssXhaBInJDCoadc7uJFnxoG7CoASf2yK
 Qs/HtFdffUkFYVdd3yOgopDYCL0SHi94KodoYmH2VHoBsAunhhYwwectZBWR9ou8CdxCIUoOHM1
 uurSQSIKXxVMxy/P4d5p9AqVVN9cMkgqC1jnvkIAlBdpakAX/sGf3XAGzUaKdoszxW1lYN4QwUw
 m5Vpatjs3NHCguehhYM28KYGL6ltD8aYRwhNWVyBvU4c5YIBjCLC6bEtuSqwtLIDfMF09CWoycu
 bOa8XA3yG8gAqjVEbhZoGElYq42O4VhrByoI/dML8SPNEtu3ds2UXNjuMYpu1Ne6xngi7DUAFB1
 p4H+Rjcib+oK35fC/36EUhuHscEF7dmS41Nm5AZGJIQz5Jdi8qD7OUoN0QX66AEvAjdG25oereQ
 A67Upjpf1SGE3yKVNEw==
X-Proofpoint-ORIG-GUID: mexkR816Kea5KBqnmJnUOzS-0qaP8cSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 12:22 PM, Krzysztof Kozlowski wrote:
> [GCC_QMIP_VIDEO_VCODEC_AHB_CLK] element in clk_regmap array is already
> initialized, as reported by W=1 clang warning:
> 
>   gcc-kaanapali.c:3383:36: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Too bad this warning isn't enabled by default

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
