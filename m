Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95867D2E2
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 16:44:49 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so2875190a12.0
        for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687193087; x=1689785087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvChMOwZFZ2731U67nUr7jD+9YjSwDaijH2KuLSlnQU=;
        b=dqnDtEgE802DF2yzx1ijAtFdHVLsIX/P86p0xOsCR6lKz7yW5aqZ3sj/lOdPMsgDQu
         qzgtHKxEdk7NV8ucLaVTdGK0UWwcVN5lh+P0LSWCdYVF0dtls/3ZLu/Wa+OMEY/GZFV7
         47tppJTVSaMBhD/EDiy0vfJnyO4yx0X0rMj8Yyi8TK1kuMwzonzbs3uhaX7Y2F+12ejG
         12Y6ELHKmqOLwiO6rHNc6Ndgq5Efm3U32Jwhke6KBjsXQ2mdzQkB0HsOvMFgEEM5Brmg
         y1JuyfhhpqMf0k2DOos/QdIF52t9pK1WZnq336BZ7vE0xCYwWMSkgkLhHarcJdr2miAH
         vXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687193087; x=1689785087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvChMOwZFZ2731U67nUr7jD+9YjSwDaijH2KuLSlnQU=;
        b=X8u2AWY1VBRyJruYWYgZZc4Yvg4Iak7vp890oex1tlEsrsiOA0YfbrVeRRPMkKpr5I
         OPTPuMM28l6YALSoYijSBRjdLVA15X52NmH1t1fQEOwlJbcxkymCiNdrhDoFLPr4rF3x
         HrH7qQhHilHKvY+c4kkIP6caLoKsHgSopyFA98t7yxUAL7LisFgmpmxcBBu4SXt3hjMJ
         Pr269Ig7xbNZ02wNBZt2Ig4ttFBkSXKL0CoFTi5vf/mtemRCDanzergm02PonHEXdmnF
         k7ySVWkBsPZCAOdf85xjqi6DiH1nzYUWonMQkp4NO9HciUjHSwQ9VpTZQlL+Oili0a+N
         mzsg==
X-Gm-Message-State: AC+VfDxCzMaUTdXmaw5pypD9nLeHJRs+Md7hATnuyNHf/Zx0T9D77zDW
	7PjI1AN0n/duVDyIz6FucqnHost1zKjWNupq0K0qqg==
X-Google-Smtp-Source: ACHHUZ6oSj/i6Pykedq2ySsISQglFJicZjuCcGa7TXEAoC1+pp+dVicruuI7Lb36pj/NzDmsI8BaGgcXUl5VCyUNogo=
X-Received: by 2002:aa7:d64a:0:b0:50b:c456:a72a with SMTP id
 v10-20020aa7d64a000000b0050bc456a72amr9189226edr.19.1687193087364; Mon, 19
 Jun 2023 09:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>
 <ZJBRcG4gPA2wzgax@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZJBRcG4gPA2wzgax@FVFF77S0Q05N.cambridge.arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 Jun 2023 22:14:35 +0530
Message-ID: <CAAhSdy1Kxb0cYteEDA2bun3p_JwFSPbiqrecZfLp9uKFXe7rBg@mail.gmail.com>
Subject: Re: next: arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared
 function 'arch_atomic_long_fetch_or'
To: Mark Rutland <mark.rutland@arm.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 6:30=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Mon, Jun 19, 2023 at 03:27:47PM +0530, Naresh Kamboju wrote:
> > Following build regressions noticed on Linux next-20230619.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Regressions found on riscv:
> >
> >  - build/rv32-clang-16-lkftconfig
> >  - build/rv32-clang-16-tinyconfig
> >  - build/rv32-clang-nightly-defconfig
> >  - build/rv32-clang-16-allnoconfig
> >  - build/gcc-12-defconfig
> >  - build/gcc-11-lkftconfig
> >  - build/clang-16-lkftconfig
> >  - build/rv32-clang-16-defconfig
> >  - build/gcc-8-defconfig
> >  - build/rv32-gcc-11-lkftconfig
> >  - build/clang-16-defconfig
> >  - build/rv32-clang-nightly-allnoconfig
> >  - build/rv32-clang-nightly-tinyconfig
> >  - build/clang-nightly-defconfig
> >
> >
> > arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function
> >  'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit
> >     function declarations [-Wimplicit-function-declaration]
> >         return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
> >                ^
> > arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_f=
etch_or'?
> > include/linux/atomic/atomic-long.h:1087:1: note:
> > 'raw_atomic_long_fetch_or' declared here
> > raw_atomic_long_fetch_or(long i, atomic_long_t *v)
> > ^
> > 1 error generated.
>
> It looks like this is because:
>
>   2f68d5420412040e ("RISC-V: KVM: Add in-kernel virtualization of AIA IMS=
IC")
>
> ... added a call to arch_atomic_long_fetch_or(), but we've reworked the a=
tomics
> in the tip locking/core branch such that arch_atomic_long_fetch_or() does=
n't
> exist unless provided directly by the architecture.
>
> Does this actually need to be arch_atomic_long_fetch_or(), i.e. was there=
 a
> specific reason not to use atomic_long_fetch_or() here?
>
> If not, then please use atomic_long_fetch_or() -- that'll work before and=
 after
> the locking/core changes.

There is no specific reason for using arch_atomic_long_fetch_or().
I will update the patch to use atomic_long_fetch_or().

Thanks for catching.

Regards,
Anup
