Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00CDDA5
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 10:51:31 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-44bf4e8945fso470908137.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692269489; x=1692874289;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PwRqCw0HUOyaGtPxJbMKB04qbbd6HmPDl9unJunOuNs=;
        b=NKajdjqWcACz7+jTBBXWsHK9nYEI6CzWcAvyNsvWKuMV0bvOUvAzto8jQrP+a5yRk9
         HuM8dTxLXsggqjdO/5oqkqDrEgafMqnuf7pEqRCdfU44u23YJkLxO2cWlezOHun2Ed9J
         97H7pRpjcAmsNVgybv/uTZ61ZN+laRT5AcfmPFRNWAXLRSD4Wpkdx30vXH9FNRd6Yr8x
         C8X2bCShYgikSSEKWtvwj0OIBgWKowyMk7C66pSHf7SwWHOldYX4T3URwQJzoG1JHRmB
         SQfF1R6gHS+nliyDFx0Vrsx+w7LFfOlnkXXcK/XrJk07dkfvjYshMzHLqAJKJZiZetL1
         RLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692269489; x=1692874289;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwRqCw0HUOyaGtPxJbMKB04qbbd6HmPDl9unJunOuNs=;
        b=WE6Wu+Xdknv/+7KvF/6NWSTKxS0vmOBISdmQOE+f0T23CmtWVPV+09kCmMV1rFLbNh
         5sv5d6f1IwY7C9Hw3Hn8n3WIfvmdYjFTX777yszTmXejAtn6Cgw8ZXUp08yFFbgRdmUO
         NIzHu2qHBLwnpvjl5SgP8F4MGmhwlp+Y6YideLjlDWzvSxPqB8X52bxxBiAnNFsKBOju
         eS1ZI3bpmx+3EJG601jCM8uoVvOM1Zg5IzaP3KxQ3GiIgQIFzFBOdNJSwVMDA1NKa0sc
         7LFFavOXMqQfZleLU3yvfw5BKvYTmDb0z5c2x0sxJXg9CSo2nwgH7BEDLpS4bGYksLz6
         wbmw==
X-Gm-Message-State: AOJu0YwMBOAhrnQGmxxzlCl3Vw2r0YpPn/nEUw94ep6jd6oFTAN2kqkz
	wYvArSOx2+4N4HVVGrw+JmqTMuvIUw9acGGQZdaQDvKG9F13ueVoaIc=
X-Google-Smtp-Source: AGHT+IGo4834Qu+hswUxKMIx1Kiswwy8W/FJPj8GnmqgXzkPnBafwOOVSsprB+brYtziKci5XXZIq8FKLRo7t2quaNY=
X-Received: by 2002:a67:f491:0:b0:447:6c24:7d93 with SMTP id
 o17-20020a67f491000000b004476c247d93mr4177330vsn.20.1692269489522; Thu, 17
 Aug 2023 03:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 17 Aug 2023 16:21:17 +0530
Message-ID: <CA+G9fYvFD-kE0+EGWkwcnR1DXRxh7p7OwQThJ6KWxYWVROJ4+A@mail.gmail.com>
Subject: landlock: fs_test: fs_test.c:4524:9: error: initializer element is
 not a compile-time constant
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org
Cc: Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"

While building selftests landlock following warnings / errors noticed on the
Linux next with clang-17.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
------------
landlock/fs_test
fs_test.c:4524:9: error: initializer element is not a compile-time constant
 4524 |         .mnt = mnt_tmp,
      |                ^~~~~~~
1 error generated.

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/

Steps to reproduce:
tuxmake --runtime podman --target-arch arm64 --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2U69ue7AaypfY7eRU4UUygecrDx/config
LLVM=1 LLVM_IAS=1 dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
