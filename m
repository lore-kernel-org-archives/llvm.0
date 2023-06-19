Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47254AD3C
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 13:00:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3BE12FC;
	Mon, 19 Jun 2023 06:01:20 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.36.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03FA23F663;
	Mon, 19 Jun 2023 06:00:34 -0700 (PDT)
Date: Mon, 19 Jun 2023 14:00:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: arch/riscv/kvm/aia_imsic.c:237:9: error: call to
 undeclared function  'arch_atomic_long_fetch_or'
Message-ID: <ZJBRcG4gPA2wzgax@FVFF77S0Q05N.cambridge.arm.com>
References: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>

On Mon, Jun 19, 2023 at 03:27:47PM +0530, Naresh Kamboju wrote:
> Following build regressions noticed on Linux next-20230619.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Regressions found on riscv:
> 
>  - build/rv32-clang-16-lkftconfig
>  - build/rv32-clang-16-tinyconfig
>  - build/rv32-clang-nightly-defconfig
>  - build/rv32-clang-16-allnoconfig
>  - build/gcc-12-defconfig
>  - build/gcc-11-lkftconfig
>  - build/clang-16-lkftconfig
>  - build/rv32-clang-16-defconfig
>  - build/gcc-8-defconfig
>  - build/rv32-gcc-11-lkftconfig
>  - build/clang-16-defconfig
>  - build/rv32-clang-nightly-allnoconfig
>  - build/rv32-clang-nightly-tinyconfig
>  - build/clang-nightly-defconfig
> 
> 
> arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function
>  'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit
>     function declarations [-Wimplicit-function-declaration]
>         return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
>                ^
> arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_fetch_or'?
> include/linux/atomic/atomic-long.h:1087:1: note:
> 'raw_atomic_long_fetch_or' declared here
> raw_atomic_long_fetch_or(long i, atomic_long_t *v)
> ^
> 1 error generated.

It looks like this is because:

  2f68d5420412040e ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")

... added a call to arch_atomic_long_fetch_or(), but we've reworked the atomics
in the tip locking/core branch such that arch_atomic_long_fetch_or() doesn't
exist unless provided directly by the architecture.

Does this actually need to be arch_atomic_long_fetch_or(), i.e. was there a
specific reason not to use atomic_long_fetch_or() here?

If not, then please use atomic_long_fetch_or() -- that'll work before and after
the locking/core changes.

Otherwise we'll need to figure out how to handle the transient breakage.

Thanks,
Mark.
