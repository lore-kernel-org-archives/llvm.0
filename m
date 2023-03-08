Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4748BF3
	for <llvm@lists.linux.dev>; Wed,  8 Mar 2023 19:59:39 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 204-20020a2514d5000000b00a3637aea9e1so18889903ybu.17
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 11:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678305578;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=75JQmb/2KggtqnlZKQD+aSAFlbHw0CtgDC3x9xG3MXM=;
        b=HWG0A+XkRq6twRJy5FCucxErakdKYN0oMAYvCCn3ZI1cCMvglOVMpDKuFql1Y0uh2Y
         3cZXtdl0lp07vx/fXzb4LAOgt0Wg2ZCsfS9OrGBzLDap2FvKwx4bGac0GH/Oo9sF7a4b
         pjL8PFTxK0XOY5Q9RDmx3kY4Lag/tgRAavcmBTwNImW/Icmgg958s96iCJr/74cKNOU5
         tGTBOQ6ilN3is8O7jQ43CNPWYphf6mH7X9wnLgGCaKX0MhQujqjO/LX8cRBthq9oxnw3
         qLMkl42AUsKC2XjS9KRCxVRJpAp1GrS/MQCYD3VQ4YrB7q4mGh222LMzISBw3vMoQBNT
         LU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678305578;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75JQmb/2KggtqnlZKQD+aSAFlbHw0CtgDC3x9xG3MXM=;
        b=kHJ+lyRv4SHyjobKpbWRa1ksvYYYwvFsBDOFF7amqXxY7atDnHpD06cvgTsEtDp+OG
         mRAiRWU1/yIkCKvEy1kY7douQec37V8d9zneC7vQYDqfGXezUG1upDQs8su7By2PQjvL
         43/Rpw6AhF8sw/RaQdKfcMjOwTbwtvLDxLZMJ6pR3u7lxX6zaeLq8yC+tMhMpbYutdRa
         oC2IQ8KMF8bq+gb8a2DbijCS5TKlzcHTkzSP4ldBd0HqdVhUVn6d6+BZOiQ60+IABakw
         52ocHmlfRoxfUcpInTesWWVNRspnwTGW8jrv1qM5vwH99fKiB5bMjvonUekFmtOKCfCb
         KUYg==
X-Gm-Message-State: AO0yUKVDJVb+mu3dsNa9xhMROeYFfLY5rcwdWOIHl/yplvwn/pxw0PxG
	a4Fs5+CsqYMiib28vllQ8pXuOoNby4yPZugkPxA=
X-Google-Smtp-Source: AK7set/W8YgrfqLqO2DsSDgmSbjC36iO7b3J9S+nBQeHpBWVIn+oyIeyu9lwEDVZBihPkIbBlvXfsXnEi0hMYdB09MM=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:a5cc:f0f5:1fc6:713])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:10e:b0:98e:6280:74ca with
 SMTP id o14-20020a056902010e00b0098e628074camr9682385ybh.1.1678305578279;
 Wed, 08 Mar 2023 11:59:38 -0800 (PST)
Date: Wed,  8 Mar 2023 11:59:33 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678305573; l=3674;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=n/DgE8/iWvhcIDq6uHGKDuymOdplKVpBIQ1VLbggOSQ=;
 b=VAkvIJbJTkDeHd40DTYOHT9IKSmJn5AcgJ0BQGadPjGIhMhIcZ3SeyloIsJYdk4uQjG8ko5T6Rio
 az+Ic4RZBwaVxEdwoIlZhP4x65sC5M4iqJjuLYncBuv75eAO2qn/
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230308195933.806917-1-ndesaulniers@google.com>
Subject: [PATCH] selftests: sigaltstack: fix -Wuninitialized
From: Nick Desaulniers <ndesaulniers@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Thomas Gleixner <tglx@linutronix.de>, "Chang S. Bae" <chang.seok.bae@intel.com>, 
	Len Brown <len.brown@intel.com>, Borislav Petkov <bp@suse.de>, Stas Sergeev <stsp@list.ru>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Building sigaltstack with clang via:
$ ARCH=x86 make LLVM=1 -C tools/testing/selftests/sigaltstack/

produces the following warning:
  warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
  if (sp < (unsigned long)sstack ||
      ^~

Clang expects these to be declared at global scope; we've fixed this in
the kernel proper by using the macro `current_stack_pointer`. This is
defined in different headers for different target architectures, so just
create a new header that defines the arch-specific register names for
the stack pointer register, and define it for more targets (at least the
ones that support current_stack_pointer/ARCH_HAS_CURRENT_STACK_POINTER).

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Link: https://lore.kernel.org/lkml/CA+G9fYsi3OOu7yCsMutpzKDnBMAzJBCPimBp86LhGBa0eCnEpA@mail.gmail.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>
Cc: linux-api@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: lkft-triage@lists.linaro.org
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Len Brown <len.brown@intel.com>
Cc: Borislav Petkov <bp@suse.de>
Cc: Stas Sergeev <stsp@list.ru>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
---
 .../sigaltstack/current_stack_pointer.h       | 23 +++++++++++++++++++
 tools/testing/selftests/sigaltstack/sas.c     |  7 +-----
 2 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/sigaltstack/current_stack_pointer.h

diff --git a/tools/testing/selftests/sigaltstack/current_stack_pointer.h b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
new file mode 100644
index 000000000000..ea9bdf3a90b1
--- /dev/null
+++ b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#if __alpha__
+register unsigned long sp asm("$30");
+#elif __arm__ || __aarch64__ || __csky__ || __m68k__ || __mips__ || __riscv
+register unsigned long sp asm("sp");
+#elif __i386__
+register unsigned long sp asm("esp");
+#elif __loongarch64
+register unsigned long sp asm("$sp");
+#elif __ppc__
+register unsigned long sp asm("r1");
+#elif __s390x__
+register unsigned long sp asm("%15");
+#elif __sh__
+register unsigned long sp asm("r15");
+#elif __x86_64__
+register unsigned long sp asm("rsp");
+#elif __XTENSA__
+register unsigned long sp asm("a1");
+#else
+#error "implement current_stack_pointer equivalent"
+#endif
diff --git a/tools/testing/selftests/sigaltstack/sas.c b/tools/testing/selftests/sigaltstack/sas.c
index c53b070755b6..98d37cb744fb 100644
--- a/tools/testing/selftests/sigaltstack/sas.c
+++ b/tools/testing/selftests/sigaltstack/sas.c
@@ -20,6 +20,7 @@
 #include <sys/auxv.h>
 
 #include "../kselftest.h"
+#include "current_stack_pointer.h"
 
 #ifndef SS_AUTODISARM
 #define SS_AUTODISARM  (1U << 31)
@@ -46,12 +47,6 @@ void my_usr1(int sig, siginfo_t *si, void *u)
 	stack_t stk;
 	struct stk_data *p;
 
-#if __s390x__
-	register unsigned long sp asm("%15");
-#else
-	register unsigned long sp asm("sp");
-#endif
-
 	if (sp < (unsigned long)sstack ||
 			sp >= (unsigned long)sstack + stack_size) {
 		ksft_exit_fail_msg("SP is not on sigaltstack\n");
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

