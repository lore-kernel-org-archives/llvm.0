Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C086121
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 15:12:08 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id 21so3532994plg.12
        for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681312328; x=1683904328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+2dE/XzSoYgXLKmNcRjV06GDc4+0/b0Vl1y/hE9n7M=;
        b=aeDFGpvbhptI26N7c0q6p8N0elzrhrH4jXsXeTNEjUyEmrYyXyguS0uqTeAQjP4Xiu
         qdW1W55Dxz+ZLoGpJW6kOy66QNh2ekD+py7oe7R6tIR1j5Y/Cvcgeo8T0l2JKRmHvNLJ
         j1WZnXp081ZVJbRr2ZvT1E4bX7MyYb2M8Ki3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681312328; x=1683904328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+2dE/XzSoYgXLKmNcRjV06GDc4+0/b0Vl1y/hE9n7M=;
        b=mLcE0ZQ8N/hFtE7qN3Ho/4blbcsBMw3bJakda9ZSzu0VPCIWbbCWejaBmsxvb8dMMr
         HSosIvsJ6o0qKo4dmEe8RdJdTqBcrH0EBLYx5cuXSPGzff0M93UHHh+T4nV45U4pdUnK
         ssBbRkxs9+m25tvco8doP2ol3DrIH1OwGRzJQpReBucq6Totmn3zjVWyK7w3l6zsdIjF
         3jWokT2V1KM7H8LzzbBbEggTT1iJ2UBClokxPQ3cJUDiy5QkUyNSO0FfdZUOGi8RyQxv
         OfEhHthchfj5Z76/NuCOnw169C1qqw3iEUvJEOr1C7698cpkeN14tQ7chGiF7hDd8SLQ
         cR9g==
X-Gm-Message-State: AAQBX9fOKMffubgUPmJbicOvRFdUBGVipqNSnD4I28x9lwoMNgjxb6zx
	SARpvV5gRwPLX61xnlKbJCErjw==
X-Google-Smtp-Source: AKy350YBEJPE8oxKW+WKrzBNuJQ82N/lSby57TJKNApeGFAafpixV3EqtqR6r0kXgUhHbCjyxU4xFA==
X-Received: by 2002:a05:6a20:b047:b0:db:6026:4393 with SMTP id dx7-20020a056a20b04700b000db60264393mr18616114pzb.59.1681312327946;
        Wed, 12 Apr 2023 08:12:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u20-20020aa78494000000b005a8bf239f5csm5518679pfn.193.2023.04.12.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:12:07 -0700 (PDT)
Message-ID: <6436ca47.a70a0220.e83cf.adf4@mx.google.com>
X-Google-Original-Message-ID: <202304120811.@keescook>
Date: Wed, 12 Apr 2023 08:12:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Fangrui Song <maskray@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-hardening@vger.kernel.org, Tom Rix <trix@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <20230407215824.GA1524475@dev-arch.thelio-3990X>
 <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3+YzvwgeSS_GvU3oTtxunyUm8qMaAnV3Mt-ezTsxZ=Q0Q@mail.gmail.com>

On Tue, Apr 11, 2023 at 05:12:24PM -0700, Fangrui Song wrote:
> On Fri, Apr 7, 2023 at 2:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Fri, Apr 07, 2023 at 02:54:06PM -0700, Nick Desaulniers wrote:
> > > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > > Clang 3.2.  The minimum supported version of these according to
> > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > > this cc-option check.
> > >
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > As an aside, we should really consider having some standard format of
> > comment around cc-option checks so that we can easily remove them when
> > they become stale...
> >
> > > ---
> > > Masahiro, Kees: get_maintainer.pl leaves much to be desired for this
> > > file. Can one of you please pick this up?
> > >
> > >  lib/Kconfig.ubsan | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > > index fd15230a703b..0e7ad0782399 100644
> > > --- a/lib/Kconfig.ubsan
> > > +++ b/lib/Kconfig.ubsan
> > > @@ -15,7 +15,6 @@ if UBSAN
> > >  config UBSAN_TRAP
> > >       bool "On Sanitizer warnings, abort the running kernel code"
> > >       depends on !COMPILE_TEST
> > > -     depends on $(cc-option, -fsanitize-undefined-trap-on-error)
> > >       help
> > >         Building kernels with Sanitizer features enabled tends to grow
> > >         the kernel size by around 5%, due to adding all the debugging
> > > --
> > > 2.40.0.577.gac1e443424-goog
> > >
> >
> 
> -fsanitize-undefined-trap-on-error is a legacy option from 2013 when
> -fcatch-undefined-behavior instead of -fsanitize=undefined enabled
> UBSan.
> On the Clang side, http://reviews.llvm.org/D10464 added
> -fsanitize-trap= in June 2015.
> It's best to use -fsanitize-trap=undefined and avoid uses of
> -fsanitize-undefined-trap-on-error.

But that's Clang-only. -fsanitize-undefined-trap-on-error works for both
GCC and Clang.

-- 
Kees Cook
