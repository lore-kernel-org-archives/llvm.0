Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E982D83;
	Fri, 13 Sep 2024 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249453; cv=none; b=jlOfynTI83aqlyvAm/RHLjJ+FxgCLruawpIeHgk7jFMjqw3biu9g90Z51flM92HOo5cimkQiCG+39YTIn+H5mgj40CXjvstCkQsOo8sEx6r56iC6/bqttcXptrzZd+UAzKg6079VITCghNBYaVP9Qse56y2Ul1dE7HwDzhwzw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249453; c=relaxed/simple;
	bh=d7GrwIlNhvfrQBwvrOXiqd9IlzXYmLA5fR9e7VUQq0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1HY2i3I+z7cH92T0X2W+1Nvt8fZ77K8FVF0jBgRGcXNsFVNV6Ctfs64M82JpgM+ovYSvUpzzjTQmZ16k2q8bBxEzA2EZjvT+8enZYT1OzwgyXrgfz6X3wOADLIdrD8uLik6zoruoipqq4HxeM/41b0bF0mRpvXN96CRTLZCYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lE7RbB6l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE7RbB6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726249452; x=1757785452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d7GrwIlNhvfrQBwvrOXiqd9IlzXYmLA5fR9e7VUQq0g=;
  b=lE7RbB6l1TMYqaBKaPPsCVaTlXJ6Bn8FzycRmLDnpoNUcKG4F5OysIhd
   f++IGPokEn/wDWZmflfnfTfCD5nTFLbo1DempME+CHeO3g6ymQj70B63J
   fe7zL3yU1PmFjVp7Xjm1qRm4iA1YNFNeN6f8Zujem05I18F6F0GhUQRpL
   Q/Eprr701clp3jY71rTnR0NssSl0fvOxNz6rJpDeVWcBN2zxhmIAyEpfK
   CgT9Wq1S3lgs0mTGLPpcgUcSB4nv+7aekgreNCyysYEAfgaCIhlSLIeCK
   24/HQu0YNGdlgV6SCVYeT1ojNHvdMv3rw6qp6cF8Hawcxm7KTJ06KQys1
   w==;
X-CSE-ConnectionGUID: jceJVF75Sa6aciFzfAjtLw==
X-CSE-MsgGUID: qN25YHqxSrShWnQO7x6Tdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35829374"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="35829374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 10:44:11 -0700
X-CSE-ConnectionGUID: vlgVebppTkaBqfMQxJd0lQ==
X-CSE-MsgGUID: TnzoFwMHQOW4jw/W/5goYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="67761068"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2024 10:44:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAL2-0006lc-0f;
	Fri, 13 Sep 2024 17:44:08 +0000
Date: Sat, 14 Sep 2024 01:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 01/10] kvm: gmem: Add option to remove gmem from
 direct map
Message-ID: <202409140159.nGVKH1ST-lkp@intel.com>
References: <20240910163038.1298452-2-roypat@amazon.co.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910163038.1298452-2-roypat@amazon.co.uk>

Hi Patrick,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Roy/kvm-gmem-Add-option-to-remove-gmem-from-direct-map/20240911-003258
base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
patch link:    https://lore.kernel.org/r/20240910163038.1298452-2-roypat%40amazon.co.uk
patch subject: [RFC PATCH v2 01/10] kvm: gmem: Add option to remove gmem from direct map
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240914/202409140159.nGVKH1ST-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140159.nGVKH1ST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140159.nGVKH1ST-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:71:2: error: call to undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |         flush_tlb_kernel_range(start, start + folio_size(folio));
         |         ^
   1 error generated.


vim +/flush_tlb_kernel_range +71 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

    57	
    58	static int kvm_gmem_folio_set_private(struct folio *folio)
    59	{
    60		unsigned long start, npages, i;
    61		int r;
    62	
    63		start = (unsigned long) folio_address(folio);
    64		npages = folio_nr_pages(folio);
    65	
    66		for (i = 0; i < npages; ++i) {
    67			r = set_direct_map_invalid_noflush(folio_page(folio, i));
    68			if (r)
    69				goto out_remap;
    70		}
  > 71		flush_tlb_kernel_range(start, start + folio_size(folio));
    72		folio_set_private(folio);
    73		return 0;
    74	out_remap:
    75		for (; i > 0; i--) {
    76			struct page *page = folio_page(folio, i - 1);
    77	
    78			if (WARN_ON_ONCE(set_direct_map_default_noflush(page))) {
    79				/*
    80				 * Random holes in the direct map are bad, let's mark
    81				 * these pages as corrupted memory so that the kernel
    82				 * avoids ever touching them again.
    83				 */
    84				folio_set_hwpoison(folio);
    85				r = -EHWPOISON;
    86			}
    87		}
    88		return r;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
