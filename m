Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70111C3F2B
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013276; cv=none; b=IkYwwqwkyfOa/1hhFu/mWnL/7o1WsFS5zP9Us0EpQzNd3NaJsBmp4DAmrPwwKw/X0p6IrhXN3pLq8iZl0vYFK7MDirUVOx4/4IhxinJyU1fn9tYysejnvTAOhGhtd9x1G8fQ+OD79ZJ8duvakRYOwlQimbGod4Lpuy/XAvDS3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013276; c=relaxed/simple;
	bh=+8OEVnPGa46gHtkRF9wvJKb+QNcihrIDAtiCUEXgyic=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pEPLKkhk0SG8VH7u1j2bYnLnXDjtoGtVlcA1R8IHa9aJ4iXs8FbwmnVkqRRqt6aEekDfuK6ToOfFPNVsrpPyXR2vUdLxruErUiZwBNT7w9WgJJKmpVXS9DVfW/l4IZvfitamzhx/t9OEIhKgO8zsxGvi/IfOOQdROYS5mXmLmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYdKuWRX; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYdKuWRX"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85700088a4dso1023132241.1
        for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732013273; x=1732618073; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/xsQ9zP4NpkXypxR7yTAJiAxxPPAP90eO4pmL1ZKo28=;
        b=GYdKuWRXO/HfN0Yz+J2LRZKjJEyimkN6Y0Bug2q+50rCLsY7mNgCyZTQk0ETf2E/Or
         4BspxNWY9kGR0iwB7i1U9l4YqeBDD2kQgi2l2QU+vu9ZPPZXyLqDMBRxXqTi4xczmRJs
         /lrrBhxzFQWHs8ieUgN5RoLOfHDP9ZVBQXcCogTYi6uEJ6So4O6teuJmyIm1qT5l0iA6
         dKYk83Xl3o+GSsfCIxZc7PwPAV/xqrz8QiC0U7zCWecp4m85AFAndabjgQHO6CyFp/a8
         4Fk4zzfP8giJp6RGSL/15D+UOXTVkZ5mBPVmftjtfQmKi5R+YsCrRbVZRlZAU2CSDx80
         ooSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732013273; x=1732618073;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xsQ9zP4NpkXypxR7yTAJiAxxPPAP90eO4pmL1ZKo28=;
        b=bgu5muBUnp2tsJG73DtWwDHUTP0WEGavGe/AITN3BKphZ8J2iDEmii2qluO6XDrfIx
         KFiUrlN62Hmco5aY54N08oKa6+e0UPPA5rhWWbD6UDu/xaVVsRVYl0f0i8joUhJAIrqk
         gqol43OzimTx9Eq8h7HzM+8wqQC06piv5Fpna/Y2XZhOnHBvjOFSFSllYYf/ksoKy9nY
         6KFU1JIHul4k80d9E3+jg/ULX7skn0zFKB9aqsOilyQlRIsbc3QZXbdZ7N5iIbBLQIsd
         Y20Z71NTaqAmK5Sii/gtvIWr/nPm4klvcFKbQ/AnpXSsW8/rwLXckf9JNdPr/qz8oOS7
         giaQ==
X-Gm-Message-State: AOJu0Yxc7l6aZ7w39iArbT4Vzg6GUK7h+WHvRkj6Q4mNCgwUwTDiOg2H
	orQOszD3ot05Mf9BQq6JKS0RCFi/cdDFT7JjVq0kHxH9JyIxSoTmCVJy/AaT4B+cW2qMhPqwemD
	vdEz7d16CRifmN/kr4bPE0G6KXeScVH1XOoWZlCYTTDkZjlj2HKA=
