Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BC19CCFC;
	Thu, 16 Oct 2025 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599015; cv=none; b=FLEckkJXeEohzddgFjEkSEBsC4J+075RZ5nCbaS0qjf8HzSR6k8U4GFE0TTDyJccIkqld5VAmM//wl0OPsDkeLn+xUbP5o3fxMa1dReRjo9YGjvSQLAoO7GBmSBHzEEFeP/lo7BylVnxyv8bdw27O8baW9ydRTMNChcnDZUfddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599015; c=relaxed/simple;
	bh=1x7wQQk4NaqCkw/9AblfypaPIYlk84xJ4iuiadImZeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcZKfk+kRHy/fbiP8dGZkk8s0F43FM3jhnSiK3yQ+ln22hWFSHUkd9tYQ/ad5YgBopVXLhrAhBd4gfgGhMtbisDi2IsKQvz7tuRdpZ+qCXlVxhitb3pIuRCaP38EjUOoV8lYabzwIsgISJTs5lwA1rbFwdrIxmwDJ5TVERZ/Iv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYzpGuWt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYzpGuWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760599013; x=1792135013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1x7wQQk4NaqCkw/9AblfypaPIYlk84xJ4iuiadImZeY=;
  b=bYzpGuWttioO750BFX/SyOj2a7G6VvYWFi6UkBgzwCrDEShPu0MxeWbR
   Jx3f2QELruW0xLyqYxESTue1KZN6Y/8aE1meKJm706eJoVR1WNZoBO1pe
   CDjRvq+8HaJx27VtfjgO2vTvwfevvh+5XwIrs1n90jGbXCdTGAXxPbK+x
   2lpQUowkpiSKeoyJ4kB15Qk4oCPclmXRi0iTze0a6n9f+Za0mNS+UZlFr
   kLuxjx3uHbTBqU8n3YwN0wxkceMJIIEbj2r8RcloA69FjzZ8mTTci076g
   vGjk42urLgPcRRLsYi3/DtonYgCsdYfP7TlD5dz1tEWmpPkTLfPxFzJkR
   g==;
X-CSE-ConnectionGUID: a9QuWcsYSU6cjLjBEUBdxA==
X-CSE-MsgGUID: 8FpYUIFWTPCImdYPRQMUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74126726"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="74126726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 00:16:51 -0700
X-CSE-ConnectionGUID: /PzH+kKSSwCUZDuJUhQrZw==
X-CSE-MsgGUID: EB5yHv1JQTGxcGY6L3uRhw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 00:16:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9IEC-0004YV-0D;
	Thu, 16 Oct 2025 07:16:48 +0000
Date: Thu, 16 Oct 2025 15:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 42/49] mm/page_alloc.c:6445:2: error: call to
 undeclared function 'set_direct_map_sensitive'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510161544.JO6MpoKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   0c9d948029f991e9bf7db4697780d96945231c3c
commit: 74e49455c79ba9e1df24ddd6f9989f87e5842b32 [42/49] ASI-map all memblock regions (INSECURE)
config: s390-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161544.JO6MpoKg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161544.JO6MpoKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161544.JO6MpoKg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:6445:2: error: call to undeclared function 'set_direct_map_sensitive'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6445 |         set_direct_map_sensitive(virt_to_page(start),
         |         ^
   1 error generated.


vim +/set_direct_map_sensitive +6445 mm/page_alloc.c

  6433	
  6434	unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
  6435	{
  6436		void *pos;
  6437		unsigned long pages = 0;
  6438	
  6439		/*
  6440		 * Reserved areas were made nonsensitive earlier on, but the page
  6441		 * allocator expects all its incoming memory to be sensitive.
  6442		 * Simple solution is just to make the region sensntive again
  6443		 * before freeing it.
  6444		 */
> 6445		set_direct_map_sensitive(virt_to_page(start),
  6446					 (end - start) >> PAGE_SHIFT, true);
  6447	
  6448		start = (void *)PAGE_ALIGN((unsigned long)start);
  6449		end = (void *)((unsigned long)end & PAGE_MASK);
  6450		for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
  6451			struct page *page = virt_to_page(pos);
  6452			void *direct_map_addr;
  6453	
  6454			/*
  6455			 * 'direct_map_addr' might be different from 'pos'
  6456			 * because some architectures' virt_to_page()
  6457			 * work with aliases.  Getting the direct map
  6458			 * address ensures that we get a _writeable_
  6459			 * alias for the memset().
  6460			 */
  6461			direct_map_addr = page_address(page);
  6462			/*
  6463			 * Perform a kasan-unchecked memset() since this memory
  6464			 * has not been initialized.
  6465			 */
  6466			direct_map_addr = kasan_reset_tag(direct_map_addr);
  6467			if ((unsigned int)poison <= 0xFF)
  6468				memset(direct_map_addr, poison, PAGE_SIZE);
  6469	
  6470			free_reserved_page(page);
  6471		}
  6472	
  6473		if (pages && s)
  6474			pr_info("Freeing %s memory: %ldK\n", s, K(pages));
  6475	
  6476		return pages;
  6477	}
  6478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
