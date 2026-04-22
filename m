Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CEB24887E
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822859; cv=none; b=HiEanm3MNDipx0pp76tUXVIdTlI89SM1TPqV+XsbN4qb7JtFlpjNwaPWoJjjqlhAak9O0f1CXroWRf3DGqGVjO6CRq8FGucbbVVLDOB9fBPPSomqs6zPgmr11bu6z/Zr7iiiW45MJFE2/+MbuLNGmuXt7q28xSXjN0xYrDgObyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822859; c=relaxed/simple;
	bh=pga0nwIInIYHT6h/lC6AisEpyFhl2DTt5O8CoOvgQD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj9dpR/vRPgvAr6WVJvpbJobKggKv4uH/jOopn6+JFLiWTliLi9VIvgeOT1d6alOQPG1g5rAZamgx8EJkU8r2W+Jhyqifm08UbvvRrzIV+DofcZe4Q4iwitwDdie5fXgxMbzvqOJa0kfjidGCDLZJgFGX25P42tWx2MUelQjazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtdRSAQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imOb58Vt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtdRSAQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imOb58Vt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZkDF2208731
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 01:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1EVhPscDl7ppUgS3ObH0c8/S
	ANPa07oJZissK0SnRo4=; b=OtdRSAQSnn5ks9g5mzd+1LRTi0D/e7c7gHpNFos6
	iHiydNQJC1IdzI1DWb3ceT2D88FsjGX8R8QRumthXqsCQIWW+QorpL410rNzgYVn
	wSKFqkS1h/gL+SiDF2Fj0ml1GGqpemyUdhjpqACuIvTk6+cfHbv+yj7L5lk24bHa
	lqS0N27YWy366V4seWteWZmH8vknJsUjX8tDq+3kAm9WztPkl9RVNf2H47+7zSCO
	uNce92GGsq+WwyqTqRbCgg6Qb/V3s7uNdXHvzgHYvUbCF1LN3Buo2vsmIQJNVdaM
	3EndaELKYRfpJ0PuCmR8YKJI3pzYsRsyHscFux0UdgMaGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng951x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 01:54:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso29257356d6.0
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 18:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822857; x=1777427657; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1EVhPscDl7ppUgS3ObH0c8/SANPa07oJZissK0SnRo4=;
        b=imOb58Vt0SEXd4DSt3ccN12cc8hfL38bhg7RHSMXq5VHB8LumAE+bAaiVvNJDG0NW1
         gENVR6gaiEVoklBmOesTuIp92UjR8HrABHBOYWQ9WuLByrcsny67jqKo9kQg9wCzi8yV
         0APuW42dClWkzd4bHC+tP1d4ZgQ+bli/lovRfm35iX0iBo3vppVjHnFfX8Z/7IGKtn3r
         efDUaElM/ucqwLh+pMnV98ishla2SI/yoEW9KkEhUf/yYRzvD1molVLKmJiXaVbToIKm
         gyAZQA6J7fURflHlwgqXo/2d7BU+sMrQxkr4ZSdhSPg+5QoD82Bu2usidkrNAuljz3BV
         hfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822857; x=1777427657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EVhPscDl7ppUgS3ObH0c8/SANPa07oJZissK0SnRo4=;
        b=gXiWB0GTUBbdpWcScTvFXQRRmOQ+99o0m+szwCFORtzOsByDzhvd79tj9uBsU4OaXs
         5pw5TYmKxYA582MVoFa3642EiPE8ls67QRii2NQ9F1ycHcYyf+wntue0Ktm5SPrUrygz
         SzEBB1tuL46kP11vP2aOvZiE+eM7nnRVYKtcvxTxkmzm9agJji2sJS6fkZcjGNjStRId
         fzohloBlIw5SK0nobne9e23ezDEyD23WuLnQbBEEoO2BdtYT0yFwQae8d9hXM/48UYyy
         QcA4SNc5EiKRsCVa+yVsp6PzLl1t92WRgs/p31lGw/YMxvxQ3+8r8s5Vj89fjncKRGVo
         ySVA==
X-Forwarded-Encrypted: i=1; AFNElJ9HkDkbaX0WYxNR8D7ezOSdfK2JSCEEvL+8abCDdO8igs544OZhRJPYOoOHK/29By1Zisbq@lists.linux.dev
X-Gm-Message-State: AOJu0YyyUl4HufSoKKOeE2t9WkNYJYtEpyekQP20PrHQbd8JqvXy2ADi
	VcbfIdWQKrPtvrpZDv2TmIG5RX4hOeaLkDSjdW2PPorv/QDj9yckWi5ThzSQqOs6QHJ4NM9Wrir
	ozMRhM/70BnCSkgYXRxbYBsi+P3ijcb2BuPcXxfjbkoo2cz6ATomReF46