X-Google-Smtp-Source: AGHT+IGfIAmzbAQ3UPbaFATsGGzkHqD5l3RInFAgMeY1qUh9DTK1A9Bywf+fKHzZOfbxXYAtr1BvjAgtEJqRaRvJkrE=
X-Received: by 2002:a05:6102:3ec7:b0:4a7:4900:4b83 with SMTP id
 ada2fe7eead31-4ad62b4d937mr14474408137.15.1732013273183; Tue, 19 Nov 2024
 02:47:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Nov 2024 16:17:41 +0530
Message-ID: <CA+G9fYs0mh8ex1wWYTW_o+BstwCAZ6rgQJZbGRkSH4WoQNTJdw@mail.gmail.com>
Subject: DEFINE_FLEX_test: EXPECTATION FAILED at lib/overflow_kunit.c:1200:
To: clang-built-linux <llvm@lists.linux.dev>, kunit-dev@googlegroups.com, 
	open list <linux-kernel@vger.kernel.org>
Cc: David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

The overflow_DEFINE_FLEX_test KUnit test case. This test consistently
passes when built with GCC-13 but fails when using Clang-19 or
Clang-nightly.

Test Case: overflow_DEFINE_FLEX_test
Compilers: Passing: GCC-13
           Failing: Clang-19, Clang-nightly
Observed Behavior: The test failure is reproducible with Clang builds,
                   while GCC builds produce consistent success.

This inconsistency suggests a potential issue either in the Clang toolchain
or in the test implementation that is exposed by Clang's compilation behavior.

Test log:
----------
<6>[   92.471692]     # castable_to_type_test: 103 castable_to_type()
tests finished
<6>[   92.474933]     ok 21 castable_to_type_test
<3>[   92.476715]     # DEFINE_FLEX_test: EXPECTATION FAILED at
lib/overflow_kunit.c:1200
<3>[   92.476715]     Expected
__builtin_dynamic_object_size(two_but_zero, 0) == expected_raw_size,
but
<3>[   92.476715]         __builtin_dynamic_object_size(two_but_zero,
0) == 12 (0xc)
<3>[   92.476715]         expected_raw_size == 8 (0x8)
<6>[   92.480178]     not ok 22 DEFINE_FLEX_test
<6>[   92.483020] # overflow: pass:21 fail:1 skip:0 total:22


Test failed log with clang-19 and clang-nightly :
-----------------------------------------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908897/suite/kunit/test/overflow_DEFINE_FLEX_test/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908897/suite/kunit/test/overflow_DEFINE_FLEX_test/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908335/suite/kunit/test/overflow_DEFINE_FLEX_test/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908335/suite/kunit/test/overflow_DEFINE_FLEX_test/details/

Test history:
----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908897/suite/kunit/test/overflow_DEFINE_FLEX_test/history/

Test pass log with gcc-13
----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908488/suite/kunit/test/overflow_DEFINE_FLEX_test/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241119/testrun/25908488/suite/kunit/test/overflow_DEFINE_FLEX_test/details/

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Z8y7TVGQ8pXwjhYTnnMNxFpZ/

Steps to reproduce test run:
------------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p3ZAtZdJgM7AbNB5vGAGDf73vx/reproducer
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p3ZAtZdJgM7AbNB5vGAGDf73vx/tux_plan

Steps to reproduce builds:
----------
- tuxmake --runtime podman \
          --target-arch arm64 \
          --toolchain clang-19 \
          --kconfig defconfig \
          --kconfig-add CONFIG_KASAN=y \
          --kconfig-add CONFIG_KUNIT=y \
          --kconfig-add CONFIG_KUNIT_ALL_TESTS=y LLVM=1 LLVM_IAS=1

metadata:
----
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git sha: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Z8y7TVGQ8pXwjhYTnnMNxFpZ/config
build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Z8y7TVGQ8pXwjhYTnnMNxFpZ/
toolchain: clang-19 and clang-nightly
config: defconfig + KASAN + KUNIT + KUNIT_ALL_TESTS
arch: arm64, armv5

Please let me know if more information or logs are required.

--
Linaro LKFT
https://lkft.linaro.org
