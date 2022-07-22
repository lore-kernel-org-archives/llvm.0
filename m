Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1715A8
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 13:29:37 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31e7ca45091so47549307b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKDuy9daBfBPdZhWf8G5kdVaIXK0ehAtusACvxcH+KY=;
        b=MhZGoWmDdlx5cn39RrH4mYtxXh2S846GT/Yz88EJC1WFgmE/L/Ui6BAc1j8G5ojVA1
         00n5//zg3jflhfY3ozn4ZWUTvzf7GZ2olnkMGM5H3pBr01Rvh8VzHTxnj8GCFLXFsiss
         MHXCQru/93F9LBNsjcPxfLWF2OtIGfSMkzd2cFd/ODWcCR1pz9HYTmHjbRx3PaghJsNR
         UrE2UVoRnfbPWJ4oFTAYA6jUQTVMIwKm3dm2FvA68SvF2l/5RsTQGynSAnpAhH5HxusV
         XaCwvlhTbIF6+y/HPFHTyQVjMZu2LWObuhlIfBIb48iiqSyJL7Ec9IHya4cVPqtgvUq1
         YOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKDuy9daBfBPdZhWf8G5kdVaIXK0ehAtusACvxcH+KY=;
        b=uzug+x05+DhZN1YLDYeVI3CTMYfkEpOiPEIduGB+sDSqmASNT7qqoeyn0U/y/KwYMm
         vTNuqHJFwLDRxtOiJUV/dEm8NT31IuKPIyCIS17T3/ILe0uGAZJ/ljtBqTAlo+IgaZa+
         oTHfrA5rWTX5wLUrfcky4wFYZU/A4JtJjyvpcR6Va/QbKHKoAO7J61H5E20zPEIQEbs6
         63NTIB5L3eUhtxxz7O0PvfZGvX9O5dTwjc/lkYCUukcLho/0W46t2nkOxKtVfsw1RW1k
         UgE98pX7q+IbWtV22FwITiJcXMGdtB/Aarm2x7a/kqu28rD46BHLHgXRH74q+qxdrfW/
         ezUw==
X-Gm-Message-State: AJIora+jLeLPfnjfvfN9Wn/9/Oh8R6/Prl44LxCnW0/ujGv7QSUqnp1i
	IEcV2KJ0VL+LblHf52jHbMMoDm41mP5oHWkhk2QwVxy/1a0=
X-Google-Smtp-Source: AGRyM1uQVMHAkNArQSyHaRlI7/1xFjYIx7vxOQDL/xkU0lPSSKpYKsAhEXFugKpvbxftx7+W5ep2Latr7o4MA0+Mm/s=
X-Received: by 2002:a81:83d2:0:b0:31e:64f5:91be with SMTP id
 t201-20020a8183d2000000b0031e64f591bemr492886ywf.233.1658496576826; Fri, 22
 Jul 2022 06:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
In-Reply-To: <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Fri, 22 Jul 2022 14:29:01 +0100
Message-ID: <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Sudip,
>
> On Thu, Jul 14, 2022 at 05:39:39PM +0100, Sudip Mukherjee wrote:
> > Hi All,
> >
> > I am trying to build the kernel for mips architecture with clang. I
> > see some of the configuration builds properly, but some of the configs
> > fails with the error (fuloong2e_defconfig):
> >

<snip>

>
> Unfortunately, I doubt there is much interest in that work, given MIPS
> as an architecture isn't being developed anymore. Might be an
> interesting hobbyist project though. It is probably best to just test
> configurations that work and make sure that those do not regress. Others
> are more than welcome to weigh in though!

So, I have now disabled those builds with unsupported CPU. But I do
see some others with linux-next and will like to have your feedback on
them please.

mips clang cavium_octeon_defconfig:

clang-15: error: unsupported argument '-mfix-cn63xxp1' to option '-Wa,'
make[1]: *** [scripts/Makefile.build:250: scripts/mod/empty.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1290: prepare0] Error 2

+++++++++++++++++++++++++++++++++++++

mips clang decstation_64_defconfig:

arch/mips/Makefile:281: *** CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32.  Stop.

+++++++++++++++++++++++++++++++++++++

mips clang ip28_defconfig:

clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
make[1]: *** [scripts/Makefile.build:118: kernel/bounds.s] Error 1
make: *** [arch/mips/Makefile:407: archprepare] Error 2

+++++++++++++++++++++++++++++++++++++

mips clang loongson2k_defconfig:

error: ABI 'o32' is not supported on CPU 'mips64r2'
make[1]: *** [Kbuild:48: missing-syscalls] Error 1
make: *** [arch/mips/Makefile:409: archprepare] Error 2

+++++++++++++++++++++++++++++++++++++

mips clang loongson3_defconfig:

error: ABI 'o32' is not supported on CPU 'mips64r2'
make[1]: *** [Kbuild:48: missing-syscalls] Error 1
make: *** [arch/mips/Makefile:409: archprepare] Error 2

+++++++++++++++++++++++++++++++++++++



-- 
Regards
Sudip
