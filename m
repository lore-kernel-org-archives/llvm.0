Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6121506C;
	Wed, 22 Jan 2025 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737568702; cv=none; b=SXKaoj4/4Vv5cMRR5USazCYRiiqeGuJhysWI4Tt+65dKd0Pi4VWDe56ZiF3j2NlycfeTZ4DAxcG3Dw+PyHNaqYjqnTs9YsSp/Q5R1VyMRKNOCipx7vweU2LAve9zxhrukVB92i3v9evTiTKnblEvDpGHXEuNzETk73Y6GfaMQvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737568702; c=relaxed/simple;
	bh=7ldmcZxctxssexrBcMWASqBhoBemTHTuhXS0RgR9yKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDABVYQKtSzZZ9cUBeSgsojAZ6NeE6UNjEB4BSnX7nKXFKyPPyUmH5dJuDeaDFJ+WQF2qwMnF2qzEVnnXaTvCfr6Cfvr38KTh/DFNiQAhM5ELXMQqFlj2hlbnPIrW3iXeV6snosXjy6qMmmsyfExjwBP3cVmTipjPpCa+GaAwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wi8QR+9R; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wi8QR+9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737568700; x=1769104700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ldmcZxctxssexrBcMWASqBhoBemTHTuhXS0RgR9yKo=;
  b=Wi8QR+9Rf8rGdQEKehNOpeiGITb04yHr+x555J/w3RobAKndSfMCAEAE
   ocoDUA3664DOy3jEIGLwenso3QShjPzt1CyQ3gpiik0Fpl/jFKADFyKhJ
   Z3lmX2XH+l0IU6mcgEjI00VZGAxZQPXmvbxq1E5+4w8FZ0d/8VQ3ucsmL
   vEWhLVal4d71yws02arMv5p3oe9gYTSFNKHU3IpnGHN7kWhOUUUa153qq
   zPaXgXT4r1wLFVKOQECeUyGZQ/ASY1JZ+cVGGZFfiScMD7QKoCcL8nc5W
   gn0G6Ke7OL4GZoraeVeTFhkG56ezp0mzsmJMxxWZkAC8JGNGGhOfpScBJ
   A==;
X-CSE-ConnectionGUID: ugJ3tYNjR/G08K3WjRG/Xw==
X-CSE-MsgGUID: Jg4zx+GHRCyrjEHCJJ7ZwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38067778"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="38067778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:58:20 -0800
X-CSE-ConnectionGUID: 39sE5w+/QRKL6vqTnD2vvA==
X-CSE-MsgGUID: W85dCcFxS9C0g9X5mGNs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107019413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2025 09:58:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taezY-000aC5-0p;
	Wed, 22 Jan 2025 17:58:16 +0000
Date: Thu, 23 Jan 2025 01:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/comedi/drivers/cb_pcidas.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501230139.FZNlTIht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c4b9570cfb63501638db720f3bee9f6dfd044b82
commit: bf5febebd99fddfc6226a94e937d38a8d470b24e objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
date:   7 weeks ago
config: x86_64-randconfig-074-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230139.FZNlTIht-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230139.FZNlTIht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230139.FZNlTIht-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/comedi/drivers/cb_pcidas.c:57:
   In file included from include/linux/comedi/comedi_pci.h:13:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/comedi/drivers/cb_pcidas.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
