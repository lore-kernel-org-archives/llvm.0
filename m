Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803119644B
	for <llvm@lists.linux.dev>; Tue, 13 Jan 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338134; cv=none; b=isW3pu4zwG9H2spAO1DlYACgwDX8kNHKc8g/ilBzSUfZrMzZl3C9iLHZuY1ol9weXpN8MKXbmMzQwSb6Z5s6l5VWu/ZJtm+Cc/xCpjsi+d0U7ABasGP2dSwr5sSEV1AYQKMqvGSosTwm2k6VvOy/h0yJVhaCsRCnVOXbZ+zsZTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338134; c=relaxed/simple;
	bh=ApM7OzbIE/riLz+7TahvI8JWee0B6zvWNi/c8/Iho4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKqeOrzSaWNGDPlS/pPi2Bgvs9IfjiO+if8c8W8HKCMMOswvTIzf0dHEfgpD8IJ6d4J1cUpUcwDPBYl3RrfRO6L3NxzcCJAUu51oxPzJ8k4UYhX37KOC6xxBhTJ+r7t0FNBkinI0bgMQR6kYCmBwwzHvzPJZcbPsDHCqoA0HnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+qWKaYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpTTsQ4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qWKaYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpTTsQ4A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DKa42u1389698
	for <llvm@lists.linux.dev>; Tue, 13 Jan 2026 21:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=; b=M+qWKaYjaEwGs7Xv
	1f0ZBNDgMy5taVSN17y1VlpHKIz3yinTD/VEQZMCRYUaE2DcUPd+JALbn2IOWlTe
	C5zbGPVBlFxdNbHlArgTGvZk9N00vfcXAhfhd1WNN6HapejiP2ok+FmMLvwN8IlA
	7HxHc0OVNZopGB7BjYxer4BjBHr4Jm2lY0Jax3wrEDOzo2QZqo+Rg5qbBP6vbsIs
	azoJn7eLlyYL0ngJDucVHxYUtsTYLKVMci05VaRJzDVaHcqLk+s1BrMtXNDt13kU
	ng4zgKl3pygNStskRIUSlSzqoQ3NSsLXDQDIwMjXaBLHXxBBtJ2ClqJSQ66dP2Ow
	/Ld6tQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v8212-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 13 Jan 2026 21:02:12 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5636136aed8so10989098e0c.3
        for <llvm@lists.linux.dev>; Tue, 13 Jan 2026 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768338131; x=1768942931; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
        b=ZpTTsQ4AKGDgMasUdTaGF2JSBCY/t6mhs/kNAb2sv9nRWW5QumUoSoAHe+bMWEc5aI
         MLeUD7OC8LTocBRKTNl6S/OAViqjWKUM5l/GE7TLjPvYZOz7og+UCUtdpLdLRZ/UJDiI
         /UGQf6cFwfYQnhJ/hI5POKrxy2dGbD1T5T/ToisUt/ZBlyqHgLWGQhwTmXLwARFgjCro
         QvWrmby0vK8I62RD2Sy/MvqJYtJRS9ZSRCKMiOOg16Vgfmu7viNMH6KHu5XudpqxEGsL
         0n3E5/LGy9cukaP0u9Um8454N/uAl4x3WHilWYCqPQxnk96a9AXH6zaG/eJ2Ixoh6U+2
         cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338131; x=1768942931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
        b=KokCAZwkpWLIuIkhapXeq7xH3hwoXclSTyyJZit7WhGpzWMSlWbMDHuikp3L9jCY9o
         bMw7weZg7qU9cC8jQNBRxJaGmJB2/H8YaX59fuy2ZPVjCQ+pJzmK2aZh2lbvt0VG5BPt
         O+NKnwYfOPlGWmDDmsEnPwb/iQNzjBv/QeLo5Thzfh4i9PZKgs+Rpk6nUM5ihI95iniX
         hCh8VHqxkWp5yYexQTnGfd6QDuIhYxOyXOTibrb7DVbkbeUBVMsZM2EUpfDbAKNcb93P
         5GCBAFLybERYB7MG4/d/8JObkEQx2AgfCpw1Aj5cY4dD7aVIENDbpyWKTMxzEXFuL2XH
         CDXw==
X-Forwarded-Encrypted: i=1; AJvYcCWOLkaroLradvO2YiPtvVeL6ttgLOEyURBnR+pTsIuuRGTJTp/YF2pu5MBDDhee8b/fEkG8@lists.linux.dev
X-Gm-Message-State: AOJu0YzmaNKNe5p5mKbdiArhZHw6DtFz2w5Vj8HlTyLunv0BLVULbrDl
	GhAOkVOjt9FWk8zT8kZWYxVN8TTLIfoMKkSSINAxHZgbppaUYoP4m35bAByC80Si0v4VgtcQo6K
	X/xlIVkzz2xTaSRUasnXw7u3617fJ5sKTwcppze5FwnKhNrM9KIKbIbbD
