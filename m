Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5839769F
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266669; cv=none; b=ScOrddA3AbR5KegrFajDMU0zbZFyW0eUNlk4MqyqZjw2wuVVFNiB1r+Y/4wdTEGxt7bRnklFNAePuuFI2WLMREMJx1OKlm0gS2UWUCwETvXXQSLm9CMS7JSNAnb2rQnhdDmjY2sftMuaGAYOPS402q3D6StNZvWCGYfLvLULKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266669; c=relaxed/simple;
	bh=kwusyPSRaeghFggmSL5j9ZLJSGRIAtKAx+X2q89jZh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u71h/vAw4YFjpU5EQssiODfPPHvP7Ni2hLvyAf1oCDYJGEkDlb27hV/Jb9j8CrnxVH8l/AUE3rPvDKnq+TY1sctWLp7f8I6/gSX5KNp98DOe0PeP8YduSEKwaCBCTWLCJ86DeGWfIOteLbyY9N5Mcp2pzEOMxG4yPD1uuX9eCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftvi2/nY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7iYY0Yi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftvi2/nY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7iYY0Yi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76lnA630202
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 08:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=; b=ftvi2/nY9bt9Rhg0
	sUrKexHu+roNChCbvpfL/S/roEhjHyEX+iWTS987bQ3bbD/TQfVNu6ynZykcuryz
	9FVjTrNqvaLocmY4U4fYJwkXfE1kDzvhDApkkjUtxHC2MmUR356e1D3wrETvqcp4
	ozB/gzfTkwDG6HvswN6aEdH1C2I21hwbaS3FgWKeAP+DT/+5RMotNFD8sEOxigAj
	QoQJ/YZRah2gHtyrzzTAJhz9/yI9DXwLHfF/vYqjrfl3Fvlkr3pAGbdcChtbxrUl
	u07fTREPlD3/8sMJQFqej1seoFWNhCIncbrpwhEkl1xBGEbNFu2LINEWATAeS+vO
	4Uz2nA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nuw35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 08:44:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so3913704a91.0
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266667; x=1779871467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=;
        b=V7iYY0Yi/DB/jdVbX5yq6JqEuEGfPUg/kp/8d//jn7MMuAGUers4AkVgOc6xX+nMtF
         CPnV5HSNRjIYGPqDnV6uzTyqvKqsUdBSvXA1C9NFP2E/3aGJCkfKSjUNZB7rS91iBP6u
         TQJpJdgCiV6qXU6XntDsTkfaHR66OeC1k2mbIdlO5dgwwNaPSYuIqdHdFnFluIAHLSyU
         nRkvQv2iaLfvLzN9oWaM1aZHZQrv8kj2jjYnVzok2e7Wqz8Ql/IO9YiyZJthmASTWaSx
         jPj5nAdRtZq+uLMU9SJT91pJ6hseumUOhKbPqYqCQp45denJpTgBLYPrWpHV9MI4CH/A
         tWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266667; x=1779871467;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=;
        b=FxfOKCkx52NluWOUEuO+OxILGQdyEi/yECjlfWQ4XyxBGuScsbfbmbOc6SCseVSIcP
         fDV1+VzEfFFsXiFKh6+dCKD2ptHViR11c67vN9/j4NnI4DwbJ/AbV4gArJVj9HkZDMqA
         SgC/VBLB/ObOXOTXNGP8r6dEwXwwyVJ162H06yVK5KwLTyrfuRvMv7BiohWUZZ624ZY+
         iGqLJt3AcODEGq7GvLyaDU3GLZuc3XbTZLQ8bCtQlu5CmQl98QINmQhXv/JggR5C0NHD
         6Z6TZ/IwwzT4RtU5cnU1kiKr/wXJcULB+Je4VP096WpPaQyS0c0rtU2h2wAxbdFw1R4A
         FgiA==
