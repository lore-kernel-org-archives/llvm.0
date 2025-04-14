Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBD27F73F
	for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646886; cv=none; b=JEgin/wtSo+yJ6+o2Wd7BXNF9ggYT5rHZQlw3+KwUGonUNfRhAlVaUrlWnnEedThqYODD/buyu4P71+WJ59GMzXWLca/CkKoZN4M8c9n0TM/SpDTga0Bu8XwJ3ZwAdNtYWSRD2NXC12zXvsk8Wsj4B3qsn/jyvv/ABpRSDL90Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646886; c=relaxed/simple;
	bh=YsDDrqdiKPewJFDI/ZaIPX3S15luwx8n2Mto/qWn4FU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FGGdttYqlvxGhIqzrQgHWaCHLpnDRwvqR4/c/oSPHch9XLF84TJyX6GlBrRzNs7g4mYTQRFyC5BR4zeaOT6YuUWf2LiRWdv3Y+cHLQjxb7h3I1kSMyEc5fVY/BVNRKC34wwfwOSaC1qKDmVGiYdWcDntM8Tl459loVf3IDVSldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+UGElNk; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+UGElNk"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-525b44ec88aso2132197e0c.3
        for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744646882; x=1745251682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=K+UGElNkQBIKt5ZI3JVaZXIKbVxs1qvo4UMe7lnfGnOIIrUiavha5nCQLAuZc48/Ey
         Wo0jxhSW+7rAwaZc/C+eXj7uFAVQiBNepXU+kJLmpVlW1VwwSXAjYQhrMyCIPWUaQ90s
         kwQhnoYjWM1aWAE/B1EkK7o5MXSQaemBUzeuverq3Ct0NRKAuOwRswQUrXD1swwyvO/I
         FMGbjp2nRp8oLA7+H5Y/gPwhqFafquE84Zocn1Jd0Kv1m2w7LDmCu17CDrgNleBr5U9I
         aGUZ7L8Y+AxclASBQ7jq027w6whvQaCN7bOtgGwJSfhIDwY9Yxk7gr7QuH8kzLwTxbGE
         e/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646882; x=1745251682;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=CjjLNhjiSejR9i3kCCZrpZa8OCAzOZc6UabKLkxQfqNn0HlPTJNY4cshqKuXMYh4Le
         dWlFEAOzSJF+ln9SIjX2jTBtIzMSZmAB4d6cDw5DOmeUZM7q3dpid0UxNdCpdkIl4B0O
         miuVFQ4ggi3LiHH8GH+WOlglfZDUulYQbtrFfbPX1HnjmD8+FaXQTcy47XzHyDXVDR/A
         GHD+Wyjebh81sVvBK79uemZwt0WUhEAKNxhEEbM9VeWOddv9BKKI1wsmtCSrLNskOY5+
         C7CsuzigQSeplfimOg9hUtOAWKapmdFbYNlmo48ZEjdbmW5OPZLXQVpCS5z8MBu8f3Uk
         LS8Q==
X-Gm-Message-State: AOJu0Yyk0GPRhCo3WAqmelOykilFrqp4NuydzZuoSIp+dUCkSuTsx6lB
	PoDENPCmOnGphB6TG1qwG9dkTCedNbyGeAmYzpO//ziC42vX5i1IMAk7DmZ9u3kas3EtmktRN0w
	wFcN0uFgWkKA4IcKdfK9ye6nWW7c7Dl3XTb4V3nu1OUPNl/a7Xdo=
X-Gm-Gg: ASbGnctHJ78C43SjstLjtkCTAP354Gstoo7jGrsHO6Kgj252MHk5vaysbqhB15JkLqL
	rtnPfTG2a0s2txppx5R0ae+afQ0ZX76c30C0Vo2BwajmlJGjEyv5NZeywvU0EhE0MKCaxONvU94
	gr0GDO4pZ8e4opw63baeNlTVtyyQ2GRj1XmjDmj7Wrv6li8lPVKhykC4s=
X-Google-Smtp-Source: AGHT+IHBAGkweFTifi1qPgR9IAfMLmuSmWZaZQ6DuipMBRn0J0LfwS+rc70yp8/jIym5PdQxz5lfL2wrwCdthfYvTjU=
X-Received: by 2002:ac5:cdf7:0:b0:528:6ea9:bc45 with SMTP id
 71dfb90a1353d-5286ea9d6a9mr5875777e0c.7.1744646882420; Mon, 14 Apr 2025
 09:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Apr 2025 21:37:51 +0530
X-Gm-Features: ATxdqUEU9CbNcg5O-P00XITiRp_i9HXoSVbIKt6BMPS9caFWsHNxBM8T9sm2aH8
Message-ID: <CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com>
Subject: x86_64 clang-20 clang-nightly config lto-full failed - ld.lld: error:
 linking module flags 'Code Model': IDs have conflicting values: 'i32 1' from
 vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o
To: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 config LTO_CLANG_FULL with korg-clang-20 and
clang-nightly on the
Linux next-20250407 and found again on next-20250414 tag

First seen on the next-20250407.
Bad: next-20250407 and next-20250414
Good:next-20250404

* x86_64, Build
 - Build/korg-clang-20-lkftconfig-lto-full
 - Build/clang-nightly-lkftconfig-lto-full

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: x86_64 clang-20 clang-nightly config lto-full failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
ld.lld: error: linking module flags 'Code Model': IDs have conflicting
values: 'i32 1'
    from vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o

Clang-20 versions:
   "name": "clang",
   "version": "20.1.2",
   "version_full": "ClangBuiltLinux clang version 20.1.2
   (https://github.com/llvm/llvm-project.git
58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)"

Clang-nightly versions:
   "name": "clang",
   "version": "21.0.0",
   "version_full": "Debian clang version 21.0.0
   (++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

## Source
* Kernel version: 6.15.0-rc2
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: b425262c07a6a643ebeed91046e161e20b944164
* Git describe: next-20250414
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27929871/suite/build/test/clang-nightly-lkftconfig-lto-full/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114590/suite/build/test/korg-clang-20-lkftconfig-lto-full/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/config

## Steps to reproduce
# tuxmake --runtime podman --target-arch x86_64 --toolchain korg-clang-20 \
   --kconfig defconfig --kconfig-add CONFIG_DEBUG_INFO_REDUCED=y \
   --kconfig-add CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y \
   --kconfig-add CONFIG_IGB=y \
   --kconfig-add CONFIG_LTO_CLANG_FULL=y LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
