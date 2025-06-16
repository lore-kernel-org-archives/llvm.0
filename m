Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4522BEFF0
	for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 17:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095165; cv=none; b=NAENHVrk4GXha18P/If/RHbxo3uM2R0JP4XufDBUFvz43dMTqrdd/4zNgq5eY+s897YfOur9BHhu4Sf+/4Ebap5kj/anG9wzpjUWybY9LZuBIvhYxAlzO7upn4EH/mrQ76GqDtyd1aUClS80LkaI2EMjRC3iSZ5wv+IbjTdIwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095165; c=relaxed/simple;
	bh=Q7Ges5P1PVYHwy+iNtt6pxwf3UmEQp/AJtPeqBac0pA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bxK7256QW7MQO0+Nr94p7sXKmLmOGrWd9ok81Euo6m/dAHsCuylBDgGnbpnGakifj0xM40ThqZHOTnRfkBKaDQwvkzWi8uOpescONJUT0DQugWT2U/GY+YvwP/FOH0Ipilbsm4HzNCzjfvyXNKI8NQK+Y04gtkobhpfqFLqDqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLuj/LXc; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLuj/LXc"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so647172241.1
        for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 10:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750095162; x=1750699962; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynk8wNhlj9yzC6y9Kpo/JK+rurY2Maqm6+QVk7hFPII=;
        b=fLuj/LXcTwnTZdEWM+0LEonq6ABQc38x6f+pTqP5bd8cD6o2qThYME2iROwClzEmwW
         opRYSq/5q5QVmbfOQi2r0lWAL+4TSyqkuGJAQOkJ1uuJD+BZ1b7uR/FoFkQLiVfQuC5/
         Mh9qRCU8JYfmm4E+ZfBJO88qcm5vqVAi9mhgOxVMzh7g//cniGshbFGhsdUXXC27Qrkb
         XWZZw339X3wSNJHyVLlZsxW3GXr7Tj9it7sWbVsJUqgpiibJVBLvr+p68f52bcJ5mOgF
         zTtA9c1a5YCrUTqQ+PgxWb97ibbJRfIYDzSNQzzJy+tuLRUnUq+FCk80qYVYpWnJ1d96
         JGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095162; x=1750699962;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynk8wNhlj9yzC6y9Kpo/JK+rurY2Maqm6+QVk7hFPII=;
        b=sz43i+ElQs8sEPBfZ6brQGtMYCUU9QCSifEy2T1QNNzTSfVW/eFktqML7W/bCfLGOD
         GZrFTiGb0ZvUFejT+JcRnRbNqDVRHKVhGKzgzwfHLFJ2fqJofBJTBVrEfq/QC7W2cEGj
         H9JEd1I/n2jQ2fB0J7EtY5DP+jejAa6E6FiX9Aicz8wgbbxEdx9pOAiU5E9UxdEb65ps
         wTy7b7pAU4HejJTc9EMuC1XS9MhTIOLknqDUZOsb6M4aCwQwy4laC5Cx29KSTxpZEZVu
         n3g8NqvpNhNHRc68D1QOIuNmWBhDNvQxMAq3SJM4cccB9JyJbRqXYK9JaY3jlB4x5xx5
         AIoA==
X-Forwarded-Encrypted: i=1; AJvYcCXxARHJyyUoUkCIRXEuU2RPa0O1PFgweAk57nBUQydyMbgpWxzZb/CGuL3TK8EUP+3/cmk/@lists.linux.dev
X-Gm-Message-State: AOJu0YyVn6YS0PlC9qja3X9MMqNiTUwC8XJ0Jc31qA8Tg8ZyylakPb4Z
	il9Dryi79bTP6YJC8D3+qu+PNIPfsamicXNiZNDo9Kb3vOxXrA6v3N56KivkWSQDqe5QNdNqD4W
	8BKhxxtSQ+ijuHdBVcfKzuZ6jFGxHbaY2p1rCaK3sBA==
X-Gm-Gg: ASbGnct2ygLgvCspbVJ2FsZyi17V4FC6/I9mI2kk3vDk837NnVnRsb5JaHMXHE4HpgJ
	hPvK7NX0WEAhAHjgI7GRXIaHvr1GnoujZV9Qo2nRaXQhfTxVS0sLlx5lufuJJEFoZ05Aj1c0O6U
	viWQMuwzcPyrw44SH3LBIqGAY1jRbsgr6yq8TLaH+LCEpef4lQ2ZsN1GujZyYPb7bdQTJ9fl63Q
	IkL
X-Google-Smtp-Source: AGHT+IHtQaJV3ItFaoD7sYxOhigOsQpCwUUKXe1/pzTGG14U4Q2oyXyV0Gt4uPDyhvzpx97Ct8N1h2Gb1D7zC0JZ1x8=
X-Received: by 2002:a05:6122:30a8:b0:531:2d3b:44d3 with SMTP id
 71dfb90a1353d-53148f33d17mr6217406e0c.0.1750095162234; Mon, 16 Jun 2025
 10:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 23:02:28 +0530
