Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF75258
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 13:55:01 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-796d78b3f68so882794241.0
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692626100; x=1693230900;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F0BIwaProopNZhstbg9lTsI04/iv8W4aYXrom5pRfgU=;
        b=p2UhUdFkBPNSM+ZwAjfOpSAie2xqFBZ5JS5ZOHEaRTOCJAVwP+JKYbKvuzzcmlZYnz
         ZQTiKHY5oyTPCq4Q5nubkYQkwFsSO/MpG6chqdtuKxeQ2oh3SbPQgQHzs7Gf5dCKOVLb
         Ii4gk5NUCq4pDQ6NrzDPeRk3ACnkf2DCWMWfKs7Kbe+6Cx0MTOFPPPMMrf3JAW4PUN2W
         /7yFJ/BPpBH94/mUuWbKtHyTkGkOZODIokMGTHm2FcVKEoqsOUL5ZH2xuMVirsdAIkrM
         iFyqrH4ZDTYTMgycgX7HihtLJuja0dLw4FGjmdHUMfj7PVqL2GvPbwNibZ3MhbFsXqtk
         Fc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692626100; x=1693230900;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0BIwaProopNZhstbg9lTsI04/iv8W4aYXrom5pRfgU=;
        b=XLZieKSzmESZqVCke++DoNub0vrqsPN6TAbGINgpovWHFWSmBeLYly8Nq24K3Y9I2F
         +eMc/S5Uy2OqEk6MaoazET76iRXpb1ScWbZDY0UqQCREU6EN5S//s2c9E4tcG++GJ9N6
         pZ64cLFflRtOosyuXBIjP9cIeLrTl45pORXG0WF3zW+H0BuCKMnwcXj/jhaLjs+RmEuZ
         KmkdFE49AHMscsZXI0kCzw/pL2Z0zIoF77y0q3hJs5n8cz56dF8xjd31Cx5pehc32M+o
         BKD+AiHA4TE5nTCFvSxSxOLw/5v6IB9cVHvN2kFKYIGlm8FRzh86hpGmnvTwosABRK81
         ztnw==
X-Gm-Message-State: AOJu0Yx7mlFTRUUrh9qSVOUNuiOUEaxec08PY180+nv3hFGfexEaZHcz
	Cb/+eKisBw1i0Jl5QhU2lcKW42xsTj+gE4o4/a0c9G0Kv8rNb3sKPVA=
X-Google-Smtp-Source: AGHT+IE3+XppUv1Ml0JhYni/I5RGW+uUuJuIpJ/WchgYXbES0F/6QnjcqqyZzmPd+zJHTWzUr2H6bIT0YLWulKqbkmY=
X-Received: by 2002:a05:6102:3165:b0:443:5ec3:55da with SMTP id
 l5-20020a056102316500b004435ec355damr4877341vsm.15.1692626100448; Mon, 21 Aug
 2023 06:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Aug 2023 19:24:49 +0530
Message-ID: <CA+G9fYuwQ13KhSxYS3wVpB2vU-wtfiFYzCvM5r=tog3am6--Lg@mail.gmail.com>
Subject: clang-17: selftests: exec/load_address_4096 clang: error: argument
 unused during compilation: '-pie' [-Werror,-Wunused-command-line-argument]
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Recently we have updated the toolchain clang-17 version.

While building selftests exec following warnings / errors noticed on the
Linux next with clang-17. But pass with gcc-13.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

exec/load_address_4096
clang: error: argument unused during compilation: '-pie'
[-Werror,-Wunused-command-line-argument]


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230821/testrun/19213758/suite/kselftest-exec/test/shardfile-exec/details/

Steps to reproduce:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/tuxmake_reproducer.sh

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/config
LLVM=1 LLVM_IAS=1 debugkernel cpupower headers kernel kselftest
modules


--
Linaro LKFT
https://lkft.linaro.org
