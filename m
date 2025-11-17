Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF22139C9;
	Mon, 17 Nov 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378637; cv=none; b=ans1hhKhu6+KSfdLth7WMzDsZeEhX7ED98NXAng+g7luPv5xrVGdiABYNq/Rkk5XIHNkpv726FUVcuLTsYoN8it8HqxzSKs2PplQEEcAjqUdDnZwFB6Xv+IfDxlI3h4qjpjCtS0d2kJiqMMaw9aY2FYU2YU4XwlAyFr2Hy0AgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378637; c=relaxed/simple;
	bh=IyRsD3dFuOO27FuFU8cJdLCxe9lG0I9aLgo2AGV7OmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV1ortMmy2uS9NNIVhJobUVftPlK8MiEaeqEcjiY1vwMOuTJQvKw+NhfzGmIOD+g6OF6lndOEct7HbBYn2UzRs5o3xALcyVr+6+omnOCJ1y0R+oMRt34t5XGRNBqZvpwShg7UG/Qr7cs0RPc7hiMW9XIGFLE/uUsdeRi3OZYWy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jhd/X3ei; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhd/X3ei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763378635; x=1794914635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IyRsD3dFuOO27FuFU8cJdLCxe9lG0I9aLgo2AGV7OmQ=;
  b=Jhd/X3eiYEZvFshyYgE8iWE9Pem6ZWfSGtM3IjFI3lUJFwL5hMSFCH0N
   mktjhDIp7KZhdRuG0B+1Gyvc6+o+LuBMvWh80Q76/uOU4YbTNFR1NbZ3j
   i/pJZ/lL/r3TemKJ6uDkg+l3drgtTotejMVHb9ENhg+PR2CSOs6BKkEVE
   7rbim30gC2GsXQ/KMpgRILw2cZym5poxFIszGIuUmCq1IjLhRaqCivTcy
   +B8bZie6AsCOGXouWkIj+L5fhmfnhnEPc+WEV1DjYqAWyExvrRdfCvnDG
   1l9lB8VrCEfDL3X20PgyiewUl6wHbvSDFF7UfvmY8RZ5J0L6j4UV4plD/
   Q==;
X-CSE-ConnectionGUID: +lBSTfl9R62TLzXgcKIIvw==
X-CSE-MsgGUID: wFm5/mTJQoqFh/03BhCN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90853235"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="90853235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:23:54 -0800
X-CSE-ConnectionGUID: Qhd01F23SFSHkb5YSclT5g==
X-CSE-MsgGUID: r/l+7D0FQDeMDh9iiRGZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190220827"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2025 03:23:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKxKk-0000U5-20;
	Mon, 17 Nov 2025 11:23:46 +0000
Date: Mon, 17 Nov 2025 19:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
Message-ID: <202511171912.yMOEajkV-lkp@intel.com>
References: <20251117-swap-table-p2-v2-18-37730e6ea6d5@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-swap-table-p2-v2-18-37730e6ea6d5@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41218ede767f6b218185af65ce919d0cade75f6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251117-021532
base:   41218ede767f6b218185af65ce919d0cade75f6b
patch link:    https://lore.kernel.org/r/20251117-swap-table-p2-v2-18-37730e6ea6d5%40tencent.com
patch subject: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251117/202511171912.yMOEajkV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171912.yMOEajkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171912.yMOEajkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:88:19: warning: unused variable 'Unused_offset' [-Wunused-const-variable]
      88 | static const char Unused_offset[] = "Unused swap offset entry ";
         |                   ^~~~~~~~~~~~~
   1 warning generated.


vim +/Unused_offset +88 mm/swapfile.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  84  
^1da177e4c3f41 Linus Torvalds 2005-04-16  85  static const char Bad_file[] = "Bad swap file entry ";
^1da177e4c3f41 Linus Torvalds 2005-04-16  86  static const char Unused_file[] = "Unused swap file entry ";
^1da177e4c3f41 Linus Torvalds 2005-04-16  87  static const char Bad_offset[] = "Bad swap offset entry ";
^1da177e4c3f41 Linus Torvalds 2005-04-16 @88  static const char Unused_offset[] = "Unused swap offset entry ";
^1da177e4c3f41 Linus Torvalds 2005-04-16  89  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
