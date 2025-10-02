Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DB2248B8
	for <llvm@lists.linux.dev>; Thu,  2 Oct 2025 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443120; cv=none; b=onf+tG9SegftnVigGCu9bNSYrSxEZsAwtWWJQ8e+/tcZyvZR0Dv+jckMao1071tPfMLD0kiHHdlRzeuQyOPijymMiMKs+9MtxJMke3MzFnpDMrTPA0QROLXDopHjoZJO8xUCrk1R3+liw2u+VRbExa/2Y8UJgnxre7PnfIQlp8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443120; c=relaxed/simple;
	bh=lraP0hz23/2MXfOmQ8ZprXbjkp5lv6pLnFTmwv/0En4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulnIKaVsrvV7immsVnKRoH0GNHO0VF16nvQWiEnBFq+7/swnT783o5rTPYYklcNjzfy4SiYD2nnHFMq0A7vSvgLvbiVUngj5e+SWEQbdVSm46pSR0avflT7hi2w7E5EqtZFEDxiHnHLtgeolZs5I+3/NLd9Q0wGsorl3ISxc1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIKeflyf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIKeflyf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-267fa729a63so2506515ad.3
        for <llvm@lists.linux.dev>; Thu, 02 Oct 2025 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759443117; x=1760047917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=hIKeflyfvfoAZ5VYgyw6gU7eMA4y1MYVF5BgIOploTLshzbTx8jdDc46bgc4NOmcvS
         oBqCbSM9H0UZ0UEqejvtprKbUQgbDpibXepCfMbytlLChrz2W3kqh0MQ4qYnq9Tdqx94
         dQMH4APNZ1veOAYSHpIyMCS8yUz4xOL+NpRceCzuniw+IcCKPofQfLhFtfZbmQ8151Uc
         8pwtcHWK6dwLnxsqQvgYKsFXTexRWhjwDfjKRooQ85drKnFnokIncqYuwatc/Hizscii
         9wghKiG21q7ZarKw9Ow4qTJX6VjYxXutiNjPAH9eTJHnCuwkq7+0h3abPcG8PVkaphVH
         3mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443117; x=1760047917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=RiN0WsbiW1sJEZ1eWH3YSCzHVPURZitZ8SsqEjQljo8+6oJHwyHmkdUG6E5fQMsM51
         TK+Br46lbfyRHc2IW5IRLMGLzM/5KdaBq5FEGUwdj4CFc/ze67/g9KLn1z3RPGAIArwX
         ZmBuU7gEUDARy/u5nNCZFHzSL5ocjjx3vBP5+lagjlyO0btpitBKM9/Skvld2wyj+NjN
         7OSAtdtVySfrCnjYIgjDcppRcNINZgWDjG6MAuZZZGcOKSz0twP+cLVBXy2MXs0/rKqa
         ubwUSSPnRQTvJb3fjPni+CUopwdj1df98T+dv6912NuyUxJ48Dr6il7BfgSAAOrUo9h9
         4LcA==
X-Forwarded-Encrypted: i=1; AJvYcCVFZp5PXeqEEVYeqGvDFet/4xHwJMSZAGjj/ZWY0TR8hUxUH+9XVAs48bze8MJrmJygDZP8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1E5iGvlGcn0IS+ctW55W/mx9XTwxZuQ8s0nScSRlNpq7GxNHj
	inuaIV7v9OZ2jsAzpggPJ+9Yp7IMgYlN5c5VPCkpyzACGi64yntpVxnuvoPIcXXjHg4cLZHuhuU
	yfUbDz4cId8KpNiyxlclNtiU/jnoA0eA=
X-Gm-Gg: ASbGncs4cKqsEY70qPvbewF2VANDEg/+3wneESRo6CM3nML60JS4v3EHaQwFkkL4F54
	i4fSVTSqkChw+7bFi31eMIfDckMn/TAgIr3ZxDI5g9SpRSb1o+oNjCh0/YyjdJpKiEwI3OkGzOY
	+wwwxfCCw9zcPZUa1fnEH2aCo7RWhnPIfqaSJ6CS1E3CkvSQrqFnNQ/kEu5BUNmztjVL/DKOVeF
	NSTr3gI+zO6JaKD1qdvvzCfOHXzytCDAr8GOyNS3mNR+cL8pT7I+ewYlfrbe+e3oLJLaULGz1nP
	X+qm6dV15Hx+nWA41ibZdghMFoUcvEybg9QYfIgI+4hpOrFkAw==
X-Google-Smtp-Source: AGHT+IGwKnqSVieJ3MfyTgFFO/O9vpr8rro3ogT4lM4nX7G7iGhsfj8Tx0MNi0UQc58JqTsdSFoH8GBJjyKfBVPnZAY=
X-Received: by 2002:a17:902:b196:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-28e9a665b6emr3287285ad.6.1759443117189; Thu, 02 Oct 2025
 15:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
In-Reply-To: <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:11:44 +0200
X-Gm-Features: AS18NWDnPckM1PfneojmzdbCoOjMOJM9kMDMDSDk4r7YVa59EgpddvEXF-NHdJI
Message-ID: <CANiq72nE2gAuK_ym2=As3yXRDoNFbKuSa4oac7abhpjy45ZQGA@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org, 
	John Baublitz <john.m.baublitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:52=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> It seems like bindgen's --clang-macro-fallback argument can avoid the
> entire class of problems, is there some reason Rust for Linux has avoided
> that option?
>
> Although, in order to make it work with fixdep, additional somewhat compl=
ex
> build system changes are required. I've got it to almost work locally jus=
t
> now... :)

I am glad you ask! ;)

We were the ones pushing for the option -- John implemented a
workaround that I suggested, with optimizations on performance:

     https://github.com/rust-lang/rust-bindgen/issues/753#issuecomment-1674=
833380
    https://github.com/rust-lang/rust-bindgen/pull/2779

I think the last time I tried it was early this year -- here is the
test patch I had:

    https://lore.kernel.org/rust-for-linux/CANiq72m20pom+B9EmWO+91E8fjbMEob=
3JmvHRQ6UaXe_JmatfA@mail.gmail.com/

It is in my backlog to go back to the option, test it again and so on.
In any case, note that we will need to increase the minimum, so it may
take some time.

Further context at:

    https://github.com/Rust-for-Linux/linux/issues/353

I hope that clarifies.

Cheers,
Miguel
