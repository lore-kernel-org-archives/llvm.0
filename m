Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEAC72
	for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 16:36:31 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id y12so2258124eda.4
        for <llvm@lists.linux.dev>; Mon, 25 Oct 2021 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v0YCPuNr/jE/DiYF/X/UY/xrtet4ANRF/YP7k9DAYiI=;
        b=XuzLo1XBFGN75Y+Lqed4u4Wjb/BnyUYCJrJ1xdAJfMmX5dKGr6fz2wblpKXkVecOsx
         WyNJTEiontgfCQzWRRb8MaJibefktzOiu7SMhXCCVMDcILoWhQmRUzBJTqKhB++7sJ+C
         wqdrKZwm2m8Oh2Z/lUP8o2P0VwBehaKzPUkTHLUzT4WxFkZN0pl46mObimTUd5IitDD1
         2vbOb1bcrkFOfst3QvYufpaq0UBU678f+YNln0gdGE4ySyUxP/fZ5X/3/ecMxmqPVb5L
         VdS/cFjjaDfQ1vm8yzxNcj8+jJoxKfWphhagfoJRv+9Igh4AgIN1PYR1U7HdUinSkdQS
         dFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v0YCPuNr/jE/DiYF/X/UY/xrtet4ANRF/YP7k9DAYiI=;
        b=vMCfBbieguyIEUVC4GL5FT5b7zvOJVwZKnwEwrAHcOaDpWXGaYdvd7AkZzCf1nIa+D
         sqvcbMQkrd03iqAlUWG9HRCzKYLb1vcR62iVYPMrLwEUxb7QC3yW4ZBj5AYZoB3o51i2
         N8P8553YqK9KqA2qrVCszWRkY75eJyFF5lEuBgK+mlMDJh7fpCxOEJbov7RBQgxqQiBK
         G0R4EI5DR8pVCZuecTdsuTro51pVD0ZIcmS9paVN3+iDU4PAcokZ2r99dOOx5mfDzP33
         nCfNA/PA3RCxZq3ZS4N9CarOSkeLIiEM84jokxQQYAXTzKlNGBLxztUCnVqg/ccvI/t5
         3qJA==
X-Gm-Message-State: AOAM532rfskU5KNm4UNiNpPhc6IpMhRq8sc7NpSQUXqGHqckRjkKtJRx
	EzAtBaefSp+EOY7hvouELgor3XAhAIKClwBFDUU+Lg==
X-Google-Smtp-Source: ABdhPJwmDr1M/Z7+RdwCNICcyiRPYILYrX2OyTjZHaycYqvh/mKvib8yj17tsgN2q9QO5BSdCD6X7siwPvOpj6BJ+6w=
X-Received: by 2002:a17:907:971e:: with SMTP id jg30mr23471825ejc.169.1635179789634;
 Mon, 25 Oct 2021 09:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuhRwQhByNkWQ4OLP7y5vBTGoWdW4KrJSzJizVsDzWQSA@mail.gmail.com>
 <YXbCFdz4R7cikpnE@archlinux-ax161>
In-Reply-To: <YXbCFdz4R7cikpnE@archlinux-ax161>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 25 Oct 2021 22:06:18 +0530
Message-ID: <CA+G9fYuyTO9+YFPKUF9+MGUFxLtbVA7E-WmihpNojuv_ox3NeQ@mail.gmail.com>
Subject: Re: i386: tinyconfig: perf_event.h:838:21: error: invalid output size
 for constraint '=q'
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, 
	linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Oct 2021 at 20:11, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Sun, Oct 24, 2021 at 08:05:01AM +0530, Naresh Kamboju wrote:
> > Following i386 tinyconfig  clang-13 and clang-nightly failed on
> > stable-rc queue/5.4.
> >
> > Fail (119 errors) with status message
> > 'failure while building tuxmake target(s): default': ea3681525113
> >  ("net: enetc: fix ethtool counter name for PM0_TERR")
> >  i386 (tinyconfig) with clang-nightly
> > @ https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/
> >
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=i386
> > CROSS_COMPILE=i686-linux-gnu- HOSTCC=clang CC=clang
> > In file included from /builds/linux/arch/x86/events/amd/core.c:12:
> > /builds/linux/arch/x86/events/amd/../perf_event.h:838:21: error:
> > invalid output size for constraint '=q'
> >         u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);
> >
> > build link,
> > https://builds.tuxbuild.com/1zvtvNS4eyYkOMiXtFgR7n1k0Yc/
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> I am surprised this is being reported as a new issue for 5.4, as it
> should have always had this error [1]. We did not fix this until 5.9
> [2], meaning that 5.10 and beyond is fine. The series that did fix it
> was rather long so I am not sure it is suitable for stable. My
> recommendation is to disable i386 testing for 5.4 and earlier with
> clang.

We will disable i386 clang builds on LTS 5.4.
Thank you.

- Naresh
