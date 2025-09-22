Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F98317703
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758564009; cv=none; b=OQP2ZHJ2lY9b+uvqrAe02ge9nEnakjewkfAALH9DCMQGTaHPuHKKZksXE43IEH2oAYfSYwX4u/mzvvXA4NvxODPYvKWJ/egb0uz685b/kwpvAGjjCJLhQ9EXmjTsATkIN6qHNdJo4LYIoyaxtpeKCJf1xgpdJlgxdWqzR6Ek56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758564009; c=relaxed/simple;
	bh=LyFQcvfyyUbzuum2T68G+X8Y3wIlSo94RVd3tQx/fGM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ljscv89xT/7pGlpCV0BGgRVHf1TKU7omDDFHtXCzEGrVNkwuxueRqEOR0+25vlp2aQ/JFyBl1PLhQK6A836/nzPNK6ztCaz+rN1NJfvj3LZmikpx+AmFeZUNGcBIx3EyC7uGAQ4DoYJKOklrvFt00+wLhXpDe/XktA2Js7vQER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7rcPIvi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7rcPIvi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2697899a202so32140745ad.0
        for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758564007; x=1759168807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3tEHA5BGFi0qZLtSrmyzVuEmtCHCJP0b4IMQl2NugYg=;
        b=L7rcPIviSyF84nE8+AU54rumpArZSM1lN94BgxfXiQn4bpJUmLqJ3W7MkYklSXSZ9T
         Sz0A5w5zAqU1SpFSgnlyFMqXsHqkNBs7tGCyfj5FrgVtha8VQUM0vDjVcUttePi89WVx
         esuRtkf2BDKKnX0nI9Yi+tB4G4clcbIO8aIOpxZHCcP3DKwKSH2XI13IwVE6Z+iL+iBg
         +PqGhJwPaOzYgCGDIzovKjWEW2sZQ6Wj8tMSz0IQK6wJNlSENhUzFSsOCmNm6kwx4YSJ
         hNa2PJDZYxC4XSLHOsTlS/PUviwB1ogaxXaHOXzOxv8QrHThuvI+YKV0ML4+woDr+XmX
         5lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564007; x=1759168807;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tEHA5BGFi0qZLtSrmyzVuEmtCHCJP0b4IMQl2NugYg=;
        b=MDlpyB0/JULLFMuJFZ23oI8Zly3wfdaoEHV7cr2hIQRhP44AFb3jqaZecsawoYzgI8
         qjYurcjY2g/E0hSxa8aD81Yeeo0xdJlSo/mKnYa4SftzbKf9A0AWv7ySfp+gexyUDgUg
         5GoqdFJcL9vHMeULXHyFmmb60RkLjxJiPKqYYN4tmPEN+FXbmQF+sjp52WT8iy38dypA
         b/GgZ380LAWR7ed79xM7T21t8gq/13FRKA+JtG/yYp2X3aEc+lpdp825o0+rleoab4Nv
         /Wg4ZED9KDywaTXCIWUX3gT8y0W5DzA5pX6Iwloiwg9LHxsfz0BhFLhmnAP6QYuH1udE
         IywA==
X-Forwarded-Encrypted: i=1; AJvYcCWQf6ekwfn4a0YpZCDCTSKyxu+ft7RUWKjy3bgNm7qBzw+8lVIOpiTWxtLDqUrVeuKPzZep@lists.linux.dev
X-Gm-Message-State: AOJu0YxxtYdw64Q9zLzh7+ivSMvFOpRnErTn/hy0L0dSqi0We6uy884B
	YSeFCJi670mTjb8vLlI5PMXOX+Xn02+SAozFAl5myjTTdRFXGazJUHarFor3QpV1hxUkTQ8fMwF
	lff35oUs9teGITyP3Bbr9Gg1+2LrGeib++sn3e+Vxmw==
X-Gm-Gg: ASbGncvw2d2yWuR1pYkd8N34cNzJ9pJ1wChwYQRUSNpOmtRJYBqupAGtzphpdeT68rD
	stRlL1BfwG5t7uc7b0FxAxwb9rbALLTcWyHBO3Jxc7nuic/VJ5dPpzHXURcMPmBGq0oGoapIbpk
	jK/jkv3i0ex5/c0ESwybesZrGvHoYg1iaJ8hZr5dq3x/HkINWS4NGC0c0qEWB4SnDmloi4oZKig
	D+Pkh8NLTGuWAIEynJk5F4fF5NjNjYvFf3Yitl/
X-Google-Smtp-Source: AGHT+IHnq0rLb8m5TMIAGXGLN0gHFwtTPEoJOMo0Qxa07UPXisa8PfZthBdHiar633sbMLp+TiDunSqrb9HsyhZzMag=
X-Received: by 2002:a17:903:98d:b0:272:a227:245b with SMTP id
 d9443c01a7336-272a2274fc9mr102985765ad.17.1758564006785; Mon, 22 Sep 2025
 11:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 22 Sep 2025 23:29:53 +0530
X-Gm-Features: AS18NWDZwi1AO6kqN91ksL9x8G8Q2hcf5hfKdURyXPsi-NfZZp3RQHelXSAMyc8
Message-ID: <CA+G9fYvq732po6A=X=1Bm_zLZMAK50y+8sEToWVm38uQfOke1Q@mail.gmail.com>
Subject: next-20250922: arm riscv32 flexfilelayout.c:685:2: error:
 incompatible pointer types passing 'u32 *'
To: linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Anna Schumaker <anna.schumaker@oracle.com>, Jonathan Curley <jcurley@purestorage.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm and riscv32 builds failed on the Linux next-20250922 tag build due
to following build warnings / errors with clang toolchain.

First seen on next-20250922
Good: next-20250919
Bad: next-20250922

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250922: arm riscv32 flexfilelayout.c:685:2:
error: incompatible pointer types passing 'u32 *'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error

fs/nfs/flexfilelayout/flexfilelayout.c:685:2: error: incompatible
pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of
type 'uint64_t *' (aka 'unsigned long long *')
[-Wincompatible-pointer-types]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                             ^


## Source
* Kernel version: 6.17.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250922
* Git commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
* Architectures: arm riscv32
* Toolchains: Debian clang version 20.1.8
* Kconfigs: lkftconfigs

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29967175/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250922/log-parser-build-clang/clang-compiler-fs_nfs_flexfilelayout_flexfilelayout_c-error-incompatible-pointer-types-passing-u-aka-unsigned-int-to-parameter-of-type-uint_t-aka-unsigned-long-long/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/333IdxAGk8S0TDZQ0YbgzNOtKgs
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/333IdxAGk8S0TDZQ0YbgzNOtKgs/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/333IdxAGk8S0TDZQ0YbgzNOtKgs/config

--
Linaro LKFT
