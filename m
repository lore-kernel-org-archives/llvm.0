Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9401390
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 09:00:29 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id v3so3251745vse.0
        for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 01:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676970028;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snrQn0Tlo0gQ0uyxV6hinZ9sS9jKVp6Wr9FYbxThYg0=;
        b=Ihnac5gfGHfOeKIQ6rEZ747/YTP2w/waPucMxpymT9yMA4q5aG/5WwANfn3AIGnxSG
         L0TBbDRH1Iz1xP3I2Ip0KkjxjJ3TmsoeCBstrVs6DtpCf9VeCxhNr3fjIjkVf8N7E6Z+
         rrnCykcs5UxfoLJ6+ljrRqGjd4nWN0g4klu6u3heskV2b1v4BQoiV9aDetD5y2YR2H8U
         eI9cBVXZeCi4Kb/JLeCv3OwstOTqNN6vg5zKFyxS1ibf+2cAiWLRb5aVi4Nud3aFPhKm
         ZwU74tNe2xcAlRVdDtyd4xCwRqrRbKLE9yN9ftJ6F3FegpXAU3Tk0vDR0mCeNIyR9Jyn
         /h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676970028;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snrQn0Tlo0gQ0uyxV6hinZ9sS9jKVp6Wr9FYbxThYg0=;
        b=bF/cSSH+ObSvH3Xacu9+I7VBaim1/uY8ar5Sw9bdVIbnBYJ9ojrAx4KRskLsgLbMIN
         Zi8+TQcl/SiXLHLAfH9PnvtZ5oiuEy/LUK2oDQqB134c7NuYiibSL7psxpUWZMP/ByUZ
         kHz1gpeVGlxWXvrEyC/tXECtShVjiSt14iw3J4ypMFEXoE+GxVD4qly1lVf7TpQWrO7h
         MB5/vG7AQbKyW7k3kCX4JqM4LsyMpQzBfe95EoNPi+I4KJrztWGQ8CRQBq9xJ75WxGGF
         KgFcVEsATj8XnOk640kKYGzkpml1nzgckz+f0whJYkoTZI9O4YEeAQfUpTVZc3et/QQU
         7fqA==
X-Gm-Message-State: AO0yUKWM+DSnZmnKoHiJ7Z60neea6ksuojRLdYccIw+jeM7oQhtFbnt/
	pJFx82S2eP/+cJptMJJ2L6367OWxh9QhT+rQ/9QzYKZFbQd5so0A
X-Google-Smtp-Source: AK7set+3kFO9Mj/lchoJZ/OJccFPwKQD+LlOMwYfhMHf93Wr+N7ICLxTR5wKhJAMLAVWhex11pcwB4yjBiMiNk5Me/4=
X-Received: by 2002:a05:6102:a24:b0:41e:991d:8814 with SMTP id
 4-20020a0561020a2400b0041e991d8814mr134187vsb.71.1676970028117; Tue, 21 Feb
 2023 01:00:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 Feb 2023 14:30:17 +0530
Message-ID: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
Subject: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
To: llvm@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, conor@kernel.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

The riscv defconfig and tinyconfig builds failed with clang-nightly
due to below build warnings / errors on latest stable-rc 5.10.

Regression on riscv:
  - build/clang-nightly-tinyconfig - FAILED
  - build/clang-nightly-defconfig - FAILED

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
-----
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
  git_sha: 7d11e4c4fc56eb25c5b41da93748dbcf21956316
  git_short_log: 7d11e4c4fc56 ("Linux 5.10.169-rc1")
  git_describe: v5.10.168-58-g7d11e4c4fc56

Build log:
----
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=riscv
CROSS_COMPILE=riscv64-linux-gnu- HOSTCC=clang CC=clang LLVM=1
LLVM_IAS=1 LD=riscv64-linux-gnu-ld
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/version.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/do_mounts.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/noinitramfs.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'
riscv64-linux-gnu-ld: failed to merge target specific data of file
init/calibrate.o
riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
Invalid or unknown z ISA extension: 'zifencei'

Build details,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tinyconfig/details/

Build history,
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-ga96fb51aec5a/testrun/14866489/suite/build/test/clang-nightly-defconfig/details/

https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tinyconfig/history/

steps to reproduce:
-----------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch riscv --toolchain
clang-nightly --kconfig tinyconfig LLVM=1 LLVM_IAS=1
LD=riscv64-linux-gnu-ld

--
Linaro LKFT
https://lkft.linaro.org
