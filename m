Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34142A96;
	Wed,  1 May 2024 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567285; cv=none; b=e4eQlWfnqMSwxkzGDzn33W6XRKqx74Ec5h+a3VRtFZTgJhQP5VPvQJ3Oe9x4jabgb6PsURQePh4UpWtIZNM+6NzZWiSB/MFhNO3t/adhqd8Jf0GsBYl6gwvFU/p+InILty6ZQfkw9g65BDwfqAy9hErjJrZOU/7kgpWuKhMrBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567285; c=relaxed/simple;
	bh=pmlLKW4JASztKySQhjTapSN5GZPIx76UG04cGIa67TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8sMya9Ekd0nGF5u6d9h/0C1V3/1jm7SzkvUJJ4m5Y0eTysmZdCtigbGhRlKRYA0LteIMsFChpFnDSfiQFU3PEX5powO/DRUR3JDrL4ewryRcJ/IbpENWuhAD8z3aLc1+JmW/Nm6ZtKGyfe2FqUHEbiBA2KJwwUjt+eDIGw5c+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCO6r3Ne; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCO6r3Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714567282; x=1746103282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmlLKW4JASztKySQhjTapSN5GZPIx76UG04cGIa67TA=;
  b=JCO6r3NeKzd6ShwHQKdIfqkxS7AaBqBnAzaXP+SPMF+zY4uX1ljGBoW5
   B7i2CQ/+zM1r5IC7/tNvfmwSatJ8iXu4e0RCsTFT1I0GsA5W78TLYMAWZ
   laRqIp38xms5IqYivT3pan9WGzDtpHvgV8fU/ol1EtToEMbekp44vjhL1
   rW3Qi0FepSSGAmrM5jFbTcD3+l4cm6WHs/X/iBSJSP0cmgFDPf8k0DHH7
   cmb692OdAuf1aFGc6vSdyt7msPb1Zepq18+uJ8NuzwyX557mDIxa8EPSu
   JZ48vlAVju7J3Tnx2qEptLQknKXUKUUlMtIpTOqRqwwi4YzU2ppaqhTZQ
   Q==;
X-CSE-ConnectionGUID: JTG5qsfdQCSrdmLnKVFEfg==
X-CSE-MsgGUID: tXcyCtRxT+2gM636WpP1aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20907382"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="20907382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 05:41:19 -0700
X-CSE-ConnectionGUID: 5gLGluwFRa6ZasmXJ2dCcA==
X-CSE-MsgGUID: fIn4N3qpQSy16OTR4Kqd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="57966799"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2024 05:41:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s29Gt-0009WY-2F;
	Wed, 01 May 2024 12:41:15 +0000
Date: Wed, 1 May 2024 20:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9249/10134] ld.lld: error: undefined symbol:
 split_huge_pmd_locked
Message-ID: <202405012010.4c840vFN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 34d66beb14bdedb5c12733f2fd2498634dd1fd91 [9249/10134] mm/rmap: integrate PMD-mapped folio splitting into pagewalk loop
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240501/202405012010.4c840vFN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012010.4c840vFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012010.4c840vFN-lkp@intel.com/

Note: the linux-next/master HEAD f68868ba718e30594165879cc3020607165b0761 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: split_huge_pmd_locked
   >>> referenced by rmap.c
   >>>               mm/rmap.o:(try_to_unmap_one) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
