Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD42D6639
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622801; cv=none; b=ESuFkboReYx+HeN5r21ktzHAc41Wu4DjQONmad6wJfj0IinBqahzoJRxB+XRwuQScRghfOxkit9OapubQ6bhPaA/YypO1I5kg9Cs2kB7AyGCDIJMHRl6eKKxvS89HXHJT7GpJgY5/BzmNQVZ+/cuGS29KMHawHWGN9JiOmktiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622801; c=relaxed/simple;
	bh=svz0OAuyUwTJj9o6zAsDikYQeCg6mNOHNGiQpMViUMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWY1RGW8pGrh/Er2wgL7cN6/BHun1s1xtc4dtOPgZU6uKh8wfMa5AQnyiEa1SbmKMpbWZzAnmvj0H3+YxaxE8wJJ0JnbwE4qlxxIfl8aAplEgvdq0qoNs/knGoFW/6hnpLA3/osbPfi6eRKtupO4L+50kKMLo0SmYalb0TMYj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaYCSLOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaYCSLOO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDKFe003436
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 23:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=; b=IaYCSLOOLEaD7LrN
	c+4qWtRQIwr9PbsPWTZao3TgCymOOJOmZECQEhAnPDrIM6rlecqc/gzA17hAKjgG
	VnhgYvgvLRa2DAyMv+gUj9QQYFILDfXiW0q473s1UBcR5ZBMr21PyVcIC2rIwF2I
	KxhYX+8Rwkw+YSCi65/ugOgmCrDQgtCjd2k7eYoGmr95nqmJy1CocCi99FtNEwcN
	tCEaPdzpnNh/A4frAfIW7sxs3lu/eXagbkYSXErqXrjFbUHH2N/1fZKxpjpPMeMA
	A/2Gduk5qR2x0fRKHt4IMfd83iPC1GzodJsnGj1EF+85DhqkHvzacrNWyUGxfZNz
	Y/Ug2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drmtfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 23:39:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b362d101243so4976654a12.0
        for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 16:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752622798; x=1753227598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJPlRCoQzcnkdT0dHLtH3H9tpyaccIIMXOn4F1lvVCg=;
        b=ZEWuFtULPZpZ15zfThkbpjPHLzbHcD6hnYJ+qZWp9wE41ue/LPWgU8o8F/6WGNqj6T
         butlfP6EZq21WEh3L/0k217EldN/e9HTGD7vqZiSOjYE+3M8tKQNrdygCgqxJ/rV3k9S
         vLT1RH3q28ZMLDnEqFFAgf8tR8SfurbY5KFC5Hw3o+SpUxD2QeaJrcwyGOKr3ogx6ptC
         lvzlwOc7Gpv9pOB0QATrzJk02OQ+/Fa6hFFnScqGYA519C4qzKg65QDlvSzwIubm8reS
         LjJSoOZgij8ZdFBIXZiFZdZJw3aXetplGQWsc9kWjxlYQp6I4wSiXN9vIOnRsYx1i5fM
         DiOw==
X-Forwarded-Encrypted: i=1; AJvYcCWIafZCJ1Q5Af/IPcFyNoeOYwSRntJhnVJRlKjpr6YKtbAIKxjcRe+UwMj5j5RtMOscChNB@lists.linux.dev
X-Gm-Message-State: AOJu0YwxXCmYsn0FLRNiKvRsFu7qRVBJGyoBibmDueL9Sy4fO/AppaNS
	WBNuxkfNAoqBAzast7s750EpY2Yz1bvDjzikMIvmyp6ft9citKt8dvKj2rzT1nL2++XfKCd/PKb
	zkIj9yuDCrNefc0Ib0tVCh00qe12Ag45mDajABgDqqb41/62N2Xof13A6
