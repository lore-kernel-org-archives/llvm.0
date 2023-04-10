Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D010179
	for <llvm@lists.linux.dev>; Mon, 10 Apr 2023 08:34:06 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id v1so3885676vsg.5
        for <llvm@lists.linux.dev>; Mon, 10 Apr 2023 01:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681115645;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2y6ZF+9oOUd5xpzsnYpA/WWQqIIRWLv0YQ7yeTEnMFI=;
        b=LdEWgyWN5oc0YneShy1GFV80BlXsRdVOLVGntL5QZXzKMJw00sGV6ud9nsoaXXALAh
         cTmQqVYMpMbj4O5enPJ+sdLzx04GlcbnFQ7A4Y8ZdjE/zMCVXR/wx3VNYPdOA3I1a9u6
         gXJ+OS3XX7+U7bsGiyv18KMphV1RkqDfpLstm0he3r3C52LEX+D8AZ6vd+TZg2Q4XtY1
         89+zZuDkuCCof2vKmYOkcWlaffVjkZhwZYf30NkAQYz8bStQKxi+HIhY/QgSww+k3w2q
         4mrYA+nAeaNKkDeRQhzLbfhYioXJL3DOQXj1GVLFIe2fNUCwffmqk/lndEBUH2qxcdrX
         Uakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681115645;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2y6ZF+9oOUd5xpzsnYpA/WWQqIIRWLv0YQ7yeTEnMFI=;
        b=v6bYvc+1QbblIjR3kcb/3cj6ihPKUR2nnTM6P/p/wC+/KDraUiPg7siI9elyBkNGg2
         IMH+iOm0D/m350NMeNksV4POFdzsOrNa/VmdJWoHia4Uc4LDjBAj8/kkx24EMUsso0Cd
         Xts9RCmCi+wxC9iGzLwUUdQtWVz0OxxSYz2w2Y7ph8U8IA8utBwvFPBfDplb5Uu9ii3W
         q2jU0j/meKPZXkXEMcxOy7lYAPLDC89yoqCOEsQKqYcDgwM8AHFeqUN+HGdOqYOrLJF6
         ZHbCws0dhp45SF1Ur4kcst5OGtIVR26DEs2JTC5iBXRix82MLXrodNCfBl+/oEmctEp9
         IvnA==
X-Gm-Message-State: AAQBX9cA+7ER5bqiLK2PltKyJlU3qQOv8RkYSv3hdQv1L24/V6uSPeBd
	JC9O2qptJWIl2xqk8hcFvhXA6T9p0VPQ+vdu7YmcB7V3YQ5n8oJMZ4o=
X-Google-Smtp-Source: AKy350bncSFZcosjHjqQnOjeQEFT8SwcKqwSa3FsXW6R4FbtxDmAmfupWPWLtksuGhZxRt1waKe0plT2W9g0MedZecc=
X-Received: by 2002:a67:c38a:0:b0:425:e623:360a with SMTP id
 s10-20020a67c38a000000b00425e623360amr5739468vsj.1.1681115644735; Mon, 10 Apr
 2023 01:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 10 Apr 2023 14:03:53 +0530
Message-ID: <CA+G9fYs9jB7V2QFBKy3WbMkGKqWSrE7iUq_t2QqCDLetws-bjg@mail.gmail.com>
Subject: next: MIPS: clang-16: tinyconfig: error: unknown target CPU 'r4600'
To: llvm@lists.linux.dev, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

MIPS clang-16 tinyconfig build failed on Linux next-20230410.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' LLVM=1 LLVM_IAS=1

error: unknown target CPU 'r4600'
note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
error: unknown target CPU 'r4600'
note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
error: unknown target CPU 'r4600'
note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
error: unknown target CPU 'r4600'
note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5,
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2,
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
make[2]: *** [/builds/linux/scripts/Makefile.build:114:
scripts/mod/devicetable-offsets.s] Error 1
make[2]: *** [/builds/linux/scripts/Makefile.build:252:
scripts/mod/empty.o] Error 1


Build history:
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230406/testrun/16119585/suite/build/test/clang-16-tinyconfig/history/
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230406/testrun/16119585/suite/build/tests/


--
Linaro LKFT
https://lkft.linaro.org
