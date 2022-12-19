Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763446AB
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 15:17:45 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id c26so2152840uak.5
        for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 07:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hzg9lEbdoeIi95HGge8FIicgyWxpuv5ofad+2T9Oo+w=;
        b=vf+EdVAqFRrbZV6gfZgTJTQZFxIIxxcX/kzR2qP1xzXQ0BvyLOHyhqcm0TZ8Sd/k9u
         zmWHDKo7VDm/fHJ88Yxwmmw0sVCY9N9KsiHYMwsA5rnIE6hfTKNyDnY4bTbZyOHSywQ0
         sD6gdp+RW+TEyLMYAvxibdK/BRYuYKWrPXjrsijq0gsiI7K1aPLTeviNrOgT+VzHzCC1
         HnL/qb9SSb7sbztMpCgnCWcI2Y6DZ0iJNT9IWpys9BF0HZQ0ZXIamagLlTFXiwE4ortf
         hH1FQSusn8bqh14f2/uLxL5kItJp7e3OMa7J6ZAIPsYcHEStyeoQyWrFGK/t1nMX2ZpX
         Eukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hzg9lEbdoeIi95HGge8FIicgyWxpuv5ofad+2T9Oo+w=;
        b=mbLFiZXoSmKi4HLraNMMJL7wI5FRcJXWEx3tCjNdMVjF6OmhRLQje7oKGmYHnTZlBE
         0K+fVeQJwUsGJ+dLZUNNvyyrpNpDhLcT2vp5X7wHksT6XnXun6izW9GeB9B1m2/YzANd
         W2aNjI4MrncE+n6yJBmVpCudgSgGqlx/O+tyAPfEfNtChJ65gRpUwi2kZ5WaEMFDZzzb
         berBB+rNDNMk4bkF52OU3mLHctidaKvCCWQP+ChEJqdKgmqE3epDQRQCTo7RcKPu9mQK
         2Y5Nx/Ki+TNr/qkLK0BELE70W97yRxZIPxGX8Adm9si1nMXGJnh4QvyMmLna2URbtux6
         UfpA==
X-Gm-Message-State: ANoB5pnTtYjqpn84JeimpDMQMaEzQBWHV38bN994UfiyGJEtIiIzrh4x
	JINPS/pTu7GQa3IfomnldGvSBbSNzOfzHRIScpet5g==
X-Google-Smtp-Source: AA0mqf5MLDW8jZ95Id9Fy4LwMIM44AGn9kHCeWhushX2D+H1XHrWeoYu94ghiY/VR5EVuElL/fPp0ny1hXipMlmzOmw=
X-Received: by 2002:a9f:3588:0:b0:418:7beb:6f42 with SMTP id
 t8-20020a9f3588000000b004187beb6f42mr51439847uad.92.1671463064068; Mon, 19
 Dec 2022 07:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Dec 2022 20:47:32 +0530
Message-ID: <CA+G9fYs=G_AAbkNOfLv7Oyvt6uOZ8CYun8fUQ-GghoKtbD5WAw@mail.gmail.com>
Subject: Linux-stable-rc/ queue_5.10
To: linux-stable <stable@vger.kernel.org>, llvm@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

The MIPS tinyconfig with clang nightly  build failed,

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build warnings / errors,
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=0
ARCH=mips CROSS_COMPILE=mips-linux-gnu- HOSTCC=clang CC=clang
tinyconfig

/tmp/calibrate-9ea8cf.s: Assembler messages:
/tmp/calibrate-9ea8cf.s:134: Error: .module is not permitted after
generating code
/tmp/calibrate-9ea8cf.s:168: Error: .module is not permitted after
generating code
/tmp/calibrate-9ea8cf.s:192: Error: .module is not permitted after
generating code
/tmp/calibrate-9ea8cf.s:216: Error: .module is not permitted after
generating code
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[2]: *** [/builds/linux/scripts/Makefile.build:286:
init/calibrate.o] Error 1

Build link,
https://storage.tuxsuite.com/public/linaro/lkft/builds/2J8KYpCyqe9C5esb4CrLQjCT3SN/

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch mips --toolchain
clang-nightly --kconfig tinyconfig LLVM=1 LLVM_IAS=0

tuxmake --runtime podman --target-arch mips --toolchain clang-nightly
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2J8KYpCyqe9C5esb4CrLQjCT3SN/config
LLVM=1 LLVM_IAS=0

--
Linaro LKFT
https://lkft.linaro.org
