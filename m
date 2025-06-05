Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C2214813
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125476; cv=none; b=PrqPan8TatzLAmUIitFulXjI+mEUDrP+UkETwH70HroqYA3fzYl0i3rCRIweYHuSxIYALjkd1s44soh6myKE6my6c0r6EfezpCUqRUiJuZ/ZsYb/suotz8cdKq8ARFZGuW4+M1M8y2W6qIKZU8x1QwlO3Au1iCImHXK2a5kJQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125476; c=relaxed/simple;
	bh=MW3N16/x4ORzkYHJazCJmRwnbO4hITQcNKVwQrY/7gQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UoL+yqKZBMXiQ/1yeyT78N7BjuQTmlMulfY9dcvOnZDrfZ0L39VoL8ySxY8VpyNzYczdwibDbh0Bi+DkGr9r5bwOYFzZIL0lYuKezKJQM2ixLqjh8O1JXFWsiI8IFSQCdOWjH3PmJhad1knvLYRJ6KEfv0u3Z2Z1GAfBhdbvd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBSCDG2N; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBSCDG2N"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ded9c6eb4so673996241.0
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749125473; x=1749730273; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OgmiEXi0A20P8LTwFGfS1KsXpM+N3sq3vnKks2IxAc0=;
        b=CBSCDG2N5DTPfDuzRfMMZ0iv9oa03QcCus6aAKv+w+kFe8fILu08lpIvnmDy7DsgCy
         JnhOrZa7tDIMi1eN9MoAxgBublnD1D/PlpX8YghvPEHKJfug4DuHTNwbrBDXFwMfF6FF
         AXBWMDDIQkpN2BCzfPHKZTT6GMQKjclTHb4rImjFiFIW9pIX3bkx3mjIg7BCM/y3VnfO
         Pz860vnfQfU0RLLVnVrqR1Qi1WVp795b5I7d7nRP1u1qojqOiWdlvWg5U4lIW3zJYN9P
         LTZTBP0zlK2iH/IY8THKZf03DBfhij5iObjDt+zqeMh/feyN6Hal/H7s884/OaLodGpc
         NR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125473; x=1749730273;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgmiEXi0A20P8LTwFGfS1KsXpM+N3sq3vnKks2IxAc0=;
        b=JKYgw7NXUvrnFHxHpdcHlcH1pCOzEKOhs0fhLyzWj7p+vuYC4rj4B8rdeWSO67o4id
         lVHwBqQCze+tAv7+ntcIOx4r4naqx2yntKPZRKt+4VaAC5v5y6Oyjd/iHe2CRLbwkIAb
         CJCOZZRmzFjOdFCULGShGhAkLBt55aaG9RFfcmTszR9ANaWk/LIX0y1q5cpr4LJFCHFz
         UwUhfXI7Ctir/EvsRAV2MB6g3alMNxPxvFAIK1AqxaPF+JP/DmLJmrJnlIIshX3IsE7n
         oeZAJ7UE86eFeE7rq97jkBz97zgnbTtQEw/v+MPY3zH1WoWIhpSeSwiTxWATkcsiG136
         AqIw==
X-Gm-Message-State: AOJu0Yw9i9vKy6izg1mSGnKpNaAoRH5wg0y4nKb9sI8AlVsVDI9hoT8r
	oE1AnEklAOn8Zjr/5skYa8aKcQOJyByNB9GlhyJh+LtlQornbX5tUamVooirx/ud1TFDShn7aw4
	pmKXZeR0CK7rDpw1IS5yHuEGpCpPhobAGGBg419FdtWLzUHftr7WNG9mIag==
X-Gm-Gg: ASbGncs5XbnV+T3k7tZMvvRjDweybCLFmVIceCs3J68D475OLjQTkBNQVL3ILqbDf1Q
	uHj4WuePYMjdEhUBrWtN7mvWJ4ZdKJd2Vdm26JGuZsDMtf9IiAjNwTTfWLQZqEfojDdf24Yt8F8
	VCe7OLQCmm0qctGOGE4qmW5aqZnEOjBtQQDBH4RgE+LWX7rAD+3rffwglX7798Pbl6JtEVQY6iF
	aRr
X-Google-Smtp-Source: AGHT+IF2aumGdZUdL8u076i5ZOYIyzoO7Q7yA+GrS7FD0Blk3+o8CgZgvUcGhew/xxle19ewVkjFe1PCU2oG2AHumNI=
X-Received: by 2002:a67:f995:0:b0:4e2:b21b:2cbc with SMTP id
 ada2fe7eead31-4e758a62aa2mr2243810137.3.1749125472722; Thu, 05 Jun 2025
 05:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Jun 2025 17:41:01 +0530
X-Gm-Features: AX0GCFt1mMqSdas5kTm6Jze2KjPhrZRGcVrdJh8UaX_gHiGLSsKT2XiJF6iZ_Zc
Message-ID: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>
Subject: selftests/filesystem: clang warning null passed to a callee that
 requires a non-null argument [-Wnonnull]
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions found on arm, arm64 and x86_64 building warnings with clang-20
and clang-nightly started from Linux next-20250603

Regressions found on arm, arm64 and x86_64
 - selftests/filesystem

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

First seen on the next-20250603
Good: next-20250530
Bad:  next-20250603

Test regression: arm arm64 x86_64 clang warning null passed to a
callee that requires a non-null argument [-Wnonnull]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build warnings
make[4]: Entering directory '/builds/linux/tools/testing/selftests/filesystems'
  CC       devpts_pts
  CC       file_stressor
  CC       anon_inode_test
anon_inode_test.c:45:37: warning: null passed to a callee that
requires a non-null argument [-Wnonnull]
   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL,
AT_EMPTY_PATH), 0);
      |                                            ^~~~

## Source
* Kernel version: 6.15.0-next-20250605
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: a0bea9e39035edc56a994630e6048c8a191a99d8
* Toolchain: Debian clang version 21.0.0
(++20250529012636+c474f8f2404d-1~exp1~20250529132821.1479)

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/28651387/log_file/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/config

--
Linaro LKFT
https://lkft.linaro.org
