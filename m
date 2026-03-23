Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA46F2F2;
	Mon, 23 Mar 2026 04:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241556; cv=none; b=ZNFfmdm4juMUukKkE6QUxMdGxycZQu7KUc6v1pDlrvpOG2vBRtW3YnIzePaTfERWVIGgSlAKJn7LGlkL46GuFokt2g5CEgJUMn1+Vv+1u1HXMJEnEalAIQ+D2FBa+B9Cr76WHzVLtm0ADCs2huYfz4zD4CU8/iTahKgbRuuPSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241556; c=relaxed/simple;
	bh=gj4epvDFeIQ+79d0kFwOUUT6v0miu7Biuv1ZAXOuROw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5nYlot8D7x9EQ43gjTMrGDZiUTd2yo+5tGXrM5QZFfFZXxQ0gjbOiHI3i8ZQMIXhE63jhm1JHtUyg6zlOx04F6GsnbZQLK5/v5GK+K19nlqZ7PkXg5WTqIPUigFu230lQG9KasUW7Lkq8exr00PAziXMDbNSRMoX3ZJu6vUFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuJJry5u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuJJry5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774241555; x=1805777555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gj4epvDFeIQ+79d0kFwOUUT6v0miu7Biuv1ZAXOuROw=;
  b=KuJJry5u+ivV+gpx+suSU9PI8Zj9Dp6TIN7f99wfvZSRNVVf1G9LjF36
   nZkqrKrWQN0DYo51Ykkz2RAdP8PFxIetENGSu2HtyKD7Da67xef5sJ1LQ
   2w4bdVVO8f2o4qYGBZFOVWPjacmOwx2uaOMhwplsgC4YntuKoLholMyJA
   iPwfZtuxHV9QJv6Y58yx+xpwkI6YXCL+J905rjignRg93ktBMn7NOlcr+
   RzOjSMcciNXIzQjkalxEfHbeVFZyehPBQNx5vIrNLaRvSY2JPW/VTNYqt
   EsulESvEeVKHAFae5gYoRvNhf6Tt5/kdaa+GmzS+IKgDZ/h+p9/o4DyER
   Q==;
X-CSE-ConnectionGUID: aQ6gZ28RQBOB99qxak0UUg==
X-CSE-MsgGUID: 1ORA72gqSR2WqPUsr0uViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79094656"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79094656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 21:52:35 -0700
X-CSE-ConnectionGUID: MLB8bpFFSDiIx/LFSs74JQ==
X-CSE-MsgGUID: UdD+rqkEQFmh04t6CEyvXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="254384434"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2026 21:52:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4XHD-0000000001t-0njx;
	Mon, 23 Mar 2026 04:52:31 +0000
Date: Mon, 23 Mar 2026 12:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jinghuang <chenjinghuang2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU
 when CPU goes idle
Message-ID: <202603231203.g4WzI66q-lkp@intel.com>
References: <20260320055920.2518389-9-chenjinghuang2@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320055920.2518389-9-chenjinghuang2@huawei.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc5]
[cannot apply to tip/sched/core peterz-queue/sched/core next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jinghuang/sched-Provide-sparsemask-a-reduced-contention-bitmap/20260321-084706
base:   linus/master
patch link:    https://lore.kernel.org/r/20260320055920.2518389-9-chenjinghuang2%40huawei.com
patch subject: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU when CPU goes idle
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260323/202603231203.g4WzI66q-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b1cf9b0835d214bcbd0d6e8882760c07cfccb298)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603231203.g4WzI66q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603231203.g4WzI66q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:13272:3: warning: releasing raw_spinlock 'rq_lockp(dst_rq)' that was not held [-Wthread-safety-analysis]
    13272 |                 raw_spin_rq_unlock(dst_rq);
          |                 ^
   kernel/sched/fair.c:13293:2: warning: raw_spinlock 'rq_lockp(dst_rq)' is not held on every path through here [-Wthread-safety-analysis]
    13293 |         local_irq_restore(rf.flags);
          |         ^
   include/linux/irqflags.h:223:8: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^
   include/linux/irqflags.h:188:13: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                           ^
   kernel/sched/fair.c:13286:3: note: raw_spinlock acquired here
    13286 |                 raw_spin_rq_lock(dst_rq);
          |                 ^
>> kernel/sched/fair.c:13366:2: warning: raw_spinlock 'rq_lockp(this_rq)' is not held on every path through here [-Wthread-safety-analysis]
    13366 |         stolen |= (dst_rq->cfs.h_nr_runnable > 0);
          |         ^
   kernel/sched/fair.c:13363:3: note: raw_spinlock acquired here
    13363 |                 raw_spin_rq_lock(dst_rq);
          |                 ^
   3 warnings generated.


vim +13366 kernel/sched/fair.c

 13350	
 13351		/* Accept any suitable task in the LLC */
 13352	
 13353		sparsemask_for_each(overload_cpus, dst_cpu, src_cpu) {
 13354			if (steal_from(dst_rq, dst_rf, &locked, src_cpu)) {
 13355				stolen = 1;
 13356				goto out;
 13357			}
 13358		}
 13359	
 13360	out:
 13361		rcu_read_unlock();
 13362		if (!locked) {
 13363			raw_spin_rq_lock(dst_rq);
 13364			rq_repin_lock(dst_rq, dst_rf);
 13365		}
 13366		stolen |= (dst_rq->cfs.h_nr_runnable > 0);
 13367		if (dst_rq->nr_running != dst_rq->cfs.h_nr_runnable)
 13368			stolen = -1;
 13369		return stolen;
 13370	}
 13371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
