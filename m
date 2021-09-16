Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3C3FCF
	for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 13:45:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z94so16927472ede.8
        for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CuDRdf94nh8ahjQ5dmyXV/DzX/ticPqZna0IdhNsx6Q=;
        b=ADlDcoNU+Pq3zJPekjQB3ysBZYbLLJuUjJ0ggyxhUh3l23WhDHJe0OA+3RBtzvkLaL
         riKiVAfTySYt7i2AR2nqJB8DLrqNkOgNwLurMZigXK4t+R7mbfoODaIwPAdzybFwqtEi
         gXQ22RCFm0BiOMDooVh7HlhtBZFIMazSE0MKMd13qNUS/sNT9eY3iTLcMAjr7NfoIliB
         4f/2yr52oLIGism7T/kYSqcj939z5RDHf+++H/V4rCx1OW592Ruc66LP4q1F+Ee+DLTT
         VEtTfea+tQb0+IjeGPGFECmdRDfTDBReWeg2IoShmQZn6bQ3QghRejQq+VwEunRt/Yi7
         fzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CuDRdf94nh8ahjQ5dmyXV/DzX/ticPqZna0IdhNsx6Q=;
        b=RrrJBgBk/HRyWtf0UUb7yaB1Okf+GV6J7TOFttbShaomt+9ThHMnwk8VP+Y2M6+J9N
         G3hvil1tij6S1pqxAMQ4yYeot3fgrURY16Y9TO2D6HXhLYiBHOa6Ej2jeLBB0irJ87aH
         BDcYcjf6C7OObT88S6lhPQtDM7KOUfEQwDx1HSxu2cl0U1zNJ+dcFUw7glnecBWSrJ+h
         jlyv6t05MJkEvqyAto1K3Tb8XlpkAIP5JSBb92w82WTDMuMHoYcqo6H+sxNY9guX9nRA
         p3SVVPcjI3Oth9pKImbNuOg9IkJH5O+FsRgjCkTaYiJhzVllcTYDI4eiUuJWSSSAxQdT
         dZNA==
X-Gm-Message-State: AOAM533z36X36lXExUo8aaOnig1/MWdY93e86cHIWsfmz6Zgf4RUhkMX
	YmD4bnotQ98i3puv6a4gsFIb+4C5txJp/edj8oFzxw==
X-Google-Smtp-Source: ABdhPJyQ45IBx7Fabd36aGEldKbrPCgbXM1LoYtPS7imQxgxjPnIvGFFB6GTQUFW83uB9WNBMYIHCUSQlhUI0RZc9VE=
X-Received: by 2002:aa7:dcd0:: with SMTP id w16mr6605186edu.288.1631799916008;
 Thu, 16 Sep 2021 06:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 16 Sep 2021 19:15:04 +0530
Message-ID: <CA+G9fYu0dngeohP9M39Odj5-5ax97ZgA=KqV8_g2yYLdOGMQSg@mail.gmail.com>
Subject: clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'
To: open list <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

Following build warnings/ errors noticed while building linux next-20210916
with clang-10, clang-11 and clang-12  for arm architecture.
      - allnoconfig
      - tinyconfig

But builds PASS with clang-13.

clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'
make[2]: *** [/builds/linux/scripts/Makefile.build:288:
scripts/mod/empty.o] Error 1
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1329: prepare0] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.

Build config:
https://builds.tuxbuild.com/1yDgHTBClkDVAW6MLcYwAdsXznO/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
--------------
    git_describe: next-20210916
    git_ref: master
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 368847b165bbfbdcf0bd4c96b167893dcdb13aba
    git_short_log: 368847b165bb (\"Add linux-next specific files for 20210916\")
    kconfig: [
        allnoconfig
    ],
    kernel_version: 5.14.0
    target_arch: arm
    toolchain: clang-12

Steps to reproduce:
tuxmake --runtime podman --target-arch arm --toolchain clang-12
--kconfig allnoconfig

--
Linaro LKFT
https://lkft.linaro.org
