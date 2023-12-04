Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4A23752
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVIehuM2"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d8751c8e7eso1736127a34.3
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691418; x=1702296218; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8m9lBss2N9gmJ7CWiI2qsuc6tjxWOakJzaxWbQb+vtA=;
        b=SVIehuM2Y24gYr0Z6wHsJw4jkh17O6Mknn6I0mmnaV1x0P0RmN4zy7vzCjaSCDKmrH
         tHO1FzHmksv1jqkoyccOvooeCkrBCbRn5uTKD7i3aLD6ETLZe+SMU6cVFZx9xgG3hMZf
         wsywFYuJXF9XuItZyfmo31VQk5NPES8tKjXvOGKA9EkeD5I+Mo00EtlfxwkhEtr3NTAn
         OvPZxG2H9PJJi5SNHrTqqLXcXxRzS1cOQnxH5AHXNO+Op++Ud1z88jPAch7ZhpZPoJpJ
         vyXvB4bt46ja6d/ZsA5wm8Otxr10JvrUexSx6Awd+MrlqM62Z3ja/0EK8jR/cZyjaUdh
         VrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691418; x=1702296218;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8m9lBss2N9gmJ7CWiI2qsuc6tjxWOakJzaxWbQb+vtA=;
        b=siaAXQ0k4leD3KAgaaaQnhQIJ3HxqyoAL5uDrNEK8VtfFR30uAYFjnPubrCSEhuNJw
         2JEoG3CesGkBfGLiqdd7JwC4pePLGEn1nI6IPcleiqIrpAJIU6jz3xKYDJ8laCkg1FS0
         xyBqOvCCrCyoQUVrWcGfAGcbGFqsFFlUZ29Q78cDaA8J/svPwuhlUPCTTS5efWbZ025i
         tK7jec0U/ZSYRUoKloAE0rI6Qcm29ejLpBRgaQWgjRYRnTRV7aWjSwNVQ979y2yHjEeq
         HE9o4C4IegfkRAprJQ7oORsi226zspYalRrLKK4s3dLNgq9hR59nH2lmpq+EQ3fwkJ7t
         jJ6g==
X-Gm-Message-State: AOJu0YyYZBJLlQlF3WU730GLIwEQpyrLEHhKsFdqB6FFEfj8CgCZxlG0
	SVG/anfMbYVSCBPb27+us6Psskz4kFPJc1fuob/DIsV4ktU1gJuqYmc=
X-Google-Smtp-Source: AGHT+IEtcMK1FvJnO/N929rTgm1c5UQwY9ZKTuLRDbSnocjG2Dv64YKBRmzygwY+RjRRS5oUMM5l2sXrtIt5uIV35A4=
X-Received: by 2002:a05:6830:6e15:b0:6d8:74e2:c086 with SMTP id
 ec21-20020a0568306e1500b006d874e2c086mr5495794otb.56.1701691418411; Mon, 04
 Dec 2023 04:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Dec 2023 17:33:26 +0530
Message-ID: <CA+G9fYvD72Vpfs2g8R+OJ6L8w9p_uaWbXpWMvnGAx_AOLabatw@mail.gmail.com>
Subject: clang-nightly: vdso/compat_gettimeofday.h:152:15: error: instruction
 variant requires ARMv6 or later
To: clang-built-linux <llvm@lists.linux.dev>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Following build errors noticed on Linux next-20231204 tag with clang-nightly
for arm and arm64.

## Test Regressions (compared to next-20231201)
* arm64, build
  - clang-nightly-defconfig
  - clang-nightly-defconfig-40bc7ee5
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-kselftest

* arm, build
  - clang-nightly-allnoconfig
  - clang-nightly-axm55xx_defconfig
  - clang-nightly-bcm2835_defconfig
  - clang-nightly-clps711x_defconfig
  - clang-nightly-defconfig
  - clang-nightly-exynos_defconfig
  - clang-nightly-imx_v6_v7_defconfig
  - clang-nightly-keystone_defconfig
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-omap2plus_defconfig
  - clang-nightly-pxa910_defconfig
  - clang-nightly-s3c6400_defconfig
  - clang-nightly-s5pv210_defconfig
  - clang-nightly-sama5_defconfig
  - clang-nightly-shmobile_defconfig
  - clang-nightly-tinyconfig
  - clang-nightly-u8500_defconfig
  - clang-nightly-vexpress_defconfig


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Build log on arm64:
---------
In file included from lib/vdso/gettimeofday.c:5:
In file included from include/vdso/datapage.h:135:
arch/arm64/include/asm/vdso/compat_gettimeofday.h:152:15: error:
instruction variant requires ARMv6 or later
  152 |         asm volatile("mov %0, %1" : "=r"(ret) : "r"(_vdso_data));
      |                      ^
<inline asm>:1:2: note: instantiated into assembly here
    1 |         mov r4, r1
      |         ^
In file included from <built-in>:3:
lib/vdso/gettimeofday.c:139:3: error: invalid instruction
  139 |                 smp_rmb();
      |                 ^

Build log on arm:
---------
In file included from arch/arm/vfp/vfpmodule.c:23:
arch/arm/include/asm/cp15.h:101:2: error: instruction requires: data-barriers
  101 |         isb();
      |         ^


Links:
arm64
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21471527/suite/build/test/clang-nightly-defconfig/details/

arm
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21471941/suite/build/test/clang-nightly-exynos_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21471941/suite/build/test/clang-nightly-exynos_defconfig/details/



--
Linaro LKFT
https://lkft.linaro.org
