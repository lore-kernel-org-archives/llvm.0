Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560A25BEFD
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429386; cv=none; b=J5AgV6g6i+YiKrQ4Q+GtRXHHWHiKfRxNv3bTfWN3MlrUaMT6XNI9EKgJ0Jf0skgacUOQOzk5USY6NZlvkBGPrdT/1JnpWJew7AvJTU7KIL9XuKHM1hueWY6xkOVwBFPVb8kjAwYd+LoCK/9HfiGM+gziLNCSnK+LP+3CBaWLPnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429386; c=relaxed/simple;
	bh=EjB9rdz31V935PwTHxBHCYPbwVDHTu9kCqt+BydQCw0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GCbjsnQFebcm9dp0CjWn5mPEtYZcdMPYH4Yl/6FLAs2DhmI+jiDJjDRGotwY9WguuAbn9FwJwD6bZTtkadkaq08r6JNa5eViTGM6LNC2NMPHl1q8E3xH/43M8SVbEkrlBkKnvKxVI+GNXe0F4+KdWsSUrNbp0XooRie4R/Kf3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItlfBLFp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItlfBLFp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b390136ed88so1379567a12.2
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753429384; x=1754034184; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B6A9eWb8jLD3CX4uWt67BOw6P0IxcLuBPt2ZgUNQsy8=;
        b=ItlfBLFpVtxoXlJiu8QT+jk+MViHCcriZSgMeJWWxoGGEGBdof0KsjE4oRknbFNqDb
         uHneqnSE1zHSXjWU2i7ClTFATwb70SBrX4otR56bdogFFuAa9Xa76jh7FQg7dOU/iRV+
         ZNisBRHcHk81SeCgo3JHzrTuq53d/I9MXhObqy82Qk8FNcAEcu045EF3WXj78Z/3mQvz
         SA1EZ1DAC1VyrJCQUAumyAudJ9ZUENezIti/K0Hy72zK7TYthxHiM3aWEUb21pN46SEc
         GZ02AEaBPS5VJ0zzA3PyK0YbhbhN7cw7dy2eMZ3oAFc7rBuQ8QL3t5ImtclkhYMmm05H
         E7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753429384; x=1754034184;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6A9eWb8jLD3CX4uWt67BOw6P0IxcLuBPt2ZgUNQsy8=;
        b=c+UpPdHRU+8iJtGLW7xcJcDCpYspYvbcdms7z67ftjF53cIKdHaCjtqOA9cKV5JFXZ
         rE5vQi4LLIUkWvKS5cBeUvZ0WUaH0ZNiIAeVJi1YIeHXTOqvaUfq0ZJU0LWlv1fZO5s4
         Sl+5DcYCP5WY69kkx/LsQIK/mZRkXnxq/hZtIZOkhaIBgY2o5SBRs8Whag0AXd3acgrQ
         huB1HTbMmfgNYtRr/09haZoLlQuyqn5FQN+97U6lxpT+3H6+wfW7Wso9wGIPcbo2XAwI
         QaugMAwKsJ3zLkCcizI1X5COalFB8r6uBx4SbP97RxdPNE19sFjYGg570/6yyV4T/6xw
         jAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/H5yHLEQOUqoPTpB7i233J34beFzcglUo7HFF3+W92uUEmbrTOr9lQDccXcpH6ZUats9@lists.linux.dev
X-Gm-Message-State: AOJu0YylY82tPwARNyeeJtsY9CC4PCXnutgg4ilIpZVaPIX6fJqV8kjf
	V8Z1hPypMrxyuzW2SEJdfOXEsbAR6Tljkzes41cv2gHJyJDFvg5OynzbU89d1yFzSLTTdC6zB1f
	8qPVasGzEgb8buZXOeQARpTfNUqmRh6lh6Pfiu47p+g==
