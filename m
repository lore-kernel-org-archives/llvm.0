Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E7C58AB9;
	Sun, 12 May 2024 23:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715555924; cv=none; b=gznTpqigVjRgYByjWauWP3VQG5dEHVQ9bRnpMrwJtZ3nkXHYdAu7f/y7oKWZv7LLque/N2bjZM3rl/OHcZPDBFSUf9l1mzP2zHZAQW0c2ZWnHj5XpOUCr1X/KURLhI3HH16tYmAN1h8k1A6fRUCjsSRCPlNWK2KpGkZFbE5p8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715555924; c=relaxed/simple;
	bh=EBbd1qCAKn+Q+Hk7vty/HNVwsUBY5bsZuf8+5lZ6iVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBDBezDFkX5flbBb9xOPm4nb9z7+4YGtRcQCdaJqXe19sL3DphTZzbyvRrFLU8ylqO2uiv8X4RqOGQU1gwfMFoykxINXZY/aoWyswvHW8558eZkZycATHS087JybDXsZHBclojJIKWXTekFdcpsheWGoZ7u+Z2amFJEwifjRE34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgPMM+q0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgPMM+q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715555923; x=1747091923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EBbd1qCAKn+Q+Hk7vty/HNVwsUBY5bsZuf8+5lZ6iVo=;
  b=jgPMM+q0pCwLi1yqCv/5A27J0BOueLe3Mnv9hgH2AoPFejIKB92HP8fd
   s5MVcxWmksfDDLgInjuohcGkzUlt+EKKaJzQSY75klVZCFsemPrS+cuCl
   szUSLsE26++m3NtqjIdA/YQSCzwZOMrxglWkUGiVENjFwhqOncvM9Gywp
   khLOd4ptgQk4hq6YmxJDHhr6rebnroEHQ0WLr8iig6r5MUvkQM4SdjYBi
   JAHE3xboUG9W1+QE7SVu9pHNkhKgN7NpsbP2ogQob1SFTKxNl/w+XwcNj
   NXDEUcYLVrHRso6iF40sQ8+7YYgnFs2+feYVx5nFzfs4RArLOW6omwB6Y
   g==;
X-CSE-ConnectionGUID: tYzaWLrDSRiA5FzC1eIl7Q==
X-CSE-MsgGUID: zk28DQjUSJuVICWMH2Fg/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22624618"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22624618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 16:18:42 -0700
X-CSE-ConnectionGUID: ANTFx2lrQ+2dE+tIgQ0QEQ==
X-CSE-MsgGUID: Hpw1FGlNTrWCznjYWkHheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30239268"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2024 16:18:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6ISk-0009Hj-2l;
	Sun, 12 May 2024 23:18:38 +0000
Date: Mon, 13 May 2024 07:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] powerpc/fadump: setup additional parameters for
 dump capture kernel
Message-ID: <202405130737.q8ZJ9vv1-lkp@intel.com>
References: <20240509115755.519982-3-hbathini@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509115755.519982-3-hbathini@linux.ibm.com>

Hi Hari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on next-20240510]
[cannot apply to powerpc/fixes linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Bathini/powerpc-pseries-fadump-add-support-for-multiple-boot-memory-regions/20240509-200221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240509115755.519982-3-hbathini%40linux.ibm.com
patch subject: [PATCH v2 2/3] powerpc/fadump: setup additional parameters for dump capture kernel
config: powerpc64-randconfig-001-20240512 (https://download.01.org/0day-ci/archive/20240513/202405130737.q8ZJ9vv1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130737.q8ZJ9vv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130737.q8ZJ9vv1-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_param_area+0x64 (section: .text) -> memblock_phys_alloc_range (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
