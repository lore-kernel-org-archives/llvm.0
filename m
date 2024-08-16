Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2261C2315;
	Fri, 16 Aug 2024 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723827853; cv=none; b=CVq6xVlls4SK2zP7BQ12r/7M7EKnA6aDqrHImPLDWmx/iFL5GI8anOV5o7UYGXNKmq2K8IqqyBpoVsKdcOekj0qe9Qq21S+fUaNZ8LRKOSv/+OZnZtrgwVR55WnRXq69EnPb1QdxIb9tn942ZvkuEoCKDWursrGz8pFvf7QJmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723827853; c=relaxed/simple;
	bh=P20DWhVVbXE78SrQLtmrGxDo+7IQpJR9AulDZ0zkIh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOd/emMKtyqgIQOh1t8BkywNX5epdKsr3ITLR3JXFPoWKMqrZPiLQ4eNX3/TR30JpdCl+s7BJLnrsBNV7TqcRumlQuLkHbJL9w0i2i6ZHQSVVUbfi76gt0UWtibedKQAAPLjCZk+kTb9UefXHK/NXFGfrHhNMdC4XjY3tl8iGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRfzDH0s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRfzDH0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723827851; x=1755363851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P20DWhVVbXE78SrQLtmrGxDo+7IQpJR9AulDZ0zkIh0=;
  b=WRfzDH0sMYm1+dawebyGpi3+SJwtp27huqnvg+gSuYq8Je6IAf+JJjtP
   65BLcJtlO4wbZc0ViH58UJPKEBf91YRtTQ/+dyYv0L6pAmrjViYIjY47i
   c1mDo3WVUsWA4DZPdNXxW0MNoKLhPNni7d2+Ki363RvzjWNsTSxhSzFNM
   HIzgRQu5kT+fYJ5arUFpkbR0mVwZDhxk7yJKC/5bHQqxT1Nyo0hgX1BEf
   PJ85odu+gRvqEXL7GOFmRc3n/SdN2JNPskpR3SEQ3/5nyUUc8e9fgTMzc
   xVX6pTJNzbGL6sPpwmue35suoAvv2//pWGU57sSam1FoQHNGPHoVSWCsa
   A==;
X-CSE-ConnectionGUID: QBVf1r0jSzejGBDcZ1uI0g==
X-CSE-MsgGUID: 6ghtJxqbSX+iu064TaBJXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32766289"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32766289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:04:08 -0700
X-CSE-ConnectionGUID: WCz2KdYTRTKhdlF/01b/uA==
X-CSE-MsgGUID: CzLW3HYTSy29BFDerxsfkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59741002"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2024 10:04:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf0Mt-0006fG-0j;
	Fri, 16 Aug 2024 17:04:03 +0000
Date: Sat, 17 Aug 2024 01:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	hannes@cmpxchg.org, yosryahmed@google.com, nphamcs@gmail.com,
	ryan.roberts@arm.com, ying.huang@intel.com, 21cnbao@gmail.com,
	akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	nanhai.zou@intel.com, wajdi.k.feghali@intel.com,
	vinodh.gopal@intel.com, kanchana.p.sridhar@intel.com
Subject: Re: [PATCH v2 4/4] mm: swap: Count successful mTHP ZSWAP stores in
 sysfs mTHP stats.
Message-ID: <202408170059.sq8QoVWB-lkp@intel.com>
References: <20240816054805.5201-5-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816054805.5201-5-kanchana.p.sridhar@intel.com>

Hi Kanchana,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc3]
[cannot apply to akpm-mm/mm-everything next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/mm-zswap-zswap_is_folio_same_filled-takes-an-index-in-the-folio/20240816-134948
base:   linus/master
patch link:    https://lore.kernel.org/r/20240816054805.5201-5-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v2 4/4] mm: swap: Count successful mTHP ZSWAP stores in sysfs mTHP stats.
config: arm-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170059.sq8QoVWB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170059.sq8QoVWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170059.sq8QoVWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_io.c:14:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/page_io.c:178:3: error: call to undeclared function 'count_mthp_stat'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
         |                 ^
>> mm/page_io.c:178:39: error: use of undeclared identifier 'MTHP_STAT_ZSWPOUT'
     178 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
         |                                                     ^
   1 warning and 2 errors generated.


vim +/count_mthp_stat +178 mm/page_io.c

   174	
   175	static inline void count_mthp_zswpout_vm_event(struct folio *folio)
   176	{
   177		if (IS_ENABLED(CONFIG_THP_SWAP))
 > 178			count_mthp_stat(folio_order(folio), MTHP_STAT_ZSWPOUT);
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
