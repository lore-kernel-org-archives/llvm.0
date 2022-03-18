Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EF510E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:29:46 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id w7so15407957lfd.6
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhBJua4MwTn16uw9UYiJEFGtN/+A3wWm3ncEcAGAznM=;
        b=XveiTTIKo48Em6kpMiotlpRXPch6hY8GbRe9VEOQqpG6yRcjfb2uuLDWaH7MdWWew1
         gI8m6zGyXqGBYZXFfD6uchEnbTiGVAMKYwtrir4sHAJ8zGXz6qPjRYwKaVh1dIgoD5Dr
         p/bBCLdzfZWnm59rifezKBDWpY4ECydq3e1f6DbB9ztxomnVWx0X0OTb5N/R2NaqTfgh
         HSY7TAbH+g7cVRBh1555JHIrBWYm/QyxHdHW/QN+mYGR/M20VP46tUat0iTb3tTMVIZh
         6RAXHhN54Z3naU78SqEd065dR7pSMA9ePMsMcipIP7Ii0Q8haEBwngc91xEgEoxVmB9K
         BZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhBJua4MwTn16uw9UYiJEFGtN/+A3wWm3ncEcAGAznM=;
        b=ZQnuIICcDan5Lwk8j4bEhm88fVQ/H78V7S3yJkMmkPb9JHG700CqHG+qfog9IB5UhI
         mC+3/q7J1R7ufn8hx0GRG5JEwNJGdSlsIF56MzuXXQS5xuxCW+I0PaTQt5Ct4C1KaGvZ
         cpbQgmIelbOXieIayQMZmrJfp/yYA4JV54N6cdLTs5Gz6y62oDCBEyOto662M74u4Me2
         qf7bRbuWkCKXEg2sHBuvhfPl1sxO+efdetq8FixI3NGEDXcw5TNaJ4ztYG0feurPQIfv
         nYza1ok0iIvl1mR6xB8IPRlt/Nv6i5bWFdF94U0Be8+U0mdwB2hsJ82Tw1n4IzX1QBti
         4I9g==
X-Gm-Message-State: AOAM530547P4TE0vwJai6XaVi0iYyChsC1OvqQVLSvwk12ImHcrEhgiW
	ZengpbLedrR19zqnTWz1xg58cr+vGsQ5asiIQl8tEA==
X-Google-Smtp-Source: ABdhPJzWbK0oJgZeNdqhptZp02Vl7ghfW80F6ZRIb/Zd4pWxJsRPSII+iAwnJeFfon+0mgclS0LLAq7EF/vEp3LrrtU=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr1450810lfv.626.1647628184755; Fri, 18
 Mar 2022 11:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
In-Reply-To: <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Mar 2022 11:29:32 -0700
Message-ID: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Bill Wendling <morbo@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Joe Perches <joe@perches.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 11:25 AM Bill Wendling <morbo@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > > > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > > > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > > > unnecessary %h[xudi] and %hh[xudi]")
> > >
> > > Not that I agree on that commit for %h[h]x
> > >
> > >         signed char ch = -1;
> > >         printf("%x\n", ch);
> > >         printf("%hhx\n", ch);
> >
> > Will print:
> > ffffffff
> > ff
> >
> I noticed this. My first thought was to do something akin to:
>
>   printf("%x\n", (u8)ch);
>
> but went the route of removing the "h" qualifiers to be more in line
> with previous fixes. I will be happy to change this patch if that's
> what you would prefer.

Should we add a note diagnostic to clang suggesting the explicit cast
as one method of silencing the warning?
-- 
Thanks,
~Nick Desaulniers
