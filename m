Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BB340286;
	Tue, 23 Jun 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198754; cv=none; b=dP51kTDhYnvmqeGd6DAJkNg0i3PTm4CH41wIa78hEraCaTpYmR5nJlZ3UT0TNBDqQhjNzKgeqNSB4k9sssY7gBrrTAuQ/xLiFalSXy5Ns2l28rAzsxpLdkzHTBpAmigz0dJd37C5+DTszumIKyHw4SNS89Hv9r2cXfTmbkMib8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198754; c=relaxed/simple;
	bh=raxPGN1hx44nq9oN+QIvBKtNOdj1JL7gfwLl9xCfeM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=drBNxkCtjPXdUb+s3LAL9DGHiuqkkpkbM7e6xAiBkDKrUxh8HU66gcGL94Ukua+cyshQH1rDQ/VVGnEjYC9Rw2Oby4vnmTTJhV9U5yUmJxG6UXeUeEDMSDByLhvybDCQXzMC8XkJ6ynVTpXCSFCLLY3+QN5D+Fnr7s89afUyErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Geuvv6O6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geuvv6O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782198751; x=1813734751;
  h=date:from:to:cc:subject:message-id;
  bh=raxPGN1hx44nq9oN+QIvBKtNOdj1JL7gfwLl9xCfeM0=;
  b=Geuvv6O6Q4HP8pFa62Or4pEE/ZitPw9DMPw5cGUKje3kGuHphZtPx6sE
   m0Cd3QRti8sEZqxFw6UogtJZOicWeVtMKal7pQMt4fnsmE65S7ZUB6PXs
   hDuJ5S2C4uvIpbYkvkcLHmFGi52eEojXLhdhrH5PERRIhUT4jBsn208Yr
   b6p1vebPiHs8bbVfbjCMDfqfRA2hZDpHBsUxbrOVmQjD3NtgmxzOknPxi
   Cn7zMnCfY9dNajXSIv4UBTeTAV4ykWuz7Hg5CzjN+KL7h18R6CpBrBxQ+
   iwydVRWMjoT7l4VAmzzz0eVi8yLyXC5uuTH2fn82UrQ+0fm3WYAouo6qa
   g==;
X-CSE-ConnectionGUID: cYWGRgq3RwWEQvrY20qSzQ==
X-CSE-MsgGUID: r7QfzmCLTviXHUKcyXF4ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100485251"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100485251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:12:31 -0700
X-CSE-ConnectionGUID: B15zp/DSTTWCfE2Df/wnXQ==
X-CSE-MsgGUID: CeTGwcNvRMayegetQEMIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249303186"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 00:12:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbvJ3-000000002JT-3ZtC;
	Tue, 23 Jun 2026 07:12:25 +0000
Date: Tue, 23 Jun 2026 15:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 36/36]
 drivers/ptp/ptp_vmclock.c:154:12: error: call to undeclared function
 'get_cycles'; ISO C99 and later do not support implicit function declarations
Message-ID: <202606231516.eb6SPVb5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 759e4e4e18f43902ea6f66c481a45175490cad0c [36/36] treewide: Remove asm/timex.h includes from generic code
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260623/202606231516.eb6SPVb5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231516.eb6SPVb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231516.eb6SPVb5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_vmclock.c:154:12: error: call to undeclared function 'get_cycles'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |                         cycle = get_cycles();
         |                                 ^
   1 error generated.


