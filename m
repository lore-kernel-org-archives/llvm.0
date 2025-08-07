Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA7E24DD1F
	for <llvm@lists.linux.dev>; Thu,  7 Aug 2025 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554186; cv=none; b=CtWssj1Rkv/UFmcfpd5lR3nKdgb9VpA2MIxOrsMMsz+NmutEmnEWVqdsIkhBbD2qy2t5U2Flb3vqCWwRbyMT3I++qBq69hM+t0qhweXym0wfJMgm72Mc7RmPx3IXJXl47/gXb0GU84EkUDfJLyoo4VejDID9OUKbLj9b+X1eSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554186; c=relaxed/simple;
	bh=+iIt6eJa5z7/55bGmPf8SfWqrqAcCKwMujezRMcSbXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7oiM1ThL0hA7VodXmYKyGYKzyyzAqV4013Mx9yT0uHnfiebaB4qJy2dr10BdnSdfzXijqBOEYJ1YgcHdGyWjrryHCQNlDR115NtUCqd0VjBOycdbqzGhoyb7DsEansK57xUx+fenxiQavgP2X2jArHFLLPjSRzoM/XZZA+1AyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKN/qU05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKN/qU05"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5770FCWK025033
	for <llvm@lists.linux.dev>; Thu, 7 Aug 2025 08:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8cnnTCr0BqMwDmRXCSiVDYTd
	XzHaxhvasLyMTbeTJIc=; b=CKN/qU05FMQA+gzujiFPkSAKQUw6MA7hFbZGfL3B
	hOfHfrjY3mla9zEmM0PjyM57K7HkoioE9acrkNfsUaBTtJge7/QBPTvcYOXIL8f1
	QVZvtg9CUrlX6CYJLTRuuvNW880rVGXreMyKdtc44/H7VyKif3trXulIayw6wIaO
	0nMYOcx9hlb6Ps2NAbkacfPZAnobsaw/eYlQqkHXGWxPpHghEg1+ch/rclvVyCT1
	E+Ol65SLHeArr0UkQD1v8tzbPVeFeLQseQYC07yB/xTsUyjSzGhtJEqt34ca+Vyd
	Kw5gm8TEYCxoYJvmdczmncr3aJQYCyhBBsS6U2ay/g+kMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyws03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 07 Aug 2025 08:09:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06a73b55aso17845881cf.0
        for <llvm@lists.linux.dev>; Thu, 07 Aug 2025 01:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754554183; x=1755158983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cnnTCr0BqMwDmRXCSiVDYTdXzHaxhvasLyMTbeTJIc=;
        b=XKe7Ir9if+LNZY7uzABhoFAZMRgH1Lf1KW/BY53Jw0PFwin637lqJ/1OOdz6BjwcqC
         Cek3po1b8+paX6B2NXH9sjG55ZssXxsq5Q8BAIBtRizgYMyaq6iyPC4TRnisvYoDf+s8
         LPYLg3I04KODWxuoOlz3GVfuwf2g2qKKEjZK7S0m6CXIGSJKMY4ZAYjOrhbHEJ7VWINS
         SXKEK4vCeZMBIkwRj6m+Sco/No5946ZgVUR4ga8dQyQ0Exq+OS7EURfkGDGZWZwkJaL4
         QAFu6mpejwujGOQSW+xNH47L6d79AtAccDz3i/YG502b/k/+iFHe3zpD0yzK+wIr5FR/
         IOYg==
X-Forwarded-Encrypted: i=1; AJvYcCUqb/XBqGIYlUwcDxAm87ANKEikrRLAPiemacAZY9mw/VdVdItMhpbR8i3N5hpm7WDHknDX@lists.linux.dev
X-Gm-Message-State: AOJu0YxR/IAWkMjx4tupOnoOW5+mxgXyIWo5cQHn3L1Lwxs/gh7adzLx
	YbDiB8/Xr3kHIa8lvwNDC5X+BGV3AuOM3sHg16r5ZMMJ/5ViUvXBZYein9UuUMKrgqbXMvmoJMF
	txR2gftysEJe3Iy0b7EmD2sgv4Beb08eN+IaOXmU+OC+nm4Q0nGQWPYeh
