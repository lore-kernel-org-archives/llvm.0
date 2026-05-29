Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DD3B7751
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056439; cv=none; b=V6XgKtdRyP/016L/wtwmFDTrxBO27FGiyhEjcWzx3C6sgILjXQXPtUe9Q5l8Ilscvzkk6go6jBSuLliTN8xXIDMBYjNue3ZkkX4UQiPh6DSPm2XGxbqAOlf891ziKPAJAKtBbGywBunuj1TcboQF2VZ3ZTvsC/vgceTdkIJHrXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056439; c=relaxed/simple;
	bh=huXbw8E6rXipPcgfI/oulq5BpMxyZJTGhVrRVLWkCV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0lQHH6h3HWbuf8MYQrYW7cSbfi8pmxW5ch1ooU4ojOJzTd1ke8Gr9LNmRDKtBoznvVvHbOQOL51KVsKNwSZ/OfP/9/retpPtrHr9jn6qrrOfLVPCRTRsNr8b94cKsT3PNvywTUUThxOgHx6bWCVe+xFGa0JhYoEXka1e2+71Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzxTSQNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibxNMEJJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzxTSQNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibxNMEJJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TAKrvh4194208
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w5W401i4KtUyBJU1xtt1ZS7P
	g3gpytfeIc6F79YZRj0=; b=IzxTSQNNRau6wTm6QjwiEcWEYWcwDUJIIOcyZDH4
	+75yNC/IEgXGrtKHTWA3JeifFlGq0izbvlwr15ZZ4YEWqSV4wqB86zL4mGAzwu+X
	JowRHucgpM493ZTCE1wWEhzdlls8AmcqjTzIrpsSo1LqotH+C+eE61ogK3fam6uF
	tmqlQsyoYH/PC5xTZE94VD8HOoAVK8qVv+1lGvgWpi74+7kxvaJs6GaTb3qzsfbT
	mOeJDpivXjKjjln/FR6FycAKLC0qh5OppYeur/bbFIoPsephGJb8soTtTvSDP/r0
	AHlYlg+ULj7289fykoKOJP7I1OAsY4p5wAfo9YMWH/pN3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te1t9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 12:07:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-58700e12faeso10820866e0c.2
        for <llvm@lists.linux.dev>; Fri, 29 May 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780056436; x=1780661236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5W401i4KtUyBJU1xtt1ZS7Pg3gpytfeIc6F79YZRj0=;
        b=ibxNMEJJ0VdjpaTTwBY+6Ixv5/cyonvfyFwkui3Kk9+q0G3tstdLu22qvBmItbKRWn
         E6gPUT0Z9GZapl/mXyjhoRQ8UgHEFmqfPVwgSbPsyNTPe2oa/AoZ7kYtpRaL/LwRueur
         uieJC55MbD+aJqF3wLKJrAOixqVz5CleHbjWCIude0gySVsse2psVSNYo6jPf/jaxZ8i
         ljpKTe8eeh0c1RhfbAqDWPW1UWdfTIaJGvyf5add7cZRxf+nbd6oUjU2w1v7T44bObBw
         73CBHp6I0tULqk0/8WPTkvzK1e9BEWFjefzEOdQ6BxlP8yUjOjvxH2KqozlkFspn1WVc
         kS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056436; x=1780661236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5W401i4KtUyBJU1xtt1ZS7Pg3gpytfeIc6F79YZRj0=;
        b=aE53D5CPj+OPw+9syffrxUSh38Wzy+NgHOYDoCQK3Ni92WA1LYPyf8CujXqev7e9KX
         cN3ztScf1x8OyqZG7yjttg16biZI12d4n9/Pj2kpSQVWUi0Iw/F48Up06J9UYQZlVn4i
         SVTE3N5kGrMFtDX6qW/ivw6JkhWgosuPoATHVhDMePJ9uZIWtQcfEMBVdKendiUYuBLz
         96CWX9lm4BvNJCDJw2Y/CiyngtRClIHM05rMU2k7kq4ax9RQ3pR19Ux3J25zfRXo9twy
         DpZph71QkSgKpHTRMf4lqgX5GffpWZWicnnar5x7hrCUbYy8aMxrUqsUM6fxxILB5uY5
         WO4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4VZsOzcpKEfwEr1tBKemuBopd6pUUtRSv/5oaIxmkzUrpFC3wxXwVMGmiVmouhViBehX/@lists.linux.dev
X-Gm-Message-State: AOJu0YxDOWI8qJvIhuBs8fNJS2c8t6FH9NvI1rjkJ3SHwLFRiPKAkHt3
	DAbmHZLlTSmr9epXeJsdRnKWuJZ+FyMaSyneEDOgOf6LwznYtw8dNdFfBQf85L0PMG7vPuREtgd
	t4Z9z6xoeaQ8bv6MTv7fZ/6z1hN0G89MP3tFOh6sipOHCJ56YoooiX7f7
