Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FC3C660E;
	Tue, 24 Mar 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371715; cv=none; b=E1DrixrKOhOk+76s3bFSUNd+AzcX88QhKaIzxYm+kzW6CR/OlFOcOTbBoAFScJ4l5lorbBAhnwuaUxr9uRjwTrau4S7vZ34/mWvqi0Hjz/K92f6zrG93T8myD1g7APcTUGoVInHdDe8Af5SpuUcUL6Fuc00Y/J6fRaevKI9TXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371715; c=relaxed/simple;
	bh=G3kd7wvMlNspkd5kAYpgnMgmEoFUVBlq/rO9qEh09E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awD99tXAzPZ2pv9Cge6Sz5OMJEXLV7cZsbeVBG/mvK0UJ+ig8ISRIpKhbSphFoTrY2ECBq0FE/zP7N3J4gZcIcydRF/VfDwwlL8WhlZojZmooMSDZTii8kHcX3bMViH+I4CQ36OisUL/OLTlM+3OyFba9XT7iUMWiCdpWFJieUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqJvhwqD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqJvhwqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371714; x=1805907714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G3kd7wvMlNspkd5kAYpgnMgmEoFUVBlq/rO9qEh09E8=;
  b=eqJvhwqD7PDAeBnY1ZiAlyumSDZPfoQFk/lOLu6umtcCDUp2iUw+Cbgb
   DpMZVMxpOUTVusdfEchtLe1RPAEX5rBTqvCLQOG1y3xeX/b6+v6cSLqX4
   Np0Sf3aQtAapWwH8BOBG40ReZhUFRdUauGbbX2ELX5BwyeJOkmzCLithB
   ti/DCoXcLzKp+9zr00JluJyPTGSzZMDNaqUXYMVrEF6JWKf2HomHH2unR
   3NwFPVFMRGL6sZtNxwyNM0WPLTqXZlRiEjdvbHafxcLY4a8SdtV1aWHGt
   /FNt/fWisYBpcAfmmXZy9cLb3R9LGYB8XwrYaE8dblT8CCg2/ru3IAUKx
   A==;
X-CSE-ConnectionGUID: HYi8SKFMQt+hwPagO1hPRg==
X-CSE-MsgGUID: qCYKMJBjQ5SwHGpLvDZW2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365157"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75365157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:01:54 -0700
X-CSE-ConnectionGUID: Fpps84R2Rq+KcXg99CBezg==
X-CSE-MsgGUID: ULNR2QDTSn6QJ3rl819Rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262341063"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Mar 2026 10:01:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w558X-0000000051Z-3lmx;
	Tue, 24 Mar 2026 17:01:49 +0000
Date: Wed, 25 Mar 2026 01:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 06/11] mm/truncate: use folio_split() in
 truncate_inode_partial_folio()
Message-ID: <202603250033.ifbSFRek-lkp@intel.com>
References: <20260323190644.1714379-7-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323190644.1714379-7-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to brauner-vfs/vfs.all kdave/for-next linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-remove-READ_ONLY_THP_FOR_FS-Kconfig-option/20260324-043510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260323190644.1714379-7-ziy%40nvidia.com
patch subject: [RFC PATCH 06/11] mm/truncate: use folio_split() in truncate_inode_partial_folio()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603250033.ifbSFRek-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250033.ifbSFRek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250033.ifbSFRek-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/truncate.c:189:8: error: call to undeclared function 'folio_split'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     189 |         ret = folio_split(folio, min_order, split_at, NULL);
         |               ^
   1 error generated.


vim +/folio_split +189 mm/truncate.c

   179	
   180	static int folio_split_or_unmap(struct folio *folio, struct page *split_at,
   181					    unsigned long min_order)
   182	{
   183		enum ttu_flags ttu_flags =
   184			TTU_SYNC |
   185			TTU_SPLIT_HUGE_PMD |
   186			TTU_IGNORE_MLOCK;
   187		int ret;
   188	
 > 189		ret = folio_split(folio, min_order, split_at, NULL);
   190	
   191		/*
   192		 * If the split fails, unmap the folio, so it will be refaulted
   193		 * with PTEs to respect SIGBUS semantics.
   194		 *
   195		 * Make an exception for shmem/tmpfs that for long time
   196		 * intentionally mapped with PMDs across i_size.
   197		 */
   198		if (ret && !shmem_mapping(folio->mapping)) {
   199			try_to_unmap(folio, ttu_flags);
   200			WARN_ON(folio_mapped(folio));
   201		}
   202	
   203		return ret;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
