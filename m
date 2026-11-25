Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608105;
	b=Jl+vBPKAWc+PkW++Ocs2qDLAKu9/8t2Nf7t6WBucXTY/dFn9qH0H1rQ5MzXPOwVFxFzv
	 TK9n92Fzzsbs8tJR9g+1mLcta71zfQ1yAnvTA9oyhonoauUceX4T9NH8krhSK8/9or6sn
	 onaAr+Q2UTPboP3Sr5oDk9aH0PcQu3lm5i5gM86OFUJbYw/UrF+hdI9GhPadu3rM0+bRy
	 GcapNRVpJMXgmATyMj3YOV1KOeQqhwADkR6pMIRncpw3Iaxkj9ZN7PFc9MDE47wwuPnN6
	 83lkvCbzQ4nxSsIFO++FadFe2uo8XTfqB92mPxNLBdH0eYkJhwsJFHr6vyPvyBb9djg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
	b=Ie6BU5HI3dF6/BKiOgJlv51rh+1qbmYDl9J/s599eLjTuzRk+y/IGwhi+QdJ60WexVmV
	 ilOHtiNxgOG2GIhsVvb6HHoPeqJ3o2QPOP0/fCdavVb2oyvxlOi57JsnEGcoh2BOcu8C+
	 cbBA3Cd8OD7gb/cwFAsD15p0kmL1B3ONivrtHT8TOE+A4ZH5EtJ4DwsU3nvmmWAFDOdoR
	 +AD59b8+amTEmuC36P2bme6OO2n7wChC3cd19sd7FVlE9UfjD77M6OgoYIE32ZXJVpMfm
	 Kdb3m4Xp+uA97I6GVaukU4djIR3+zkgDVZGMFfVX24NsOFzTZ35vkDHGfdmdIJrLfXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hf83Zh4u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FA606A31E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ivfm1BHV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hf83Zh4u
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mi153642223
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=; b=Ivfm1BHVPxURJ6yV
	Orc5orEenCkxgRcTQcovJR3CPHAujhR+fg5bRYSrk5NgPFw+fhoUN+ZHlSiaGUeV
	PbGqgQG9CacghHgQ3AY2HAx4jS2sFs/o3/NRnn8AU4+l8bx99T0O9l+yYvE8Ltka
	c3k7Nun3bxfcCbP4lq8Ycly/Yd86R6L++NcYjphAfZG+eXUTKPQAvHirrAw2WktJ
	ByKG5ViYXYzxp3j4h6bVSQ8VQDjUXiikOCGyf07M+a1LfRGcdYFu24K8l9WYy4jJ
	OfIc2cYsS1WRLCKW2dzt1DBFTZBDp9gUrnEcT6bFObMUXr17ss9oP9gB0pT45h0S
	8vxELA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aqeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:01:14 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c416b236so85062937b3.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 04:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608074; x=1796212874; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=Hf83Zh4umE0/F9f6n+I3IMHE8M+3RkEKNLlBdKO7pLc7O+m7IyqnixQHkZb+4wcYO8
         mVjJz8EVUohqiUTnpxFDbOL6/oyh4vMDBBZpY3OjhR12RDipa7kId5Q4tLWGCNZ1iWhL
         fsOiCZ5n1usjojqVuRLoW0Fgb10Pp5mpGMz9J5j9rjVMTID241/lxx7Pxyb1VBOM6W8p
         7hpmuAU4vpKHpzQUdbb+LrGVF+h0fF2vE3hcxg9Y5YYgCDuj6wAZg8tVCOEnse2enCWG
         8QV8mQICIDruWWtmcfkNxvlu/cdHw5reAFrM+xyTehG/KnJ1Jrb9MzWriGp26rzD535T
         G1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608074; x=1796212874;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A52KNemyd1lh3piMmkcLWrwLaiXp9XsA8b/MHTMptd4=;
        b=JqijiMn9gyI610VM1CvmRNFSCtuN6qNIncePFjjNOGIFQpeRJwbkctXi3duijV7woF
         Ma+ksaaN7RkjXiHvOsMVyzt/YIdZdMMylb0pWWZTCI4xOURZBcR5BdETK1SBgL8SJ5Hc
         B1IOX8ziCudFrZV18pFJw2+hsJTi8DXxOXU4O81XrD31y5+3Y+FgUQPkIQZqkh0t1AWC
         8rtGlC/tQz+mCdWXJrkqEAQUGkH79qR9ppvc5xf5rWy9soBqlogUwW08vQlGdgYI4pzV
         ErlAKjzeu8RTIkET5KnWPnMDL1r+Wq+SfK/V0oMbG4PkqVQxqM6Y0m3eMmTHmcLJ11U1
         VsYw==
X-Forwarded-Encrypted: i=1; AL+hErFhC8Y3QlOUaDolgB3LmF+vWp9Lsal0FE7znmrNTN38DCSapXouwNtFPIzii3IU6j9nQYtA@lists.linux.dev
X-Gm-Message-State: APuU4Z/iokgRHPEMM5at4MSLzGlBtySdEu7x7N8fmdY5dr74fXJLMneU
	Ojm7tOfPWXSadPsaa+FmgVK+lJ2IivmS2evYOYWFvVvst7Eh72AjlU+0AeIZk90KGiptjcat8mF
	d23Msp9i5VbrmmqXOVscH0MjTIQ0x288lryfoQEMlQCFBMHAeQ7/b0ige
