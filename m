Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7256FBE
	for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 13:48:06 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-79aeb0a4665so943599241.1
        for <llvm@lists.linux.dev>; Mon, 21 Aug 2023 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692625684; x=1693230484;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jLB+9REAygYY0DOuwfBq/jxAg+N5aJcW36e9CeI5Mwo=;
        b=x/n3TBl+cj7w/o3N8b3V2L6LF5VESVaz1Xd7sOEF3etaG0J5JiDWG9qHfQX+0EsDGY
         gYn1VMPMXIpZnlRlhBVpR0O7QM+p+zEyMvRmSKyXfj8/Gr9wt54zuwipPo9yDYW/c4Hp
         eEz2AyojrFI7xuATX8bTAD/AZIRnlLaOD0L86CMWmFV5jD3EtQHF16sPLFzQX83KWAad
         t17/FJwFzTdykbYjwEFSa6UcEKzjm7GWfNFjpFJZJK7Du0g1W/3bGkeq5Aq9f/C7usTR
         9UtQAnW0+ZqgHbzNTbiHT4gJBAFHg307w3007gSDcF0BHfLuIdI8gcsPBSBGT/XF1omw
         cB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692625684; x=1693230484;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLB+9REAygYY0DOuwfBq/jxAg+N5aJcW36e9CeI5Mwo=;
        b=S6LbDOjQ0ewz9dwtYM4I6Vt1oDBWp1q2J1TpLtm/Wlt6rnzpAmqhDUVeTnCM5sdWRR
         g1HDkSH98ke/6G2B2G2AnTlFzhi+8WI4ZEis3PGS7LejuaJYD2rUxrTWvEcu1zXXbFlX
         AbmtpUycigPxPA1GgV+kxqbDLOWpfvOTWgumkIJDaxPgwJ9f0RP7gUYra3l0PxJovk5+
         sYU+dtcPmH6wJxSgPDQdq4q36fulvS/pDl+fzr9Z2FnKkNodpmhPU5TDbIQ0pZo00dlQ
         AOOFt3HenbHw3SOkE2apWbRUK4KmUsm5yD+ODC4zrwVCEWUpv8KRcm65qjPyrPrZhzaG
         Rg4g==
X-Gm-Message-State: AOJu0YxVCX1nLvzyXbdL8HomnyRUvd3iZwBn25tGYo4c4wTkb5poQ120
	a464mS+jM5Uu50TYq4R5MrUOOY0wgKVimDCOLE8UWCjfwt/pNiIJjgg=
X-Google-Smtp-Source: AGHT+IF9fvjUB+rS/XJKPseqYgUHXMa08uiTMMNhG1uODld2kPDyU4fq0bYuoaefzZZ92fcnfawvUwbvDXJB3QYeYHY=
X-Received: by 2002:a67:f1ce:0:b0:44d:50f8:f with SMTP id v14-20020a67f1ce000000b0044d50f8000fmr1793441vsm.17.1692625684430;
 Mon, 21 Aug 2023 06:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Aug 2023 19:17:53 +0530
Message-ID: <CA+G9fYt2PZd7Zj5ndPL+LBstGvoVwyCLpFucOY-7UNajvAqRLQ@mail.gmail.com>
Subject: clang: error: cannot specify -o when generating multiple output files
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Recently we have updated the toolchain clang-17 version.

While building selftests filesystems/binderfs, openat2, resctrl and x86
following warnings / errors noticed on the Linux next with clang-17.
But pass with gcc-13.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build logs:
========
binderfs_test
clang: error: cannot specify -o when generating multiple output files
...
openat2/openat2_test
clang: error: cannot specify -o when generating multiple output files
...
resctrl/resctrl_tests
clang: error: cannot specify -o when generating multiple output files
...
make[4]: Entering directory 'tools/testing/selftests/x86'
clang --target=x86_64-linux-gnu -fintegrated-as
-Werror=unknown-warning-option -Werror=ignored-optimization-argument
-Werror=option-ignored -Werror=unused-command-line-argument
--target=x86_64-linux-gnu -fintegrated-as -m64 -o
/home/tuxbuild/.cache/tuxmake/builds/1/build/kselftest/x86/single_step_syscall_64
-O2 -g -std=gnu99 -pthread -Wall -isystem
/home/tuxbuild/.cache/tuxmake/builds/1/build/usr/include -no-pie
-DCAN_BUILD_64 single_step_syscall.c helpers.h -lrt -ldl
clang: error: cannot specify -o when generating multiple output files
make[4]: *** [Makefile:78:
/home/tuxbuild/.cache/tuxmake/builds/1/build/kselftest/x86/single_step_syscall_64]
Error 1


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230821/testrun/19213760/suite/kselftest-x86/test/shardfile-x86/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230821/testrun/19213728/suite/kselftest-openat2/test/shardfile-openat2/details/
 -

Steps to reproduce:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/tuxmake_reproducer.sh

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2UHhSg0TPLhjp9Uq9EFceoQd0VL/config
LLVM=1 LLVM_IAS=1 debugkernel cpupower headers kernel kselftest
modules


--
Linaro LKFT
https://lkft.linaro.org