X-Gm-Gg: Acq92OEU8iM2xkUYCSUGAlsz2nzpXs7JAwlDM2+UsRJyCOwxxUXD3C90h+Y0IY1M3ng
	OR5OU9ZiUin1JG3y+HVJ17RN9ybtM+hlY6qi2lMoCWfjqVu8ue6qveADh8/uLw0oWIZWsTwIEIH
	2BUZ2JZk1LYpgRl95HqSBCzYQUgEWtMnx9sZ7atlOPd/vg3nGnBOvnulQp2WtzqR6g/n73R+9zd
	eN1THw81fci7t3jGbF11rJ+CJFW+s3PqnJKp0zV5zmmFzbGf8gu1GGCrHMJlOSmGE9TiYehjFtw
	YRcLOk7aNxkVSeM6BTUPDwP/FGAeMO62PKgxqI2Zk34QMtq9yYCD+OSDp5bYo80i4PMBxETHMuf
	btm/d+jxfLhEQEDUCWR2mtB0jlLxUEPmWdg14nGDtF4640Drm8GvDTQzEHPdgZ1vFbRJQGiWCkI
	n5Z641tNH/VD9BEC33l8VTJzRKgljXz+7uUPv8mwRzy0WBjA==
X-Received: by 2002:a05:6122:378d:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-599f6cb1402mr838129e0c.7.1780056436461;
        Fri, 29 May 2026 05:07:16 -0700 (PDT)
X-Received: by 2002:a05:6122:378d:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-599f6cb1402mr838086e0c.7.1780056436015;
        Fri, 29 May 2026 05:07:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596664sm235308e87.39.2026.05.29.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:07:14 -0700 (PDT)
Date: Fri, 29 May 2026 15:07:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel J Blueman <daniel@quora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Restore second parameter name in purge() and
 evict()
Message-ID: <6l4aqnqhmhjg35ofoofu4zkcfn5ua54wxy7vjnxnmhew5lspof@vmjkxlzb6vj5>
References: <20260518-drm-msm-fix-c23-extensions-v1-1-0833559418c7@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-drm-msm-fix-c23-extensions-v1-1-0833559418c7@kernel.org>
X-Proofpoint-ORIG-GUID: iiNanzk46P59Vgk2bgAFH-zvkYcXvWHe
X-Proofpoint-GUID: iiNanzk46P59Vgk2bgAFH-zvkYcXvWHe
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a198175 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ooG1LIPqdb8N2y3itNcA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyMSBTYWx0ZWRfX3VdIxvaFPIZi
 OffPkGTzkr1SwLxjeEvNt4jzZi8XcilwmzYiop1Iw01MTaLUMWmZqjTP1nSI0DzaiXRle5JYPIl
 LRIhySVMobXNS8zzAwbgruqCdg1DdSNpfaAZKVCGwFunmin0/E7q2GRcllHVuXQKy5+chGENzJP
 6sTwqYu7hFxWdAdU8rbiT44nzquxGGYLATooxXTr88cM4Y7tyf6nMLoB7e2w2VUNESAHd3qket2
 C7Y/CyEr1JDJ3Os1/5S+72j7ENMuoYV0nJre9gRVRu2DaDV/6RpSUckO3fnhYpPJQE1RYNw2yd/
 nhm+6QkF8ruVEONtR9n5gIOHWPMW5bm5X/GQ2tWL5dXsqvDDmj72O0pOxazNRusUH0W48n8OGFa
 udwx/H7wtZwc4FxFN8UWW9rOcRd0NDFHU7zTKnJQL3LIFZtRQZfYTqo/LXN3wFgjOtMBeERgpFc
 H2Gi8XtWfBO8ih9BMyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290121

On Mon, May 18, 2026 at 03:17:14PM -0700, Nathan Chancellor wrote:
> After commit 3392291fc509 ("drm/msm: Fix shrinker deadlock"), all
> supported versions of clang warn (or error with CONFIG_WERROR=y):
> 
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:105:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
>     105 | purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>         |                                                          ^
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:58: error: omitting the parameter name in a function definition is a C23 extension [-Werror,-Wc23-extensions]
>     117 | evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>         |                                                          ^
>   2 errors generated.
> 
> With older but supported versions of GCC, this is an unconditional hard error:
> 
>   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'purge':
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:105:35: error: parameter name omitted
>    purge(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/msm/msm_gem_shrinker.c: In function 'evict':
>   drivers/gpu/drm/msm/msm_gem_shrinker.c:117:35: error: parameter name omitted
>    evict(struct drm_gem_object *obj, struct ww_acquire_ctx *)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Restore the parameter name to clear up the warnings, renaming it
> "unused" to make it clear it is only needed to satisfy the prototype of
> drm_gem_lru_scan().
> 
> Cc: stable@vger.kernel.org
> Fixes: 3392291fc509 ("drm/msm: Fix shrinker deadlock")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