X-Gm-Gg: AZFdTZd0hVd4F+Nk9HJUUI9O0CJnyAJRUhykgw1eISDRQJtutRDjy5t1yg3tN8cEi0o
	brCRZWjfgwTBsoj7gskbTSeurJ4LBONgeCnNUQ8F/PTrGAp+jP1JFHTTXa8F0eSfAEyxMuLOaXS
	Np/I5CGJ5Y1t8YWH6xe0h3i17YRGTvlDUBw/pS8EQ/M9vRWMl0EVytut9Cavxv47KN+brgGLdIO
	9aCgd5Xdi9FIW9e/Dg3cdZIqEVgAycXw/KwyWmKFsOtYcUc+20PRRtVcl/qmMpq6hJbjnaAjiui
	QTC7r7yZ9m1ZUfIBVSdVJ9EFC9vzEf7T4sicSzE0xXK3slqCB60iOVc0ez86F/VeY3Np6YOina7
	gK1iCzVyxOsTLyE0xW+FohGwQ5xf0WgHm9U1hbwjfhbnPOalg5BHYnE4kkNTrOHo+IzrrwO9+ar
	g3VBpdMX9zaQ==
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr60654427b3.59.1795608073458;
        Wed, 25 Nov 2026 04:01:13 -0800 (PST)
X-Received: by 2002:a05:690c:4d02:b0:8b0:97f5:a858 with SMTP id 00721157ae682-8b520500410mr60653907b3.59.1795608072387;
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm72480227b3.31.2026.11.25.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:01:12 -0800 (PST)
Date: Wed, 25 Nov 2026 07:01:06 -0500
Message-ID: <0daf9fd673e2e4e148a8205c752763c0.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Ian Rogers <irogers@google.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
In-Reply-To: <20261119171046.1536673-1-irogers@google.com>
References: <20261119171046.1536673-1-irogers@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06ce0a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1XWaLZrsAAAA:8 a=Grc5UNRC2ANbGX2BYm4A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: YVwvj7M0GWBiL7E9UhiFy97kjNLJyPd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX+XTAd6zSlMsX
 QHnHIkil+4prBR2HfbN0a2BPqYpw6MEQzCX1jC9K9qQSmVTW4ug58w0GNI4fB8UpJRkS7y+T/YV
 YGRv5ID0d2cpTYH2lIKDuC3clDEq0bVAvXnqmo6rzegRsSbcwjbWKLnmjq3Iw7gBzSE8LeeWbOx
 2L0vGs3674A4vez1/XaUNSG2RaV2BXuXa31sjp3nbdw30ZV0IfOxpVVgr2NFxsc2m4jn4VEKHka
 2PTPyeR/NyM30I7N94xWwFAuuGn6GUcOXa/KtxLH5umbx+5rnHrACzKrqfYcrqWFFmNVUYhM8eO
 7oK+dEjocXsDmeeuwzubR6odyCwtmzO6QcbK4tcUmMHRUc9eHpHHloWVypXv5hQXwbvzpp9xjbj
 qmx/im9v69goGHikZLrvabW/n4gcUYj/3D0YFYaYxE49wggEQdPR1ZVsrqpP2MHGGr3gvCJ9wd1
 Wai7QrFIF9d7ER9AB3A==
X-Proofpoint-ORIG-GUID: YVwvj7M0GWBiL7E9UhiFy97kjNLJyPd1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX5HsIOFVl/AWX
 nbIIxxagI6ZFYkGTgUSbNAFHIQhDBFqcw9KLL8+XhWvGj+7NYQIcygJXRHnoQraDJ+uNc9ZJPbU
 EE6/ilimMWC1AQZUFTzR2DhCP6VBPe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250047

Hi Ian,

On Thu, 19 Nov 2026 09:10:46 -0800, Ian Rogers wrote:
> msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
> return type enum drm_mode_status, but return -EINVAL (-22) when dp,
> dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
> clock is validated and pruned, passing -22 to
> drm_get_mode_status_name() computes a negative array index and fires
> WARN_ON().

Thanks for the patch. At this moment, both checks are dead code:
drm_mode_validate_basic() rejects clock == 0 before any bridge
.mode_valid() runs, and dp and dp->connector are set up before a
mode can be validated.

>
> Return MODE_BAD instead of -EINVAL in both callbacks.
>
> Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
> Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
> with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
> Qualcomm Snapdragon DP/eDP hardware.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c0c150e2c575..51649b584573 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

msm_dp_display_mode_valid() is a helper shared across files. None of
the three conditions can be true today, but it may get more callers
in the future, so keeping the check there looks fine to me.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;

Why not MODE_ERROR? It matches "invalid params" better.

>  	}
>
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index c1e4147bfef1..dd4e8426cfe0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,

This one is a static bridge callback.

>
>  	if (!dp || !mode_pclk_khz || !dp->connector) {

As explained above, none of the three conditions can be true here.
It is dead code.

>  		DRM_ERROR("invalid params\n");
> -		return -EINVAL;
> +		return MODE_BAD;
>  	}

My suggestion is to drop the entire if() check block.

BR,
Guodong

>
>  	if (msm_dp_wide_bus_available(dp))
> -- 
> 2.56.1.708.g77570a6a1d-goog
