Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA31CDA17
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112632; cv=none; b=WkdcCmdtdLkvXD9b9qB09NBy2EQ+CUpdxn6az3BdUCDdRt6s4VTd7TQEnhbanKIwTsBjUnKKWBxKd1sPUxobTCCJEZC7kbdmofrv3cd5d44KWH6P8Zvuas25WVJXqPqqrsGKJLzhlHqI6vJ/BZO5V3rE8RMSomiNaF2mZtxOpAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112632; c=relaxed/simple;
	bh=bU1Qtn48i5nUAA3O2eESXBE5C0blf2pcU1u+JOIFCEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4S+dbrWtSxj/M9TAG+6rDiFjkapLb7thtmIV2Vxxep7sxtZravT/Y1VROQwzXVneec/M6ZLudGsOFwmubwZ9CbU0v1NW4lvVqztsOGoj/IH0SbeT2zCo74CT7BmIpkier4vbvFDPa8s8jmeWaaMjbnTT3BX1NO5cVV94BAHxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jH7sT7Cp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jH7sT7Cp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so4089408e87.2
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112628; x=1730717428; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
        b=jH7sT7CpapYIaFixYGcGtNzeiS7WZiRqRRb/YpNH/tTn5yWLKPfq6s5tBtVZ5HMt1q
         tkK6pSaFmLdJ7i2T+LliAMHlXx3J7DObcIS14UDzRdqtlrXYyn21HSbpV69RPbr7y91A
         xGnOsn1orvOKnMGdhzycQYjpK6OrgUrHo9sHXfNE1/zTYpPVwdgsxddejSisjEkwJKRO
         G95qM0oQE3Hs7oMw0tEV1ePD1mC167KvJS0K/oxOt31r7AEq/xVMHd6QA7ABSmtXGT/g
         Sog+dZZTq+7p5wI4EVCqzhjYfCwXCgF1Jo/Vuv6vQ9XQDvqQgVbqacVJ9p+ud6DVcaJH
         LSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112628; x=1730717428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT9gfcNhArTE1c2C7RUJiJlGQ17PepUqnBsoFt7gaK0=;
        b=HFU/c1ICfmQ3PDIophnspFVk/EwaAJd13kw6YiauiyiMBBysN9JKwuDF0nhipEcl+C
         vprs3Wt6bOMtfGBsbXXMz4lAS+0W1pGC4c70wUjARgbbR/Yg7IUTG5yL6OPEe7izxieL
         BZBMR2fJZW8MbBVNfYwWL3CQaxmA4jSleIbGh79BNzStGQLqZOhhYsLeYZnUJ+xsmMTc
         W6VT2upLr6sDGMTBvY+LBGdF/UuBFHlaihQU7iQYAj5ZcPV7iqXRS5LRq9dGfNtgdmpx
         J2P31Y0xdQRucwjsCxcBKjYAe2MqyUu9XjLABTAM7b4hbUck0TW/6Px/E1Jw4DzzRbBU
         +3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUIvdBhZ/uOpOiT7jYmTnD0Ibd+v+GMck/BrT6r0U15jLrDd5wILsisjY4I/AgTLlkDXmNA@lists.linux.dev
X-Gm-Message-State: AOJu0YzBUBqXMOR3M982ZqiBexTZM03qqCM8a8IJPKMzdce1sqcq5BLv
	73MIGIwywtK23As0Nl3FLTtjGrLSvtBHJ6ypUS4oDFJMzJv0Fie4uAS/PrrCz3U=
X-Google-Smtp-Source: AGHT+IH8FSgEZPGmIDpEZ2RxUjOJo65ME5pGZDusIyUmphRyeZHRXp0OHKNRYZxJAZ8p5+Tv9Q1f6Q==
X-Received: by 2002:a05:6512:33d3:b0:539:e7b9:df03 with SMTP id 2adb3069b0e04-53b348c3954mr3544985e87.1.1730112627826;
        Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1244d7sm1052368e87.68.2024.10.28.03.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:50:27 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:50:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <pipbl5fxssydcw3ehqsq3oea56nc37un7ok3oersvrqrlssyo6@5ksxbtcixfbo>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <3fb376b3-2db7-4730-a2e1-958f1ddd9f5c@app.fastmail.com>
 <6b7c2ae7-3210-4d57-a7b0-2efea594b2b9@quicinc.com>
 <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ca17a3-8ea6-450e-8ec6-9bda97808164@oss.qualcomm.com>

On Mon, Oct 28, 2024 at 11:39:16AM +0100, Konrad Dybcio wrote:
> On 28.10.2024 10:52 AM, Akhil P Oommen wrote:
> > On 10/28/2024 12:13 AM, Arnd Bergmann wrote:
> >> On Sun, Oct 27, 2024, at 18:05, Akhil P Oommen wrote:
> >>> Clang-19 and above sometimes end up with multiple copies of the large
> >>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>> fill the structure, but these create another copy of the structure on
> >>> the stack which gets copied to the first.
> >>>
> >>> If the functions get inlined, that busts the warning limit:
> >>>
> >>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size 
> >>> (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' 
> >>> [-Werror,-Wframe-larger-than]
> >>>
> >>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>> the stack. Also, use this opportunity to skip re-initializing this table
> >>> to optimize gpu wake up latency.
> >>>
> >>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Please change this to "Reported-by:"
> > 
> > Sure.
> > 
> >>
> >> The patch looks correct to me, just one idea for improvement.
> >>
> >>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>  	struct completion pd_gate;
> >>>
> >>>  	struct qmp *qmp;
> >>> +	struct a6xx_hfi_msg_bw_table *bw_table;
> >>>  };
> >>
> >> I think the bw_table is better just embedded
> >> in here rather than referenced as a pointer:
> >>
> > There are some low tier chipsets with relatively lower RAM size that
> > doesn't require this table. So, dynamically allocating this here helps
> > to save 640 bytes (minus the overhead of tracking).
> 
> I'd second this, said chipsets often ship with 1-2 GiB of RAM (which
> is still a lot in comparison, but you know.. every little bit counts)

Okay from my side. Yeah, poor Gnome runnning on top of 1 GiB device is
very sad.

-- 
With best wishes
Dmitry
