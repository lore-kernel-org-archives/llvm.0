Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC115358D0E
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949597; cv=none; b=RW0kRgWZ+zVJ1xAco8nfv1HDuENbJ9Wl2vsTil3bUwb9s4mj8XC1kzSLTbSYcJwudU4KF6GV3yGF8gMdI2EYDnpaK2tKV4/laRLZFiGDwGVst6PiOJcZjkm4FesSbzAQyjiToWV95fi3eYVDK2HouvGwODoHHhRkMbimV/86HSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949597; c=relaxed/simple;
	bh=fWqgP7eSi1KUIjxhrWcDi21Hb4l2pDe5rmdIVAWgWPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFcZMZAgoXznWa+fWr/98wybVw7JsaspU3Me0e/U6hYt44XBP82nTUggHPXsu6CvVpPLCb3l8vqOpf6/+jJqSd6Eh6BBxULA7kOHAG3WMyThL4BLmZUmOmg9g6ZyY5Vcq1tv1BF0qTntmvIz20mHgo5y/cVBiXvb43l8VO6PvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxQnQQuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnMis/Bs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxQnQQuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnMis/Bs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095tM4S3019527
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 09:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=; b=MxQnQQuoXitKlChq
	l6q7BSifxiV8rH5QEvjeFOrhempCtgTZ+u7ooGB/UhvHfgEfbqxdC6yxub6E8Or0
	yVjrRcxF+ffMhmOKd4z+ERj0g0kpPitgJGPsk4mgbqKegMyM1uZaCrGjOsEUhx9k
	KhAfUKLGpS94BXJzfEpLTJErc9b/8oNC+3uGpoysoODh+lj/154yHOSRdmZsfHx2
	iHCPpriFcXjxgVFZR3/vaaYFbcAAJ35tWqMWLuvQR8itwMbWK1O/lxxHrM2EvN1M
	8CwtGZq9JJp9N4yrgFwZsRcEj3zLAZpE1aNmEC2ah5L7RqMez9ND+vsQHRjh7o4B
	LSb6iA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3j2j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b5ff26d6a9so79207985a.0
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949593; x=1768554393; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
        b=cnMis/BsUfUpYSeo34bfaHZNIkPG5cCPlQlHlfJpzPdxBgaOc5zNddsHDXzhBOqg1S
         41pJsdPt5pp7AOmX6PYnYbTL4d9VUSnbNVRWQJvcjxKFWjX9/ppMgDOjd2UACnQ0x8sH
         RS6t5ho6ofqhHUnWivwlyFoOPx4tNjBOG7GTwFAFTlbRrXpc7K6qqsE2HuFU7CsezzlS
         b/2EAkreS2Ut4lWa8RE5pB+10Onu3HVofp2dzNMBr90HS4t4zg0myiUx9wkWkztyjjL+
         re6P10dHxC+Xnjsf2DL+L0hb3WveBjt1wJ0fFMFd8NlJ1zQWI+gXDACxKRUvDJVv6tdk
         p1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949593; x=1768554393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
        b=Y5QGzsHF43H9XVlW135fwuWc1SxflYcaIHC+NsPQM74hrwHBTA1IcG2q8xq3j55TX+
         noBXyDK+bdMTEUYUBDZ0yGbtCaNyJLSZDP854jJdjjn7QFOaU5Z00kkGHaj6zosQMuoa
         t3vF+mZ/8KK7jPieNt+sxTLqnqn46uRxHqXzNdqiHDZBkzMKArIfcBa8fNZYjWU0cvRF
         813PKBLemdoO/1hlRTJo+FjXyXjbhNRHZffB/5+7qCldXVO2H0n02HSDX/wDSj2BUOLL
         xZ99iRs/RKA/xNczOSumcXPutKWJ14tkFqYBCEOTCOEFPOyx03KYcURzx0q1HzZ1g2fp
         oNLg==
X-Forwarded-Encrypted: i=1; AJvYcCW9WXCLuVL6i2hg3rW9RPXewmBtGpWwCeGSp9BevKrCYpUi4mTYx3+DugFuFKjfxIhpnL/y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Vj7pHKH5l3MdgqzUjMBmJ6sFkTZeawzw9By4TRijs+yoligd
	DfTsPdAF1ofDNkcBKTCPXTvDUYHJwIQDRiQsRX9+/BaBLBKi0KFTJ60ziTbesiUbaDpQPBG2yDH
	aCc8w5evdMNSzq+QFkq4Br4rM37/q/2ohMCuNGpXyvAeRbtv+ewI3NAqq