X-Gm-Gg: AY/fxX5s7OHuiHdgtBx1tumNH6HX1TWzh+Q2VtV6CL7hsKGyAUGS25OIe6vDmf6Qcnu
	b/wK0Tm02wWZqF1f9HYOtvcHKCn4bkBXoXKuyHMX8OGVJwB+mujcWp+EmHFo+EM31d+fSeSti55
	0ctPeAqOzJYK+y9IRsAk/PY9Y4ydLsLDhQCCmjbVbVn8ajVztwEsGa3L3KsJQWNxYdABXqf8K65
	18QQUOU/rbx8V6H1p6r8yBKwvkjvX/G6vHh+WdODXbkuYtUnJbNX13R6PQKK18neUHWpgkxnMbP
	vwZQDaI623X3A+ZWPPGo+YTLoBodlzF91iknKHpKcqkbF9cxQffr+4jgQSklILLXcW8QVh58wh0
	7sJQRVrXB5KhWKtWpaFFJLyhK2Zoxwj78jb6Wv7Nkv5Gd2LTyezQ43m1ZbJ6W1+P1vI22bO6lYu
	yVbJIu
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id 71dfb90a1353d-563a08080a7mr278137e0c.0.1768338131572;
        Tue, 13 Jan 2026 13:02:11 -0800 (PST)
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id 71dfb90a1353d-563a08080a7mr278104e0c.0.1768338131125;
        Tue, 13 Jan 2026 13:02:11 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm1126590566b.31.2026.01.13.13.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 13:02:10 -0800 (PST)
Message-ID: <0919844a-9246-4bdc-979c-115ccc3995c2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 23:02:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
 <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
 <20260113205955.GA2893481@ax162>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260113205955.GA2893481@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX9/NywyWSwWyb
 M+RZjmmxVYqfW4mHT53/Kvxj97j7As3rDO76bqYTZ1Q0MQxFhpJiOgcSSQSQsglLm9TFX/6rWiQ
 AJhheIT676vEJsxXKxT4WLLAzmTSKgq7Xod4jns4iU9eKpXiHfcZseBzhypAwufeeo6Ucg++5Ix
 45C49leKFW0O3yT/L80SsIn3ukn89m2xmPj4+BDMurF/c6cZDDcRTRMeksbzJwOGLE2HrDjo6uE
 Mawy52bllmOUbb72Mo7m6rgrMWjz+uyuVAzAENCN8lEdKQOc1FutFrYjATtFDu/gPB1eZg0EWQJ
 HZrMPNxAs66JJUzGo47IcdC2jvbKR/KcAPoo+JiHTp+/JLaiY+6b9Ieq3Tjn5ZzZiWTUoCZNBlq
 Dmq5xxylVKH4vt74wuo5JO9zk9DfPTMCe6AfOhDF4LrlLCSnE+2YR+xf+AhKSzj5qJdEY9aVELl
 dDxEAWC3bMBclBGnfUQ==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6966b2d4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=0--PztnLt7rTvDwXMSMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: nJGhgpjQmQzEAgnyEFvbzVE8GTsm6Bdd
X-Proofpoint-ORIG-GUID: nJGhgpjQmQzEAgnyEFvbzVE8GTsm6Bdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130172



On 13/01/2026 22:59, Nathan Chancellor wrote:
> On Mon, Jan 12, 2026 at 04:37:46AM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
>>> Dmitry, would it be beneficial to throw an actual error when the rate is
>>> is mangled? i.e.
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index aa2303d0e148..4f710b8e6bc6 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>>          return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> -                              u32 rate, u32 stream_rate_khz,
>>> -                              bool is_ycbcr_420)
>>> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> +                                 u32 rate, u32 stream_rate_khz,
>>> +                                 bool is_ycbcr_420)
>>>   {
>>>          u32 pixel_m, pixel_n;
>>>          u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>>> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>>          u32 const link_rate_hbr3 = 810000;
>>>          unsigned long den, num;
>>>   
>>> -       if (rate == link_rate_hbr3)
>>> +       switch (rate) {
>>> +       case link_rate_hbr3:
>>>                  pixel_div = 6;
>>> -       else if (rate == 162000 || rate == 270000)
>>> -               pixel_div = 2;
>>> -       else if (rate == link_rate_hbr2)
>>> +               break;
>>> +       case link_rate_hbr2:
>>>                  pixel_div = 4;
>>> -       else
>>> +               break;
>>> +       case 270000:
>>> +       case 162000:
>>> +               pixel_div = 2;
>>> +               break;
>>> +       default:
>>>                  DRM_ERROR("Invalid pixel mux divider\n");
>>> +               return -EINVAL;
>>
>> Well... In the ideal world, we can't end up here, PHY's
>> configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
>> rate is is invalid here. I think, we should return an error here, but
>> there is no need to propagate it further.
>>
>> See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/
> 
> I interpret that as approving of the above hunk but omitting the hunk
> that modifies msm_dp_ctrl_on_stream(). In that case, what is the point
> of changing the return type of msm_dp_ctrl_config_msa()? Wouldn't the
> below diff have the same exact effect as a smaller change? I don't mind
> rolling this up as a v2.
> 
> Cheers,
> Nathan
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..d8ea73b89f7c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2409,20 +2409,27 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>   			       bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div, dispcc_input_rate;
>   	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>   	u32 const link_rate_hbr2 = 540000;
>   	u32 const link_rate_hbr3 = 810000;
>   	unsigned long den, num;
>   
> -	if (rate == link_rate_hbr3)
> +	switch (rate) {
> +	case link_rate_hbr3:
>   		pixel_div = 6;
> -	else if (rate == 162000 || rate == 270000)
> -		pixel_div = 2;
> -	else if (rate == link_rate_hbr2)
> +		break;
> +	case link_rate_hbr2:
>   		pixel_div = 4;
> -	else
> +		break;
> +	case 162000:
> +	case 270000:
> +		pixel_div = 2;
> +		break;
> +	default:
>   		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;

Please add a comment, stating that we can't actually reach it. LGTM 
otherwise.

> +	}
>   
>   	dispcc_input_rate = (rate * 10) / pixel_div;
>   

-- 
With best wishes
Dmitry

