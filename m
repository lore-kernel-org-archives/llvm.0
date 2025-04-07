Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BA747F
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026369; cv=none; b=fgDKlY7WhixG13GjKcbLpKvAkZQuwom9UsFvhkx4JxBrYBvR6aXCuResa4Kxo5tUrOmzfSG6g25oD7iJqLRwZ0Sdwut3LkNzJfXwBCHSYVCceuCdb4F9GO+LHxpIgsUcGZ99fnnRJu1L3QXz4UBnQRY/4aF4Nim785rtI2YN4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026369; c=relaxed/simple;
	bh=A8kTu4vOxFAwnxbMPk7okErIzXN4OhpFsl+LBPki/7k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mSISLIKUhTGf8JCDzm9R3utJdf3GO0jCDAOdX7kv2mQlnz0KvJT/jlAVV+6FsUrd/Iu8ozHabHBwcEn9O47S9Q98v2/KBuje8d3ORHHt3mswWQD+DNR/qEAh0JaoDPPxjrWoN/5+iDkkqykQ0ZKlbTyEwG0oapAMlJ0EWWVP+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zo02hwxe; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zo02hwxe"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b9d9b02cbso1783270241.1
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744026366; x=1744631166; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=Zo02hwxeo9cIXP0SCWqnRLF9zh+egH1+cNL7zknUN6SSv72zSDV6xn0/YdipS6GS35
         3FrcZtjQjDDH8gELxiBy481q7NAJt5rQ3YzUUr+opnhYgHg6EoSigJE0CHptIMu5tIUf
         GS4Iqx8u1fwlCzN0cPVxREcm+MuX7BXmJpvsm/WQMWgGyMSVzJDRn7unLwAIs93NktCi
         SMHgiv295gNbn9tfVnF/hixovu636UNaD8ZV5TVwX3Y9hqalPrMY78jsvRfIOOW0s/BW
         YZnUCJOr+naycY7z22f5zH3jAiGAqBJFuX5ySZgwhju31a7oLIefks5hwqfIAKCKkJPp
         P3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026366; x=1744631166;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=XzoCBwajfoiKNUlrqYQVdO3CQf+0SPjv0fgqM+6ZpN180yQ5KtD7XMgM+PYzP9if/5
         2cvzqC5SG8wOGMMttwrMmoopbH630keGeM1DRzr0v4UFOFMGnyWMPZVy7usiaNe2gGup
         /U71ksHFi8PYeyn4zK3V/J61D82lojgeIiqFoNE/G1he0gi+y5Fl3iHW2vwZi6yme1AJ
         RT7ZG4vV1wwmiv09HUfUrM7Y5SKtAYP0CRLP07RP91wMkMfJZa5gOm++FpjGIKHSqLrX
         e+oVeEYie5/xeVk4csDc6mpkv2OQxV8snpcMMRxxj4/WQu3yAZiAqUIT3zkywtqSCtQr
         1IIw==
X-Forwarded-Encrypted: i=1; AJvYcCWkAR/dcbbbT+23vR9aY0yu88nIf87a1OljMUGDUkrMerj6Bgn7XPtO26wy+kcXzQqmx+vd@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv1ZkF33Fv5VkaDx/vsPStwXOGAAXmWLyrvLdDga3Yp+w5noWd
	WN238RI04ly7XXrdEtPpdleFwqqMoDTfr8VCCasCcas0jnscLfd1oqt50hcWeD6iK7TxEo05jh9
	xfQDDfisaZcufYDsZUYV1suTRR/rBpVgA3MLSQg==
X-Gm-Gg: ASbGnctmdsLnfjouRqcVk5hwXh1cmnQWCTvtBYpnNPQ8f9apWP9r3IJKVqsjiLcpUHL
	6VuNxFHlbuQBWwM+Fcite11GGyST5yzcOgKCIiKVwo69KBkmJvPICvqjC5s0f8M3uYj7AFqj84u
	FJVe8S++0Sd9R1HTKgBjUlddwWUbYHSAJ76zIN3KcUdpL0zMGaDvUMoYlTm1c=
X-Google-Smtp-Source: AGHT+IE9MxO7qQqlLmViUipY97IXRe0HOeQE88hqfb3Q8OgiFR34X0CHQfKfsgfdHN0p4DcAQoZhNv1HOhhMCdAhmoM=
X-Received: by 2002:a05:6102:292b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c85539e126mr8042397137.7.1744026366667; Mon, 07 Apr 2025
 04:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 17:15:55 +0530
X-Gm-Features: ATxdqUHUzOVzZWX9xHaaGdI7CQeUYcGWMEQ1NQQGH41E_gk9k9xrAq8CaQ9neOQ
Message-ID: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
Subject: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log but
 gcc-13 boot pass
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
Linux next-20250407 and no console output.

The gcc-13 builds boot pass on qemu-x86_64.

First seen on the next-20250407.
Bad: next-20250407
Good:next-20250404

* qemu-x86_64, boot
 - boot/clang-20-lkftconfig
 - boot/clang-20-lkftconfig-compat
 - boot/clang-nightly-lkftconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
<no console output>

Clang-20 versions:
  "name": "clang",
  "version": "20.1.2",
  "version_full": "Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)"

Clang-nightly versions:
  "name": "clang",
  "version": "21.0.0",
  "version_full": "Debian clang version 21.0.0
(++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

qemu-system-x86:
   installed at version: 9.2.2+ds-1+b2

## Source
* Kernel version: 6.15.0-rc1-next-20250407
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
* Git describe: 6.15.0-rc1-next-20250407
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930138/suite/boot/test/clang-nightly-lkftconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/config

--
Linaro LKFT
https://lkft.linaro.org
