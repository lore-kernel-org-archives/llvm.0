Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002F03207;
	Sat,  6 Apr 2024 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712362093; cv=none; b=TP+Wt9OtbToBMxuHszePfqo/R2Sp13RvokutvtOujt/QZtbjLUgSfP4kQsrih29o0axz58T4OPh1DFNB73p6jtJwIlDF67fIwtBklGh1foHZ6YlAj5TC2P4Ogo9BRKAdrIPTvD4Iz/mRCE8PCqmbTn3Xp7ufrkE29G8HyNMXiFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712362093; c=relaxed/simple;
	bh=OyEBKOEOowC75cpht3zWSV3ZRAk3c2S/PN4y+ulobzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQE0OLepUjbVTXw0/6BdZNLxBEUHcaIrwQn75YV8t9QArVPKWSXc+2RqnMzPyIydjnUlia3UIBhBCEdnk7+o/f/EIkCWiuUD62dyz0fcZV1hME9TgyI7hlu5pSCHfZ0q22UID3iXb+D2BP/oSyOUU9jGkH2/O4JknAYvE8IVVOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYgt6tWj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYgt6tWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712362092; x=1743898092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyEBKOEOowC75cpht3zWSV3ZRAk3c2S/PN4y+ulobzs=;
  b=nYgt6tWj9yqEO5UjeWlVHLWFlRNCAo8vh2saGfhxFmm41wRRn6iLt7aI
   v7+SnJtt/femHl1wImYjkMAfpLFTqkgS15bZYU9VeKSL7984e30Z51ooM
   BBNcSs4AS6SvaJie1d9SS/ceb0rVxTHbU63wQxxhnlWns3t+DZPVgojyp
   jSyV+b/NliNzu3GDRzSYur2L183U+L+uP73doCpnAbmlaceZq6l6Byvtz
   VtmZ2uTfja4T1XnhvpsFD+mKNRKF7sqL8cbViEbsepRjLMqVMPQKlT49J
   1elGuQkMSlFvkmwJfanphOdFIrfQxJAg7oiudKedamiuAYYnMbIpJxD7r
   g==;
X-CSE-ConnectionGUID: YHq3VpJdRFWASkW68icX0Q==
X-CSE-MsgGUID: NLz6UFJ5Q7mCZxOQhMuY+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18442828"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18442828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 17:08:11 -0700
X-CSE-ConnectionGUID: 1qdy0Y3ySNyYVu5N8+kElQ==
X-CSE-MsgGUID: 23I31qYjRT69lnR2QVWaug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="23808086"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2024 17:08:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rstbM-0002ts-0j;
	Sat, 06 Apr 2024 00:08:08 +0000
Date: Sat, 6 Apr 2024 08:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 69/93]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:5079:15: error: use of
 undeclared identifier 'kvm_vm_stats_read_iter'; did you mean
 'kvm_vcpu_stats_read_iter'?
Message-ID: <202404060740.RLbOVHYz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: ef0f2e8cc6f036e45cface7a6e208ffcf4de2fbf [69/93] virt: convert to ->read_iter and ->write_iter
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060740.RLbOVHYz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060740.RLbOVHYz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060740.RLbOVHYz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:5079:15: error: use of undeclared identifier 'kvm_vm_stats_read_iter'; did you mean 'kvm_vcpu_stats_read_iter'?
    5079 |         .read_iter = kvm_vm_stats_read_iter,
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      kvm_vcpu_stats_read_iter
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4376:1: note: 'kvm_vcpu_stats_read_iter' declared here
    4376 | FOPS_READ_ITER_HELPER(kvm_vcpu_stats_read);
         | ^
   include/linux/fs.h:2148:16: note: expanded from macro 'FOPS_READ_ITER_HELPER'
    2148 | static ssize_t name## _iter(struct kiocb *iocb, struct iov_iter *to)    \
         |                ^
   <scratch space>:98:1: note: expanded from here
      98 | kvm_vcpu_stats_read_iter
         | ^
   1 warning and 1 error generated.


vim +5079 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

  5076	
  5077	static const struct file_operations kvm_vm_stats_fops = {
  5078		.owner = THIS_MODULE,
> 5079		.read_iter = kvm_vm_stats_read_iter,
  5080		.release = kvm_vm_stats_release,
  5081		.llseek = noop_llseek,
  5082	};
  5083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
