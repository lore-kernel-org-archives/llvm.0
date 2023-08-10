Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BFC186C
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 08:41:54 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79a2216a22fso191154241.0
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656913; x=1692261713;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BIQvytKlPHV61L4Nl1TShTCcBaBoBzuMm/JZ+epP++U=;
        b=fWueKhKZp/KlvAjBql5/gcufDl2eUlY/f98Ahh/jmMf9VG1DzkfEubma08Qf4MOU7h
         aSZwv7axEYR4OdkFtDP62/PStXtmje8dMFM5UGb7LcfvKs3Nh9CgSXXsCBr7e0zyeEBv
         bRAMVsckeIlS3Kg5m9XeBGJG1kLCYalN606LCd+FhajQ4DMAxUd05U3VHbxxhw7YKlsx
         fYUgNdn3ptlS9XVU6BqPW8Sn7U/JA5kp/lDbk8U/WNtJVJVDyKmVwh0WhA/Yklrhlfk6
         0tYVjt3D+KmTzC1O3EbbmWbOaHbYLfn6hF6UUeRgNC7ul/JNhrVeCg3Kur2LiwNXCcn9
         seJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656913; x=1692261713;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BIQvytKlPHV61L4Nl1TShTCcBaBoBzuMm/JZ+epP++U=;
        b=jgG1IjYe/jUTmAdwh9GEDmax1PwKD5ya7gLXtXTiQw4VvyKarTTYRdxZlymhfCcxaC
         3phlGmdsvWS23zDWqla0m2jk8IqXZO3Uq2RRBMNzxn22NE74yp5NseCLMakS2Zoc2reJ
         0Npl2GQFLDk0LPaVUBmRRN9lXK5m+uT5ZyFNVTldJC7vgWtC6JTKV2PHc9pDAXFNcOuz
         dW0wc0QcHa6o3K6XpvFGAPSXk1jZezNVa/eHgeHAgM7Hunj/ZLYk7cSipJ0/cBQT1S/C
         ST9tcvS0ZgxLcCR8ZXgd0mK1a0u3wBkzi/lzNkEOU4XWgpt5zY35vyOwsITfCL+vi3ub
         G7UA==
X-Gm-Message-State: AOJu0Yx8eNjW3l8d754JGIchvg/efOitrdQEr38FSf7+VkulNMo9rimI
	zaASMPYS7Xvmni0VUFaEmiQVm7ozbYiPnI5U5ewfzfVVWIuKccTUP9o=
X-Google-Smtp-Source: AGHT+IE6xFgpOmRru++MINEnnoF5fh8e0YFDyWoZ5seECl++8hTyx/CXJypK5KyWrfhmRiDyC8pkNhRum5XwhhnE11U=
X-Received: by 2002:a67:fada:0:b0:447:68a0:a121 with SMTP id
 g26-20020a67fada000000b0044768a0a121mr982100vsq.2.1691656912738; Thu, 10 Aug
 2023 01:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Aug 2023 14:11:41 +0530
Message-ID: <CA+G9fYtQGmwYHYf5suRMyCzQmKmQ1kx31gxGJ-7CT-NTLrxYoA@mail.gmail.com>
Subject: drivers/gpu/drm/nouveau/nouveau_exec.c:114:4: error: cannot jump from
 this indirect goto statement to one of its possible targets
To: clang-built-linux <llvm@lists.linux.dev>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Following clang-17 build failures noticed on Linux next-20230810

Build log:
-------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' LLVM=1 LLVM_IAS=1
drivers/video/backlight/lp855x_bl.c:252:11: warning: variable 'ret' is
used uninitialized whenever 'if' condition is false
[-Wsometimes-uninitialized]
  252 |         else if (lp->mode == REGISTER_BASED)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/video/backlight/lp855x_bl.c:256:9: note: uninitialized use occurs here
  256 |         return ret;
      |                ^~~
drivers/video/backlight/lp855x_bl.c:252:7: note: remove the 'if' if
its condition is always true
  252 |         else if (lp->mode == REGISTER_BASED)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  253 |                 ret = lp855x_write_byte(lp, lp->cfg->reg_brightness,
drivers/video/backlight/lp855x_bl.c:244:9: note: initialize the
variable 'ret' to silence this warning
  244 |         int ret;
      |                ^
      |                 = 0
1 warning generated.
fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set
but not used [-Wunused-but-set-variable]
  232 |         unsigned long pages_processed = 0;
      |                       ^
1 warning generated.
drivers/gpu/drm/nouveau/nouveau_exec.c:114:4: error: cannot jump from
this indirect goto statement to one of its possible targets
  114 |                         drm_exec_retry_on_contention(exec);
      |                         ^
include/drm/drm_exec.h:96:4: note: expanded from macro
'drm_exec_retry_on_contention'
   96 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/nouveau/nouveau_exec.c:106:2: note: possible target of
indirect goto statement
  106 |         drm_exec_until_all_locked(exec) {
      |         ^
include/drm/drm_exec.h:79:33: note: expanded from macro
'drm_exec_until_all_locked'
   79 |                 __label__ __drm_exec_retry;                     \
      |                                                                 ^
drivers/gpu/drm/nouveau/nouveau_exec.c:106:2: note: jump enters a
statement expression
include/drm/drm_exec.h:78:35: note: expanded from macro
'drm_exec_until_all_locked'
   78 |         for (void *__drm_exec_retry_ptr; ({                     \
      |                                          ^
1 error generated.
make[7]: *** [scripts/Makefile.build:243:
drivers/gpu/drm/nouveau/nouveau_exec.o] Error 1
drivers/gpu/drm/nouveau/nouveau_uvmm.c:1305:5: error: cannot jump from
this indirect goto statement to one of its possible targets
 1305 |                                 drm_exec_retry_on_contention(exec);
      |                                 ^
include/drm/drm_exec.h:96:4: note: expanded from macro
'drm_exec_retry_on_contention'
   96 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/nouveau/nouveau_uvmm.c:1291:2: note: possible target
of indirect goto statement
 1291 |         drm_exec_until_all_locked(exec) {
      |         ^
include/drm/drm_exec.h:79:33: note: expanded from macro
'drm_exec_until_all_locked'
   79 |                 __label__ __drm_exec_retry;                     \
      |                                                                 ^
drivers/gpu/drm/nouveau/nouveau_uvmm.c:1291:2: note: jump enters a
statement expression
include/drm/drm_exec.h:78:35: note: expanded from macro
'drm_exec_until_all_locked'
   78 |         for (void *__drm_exec_retry_ptr; ({                     \
      |                                          ^
1 error generated.
make[7]: *** [scripts/Makefile.build:243:
drivers/gpu/drm/nouveau/nouveau_uvmm.o] Error 1


  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230809/testrun/18940123/suite/build/test/clang-17-lkftconfig/log
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TjhxEjDSquzvxYvC8eD8VWx9dV/

Steps to reproduce:
   tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TjhxEjDSquzvxYvC8eD8VWx9dV/config
LLVM=1 LLVM_IAS=1
   https://storage.tuxsuite.com/public/linaro/lkft/builds/2TjhxEjDSquzvxYvC8eD8VWx9dV/tuxmake_reproducer.sh


--
Linaro LKFT
https://lkft.linaro.org
