Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0C305064
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829186; cv=none; b=VBCdZ55J+W8guNjEPW9g31bOW7a3LpqWGuqaQnc7ui5v6sYPuaabeTty1hcYkiIJcbGwf2gmLKwr+jMI8x3b01FWbPQzNWVDHS0KUmvzW5rzJt5de4Vj0L0sSpWnliJvlTAnW5yawt3fXl1nCz8UNyzMfUFAPs5NtU/csZw5A5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829186; c=relaxed/simple;
	bh=Keh27owh9hIsMPXCAo4PsupivGcK8csVAuaBMjckgEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyKK2unnX24ck0CCr6fAJ8G+7mfyfvuV+tdzxK6h1xcDF2m2cW58YFBfclKRvCbgFenEL/YYhTPvX+g6h2OhUY6FDF0+nE67k+2v1rjpqJH/Oa1tB9peKbsLlqXk2olVOybJCt+4SzAIsKWArWZYFGOGHZMq/FoNU/6ZsTf523c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVvrjGa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8L9LrkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVvrjGa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8L9LrkE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIaLU12936186
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lf3oiZ9B7GXrBV8eOzokgu9O
	Y13K6aIvRgDfejReTdE=; b=eVvrjGa8HRbuOefO9y5ezfo9E6s0WptDN3K/ccx8
	gUQ5135DiCuY/FrKBZYOuwDfxi0uJm0pHjN3/DS66asCfxi+lAoGOkb3MB6AY1f8
	K9io/1LnbGXPz5k09d667DRjF9INxZa+d0Rb7nRwkcvkm+7ZCFBUiYGMhLyQuKOG
	uJ3UBiY7hqbKli+Dx4dIxKphcjKXCJfEJLJlTyOhPmgk/YAPtBD+bwnPB5LlORiZ
	WKs0a/CWptOo9roGgSgyo0iVvrgSg1vLP3EqszkaAe5OEdY/q6ucIw66951PRCjU
	QlE3t41945Lo4ZV6Y3SQM67UudAmtVgVTSK7s0zGoJNNdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenk9fhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:39:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so94334831cf.3
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776829184; x=1777433984; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf3oiZ9B7GXrBV8eOzokgu9OY13K6aIvRgDfejReTdE=;
        b=Z8L9LrkETw5VOjqvr0LI5lSPvSk5lybCvsC01BId4oWVUomytnKdIQeXnaOumAU70T
         HVMEXI6hzMtw8oL2r1lXj7s1Ef75u/4tVjWRAdriTEljLWvFl/cDO0aZzZvPqiZoXlh8
         e7gXnFJWAwFAsFPSY1XGglk5xeUux9FRN4Pl3p5EEoYgX4MAK14Vb6WdyKjO2PwnneyI
         rhVPcacosTh56ruusDmalRbuPPaji/uaSTEdBQ+x4etvs0s07r3J1ayH7WEXQRqXfAy8
         qAC9Qy7MzkVJEaLIrQ2Q0pJyMTjbd31dZeyg6O4X8SsQOEM1YxzRJuBzyvInsgXaFnpw
         susA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829184; x=1777433984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf3oiZ9B7GXrBV8eOzokgu9OY13K6aIvRgDfejReTdE=;
        b=TG6iUUQNIvA4ti5btVsLf0s+LyTieQBnGhwZ+V7+z7rCJU8451JeywQ2TIZ2LTXUMS
         5Ay6JV7HXvEZzwBUOlfCY63Wi1UqXEiZ8j0ukqe9O3S7LfggBpwjyqOjQoBlVaWgtmpZ
         44pqioQYrZYtU51vWMQ6HHqIiZZYBlpSNitNcSf+yDcrRfG+ySa480cABFGmTQFIunmc
         9UBOj6m1hSF2A0tJpCdO/PwRnuwIajeSe5lrL8bobmV3XmZfjEAoFbo7O12XokuJKZwD
         Q6Wj6nusZLFlzqzGH1zjnk2VMBN7d3d1fhj6CwFxkAqh4UM7WOcQtIdq/Kb1DVRg8Grd
         vLhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zZteFAyx1c8neA4Y8YRCvdOfIhjt8A7MCSISsjdP2Ph5UelrRBeL6Jjb2bMb0vjuv/PGf@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4foqx4Z7cEYW0ZWBH7gyjmt++iSbRRHBSRnWblpN6GZ7orYM5
	MkyzAVn9HnNqZsgJjXquVziHJKaJVMJCdv8h/YAh+QpN/FQ2OsNNwcjvOy6Y8MFiEcVYvmWhBOA
	ccdHr23MuYu1EcF9nQUVR6yASmWOIQ+4r4qerN7vqOiIvgqO2hkHUCMGk
