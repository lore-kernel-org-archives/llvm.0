Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4C72
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 06:55:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id t6so57171426edi.9
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 23:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCi78mN2x2kHh1l5Km4KZVKR5L77ZE21c4hjNnlzASE=;
        b=czLC+Ngkh9GhtjcAnabJuWFebjDLfRI4M+rF3x6yxdDZ97gkMUCD7+kmL5o7Sw0MjA
         BlxSyWFW7kRDrCwOXWNU3t83vXCRCYy2iGz211SlEkBIjRq/zQTN6Y3qorISuiv4X5P9
         /fLzafYo4yc0n2ZdUin4HmgYLlomWABX0GyQWiJnCsnEyf99jeZ9qIPaRx5AGAd9cTE5
         Fijw8Ezp/DiMjvgJ8m26Z7SiA5scBcVX5YTNW0Jiuu2vjw3qDfi+saKv0lYXTWRDZft8
         y2+nvrHqIl6miK0MIWOZkpuq8Gs97VPmnzoyRRww9YfS1FrdhoCjX+fQ6pyK1wBQsaNf
         5r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCi78mN2x2kHh1l5Km4KZVKR5L77ZE21c4hjNnlzASE=;
        b=key3d0FojBPD9Fr/WBuT7Wt5xN6gWt5ouSk8RgCbF7o07Yw6nQxnqQLEQvmVIOo5ke
         LS406A4KqfFAooYA+3lBz2VO4p9AbzparZR+bK0HuDj1YYyfPi6/LCF1OD2vXePS3OID
         NFgNxF64pf+BYhQOPFAVQvE2q1G1on+yw1NDNVXc46MZBazU4xDUMcXLzYkZpXI8MqOl
         ++RpRAEjuijCFmTVZgVAUXRWJqId/k307V7UXNEOUqJZ6sbvdasoiOsO/AV19WWLpiHS
         Z2VWog7iKWc8Dcqw8JPtGMvE0CaZ1AIBOoTRyIadvv6sk2UJSE36Wvf9rDul1nwTXbmv
         N8DA==
X-Gm-Message-State: AOAM531U47AZ0Ny7xlLgqwB6KpAfGDL6V2eDd7kStu/YHZnjRzCWBw/3
	z/eIPx6eOP9370FkYNcfAjHdpN3LJmpaoyN+ophzjw==
X-Google-Smtp-Source: ABdhPJwci1SBywa3LSGy8b+OOj/3yOi53811KIsJWRaFVLVD+hgE++znRxTu8J1NZxbBbVPQjcGeVbba2wOLklCLgAk=
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr26462988edp.103.1632120899694;
 Sun, 19 Sep 2021 23:54:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvoyDqbCnmcVMHCO3Zxn9=FGTjyTH9u=7FT7rCz-dh6JA@mail.gmail.com>
 <YUgDV31uzAQy5IcN@archlinux-ax161>
In-Reply-To: <YUgDV31uzAQy5IcN@archlinux-ax161>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 20 Sep 2021 12:24:48 +0530
Message-ID: <CA+G9fYv-EHy3-+ALV3Ev0k6J=e0_y7Xm2KgGFuE4XXFHp5EazA@mail.gmail.com>
Subject: Re: x86_64: clang-10: <instantiation>:2:2: error: unknown use of
 instruction mnemonic without a size suffix
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

On Mon, 20 Sept 2021 at 09:13, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Mon, Sep 20, 2021 at 08:55:46AM +0530, Naresh Kamboju wrote:
> > [Please ignore this email if it is already reported ]
> >
> > Following build warnings/ errors noticed while building linux mainline
> > master branch
> > with clang-10 for x86_64 architecture.
> > But clang-11, clang-12 and clang-13 build pass.
> >
> > <instantiation>:2:2: error: unknown use of instruction mnemonic
> > without a size suffix
> >  lsl %rax, %rax
> >  ^
> > <instantiation>:1:1: note: while in macro instantiation
> > LOAD_CPU_AND_NODE_SEG_LIMIT %rax
> > ^
> > <instantiation>:2:2: note: while in macro instantiation
> >  GET_PERCPU_BASE %rax
> >  ^
> > /builds/linux/arch/x86/entry/entry_64.S:887:2: note: while in macro
> > instantiation
> >  SAVE_AND_SET_GSBASE scratch_reg=%rax save_reg=%rbx
> >  ^
> > make[3]: *** [/builds/linux/scripts/Makefile.build:379:

> Thanks for the report. This is another case where the implicit switch to
> the integrated assembler exposed a previously fixed issue in LLVM:
>
> https://github.com/ClangBuiltLinux/linux/issues/1079
>
> This cannot be fixed in the LLVM 10 branch as it is no longer updated so
> if you want to keep testing with clang-10 for x86_64 on mainline, please
> add 'LLVM_IAS=0' to your make command like we did in our own CI.

We will update our gitlab pipeline CI configs with 'LLVM_IAS=0'.

>
> As a quick aside, would you mind updating my email address in your
> system for reports to nathan@kernel.org? It will ensure it gets sent to
> the correct inbox so that I do not miss things, as I do not use my
> personal address for kernel development anymore.

Noted.

- Naresh
