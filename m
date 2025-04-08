Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E626A088
	for <llvm@lists.linux.dev>; Tue,  8 Apr 2025 12:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115736; cv=none; b=qnfTMFDsgorVvv3FoSkPPGec1U//v5JE1w8e5jHQIlas7X3AQ9tRBPY5hfrE4r1DiswR1awbUoZWpPVQjgj4+kkTWYmfpdA/XXV0OD+Bg38tb4mJHlg3LhCi2YYntBc1nYu56wPzPGR4hV25z/QVIrUwINXjsamff15xW3qnOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115736; c=relaxed/simple;
	bh=fo/D7Vy/bHCJLwja2xD/bb/2rXotbdfX/H7Zo3+wDT8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gxxbxFqhPA2pFwX5ivjYLu2307izUgsdGUcL0/NgzzE2daetJtO1jnPjG6seS9HBEhtsrbtMrmZlHSbY+jJQP0wv702OWc13nJbWe33L30pEiPdUukqbTE5qdiZJyAhKEP4/RfE1PT5ofCgMMyNcbQ07wDa//5tFNpHDcvA7g5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3EW4pW8; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3EW4pW8"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso1355019241.3
        for <llvm@lists.linux.dev>; Tue, 08 Apr 2025 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115733; x=1744720533; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=A3EW4pW8KAjePqKSsqEm48ORR6wC3uYCposhDejstj1+cSiMim5I2Yx/FBqoJ/0/lt
         1DYN2qNXTvnE61cwb6WP2HxUR9ZsBlMnQ//1qs9xxJVD2vr5uHDUb4955J7p/7xsSD66
         0WahokzkbeeOo/AvdpwugLotM5wQ65EQM6qYiy5q3VvJOKtEZ7/9hqJBcQ5rD5g1OGtH
         rFvwP7ZXzHTsz9NxPnVh/gLGru6WEoAeqSUVzmEYx6QA39XdN57vli5ktKnDiEcBXkMi
         Xy5zW5aecNck+22WyxUtsw2PgB1EZcM6LqVX2XtWzznjbKgQp6Pu+u8GfbrsTti6AXrn
         fyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115733; x=1744720533;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/U112c3eNoEpdOFrvh7CcjezylBSmoKAUzWeh1M4C48=;
        b=RP3RY7FXAyZDjLwry27gOEJ+G+vXCutH6JXdxy/I+sjG5ot7XWV4R3VyAFWSeQokk4
         l7lRF2ExHkWqaIMyjagbOiJnhlVr+V9bWptAhI8wcrdAhhqc7B0SO1FHNn7J8adWAcQd
         r4asLzMoP1yLtJnhRKof/ijsWRWf6TzoaFoUdqxTi+NKY9RNu2us+5sBuJv8XsDPzI/n
         LsJoEQZRCQwlPsJ+2F0BhEIwTkVA8Xi7xgeh9lDD4JZ6cC2vPDnWJ+gUYHQGOih8n7/5
         byyTOPB5pMoOZpRfdV0ILc0qb1qHX+lz+QRiV34DFzjBY1gxlGlF1IM5P6Fvhf+bXMin
         gxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf2uyGVmlibwKnqjmB4DsEwS3tS8McEY8iAcI3j4EFpXMvUJVTUAK64XrzA5fbKI2cK0Jr@lists.linux.dev
X-Gm-Message-State: AOJu0YzGwnWX+vJNLiP79E7caW7gzL+RKgg/cwa3zbPHHBqVsTredKHz
	xuPYaYQtlkhbO1BnbFfZhqXIDI4wnUxJH3Zv0CV3liCOpvH+Sm7ApMDefEg0kxHRW5mXXvo2s3i
	q9PnTYlHT6CmekWQCa66zsNxm7RHaxN8X7Jc8ZQ==
X-Gm-Gg: ASbGncvC9NYIfDL3QuRxlkxOLsaHx/lDxgv8UNLAATfXl6nHZnzcQUMvq7UkGB0CLUz
	qKwiL2Qajv1E1Qflo8JKwQ/Vch4yBVTDhPjG/aopsoosmkCuaYrKwIsw8uKEVd9lI/nJpM9mCMc
	3RfNh07kcjoRytY7fgqJAqNl1UFQH+VWGFvo/pf41WrBgImseK4/nZBm/1J/Y3knYDuNg=
X-Google-Smtp-Source: AGHT+IFfrUZA9P0FlfVvDGw+QCkUVYYIjMI5wcSJPSzAp7n+zPY08mgfTxQqvgd8poJltS31C52pfXlDC6xYxKM2j78=
X-Received: by 2002:a05:6102:504b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4c8568c0b92mr10407478137.6.1744115733375; Tue, 08 Apr 2025
 05:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Apr 2025 18:05:21 +0530
X-Gm-Features: ATxdqUEWaftFPwcDydUZjRrXkKZePynV0fvjVXPcjzvBxMxN2KkMbyUQeWe8Fe4
Message-ID: <CA+G9fYsNUbN0PsDQBqVAoUSjSXa5igOjntBFh_TF6m8A4FNDsw@mail.gmail.com>
Subject: sound_kunit.c: error: address of array 'card->id' will always
 evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-sound@vger.kernel.org, 
	kunit-dev@googlegroups.com, clang-built-linux <llvm@lists.linux.dev>
Cc: Pei Xiao <xiaopei01@kylinos.cn>, Takashi Iwai <tiwai@suse.de>, 
	Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 build allyesconfig with clang-20 failed on the
Linux next-20250408 tag.

First seen on the next-20250408.
Bad: next-20250408
Good: next-20250407

* x86, build
 - build/clang-20-allyesconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: x86_64 allyesconfig address of array 'card->id' will
always evaluate to 'true'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
sound/core/sound_kunit.c:271:31: error: address of array 'card->id'
will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
  271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
      |                                ~~~~~~^~ ~


## Source
* Kernel version: 6.15.0-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
* Git describe: next-20250408
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250408/testrun/27937063/suite/build/test/clang-20-allyesconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vQpM7f8SQvntzGG0Tdgxj2amGb/config
* compiler: clang Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)

## Steps to reproduce
 - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig allyesconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
