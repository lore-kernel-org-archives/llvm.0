Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3FBBE62
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="La7BVBvI"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-457e36dcab6so2392860137.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697647929; x=1698252729; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/pMxszsWHDpKedI/5pITYv9bsseXhLI86JME0Jv0Euc=;
        b=La7BVBvIpk+qm0Ioqkyz6eU/QgLLdNvJ+TqRs7V8aXmcW8LRJ+GV9D21G+DKG9ewz4
         ErEUBJ3ishTXcUK/4foPk53aJTWl/tnpIn6YH/JbIU+nrhZU7mk+zz+kM1nWlZ1BDRzU
         Ue4Bjdr4pObxPpxNizPjTHlaKfpi4/sO8nvPiMARIrDZ9xzMk50W8TdvIkSLbKiDyBIG
         oCAJLZcag60AA6wZquvtp5pc5df/vudWgISJfFlAzcnqKWSqzmexXqrVlTykatukxLxw
         fBSB+8pDiriqCMExXRH7idoXRxZLaNdUlIworYHc0dzA+xk4OLHFU/61hll4WG3Mb3Ff
         N30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697647929; x=1698252729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pMxszsWHDpKedI/5pITYv9bsseXhLI86JME0Jv0Euc=;
        b=moHzenAtAq1AfLEWgDeCsvNITLWdmzFsmFOZ5Sy1NeHTF5g34hCXGzJO3VVp3Ez4pq
         Jmbh+euzhdVohKXD7m3fw4WaWWLQ9FmPys9pfLxTsKSVdRalRA9LSdgtARPDqE2DNSIl
         UFjLO6rcR9aA3FDvqRtRcPz9YaHrx+63xiwTIQ76sVJ8Deo+X8RVrBRXGw1Lft4JUKTX
         RlB2qzYzLxD8YVdz49XhGJkskffu1a7VFQE2lK7DCUw8/dwthQJ80BpONHXSdQa1OngC
         UPe9a0jdAFRpuI+M8LeanrLHggJavT7A/DDJuBvUfpyWmDloxa1rHAM12lfhulrkEYnZ
         Ehhg==
X-Gm-Message-State: AOJu0Yy7w54huva3EBkzti3VVigvJ6n3y4U0I0sFrGYKnVWC6TAYZ7fr
	lOmxf11tn0KI+q2XwFw1YpLqBbd9Aq24xi3QPmyY8Q==
X-Google-Smtp-Source: AGHT+IEDAauOr7AIlzL5NAmxKhOC4C7rRTgtECEtEKwhJHKWqxBEca7qyt2mnP+agJe96xEEpLJR6JsuHHE23NypJC0=
X-Received: by 2002:a67:e156:0:b0:452:61eb:dc26 with SMTP id
 o22-20020a67e156000000b0045261ebdc26mr3477209vsl.16.1697647929398; Wed, 18
 Oct 2023 09:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018153147.167393-1-hamza.mahfooz@amd.com>
 <CANpmjNPZ0Eii3ZTrVqEL2Ez0Jv23y-emLBCLSZ==xmH--4E65g@mail.gmail.com> <c7a80dc5-d18f-4a7d-915b-1803cc3e33ca@amd.com>
In-Reply-To: <c7a80dc5-d18f-4a7d-915b-1803cc3e33ca@amd.com>
From: Marco Elver <elver@google.com>
Date: Wed, 18 Oct 2023 18:51:31 +0200
Message-ID: <CANpmjNN7yvEjvTDHzzEqvN2iKvxjvOjpsz_ugSjwh4VBKDNH6g@mail.gmail.com>
Subject: Re: [PATCH] lib: Kconfig: disable dynamic sanitizers for test builds
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Oct 2023 at 18:43, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> On 10/18/23 12:22, Marco Elver wrote:
> > On Wed, 18 Oct 2023 at 17:32, 'Hamza Mahfooz' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> >>
> >> kasan, kcsan and kmsan all have the tendency to blow up the stack
> >> and there isn't a lot of value in having them enabled for test builds,
> >> since they are intended to be useful for runtime debugging. So, disable
> >> them for test builds.
> >>
> >> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> >> ---
> >>   lib/Kconfig.kasan | 1 +
> >>   lib/Kconfig.kcsan | 1 +
> >>   lib/Kconfig.kmsan | 1 +
> >>   3 files changed, 3 insertions(+)
> >
> > Do you have links to discussions that motivate this change? This has
> > been discussed in the past. One recommendation is to adjust the
>
> Sure, you can checkout:
> https://lore.kernel.org/amd-gfx/CADnq5_OyO9CHqahFvdnx7-8s9654udgdfhUntyxfjae+iHey0Q@mail.gmail.com/T/#m5d227dc1ef07b1f4953312287dce4568666c5e09

