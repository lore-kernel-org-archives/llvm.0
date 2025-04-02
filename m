Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF28236421
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596524; cv=none; b=UhKRjNShSI6qpZ++KXv9+hcRlVAEKJE1kMO0DCmk5THMW5Iu3f2FR1NHo/nk/aWrgIufX15EqVVeqRwAjF0Y/5+11WhdLRLCuAiGfpdeALkSfgoZgT4wDsaRQGj7tEeBj4FF4SCOSRiyX5NEOrodGAW7qGrsYLPgs7WRwDgNagY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596524; c=relaxed/simple;
	bh=hFmt9tVTbnzz6IMTCrEPKn6NiL3yOalLnxXBtm1hJ0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ue638SB++qt6MrKykURhggeI6/xg9GNBQ9NWCeQ6mE8ewtBH/l6Qw1/NRMyQHUNiQfJPiwROWVCpBcdGHAIOe+/tZ9ciUn5SX94URbfpGejkwjZ7GbP8bO8v+jKtubE9Iq0P4O+t1Xzqa8Zf0Ow7FBi0jdj03vc96uWKDz3rG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nghd1IzB; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nghd1IzB"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-525da75d902so2857966e0c.3
        for <llvm@lists.linux.dev>; Wed, 02 Apr 2025 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596521; x=1744201321; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=nghd1IzBS1qkvsznbM7M2t2OkBPQiyN/dybjkRZ9PnMU/W5xh6phSNGEQTrv25w4j3
         v5HSu0si9LOJ/xybQ4msX+/QZPSUQMbLwxeBRXG+W0Jjqn4CR1gy2wLT1XnYhc+5FsKt
         oBxOXccX3EbUdbGvBourY9uPBtFDiZm0ppcTS/+hYSlDp3Mv37FkzbVk6dKDIMiJw6ap
         K6bpr9DhBpnw59CXREvjShHVvAUufodJGQE6w8AuW+BdVUOWhw5MmHRYDWO87nmgIPVX
         dOOn++wZXSfn5AbfaKE9I0SeVPML4fhdILyiKeJC9rR3QrMGhr13rb+c4Zq7tyMx+fML
         n+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596521; x=1744201321;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=d0ZFyozbr2T3P9fUJCO7HhJBh/CfoLdREY1oLBOG+UpXKaGsEvy97NfIOnFxJJq9h2
         2JEIXAkG1CFYkxX/94YCMGJ9fAvqoWyL94xpoRihEgQYQmGuHW1nbJC0nvz8hDVujKAM
         5PlxvhYi31Mo12VZuh6grWRrEDRigMgWurYYdEdeCEUt9+4/D5zZMEQoxxuS6rc3RdYV
         hBsQZ/UtdB5CLLh9aeHGAOX1ZnxSyFjYE0HS6XZM1t2zt9fjF1mfGUMGEvlQ7ADyyMni
         JyBLfyE9Zs3dbE1lCBXDGO+dCJLkgj0ihaYQMjzHiLBmGsyGDSGE/iuJ9NKg2Idyz7RM
         5svw==
X-Gm-Message-State: AOJu0YxKf9kVT2kyg/YRQ7F1dLpCqhTzG+JvsP73XBrzg/Nk4OxHTj3C
	EqWyDBs8Zfa5FcIPrQFoaj7cnZWxomctY39A1vA4mSXe1q5qVcPLkPvTB6ZzAqJEZWThB2bMch5
	Fdp3jJDpctfA5Cn0TkAWie9Rh6s4y4Gc59N8JZZyugvaqCl8/MeM=
X-Gm-Gg: ASbGncs2eejHALl2Gf9mrTsck+sFhtNBL0OoqTeqp8/yuM7ClEjZp1+F+IK26Qeyuc0
	iEZqKPyhjvdUO/b6wXeGqpYQdnAR0gfNNx3ARQ2YUjy+OzErXcSAIQX3dbWwDxH9ohk5CLnv6RW
	nveDk9WrznNmW5Bj7G/W9eSA/VZDxSC5SRPPKxr2W8lYx/g5YiV8sGXa3ztq4=
X-Google-Smtp-Source: AGHT+IGZd1b5fqfa6pHXvxexGDlAKss+FYCovowlkAi3Xj1GtUKyZmc4loNHv1qXkrx3HBYz8r1MbDuMAFYoP6L8Qfw=
X-Received: by 2002:a05:6122:1ad0:b0:525:9440:243c with SMTP id
 71dfb90a1353d-5274cfb95a2mr1043348e0c.11.1743596521224; Wed, 02 Apr 2025
 05:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 17:51:48 +0530
X-Gm-Features: AQ5f1JqYWbXD84vj9qiHXH7fpaSiEYXFSjnm4-yFz-CnOCSphgOZJOvkdDjcXGE
Message-ID: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
Subject: clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
To: clang-built-linux <llvm@lists.linux.dev>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, samba-technical@lists.samba.org, 
	linux-cifs@vger.kernel.org
Cc: Steve French <sfrench@samba.org>, bharathsm@microsoft.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm, powerpc, s390 defconfig builds failed with
toolchain clang-nightly on the mainline master branch.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on arm:
  - build/clang-nightly-nhk8815_defconfig

Regressions found on powerpc:
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-ppc64e_defconfig
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening

Regressions found on s390:
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening


Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm powerpc s390 modpost "wcslen" fs smb client
cifs.ko undefined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log

ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Arcitures: arm, powerpc, s390
* Toolchains: clang-nightly

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain
clang-nightly --kconfig nhk8815_defconfig LLVM=1 LLVM_IAS=1
 - tuxmake --runtime podman --target-arch powerpc --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld
 - tuxmake --runtime podman --target-arch s390 --toolchain
clang-nightly --kconfig defconfig LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