X-Gm-Gg: AeBDieubeiviqsSVXAZgzAALqY3h/Atie5F8CgB8UDypLh4Sp5s6s1DWIYurtSjqsD6
	6IPqNVuXVDcxqQr9+WFcOE8vq8B1Hl3s7hYUPWtbAN0ZtH3QAA5u0GAS6YM3trx0+Zqj3aCo/fZ
	tpQMngDZqAI+3d1yJCfEMqXB22cwsVyS4FgyNfj032B3s/6WKnLqphMNUr1v63qwSDwSRZc2ew+
	8TaDQwrEER8GUEx3jv2IbTgjf4+9tb6Qlq85+dI/Y664GMhhSLnS8JL50/hLEpN6Kjre3ZzDOvJ
	cOHlI+VRtPvkF5bwHBQNKIUb+PKIElYWkWQn0DpuK9FLUOeFJrMfkeUA8x8FZGJbHD50QEmdI6n
	51kNCaUOASvg4C4MgOnH64cFU+WpJqS7izhTQx9ngXme/SZqiegeuMjkzdw6e5mmztYnQmWVieP
	q88akE0USmsB6jctlP+6DxlzpJBK96i2dhj2hR8w9+/s5G4Q==
X-Received: by 2002:a05:622a:544f:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50e36821b69mr311781351cf.11.1776829183902;
        Tue, 21 Apr 2026 20:39:43 -0700 (PDT)
X-Received: by 2002:a05:622a:544f:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50e36821b69mr311780971cf.11.1776829183482;
        Tue, 21 Apr 2026 20:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebea2sm4028793e87.76.2026.04.21.20.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 20:39:42 -0700 (PDT)
Date: Wed, 22 Apr 2026 06:39:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH 03/13] drm/msm/registers: Sync gen_header.py from mesa
Message-ID: <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: ZTP9iF9ZZ5KU6fTEvtox8fhUspqhRoNq
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e84300 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=9RIi00WSWFsP0q8pkWIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ZTP9iF9ZZ5KU6fTEvtox8fhUspqhRoNq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAzNCBTYWx0ZWRfX4nwdSfYUlzrO
 Ssg9Ert+5a/hytECyT9GVKICNebrQwdol9RVF3Xw5dDHs9vjRmU9xOBCAYgReF1OaeXhAjASoF7
 0wiJM+u51SIB2ojj7TK2qK+XtHUvR6QlEwKE+UFfvYurq45PcA9zkZjBQcWY90Ni+jSx1eTZvbE
 I9DMRLMVYyGyIkcxpHi4VACGqNY8kSi8qpAK1ZBpBdorOaieJ+9Ut62zsDxXTMrc2qvTLYQO+jm
 D3qS3EcZaz/SMDff2IEpuwQiBvwlBVLVabpBnYySClizB/8ekKRUxkx6CORYEVyUAUHv8ZPE9+W
 723K/zwjyNS1rinW8nkVatmfFX1/L0U/lIt4EX0P0xDPbZy7uxHeJpmzQNGWtqUFo2CSmhW56y+
 c3GEHc3mDiM1dBli+qDJteHZEz3wJvz1oIv8FOqwPJzTuxpuJk/hVXfNh7dgk0TV9vYkT6zM9sz
 ZWdCF9TVUnNdOrLeXIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220034

On Mon, Apr 20, 2026 at 03:25:25PM -0700, Rob Clark wrote:
> Update gen_header.py to bring in support for generating perfcntr tables.
> 
> Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 2079 ++++++++++---------
>  1 file changed, 1146 insertions(+), 933 deletions(-)
> 

Syncing with the MR is not so nice, it's a moving target, but I assume
we don't have a choice...

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