X-Gm-Gg: ASbGnctdxhdAnvSklA/vodOiImIM0W6rW3Dc2mttGHPUgVWih3gPsfhJ/Am6EkJ/Eh5
	zb5zHnzZgG/KhOPOqMV/pMXDoFqykLiaJxb7XXHV6EGpWOeTTg05V+DITQaA5DSTMgvHr+GK3FR
	a8sQRPYZrHXXFko/T2DDSKbOJsPZhvwyrdN2jhtRWEsc0qY7wRWZlEFq6ubjDSi5r3PCTKA1ray
	chEdL00OQOqGne1dHNdEgm45iZKLGyxH6VlLCJt8834BZpXmdNV7T9MnFrukIVyiwroNO6uS9MX
	hn+/ZPqL5Fd3Ud8tG8oQqaOrwOEgOnnUfm52cmVyJTU9XHGhTDaWLNcurGtgEuttsueGVSJ6ACn
	lz9BHLy+RrkxGoRCRZknx4CgFCCrSD5F8Y3RxyYBxIZmotCdvVFg9
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id d75a77b69052e-4b0924fe2a8mr88796351cf.14.1754554182860;
        Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr6oBPT/KIywasjRNJMXRDMeHau1nVtpgPLjvj4ivB0nSsqqEOpEjGcFvOQTtB3vlNCloQQg==
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id d75a77b69052e-4b0924fe2a8mr88795771cf.14.1754554182037;
        Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fce24sm27550341fa.66.2025.08.07.01.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 01:09:40 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
References: <20250807072016.4109051-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072016.4109051-1-arnd@kernel.org>
X-Proofpoint-GUID: YSCh3l71IHzmn10JfzB1QzVhWjTPPXs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/sQEUQldQri7
 v9+sGSAjikZLl5iz8up85sdsO8H4wDQA2pkzxxChK6hJceAM3Wi0zkwK9XsW25S4AYZTiKyFnES
 KZcxqEHxovlQdPfUgL670+KiwNtCqMA+9ZZxQxk0y5v8SFEASh1VjcDJKtEZq7whwfgNlQcnejb
 mT53EtHAS/B8ra+RKU0bqS+zmQJyykEmH5An3JFxxE4dLfxW50RiZ4mnUDnfjp2oG/sPqXiAhwR
 Jk37TsHKvUy/5pvKcJJ5VhQcTBTZQFzV/KZHqRRX64XsYl6V8dGpP07v+C/W8GQjXaMGop8mT9c
 D0/XUXnej1h/sHvnSxqMjjk/iQXTIo8obhsQmFzwesbGVEERwf2YLfT0VBgT2vyUHiIM3vhm3jf
 +Atd+xVr
X-Proofpoint-ORIG-GUID: YSCh3l71IHzmn10JfzB1QzVhWjTPPXs0
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68945f48 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qCxGkQd1JP7TPUfVb20A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Thu, Aug 07, 2025 at 09:19:48AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-21 points out a variable that is conditionally initialized
> but then dereferenced:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1138 |         if (plane_state->crtc)
>       |             ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
>  1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>       |                                                                 ^~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
>  1138 |         if (plane_state->crtc)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
>  1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
>  1132 |         struct drm_crtc_state *crtc_state;
>       |                                          ^
>       |                                           = NULL
> 
> The bug is real, but the suggestion from clang to set it to NULL is
> unfortunately just as harmful as dereferencing a NULL pointer is little
> better than uninitialized data.


Having no plane->crtc is a valid setting and it is handled inside
drm_atomic_helper_check_plane_state() by setting plane_state->visible =
false and returning early. Setting crtc_state to NULL is a correct fix.
Could you please send it?

> 
> Change the function to return an error in this case.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
