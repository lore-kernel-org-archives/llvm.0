Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50D2C86
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 20:18:49 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j5so78469466lfg.8
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8r6Eq/JMcjkN0ZqJKuReu5qRAy4ITYHI9vmmF+JdJo=;
        b=NtmF9bF8PwFZsVoBkDBLlHiIEq5NS1CO1bKeo1QHXAO7iACVHj4B7BEPWBMsAy0AgS
         WWs47YPUzohMoPPlpeLr2i6azNYgYtZwasiyM7bNqUBxLxZAg0XuMCdE2lUUaZpgGQci
         hwwP8J2L5qNypHYWHim8APpYpbEnGN29IuLnMQuv68sKFnRTCFk7HGr79M3PWdIpH171
         xI0CNHleGrGLLops5OJAwDpM5HiA9cbV+KeR4fo2iU1zjKVrgygQEy2VMG0SPLLL2aQI
         lXdAHpmNcOPUd3w1zJI71RaLuwdFFvuscx+APi44PUEbg3GDjs5eEm3BObF8ZVLwBKsi
         csYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8r6Eq/JMcjkN0ZqJKuReu5qRAy4ITYHI9vmmF+JdJo=;
        b=WCLaqeYEygz30z4TahjBpijOZiOG/2ALs3WyRa0Rxmxnahormt0PNzuSx8Y87JV0+T
         JT7Y0z10tDEjv1DirYNbVuHt1tPXdVdIUSGzPk31bSD8xwWFOIG1YRjbJEkgfq9qkMGA
         0E2jYKyEL1IPXXg3nyuLC85Y94AsuDxgxtaVw8s5eN31sRZPnhOlJnGVyLMRxKmDbJrC
         hFhySUvk7rfTotyHHoXpV9qbrMeM/3Ra6PXhgBZvy5z1XVXN93Cyh+Kw7+gVs0gfYv3v
         6kUU6Quf0o7asuuQeMlVsRQHvm3hQLssDK7BdoEiSpk7l26230TTRz0v0p3kVfKEIP49
         p72w==
X-Gm-Message-State: AOAM533vZnpxG3+S9l8Mtq3diqszMX+9WrkSq2fSPXwVHH7oKppwsS1X
	jv8Lz2RiUR7HgnWxe4UsjAOMcMaeE49qP/HyYUF9QQ==
X-Google-Smtp-Source: ABdhPJwRADUpXou6T1dlw2E7GruUX22YRuxAl4AGqokNW066BWA4Ctk8kyXdbAkSIIW2DTJv3ACYA0atIDm2BwTBzhQ=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr11621735ljo.220.1633983526894;
 Mon, 11 Oct 2021 13:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110100514.3h9CI4s0-lkp@intel.com> <d6e8064803598970b463da0e9bab116b@kernel.org>
 <CANiq72=-2t=ty2SFX=ZTNvcWC05-0AiaVBdy9s-rENEb53EFUw@mail.gmail.com>
In-Reply-To: <CANiq72=-2t=ty2SFX=ZTNvcWC05-0AiaVBdy9s-rENEb53EFUw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Oct 2021 13:18:34 -0700
Message-ID: <CAKwvOd=-VQHxp+Ar27LyqPMmMMt-mRu+32uD50dk6eWMfAj1VQ@mail.gmail.com>
Subject: Re: [arm-platforms:timers/tval-ectomy 2/17] drivers/clocksource/arm_arch_timer.c:156:3:
 warning: variable 'val' is used uninitialized whenever switch default is taken
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Oliver Upton <oupton@google.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 10, 2021 at 3:55 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Oct 10, 2021 at 11:37 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > I think the problem squarely lies with the compiler (or the
> > way it interprets the BUILD_BUG helper). If it cannot see that
> > BUILD_BUG() trumps the control flow analysis, then this warning
> > is totally useless.
>
> The fake, generated `__compiletime_assert` should be annotated
> `__noreturn`. That gives enough information to the compiler to avoid
> the warning: https://godbolt.org/z/x1v69jjYY

SGTM, please do.

>
> And we should also move `__compiletime_{error,warning}` to compiler
> attributes since Clang trunk has it now, so that we catch the error
> earlier: https://godbolt.org/z/jd8Eb9Mf1

Didn't I send a patch for that?
b83a908498d68fafca931e1276e145b339cac5fb
is in mainline.
-- 
Thanks,
~Nick Desaulniers
