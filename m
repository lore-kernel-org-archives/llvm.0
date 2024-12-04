Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F1DACA9
	for <llvm@lists.linux.dev>; Wed,  4 Dec 2024 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308286; cv=none; b=IEHziCR665RUFqicdAvcguLyxtSxwYnGXfdSU6ZCofmKooro7AtELyt7Nf1ixbYhKuuOluKqh0O6qHlI5j+9cI3A+hLriEjgoTCC+DY6no3ZcGuMzX8/lfA713mrOdo9cxSEfuf77wVnGtSNnUkuEvs3Tgba6Y3LSaS9D00JmQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308286; c=relaxed/simple;
	bh=vAsH6MnaEk9q60JG7f9rI5ko+v1PT6qYTJsjyeNqYbI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aeV5kDT/YiPgVLQdLKPSnBlB1aVinDI/JANXRggk4SzyUZSr4JU/EVHStru9g4vj61okuKXFllai0+hxlQkFQOZAODO5hQGSQLjhvC9W0uchCO9NMjiZ0XOk135FfOvnd1fTfB47QrnJl5oMypxhJS70qZrfuA2MrIfVhCInq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8RAVC6X; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8RAVC6X"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85b95896cefso985699241.2
        for <llvm@lists.linux.dev>; Wed, 04 Dec 2024 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733308282; x=1733913082; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MHZqGoUWlClziZon67vL+ZIDd0uUbSc5vRlqScvdhAg=;
        b=W8RAVC6XO1Y86SZI+OoDPrKrLCeqM/oebwelYFppFkxFembHME1rUOsTAqTvW17M64
         RlupFbAlPesHoVfabxJhudzYspa0XYPqwgNfNlRnCPd+uw08dCbQ1NOuHFmPLF4xN7yX
         N1StaHOiiVpP8SrBqBoz52gN1uawd62OV0/Jt8/TfHyzhLg2XHperYvgS8VRWRIoitiv
         tgvjjBHyJ2EAeYGJfAWnKquXzj52PzZlgECGI6QMrstRz7/lq5PBLXxVfD1akNArSwQa
         DnqeXHGdIh70LfhxzwI5gugl1mGCsCbN4Yq0cPODXnYG0SxGxHeRfGvMm8NXyjhPMiCF
         dI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308282; x=1733913082;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHZqGoUWlClziZon67vL+ZIDd0uUbSc5vRlqScvdhAg=;
        b=dmrIdiLEI3UHwGdvtdoyy473B3fyWsVfyezRWBgZSvDjuVL4DgTlf/fvBwBC7mkfIr
         3Ju/Ct4MGMUbZ0eeneS9g1hO8F1ZsjqYQ9WK+pK8XduRMADHw3KWFXbepLY5F5/g0qLP
         BzHzvsTJ3cUnT9KX/cAsmceBQnIfI/jZG7fpgiP3odKfLwqT9Vj5W8B2W3Z9zRi2uKYQ
         kGrA4J53Se+MJ1Yv3DxDd/QyuVaNnfPGoxB5U/NYZ16eFadlEbnP+6sFRw9YOCrIBm9W
         eXisPnZwHxLQFGJzLvepoillxuYxv+L/FUsHmmY7l70x3NB2z8sK330KzCIjRxXS9qYy
         wKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/bfpFQfTl7BTgOsanQONlU20HF14RxGRHRxFuciuq0vGpucjKbhfLNFAreE4Plr1muSC@lists.linux.dev
X-Gm-Message-State: AOJu0YxBxc0WTPP7mBUPhD9qP1A5ZWT0N6MHVNcVHcuA0IWsNQJbLBmB
	41LP8AsYhGqyx/ewJ3542o2lcu7WePzcDd3KM7Nk+FBellg9rV7lc4d87mxmRAMsHcu5HYZ3NxR
	2el8/mlpmCz87rmXu3mx8rIogiY4dctkj2LM97w==
X-Gm-Gg: ASbGnctjjsevolKOc/E0KQIHR27UYt09iFrt/26L6heSXESMTFvq//PMj0xuFf7V5Vx
	9RL4no1PxheAg8gu2MRiRwLD8cZVbBaTz
X-Google-Smtp-Source: AGHT+IGzmWUJVmPN1eOgu9kN8rAcGofAl+lpuZp+XiCWblexF4Qy5RN+9yN7Hxl4Y5rZ7gNdO/a89AZ+ZMppZu2Bfcc=
X-Received: by 2002:a05:6102:26d5:b0:4af:3fc1:e02 with SMTP id
 ada2fe7eead31-4af973825d7mr6798788137.27.1733308281831; Wed, 04 Dec 2024
 02:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Dec 2024 16:01:09 +0530
Message-ID: <CA+G9fYsD7mw13wredcZn0L-KBA3yeoVSTuxnss-AEWMN3ha0cA@mail.gmail.com>
Subject: s390: block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
 declared with 'error' attribute: clamp() low limit 1 greater than high limit active
To: linux-s390@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	linux-block <linux-block@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

The s390 builds failed with clang-19 with defconfig on the
Linux next-20241203 tag due to following build warnings / errors.
Build pass with gcc-13 defconfig for s390.

First seen on Linux next-20241203 tag
GOOD: Linux next-20241128 tag
BAD: Linux next-20241203 tag

List of arch and toolchains :
  s390 defconfig with clang-19

s390:
  build:
    * clang-19-defconfig
    * korg-clang-19-lkftconfig-lto-full
    * korg-clang-19-lkftconfig-hardening
    * korg-clang-19-lkftconfig-lto-thing

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
===========
block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
declared with 'error' attribute: clamp() low limit 1 greater than high
limit active
 1101 |                 inuse = clamp_t(u32, inuse, 1, active);
      |                         ^
include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
  218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
      |                                    ^
include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
  195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
__UNIQUE_ID(l_), __UNIQUE_ID(h_))
      |         ^
include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
  188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
                 \
      |         ^
note: (skipping 2 expansions in backtrace; use
-fmacro-backtrace-limit=0 to see all)
include/linux/compiler_types.h:530:2: note: expanded from macro
'_compiletime_assert'
  530 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^
include/linux/compiler_types.h:523:4: note: expanded from macro
'__compiletime_assert'
  523 |                         prefix ## suffix();
         \
      |                         ^
<scratch space>:38:1: note: expanded from here
   38 | __compiletime_assert_557
      | ^
block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
declared with 'error' attribute: clamp() low limit 1 greater than high
limit active
include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
  218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
      |                                    ^
include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
  195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
__UNIQUE_ID(l_), __UNIQUE_ID(h_))
      |         ^
include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
  188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
                 \
      |         ^
note: (skipping 2 expansions in backtrace; use
-fmacro-backtrace-limit=0 to see all)
include/linux/compiler_types.h:530:2: note: expanded from macro
'_compiletime_assert'
  530 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^
include/linux/compiler_types.h:523:4: note: expanded from macro
'__compiletime_assert'
  523 |                         prefix ## suffix();
         \
      |                         ^
<scratch space>:38:1: note: expanded from here
   38 | __compiletime_assert_557
      | ^
2 errors generated.

Links:
---
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/details/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch s390 --toolchain clang-19
--kconfig defconfig LLVM_IAS=1

metadata:
----
  git describe: next-20241203
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/
  toolchain: clang-19
  config: clang-19-defconfig
  arch: s390

--
Linaro LKFT
https://lkft.linaro.org