X-Gm-Gg: ASbGncu9GkjWe4ERqiX/AtCa9OhOtm0UwAcdyFZ0jP+BtijcFgcuJCDuusxybs4yM9H
	kle2oxtqcvbstNxlT8KOdNBIE+NKluh+BQkypQnigVQH2dlim47DRsHtvseSBHV99o6NEnYBTLp
	o0CKtvBqc52w4C3YqN9PT2X4ysrf46B3nDCeEPlr9hlqW29XGiwRJKBBWoZvQoI4Kg/AlopkyPo
	QbgI5NWpx5BhrcIVwpn3J8aG9l9C5AVovLCbgs=
X-Google-Smtp-Source: AGHT+IEp4yZltn1iEhku5b0BcUr/ZNUbZr9VJ2s3ZKzfyejP8ux9369sbYm6mfNAuhTfixuEu4GOK43HMuYchrNOtkE=
X-Received: by 2002:a17:903:46cc:b0:234:8ec1:4af1 with SMTP id
 d9443c01a7336-23fb2e7c3e1mr15487105ad.0.1753429384481; Fri, 25 Jul 2025
 00:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Jul 2025 13:12:53 +0530
X-Gm-Features: Ac12FXwVCzv5N5zea2jLa_Q7rXwF-illzX5YacV4yqYK_TUIYP730sgY7-VdPXY
Message-ID: <CA+G9fYuBnDVaiZ6Mqhr=4Y2quAsqeZoGfJ158xJ1-Q5HHw=cBw@mail.gmail.com>
Subject: next-20250725 i386 x86_64 virtio_ring.c error variable 'id' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed while building x86_64 and i386 builds with clang-nightly
and clang-20 toolchains on the Linux next-20250725 tag.

First seen on the Linux next-20250725
Good: next-20250724
Bad:  next-20250725

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

## Build regressions
* i386, build
  - clang-20-defconfig
  - clang-nightly-defconfig

* x86_64, build
  - clang-20-allyesconfig
  - clang-20-lkftconfig
  - clang-20-lkftconfig-compat
  - clang-20-lkftconfig-kcsan
  - clang-20-lkftconfig-no-kselftest-frag
  - clang-20-x86_64_defconfig
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - clang-nightly-x86_64_defconfig
  - gcc-13-allyesconfig
  - korg-clang-20-lkftconfig-hardening
  - korg-clang-20-lkftconfig-lto-full
  - korg-clang-20-lkftconfig-lto-thing
  - rustclang-nightly-lkftconfig-kselftest

Build regression: next-20250725 i386 x86_64 virtio_ring.c error
variable 'id' is uninitialized when used here
[-Werror,-Wuninitialized]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is
uninitialized when used here [-Werror,-Wuninitialized]
 2113 |                 BAD_RING(vq, "id %u out of range\n", id);
      |                                                      ^~
drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable
'id' to silence this warning
 2077 |         u16 last_used, id, last_used_idx;
      |                          ^
      |                           = 0
1 error generated.

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/
* Git sha: d7af19298454ed155f5cf67201a70f5cf836c842
* Git describe: 6.16.0-rc7-next-20250725
* kernel version: next-20250725
* Architectures: i386, x86_64
* Toolchains: clang-nightly clang-20
* Kconfigs: defconfig hardening lto-thing lto-full

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29243926/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250725/build/clang-nightly-defconfig/
* Test run: https://regressions.linaro.org/lkft/linux-next-master/next-20250725/testruns/1727064/
* Test history:
https://regressions.linaro.org/lkft/linux-next-master/next-20250725/log-parser-build-clang/clang-compiler-drivers_virtio_virtio_ring_c-error-variable-id-is-uninitialized-when-used-here/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/30LiHiVcyjXbMOk2IAEwlO93ZaH
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHiVcyjXbMOk2IAEwlO93ZaH/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHiVcyjXbMOk2IAEwlO93ZaH/config

## steps to reproduce
 * tuxmake --runtime podman --target-arch i386 --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
