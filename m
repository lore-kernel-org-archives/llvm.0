Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCFE6FCC
	for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 20:14:01 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m15so38046086edb.13
        for <llvm@lists.linux.dev>; Tue, 25 Oct 2022 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vzUdb+11OKpC0haeLKMasIe3sD0mOGH9tVf3ZkY+4u8=;
        b=E8BpASHZAVf03zN2kUs0l9qsat9fcsLBjkGkz0CFaixaOoXBDDyu38xMRanCH0dok2
         vurzNRXSLSvP59d3cMpirp/LO0FnlfQdk1iQ56926JxbcMmPfuBbY37BoFgj1awrmvbP
         IRK1KwnOkWF2yiew6XmGbPGtGsA6CxbzBezpTRbni4JUmSMfrbj6j1n7AWQoM7oufwTE
         aU9P0iNnnXWQdv87zdObKZN19cwAz/BvTvvr8xHpUEzfC1KEfN6ZCYbnQvKilUfGfXYm
         yp3xrPIIVztII5ylLDi2SmdfxGZKQyxSzXi3NRJ3c96UBNZ7L+miuxqDWm0jbaxLYMzo
         PbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzUdb+11OKpC0haeLKMasIe3sD0mOGH9tVf3ZkY+4u8=;
        b=M8aD71JPuNRY0mzKnSY5S51BYlzito39RIOZq+B5bPR94vNXPRom/m1GzmlGgbL9j6
         n6jV3myBP2JcpLMdPSGxBlMi168lZcJPc+lrD7xCzohzGWtPZF1u9KKw6AlH9a95C9z6
         yY6aSD9WymUX7HdVRUfNXHfcXFk+FKV8lImCtPGeQYyYZtrU/mUE9C3efw4cJdoJRfn+
         DSk3eH8rOpCxRmLRpvRE3wnMlVHwS9cXP+yFVKuBtNfixXfvWqSPD4hozAN4K29DmQ/Y
         DgOra8saXe7bym4NCe5DHHQfCkult2b6tE3gOsgxKWzBiqwQ3HyKCYPFh76CP4OmaA2S
         jSNw==
X-Gm-Message-State: ACrzQf0EXWZBgjAtAUNcXwU4EGpYcjO7Gfaq5HnbkLp+LAQ69G7u5Czm
	IsPbBeHvZJm72IODUJ/e4G5BOEKJ5PeDU4J2Nu1M/A==
X-Google-Smtp-Source: AMsMyM5SO8H54i1MFlQl3A+CbWaIQWqLYJjvjJKFKcyHUUIdiSyyXkGpoP0d+pDsONsQ4EqSyaQXI6dJKF6OaNJIbJc=
X-Received: by 2002:aa7:d996:0:b0:461:88b8:c581 with SMTP id
 u22-20020aa7d996000000b0046188b8c581mr16617249eds.111.1666728839942; Tue, 25
 Oct 2022 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 26 Oct 2022 01:43:48 +0530
Message-ID: <CA+G9fYucNpHyqt-24OURGSndrBB0z5crq_X0KZTwqQppw9T6fA@mail.gmail.com>
Subject: clang: mm/khugepaged.c:1729:7: error: variable 'index' is used
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Gautam Menghani <gautammenghani201@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Vlastimil Babka <vbabka@suse.cz>, Yang Shi <shy828301@gmail.com>, 
	"Zach O'Keefe" <zokeefe@google.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Following build warning / errors noticed while building x86_64 with clang
on Linux next-20221025 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 6.1.0-rc2
* git: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
* git branch: master
* git commit: 89bf6e28373beef9577fa71f996a5f73a569617c
* git describe: next-20221025
* test details:
https://qa-reports.linaro.org/lkft/linux-next-master-sanity/build/next-20221025

## Test Regressions (compared to next-20221024)
Regressions found on x86_64:

 - clang-nightly-lkftconfig
 - clang-12-lkftconfig
 - clang-14-lkftconfig
 - clang-13-lkftconfig
 - clang-14-lkftconfig-kcsan

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
mm/khugepaged.c:1729:7: error: variable 'index' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (!xas_nomem(&xas, GFP_KERNEL)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:2063:47: note: uninitialized use occurs here
        trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem,
                                                     ^~~~~
mm/khugepaged.c:1729:3: note: remove the 'if' if its condition is always false
                if (!xas_nomem(&xas, GFP_KERNEL)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1716:6: error: variable 'index' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (result != SCAN_SUCCEED)
            ^~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:2063:47: note: uninitialized use occurs here
        trace_mm_khugepaged_collapse_file(mm, hpage, index, is_shmem,
                                                     ^~~~~
mm/khugepaged.c:1716:2: note: remove the 'if' if its condition is always false
        if (result != SCAN_SUCCEED)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1705:15: note: initialize the variable 'index' to
silence this warning
        pgoff_t index, end = start + HPAGE_PMD_NR;
                     ^
                      = 0
mm/khugepaged.c:1729:7: error: variable 'nr' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (!xas_nomem(&xas, GFP_KERNEL)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:2064:15: note: uninitialized use occurs here
                addr, file, nr, result);
                            ^~
mm/khugepaged.c:1729:3: note: remove the 'if' if its condition is always false
                if (!xas_nomem(&xas, GFP_KERNEL)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1716:6: error: variable 'nr' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (result != SCAN_SUCCEED)
            ^~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:2064:15: note: uninitialized use occurs here
                addr, file, nr, result);
                            ^~
mm/khugepaged.c:1716:2: note: remove the 'if' if its condition is always false
        if (result != SCAN_SUCCEED)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to silence
this warning
        int nr;
              ^
               = 0
4 errors generated.
make[3]: *** [scripts/Makefile.build:250: mm/khugepaged.o] Error 1

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_IGB=y --kconfig-add
CONFIG_UNWINDER_FRAME_POINTER=y LLVM=1 LLVM_IAS=1


tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig https://builds.tuxbuild.com/2Gc0JDbUOIN0veL39dqIt03qgEi/config
LLVM=1 LLVM_IAS=1

Build link,
 - https://builds.tuxbuild.com/2Gc0JDbUOIN0veL39dqIt03qgEi/

--
Linaro LKFT
https://lkft.linaro.org
