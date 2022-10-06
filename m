Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11F7EA
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 20:35:16 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id l1so2705641pld.13
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YrAC23faud15zS6eHd6bC3i2jrrjB6ysFBkxCYV0DUg=;
        b=VnvmXZkP0hhSETFJ7/rWObNvgVlwQNsO9Q6Wr+CY5AhJLWqAxw5ymAu+d5E1rrq4qi
         xtkMwQ6YDrHzIZayo7ZRhSzrDOrrFPnJhOXk4o7evz5s7x30Hn8I9naaZ0i069dQB/ph
         cnMQ55FQ011gtIYFCTqyzmJZqzabfBru2us/cJbxwS7Jb7TSyZcJOK7aqO0uOmoTQAcH
         GYFiGgWnKQU+ZbebJkkLcDLzUIDh8oQka9cmqiqC2XG21Fq/3L0j06kv3/yXoiZzN3Dc
         NqeD9ebVrKYIEEnneSVmz+ISDsgVMRU1uRoqaUUyEVUz6KnTZG9lz9xnlm/sH0mgGJ4X
         k7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YrAC23faud15zS6eHd6bC3i2jrrjB6ysFBkxCYV0DUg=;
        b=25hxjmQeoub2IVgw7pVB3pMWstIVkAvUOVgNy86roGkY6BgNrRew4A/AXbSEEnUkvy
         BQSLPBo0ImvJxRFJLYrCE/Zh9UOtAIuUVY/1e3kIZW66sVSbmKhG9r5TZs+GlM4aSRfg
         L/nzKZ+KUrtzxTTL3MLLkb81PmeKTPpwowAV2LtUqyel+0yU3BUMz0K73+2Bxq7/5zfr
         fxQM+un7AuUjuWFnI3pDEjrgFqWu6H7E7W2z4qlMmyvFyHDrQ5Dl3dnG5GMoErx99H58
         r0GHVYJfSYPNia6uwdIQywuQ3R7h+mXPHAp3zECoi0f2mvp5wQtgm03ehwtw8HqB7vhI
         oPbA==
X-Gm-Message-State: ACrzQf0SORzBgpkYqPi5lGUuOlwI8PQ3u9vl3+5ZJ0+Z4oFs1vQIlt/H
	YVS8xecPGxNdi9J7cErZiWQFI7azx+PukWZWLRKntg==
X-Google-Smtp-Source: AMsMyM4v3+jebTsx8rta3oTKTPbj+0QFRpgOMqqHaIV7tcXGfBpXOUbUwwIMLxbH/aI5igVtVyqUZJViZkQhI48Gf94=
X-Received: by 2002:a17:902:7404:b0:17f:7fe6:7197 with SMTP id
 g4-20020a170902740400b0017f7fe67197mr1565798pll.94.1665088515406; Thu, 06 Oct
 2022 13:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209291607.0MlscIht-lkp@intel.com> <20220930211505.209939-1-ndesaulniers@google.com>
In-Reply-To: <20220930211505.209939-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 6 Oct 2022 13:35:03 -0700
Message-ID: <CAKwvOd=0p31f-Yya6S-9xKEv6CtUWpOCRxHO=jG2uk-hZgZ1bQ@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: kprobes: move __kretprobe_trampoline to out of
 line assembler
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	sparkhuang <huangshaobo6@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Logan Chien <loganchien@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:15 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> commit 1069c1dd20a3 ("ARM: 9231/1: Recover kretprobes return address for
> EABI stack unwinder")
> tickled a bug in clang's integrated assembler where the .save and .pad
> directives must have corresponding .fnstart directives. The integrated
> assembler is unaware that the compiler will be generating the .fnstart
> directive.
>
>   arch/arm/probes/kprobes/core.c:409:30: error: .fnstart must precede
>   .save or .vsave directives
>   <inline asm>:3:2: note: instantiated into assembly here
>   .save   {sp, lr, pc}
>   ^
>   arch/arm/probes/kprobes/core.c:412:29: error: .fnstart must precede
>   .pad directive
>   <inline asm>:6:2: note: instantiated into assembly here
>   .pad    #52
>   ^
>

Chen, I noticed that your patch was discarded; it's not in linux-next today.
https://lore.kernel.org/linux-arm-kernel/YzHPGvhLkdQcDYzx@shell.armlinux.org.uk/
https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9231/1
How would you like to proceed here?

I think moving this out of line, incorporating Ard's feedback, then
putting the UNWIND directives on top might be the way to go. What do
you think?
-- 
Thanks,
~Nick Desaulniers
