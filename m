Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F41867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 17:42:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id bu29so4346696lfb.0
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TxBznE6nSlo9FQTKpBSoglJFLsDbahhvf/2w9QWD+Tc=;
        b=n7k3B4XRBSICSMEODOuLiZB4tJqaQzb+aHdVz8WHfWxkDVmeVnTIHeFW1oqxUirvCL
         1XrYnkpoewKSZgQaxm93FrQqdBgzY2pHRVLab5bbgI2fCklVY4spw0YbztEYcvrtrEnJ
         Tu3+g1o/GX4yOzZRC2ImpWuV9JPQsp0vaeJbnCMMdNOdt2jUFuBd000EjGNjcvnL/Kc9
         vDaxTdq7/V91OQlnoAOj7vb3wUQxZyGMUISDb2Dwzcla1hVnlvoQfh9mTQARn6H3Vyki
         iGdMXBvfjFLyBYQVY6QuzoxXXXcwvaMzD9kDUmGzZWW3YzxQ12rgtpUXFmxrNgTH7Ehv
         g4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TxBznE6nSlo9FQTKpBSoglJFLsDbahhvf/2w9QWD+Tc=;
        b=GC+rWARV+bo1REArZxPxYoo3o7DuQvS53EEHfidCUdDyB9VWjdVJSdogDuoDewGGR1
         UFhXdWcNS2uwTfem8YftyKvecShMe0xQjUy1q7RocIp1exMFCkva9OEpYufnmVzTIHsZ
         g5Iud9LXmXqgk8t5VTpEfEWUljDbv/00U9YOo1antqTI0zIEl5ejb9vDBD+wUxVkK3Y6
         bSC/d7GnV2ThqLqtLk6c19xJb/twSvTjpdi1pOSX3W/SwZiyfEbkXFfYHme8BJxmDU09
         Z4RG13KDl9vGKVQb3pOBmwhp21kVUzrBSmoQpqayT0rrYobgF4TJYIZNp7sCVHXMWkgN
         Io/A==
X-Gm-Message-State: AOAM533q1oXmd5pQQ5aC2FIppgUBBAOOxCX5sAASG6uVhT4B/R/arnL2
	kgIMzNrIj1C4Ny1/gxujezOnd7GFtHMfRFRpXVByMg==
X-Google-Smtp-Source: ABdhPJxYpziaLTbpGi1eWUZrLZND/zisVkWbGPcI9pnuZ5NYNOhIcrguJbpJwrR3+ylY0ESgfkSxqZBNOzfXGqWkAVg=
X-Received: by 2002:ac2:4188:0:b0:471:96f4:c1d4 with SMTP id
 z8-20020ac24188000000b0047196f4c1d4mr10001305lfh.626.1650476523571; Wed, 20
 Apr 2022 10:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Apr 2022 10:41:52 -0700
Message-ID: <CAKwvOdm08hr2p-ARqmPEGnCi6zZOtgmt5d45hYG2vo30mhyMrg@mail.gmail.com>
Subject: Initial LLVM+BOLT measurements
To: Maksim Panchenko <maks@fb.com>
Cc: android-llvm-dev <android-llvm-dev@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, Yi Kong <yikong@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Maksim,
Just letting you know that my teammate Yi just enabled the usage of
BOLT on AOSP LLVM. [0] There are some speedups measured in building
the Android platform.

I'm more interested in kernel builds; here's some rough (N=1) initial
measurements to report:

r450784b:
$ LTO=none BUILD_CONFIG=common/build.config.gki.aarch64 /usr/bin/time
-v ./build/build.sh
...
        Elapsed (wall clock) time (h:mm:ss or m:ss): 1:58.58
$ BUILD_CONFIG=common/build.config.gki.aarch64 /usr/bin/time -v ./build/build.sh
...
        Elapsed (wall clock) time (h:mm:ss or m:ss): 16:50.04

r450784c:
$ $ LTO=none BUILD_CONFIG=common/build.config.gki.aarch64
/usr/bin/time -v ./build/build.sh
...
        Elapsed (wall clock) time (h:mm:ss or m:ss): 1:50.64
$ BUILD_CONFIG=common/build.config.gki.aarch64 /usr/bin/time -v ./build/build.sh
        Elapsed (wall clock) time (h:mm:ss or m:ss): 16:06.56

(We care more about the LTO (longer) config than non-LTO). So rough
initial measurement shows improvement of ~6.6% (non-LTO) to ~4.3%
(LTO). We'll take it! :)

[0] https://android-review.googlesource.com/c/toolchain/llvm_android/+/2058849/
-- 
Thanks,
~Nick Desaulniers