X-Gm-Features: AX0GCFvvQJbkAKVmZhMTmTp-xwc52yagBdapT86oaeKvv4z6vLbcUy5yZzQCsI4
Message-ID: <CA+G9fYsqRYU31QyuXUxbcFT7586wyhSM_DFcdWeFJH=vwPcWJg@mail.gmail.com>
Subject: clang: selftests mm pkey_sighandler_tests.c warning duplicate
 'inline' declaration specifier [-Wduplicate-decl-specifier]
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, lorenzo.stoakes@oracle.com, 
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, Keith Lucas <keith.lucas@oracle.com>, 
	aruna.ramakrishna@oracle.com, kevin.brodsky@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings were noticed while building selftests/mm
with clang nightly toolchain for arm64 and x86_64 architectures.

Regressions found on arm64 and x86_64
  -  Build/clang-nightly-lkftconfig-kselftest

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: selftests mm pkey_sighandler_tests.c warning
duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]

Build regression: selftests mm mremap_test.c warning pointer
comparison always evaluates to false [-Wtautological-compare]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
make[4]: Entering directory '/builds/linux/tools/testing/selftests/mm'
/bin/sh ./check_config.sh clang --target=aarch64-linux-gnu
-fintegrated-as -Werror=unknown-warning-option
-Werror=ignored-optimization-argument -Werror=option-ignored
-Werror=unused-command-line-argument --target=aarch64-linux-gnu
-fintegrated-as
  CC       cow
  CC       compaction_test
  CC       gup_longterm
  CC       gup_test
  CC       hmm-tests
  CC       hugetlb-madvise
  CC       hugetlb-read-hwpoison
  CC       hugetlb-soft-offline
  CC       hugepage-mmap
  CC       hugepage-mremap
  CC       hugepage-shm
  CC       hugepage-vmemmap
  CC       khugepaged
  CC       madv_populate
  CC       map_fixed_noreplace
  CC       map_hugetlb
  CC       map_populate
  CC       memfd_secret
  CC       migration
  CC       mkdirty
  CC       mlock-random-test
  CC       mlock2-tests
  CC       mrelease_test
  CC       mremap_dontunmap
  CC       mremap_test
mremap_test.c:425:31: warning: pointer comparison always evaluates to
false [-Wtautological-compare]
  425 |                 if (addr + c.dest_alignment < addr) {
      |                                             ^
1 warning generated.
  CC       mseal_test
  CC       on-fault-limit
  CC       pagemap_ioctl
  CC       pfnmap
  CC       thuge-gen
  CC       transhuge-stress
  CC       uffd-stress
  CC       uffd-unit-tests
  CC       uffd-wp-mremap
  CC       split_huge_page_test
  CC       ksm_tests
  CC       ksm_functional_tests
  CC       mdwe_test
  CC       hugetlb_fault_after_madv
  CC       hugetlb_madv_vs_map
  CC       hugetlb_dio
  CC       droppable
  CC       guard-regions
  CC       merge
  CC       protection_keys
  CC       pkey_sighandler_tests
pkey_sighandler_tests.c:44:15: warning: duplicate 'inline' declaration
specifier [-Wduplicate-decl-specifier]
   44 | static inline __always_inline
      |               ^
/usr/lib/gcc-cross/aarch64-linux-gnu/12/../../../../aarch64-linux-gnu/include/sys/cdefs.h:424:26:
note: expanded from macro '__always_inline'
  424 | # define __always_inline __inline __attribute__ ((__always_inline__))
      |                          ^
1 warning generated.
  CC       va_high_addr_switch
  CC       virtual_address_range
  CC       write_to_hugetlbfs

Warning: missing Module.symvers, please have the kernel built first.
page_frag test will be skipped.

make[4]: Leaving directory '/builds/linux/tools/testing/selftests/mm'


## Source
* Kernel version: 6.16.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
* Git describe: next-20250616
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
* Architectures: arm64, x86_64
* Toolchains: clang nightly
* Kconfigs: selftest/mm/config+defconfig+

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28765515/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250616/log-parser-build-clang/clang-compiler-pkey_sighandler_tests_c-warning-duplicate-inline-declaration-specifier/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0viPHafKAe0u89drIv5fcwu2/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0viPHafKAe0u89drIv5fcwu2/config


## Steps to reproduce on arm64
 - tuxmake --runtime podman --target-arch arm64 --toolchain clang-20  \
   --kconfig defconfig  \
   --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
\
   --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
\
   --kconfig-add CONFIG_SYN_COOKIES=y   \
   --kconfig-add CONFIG_SCHEDSTATS=y LLVM=1 LLVM_IAS=1 debugkernel
dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
