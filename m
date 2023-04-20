Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9E5661
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 11:01:24 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id r10so1871084uat.6
        for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988483; x=1684580483;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9/krmrwSEL+NhwRErVEyJ99NsFitd2cJDfkllHsD/uM=;
        b=snFz9FcgJNGFQnSpVoFHu1+dHtbiF64/WO8BtxY/LR2Hrw/c+dITS3cGbHrCA8w0mp
         aaY9QiLMN9eLID591qSC5AXl3zJ533ZDXnhmNJ8xHiKh2GDuuqG8pCGoi3Nc0nYtyxjT
         jmNANCKY87CY6wuZA1sJgeUGQt3vLRObLyKxjo9ZJ0e1SibwRqsWOjpcEySFvPd92MBk
         2WKsPGMGruUM86PM+CxOFyBt+OOJ6tEOGvTNDZsYZhdHMPLPAD2ueuSvYqOYLq7XIUHn
         s4t5uE0LsVAAgz4bjwRzq4ReBpEGWUQYAGrtBOakq+i1VJxxQpTSt0CfJR+itdvu9sZ4
         yG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988483; x=1684580483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/krmrwSEL+NhwRErVEyJ99NsFitd2cJDfkllHsD/uM=;
        b=WUqAkltaCo0PE7CxVebTB/GruBlfl1lRG1WvbnZSYUQZ0O8nALIzwdLDcjTnc9zXNU
         8KvG7+9+CpQLQhRrhpW+A5d1popOhYpYhzsQM9YX76FfUKGfnhXbUu3s4Gh1m8W3S8or
         7WqhbfyA9utm1uFZZRE+qnERS6TTeOh6EX+AJnZPbH74sD/MonqJAFXmYwpKmXkiaGI2
         NDbVQaD+bXcIbz0FbmY5yYkdzHpuYuBcXcLGFWOSYgZU1BEx+fg4Sptx4/6Y/VL1rERc
         2zcAlqbWf2TMLmd3b5tEAu3MIybMJbQIyEeRCGjMw+ihRRpVO1z2U+VbfSm4cT4/fnz/
         UaaQ==
X-Gm-Message-State: AAQBX9dHATSOJK3qcypVj6R+hdsNDFLw+h0kRf9kTVW9v5FdzXmidgNW
	+xBu8gJvruJwn2Ma5EVB1636mpfjGIjELJUpi5hxvA==
X-Google-Smtp-Source: AKy350aynQMU4rqBVkT/HvHFUt9abSuGDscTBinD7vNfgD4VGkzFrpIlTakGszMHxO00jZ3rmdvHBbAoYTW5MPyHV8w=
X-Received: by 2002:a1f:5fc5:0:b0:43f:f4a3:7385 with SMTP id
 t188-20020a1f5fc5000000b0043ff4a37385mr498327vkb.7.1681988483260; Thu, 20 Apr
 2023 04:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Apr 2023 16:31:12 +0530
Message-ID: <CA+G9fYt+4e57Gdy6cix=LeNK6XqWoui8du=mZWu=cf8vPYocKw@mail.gmail.com>
Subject: next: mips: ERROR: modpost: Section mismatches detected.
To: linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	=?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on Linux next-20230419 for mips.

Regressions found on mips:
 - build/clang-nightly-allnoconfig
 - build/clang-16-allnoconfig
 - build/clang-16-tinyconfig
 - build/clang-nightly-tinyconfig


arch/mips/kernel/genex.S:520:2: warning: macro defined with named
parameters which are not used in macro body, possible positional
parameter found in body which will have no effect
 .macro __BUILD_verbose nexception
 ^
WARNING: modpost: vmlinux.o: section mismatch in reference: check_bugs
(section: .text) -> check_bugs32 (section: .init.text)
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[2]: *** [scripts/Makefile.modpost:136: vmlinux.symvers] Error 1
make[2]: *** Deleting file 'vmlinux.symvers'
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [Makefile:1978: modpost] Error 2


Build details:
---------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16367253/suite/build/test/clang-16-tinyconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16367253/suite/build/test/clang-16-tinyconfig/log


Steps to reproduce:
----------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch mips --toolchain clang-16
--kconfig tinyconfig LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org
