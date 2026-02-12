Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC12D94A5
	for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898962; cv=none; b=pys8MKXy87WQtSA2WQcHgysrzDLqPpVZlIdIM3ncvGgHwaaoK4EoIzLu5Sg617iKOlkblF6zecOPXvMVjeMTOc4q3DGph2BnirRdk1XrMW47NkRRSEM1V8MhMtieq7LECX2Fue2i0sWURggrhB+BqxQkYI5+/JxLeHsB5PcHTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898962; c=relaxed/simple;
	bh=xaZFJSqarycPgjYP87uZlW5GbRX158HEdIVL26LyF/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbvve+F9WPYWdyX2EmP59K6ZDX+LcYt1ndf5zO4vVtr6FUGCs9NhqbN34nhiIfP//tgot+KpPl+r5KpDsf2Jo9TTQXdCZB8cZee3FWJuO0Vk+SIFMsdTkBF6Mt3ngFMrCDo10tGc1D2wx9ZkcpApbxCYq/0t5/OZ2/dnT7weOTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaronballman.com; spf=pass smtp.mailfrom=aaronballman.com; dkim=pass (2048-bit key) header.d=aaronballman.com header.i=@aaronballman.com header.b=b8ZOFbxo; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaronballman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaronballman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aaronballman.com header.i=@aaronballman.com header.b="b8ZOFbxo"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d45d37f8e4so1683825a34.0
        for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aaronballman.com; s=google; t=1770898960; x=1771503760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaZFJSqarycPgjYP87uZlW5GbRX158HEdIVL26LyF/U=;
        b=b8ZOFbxoJAblYQxdCdupV4FgqtSggcubOl4GaIq7Rivbp+pJPL5neXGZ4vTT9CWB+Y
         6PNjz4ziCo0nSUOTyOZRvXNDNU5lQ3KE1tonKD5DeglHP94WtNHwtgvawFa4kLn7lxYS
         erSpr7+CHlGyv4T+HKhA6hwM9Qw8Gi11uHuh8K1z37aUlFJwTqbTMiTVWU/Swm3TmP47
         sv/6xm0T2qEm1osmdSpWepaYfjAQoYG/Vm1xPU9zV6v+Aqmoi85ujR7GCgSyqBSFQoos
         9pRuturumRt/2S0/rlHv54rQbFTq8LawKF5F7qSnxjUgQsF9WUR6T1FDKY6bKS0bKLaI
         lMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898960; x=1771503760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaZFJSqarycPgjYP87uZlW5GbRX158HEdIVL26LyF/U=;
        b=jvrAV763WrvNq9p6mAt7VFK3HZ36JycFxHZLXG+7LoNy8vyGS/Yn5ObTGt7QnTKDvM
         e5ffN0eqMGrOO7jerusBIY2YGtK4dri9GhnhMvo/YrwpcQd+zsTVuzehaY46wv5z6pcZ
         4PDl31CTsA1pc0hE8dQJbO+boG5XR4VMa8yicQRwE5olBwY81CI9+XoxIsi3RYemnjY0
         2yLW1+0MKeisIJzHeJ5nRnPaiWXZwAF8FK96o2dVKAYc3Eh9XmvQLt1JdAAjBrWpEmKb
         eI4GAZmSqHuGTYQpJUwZIbPS5Um8Ro7SKVcaYEqAnnXxUNtC9+8lgdazpNN67IYlcrIx
         6EhA==
X-Forwarded-Encrypted: i=1; AJvYcCVK4zmZqcTLq+hwKKVcWZ4JqQAjcf6ZWZyccvmo2f0QekBVnAXZB5Zt65I2pySO9wbSY93u@lists.linux.dev
X-Gm-Message-State: AOJu0YyPe3xvd1jF57AGndFqsdbHdxR1mjQmhxGTJaxGqO/KZq4umAwG
	OVXzZZnEb9zXXrqAi9E7kZdpZspfq1wvGuOMJZdmNNrvkJOsXmVi/L4oTgHgpeeQEYhHmFROycr
	9i1KL
X-Gm-Gg: AZuq6aLPE+0YEnmWnxMLCsx6o19Qhs5tIi0TsTSksPsY4uoGI0EmuLgwJZ1yN+kmCYS
	A7hqBosdsNL9yyy0Ywk9x53qwkFUIb7mucuH716hmaKV1ysyUx5ynyrdBdeFScUr4aq51MBQ94h
	2FVZqoSQz40ljHT+e5ZOJvFEh97vSWV7+pqWZh29lrdMhr4uzSnKQ9dMt71LeAA78Vu6cj5ObID
	shUWT4yTgXrSmRMmJ9DV1p4LqTUXEI2aK4X4wh2eRHONsN23wRb18JaDx/m1l3GJB6UBXHcbvK1
	NqfXuNQYX2MGf9TJf5r88fNJ8W/apiL3Y9dyhabKnicMHJdhUyso60HB8Epz3YUTRGz/05eB/sQ
	afbAiRr03QKOFJJs6h0Nvzo79VRbERkynb/A58E+ktFZFsywadFVfmYh26GBimJdeHsbkpp8XuO
	Kln5pwuecKXvOZGIPOFP0FG0IID0PobefP5ZcSAPdT0snnL2hi1757XveU49Q+65NLD9GoBGOZw
	Q==
