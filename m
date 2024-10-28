Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367C1D278C
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111273; cv=none; b=jz57tJW8CknDPn/YmaEl/o/Ht6dE1Q2baJtXplnijXsurBuKAybu5oanIZSOxgcWpgJa6GrbWILwFe6STLq0F5czX87TMhSWYNcB1lqyRwDlnhIgJ6dQNaDABcZdrZA4BQQPUleeZmHKOtuai+w8KH9R/l4c1MTd1B90cVuzOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111273; c=relaxed/simple;
	bh=F0V3V0LcxCXGYV8fDcvvIAkVmPdH9FejZoN4859ONK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFKkxaFIB5rpqXrOnlg5gU1gcrlL3kqdtwBS4f2Oefa9jNc8Z+HTK0QzX5Op6OtiPtZJxhRp2vb+JNZj1V08aRuMe6HHyFWwr/bkBmozoqlcbtTR41oKWK9AOp8fb9OoYgFOcs/qrugsI1s//VE8qvw59zSSJUBtJ8pW6SVigYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQO8s5aF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQO8s5aF"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea07d119b7so5692577b3.0
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730111269; x=1730716069; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
        b=pQO8s5aFDnEIwrdd46f8zHl5IDpwSxKnelLjk3CTlC+OyjlIj0WMltA+5usS0hgopE
         7OhuytI4QV2cbda2Hl+5q+a8Suopkc0uwVTpqT/gnEhXFkaSwBBNXmaLEdVLG55XIsFC
         n945paUYHy78mpBAuaAiArEErM7iBQvCpGUhiL5uPS+P3fWcUjJcfcsdCEG8r8Ziqu8V
         PKIDs/8vD4WTQMK6gBtxvHRIObdC7TdbGbg8odAjr7aj2129REKV6ribCo5omc4MLnXI
         kgG6MhssRjfR1t0fCtp/sNOOhScYXuKgHhYIBgi5qC43CIspcthPSfSVWa7xSmTVGuMK
         bNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111269; x=1730716069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
        b=shWfeBfOn/+R5r++6QrUaXBpEXusL33JAhrYZ3XdCDw6PAExUshj6xbO8pnjMNRuI7
         mTv6/FQ1Og929zipnQmMQxRlJv0ozsXOBdRmOSJLRdIzpkkfyAze8eeOhFSzSleqdFaH
         m49JnLqIooqy0tF0dOQ2PoFqhl/JtJknKv+2p0a2w7DYfNphDRX33G62EUQLQFitpjfu
         AkTWvlm8dgZPMYmmTWU99eqCzIib1dwCV09CKThcTyK2t4oRwZtX+yuxQXPglexIDO6C
         0FQ2RUNxCjSI89HnbHWkQufv44mZUJVTfKwzif4nXZEpj1GmtQgtPSuM18MpRNSi+wzT
         zW3g==
X-Forwarded-Encrypted: i=1; AJvYcCW8oxXa3Cb843ZeErF78gy6lNAdVse/5ZqzUC+NynFI1hZlziQga/Jt3S17MeWyqCV86toG@lists.linux.dev
X-Gm-Message-State: AOJu0YwKZ9yZOvO0j7VqOkIkbVb6zIMub/Xe8V+JMK8IpDFSf59bKvgg
	Ot5s7atytbhg953G4TV5m/727JhFpUZ5zLPm08A0DCF9KK1AnEjMUuUbF5rsVCICa+A608tbHdB
	uzF6uhOgomJoXkmAlApvve+NqdNkxATmCysTiWg==
X-Google-Smtp-Source: AGHT+IGLe+4t7S9ZSveqwANNEzKdjUad0Z1HtQTFx3PEGKze+pVHMLOD52kyDgR3LowLm6wgDiAgoEwd56iMjidmX78=
X-Received: by 2002:a05:690c:48c1:b0:6dd:beee:9218 with SMTP id
 00721157ae682-6e9d8b1754amr70515197b3.30.1730111269077; Mon, 28 Oct 2024
 03:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts> <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
In-Reply-To: <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:27:38 +0200
Message-ID: <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> > On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >> Clang-19 and above sometimes end up with multiple copies of the large
> >> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >> fill the structure, but these create another copy of the structure on
> >> the stack which gets copied to the first.
> >>
> >> If the functions get inlined, that busts the warning limit:
> >>
> >> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>
> >> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >> the stack. Also, use this opportunity to skip re-initializing this table
> >> to optimize gpu wake up latency.
> >>
> >> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>      struct completion pd_gate;
> >>
> >>      struct qmp *qmp;
> >> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>  };
> >>
> >>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> index cdb3f6e74d3e..55e51c81be1f 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>
> >>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>  {
> >> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >> +    struct a6xx_hfi_msg_bw_table *msg;
> >>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>
> >> +    if (gmu->bw_table)
> >> +            goto send;
> >> +
> >> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >
> > Is it necessary after being sent? Isn't it better to just kzalloc() it
> > and then kfree() it at the end of the function?
>
> Keeping it around will help to cut down unnecessary work during
> subsequent gpu wake ups.

Then, I'd say, it is better to make it a part of the a6xx_gpu struct.


-- 
With best wishes
Dmitry