X-Gm-Gg: AeBDievSS3O/mbCXw9oPpMQdqwaACOELmFB/DbnKkuuvPvVjV6DXACA1c20EwuPZ5vV
	zfYEEUcc0rRTm7mM9xmD4tniUiDjIVJOisqmT4BsSVOM0AKUfcQ8w89Gemk8ZZNDsWHk4IMPz94
	FYV+xPgwlKJ1/zw0NnbY6/7nYC0eXrDYrxcTeJI/3KUWN83KpL9WjDaCnyyNtgNW2OkO/NKiEpH
	v6D8MPr8CXomS4Nk6+mGP/4bPEVUVWyL5YairXJKyzu+1+kb9fbyd8sDcjXtvua0cGj5nSEIs8v
	SopdKuP6qDbQm/eirx9hXcWHqJw/YA3tK5d1DCLaxXqbXuNMv0+VWAiu4e9aCr7vpIJ2AYf+Lvk
	wV/Lpv6zDhnHvZlv+yh1RtzucrGiQSuYZFDV0obACHxQ6Fw3spwD41iriGkpD+y1xDhFRtMBPMW
	cwDP3gpbCk1RvqvXcvvph6ONOqLPy+m1cpTW/anMNZ2JwbLA==
X-Received: by 2002:a05:6214:5691:b0:89c:a2b2:8d3a with SMTP id 6a1803df08f44-8b027fd9b67mr378068696d6.4.1776822856533;
        Tue, 21 Apr 2026 18:54:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5691:b0:89c:a2b2:8d3a with SMTP id 6a1803df08f44-8b027fd9b67mr378068396d6.4.1776822856107;
        Tue, 21 Apr 2026 18:54:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm4049951e87.49.2026.04.21.18.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:54:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Message-ID: <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNiBTYWx0ZWRfX2uFRYgqfXc4X
 TNHRgWBzqFPYjKknKVZSzIabQ0l1st9zMd+XmOotfW6KrCM1QON6GrBFkveEBCp9XktN+S5rqmT
 dgVF8b68vrrudz6M7Ism1Ol2FzSOPFqzE4/aT+g57Xc8G+59JLPiqBF6RS9izXiZ6fVatwTuOtX
 FCVN1wKZln9z/mVbvmeQEU1nmYjgCavgFVI+d3SmgihVo+6gnKIJEwlWA1rLNlbsA0AFVkNWD9g
 EZQij5aVl4//LP0NF5MQgSRViBsioFecCrc2pvXVPtuVAp3t4nX8E0RQGcWDtDSAfF2XWUlsY+5
 aG0yZ9dpJcDthUBx9PTesNCvWbEulksq7BUtNA4eurgmqqDqyWzs7P3YN0roA+DYLGUIpOSq8oW
 TfMMP18dG7dg12Vp9MOCaD7B2ymKUsm+FjM4ZsFvZ5Q95Gaw3tHKFxFVmhx029+wk0nqAHcwyvH
 nXaMCZwAXQTm3tiwUzg==
X-Proofpoint-ORIG-GUID: sjf80ye4FFoSiKemBEXzGHvPCx43gQ_N
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e82a49 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=vNHeVWmE5UuQZPkiQX4A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: sjf80ye4FFoSiKemBEXzGHvPCx43gQ_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220016

On Mon, Apr 20, 2026 at 03:25:22PM -0700, Rob Clark wrote:
> Add a new PERFCNTR_CONFIG ioctl, serving two functions:
> 
> 1. Global counter collection (restricted to perfmon_capable()) using the
>    MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
>    contexts.  Only a single global counter stream is allowed at a time.
> 2. Reserve counters for local counter collection.  Local counter
>    collection is local to a cmdstream (GEM_SUBMIT), and as such is
>    allowed in all processes without additional privileges.
> 
> The kernel enforces that counters assigned for global counter collection
> do not conflict with counters reserved for local counter collection, and
> visa versa.  Since local counter collection is scoped to a single cmd-
> stream, multiple UMD processes can overlap in their reserved counters.
> But cannot conflict with global counter usage.
> 
> In the case of local counter collection, the UMD is still responsible
> for programming the corresponding SELect registers, and sampling the
> counter values, from it's cmdstream.  But by performing the reservation
> step, the UMD protects itself from the kernel trying to use the same
> SEL/counter regs for global counter collection.
> 
> For global counter collection, the kernel programs SEL regs, and sets up
> a timer for counter sampling.  Userspace reads out the sampled values
> from the returned perfcntr stream fd.  Releasing the global perfcntr
> stream is simply a matter of close()ing the fd.
> 
> Since the counter sampling is done in the kernel, this prepares us for
> not having to disable IFPC while global counter sampling is active.  But
> wiring this up will come in a later patch.
> 
> The mesa side of this is at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Rob Clark (13):
>   drm/msm: Remove obsolete perf infrastructure
>   drm/msm/adreno: Sync registers from mesa
>   drm/msm/registers: Sync gen_header.py from mesa
>   drm/msm/registers: Add perfcntr json
>   drm/msm: Allow CAP_PERFMON for setting SYSPROF
>   drm/msm: Add a6xx+ perfcntr tables
>   drm/msm: Add sysprof accessors
>   drm/msm/a6xx: Add yield & flush helper
>   drm/msm: Add per-context perfcntr state
>   drm/msm: Add basic perfcntr infrastructure
>   drm/msm/a6xx+: Add support to configure perfcntrs
>   drm/msm/a8xx: Add perfcntr flush sequence
>   drm/msm: Add PERFCNTR_CONFIG ioctl
> 
The series doesn't apply to linux-next. Please switch to b4 and use b4
--edit-deps to specify dependencies.

-- 
With best wishes
Dmitry
