Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9552DCF71;
	Fri,  3 Oct 2025 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759515529; cv=none; b=F3gt/Uh0qksOiGru4iT6CLw9dg3PM14FM0IiypsHIU6sRubGL6Ou7h5zbnJeOcwJuOqgpOjT2r8Smnry8MjCTAQoijI8eXokbVcxMkXwClNK87JYGCzRbX0bzLHJe2XkC7DqCAyA+FDhv0pH7qpT/jklMZTdk5aMk8HVumnZMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759515529; c=relaxed/simple;
	bh=SkYvizMIRTdhuaoXOlwjCevmQ50EQaMRMoPxBQ8I+EA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZAz0vkIs1YplEZo56cIUY882f5hTH3VQD/ANY9hOE6wFw6sT367nZYH+HoTWhK90XiRf3Lkz4389zNVf4mP0hYN+//PGE57YTN7dSEZ3SInzJETyHOzcBjjAAEQy76t1UIHppFS18klpZsf7JLYDJUBuJwXJrRqYFuwMQEU9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjsli9cX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjsli9cX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759515528; x=1791051528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SkYvizMIRTdhuaoXOlwjCevmQ50EQaMRMoPxBQ8I+EA=;
  b=kjsli9cXNd9fUf3LGKz2in/zAM5Qpa1GARvIzJEMjAjwwfoeA5ilYdFt
   fES4DduzWmfBpln+1dhJQjg4nFUlo7VnyOzdZ+HGu+BinxHWhkbWA5uV8
   lfI2BaGulqrR61oXYunZEAjrjPl0n8W1w0yHyd+q/sUVzO19hfy63tXD9
   kW7ba0hfU6ADM9AEXxUaKUEG6ZTprkB9wO9kgeROvbBSX+15bDbFVUX6G
   Va+WnuXMAEYBxH9TDdYv9IiUMJywHEme3I3lRl2kkzI7Jmr3Gp/5XINAv
   XI4c2Iaxja3HdlJWE47Qu4LGdavMijAvAVF8aFHXksdPOZrC2BdV8RyJ4
   Q==;
X-CSE-ConnectionGUID: imLYm+u6TPqj9ECB60Pncg==
X-CSE-MsgGUID: lV3juPVYTlaINEQUDYh8fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72478178"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="72478178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 11:18:47 -0700
X-CSE-ConnectionGUID: ionRyOXpQgyh+DUd9lGsBg==
X-CSE-MsgGUID: 8RZYAoeATlOLYAf9iBGTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="179149043"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2025 11:18:46 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4kMd-0004o9-2V;
	Fri, 03 Oct 2025 18:18:43 +0000
Date: Sat, 4 Oct 2025 02:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gmem_inplace 31/45] ld.lld: error: undefined symbol:
 __SCT____kvm_get_memory_attributes
Message-ID: <202510040252.3c7i2bTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   98035af87378177ca9fd4801b4edc653a68a38ff
commit: 0f7a514e7f39832e662a9761001e1cbd97bea813 [31/45] KVM: Stub in read-only module param to control per-VM memory attribute tracking
config: arm64-randconfig-002-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040252.3c7i2bTf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040252.3c7i2bTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040252.3c7i2bTf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __SCT____kvm_get_memory_attributes
   >>> referenced by .vmlinux.export.c
   >>>               .vmlinux.export.o:(___ksymtab_gpl+__SCT____kvm_get_memory_attributes+0x0)
   >>> did you mean: __SCK____kvm_get_memory_attributes
   >>> defined in: vmlinux.a(virt/kvm/kvm_main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