X-Gm-Gg: ASbGncsJCq7iOclTaW0emcBzawxrMBqWhktoV8QZMHtD9bs0bLbJtipQk+E1DJz7b7w
	bCAD2muhZYaN4NY8Fknq5uU1FjK2n8usWdJ1hdlLdElSxwnUVuOzqaBtl03XIbZu8JVpfQnajn0
	aUPHxJO3kaDXbAepevnRUl1sTDmOvQyU3rfckAdnpl32QASFgaeEcrMB77lCz63N3JZJLiZKPQH
	Yt2RXijun0wbiOQ3AxfEULlTwNmlBz2alwXLeuJii1jzfRY7z/7wJSkaSqgyJKahetQU8fyxV3v
	oyyL6qqV5UHFfFcWC6qZR4g0tQfV5zA3+mV3OCUL6jj2g3IvzKVsbjKbRMn1S/Ho/5tfhCdvnHz
	Ctl5hr929YkDLk4onJdcvbQ==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id d9443c01a7336-23e25789d06mr7514955ad.51.1752622798183;
        Tue, 15 Jul 2025 16:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf12jj/HXthN2xljhqv21Hmol41Hu+5CcS5uDGOfODnO8leUZVdIm61q3dSm6XrZYdYl3Kww==
X-Received: by 2002:a17:903:8cc:b0:23e:1a6e:171e with SMTP id d9443c01a7336-23e25789d06mr7514655ad.51.1752622797749;
        Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4333e6csm118928995ad.162.2025.07.15.16.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 16:39:57 -0700 (PDT)
Message-ID: <03f4b74e-9231-43f7-aac1-b2ec1b6cf8ed@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:39:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Initialize crtc_state to NULL in
 dpu_plane_virtual_atomic_check()
To: Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, stable@vger.kernel.org
References: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XygVlYAJXwww3EUDCdRL6ZSvgD1USG59
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6876e6cf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5QVS9psdCSE4z-izM1AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: XygVlYAJXwww3EUDCdRL6ZSvgD1USG59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDIxOSBTYWx0ZWRfX23bljm3/M7I6
 yKwq+YIn6utSBC9eF9artHTol/tJRNPppZ+2JPbnVtcpj/zamRCYipIBQvdA3VTfOQ+hC5nC4uE
 Bsm6VzYriezfi0+FlwDAli7ycXijsqP3fRc0Jp7Tt+yv0iFS650hieoL83ETDOWAd9jj52DJ0/5
 uen7emtW2ktZ+f1NYIrs+v8FD4V9xEItddTZWsUQIle79kJyyVXN8EAhXcDyG9gkKju2FXEBuDG
 k8fyNUpc46OuzO2gdtvcY3syvEciqOYW7BsQnC+d0uADg/wEogo9Yo59QrmJelT80REs2/vIGOR
 fT9Lsa/ULdwmVx8fVC6dGO1MzyLFOdx/AXbB36rTPFir56hAqWvC4f1R502JlI08I+vCrV1Tg6g
 xMpXumwpIf0DJZB+sElLjItKTKNu1x4KI7AKL/3yhNLAFEo+NTZvnQAlEpzkxZHy2R3uX8Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150219



On 7/15/2025 4:27 PM, Nathan Chancellor wrote:
> After a recent change in clang to expose uninitialized warnings from
> const variables and pointers [1], there is a warning around crtc_state
> in dpu_plane_virtual_atomic_check():
> 
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     1145 |         if (plane_state->crtc)
>          |             ^~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1149:58: note: uninitialized use occurs here
>     1149 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>          |                                                                 ^~~~~~~~~~
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:2: note: remove the 'if' if its condition is always true
>     1145 |         if (plane_state->crtc)
>          |         ^~~~~~~~~~~~~~~~~~~~~~
>     1146 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1139:35: note: initialize the variable 'crtc_state' to silence this warning
>     1139 |         struct drm_crtc_state *crtc_state;
>          |                                          ^
>          |                                           = NULL
> 
> Initialize crtc_state to NULL like other places in the driver do, so
> that it is consistently initialized.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2106
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Link: https://github.com/llvm/llvm-project/commit/2464313eef01c5b1edf0eccf57a32cdee01472c7 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 421138bc3cb7..30ff21c01a36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1136,7 +1136,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   	struct drm_plane_state *old_plane_state =
>   		drm_atomic_get_old_plane_state(state, plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state = NULL;
>   	int ret;
>   
>   	if (IS_ERR(plane_state))
> 
> ---
> base-commit: d3deabe4c619875714b9a844b1a3d9752dbae1dd
> change-id: 20250715-drm-msm-fix-const-uninit-warning-2b93cef9f1c6
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 

