Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CF1D7E42;
	Tue, 26 Nov 2024 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732640003; cv=none; b=WMRmrFG3F4mKUYLp+y1fSWTWDNyvTm84HthuCRxWMeNfzeZpIy05gg3t2WBYzw3MVe+ZtUDYUjXFaoh5i+T2Sq1seU32M5m2l802aiC+6dRAILRw17ByBoM/ufOFaQ+FxycM7s+f9pxkqWP2iR7DDkBai7K2MC0qkmo6xrEyQKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732640003; c=relaxed/simple;
	bh=Pvyh1H6EaLf7PE7LGmr4JCJzNEj1wRxUDn/bAHmyEKU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3T6OBQrlN7CrzXdOBJJzD+810TWFMcb2t56fXU6WGQbPTeSj+wbS1eGqpMeTQIJQRRM63i9LftdAc3KMKADkD9DSikRc6cfKZ/yPFIZQ/fDnYKjKzv4buLsn1gy8EDEltXh9jodX+LAf/aFChE3c1uA0wVYMOZfX+MUYyHJewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGyhRrmx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGyhRrmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732640001; x=1764176001;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Pvyh1H6EaLf7PE7LGmr4JCJzNEj1wRxUDn/bAHmyEKU=;
  b=cGyhRrmxaZsq3Umsy6UDYR1W38CC98VNzG+W6e23DeRe06dXn59cN5WQ
   FYnZ7kM7M4oAqLvB+kEbLkX3nWy3FIWy1ceYVK2bpwRUHw7e7iSAHdVXC
   J3ZMjbVmjC9y3xoxeuKi5sMzvC7haINgL//knZjq0nuYdkETUttYYPhsn
   +uYMARC65DGR23x/MANC3K03gD2vcc+0AV0KLr0ofLy01XOzXpjYIot8a
   OfVwMYE5C2GRIF3+prNsanH3Y3PVbxzLZ638TzhM30yVBI50tzQDGx/fK
   NaAyg3b6ltiyEF9xQVfjJD+oYAw1SKXOV+sva5I9rj2YJNJF2J3Gm75ed
   A==;
X-CSE-ConnectionGUID: 6qH+i5rTSCGgIlhqhYO8XA==
X-CSE-MsgGUID: QE2DNfnLSpCkPXm1gsj6PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50218659"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="50218659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:53:21 -0800
X-CSE-ConnectionGUID: aBhHRwF8RQS4DC5dWINKJQ==
X-CSE-MsgGUID: EDDbNNNqQeyAa3YCp7vApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96726535"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 08:53:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFyoP-0007QL-1Y;
	Tue, 26 Nov 2024 16:53:17 +0000
Date: Wed, 27 Nov 2024 00:53:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 4/12]
 drivers/pci/hotplug/cpcihp_generic.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202411270035.DZwKG9aA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   cd9921a0bc2a79a77a7e1f03f84491760d88b6a8
commit: 066bfe2dc3d6859fc66929c81b49f218f90110b4 [4/12] objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
config: x86_64-randconfig-011-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270035.DZwKG9aA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270035.DZwKG9aA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270035.DZwKG9aA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/hotplug/cpcihp_generic.c:21:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/pci/hotplug/cpcihp_generic.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/hwmon/nct6683.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/hwmon/smsc47m1.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/hwmon/smsc47b397.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/hwmon/lenovo-ec-sensors.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/hwmon/abituguru3.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/input/serio/ct82c710.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/i2c/busses/i2c-nforce2.c:38:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/i2c/busses/i2c-nforce2.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/i2c/busses/i2c-ali15x3.c:50:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/i2c/busses/i2c-ali15x3.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
   In file included from drivers/i2c/busses/i2c-i801.c:102:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/i2c/busses/i2c-i801.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