I would add this as a Link context to the patch.

> > build/test scripts to exclude some combination of configs if they are
> > causing issues. Or we increase CONFIG_FRAME_WARN if one of them is
> > enabled (KMSAN sets it to 0, 32-bit KASAN increases it a bit).
> >
> > That being said, we're aware of KASAN having had more issues and there
> > are some suboptions that have been disabled because of that (like
> > KASAN_STACK). I'm not sure if Clang's KASAN instrumentation has had
> > some recent improvements (we did investigate it, but I can't recall
> > what the outcome was [1]) - maybe try a more recent compiler? However,
> > KCSAN and KMSAN shouldn't have any issues (if KMSAN is enabled,
>
> This patch was initially motivated by KCSAN (i.e. I am able to get it to
> blow up the stack with a minimal .config). I don't mind dropping the
> other ones since I only included them because Nathan implied that they
> could cause similar issues.

!COMPILE_TEST is not the solution. Clearly from the link you provided
build testing is helpful in catching early issues, so that these tools
remain usable for everyone. But we know they use a little more stack,
and the warnings need to be adjusted accordingly.

My suggestion is to just increase FRAME_WARN for KCSAN, or set it to 0
(like for KMSAN). My guess is that first trying to increase it is the
safer option.

> > FRAME_WARN is 0). And having build tests with them enabled isn't
> > useless at all: we're making sure that these tools (even though only
> > for debugging), still work. We _want_ them to work during random build
> > testing!
> >
> > Please share the concrete problem you're having, because this change
> > will make things worse for everyone in the long run.
> >
> > [1] https://github.com/llvm/llvm-project/issues/38157
> >
> >> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> >> index fdca89c05745..fbd85c4872c0 100644
> >> --- a/lib/Kconfig.kasan
> >> +++ b/lib/Kconfig.kasan
> >> @@ -38,6 +38,7 @@ menuconfig KASAN
> >>                      CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
> >>                     HAVE_ARCH_KASAN_HW_TAGS
> >>          depends on (SLUB && SYSFS && !SLUB_TINY) || (SLAB && !DEBUG_SLAB)
> >> +       depends on !COMPILE_TEST
> >>          select STACKDEPOT_ALWAYS_INIT
> >>          help
> >>            Enables KASAN (Kernel Address Sanitizer) - a dynamic memory safety
> >
> > This also disables KASAN_HW_TAGS, which is actually enabled in
> > production kernels and does not use any compiler instrumentation.
> >
> >> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> >> index 609ddfc73de5..7bcefdbfb46f 100644
> >> --- a/lib/Kconfig.kcsan
> >> +++ b/lib/Kconfig.kcsan
> >> @@ -14,6 +14,7 @@ menuconfig KCSAN
> >>          bool "KCSAN: dynamic data race detector"
> >>          depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
> >>          depends on DEBUG_KERNEL && !KASAN
> >> +       depends on !COMPILE_TEST
> >>          select CONSTRUCTORS
> >>          select STACKTRACE
> >>          help
> >> diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
> >> index ef2c8f256c57..eb05c885d3fd 100644
> >> --- a/lib/Kconfig.kmsan
> >> +++ b/lib/Kconfig.kmsan
> >> @@ -13,6 +13,7 @@ config KMSAN
> >>          depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
> >>          depends on SLUB && DEBUG_KERNEL && !KASAN && !KCSAN
> >>          depends on !PREEMPT_RT
> >> +       depends on !COMPILE_TEST
> >
> > KMSAN already selects FRAME_WARN of 0 and should not cause you any
> > issues during build testing.
> >
> > Nack.
> --
> Hamza
>
