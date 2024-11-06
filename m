Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1606524B26;
	Wed,  6 Nov 2024 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730865250; cv=none; b=IM+DQPK3bUZL+qO+CdUfEJb7pNrIM1EKfalcZ1+lSoTn5jERhXe/hk6/RKiU0dOQp+eNyrA8lkH5JQJq/qwT/EooG5aRBbQMEVZushW/2b4tWntEQ44iUONF0JCi6PxFYqoQYfBYTCbhztU2bcIsiKUrZXBZ8JdE3EjI/Neoa+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730865250; c=relaxed/simple;
	bh=Lg+VSJ/ITkfZnNhW216TMLxZH060ib+rzW1/iKEr43U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxhyZM8CUSVPV67x8wuQdeDgpPDZoQuNdLLZmiHSW3luDoLI9p4JI6+BCXyR7TjK2hkm2Fsrp63zInnlkvWwMN/L8T5ubdi+FR0EtotahI4z2bDhYuvc6yEdoYehESo/Uqg0GA2EyYBI+HrTB8FFq03jsC/tU6th+YSIfKK27L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZObMgjZc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZObMgjZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730865248; x=1762401248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lg+VSJ/ITkfZnNhW216TMLxZH060ib+rzW1/iKEr43U=;
  b=ZObMgjZcErw0EJJv4VbVMgxjS1PeSD9MagcU4D+fQFsta4zhgnkxY2mX
   b6YesF297EAY8QdQHRE/CxxfpwYEvsOUwYV85Jlvl4crOwV4l+qPcWcRp
   t2FDXnEhaPcTU0mm9K62kC1B+Z62spS6B1qJAzYgus/qu1fKFDgq+vzDy
   c8ZmnMR0sFnIDjzIVFoYzEwZoNdbw9/j9EM6AkxzTN6sDQBGyW92oWXLf
   AIsSMc/FW47zS7DahSCFOq8udmBJwVFNktNXYIhiCDtD1VKr54XkHrxJJ
   EIgTXvcUU6cr55LeEZ2adEn9f3cIrAUGv1gQinsUcY0ZOQpw7Ds/YE5Fk
   w==;
X-CSE-ConnectionGUID: 3FfF+eG4QtOjiYSPZYCKTw==
X-CSE-MsgGUID: K/gkxNaASNqTNJxc1Fb0zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33491126"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="33491126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 19:54:07 -0800
X-CSE-ConnectionGUID: QgUqtY+aQy+ZFajXfryGEA==
X-CSE-MsgGUID: zNe8Rz2zRV6w6/qfUwfUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="121818535"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 19:54:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8X7L-000muo-2q;
	Wed, 06 Nov 2024 03:54:03 +0000
Date: Wed, 6 Nov 2024 11:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/tick-sched 1/2] kernel/time/timer_list.c:157:8: error:
 no member named 'last_tick' in 'struct tick_sched'; did you mean
 'next_tick'?
Message-ID: <202411061145.k78ALFti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/tick-sched
head:   d67df7dbb69ed36e14b2a422701f94c99b326759
commit: 23222c256db9ba9f5fea170e21083cb7afb78509 [1/2] tick-sched: Remove last_tick and calculate next tick from now
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241106/202411061145.k78ALFti-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061145.k78ALFti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061145.k78ALFti-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/timer_list.c:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/timer_list.c:157:8: error: no member named 'last_tick' in 'struct tick_sched'; did you mean 'next_tick'?
     157 |                 P_ns(last_tick);
         |                      ^~~~~~~~~
         |                      next_tick
   kernel/time/timer_list.c:149:43: note: expanded from macro 'P_ns'
     149 |                    (unsigned long long)(ktime_to_ns(ts->x)))
         |                                                         ^
   kernel/time/tick-sched.h:74:13: note: 'next_tick' declared here
      74 |         ktime_t                         next_tick;
         |                                         ^
   5 warnings and 1 error generated.


vim +157 kernel/time/timer_list.c

289f480af87e45 Ingo Molnar         2007-02-16  142  
289f480af87e45 Ingo Molnar         2007-02-16  143  #ifdef CONFIG_TICK_ONESHOT
289f480af87e45 Ingo Molnar         2007-02-16  144  # define P(x) \
9b04bd27564cfd David Miller        2007-05-09  145  	SEQ_printf(m, "  .%-15s: %Lu\n", #x, \
9b04bd27564cfd David Miller        2007-05-09  146  		   (unsigned long long)(ts->x))
289f480af87e45 Ingo Molnar         2007-02-16  147  # define P_ns(x) \
9b04bd27564cfd David Miller        2007-05-09  148  	SEQ_printf(m, "  .%-15s: %Lu nsecs\n", #x, \
9b04bd27564cfd David Miller        2007-05-09  149  		   (unsigned long long)(ktime_to_ns(ts->x)))
a478ffb2ae234e Frederic Weisbecker 2024-02-25  150  # define P_flag(x, f)			    \
a478ffb2ae234e Frederic Weisbecker 2024-02-25  151  	SEQ_printf(m, "  .%-15s: %d\n", #x, !!(ts->flags & (f)))
a478ffb2ae234e Frederic Weisbecker 2024-02-25  152  
289f480af87e45 Ingo Molnar         2007-02-16  153  	{
289f480af87e45 Ingo Molnar         2007-02-16  154  		struct tick_sched *ts = tick_get_tick_sched(cpu);
7988e5ae2be70b Frederic Weisbecker 2024-02-25  155  		P_flag(nohz, TS_FLAG_NOHZ);
7988e5ae2be70b Frederic Weisbecker 2024-02-25  156  		P_flag(highres, TS_FLAG_HIGHRES);
f5d411c91ede16 Frederic Weisbecker 2011-07-31 @157  		P_ns(last_tick);
a478ffb2ae234e Frederic Weisbecker 2024-02-25  158  		P_flag(tick_stopped, TS_FLAG_STOPPED);
289f480af87e45 Ingo Molnar         2007-02-16  159  		P(idle_jiffies);
289f480af87e45 Ingo Molnar         2007-02-16  160  		P(idle_calls);
289f480af87e45 Ingo Molnar         2007-02-16  161  		P(idle_sleeps);
289f480af87e45 Ingo Molnar         2007-02-16  162  		P_ns(idle_entrytime);
5df7fa1c62146a Thomas Gleixner     2008-02-01  163  		P_ns(idle_waketime);
5df7fa1c62146a Thomas Gleixner     2008-02-01  164  		P_ns(idle_exittime);
289f480af87e45 Ingo Molnar         2007-02-16  165  		P_ns(idle_sleeptime);
0224cf4c5ee0d7 Arjan van de Ven    2010-05-09  166  		P_ns(iowait_sleeptime);
289f480af87e45 Ingo Molnar         2007-02-16  167  		P(last_jiffies);
c1ad348b452aac Thomas Gleixner     2015-04-14  168  		P(next_timer);
289f480af87e45 Ingo Molnar         2007-02-16  169  		P_ns(idle_expires);
9b04bd27564cfd David Miller        2007-05-09  170  		SEQ_printf(m, "jiffies: %Lu\n",
9b04bd27564cfd David Miller        2007-05-09  171  			   (unsigned long long)jiffies);
289f480af87e45 Ingo Molnar         2007-02-16  172  	}
289f480af87e45 Ingo Molnar         2007-02-16  173  #endif
289f480af87e45 Ingo Molnar         2007-02-16  174  

:::::: The code at line 157 was first introduced by commit
:::::: f5d411c91ede162240f34e05a233f2759412988e nohz: Rename ts->idle_tick to ts->last_tick

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
