Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E342907;
	Thu, 17 Aug 2023 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692276375; x=1723812375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEBXq1Y+3WlaNa1ReVQCChlz7r96EfmhHYy+k9mum+o=;
  b=mh4tRE+qroODZ6mFAnLx6KKpZemqudOl9NqEX9jpQ0EWsCjI185CrQ6+
   P4hc8S3IO4kPA5BIVN4qBNsxrVAcv2eSKWn0d6hsXxBZXAqpiSa+mDfTS
   RRkOTPyoUYa3gwdQxDWkO9EVmEe6h8Guzv91SMIWWsIJ8KqBzm1DR1lZh
   mI9ZQFaX8iuPU4gJYHxJWOM0IBEcrhvSebwHVibkmb/aPQahOiL6e8h16
   RqSFdkdFzM/I0W2PW0m0wwcQ3UyprdiwIqE3jVn6P8OdckL98UG42TD1/
   V2xLXQVkmsZfxBX+WHMdnN72UUcJ/2j9zADNhbxrVycIBWMS/AXhzCpHC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371704419"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371704419"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908394701"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908394701"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 05:46:12 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWcOC-00018n-0U;
	Thu, 17 Aug 2023 12:46:12 +0000
Date: Thu, 17 Aug 2023 20:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 4/7] drivers/firmware/efi/efi.c:643: warning:
 Function parameter or member 'unaccepted' not described in
 'reserve_unaccepted'
Message-ID: <202308172004.ONqNOmsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   c3817f480d1101b9c14987e84b6b3abc70c67a2d
commit: 61db94f763a6bf583ab264342115605ee8e33173 [4/7] efi: Make sure unaccepted table is mapped in crashkernel case
config: riscv-randconfig-r036-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172004.ONqNOmsa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172004.ONqNOmsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172004.ONqNOmsa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/efi.c:643: warning: Function parameter or member 'unaccepted' not described in 'reserve_unaccepted'


vim +643 drivers/firmware/efi/efi.c

   625	
   626	/**
   627	 * reserve_unaccepted - Map and reserve unaccepted configuration table
   628	 *
   629	 * memblock_add() makes sure that the table is mapped in direct mapping. During
   630	 * normal boot it happens automatically because the table is allocated from
   631	 * usable memory. But during crashkernel boot only memory specifically
   632	 * reserved for crash scenario is mapped. memblock_add() forces the table to be
   633	 * mapped in crashkernel case.
   634	 *
   635	 * Align the range to the nearest page boarders. Ranges smaller than page size
   636	 * are not going to be mapped.
   637	 *
   638	 * memblock_reserve() makes sure that future allocations will not touch the
   639	 * table.
   640	 */
   641	
   642	static __init void reserve_unaccepted(struct efi_unaccepted_memory *unaccepted)
 > 643	{
   644		phys_addr_t start, size;
   645	
   646		start = PAGE_ALIGN_DOWN(efi.unaccepted);
   647		size = PAGE_ALIGN(sizeof(*unaccepted) + unaccepted->size);
   648	
   649		memblock_add(start, size);
   650		memblock_reserve(start, size);
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