X-Forwarded-Encrypted: i=1; AFNElJ+edSBVZm/gG64PvcwmtB4SRbdq8Djkx78PUCYwgYhjMGQI2g661fBXRbopEBoFjuBzOccW@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+fu6NQ/1McgIuQvgmMeK4LBZfMGlQQD6zx7PofNwZEwL9KqG1
	Dlf10Q0z4cNxnL/gwFXeEfBVWhMBXTCJ2KWT5HUtdSWhgp/03IC/yFV7FzEl34SSg+zSCjhyw79
	9REYEP4fT98JZnl/R95J7i5P6IlFv8fuObddesFK9WdDrdpKpbDW5JslD
X-Gm-Gg: Acq92OGGw7mcIB6FLzQLUa1dBUK0smqYE9MN/QlpvzpEHKJNfBmJKQklmFrcTMlURdW
	cTDZ1WbP8CYN75azGQFWM4JTDzUap4fX42vDnsNo5363xxS9wtIVHuuTTqVxflkllBETP5nKWKt
	2xsPkxvNZGs20N0Liru27FacASmsWt87tMMK+XfkaDNQwC6OLZNvGl9RyODdl1Xes8rRLyxNvnQ
	qVAYJVORm+YrK9Y24vz6a+tTGVgio5LJ2YiSvJvzP7TUEpIpigLBbmGwX3vSKFNNoUH4JRNY13h
	QoaV586IaZ6FB1p1ij4ioQ6Jkkde6u2a40Nb4xhfc6eY3RsFFH+zsyM6Elt3GqSeRkuF8Ub9+TK
	OeSZRMJqvSq7PNNqCTVUWG/fRnyCsMLnlgvl5F5QJcrSwK/3p26M+
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr22558352a91.19.1779266666600;
        Wed, 20 May 2026 01:44:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr22558333a91.19.1779266666085;
        Wed, 20 May 2026 01:44:26 -0700 (PDT)
