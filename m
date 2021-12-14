Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC49173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:34:15 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bi37so38890010lfb.5
        for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 11:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dl2iT6KtwkArkWpu4TKpHkB1JYhlOVD8tWdR0g05Kik=;
        b=ppKZVIYvSpHjo+S2FtMLfGCT1I/ZcNCGwrapDzcSKGQvI4rKcQa0J3HiBvYWct64CD
         pjJxC2A5GGIxtuI/+BHqvQDcriFwbZztXOMPp3MvVd3gHNvd0oHBMO7HVdUeOBxcJw0T
         BKn7/jfDTdSCqZDbdFsFltz2qwevOfG8J+uTWrMrp/KFm0laB3vp3sDJWbU7By9Y1123
         L2rGLHEHna2RLGvyyKF/A3e4fMb0SYuY2N9t1gonIGgR5w2gIF8ztTKWmZ+NnBqOBH/v
         QUjOk2f2Y/i+6tG3gDpCIesZZlRr2+Ls9pYOr+/V4nynrMLFa43/AtZfEGHzbUvZqQ9R
         oCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dl2iT6KtwkArkWpu4TKpHkB1JYhlOVD8tWdR0g05Kik=;
        b=lc5MBwmWVXfHX4wPnxucN2njr/9Aj7wOCCeCqx5hSVigvmno43CgKqRFx5Or/OWIvp
         0TPt+GImyjTmwp7OkQrk0u9yfBdSLE1E4XA+LBkOoZT4KUhZBvhavDxLQPeP/AJgHx7g
         zxA1kiCr6rgUex+510e+YB3vzDKd672n3bG6eOszgYsoj+f/XImz019dG33dUY8wBuI9
         onAB5PjZ2E3IjD7i0IKFXnvRDJnt96R9CG7tNqUoT+pvTVxDQY8nH6BxJzKiBkpqwRyR
         9HODUGSSbGlwAzAKTP2cCnBMWb5nX27+2HYSdQSrdlgvu4a6N71ENzsYlWpDLjTPIQTn
         KSjA==
X-Gm-Message-State: AOAM5323E2q7w0aI44eYhwI7Jhbdw2ELDInSXOD9mibWjd8l0Gmr7it2
	sXmS623T4Je1x2VeyMYBY4JatIcSFoBYTKdhmIVcQA==
X-Google-Smtp-Source: ABdhPJxES0U3idmv8VA0GlFgs82CWHx9tfDuuFcdaU4FVcajgtSxXmkub8oZvbsWID90bY6FKcFoxfIjHFuD4Kgut+E=
X-Received: by 2002:a05:6512:607:: with SMTP id b7mr6541968lfe.489.1639510453554;
 Tue, 14 Dec 2021 11:34:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211213224914.1501303-1-paul@crapouillou.net>
In-Reply-To: <20211213224914.1501303-1-paul@crapouillou.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Dec 2021 11:34:02 -0800
Message-ID: <CAKwvOdn=7iYyOg8+wikOK-6Xogf9Z6wdmkJEacYV_S1MpZ-YDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] MIPS: Add support for LTO
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nathan Chancellor <nathan@kernel.org>, list@opendingux.net, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 13, 2021 at 2:49 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> With this set of patches, it becomes possible to build a LTO'd kernel
> with LLVM/Clang on MIPS.

Paul,
Overall, nice work pursuing this and working through all the related
issues; thanks for the series!

We should clarify whether this is LTO_CLANG_THIN or LTO_CLANG_FULL.
Getting support for either would be nice, but for each architecture
has had its own distinct challenges.

>
> This was tested on a Ingenic JZ4770 based system. It requires the
> linking step of the vmlinuz.bin to be done with binutils' LD instead of
> LLVM's ld.lld [1], but the vmlinuz ELF itself can be completely built
> with LLVM.

eh, this patch set sounds incomplete then; Can we wait to resolve
https://github.com/ClangBuiltLinux/linux/issues/1333 BEFORE this
series?  Hacking up arch/mips/boot/compressed/Makefile to force a
different linker is not something we should encourage.

>
> Strangely, the LTO'd kernel is bigger in size (3.6 MiB vs. 3.1 MiB
> without LTO), which might be completely normal and I just have wrong
> expectations.

Are you building with CC_OPTIMIZE_FOR_SIZE or CC_OPTIMIZE_FOR_SIZE?
LTO != LD_DEAD_CODE_DATA_ELIMINATION

>
> Cheers,
> -Paul
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/1333
>
> Paul Cercueil (3):
>   MIPS: boot/compressed: Disable abicalls
>   MIPS: boot/compressed: Build without LTO
>   MIPS: Add support for LTO
>
>  arch/mips/Kconfig                  | 1 +
>  arch/mips/boot/compressed/Makefile | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