X-Gm-Gg: AY/fxX68i9y1Pte1k64RGyBiLXSxnnQ0eL3b3NsHlCc7GVsoTovehVH9J6GpDrqvlG6
	EuUK4WL0sGGCpeXNylCUWd8JGYUVQtElqHagQtnG6SP9UR46l3fwvfBca7Fs8S0Jkj9zX/NoHBB
	ZgxCKAUBxL32/9YX9HUb/bGtFfrSgedyBknd9z85Um3fgQ1q2y0cKbNr/zLpfQ3n1bJEb7F6RQ5
	HZBSVQ/QJbuETObBBQ1OtfdCPM+sLMO2/er4bNld+pLHl3IKnXmJ9l9C0h0sblwtHvaB0Xsl4Yb
	Cc9dOCk3TNOxlKKQbBLy0Hj0GrowFzcZj8CWg/4aH6YwIN8Yn8B5hoGNZ63QRFMsl2BMd0AWpHI
	bWmtBKsMdiF5NCSXHrHC7b6LjfLawFKQX8+9cHJANEaND85Vm8d4qdPZ3p3xShsBB0bQ=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr885987085a.10.1767949593057;
        Fri, 09 Jan 2026 01:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNhlqG1qVA0WeSBPAv41iXJojsZ0EgDiNOaWVzG9AckeDmRxc+YXyNI/94n7ZKvJNWAxmdPQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr885984385a.10.1767949592559;
        Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4479sm9806221a12.1.2026.01.09.01.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Message-ID: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:06:29 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ehb-2XkYxYFk1T6CDs2qGmCfMcC4XrEy
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960c51a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=xIqhFIF2P0JOsuq1WLcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ehb-2XkYxYFk1T6CDs2qGmCfMcC4XrEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfXwzjM9GEV+oUh
 zAEflDFP1ZCLvgaWYAi5hcrJSzv7chBgbs+OtdNufqqZaPPaIedPwVqT/2VDw0bZapcOVgrJAOt
 mjMoMlonr2/xyTjiZ++MLs1lz6oMAhpxQzLkAI11UjE4UhGPTMArNhDHPwQKp6XBzPEPP6hndwF
 tmCHELqLFcG1AYu+fsxrMMHEZhVxiy54B+HcqztrdqBm6Jrjp7TyFG9hB6PpCWzETSXUxqDx3re
 qg38ubQXGskyXdydMk6MM6IPQv3889DjTtYIn8csQ6qfiYa5MehWR9xDeXNpr1DJPwkZ/xv7iyA
 PN+QLi9xsdAfvph05Xuegt7NzkoUPPzc24fORE/46I1vU/737VZvI5S8WXygHH+lFhD9CtBpNB4
 mDfC8bJRgSsDqBYTUCyaMEyLwKuoniIU4/x7TMIY1snY0a9APNCRQsZY5+fzcuSL7hGD0SGBn6I
 KKXuvmy2qHkZVrQONtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064

On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> Change pixel_div to one to make the division well defined in the
> presence of an unsupported rate, relying on the DRM_ERROR print to
> indicate the error to the user.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cbcc7c2f0ffc..e4731c059ed8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  			       bool is_ycbcr_420)
>  {
>  	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
>  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
> 
> ---
> base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Dmitry, would it be beneficial to throw an actual error when the rate is
is mangled? i.e.

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..4f710b8e6bc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
        return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-                              u32 rate, u32 stream_rate_khz,
-                              bool is_ycbcr_420)
+static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+                                 u32 rate, u32 stream_rate_khz,
+                                 bool is_ycbcr_420)
 {
        u32 pixel_m, pixel_n;
        u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        u32 const link_rate_hbr3 = 810000;
        unsigned long den, num;
 
-       if (rate == link_rate_hbr3)
+       switch (rate) {
+       case link_rate_hbr3:
                pixel_div = 6;
-       else if (rate == 162000 || rate == 270000)
-               pixel_div = 2;
-       else if (rate == link_rate_hbr2)
+               break;
+       case link_rate_hbr2:
                pixel_div = 4;
-       else
+               break;
+       case 270000:
+       case 162000:
+               pixel_div = 2;
+               break;
+       default:
                DRM_ERROR("Invalid pixel mux divider\n");
+               return -EINVAL;
+       }
 
        dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+
+       return 0;
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
        msm_dp_ctrl_configure_source_params(ctrl);
 
-       msm_dp_ctrl_config_msa(ctrl,
-               ctrl->link->link_params.rate,
-               pixel_rate_orig,
-               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
+                                    pixel_rate_orig,
+                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       if (ret)
+               return ret;
 
        msm_dp_panel_clear_dsc_dto(ctrl->panel);
 


Konrad
