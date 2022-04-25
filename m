Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C247E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 18:04:49 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id s27so3138503ljd.2
        for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/l89rfQVVtx1flLEVtb0U3W2O/kjq1ZZL//POFf5aQ=;
        b=smOcuAu10ISNaaEC+cJfAkMucSHij1973pBjheUIf2TIWvbYi/eSBssxTm263W1O6h
         xp1ljix/KWhCWce9HjCKN3l1QpMkwKHwShN7foC01Z/aT1M+R9Kkuj15qsLcW9YJzek1
         Z0LVRbyZRCpOFg+JpQqRuay+KE/K591GYpl9K2TqWlXSaFg5P5k4zmohn75AERwbLMxa
         6IZNvbJqkwrpY8IGDKxLcMzAinBOynweTGGe5Sm1tdJY51dVjc9/08BZzq1YXFokySNW
         2VuOpH2iVdXSP5sSJUg20LD9+9v+m0P2e2LCQbAYrBmO9ul6roX9w55xtq7hJtWXmhfZ
         SXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/l89rfQVVtx1flLEVtb0U3W2O/kjq1ZZL//POFf5aQ=;
        b=o85W4bs6kXd0DWasCFZVZK2OyMo5S0bTBh+PpW66zlvPWx64XyB1Vnrk/2ZnxewObJ
         FG/6PCn/wuac7IqhIJQU/LG7nEauTHJqX9QpcL+2ScQEeT6Po2c7WT7mPRKaadcdeaW2
         tDo+/B/1aLTCzeJTJUsi0OIi5NumGhvLEUmAFmHV6FbXygyHj95xmlV7D2qwHD6OgoMQ
         bHNHZd2/j13Nv7VatzjOcIe66OAdqSzvBGL2TUzVMCfT6cjHQCVMGMuaJyWI6M+25xP7
         quR4czN1iND02Ushdsj8N2QchWk4VBdp2CQecfokNZSiw97MwP8fsIVUlgDv1AdTpoRY
         ZkVg==
X-Gm-Message-State: AOAM531GxNZARBm79FTnJdeddV1J0SIOAwLynw2i5AoTLRunqz/W0rje
	TuB2MRMgCkMdKzduSoAHWayj07mt1KQwrGXMuNEqv58pgEtOqw==
X-Google-Smtp-Source: ABdhPJyS1zMMYUSDagjLfQMlWdH8bEiYM+wWxgix7ojjmf9lQvNiIITkR8MGm8YCrBeoCZM/lZkJ3DeviTV8tn8XKNI=
X-Received: by 2002:a05:651c:553:b0:24f:18c1:d2a1 with SMTP id
 q19-20020a05651c055300b0024f18c1d2a1mr361805ljp.239.1650909887147; Mon, 25
 Apr 2022 11:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Apr 2022 11:04:35 -0700
Message-ID: <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Mauro Rossi <issor.oruam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022 at 8:06 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Apr 25, 2022 at 3:27 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> >
> > Hello,
> >
> > while performing my periodic testing of android-x86 build with kernel rc cycle,
> > I found the following building error which seems caused by commit
> > 34737e2698 ("uaccess: add generic __{get,put}_kernel_nofault")
> >
> > Please provide and merge a fix while we're still in kernel 5.18 rc cycle
> >
> > I am available if you need testing of the fix
>
>
> Hi Mauro,
>
> > [x86 32bit target build error with shipped prebuilt toolchain clang 11.0.2]
>
> Thanks for the report! I'm fairly sure that others have tested this path
> with clang-11 on x86-32, so I wonder what is different on your machine.
>
> Is this a clang-11 from your distro (which one?) or from Android?
>
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:35:3: error: invalid
> > output size for constraint '=a'
> >                 copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> >                 ^
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:17:3: note: expanded
> > from macro 'copy_from_kernel_nofault_loop'
> >                 __get_kernel_nofault(dst, src, type, err_label);
> >          \
> >                 ^
> > /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:509:18:
> > note: expanded from macro '__get_kernel_nofault'
> >         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
> >                         ^
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:35:3: error: invalid
> > output size for constraint '=a'
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:17:3: note: expanded
> > from macro 'copy_from_kernel_nofault_loop'
> >                 __get_kernel_nofault(dst, src, type, err_label);
> >          \
> >                 ^
> > /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:509:18:
> > note: expanded from macro '__get_kernel_nofault'
> >         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
> >                         ^
> > 2 errors generated.

(Plus llvm@ , Christoph and Geert to bcc)

Hi Mauro,
Thanks for testing and for the report. This is vaguely reminiscent of
some i386 assembler issue we fixed back in the kernel in the 5.9
release.
https://github.com/ClangBuiltLinux/linux/issues/194
So definitely surprising to see something similar in mainline; perhaps
config related, or something should be a feature check rather than a
version check.

To start with, do you mind sharing your .config file? If I can repro
with ToT LLVM, then this may be an issue to fix given such a .config.

Otherwise, I'll need to see what's different between upsteam llvm's
release/11.x branch, and that release of AOSP clang.

Orthogonally, I think the latest release of AOSP clang is 14.0.5. Any
reason you're still using 11.0.2?  I expect to drop support for 11
next.

>
> arch/x86/include/asm/uaccess.h:509 indicates that
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT is not set, but I expected
> this to be available with clang-11 or higher. Can you confirm that this is
> disabled in your .config?
>
> Adding Nick to Cc, as he worked on that feature.
>
>        Arnd



-- 
Thanks,
~Nick Desaulniers
