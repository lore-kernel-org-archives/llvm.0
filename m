Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985743ABC;
	Wed,  3 Dec 2025 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773938; cv=none; b=L8OWGMH1z2Vd5E+EGcqjqohCdRXCOAC6LLwBhbz4uXUargdBTwDIagdQuNdfcaUYPVVG3yblgG/cMGQsmivYaLHG3KTVoti3Z/4BRXrIn5euH1NFtdvBwMIdt8Ald5MD+e8OZ/69JN9pdfNvDiZzWKjuLTQp2CCTyQWZxJz4M1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773938; c=relaxed/simple;
	bh=bGm5mBtllN9cVnFiRB2YUFaqpxB3XwoKhGeGIWSmyNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvdlQiKnyatJXe57/jqbsXjFgHJASKmAwjm0NBKF3HNRV0+Flt488u54/zL7dG4pxkEGTVDp3um0N4I5ZcT6rivYlegg7xRXHhkR1zGXm9qd/p05ePcWLUJF7MtwRU8HjGJiFPxxPsc59iHIBsugyDSgRWWleiZhL3Q1yUiWgSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZQSQUFLG; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZQSQUFLG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764773931; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=ZwfoRnUKDYgiUKWqxSEPC9CBqxWYSLdFbxtbeOENkE0=;
	b=ZQSQUFLGeByvM7sSlLJ5ZbkNDu5WgZw2S1fg+Q0ehODlJ07n1RZJuSvSMDXJ3aUwjmY7Xd9FiNgsi6S+sQo7UuHkU7tRoiHZf+5qrXPEjxgsWfXYMDrYxRRUt2TmcltBySqpQ+hv1x/iPqQ8UQST9zKctFKgH3T4uDfhuose5TI=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wu.vsSC_1764773929 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Dec 2025 22:58:49 +0800
Date: Wed, 3 Dec 2025 22:58:48 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 9966/13055] kernel/watchdog.c:74:22: warning:
 unused variable 'hardlockup_si_mask'
Message-ID: <aTBQKNgyip6tOCEf@U-2FWC9VHC-2323.local>
References: <202512030920.NFKtekA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202512030920.NFKtekA7-lkp@intel.com>

Hi,

Thanks for the reporting! 

On Wed, Dec 03, 2025 at 09:05:30AM +0800, kernel test robot wrote:
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

I can't reproduce it right now as I'm on travel and only have ARM server
to use. (The reproducer need a powerpc64 machine, or have a x86 machine
to use your reproducer script).

Could you help to test the below patch? thank!

- Feng

---
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 1f59b950c475..5e5ac82a01f3 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -66,13 +66,6 @@ int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
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
@@ -141,6 +134,13 @@ static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_touched);
 static unsigned long hard_lockup_nmi_warn;
 
+/*
+ * bitmasks to control what kinds of system info to be printed when
+ * hard lockup is detected, it could be task, memory, lock etc.
+ * Refer include/linux/sys_info.h for detailed bit definition.
+ */
+static unsigned long hardlockup_si_mask;
+
 notrace void arch_touch_nmi_watchdog(void)
 {
 	/*
@@ -1250,6 +1250,7 @@ static const struct ctl_table watchdog_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 	{
 		.procname	= "hardlockup_sys_info",
 		.data		= &hardlockup_si_mask,
@@ -1257,6 +1258,7 @@ static const struct ctl_table watchdog_sysctls[] = {
 		.mode		= 0644,
 		.proc_handler	= sysctl_sys_info_handler,
 	},
+#endif
 #ifdef CONFIG_SMP
 	{
 		.procname	= "hardlockup_all_cpu_backtrace",