vim +/get_cycles +154 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse 2024-10-06  116  
20503272422693 David Woodhouse 2024-10-06  117  	while (1) {
20503272422693 David Woodhouse 2024-10-06  118  		seq = le32_to_cpu(st->clk->seq_count) & ~1ULL;
20503272422693 David Woodhouse 2024-10-06  119  
20503272422693 David Woodhouse 2024-10-06  120  		/*
20503272422693 David Woodhouse 2024-10-06  121  		 * This pairs with a write barrier in the hypervisor
20503272422693 David Woodhouse 2024-10-06  122  		 * which populates this structure.
20503272422693 David Woodhouse 2024-10-06  123  		 */
20503272422693 David Woodhouse 2024-10-06  124  		virt_rmb();
20503272422693 David Woodhouse 2024-10-06  125  
20503272422693 David Woodhouse 2024-10-06  126  		if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE)
20503272422693 David Woodhouse 2024-10-06  127  			return -EINVAL;
20503272422693 David Woodhouse 2024-10-06  128  
20503272422693 David Woodhouse 2024-10-06  129  		/*
20503272422693 David Woodhouse 2024-10-06  130  		 * When invoked for gettimex64(), fill in the pre/post system
20503272422693 David Woodhouse 2024-10-06  131  		 * times. The simple case is when system time is based on the
20503272422693 David Woodhouse 2024-10-06  132  		 * same counter as st->cs_id, in which case all three times
20503272422693 David Woodhouse 2024-10-06  133  		 * will be derived from the *same* counter value.
20503272422693 David Woodhouse 2024-10-06  134  		 *
20503272422693 David Woodhouse 2024-10-06  135  		 * If the system isn't using the same counter, then the value
a6d799608e6a61 Thomas Gleixner 2026-05-29  136  		 * from ptp_read_system_prets() will still be used as pre_ts,
a6d799608e6a61 Thomas Gleixner 2026-05-29  137  		 * and ptp_read_system_postts() is called to populate postts
a6d799608e6a61 Thomas Gleixner 2026-05-29  138  		 * after calling get_cycles().
20503272422693 David Woodhouse 2024-10-06  139  		 */
20503272422693 David Woodhouse 2024-10-06  140  		if (sts) {
a6d799608e6a61 Thomas Gleixner 2026-05-29  141  			ptp_read_system_prets(sts);
a6d799608e6a61 Thomas Gleixner 2026-05-29  142  			if (sts->pre_sts.cs_id == st->cs_id) {
a6d799608e6a61 Thomas Gleixner 2026-05-29  143  				cycle = sts->pre_sts.cycles;
a6d799608e6a61 Thomas Gleixner 2026-05-29  144  				sts->post_sts = sts->pre_sts;
bc484a5096732c David Woodhouse 2026-06-04  145  			} else if (sts->pre_sts.hw_csid == st->cs_id &&
bc484a5096732c David Woodhouse 2026-06-04  146  				   sts->pre_sts.hw_cycles) {
bc484a5096732c David Woodhouse 2026-06-04  147  				cycle = sts->pre_sts.hw_cycles;
bc484a5096732c David Woodhouse 2026-06-04  148  				sts->post_sts = sts->pre_sts;
20503272422693 David Woodhouse 2024-10-06  149  			} else {
de40e94c2ee6a5 Thomas Gleixner 2026-04-08  150  				cycle = ptp_vmclock_read_cpu_counter();
20503272422693 David Woodhouse 2024-10-06  151  				ptp_read_system_postts(sts);
20503272422693 David Woodhouse 2024-10-06  152  			}
20503272422693 David Woodhouse 2024-10-06  153  		} else {
20503272422693 David Woodhouse 2024-10-06 @154  			cycle = get_cycles();
20503272422693 David Woodhouse 2024-10-06  155  		}
20503272422693 David Woodhouse 2024-10-06  156  
20503272422693 David Woodhouse 2024-10-06  157  		delta = cycle - le64_to_cpu(st->clk->counter_value);
20503272422693 David Woodhouse 2024-10-06  158  
20503272422693 David Woodhouse 2024-10-06  159  		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
20503272422693 David Woodhouse 2024-10-06  160  						   le64_to_cpu(st->clk->counter_period_frac_sec),
20503272422693 David Woodhouse 2024-10-06  161  						   st->clk->counter_period_shift,
20503272422693 David Woodhouse 2024-10-06  162  						   le64_to_cpu(st->clk->time_frac_sec));
20503272422693 David Woodhouse 2024-10-06  163  		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
20503272422693 David Woodhouse 2024-10-06  164  		tspec->tv_sec += le64_to_cpu(st->clk->time_sec);
20503272422693 David Woodhouse 2024-10-06  165  
20503272422693 David Woodhouse 2024-10-06  166  		if (!tai_adjust(st->clk, &tspec->tv_sec))
20503272422693 David Woodhouse 2024-10-06  167  			return -EINVAL;
20503272422693 David Woodhouse 2024-10-06  168  
20503272422693 David Woodhouse 2024-10-06  169  		/*
20503272422693 David Woodhouse 2024-10-06  170  		 * This pairs with a write barrier in the hypervisor
20503272422693 David Woodhouse 2024-10-06  171  		 * which populates this structure.
20503272422693 David Woodhouse 2024-10-06  172  		 */
20503272422693 David Woodhouse 2024-10-06  173  		virt_rmb();
20503272422693 David Woodhouse 2024-10-06  174  		if (seq == le32_to_cpu(st->clk->seq_count))
20503272422693 David Woodhouse 2024-10-06  175  			break;
20503272422693 David Woodhouse 2024-10-06  176  
20503272422693 David Woodhouse 2024-10-06  177  		if (ktime_after(ktime_get(), deadline))
20503272422693 David Woodhouse 2024-10-06  178  			return -ETIMEDOUT;
20503272422693 David Woodhouse 2024-10-06  179  	}
20503272422693 David Woodhouse 2024-10-06  180  
20503272422693 David Woodhouse 2024-10-06  181  	if (system_counter) {
20503272422693 David Woodhouse 2024-10-06  182  		system_counter->cycles = cycle;
20503272422693 David Woodhouse 2024-10-06  183  		system_counter->cs_id = st->cs_id;
20503272422693 David Woodhouse 2024-10-06  184  	}
20503272422693 David Woodhouse 2024-10-06  185  
20503272422693 David Woodhouse 2024-10-06  186  	return 0;
20503272422693 David Woodhouse 2024-10-06  187  }
20503272422693 David Woodhouse 2024-10-06  188  

:::::: The code at line 154 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AMZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