X-Received: by 2002:a05:6830:67f8:b0:7cf:cbee:6bd5 with SMTP id 46e09a7af769-7d4b41edb49mr802273a34.19.1770898959579;
        Thu, 12 Feb 2026 04:22:39 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a76df04dsm3753494a34.15.2026.02.12.04.22.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:22:39 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40438e0cba6so1948551fac.1
        for <llvm@lists.linux.dev>; Thu, 12 Feb 2026 04:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe/T0qX7QrKhRv8XWefNrHbNlgF818y3NxO7So9FLIdgO+DTa91zzaRbLBzbBXFRb2t+tf@lists.linux.dev
X-Received: by 2002:a05:6820:448c:b0:663:12b4:9572 with SMTP id
 006d021491bc7-675de2f51f2mr595819eaf.84.1770898958157; Thu, 12 Feb 2026
 04:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aYhfK3tB0X6Y_GyV@gmail.com> <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
 <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com> <20260211195139.GB3482274@ax162>
In-Reply-To: <20260211195139.GB3482274@ax162>
From: Aaron Ballman <aaron@aaronballman.com>
Date: Thu, 12 Feb 2026 07:22:26 -0500
X-Gmail-Original-Message-ID: <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>
X-Gm-Features: AZwV_QjwcUDnnyobXg_6nmLwUGbwje6hUaJ7h0EhCJ_ftEpF23I0pbq0D_QXuec
Message-ID: <CAAt6xTtmrrZh-+H-jV+bcteZwG1jabraTxWQ-uLJ_N9h1ZLxdA@mail.gmail.com>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Marco Elver <elver@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Bart Van Assche <bvanassche@acm.org>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 2:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Feb 11, 2026 at 12:54:40PM +0100, Miguel Ojeda wrote:
> > On Wed, Feb 11, 2026 at 11:59=E2=80=AFAM Marco Elver <elver@google.com>=
 wrote:
> > >
> > > I recall there was a CI system that did this, but lost track of what'=
s
> > > the latest.
> >
> > I think you may be referring to
> > https://github.com/ClangBuiltLinux/continuous-integration2.
>
> Indeed.
>
> > By the way, some time ago I asked Aaron (Cc'd) whether we could get
> > the kernel into upstream LLVM's CI system, i.e. to at least build a
> > minimal kernel configuration of a fixed, tagged release for one or two
> > architectures. Would that help you?
> >
> > (I also suggested Jose (Cc'd) the same, for GCC.)
> >
> > The idea is that it helps both sides. It serves to catch issues very
> > early on (including with subtle things like diagnostics), and thus
> > avoids having to play catch up later to fix them (compiler) and/or
> > workaround them (kernel) in either side.
> >
> > To be clear, this wouldn't replace the other CIs that run out of tree,
> > like Nathan's and the tests I do for Rust stuff etc., i.e. it is not
> > about catching every compiler issue or testing the kernel as a
> > product.
> >
> > For context, this all happened because I asked the same to upstream
> > Rust and it was a success there. In that case, the goal was to catch
> > issues early with the unstable features we use, but it helps with
> > other things too, and thus I think it would help just the same for
> > Clang and GCC. So far, we only got pinged a few times, so it has not
> > been a lot of work, and it did catch a couple issues (which sometimes
> > may end with a preemptive kernel patch or fixing the upstream PR).
> >
> > We also did it for upstream `bindgen`, and hopefully it will happen
> > for `rustc_codegen_gcc` (currently we have an out-of-tree one) and GCC
> > Rust eventually.
> >
> > Anyway, this is a bit of a tangent, but I thought I could raise it up
> > again and see what comes out of it...
>
> It has always been on my backburner to try and get a build of the Linux
> kernel as part of LLVM's continuous integration but I have never had the
> time to sit down and interface with folks to see what exactly that
> entails (I figured it would involve integration with LLVM's build bot
> infrastructure but I have not dug in super hard to the documentation).
> An arm64 and x86_64 defconfig build would probably catch quite a bit of
> initial breakage and it would be easy to pin Linux's version and only
> bump it when thoroughly tested.

FWIW, I continue to be in full support of adding post-commit CI
resources for testing Linux kernel needs. I'm not super familiar with
the infrastructure side of things, but I'm happy to help make
connections with the folks who do know if it's of help.

~Aaron

>
> Cheers,
> Nathan
