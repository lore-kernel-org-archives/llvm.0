Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91972E8B78;
	Wed,  3 Dec 2025 22:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801895; cv=none; b=jp9KM4W168hxkNmmnx4CMw6qKCZNZuAArsNLeTX34TxywuVu8pX6nrV9t329Gxugsm6rZyEmyT86bYSCyCpXYRdXwouU67Ry+FLv0c6SJVw7uqEoUYwQyz00vo4h81cfONJVdQ3LjeKGpYdKqO0BuqJhP5Ghx8xu5ayJQNq+9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801895; c=relaxed/simple;
	bh=4Uj9vmf5W51Hq1VXIv7uGJ3HGRMZgiH69aSNHXLBM/A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=n9DUVADVslJ3ddEwf8LJXOy7yRIJSGASL+mh9KAmgyS8q2L6w6uUO7pyojdQa8KrzLdzGdhYIbIa1xYK8GRuRaq/qzlAWRpGIVmLmdmXo0KG9LvjTIETl0GEhwfMLXMmItzn2BJOtoY91FgKIt6u87nfZIs3QL+d3cqCc0yjXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=teBeR5Jm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="teBeR5Jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415DAC4CEF5;
	Wed,  3 Dec 2025 22:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764801894;
	bh=4Uj9vmf5W51Hq1VXIv7uGJ3HGRMZgiH69aSNHXLBM/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=teBeR5JmucF/aVSYNvWbrQMxjrj1aDFVSGSjka5MJN9DX0cUY+g95fXVemCkWQs4J
	 WZX7YA1tTnhHEeqTo0FPPHuBnn9BsXt1fON1Xmf/qYeRu98AVU3ZazEGFtzaW39WX2
	 1lw6h+xbEkpLRCsPYdKxugGHQ9rVC3K+9b9NQOW8=
Date: Wed, 3 Dec 2025 14:44:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 9966/13055] kernel/watchdog.c:74:22:
 warning: unused variable 'hardlockup_si_mask'
Message-Id: <20251203144453.be34d189c5e6668ce2da06b3@linux-foundation.org>
In-Reply-To: <202512030920.NFKtekA7-lkp@intel.com>
References: <202512030920.NFKtekA7-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Dec 2025 09:05:30 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47b7b5e32bb7264b51b89186043e1ada4090b558
> commit: a9af76a78760717361cccc884dc649e30db61c8b [9966/13055] watchdog: add sys_info sysctls to dump sys info on system lockup
> config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
>       74 | static unsigned long hardlockup_si_mask;
>          |                      ^~~~~~~~~~~~~~~~~~
>    1 warning generated.

I'm testing the appended patch but it needs checking please.

The comment for hardlockup_si_mask says

 * bitmask to control what kinds of system info to be printed when
 * hard lockup is detected, it could be task, memory, lock etc.
 * Refer include/linux/sys_info.h for detailed bit definition.

but the variable depends on "COUNTS_HRTIMER".  The comment doesn't
mention hrtimers and I don't see why it should.  Not sure what's going
on here.



From: Andrew Morton <akpm@linux-foundation.org>
Subject: kernel/watchdog.c: fix unused var warning
Date: Wed Dec  3 02:34:40 PM PST 2025

>> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
      74 | static unsigned long hardlockup_si_mask;
         |                      ^~~~~~~~~~~~~~~~~~
   1 warning generated.

Fixes: a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info on system lockup")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
Link: https://lkml.kernel.org/r/202512030920.NFKtekA7-lkp@intel.com
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 kernel/watchdog.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

--- a/kernel/watchdog.c~kernel-watchdogc-fix-unused-var-warning
+++ a/kernel/watchdog.c
@@ -66,13 +66,6 @@ int __read_mostly sysctl_hardlockup_all_
 unsigned int __read_mostly hardlockup_panic =
 			IS_ENABLED(CONFIG_BOOTPARAM_HARDLOCKUP_PANIC);
 
-/*
- * bitmasks to control what kinds of system info to be printed when
- * hard lockup is detected, it could be task, memory, lock etc.
- * Refer include/linux/sys_info.h for detailed bit definition.
- */
-static unsigned long hardlockup_si_mask;
-
 #ifdef CONFIG_SYSFS
 
 static unsigned int hardlockup_count;
@@ -135,6 +128,13 @@ __setup("nmi_watchdog=", hardlockup_pani
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 
+/*
+ * bitmask to control what kinds of system info to be printed when
+ * hard lockup is detected, it could be task, memory, lock etc.
+ * Refer include/linux/sys_info.h for detailed bit definition.
+ */
+static unsigned long hardlockup_si_mask;
+
 static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
 static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
@@ -1250,6 +1250,7 @@ static const struct ctl_table watchdog_s
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 	{
 		.procname	= "hardlockup_sys_info",
 		.data		= &hardlockup_si_mask,
@@ -1257,6 +1258,7 @@ static const struct ctl_table watchdog_s
 		.mode		= 0644,
 		.proc_handler	= sysctl_sys_info_handler,
 	},
+#endif
 #ifdef CONFIG_SMP
 	{
 		.procname	= "hardlockup_all_cpu_backtrace",
_

