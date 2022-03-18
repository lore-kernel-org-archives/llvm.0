Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A10510E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:01:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id w27so15308009lfa.5
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1Ms63NIkd6E7s+RusloWQgZ7ue4LhJ4QsLqeHtSUJw=;
        b=UmJ7ZODw+NbFnzVmsyjuDdBgu4T/BwFBuS2/0+3MpNrwys8fTBTfkYBO1USQX87RCc
         GytlT2Sz0odsaeGpYDGyMwEBtfolTTfoXe/0/w8shAKFDO+IRj1la0blGBdQOVphsqY7
         M3IJWHcNUuY3XpphtwP3Ccs3F0vVtc7X4tupL6zeR1RE0r6kEUnLdV6sv6abGBSKuAvT
         qsz62NmNx+qchrEYSrn3OzEydIzwRraHZ8mwieJYb1vuVoLB/731mnpJMslLxnJ/Q8em
         PiirQtwAVuwulvHUk2tiS2Du+CYiHYNqBE/RFHLy24dEqp6UfqUw5Ii145O69Lw/vjea
         Ly/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1Ms63NIkd6E7s+RusloWQgZ7ue4LhJ4QsLqeHtSUJw=;
        b=ZqZR/9IUstyfpmuZGkb8OR9OqyizahLflD1+JUBxfHNlrFXfV6Q2yWuj1kUU0Pet4v
         MfKetZ7EVaFMasCQ9E9iqfU7vPpoN52DlfcPftEdwY8L8bHHuckgsx2Pv70cQWkc7xtj
         jJTEErolhID8sACPkY2I5BXCkPuwD9TChzSeWYrU/PFaI2gjpq+17LqSnqDPnsmvYUjq
         Tjl6qM2Nvr98Xv4QjUJpFXJUqSPYpluKAOYF1HRGjCLcN7et4QqHz7AQFkSEUIHpn5XH
         RYU9lqcPcHCME4Eyn64gPRP21aXk7pbF0PRzIPCDeAjy/BYYi+d3Z+NUUQb4usBWtb/l
         wKLg==
X-Gm-Message-State: AOAM533cZd27byDgxdkQVhO0VjgmLvWJwoH0wUWuFuF4WDJZTOBQ9y5Q
	RdZSVl0SDEuk2dD6d+f+eMHXQII6JfqidJVL1a6wpQ==
X-Google-Smtp-Source: ABdhPJz6aj15Mk032FInyJsNGaIzC0VM6EnNcglPQg/SUnzZ2trHPqDTPq6Y0J4vC0VxLXeRF9Apc6TRZUmywwUSrg0=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr1382981lfv.626.1647626485133; Fri, 18
 Mar 2022 11:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com> <YjSROmYwwGhpsXMl@smile.fi.intel.com>
In-Reply-To: <YjSROmYwwGhpsXMl@smile.fi.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Mar 2022 11:01:13 -0700
Message-ID: <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bill Wendling <morbo@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > unnecessary %h[xudi] and %hh[xudi]")
>
> Not that I agree on that commit for %h[h]x
>
>         signed char ch = -1;
>         printf("%x\n", ch);
>         printf("%hhx\n", ch);

Will print:
ffffffff
ff

Maybe we should reconsider our recommendations for signed types?

It's probably worth adding `signed char` explicitly to
Documentation/core-api/printk-formats.rst, as it is a distinct type
from `char` in C.
-- 
Thanks,
~Nick Desaulniers
