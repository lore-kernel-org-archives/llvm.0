Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69D2F29;
	Sat, 24 Aug 2024 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724493545; cv=none; b=T/JN4aAcc5qGwJ3yK4qX8Xrhi5wq2Uhwv6rdWakebV94CIVkChRxSTG/iUS+ftF98mnjcQd9l1Nm/sLPqc86ydfr6eQuOTEwXUmGthb9AH8j5NDo6dg4EfQ2NVycI07NnxEZ7zBtftJCdHit5Ov9XYKkJTC/FUW6Qms55oDooos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724493545; c=relaxed/simple;
	bh=kd3Y1SdUQ69/GH7tpxPJ/MQTlDnghkcrXvEzYYi8CLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffTAMintUZtI/J4JD7RLyoogdJVx6Io4sIuZwJzEv3J/4063z8gHlKhzN+twPK1mnvc4Awl7BYnV1kDXMt/eujFkKmVromPkEKt40j30qV5FhdXzKafOYLtBIdBsei2NKYpt8hckeoW0dW+CFdjIhwcfS+s0BvZz5Z9isi2Ewso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqABBJ1O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqABBJ1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724493542; x=1756029542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kd3Y1SdUQ69/GH7tpxPJ/MQTlDnghkcrXvEzYYi8CLk=;
  b=GqABBJ1OczqlE9at1kvi1oOBICJ4FiNP1iwrs9L2AmBpS1sIPjCCZyFf
   v3LVQARcMVZh7Wx94HFlxasTND0rAzFOu3I0FjlVT63CyNp2Msy6pnh57
   ofidJiZktzbF7L3EUvFKVVXqqZSKAUNsQLPU7tAX4adHBUf+KkJOJnQUM
   P+IKX4fWLQ8RCM/wQluRgGR9CYRYS5MG8x4CQLQ1u8yY6oJYTjv9XotaK
   ev0hgSAoWh1k7QrcfufDVxH1L+gI/C+a5Dp9KHiul4nrIl8wl6tAn2vZ3
   qSuMTcdOMv/KDyV4f9uOWXIC1iIJBSmXYXU9vbUo5Cl+hDStSs0azJ787
   w==;
X-CSE-ConnectionGUID: dvtHkCcDTSmSzYQwzvB/tQ==
X-CSE-MsgGUID: 9NPLuUm0TgeuGV9G1+KTxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="48364298"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="48364298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 02:59:01 -0700
X-CSE-ConnectionGUID: NSml6T7ZR5CTluUDf+GJNw==
X-CSE-MsgGUID: CMUAUd4xTuyh+z5OM4baIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="66856781"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2024 02:59:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shnXt-000EOp-1T;
	Sat, 24 Aug 2024 09:58:57 +0000
Date: Sat, 24 Aug 2024 17:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yufan <chenyufan@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/core 5/5] kernel/time/timekeeping.c:220:7: warning:
 comparison of distinct pointer types ('unsigned long *' and 'typeof
 (tk->last_warning + (100 * 300)) *' (aka 'long *'))
Message-ID: <202408241701.NSEI3MOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   42db2c2cb5ac3572380a9489b8f8bbe0e534dfc7
commit: 42db2c2cb5ac3572380a9489b8f8bbe0e534dfc7 [5/5] timekeeping: Use time_after() in timekeeping_check_update()
config: i386-buildonly-randconfig-002-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241701.NSEI3MOV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408241701.NSEI3MOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408241701.NSEI3MOV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:220:7: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (tk->last_warning + (100 * 300)) *' (aka 'long *')) [-Wcompare-distinct-pointer-types]
     220 |                 if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jiffies.h:129:3: note: expanded from macro 'time_after'
     129 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   kernel/time/timekeeping.c:230:7: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (tk->last_warning + (100 * 300)) *' (aka 'long *')) [-Wcompare-distinct-pointer-types]
     230 |                 if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jiffies.h:129:3: note: expanded from macro 'time_after'
     129 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   2 warnings generated.


vim +220 kernel/time/timekeeping.c

   203	
   204		u64 max_cycles = tk->tkr_mono.clock->max_cycles;
   205		const char *name = tk->tkr_mono.clock->name;
   206	
   207		if (offset > max_cycles) {
   208			printk_deferred("WARNING: timekeeping: Cycle offset (%lld) is larger than allowed by the '%s' clock's max_cycles value (%lld): time overflow danger\n",
   209					offset, name, max_cycles);
   210			printk_deferred("         timekeeping: Your kernel is sick, but tries to cope by capping time updates\n");
   211		} else {
   212			if (offset > (max_cycles >> 1)) {
   213				printk_deferred("INFO: timekeeping: Cycle offset (%lld) is larger than the '%s' clock's 50%% safety margin (%lld)\n",
   214						offset, name, max_cycles >> 1);
   215				printk_deferred("      timekeeping: Your kernel is still fine, but is feeling a bit nervous\n");
   216			}
   217		}
   218	
   219		if (tk->underflow_seen) {
 > 220			if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
   221				printk_deferred("WARNING: Underflow in clocksource '%s' observed, time update ignored.\n", name);
   222				printk_deferred("         Please report this, consider using a different clocksource, if possible.\n");
   223				printk_deferred("         Your kernel is probably still fine.\n");
   224				tk->last_warning = jiffies;
   225			}
   226			tk->underflow_seen = 0;
   227		}
   228	
   229		if (tk->overflow_seen) {
   230			if (time_after(jiffies, tk->last_warning + WARNING_FREQ)) {
   231				printk_deferred("WARNING: Overflow in clocksource '%s' observed, time update capped.\n", name);
   232				printk_deferred("         Please report this, consider using a different clocksource, if possible.\n");
   233				printk_deferred("         Your kernel is probably still fine.\n");
   234				tk->last_warning = jiffies;
   235			}
   236			tk->overflow_seen = 0;
   237		}
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
