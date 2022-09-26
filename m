Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBC03FDF
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 21:07:16 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i6so3729842pfb.2
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VUYHQIv2vL8pY0r5skq1FuqyyfYP1QoMOYkxGZwbp6o=;
        b=TxQD2fJTodac/gzds749N6eKDMqdv7Q8g+tPhsOiW/sX3qUzP3f31tYswj1cNjhZ+P
         GZ26rUT4PfJw2GQKkiXkOXyDG3qoXJdjcDtY3ngV/e6Eip/wNz2SxOqyLUFoEqou289d
         65H2ej14mtX4cRsJfIOnYU6qdCyop+wYz0PRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VUYHQIv2vL8pY0r5skq1FuqyyfYP1QoMOYkxGZwbp6o=;
        b=J+ZR/2+wOaX/3vVJ8RFfx3fDI+rYEoH+/lt/0haozbNbrRmxEiFWy7Vc0x2F61imRL
         ZQM83h/E3OoVX+arGAlRgbKL1c9fSm/EjvD+CpyKqfl0VoaSBhpdigwMEa+IioG/CWIZ
         DfSzz7fbZMk0sw3oj3LJwz5SxdoRfvBZVeMa2JpbsgbgBRqbUU5rMDsrz92OODkqIRE4
         cXNCxqTtCVhX2tv0MrTWVrRPtw9YgFjn/mvdMvWDLIWohLw7rDRcmeKT6jyDAl5grHA6
         7ESbi9hbVm1CoqOHoYVCKlFhajL3OcCzaNQg1W2YmUUKewP4Yb/lmJGOOdUXkorP9wZb
         /UOw==
X-Gm-Message-State: ACrzQf0YRoShEDcBAMRK/M2gtEi6MglavjwSoHhC1+rlTR7niRkJrohh
	CdlL/AF5xOsdq0WH8xZejy+8Sg==
X-Google-Smtp-Source: AMsMyM6ac5PcbdyiCXdkvj0iGPsWyVMYvQOqt4HWPCMIqT7ijtbq72queIktQfLMWxfsTRb46FTITA==
X-Received: by 2002:a63:441b:0:b0:439:103b:25a4 with SMTP id r27-20020a63441b000000b00439103b25a4mr21064706pga.487.1664226436243;
        Mon, 26 Sep 2022 14:07:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h6-20020aa79f46000000b00540ffb28da0sm13290247pfr.91.2022.09.26.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 14:07:15 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:07:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Daniel Latypov <dlatypov@google.com>,
	Vitor Massaru Iha <vitor@massaru.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-sparse@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202209261405.619441AC2F@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmCjAQpaF40VStbFNf1ZqmTxTTZzy2v4TwSF0LVO08GYw@mail.gmail.com>

On Mon, Sep 26, 2022 at 01:17:18PM -0700, Nick Desaulniers wrote:
> + Arnd
> 
> On Mon, Sep 26, 2022 at 12:11 PM Kees Cook <keescook@chromium.org> wrote:
> > ---
> > v2:
> >  - fix comment typo
> >  - wrap clang pragma to avoid GCC warnings
> >  - style nit cleanups
> >  - rename __castable_to_type() to castable_to_type()
> >  - remove prior overflows_type() definition
> > v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> > diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> > index f385ca652b74..fffc3f86181d 100644
> > --- a/lib/overflow_kunit.c
> > +++ b/lib/overflow_kunit.c
> > @@ -16,6 +16,11 @@
> >  #include <linux/types.h>
> >  #include <linux/vmalloc.h>
> >
> > +/* We're expecting to do a lot of "always true" or "always false" tests. */
> > +#ifdef CONFIG_CC_IS_CLANG
> > +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> > +#endif
> 
> Any chance we can reuse parts of __diag_ignore or __diag_clang from
> include/linux/compiler_types.h or include/linux/compiler-clang.h
> respectively?

Hm, I'm not sure how those are supposed to be used. Those defines don't
seem to be used externally?

> Those are needed for pragmas within preprocessor macros, which we
> don't have here, but I suspect they may be more concise to use here.

Yeah, I was surprised when I had to wrap it in #ifdef given "clang" is
part of the string.

> 
> > +#define TEST_SAME_TYPE(t1, t2, same)                   do {    \
> > +       typeof(t1) __t1h = type_max(t1);                        \
> > +       typeof(t1) __t1l = type_min(t1);                        \
> > +       typeof(t2) __t2h = type_max(t2);                        \
> > +       typeof(t2) __t2l = type_min(t2);                        \
> 
> Can we use __auto_type here rather than typeof(macro expansion)?

I'd rather it stay explicit -- otherwise we start to wander into "oops,
we got lucky" territory for what should be a really distinct test case.

-- 
Kees Cook
