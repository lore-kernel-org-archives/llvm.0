Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051869979;
	Tue,  2 Apr 2024 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060030; cv=none; b=c8izejbtZh6S4e6+JMQJGgpS78/OhDQrRkqBLkXnMXWlNpOTI0Wt58q/anHkvcmuN8FZTeZFgUf+gdJ/J3+lwUHc+qszCCR9CCTD1Zzbeb0/T1G/sH4Nm+IV67zCCIpzYfaDfycVZEDi4h3phsVwrgManexkj7RfH2JaMf0AhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060030; c=relaxed/simple;
	bh=aDYNZXT29sScLZwmqSx01fCQPYlaD+3kwmxnBllTiKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkF5SlzgcWSrDwJEmElQolXKOvPzAUWzWSh4BkBERbG2OtyWr7fjlfjCfvQdmUt3qH9s55XdUGx25HcEzCbjwzZIrbsYdr3IHcbAZt2F51DwY1CkoH1UeFzNDpJzVU0hC4mN86yGrdVKSk3Y4hqVXaqiSz9GHyLCyVZLa/pCekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwO+Zu9a; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwO+Zu9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712060029; x=1743596029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDYNZXT29sScLZwmqSx01fCQPYlaD+3kwmxnBllTiKs=;
  b=MwO+Zu9ajUbANj7lU0m3Wo3EKupR6ZI5jnHZi9I9Ke5MejJqVxH3pff+
   2AFySTdGjXuR/FUZIwO9FsMz+41GJ7VNKphhSyUe5YGBDvgwzauBrJzG9
   MtpuAyQ1evUDBdGvtzbDOIySBMNp0IyhHh929jshdgHTBegXO/UUEL41A
   e2NOnJZnHB/XQxTJHERE7qhkTfc4kr7mZZwmbhj8S4lkLH3sY9mUfGMMS
   aBXFyqGIBOFzK2uTT3wQzx/Bk0fbMWjKdStXZmF1Jd7Q203ym8u1FU95w
   ctsjsfRuODhouXKNxKhcSmhw5I/7k/g4sPzOW4A1ySrsbFU37Wmt+VauG
   g==;
X-CSE-ConnectionGUID: j7Y0k9wsQuanZYZPMjyE5g==
X-CSE-MsgGUID: z/vZmmrkT8m3ssjJMUS6OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7440348"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7440348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 05:13:48 -0700
X-CSE-ConnectionGUID: woligKHCRlaAEiQ8YDQvDQ==
X-CSE-MsgGUID: 2SX0pIfYTs+TU9lvyrrjVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18105411"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2024 05:13:47 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrd1L-0001Ax-1f;
	Tue, 02 Apr 2024 12:13:43 +0000
Date: Tue, 2 Apr 2024 20:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Atish Patra <Atish.Patra@wdc.com>, Anup Patel <anup@brainfault.org>
Subject: [atishp04:kvm_pmu_snapshot_v5 15/26] arch/riscv/kvm/vcpu_pmu.c:11:9:
 warning: 'pr_fmt' macro redefined
Message-ID: <202404022021.LcazvaRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_pmu_snapshot_v5
head:   b0e65c6b9040f92d37b78f24aab4948fd3f26bf8
commit: 77445e9905bd24241148bb9786af53c67e1a054d [15/26] RISC-V: KVM: Implement SBI PMU Snapshot feature
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240402/202404022021.LcazvaRh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022021.LcazvaRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404022021.LcazvaRh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:11:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
      11 | #define pr_fmt(fmt)     "riscv-kvm-pmu: " fmt
         |         ^
   include/linux/printk.h:347:9: note: previous definition is here
     347 | #define pr_fmt(fmt) fmt
         |         ^
   In file included from arch/riscv/kvm/vcpu_pmu.c:14:
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
   2 warnings generated.


vim +/pr_fmt +11 arch/riscv/kvm/vcpu_pmu.c

8f0153ecd3bf18 Atish Patra 2023-02-07 @11  #define pr_fmt(fmt)	"riscv-kvm-pmu: " fmt
8f0153ecd3bf18 Atish Patra 2023-02-07  12  #include <linux/errno.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  13  #include <linux/err.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  14  #include <linux/kvm_host.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  15  #include <linux/perf/riscv_pmu.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  16  #include <asm/csr.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  17  #include <asm/kvm_vcpu_sbi.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  18  #include <asm/kvm_vcpu_pmu.h>
0cb74b65d2e5e6 Atish Patra 2023-02-07  19  #include <linux/bitops.h>
8f0153ecd3bf18 Atish Patra 2023-02-07  20  

:::::: The code at line 11 was first introduced by commit
:::::: 8f0153ecd3bf184bc06afca25b737c707fa4d765 RISC-V: KVM: Add skeleton support for perf

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
