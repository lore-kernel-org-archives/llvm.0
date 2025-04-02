Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726805BAF0
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598175; cv=none; b=QCPTyMB5YvZ2FSvViF0UcRWCyiKVsbzVO5wW/wKPuw+QVGZQHuiv7k9OeYI4SVpZn0IiPsHdAUEKR5YjSMx/Ou8tuREyMYNrK57svh5GNe0R5XT7t9/ClTxL9GYH+jKdID+dZ90RRS1H0co6koHUUs985EWyKa6egGAvxhuRJks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598175; c=relaxed/simple;
	bh=iy8gPSknBpYANxR3oDbou+tV9uyY16PAcTCT3p0TVTQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SVk+zediXD1eByOAxUAqhc+ak9E6kKuy5QG2fTonJ3e0znSL6Q8H3jfumMRuIgFfHH3cE6EuC1wjsxGuilr7CTRrgDLH3cVqbWRZWLPddMPygoX0QyuFx2goJtTmGjiEi8oygL5mH0L8UfMAgm+dmb6Q5AkqjIfcxWMrjJnjHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgBgNtpr; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgBgNtpr"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52403e39a23so6009474e0c.2
        for <llvm@lists.linux.dev>; Wed, 02 Apr 2025 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598172; x=1744202972; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=jgBgNtpr323qAty5eIoA6dwbvarRiiIPY2MDol319x7UScNC6lN0qyZjbPJRD2Pb/y
         LQ/DFIgZdfhapthEYkxRCzrUARYb+UyBu3KCE5fF5yjqYFD250JeZpLBzEQ4PxbgWkNW
         g4J679PNC+f6d8KAsybdefEBbdMR3UHNZCjlTyjWWCmHcda4FsVY3WXom/RSRVoMlUe6
         ohqfWswm5F47SRX10I2J5iRovWDuGOKNXZypaOBGlAs4H6ohx0HUYWEdmIWMY4mpknwZ
         V2V0Ph2uyxU5/dtefv2+oOLGCtLosD8xVuKKFCeggPEsusma4a81k7hypLs5uL2Lja5L
         UIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598172; x=1744202972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=GPNSRDUoe13PGqlaN784Mg1MsbqdDZKuycwxhB9Pxy3rLxTHj4VyrfhB8Gks6rojv7
         N3O2WaVN+VtefYo6DdRiTN59WnMJBOglWlrSbUl5dxZXtA5bSIzB+IZ8PZMbDnNxOIX6
         TwJrm7fAn3wQp8CnPMy2N9HxXMS/E1fP2wJ3MN18+9ebGDXZrWN8nSFCchAqVIcqKA/c
         pzfu0oNT9CqRWLkCk0WXgbnr9a9B3IchKj2pT8yPx4AHObM+fFxgTV2msT0PErZkGjXd
         B/FZ+NnDojtB99QRIWfLiLaBwFvr1wwT7zkTI2EgM/UzpdC7JHfRUkuBVjk/zvywH1jj
         TWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBJW0z46oHU5c9em7/Zv0CbgRFpDm5ms2zXaOXLrM8Ld8s32kDvnvczvamPjSO2BT8Pi/C@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5vWUbpDXQjcq1lNA0P3KskmYD8X8Uc/U++I8RhchGfalXanwF
	QvysWEZPBWD3P2VvTVSE1SOLpSxn9ipdN6lu2ttJIeg0GfxIe1i8X9nq/OIhlz8MMkS8+/8EqCn
	RWURceudVVvHmcQYqaaTxYu8O6ITgoxLBADqxZg==
X-Gm-Gg: ASbGncss7yXukjmj5Zl6eXIwJri9CfcT0aNXWypvKlGXQvywkbKdQsxiCTvE5ceDwIf
	fO9Wq2LN9avHz/MtbjK9NFoKmSrg1aaLxuV6p5nkqyJPdqYGeZ/9EKjMytSDLuD9Ew8IMw2hkS7
	AS5xGwRKbL5gdqhXcwVja8igrjClehFmABGwxPs0rd7S7Nc41zBWGIt+76WUk=
X-Google-Smtp-Source: AGHT+IEZPV71xCZFRaiMP7CnHUqII0vri11WJXA0JOvFvWq6jg//KmbiEFno6N5n8nVLL7zZFwNgKtdEbJvUoV78150=
X-Received: by 2002:a05:6102:f8f:b0:4c1:9bdb:6188 with SMTP id
 ada2fe7eead31-4c839e38348mr1583448137.13.1743598172341; Wed, 02 Apr 2025
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:19:19 +0530
X-Gm-Features: AQ5f1JrYBDqdwedr2g0EeIuRXqX4Zi5GT7DMBhpK7McR8fimUhQCIrzEPDNgmhA
Message-ID: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
Subject: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
the lto-thing, hardening and lto-full config boot failed with toolchain
clang-nightly on the mainline master branch with no console output.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on rk3399-rock-pi-4b:
  - boot/clang-nightly-lkftconfig-kselftest
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-full

Regressions found on dragonboard-410c:
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-lto-full
  - boot/clang-nightly-lkftconfig-hardening

Regressions found on dragonboard-845c:
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
no console output

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
Starting kernel
...
<No console output>


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
* Toolchains: clang-nightly (Debian clang version 21.0.0 )
* Kconfigs: lto-thing, hardening, lto-full

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/config


--
Linaro LKFT
https://lkft.linaro.org
