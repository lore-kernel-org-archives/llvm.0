Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADC29A31A
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107779; cv=none; b=OzAM/HG0ke1/Xfw8N/YwPS/RPsYjgg6bYJPkaQ1mR2SPEuqQWAyL4lpwBolZvBkgyPG7k1Whzt1+Dc6JJbmUWTxSRT+V/Nijev/Wxa/ZkPdiwO8ajAbjCzvJEgq0c7sU7c6kxRYDcCC5N3HiiFLFjvTatY89mtz7s56trv4a8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107779; c=relaxed/simple;
	bh=nl2yBpZRvTfmVxRWdsIQVBAvauFmBGisrTQMortALrI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Th8QGazXM1eyErmzJeqZqqruo6J7Y2QID4dDnRRjci7gIT5dqMubdW8FFfUGGHcldcZRCRpL+YXQNEL/V9f4J9UYiBrgymp9U2S9iHxOifPw8UmEv40Wj3bbdLVxVyDBJiYmm/mE6H1ZUVGGZw+oBC+VTk8e3fo1M5DIIvCTpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpdA6Njl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpdA6Njl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b429b2470b7so4735516a12.3
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755107776; x=1755712576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XoIq2ubOlyxbtRkYBP/TzvBun/sOOkbTC4CyxYULUYc=;
        b=CpdA6NjlBP18BhXDYXEP4Q/zZFHJigk1yLV5FFu+kwH3bnITwg9uO3BPYqVTOVRctB
         3nmhM79ue0WIx3l6l5xi4uKEKT2oTi79fgdP4v4bCtXcsUHDh9HVlUttZsmUum2lPeBp
         l90FVal8UWvMAX3kacplAmfjy5+DlLkKnFn+UPI3J7C5H5W2wYbRRpM0pT3TBWG8avX0
         PVXq+ArwwcU55hLWacpjjgFWQzCQdqF+xXl2MAAocV1FZQwO4kLkCCi4/Euv4yGWTq4M
         TBbQfiSzyT1kRAiLZ/kDRUk9lqPqbG7ddjfoasrRVE4CYQaBXuSqzlwtQOfOdrFAiymz
         VMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107776; x=1755712576;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XoIq2ubOlyxbtRkYBP/TzvBun/sOOkbTC4CyxYULUYc=;
        b=cnHe04/vPKprARo76QEqmsd6VVNFHdBi8X9rzMTTAzBV2Jna9v5dZJuErfG4gDGSK2
         4zVGxBnY56Ds+OMyKFgH0cpRz3MIxFrbG3orbn77Fb0UvvK/O8Aj0ul379JGWXtW/4q/
         cPsvbdjuujpFWJtigDwxXmvUdnZqOsQPRe0t0So6mGfL5QPOnE0lTNEQ2PW3be7fgtu3
         cXXOlZQS5lb/Cfa85LKTdwBy4UpWuzoYynV8NkNmlch4exP6ZqkCXG0kA4n0MKtky4uj
         YpI7Dmf8nsLxk8o4a7TyQ/PI8cn0q/vVqvVHepsRhwhIqqWNczgkjo8VutTrvR3fITmb
         AFYw==
X-Gm-Message-State: AOJu0Yw0F+4K1AgieBl+Dj6BeujV7Eb6xHX8ICVVU7C3nmEDVtuywvZj
	gUBXG1ErDwN1bIhKCV0Kh408b0Mto8jU9A+tDsyY3FAG9zv3I2Xos7d2LVbXN9PVSYGl8Z74Q8L
	miPBtSgClUqlLmqopAydK+qAL4pmKb524Y3b49JShWO0yn7PNEFoZOWQ=
X-Gm-Gg: ASbGncuwSVxVqNz/2xMVNdTAg7ZtHT7GnSiA9vUbB4FJqJwfgiHC2RiSZhOvZNfayX+
	1CQMZVzFs3Grt3g9a5gsCjWsFE08TepAcEbDgdd3He8a8zBjpQbl0xqAeF4zHKIItC3P9MCTILV
	WhAV8ndxeolM8ttqSVHWqvqBmTM7zleP/H68cFwQSPcB49yj+7spSPRF8WqXUfaNENnNTdKW9c8
	+ZzqvX2+Bi1YwMHB8K4acOEouyypRZxm1rMxPo=
X-Google-Smtp-Source: AGHT+IEkiAGoLbMGkvXnlFSqPQ+NERPuNoFrCDcPTgVm2ojJsZrVhHUi72yNXNyT4cDONEDGhe3E10OKGjZiy9tS3ck=
X-Received: by 2002:a17:902:e5c1:b0:242:a0b0:3c1f with SMTP id
 d9443c01a7336-244584af50amr128565ad.7.1755107776617; Wed, 13 Aug 2025
 10:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 13 Aug 2025 23:26:05 +0530
X-Gm-Features: Ac12FXyG0YWZ_N3cTY6hqEM4R9dYMT1co-eY8G4uUHRenE8ObEitphecfPJYjck
Message-ID: <CA+G9fYtJPqkugHFbgs8vNK5jNGivX1yO1ZiL2q97c_dazUiArA@mail.gmail.com>
Subject: next-20250813: x86_64 iov_iter.h:171:7: error: variable 'remain' is
 used uninitialized whenever 'if'
To: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed while building x86_64 and i386 builds with clang-nightly
and clang-20 toolchains on the Linux next-20250813 tag.

First seen on the Linux next-20250813
Good: next-20250812
Bad:  next-20250813

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

## Build regressions
* x86_64, build
  - clang-20-lkftconfig-compat

Build regression: next-20250813 x86_64 iov_iter.h:171:7: error:
variable 'remain' is used uninitialized whenever 'if'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
In file included from net/core/skbuff.c:66:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.
make[5]: *** [scripts/Makefile.build:287: net/core/skbuff.o] Error 1
In file included from net/core/datagram.c:53:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.
make[5]: *** [scripts/Makefile.build:287: net/core/datagram.o] Error 1
In file included from lib/iov_iter.c:14:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250813/
* kernel version: next-20250813
* Architectures: x86_64, i386
* Toolchains: clang-20
* Kconfigs: defconfig

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29479215/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250813/log-parser-build-clang/clang-compiler-include_linux_iov_iter_h-error-variable-remain-is-used-uninitialized-whenever-if-condition-is-true/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/config

## steps to reproduce
 * tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig x86_64_defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
