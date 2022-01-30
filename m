Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0929CA
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 20:34:43 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id l13so2077803plg.9
        for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7IOZHCJNZdVLsKlAN8UmMORGXdNGmY4XG9mnrfmJGuw=;
        b=QV4Fu43qCgBQrge/+g0f+BFyeec7tqd+zZb+KsIVqjyPa2+8KTmQsBjFmKMa4GKe40
         l+YCP1RGk7CDYKX/F/bBg6XL0WJ5kED64GEhx7PaLymQi5WSoZ1ByUuhZ4/TEM/59JKP
         FdbOeQ1g4JR2P9So2fmDn2lkxdqRX/5OPsoX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7IOZHCJNZdVLsKlAN8UmMORGXdNGmY4XG9mnrfmJGuw=;
        b=bw4ObfYFKGS/J7R8gbEyyhbSlUgD4vR7FmpArGbBD4WjJFcTuIc6wltwwISxGsXagL
         TRUnNEqjl99w9eTbPG3/Wa6fOIpU6zIRdmq1oG39ipwm08RiJsNC3xBlTTNc4RuUIFVN
         4zBMVDy2CuVZADQCK6slJw3KtaUZX5P/7jFNrvuo9pd1PMiae78H3xlv6FdYlwIRxWvn
         Za9jUvbfjhGMEPFrdRfs9aaDMlPcfdRWvcRM3FoJcJailsOpoDTqLQE64WgI/L4fKPA8
         pDeOMeWcfWXyej0BuQOKKxeKKdft4VMt0btW9XVc2q72mMQwku5SNXkbmFjoNipyMCS5
         hyDg==
X-Gm-Message-State: AOAM533FMtlMIjSAVn1DH2I9qUlVWcIcGX6IPKGzEQ5UTTeeJCuPNRTo
	X2jOmmR5j5bHX2qtNZc9zLGCeg==
X-Google-Smtp-Source: ABdhPJw4yBDg3uS7cAcZfMh1IewxVhrjRAZxYuWwvIIw8kVlS7S/z6VsdX895ZYK9QDlZEQDnCeZAg==
X-Received: by 2002:a17:902:758c:: with SMTP id j12mr17852607pll.34.1643574882799;
        Sun, 30 Jan 2022 12:34:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d22sm9157814pfl.71.2022.01.30.12.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 12:34:42 -0800 (PST)
Date: Sun, 30 Jan 2022 12:34:41 -0800
From: Kees Cook <keescook@chromium.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <202201301220.529465D6@keescook>
References: <20220130183653.491292-1-keescook@chromium.org>
 <CAHp75Vf9S8jKQGAYRrmSET7YJQNoHMzUC6VVTAOT7DbwcCcc4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf9S8jKQGAYRrmSET7YJQNoHMzUC6VVTAOT7DbwcCcc4Q@mail.gmail.com>

On Sun, Jan 30, 2022 at 08:56:40PM +0200, Andy Shevchenko wrote:
> On Sun, Jan 30, 2022 at 8:36 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Add a simple test for strlen() functionality, including using it as a
> > constant expression.
> 
> ...
> 
> > +/*
> > + * Unlike many other string functions, strlen() can be used in
> > + * static initializers when string lengths are known at compile
> > + * time. (i.e. Under these conditions, strlen() is a constant
> > + * expression.) Make sure it can be used this way.
> > + */
> > +static const int strlen_ce = strlen("tada, a constant expression");
> 
> So, the compiler will replace this by a constant and then eliminate
> the condition completely from the code. Did I understand this
> correctly?

Yup! See: https://godbolt.org/z/nTqPaszTh

There a few rare places in the kernel that do this, which is how
I noticed. (I broke strlen() with the recent FORTIFY changes.)

> > +static __init int strlen_selftest(void)
> > +{
> > +       /* String length ruler:         123456789012345 */
> > +       static const char normal[]   = "I am normal";
> > +       static const char *ptr       = "where do I go?";
> > +       static const char trailing[] = "hidden NULLs\0\0\0";
> > +       static const char leading[]  = "\0\0hidden text";
> > +
> > +       if (strlen(normal) != 11)
> > +               return 0x100001;
> > +       if (strlen(ptr++) != 14)
> > +               return 0x100002;
> > +       if (strlen(ptr++) != 13)
> > +               return 0x100003;
> > +       if (strlen(trailing) != 12)
> > +               return 0x100004;
> > +       if (strlen(leading) != 0)
> > +               return 0x100005;
> 
> > +       if (strlen_ce != 27)
> > +               return 0x100006;
> 
> ...so this part won't ever appear in the assembly (assuming -O2).

Correct, unless strlen() breaks.

> Same to the rest? If so, why is this not a part of the compiler tests?

I wanted to keep everything together -- this includes a macro
side-effect test as well ("ptr++").

-Kees

-- 
Kees Cook
