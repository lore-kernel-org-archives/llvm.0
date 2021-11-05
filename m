Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34C2C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:51:11 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id j5so16953048lja.9
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsqXxMPAEyayuWYNn2cn31F1D2jcff0K1QvBSthWMBM=;
        b=qOxV+6+MFUFLS2PS7gWTFOb+5OBR+cqySkvjy3obIuGHjHYU2+OPa1v0oH5ar3Momb
         1SfH9k7CtbWT3EoxFjVodUnvjUC7Sbd62Yd+tv89a35AM2Q477zcUc+DozAS/Lv/mS1y
         lPjneQGIlCtLwO6x6p+kHAIBo8KsK7JvzjcYBekIJDr5SvANWAhocb6d403cSVlvN9QE
         q691o0BWYl49mrnOtyAlBN8sa2c4x1HZTJezZCORUEHVarGNWj+9TGwDAqPQlnBVwyA9
         YMAgDh4A6AkxZeDLvFZC4h+oDYaqFL2h+lf/eYcRrNHxUzwl7RsJ5sTteaxm4LXmEV+V
         PFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsqXxMPAEyayuWYNn2cn31F1D2jcff0K1QvBSthWMBM=;
        b=xaV8Z5OjTPMU1zFLHvUCdz+r7W5UZ97XTpUO4qXY0PB6IRGT2cttWP0bfS6pDpALOn
         OIJDK8aCQu4QNYSrQ5bnGujMfuwwHFh+xNEB0/MmcZTn6nNLe3Uexe9a2d4CXkcI5cBF
         xoTUb884eSMyppvYiALBAd3wV+y0qDctubHewt8SJsEvizSIeN848EXd/9i3/L3Dw23q
         HkoCkKgz+HIhbmlYz6v1vY88QgUTgY0EHR9ZF2T9nJ/5/MuQ9Yv1p1S+EX2uZyMTQKJs
         DT0FvzjfKyEb2kXHuxxvrw9eTZ+FnPLIZ34kcRe1JY2d//BzZGK/aItuLKXMJJD+38id
         0Wdw==
X-Gm-Message-State: AOAM533Ax/oCy6wGJY6c6ZfH9lGTn/rFtX0nS7Y9G4CJ/MZm+O17yt9M
	gjdOW+Ne65SXZ9PgKMxSna3AHvzv0x7XMa5tynrl8Q==
X-Google-Smtp-Source: ABdhPJyscGR2faQ3WY30fi9rHtfREOCPhjZDAaOuuO8TE7pOhp1KBS3rpUKQlf4rPXLm+5TIIpFu3wdMSSP1pETACTo=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr64510854ljc.338.1636145469249;
 Fri, 05 Nov 2021 13:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105163137.3324344-1-anders.roxell@linaro.org>
 <20211105163137.3324344-2-anders.roxell@linaro.org> <CAKwvOd=rRntVgYdqEeb=JAYo2iC-wVB3dkQWNvwdZdrYgt2s7Q@mail.gmail.com>
 <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
In-Reply-To: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:50:58 -0700
Message-ID: <CAKwvOdm=a7w0cQdynY2i5ST=xrfjzXVZcUniAoEyqC21oKPQsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: timens: exec: use 'labs()' over 'abs()'
To: Arnd Bergmann <arnd@kernel.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 1:45 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Nov 5, 2021 at 9:35 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Fri, Nov 5, 2021 at 9:31 AM Anders Roxell <anders.roxell@linaro.org> wrote:
> > >
> > > When building selftests/timens with clang, the compiler warn about the
> > > function abs() see below:
> > >
> > > exec.c:33:8: error: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
> > >                         if (abs(tst.tv_sec - now.tv_sec) > 5)
> > >                             ^
> > > exec.c:33:8: note: use function 'labs' instead
> > >                         if (abs(tst.tv_sec - now.tv_sec) > 5)
> > >                             ^~~
> > >                             labs
> >
> > Careful.
> >
> > Isn't the tv_sec member of `struct timespec` a `time_t` which is 32b
> > on 32b hosts and 64b on 64b hosts? If I'm recalling that correctly,
> > then this patch results in a harmless (though unnecessary) sign
> > extension for 32b targets. That should be fine, but someone like Arnd
> > should triple check if my concern is valid or not.
>
> It could actually be 'int', 'long' or 'long long' depending on the architecture
> and C library. Maybe we need a temporary variable of type 'long long'
> to hold the difference, and pass that to llabs()?

Yeah, that SGTM. Thanks for the review!
-- 
Thanks,
~Nick Desaulniers
