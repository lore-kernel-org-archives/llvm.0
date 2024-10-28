Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4E1D7E3E
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118135; cv=none; b=alBdd9MzLDZnQKH555cp49OmDj311Z1rytY77ofc79+GKUo0xlEjo4xraxcA+vzJGna5JjciEefFhNIyvWHHmDg/njjlZtd7mz26XjgxX4LNor/05AvPHbISzZimDxjVFAESMix3cwlsASNTG1nFS4g3/SrvhZiEfTb1AbVezwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118135; c=relaxed/simple;
	bh=mO2Zl63zBGPiPrmps5znjVtYV7sw225Lnb/7NwBIoYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7jL4j5BWz+cI5bcYaZzVaqfKDy2W7ip7pfW9vjMQtincRXUTaycRfJgAJdL3xY8GzmD8rfPjDe3fsiMcrKQvI7AbfPBctM0inirae012hN9uA5PkQh+SUJNN3qYwjqJHgCIvB6GFBL2BTco952+daAdRQvUYBIDUG/PudYwHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SaqpC6eI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SaqpC6eI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f72c913aso5346293e87.1
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730118131; x=1730722931; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLYYwenIWq8hGGfx5PBZfrB8Ff3+iHzFbKnT2o/gqxI=;
        b=SaqpC6eIfpPvRv6Ch4vYnkYZEkY/EQeC9zGjWj5EytIkvN33IH1FepIYA//RB/VDq5
         B2QGWSIBPoMXc468V2jsb3p412HBzqCldNYFLcRL2NKWlAbzSXWJ5zBTYl3hV3pg/VWr
         TkWBourGJ5q7/Hv+eAuJF49ZlWYzFAzALeGsdT8USrIbJwtGEBTs3R1WjySIXVyLl8XB
         e5f0d//al6I0PHSYqotyGrYne9eQivJt353CfkGKE8cwuInsAilL1M8HWUbcX1VSXSDu
         wzaL32D31w9VNLO1n2/1uXmAzI6LLFoFOcJZK8PNoQTYQN3uDQqNxQwaIBDLrKImswqz
         rsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118131; x=1730722931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLYYwenIWq8hGGfx5PBZfrB8Ff3+iHzFbKnT2o/gqxI=;
        b=dcfZ4vGMCTdsygnq/YUJI/kilOuQrhKY58HTtct5Py5euCEpNmEoB+nUWJGNdwOffx
         MAmB2Zv1uMV8081B47xDydrBn22wN/HmDuc/9Vox7hqk1w0CWUVQhN9S4FPm/xW3uTuF
         gQAZxZK6TbOl2GnAzzVMmQ5p3plz1bYHxchfVvFKase+tj2cMBT7iDAQaJW9ZffYfJVC
         eNlml5x84emraNEt7wnpS8damd2e/devdgPGp80nbrWRykOvq54YAHkVgFjQXOERA+vQ
         BzDU6ZJ8TlkF8BoOAv0Cpw1moUIm9CQBmdiCKtvRFR6ecBAhAW79Vk6Uz8cRbBrwSzvD
         XHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwc2jqK39v00i9ZZy8eiSnfEVVd4xnxrYzM5EMncjZCRgBURtgRl1oj3M29YJmzCa7UiCp@lists.linux.dev
X-Gm-Message-State: AOJu0YwgsGqs8R5qzOu5MtAIUXOIPgtStd72U01f6+PSS9Sq+SV0VZQ/
	25LGtdsr4owPVfLSFlLsfrz78Dfx/1yMES5chHXm7DbpBQTHAOHCULwJx9ej7vs=
X-Google-Smtp-Source: AGHT+IGeddx56M5Aox0jHqSipfTF3UVxUtQ4hd+mUkvJVvTErR6Nr5e5nz0d6gtqJRW46RK4ORMKMw==
X-Received: by 2002:a05:6512:b82:b0:539:fd75:2b88 with SMTP id 2adb3069b0e04-53b34c46711mr2900121e87.60.1730118130837;
        Mon, 28 Oct 2024 05:22:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de0b2sm1068056e87.246.2024.10.28.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:22:10 -0700 (PDT)
Date: Mon, 28 Oct 2024 14:22:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <k2eh4ysckrvh3hubkfh7u3x7mow4cnoo3tvxfygriyxha6zx3n@i4hdghgjvasx>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
 <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
 <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>

On Mon, Oct 28, 2024 at 12:31:50PM +0100, Konrad Dybcio wrote:
> On 28.10.2024 11:52 AM, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
> >> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
> >>> On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>
> >>>> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> >>>>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >>>>>> Clang-19 and above sometimes end up with multiple copies of the large
> >>>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>>>>> fill the structure, but these create another copy of the structure on
> >>>>>> the stack which gets copied to the first.
> >>>>>>
> >>>>>> If the functions get inlined, that busts the warning limit:
> >>>>>>
> >>>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>>>>>
> >>>>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>>>>> the stack. Also, use this opportunity to skip re-initializing this table
> >>>>>> to optimize gpu wake up latency.
> >>>>>>
> >>>>>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>>>>>
> >>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>>>>      struct completion pd_gate;
> >>>>>>
> >>>>>>      struct qmp *qmp;
> >>>>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>>>>>  };
> >>>>>>
> >>>>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> index cdb3f6e74d3e..55e51c81be1f 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>>>>>
> >>>>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>>>>>  {
> >>>>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >>>>>> +    struct a6xx_hfi_msg_bw_table *msg;
> >>>>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>>>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>>>>>
> >>>>>> +    if (gmu->bw_table)
> >>>>>> +            goto send;
> >>>>>> +
> >>>>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >>>>>
> >>>>> Is it necessary after being sent? Isn't it better to just kzalloc() it
> >>>>> and then kfree() it at the end of the function?
> >>>>
> >>>> Keeping it around will help to cut down unnecessary work during
> >>>> subsequent gpu wake ups.
> >>>
> >>> Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
> >>
> >> I think a6xx_gmu makes more logical sense here.
> >>
> >> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless
> > 
> > Hmm, are we expected to handle / perform BW requests in case of GMU-less
> > devices?
> 
> opp-table does that for us
> 
> In case of no gmu ("gmu wrapper"), Linux is the only entity that controls
> things

Ack

-- 
With best wishes
Dmitry
