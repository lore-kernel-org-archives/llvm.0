Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2D5660
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 08:27:58 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-43b4c99e90bso718266137.2
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040078; x=1688632078;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5Wgtn8/rnttwldo7obcCR9XRckr5E/5NgOb/WDxxmk=;
        b=uYmXqLBUM6COwzxPGWhxC80Z4S5Ueyve4gOf03PfkM2pb9oYz57n+NZOpZoAfnDWGn
         uJzgQmKapRZYGWW2lt8wjB/owY8Qrk3wpSWiidDbo3pWTqdNgH/7WhjA1vtBYBL49mdl
         rgRzRlyvps7GN8UFd9wlsjv/pe39VwivjSSWYFeUULgdSg/BhRe6ZU7mRxb3msVeaop2
         0lyWfcVmM22umdTyAbBmdZrQhncxM5qvTKRIt9YYd+zSysDylXJ9uU9N6aPE8ZHizlSU
         HFeBPXcMNMBIzMcsvqwDudUSkTebD6cyg4yfFOajSTLWc2RCydKNHW9H4KfYc1Y9gcpR
         D0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040078; x=1688632078;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5Wgtn8/rnttwldo7obcCR9XRckr5E/5NgOb/WDxxmk=;
        b=G/5vQAnqL7NQR5lbgwS+bLNKXCneWG2NtEmD8/rEbZoMaXVjQ0CHHIGKO3G+oKsSt5
         TGaLl/p7sRPDkyJ9RyMIcOIK6OuaN7KTJrtDnC5NEg8zbhxxzIOWNg+ckw8fSdS3Lbm6
         6+LBqx3dtOdk7qHllTsgFte7LRIj/qS3/37SgggMzoLQ8mbJzFK4zc1rO6ZrNHerjO/a
         AMvR26NzwJ80IUO7hHK+lSkemAKOMqW6AOs/He5jw2CehOnknzcw/qU19WAnHXPjyrd7
         rwhzOnGFEUQlaQiKSD7OsWvRG0B6CXTgTbCJyc29bXn+YRfQjvwpXQ08/Z4LqPTRcI/q
         NVfA==
X-Gm-Message-State: AC+VfDwaj9scrcM1o0/xlRhsuvhmslHiwzRjSaFG8Kyc8XOUn5F36HOS
	vpzlhfgI/yfLLlEVNu4yGdye5E3vhvrDxjM/8gyVlw==
X-Google-Smtp-Source: ACHHUZ7FhlaYW8/uts+Qhj1091fZM7B1bAspzmTHZ2wmYJbOtdOEhf3V09FOQbaFNwAS3YHOZhWo06WEul9kKe8eXSw=
X-Received: by 2002:a67:f655:0:b0:437:d75e:1f3e with SMTP id
 u21-20020a67f655000000b00437d75e1f3emr781142vso.32.1686040077838; Tue, 06 Jun
 2023 01:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Jun 2023 13:57:46 +0530
Message-ID: <CA+G9fYs=koW9WardsTtora+nMgLR3raHz-LSLr58tgX4T5Mxag@mail.gmail.com>
Subject: powerpc: clang: arch/powerpc/kernel/exceptions-64s.S:2976: Error:
 junk at end of line: `0b01010'
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Linux next-20230606 powerpc build failed.

Regressions found on powerpc:

 - build/clang-16-maple_defconfig
 - build/clang-nightly-maple_defconfig
 - build/clang-16-defconfig
 - build/clang-nightly-defconfig
 - build/clang-nightly-cell_defconfig
 - build/clang-16-cell_defconfig

Boot:
=====
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc
 CROSS_COMPILE=powerpc64le-linux-gnu-
 HOSTCC=clang
 CC=clang
 LLVM=1
 LLVM_IAS=0
 LD=powerpc64le-linux-gnu-ld

arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
arch/powerpc/kernel/exceptions-64s.S:2976: Error: junk at end of line: `0b01010'
arch/powerpc/kernel/exceptions-64s.S:2996: Error: junk at end of line: `0b01010'
arch/powerpc/kernel/exceptions-64s.S:3011: Error: junk at end of line: `0b01010'
arch/powerpc/kernel/exceptions-64s.S:3029: Error: junk at end of line: `0b01010'
arch/powerpc/kernel/exceptions-64s.S:3049: Error: junk at end of line: `0b01010'
arch/powerpc/kernel/exceptions-64s.S:3096: Error: junk at end of line: `0b01010'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[4]: *** [scripts/Makefile.build:374: arch/powerpc/kernel/head_64.o] Error 1
arch/powerpc/kernel/entry_64.S: Assembler messages:
arch/powerpc/kernel/entry_64.S:174: Error: junk at end of line: `0b01010'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[4]: *** [scripts/Makefile.build:374:
arch/powerpc/kernel/entry_64.o] Error 1
make[4]: Target 'arch/powerpc/kernel/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:494: arch/powerpc/kernel] Error 2
arch/powerpc/lib/copyuser_power7.S: Assembler messages:
arch/powerpc/lib/copyuser_power7.S:305: Error: junk at end of line: `0b01000'
arch/powerpc/lib/copyuser_power7.S:306: Error: junk at end of line: `0b01010'
arch/powerpc/lib/copyuser_power7.S:308: Error: junk at end of line: `0b01000'
arch/powerpc/lib/copyuser_power7.S:309: Error: junk at end of line: `0b01010'
arch/powerpc/lib/copyuser_power7.S:311: Error: junk at end of line: `0b01010'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[4]: *** [scripts/Makefile.build:374:
arch/powerpc/lib/copyuser_power7.o] Error 1
arch/powerpc/lib/copypage_power7.S: Assembler messages:
arch/powerpc/lib/copypage_power7.S:34: Error: junk at end of line: `0b01000'
arch/powerpc/lib/copypage_power7.S:35: Error: junk at end of line: `0b01010'
arch/powerpc/lib/copypage_power7.S:37: Error: junk at end of line: `0b01000'
arch/powerpc/lib/copypage_power7.S:38: Error: junk at end of line: `0b01010'
arch/powerpc/lib/copypage_power7.S:40: Error: junk at end of line: `0b01010'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[4]: *** [scripts/Makefile.build:374:
arch/powerpc/lib/copypage_power7.o] Error 1
arch/powerpc/lib/memcpy_power7.S: Assembler messages:
arch/powerpc/lib/memcpy_power7.S:250: Error: junk at end of line: `0b01000'
arch/powerpc/lib/memcpy_power7.S:251: Error: junk at end of line: `0b01010'
arch/powerpc/lib/memcpy_power7.S:252: Error: junk at end of line: `0b01000'
arch/powerpc/lib/memcpy_power7.S:253: Error: junk at end of line: `0b01010'
arch/powerpc/lib/memcpy_power7.S:255: Error: junk at end of line: `0b01010'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[4]: *** [scripts/Makefile.build:374:
arch/powerpc/lib/memcpy_power7.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
