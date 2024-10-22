Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BC1A3038;
	Tue, 22 Oct 2024 17:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616814; cv=none; b=buXAO7oWOwiWYKjVNpOXqu+COuzoWZC/1YTCQTh+3DQ1ZJlDs1VnW+hzEbg9Qp+R6CORj0uxZ/NlY54FrE1edC7yoOdPUN8hJQHSB3AAPWRFdo3jZ6vlkzauSq/Up+xtgk/CvuWaUJjfkH4tvGxk5ywIRaFM0PqNGKV0Cd85b0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616814; c=relaxed/simple;
	bh=eZz3c8jyWFY02L7STapf35SqajK6ifYXf+OOiBQz2vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjDFxKLUNBfcnYt+pFgC0UmOBepdcZyuQ4uwFAw0xhMUa0VBBqmN6VCzaUqYPISKSCgV53DatJA4VCNHgmVHH1VmyWq0gN3NVbpzMHXGPzshf2ndHg18zXNYeUdfMqqXgnM0aeB3PGmewtOMyqz/liMZJqzhulNIt5W1dLhdrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCHL/qY0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCHL/qY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729616812; x=1761152812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZz3c8jyWFY02L7STapf35SqajK6ifYXf+OOiBQz2vo=;
  b=eCHL/qY0qdCJLnQk50gRaaU1eBqWTfJOertkhkaeOiMJGdV24YZmFz/k
   Xh+VG17gNWveNHnun7w8H0W98crY+wLrun6DQeGdOw4VoIABtToviimwC
   kB92GfBeCvWu8w3zyot8S6hdXKph246aUsrLOa2r2GIYgA3wuI7OwlFHa
   oulfxeedGFBl8EzECQJaSMDGDYibn4IBDJt0/DSF2MWiT7NBxveDQuBJE
   3vzKAxpSSK5hZtOiG3ptaRI5TYqa1lWF4n7dcsGHEoyAu+lPgCsbnEy0y
   IKLbIqZjnLQSweHCg6W1+1c8A+yJVXjmYbX5ChE1UcOuPoJqG/NKqPIKe
   w==;
X-CSE-ConnectionGUID: edscFUiSQKm6xwjjW4Zt3g==
X-CSE-MsgGUID: 4KgE+8qrQmq9iFWKqRQkmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39717919"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39717919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 10:06:51 -0700
X-CSE-ConnectionGUID: Y8RDGjnlReCT0dQ/Bbr53w==
X-CSE-MsgGUID: O/8fPeCdQou+T3L9uSeezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84745613"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2024 10:06:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3ILH-000TqU-1W;
	Tue, 22 Oct 2024 17:06:47 +0000
Date: Wed, 23 Oct 2024 01:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 5847/6080] kernel/sched/ext.c:6741:38: error: use
 of undeclared identifier 'fmt'
Message-ID: <202410230109.19U7hK4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7436324ebd147598f940dde1335b7979dbccc339
commit: 3e99aee7ce48f504c4a7b0e3c46656c8c55731f4 [5847/6080] sched-ext: Use correct annotation for strings in kfuncs
config: arm64-randconfig-004-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230109.19U7hK4a-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230109.19U7hK4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230109.19U7hK4a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:19:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:5329:35: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
    5329 |                 info->reg_type = PTR_MAYBE_NULL | PTR_TO_BTF_ID | PTR_TRUSTED;
         |                                  ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/sched/ext.c:5825:31: warning: bitwise operation between different enumeration types ('enum scx_enq_flags' and 'enum scx_deq_flags') [-Wenum-enum-conversion]
    5825 |         WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
         |                       ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                         ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext.c:6741:38: error: use of undeclared identifier 'fmt'
    6741 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                             ^
   kernel/sched/ext.c:6762:38: error: use of undeclared identifier 'fmt'
    6762 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                             ^
   kernel/sched/ext.c:6794:40: error: use of undeclared identifier 'fmt'
    6794 |                             sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
         |                                                             ^
   kernel/sched/ext.c:6797:18: error: use of undeclared identifier 'fmt'
    6797 |                           dd->prefix, fmt, data, data__sz, ret);
         |                                       ^
   6 warnings and 4 errors generated.


vim +/fmt +6741 kernel/sched/ext.c

f0e1a0643a59bf1 Tejun Heo               2024-06-18  6724  
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6725  /**
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6726   * scx_bpf_exit_bstr - Gracefully exit the BPF scheduler.
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6727   * @exit_code: Exit value to pass to user space via struct scx_exit_info.
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6728   * @fmt: error message format string
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6729   * @data: format string parameters packaged using ___bpf_fill() macro
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6730   * @data__sz: @data len, must end in '__sz' for the verifier
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6731   *
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6732   * Indicate that the BPF scheduler wants to exit gracefully, and initiate ops
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6733   * disabling.
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6734   */
3e99aee7ce48f50 Kumar Kartikeya Dwivedi 2024-10-21  6735  __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt__str,
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6736  				   unsigned long long *data, u32 data__sz)
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6737  {
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6738  	unsigned long flags;
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6739  
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6740  	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf1 Tejun Heo               2024-06-18 @6741  	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6742  		scx_ops_exit_kind(SCX_EXIT_UNREG_BPF, exit_code, "%s",
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6743  				  scx_exit_bstr_buf.line);
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6744  	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6745  }
f0e1a0643a59bf1 Tejun Heo               2024-06-18  6746  

:::::: The code at line 6741 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
