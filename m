Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03427C
	for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 08:03:59 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id u3so3533638uae.0
        for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 00:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PNYkARzuB34wGIN0FXri01x9300XgMbu5x0Pmjr/CQQ=;
        b=ZFwfrdYa0x3oVmK8wAwJwZEQ6bfeSt6sPkEebSJ3aeWDHK20C12F9Cg6SpvtYTCySv
         l7kHrsWTUbukj4TeJWaHdG0rL5c7KTRAJF0E5/8TBp52AGmX6Q23uw5ubXxp+60LRNzF
         2dVyfKC5LaZQX1YXu6F2xcoPSTJwezwQDRhvm5s52K++H33NdBk5HT9/jH6GR/wEYw89
         kajzzbrycfA+MJU6I/OI0FwyCD7fkW7F/RSezHyekk7Pf+K85PrY/VbSYXAMsbvtFfSb
         5CWlckPIb65HA6cJ0pkJ5YeMuDkf25Tga3pv85yHkhVVITU21OLUsNJ23LBP9v1Fx0UX
         URlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNYkARzuB34wGIN0FXri01x9300XgMbu5x0Pmjr/CQQ=;
        b=652wXEOG1+b5CNkM3ZTE/vn1enaaqf7mqm1c9luklu9yiacaRboacGJ9SkTNM8U/kH
         rMSlRM3ntdbLqqQVLY0FwtBwG9ebL5XhqFYcxyjXWIstLoaac/6ecG0Lpx3OQZjUAORu
         IH2G/ewaC8dVCLfNZxvsdHSkucmWD0mvo0LtgY0Yu5lwBiN3z9CJi20P+OvjEdwqEU+2
         c7h2xpFHSol3PsDexpWtU5dgftJ0C/+CGsMZteRvIqXmj1qIeee3ycwsTPyo4ysuGS8+
         8HujawO3b8VXjyzAySWgc4Sud3pyf7WCtmiijp8FwN/8dDxsM2oag4PlXUfoBPIHTjxp
         ZNfw==
X-Gm-Message-State: AO0yUKU6smDZwhAs4xfbZdXD+Cp2w6UURC3eVAIFHExgIN2swtSUfHbh
	TfIyQltbujClGW/ZyoJY6Xb6CjdfhpjAI/uik7ehN1dqG3NGs22U
X-Google-Smtp-Source: AK7set/1U9MWDTtXI1DL19jQzexGM++DfeMO3ZdAjqyOjq4nkqXVrUcLUJ08Sde4LDImUu1xly3yZhLSpNxWf3hucNc=
X-Received: by 2002:ab0:5611:0:b0:654:8b24:60a9 with SMTP id
 y17-20020ab05611000000b006548b2460a9mr50820uaa.59.1674547438462; Tue, 24 Jan
 2023 00:03:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jan 2023 13:33:47 +0530
Message-ID: <CA+G9fYs+4eAn52jW8vPd5dv2e4fj3rQGrDnp6YUrmsF_ThJiqA@mail.gmail.com>
Subject: next-20230124: x86: clang builds failed
To: open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Results from Linaro=E2=80=99s test farm.
Regressions on x86_64, and i386.

Regressions found on x86_64:

    - build/clang-15-lkftconfig-kcsan
    - build/clang-15-lkftconfig
    - build/clang-nightly-x86_64_defconfig
    - build/clang-15-x86_64_defconfig
    - build/clang-nightly-lkftconfig
    - build/clang-15-lkftconfig-compat
    - build/clang-lkftconfig

Regressions found on i386:

    - build/clang-15-defconfig
    - build/clang-15-lkftconfig
    - build/clang-nightly-defconfig
    - build/clang-nightly-lkftconfig
    - build/clang-lkftconfig


Build warnings and errors:
---------------------------
make --silent --keep-going --jobs=3D8
O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Dx86_64 SRCARCH=3Dx8=
6
CROSS_COMPILE=3Dx86_64-linux-gnu- 'HOSTCC=3Dsccache clang' 'CC=3Dsccache
clang' LLVM=3D1 LLVM_IAS=3D1
io_uring/io_uring.c:1240:3: error: variable 'count' is uninitialized
when used here [-Werror,-Wuninitialized]
                count +=3D handle_tw_list(node, &ctx, &uring_locked, &fake)=
;
                ^~~~~
io_uring/io_uring.c:1230:20: note: initialize the variable 'count' to
silence this warning
        unsigned int count;
                          ^
                           =3D 0
1 error generated.
make[3]: *** [scripts/Makefile.build:252: io_uring/io_uring.o] Error 1

Build log links,
https://storage.tuxsuite.com/public/linaro/lkft/builds/2Kl1NaLatrfZ40PLJVY0=
iCMUhz2/

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch x86_64 --toolchain clang-15
--kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-k=
ernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/=
meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/=
meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/=
meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/=
meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_IGB=3Dy --kconfig-add
CONFIG_UNWINDER_FRAME_POINTER=3Dy LLVM=3D1 LLVM_IAS=3D1

--
Linaro LKFT
https://lkft.linaro.org
