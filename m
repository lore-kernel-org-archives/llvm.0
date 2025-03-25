Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F015E5AE;
	Tue, 25 Mar 2025 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742868347; cv=none; b=q8a0xaY4+hRQkReLWf5k14j+0E9Q8FBBrophNDYYe5e0c0jA4Tf6FBVuIyxWrV6j8rdhRjkCBRR5wUwC8Paa9mXZnyrnQsqg2q+XErP+UW8p7uEk8a9dRJMaQ9rG3Zzh70dpiKp11EAFWmdXGbgzZc2DelE6utZM5J+iQXZUMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742868347; c=relaxed/simple;
	bh=TfCgWnYMk15Bd00QyozaOHDT3SILwkgYS/wCdJdQbcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+L3kYcUFqImoTedl9WeSp5cqXbwmoci1aiObDR0z0ByLY4WNV9EQnXaKKVlCJ++Lr0Wxx2s4yzqwQB47ci/90WZACaXztHPlYqOzv5FbBqHq73LYJUmgN4Ft89CII9fP6xPJyxuWwSG6XDBNLlAAX+yJA10WhcOAX6q/qYSSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyfBmeW+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyfBmeW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742868346; x=1774404346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfCgWnYMk15Bd00QyozaOHDT3SILwkgYS/wCdJdQbcc=;
  b=JyfBmeW+nxmENKyxC6S5hun6XL1W+Cel7iINkne7sInnH+ttE6Dkn+jq
   y/BA36tRBAfse9xzywONsq9tc+bkUfUn43SpHPu7onA9u64zIt5YPs5wo
   dsdCUhYJfxO/tqzrHO7VH92PZrfVk9yG3EheKpAQuTabsJubuW5XJTtRn
   jBLkPGl4Iz3Zij7swUmqScU/j2UePr5fhwakhpSPbG3p+NEjTMFnuKBCm
   rbR4oo8CVRsHQtvNWQr3+AhNfAJFDe9rIyeWBvD88yNSDYnRthJGjBMyR
   Er5rZVw+5plMT3JANSpuKIwsVHeOGFy5WF8eLFO2+Sub311bV9LMsHNoo
   g==;
X-CSE-ConnectionGUID: l++nGvaDRxSxdn/avvl1pA==
X-CSE-MsgGUID: +CC9m/WmQBSDVwJ92EsDLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43974911"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="43974911"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 19:05:45 -0700
X-CSE-ConnectionGUID: UllLFX/vQeuqwT5AjheE7w==
X-CSE-MsgGUID: xDTVORx4ThSlAnoxaAIH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124398821"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2025 19:05:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twtfi-00044Z-1K;
	Tue, 25 Mar 2025 02:05:42 +0000
Date: Tue, 25 Mar 2025 10:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:fork_pat 1/1] include/linux/pgtable.h:1525:13:
 error: unused function 'untrack_pfn_copy'
Message-ID: <202503250935.Gm7ENdAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux fork_pat
head:   4474ef40921c064454fd03245526fc80f373873e
commit: 4474ef40921c064454fd03245526fc80f373873e [1/1] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
config: powerpc-randconfig-001-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250935.Gm7ENdAr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250935.Gm7ENdAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250935.Gm7ENdAr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:12:
   In file included from include/linux/slab.h:256:
   In file included from include/linux/kasan.h:37:
>> include/linux/pgtable.h:1525:13: error: unused function 'untrack_pfn_copy' [-Werror,-Wunused-function]
    1525 | static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
         |             ^~~~~~~~~~~~~~~~
   1 error generated.


vim +/untrack_pfn_copy +1525 include/linux/pgtable.h

  1520	
  1521	/*
  1522	 * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
  1523	 * copy_page_range(), but after track_pfn_copy() was already called.
  1524	 */
> 1525	static void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
  1526	{
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
