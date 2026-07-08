Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9983FC5A9;
	Wed,  8 Jul 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498751; cv=none; b=jGc1qF62HaHEo5+64bqjYyyO5DqS1WFQddfNIlAX99hNZOO6Hgapp3snPneAyezT9Ra4hnXH8DNUEAS2n6pUaphZX9gjdkJ4CUHSgCdHGxv76iRqC6Q+NL1Ge/TFjDmObOrHs+dyU4p+JpkS7ZuUtj4rQVkeLAAnR9/grcXhhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498751; c=relaxed/simple;
	bh=L8xrwy1wAV8dOvDrY3stuA6RC7TDLo6fFJT0Cz4lBR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ea6Yyd9ti2hBCo6ZmXaxOCG9RXVcXTb1wEI1KKDJYcvbwbkapbiTOPhAJJVvodeXcgB19Mv21HuJLKQdalvamXITEbGd9526HeEo6l/HFl9iTruk29+uMIyJNQAZ4trL2/6ow6FGSqxT642IxZWLIi/iyHrapu2MzXHezaTnXCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2JdwlFY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2JdwlFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFE81F00A3D;
	Wed,  8 Jul 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498747;
	bh=fDbYOu5MC8eM7P1Q25vO1fGH/4mGQfgGvuGLd3+fUN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=h2JdwlFY0eVsLUg4fj4HIg1Y88i0vCZYoyplfuRbbozz4RNgk42r+MLUpuOFOD5mw
	 +RU65pj13TE3hI5RN9/2u/iJrV/trmSvmCCeSVW4Z3uuPy7yDDcfWaa3jmEc5Gxg+P
	 MRBKq+XBvTxK6ZnojSciuJr8Q6w4u0T+SNEbLpMj8rpEBGxIgezOgc9o7ESvAeNimS
	 0cfb3hyWuZkWP6b18UOROsY4eW1ODkVZk5sylSLm7sAeKU5UDXapfb/c0ZqJISgBCO
	 A1bs4S3CxxEJ/dWZzFHB7yvv0ZlSDHTR9o9sEt6Uic5JEwJBkRswDJuUdrqjO/NKRV
	 JnLT66Ou+l4tQ==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>, Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:core/entry 2/3]
 arch/s390/include/asm/entry-common.h:49:18: error: call to undeclared
 function 'task_stack_page'; ISO C99 and later do not support implicit
 function declarations
In-Reply-To: <202607081402.DO1ePla3-lkp@intel.com>
References: <202607081402.DO1ePla3-lkp@intel.com>
Date: Wed, 08 Jul 2026 10:19:04 +0200
Message-ID: <877bn5sxl3.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08 2026 at 14:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
> head:   34ef6308418f138395a664bf9f5d80ace9825ac6
> commit: 7fc04d7044aaa5ffe2afe78979fe6ddd5da24f10 [2/3] syscall_user_dispatch: Make it configurable in Kconfig
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607081402.DO1ePla3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/s390/kernel/traps.c:24:
>    In file included from include/linux/entry-common.h:5:
>>> arch/s390/include/asm/entry-common.h:49:18: error: call to undeclared function 'task_stack_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       49 |         pai_kernel_exit(current_pt_regs());

Bah. I missed to spot the header ordering change putting the
asm/... includes in front. I really hate our include mess.

Let me fix that up.

Thanks,

        tglx
---        
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 43afee3e1b29..9336516430a1 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -2,8 +2,6 @@
 #ifndef __LINUX_ENTRYCOMMON_H
 #define __LINUX_ENTRYCOMMON_H
 
-#include <asm/entry-common.h>
-#include <asm/syscall.h>
 #include <linux/audit.h>
 #include <linux/irq-entry-common.h>
 #include <linux/livepatch.h>
@@ -13,6 +11,9 @@
 #include <linux/sched.h>
 #include <linux/syscall_user_dispatch.h>
 
+#include <asm/entry-common.h>
+#include <asm/syscall.h>
+
 #ifndef _TIF_UPROBE
 # define _TIF_UPROBE			(0)
 #endif
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 310c72e6988d..2002c7aae435 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (C) 2020 Collabora Ltd.
  */
-
-#include <asm/syscall.h>
 #include <linux/elf.h>
 #include <linux/entry-common.h>
 #include <linux/prctl.h>
@@ -16,6 +14,8 @@
 #include <linux/sysctl.h>
 #include <linux/uaccess.h>
 
+#include <asm/syscall.h>
+
 static bool syscall_user_dispatch_allowed __read_mostly = true;
 
 static void trigger_sigsys(struct pt_regs *regs)
