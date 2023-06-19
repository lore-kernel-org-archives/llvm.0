Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8CC14A
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 09:57:59 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-44098ef627eso776614137.2
        for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168679; x=1689760679;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8R91KWhLlqQa5IHia14Lh3n7AuWHKsntgLNCQnZMkrs=;
        b=bqfr4uUqt++wGVOymMWddJpZTYI14r998nlh5OVa1OsPKWeYUR4VWH47IEQdLLJ38c
         Zk2FIoKzS9WiVhdXDsCMTUKFn2kCmtBPOKsNDSo+tVt4ulMw4GN1gL8ye9n84iW3g7Za
         MsRUKp2dxyw1GnCL5uKoNw1WmiaAIqzUVb7v1APqwDrnrH9N/H2XklTKFljA6svrXFCs
         brtlbTo43o3TtT/pCkoZI7aKBKd4Y/SfHmLn0kVS9XF4A+Sju9+kyM+f+nV4Co+DlLxj
         9Vj4sqNR9Nxt3H9K9XySv17FMuPYP/DJ4SaBWMZFvddJSIKLHcmmkVU/pA0GA/fGvN4R
         KAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168679; x=1689760679;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8R91KWhLlqQa5IHia14Lh3n7AuWHKsntgLNCQnZMkrs=;
        b=cMpGIyxqbLJi7fR6SCKfBVoO+qlVjw0DlfoImR0fM6fm2EKHeOsofU/7Gm62sr4/au
         EypRjXsKng8ovByIqlzR/otfXCSDfc15nY21HpG7uS5kJMoUOPAGxnRiVRKlaqlxFfm3
         P+fSkbu7LWakDyFIdy2iTq3PO2OuiEUf+h5lQBP2XBXxvvdCDMeqZ7OeGQljbyJfp5YJ
         Ku7pJr2DkhDSuH+5bEMj8KOL5eH9z8az7y7HapqNGQUE/skxyzuMDjWL3C9ewanYiPnK
         A238WeZzc4jCjtoEmPC5IW17RcMuqKLRyAU3qRQX76EyBaSlO9L+VaNC3hFovUkprlIJ
         ttyg==
X-Gm-Message-State: AC+VfDxBt8OvsKrJFc/ObNnfV2UH6oAST6zBexuJfnz12qDV9bZUmzAp
	GRvE4GdMam2yQSVHRu9978N/EBx2N3xD8zuCZwdwtQ==
X-Google-Smtp-Source: ACHHUZ6N23tfSeeo8xT7kBvfb+4Ec+L/vIFV69z/mRaXynHxks655SSCUUfWh5dwe80IlKS4/U0UT7reGK8Q9Oae038=
X-Received: by 2002:a67:f657:0:b0:43d:c3d8:b09c with SMTP id
 u23-20020a67f657000000b0043dc3d8b09cmr2265900vso.13.1687168678757; Mon, 19
 Jun 2023 02:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Jun 2023 15:27:47 +0530
Message-ID: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>
Subject: next: arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared
 function  'arch_atomic_long_fetch_or'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following build regressions noticed on Linux next-20230619.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on riscv:

 - build/rv32-clang-16-lkftconfig
 - build/rv32-clang-16-tinyconfig
 - build/rv32-clang-nightly-defconfig
 - build/rv32-clang-16-allnoconfig
 - build/gcc-12-defconfig
 - build/gcc-11-lkftconfig
 - build/clang-16-lkftconfig
 - build/rv32-clang-16-defconfig
 - build/gcc-8-defconfig
 - build/rv32-gcc-11-lkftconfig
 - build/clang-16-defconfig
 - build/rv32-clang-nightly-allnoconfig
 - build/rv32-clang-nightly-tinyconfig
 - build/clang-nightly-defconfig


arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function
 'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit
    function declarations [-Wimplicit-function-declaration]
        return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
               ^
arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_fetch_or'?
include/linux/atomic/atomic-long.h:1087:1: note:
'raw_atomic_long_fetch_or' declared here
raw_atomic_long_fetch_or(long i, atomic_long_t *v)
^
1 error generated.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/details/

Steps to reproduce:
# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch riscv --toolchain clang-16
--kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