Received: from [172.20.10.3] ([27.60.134.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951434eafsm16841041a91.10.2026.05.20.01.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:44:25 -0700 (PDT)
Message-ID: <3484614f-e36d-438a-843b-a137efe04b4e@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:14:16 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt
 <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MyBTYWx0ZWRfXxNn5AuO6FXG0
 /DlMnmQF3j1upZRPdyF6IM+x8nO2VbNGRv2qShPQeKZvGPr7GWelUE1nhi2S3II+XbbmBsRWeJk
 2SxlNriPEU8XZ5ctvy0Vf44Uw0rAm9X7qBN8fLS1ZOvzlXL4GelYHw0exrzTSEab4z/xO+ls7qY
 1ia3haBbK9IXmi9fY3h4d6sYH5AwEEnR+pbE/JNt72WqzATJdmoJ9pNM3inhUO6xdJB60PJLjOR
 9o0r6ILHT9n2KjXv7ITtGfcY1tAjvKOwNrW2IFBnokjQJatTRX/r7l1UkIakPmkw6fovJUii60e
 aEUhvYRFbajEjfilEMYivmShuTprIgme0z+wXBijZuQWqRvN4jTHvNqBnK3W2kxjOYVZimPd3l7
 idM5cVkZKx8sUyM9ffm9gPRc0trnDzEvrsY2su2iyv6o60NFe9qhFPBqkg6a/Kro7cWcWf1pszV
 UBzPq5oTXTABt+6b/sQ==
X-Proofpoint-GUID: uZOMRy-eatiW4VwlEmBYekWh5JmbTpw0
X-Proofpoint-ORIG-GUID: uZOMRy-eatiW4VwlEmBYekWh5JmbTpw0
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d746b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Q/5yxSSCruZ1lXPW2Frkag==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BSL2Kxv7fMuy8ITjNe0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200083

On 5/19/2026 12:36 AM, Rob Clark wrote:
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
> The final two patches wire up the needed support for global counter
> stream collection while IFPC is active, and drops disabling of IFPC.
> 
> The mesa side of this is at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158
> 
> igt test at:
> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs
> 
> wiki page about the design:
> https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI
> 
> Changes in v7:
> - Use smp_load_acquire() for fifo_count_to_end() [Akhil]
> - Defer installing stream_fd until end [Akhil]
> - Link to v6: https://lore.kernel.org/all/20260514134052.361771-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v6:
> - Reword comment [Anna]
> - Link to v5: https://lore.kernel.org/all/20260511130017.96867-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v5:
> - Drop unnecessary runpm in ioctl path
> - Link to v4: https://lore.kernel.org/all/20260506171127.133572-1-robin.clark@oss.qualcomm.com
> 
> Changes in v4:
> - Fix null ptr deref on older gens without perfcntr support [Claude]
> - Add upper limit to userspace controlled FIFO size [Claude]
> - Fix nr_regs calculation [Claude]
> - Link to v3: https://lore.kernel.org/all/20260504190751.61052-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v3:
> - Fix loop counter issue spotted by Claude review
> - Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
>   available counters in case of -E2BIG
> - Proper barriers for modifying pwrup_Link
> - Link to v2: https://lore.kernel.org/all/20260424151140.104093-1-robin.clark@oss.qualcomm.com
> 
> Changes in v2:
> - Rework makefile magic based on Dmitry's suggestion, and add a2xx/a5xx
>   perfcntr tables (although only a6xx+ is supported at this point)
> - Fix compile error for compilers that are picky about a struct that
>   only contains a flex array
> - Drop a6xx_idle() under gpu->lock in a6xx_perfcntr_configure(), replace
>   with perfcntr_fence that sel_worker can check
> - Add a7xx+ pwrup_reglist support for restoring SELect regs on exit from
>   IFPC.  (a6xx doesn't support IFPC, and the pwrup_reglist works a bit
>   differently)
> - Stop disabling IFPC when global counter stream is active.
> - Link to v1: https://lore.kernel.org/all/20260420222621.417276-1-robin.clark@oss.qualcomm.com/
> 
> Rob Clark (16):
>   drm/msm: Remove obsolete perf infrastructure
>   drm/msm: Allow CAP_PERFMON for setting SYSPROF
>   drm/msm/adreno: Sync registers from mesa
>   drm/msm/registers: Sync gen_header.py from mesa
>   drm/msm/registers: Add perfcntr json
>   drm/msm: Add a6xx+ perfcntr tables
>   drm/msm: Add sysprof accessors
>   drm/msm/a6xx: Add yield & flush helper
>   drm/msm: Add per-context perfcntr state
>   drm/msm: Add basic perfcntr infrastructure
>   drm/msm/a6xx+: Add support to configure perfcntrs
>   drm/msm/a8xx: Add perfcntr flush sequence
>   drm/msm: Add PERFCNTR_CONFIG ioctl
>   drm/msm/a6xx: Increase pwrup_reglist size
>   drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
>   drm/msm/a6xx: Allow IFPC with perfcntr stream
> 
>  drivers/gpu/drm/msm/Makefile                  |   27 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  217 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   15 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   33 +-
>  drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
>  drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
>  drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
>  drivers/gpu/drm/msm/msm_gpu.h                 |  104 +-
>  drivers/gpu/drm/msm/msm_perf.c                |  235 --
>  drivers/gpu/drm/msm/msm_perfcntr.c            |  648 +++++
>  drivers/gpu/drm/msm/msm_perfcntr.h            |  155 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h          |    2 +
>  drivers/gpu/drm/msm/msm_submitqueue.c         |    3 +-
>  .../msm/registers/adreno/a2xx_perfcntrs.json  |  109 +
>  drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
>  .../msm/registers/adreno/a5xx_perfcntrs.json  |  128 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 ++++++-----
>  .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
>  .../msm/registers/adreno/a6xx_perfcntrs.json  |  105 +
>  .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
>  .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
>  .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
>  .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
>  .../msm/registers/adreno/adreno_common.xml    |   42 +
>  .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
>  drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
>  include/uapi/drm/msm_drm.h                    |   48 +
>  39 files changed, 6015 insertions(+), 2212 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
> 

With the json fixes:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

