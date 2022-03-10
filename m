Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFAD7A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 11:37:49 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id l2so10263178ybe.8
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=1ziSuPMzYNAw8eT+iBfN5WM2hFNCKf7IS7RFWaVxPlg=;
        b=ba8/6TOQ+hGmIeTYsQ6ojj2JBVlxNbrThk3McB+mMlo48TRziTO1ei4nh8wKenWuZ/
         lt7Dpyww+cpYm4aeKTTnJpxvpUXKaTEXJ08x4JkUKrFFZqSEhPRiGKmgzZ3BI65+uW2k
         thDlndn1Qt70mJ1l63wW/vWAenB67L2+FyXfLTARv7lmWrYxJQ+uXfa+v9Qztlm1p0bX
         9jKSqFinWTLMVDCTMCiKjgdUZU2x6DI5VBynij+OtCxAwMYMHr61JDseNwpJjIlmjMJh
         eSo1sQSn3cNYI7UbJsS6J7+oOlukXH/vGxTTSCEdTvZqvZo1VWkbLOeQW5wg29GppWnG
         3M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=1ziSuPMzYNAw8eT+iBfN5WM2hFNCKf7IS7RFWaVxPlg=;
        b=PIYVT1M/U+alGldLM1R0reenLbnE1//s8TaG7iqNMg3F6r+YW14PiEnDEtmi6VPDYf
         H/wCwV88r1lXkNpxuwW8Y0nt2fF3VipigoG1vRXWmRg8Ba4A4cm/P/i1gAxLb4nKnCLv
         82E3Em712+S3zBi/4bxnGxTWngVBWQl7SXp5Rfg/7h/Ut2+mYELGY1Vrg1+ZLvEvAILK
         BXuRwwzcof4xvqfgI/HpBfXrQoEQcxUDXtMSpCpoN3z5c3Be0Ng9XYaXR1n4HI6GaukI
         E/cn0bxysGct5UT5wV1kHjhNUsbYtgC/DioiWh496IcxZery9Ua7ecOmTanQYd/KdA89
         5BYw==
X-Gm-Message-State: AOAM533Me8PHxwFtbraO9u9kBlnDUTRMcxTvgcNwCYLIBd6o6dxmvozF
	BbCvtwHikQCvFNLFuXaRTU1nRbfSFb0qzIRhi0MAkA==
X-Google-Smtp-Source: ABdhPJxjhA4KF95Phht4rOAHa4GEkQ+TbVYtbU348Hj9PBYLNJOVYP54qb9DxrOcA9Y52tkAu1hFeD+l7r+aAwisBmw=
X-Received: by 2002:a25:9909:0:b0:624:57e:d919 with SMTP id
 z9-20020a259909000000b00624057ed919mr3599420ybn.494.1646912267954; Thu, 10
 Mar 2022 03:37:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Mar 2022 17:07:36 +0530
Message-ID: <CA+G9fYsz7+Ooc8L-Dpfjp6mMDdw43=SjqiE0ryABy3t6qEzRoQ@mail.gmail.com>
Subject: [next] ld.lld: error: ./arch/arm/kernel/vmlinux.lds:34: AT expected,
 but got NOCROSSREFS
To: clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linux next-20220310 arm clang builds failed due to following errors/warning=
s.

metadata:
    git_describe: next-20220310
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 71941773e143369a73c9c4a3b62fbb60736a1182
    git_short_log: 71941773e143 (\Add linux-next specific files for 2022031=
0\)
    target_arch: arm
    toolchain: clang-14
    Kconfig: https://builds.tuxbuild.com/26BmBgHzW9MFZ3R0kIwL0Ce2r09/config

make --silent --keep-going --jobs=3D8
O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=3D1 LLVM_IAS=3D1
ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- 'HOSTCC=3Dsccache clang'
'CC=3Dsccache clang'
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
clang: warning: argument unused during compilation: '-march=3Darmv7-a'
[-Wunused-command-line-argument]
ld.lld: error: ./arch/arm/kernel/vmlinux.lds:34: AT expected, but got
NOCROSSREFS
>>>  __vectors_lma =3D .; OVERLAY 0xffff0000 : NOCROSSREFS AT(__vectors_lma=
) { .vectors { *(.vectors) } .vectors.bhb.loop8 { *(.vectors.bhb.loop8) } .=
vectors.bhb.bpiall { *(.vectors.bhb.bpiall) } } __vectors_start =3D LOADADD=
R(.vectors); __vectors_end =3D LOADADDR(.vectors) + SIZEOF(.vectors); __vec=
tors_bhb_loop8_start =3D LOADADDR(.vectors.bhb.loop8); __vectors_bhb_loop8_=
end =3D LOADADDR(.vectors.bhb.loop8) + SIZEOF(.vectors.bhb.loop8); __vector=
s_bhb_bpiall_start =3D LOADADDR(.vectors.bhb.bpiall); __vectors_bhb_bpiall_=
end =3D LOADADDR(.vectors.bhb.bpiall) + SIZEOF(.vectors.bhb.bpiall); . =3D =
__vectors_lma + SIZEOF(.vectors) + SIZEOF(.vectors.bhb.loop8) + SIZEOF(.vec=
tors.bhb.bpiall); __stubs_lma =3D .; .stubs ADDR(.vectors) + 0x1000 : AT(__=
stubs_lma) { *(.stubs) } __stubs_start =3D LOADADDR(.stubs); __stubs_end =
=3D LOADADDR(.stubs) + SIZEOF(.stubs); . =3D __stubs_lma + SIZEOF(.stubs); =
PROVIDE(vector_fiq_offset =3D vector_fiq - ADDR(.vectors));
>>>                                          ^
make[1]: *** [/builds/linux/Makefile:1225: vmlinux] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link [1]

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/26BmBgHzW9MFZ3R0kIwL0Ce2r09/
