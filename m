Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B515115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:33:48 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o68-20020a17090a0a4a00b001c686a48263so3383570pjo.1
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eYD6V1H2eTxabk7DiQrQRT/zZ4eHdFF0vDlDZt1xas=;
        b=ewU64KNEeZwytZF4An+dsvf1BP7k4U83MQd6onG03mYKzwvJoQl4qyHjLQs0oSWMp3
         tM0aT1vxlatYEhWzCxIKabcD3D3NcoCSA/GxWDyU+KAAJDiYFZuYWQGOBaZX+uHQTM53
         jPdp6xULDFi9D639TpwzwjkdL9Oz0toZhmU49RwKTErUvNhnsJaYTMRb3hfj5zIzJ4wm
         n6PXOCT5cKyQGjdDoemy+aeFQp1DhCM4DMG4ZJn4Q75Yl+kUB+K7wR9TCKS3yZ+Gj8V4
         uzeCvUID+J2qH0vocYC63Ga/NEPHYwwA4w45fo9owtXS+INCb0z/kgabtvtMF5vPvzE5
         0upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eYD6V1H2eTxabk7DiQrQRT/zZ4eHdFF0vDlDZt1xas=;
        b=TTWw/yHIZhkkdPZtzKPV/es2jfZOADJKON8bRW4MWDVg+TGu5RxmJ9xyFM52WYmtIG
         aw5tB62NzJx9B04NPA9dZqVuYcVxRVM8gnheQ+0WgdDTWq6jFkwA5qQePhFUHc+MQyYG
         2ZEdM604OJA5quzRdCezofAgTpS0DRKst5E+R0IK9DQ8qXjsDwXTIxLPXONsIYH0W64m
         V4BbcNy4lE308hWCzQw0WtfZyrmR7/pXwx8X8d/JM8c+ea3BqFyQ3OKSCoNCD2hDJ4MA
         bPTiLNvRp5Tt4Em0Hit1cnS2IHyGw4MkttNNAruePB0N/CHTUuwoZU3AKxOcZ3hyN7IE
         X+GA==
X-Gm-Message-State: AOAM532WwyjoTi9YrV9f2vmlGKpymXOfsZmEH9+AmVA35QpJn/XV/d/g
	umAYR3ZBJu88O0+khyc7BxVDU2xGshKfdGxIgrYm
X-Google-Smtp-Source: ABdhPJywNU/bgojq+Q9H5bL3LPlh2ncjnrZOFfaHuK+iqJkgz5S3CtJ71EEeIfA73BW3NNK1remnTn+kKCiHGr7GfM0=
X-Received: by 2002:a17:90a:5b06:b0:1b8:b705:470b with SMTP id
 o6-20020a17090a5b0600b001b8b705470bmr12494149pji.168.1647628428016; Fri, 18
 Mar 2022 11:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com> <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
In-Reply-To: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 18 Mar 2022 11:33:36 -0700
Message-ID: <CAGG=3QXJ1P-9vAvONe8PKBzMe3se66GSL9gbA9UoLb7a5R33kA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Joe Perches <joe@perches.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 11:25 AM Bill Wendling <morbo@google.com> wrote:
> >
> > On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > > > > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > > > > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > > > > unnecessary %h[xudi] and %hh[xudi]")
> > > >
> > > > Not that I agree on that commit for %h[h]x
> > > >
> > > >         signed char ch = -1;
> > > >         printf("%x\n", ch);
> > > >         printf("%hhx\n", ch);
> > >
> > > Will print:
> > > ffffffff
> > > ff
> > >
> > I noticed this. My first thought was to do something akin to:
> >
> >   printf("%x\n", (u8)ch);
> >
> > but went the route of removing the "h" qualifiers to be more in line
> > with previous fixes. I will be happy to change this patch if that's
> > what you would prefer.
>
> Should we add a note diagnostic to clang suggesting the explicit cast
> as one method of silencing the warning?

I don't think we should offer multiple suggestions in the notes. It
could become confusing and make the diagnostic messages much bigger.
That doesn't mean we couldn't change the suggestion. :-)

-bw
