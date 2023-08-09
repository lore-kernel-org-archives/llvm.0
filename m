Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF03C3F
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 06:10:37 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-487442d5e49so1152655e0c.2
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 23:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691561436; x=1692166236;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mAP9otYoZYL8YVLuWJKzImaXjIZONyavkjX0Z16iqXY=;
        b=VoMQY5MEGvQW2Sn/BZ5I36Q43MTSQJxZ50OV0+ZTJm9o334hTJhreqhtyArCOvf+ql
         nsOIdVQiVYFZq6oZuyVgLs5SKJHVqmUAS47E4VBFaEMeiO3D61x0Gm/390dLmBFhr07W
         xegLe5kDktSNAfK3CiTE7aGO9BK0z7ChnIrd3anI6+zoQg6UWRqd+YP/MrWnvOUhbYFh
         BGYPLZjjH8Yf+2ms3SPvATW2rgviC7WB1mfKOQ+juamSNd/yv5zJoHdvorrcuzl9QKNZ
         cBLMKwShA9JfmNTNSEEi5DfwaACMtlK+YGRUSGib8rvz7KWck9ZarvpM6uCYmxbBP54P
         sVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691561436; x=1692166236;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAP9otYoZYL8YVLuWJKzImaXjIZONyavkjX0Z16iqXY=;
        b=A4vIqRvHufx85hrwQVnNpO/Q4vkz8Y3BBR77W/6+8QP16VA3E+9v7J02h3ajutIIaA
         CULCNS9PQ1IzqsIkRDLdB4UdXpejsnTvxdgcCb55i48Rxpz7gctmvcpSsLuEgNgKN+D5
         6fJxPvz+50T/KkeW/Zo4RXW2G4VgASzyhsXnYSM11WxQVZB/U6mwx5GoaOX3KSwUhqO/
         d7D9bFktJt0ZNDuj+WdAZTvRZDaFHC+S0izX1ImTBZoE458vvTh2re22PP+g+Dd5kuOM
         8jSvVQJFnPeaaPd8KO8TavlbiorsxBP1wLIQXK40tJXkkRtOdtWGKm3jymG2/5Wxo0K3
         jFNw==
X-Gm-Message-State: AOJu0YxkAQDHkmzY3Fq+nyZCqZXEZZMgHll6yKpZJzJ2uKD1JeDEGXur
	0BTuV+X/Nyc3OYEr7bjxwLchd/zqwAn48goTXpj/UQ==
X-Google-Smtp-Source: AGHT+IGUl+i/1/CdpjinWSQdAsLpUdl2TKLEZq9C9bwE+t8Y+Xo96mKeRxzjQKfhZ8oZrQH+wMoiiLtEhpP9+2JealY=
X-Received: by 2002:a67:ce0a:0:b0:445:2154:746b with SMTP id
 s10-20020a67ce0a000000b004452154746bmr2095474vsl.4.1691561436268; Tue, 08 Aug
 2023 23:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Aug 2023 11:40:25 +0530
Message-ID: <CA+G9fYsdUeNu-gwbs0+T6XHi4hYYk=Y9725-wFhZ7gJMspLDRA@mail.gmail.com>
Subject: ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side
 of the expression must be absolute
To: linux-stable <stable@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

While building Linux stable rc 6.1 x86_64 with clang-17 failed due to
following warnings / errors.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/2/build ARCH=x86_64 SRCARCH=x86
CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' LLVM=1 LLVM_IAS=1

arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement:
unexpected end of section
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
the expression must be absolute
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
the expression must be absolute
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
the expression must be absolute
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
the expression must be absolute
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:191: at least one side of
the expression must be absolute
ld.lld: error: ./arch/x86/kernel/vmlinux.lds:192: at least one side of
the expression must be absolute
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[2]: Target '__default' not remade because of errors.
make[1]: *** [Makefile:1255: vmlinux] Error 2


Build links,
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.44-117-g74848b090997/testrun/18917095/suite/build/test/clang-lkftconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y/build/v6.1.44-117-g74848b090997/testrun/18917095/suite/build/test/clang-lkftconfig/history/

Steps to reproduce:
  tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/config
LLVM=1 LLVM_IAS=1
  https://storage.tuxsuite.com/public/linaro/lkft/builds/2TiTUgExGs7SrTm9Lb4fakgeTfw/tuxmake_reproducer.sh


--
Linaro LKFT
https://lkft.linaro.org
