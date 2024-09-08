Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4C175D47;
	Sun,  8 Sep 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725816451; cv=none; b=HPd3MygA1fQsinzuEq0Kd7j+WOBvlVxM9TOMLhuEIsER/W8IPODIfO0iCFX1dBsxsLjZEFMdRgxsW2McwHhUpcY97wCbg4iLoMwRjRs1oMtqyXQlYdCF9gpkJGxgYW6A6A2yw26iIL67jlKRSEbGOe/fEbmcCWuSV42EanJsKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725816451; c=relaxed/simple;
	bh=+XBel1FP3kOt1YaP4DMSN70DkMcrUTcubM9pH02YgEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXXaaXTV8Y6OA+EVsGhzrKJELYSA1u/uqUOdwYGRLi5cYDY3DIZh/zxlsz13vbYqhjb0wn6yOQFAffFRZlcu2rVDAAjqTu00t9sU2lpdDcAffO/DkOKCP5yEeeRHvyLDICII0yF2FMXoOxkPZ02iu4ILKqVgYJPE1kEGeOyHnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEtnME5G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEtnME5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725816450; x=1757352450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XBel1FP3kOt1YaP4DMSN70DkMcrUTcubM9pH02YgEA=;
  b=kEtnME5GHd55M89kvOhTsT5sjU3Ncih5R26jb+cUZv8rR1f9pEnHtk7A
   5xfEl7kU2m3Ao8RDQ78rCMnt3uyVvCYHHiljCJgnCMTSktq41BEN29QWZ
   Kz7CqlICZqRn3z1Q5bVpffaobkCEFINBrqOkbjfs+sMOhAHRNcrXlcbP2
   CMqculzCaYuIwzPuI4HIcvO6GJBniY3CjXBrUrmscLcqMZGWlqqbwRYJ9
   StVzc8w1JuEPglXefPlT3puUyiJpc3T2VJJX6+brwvigB3olA7RhkWKcI
   6ECHRGOIssNFyCj61p2YfI5YRGs4fEBwbAcoJV4xws/xcB3otBLCfsg1o
   g==;
X-CSE-ConnectionGUID: S7zmHT7bSmqXOjOr+Zf5Hw==
X-CSE-MsgGUID: Cx9ZzJmoTSyuy7aDMmhaZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="47029329"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="47029329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 10:27:29 -0700
X-CSE-ConnectionGUID: vqNqnSPzQzONxQLh/bbFqg==
X-CSE-MsgGUID: VWxpoC7HTGqQdNPaqgTlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="71254156"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2024 10:27:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snLh6-000DlV-21;
	Sun, 08 Sep 2024 17:27:24 +0000
Date: Mon, 9 Sep 2024 01:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <202409090150.Po6fKG3u-lkp@intel.com>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>

Hi Charlie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5be63fc19fcaa4c236b307420483578a56986a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/mm-Add-personality-flag-to-limit-address-to-47-bits/20240906-052121
base:   5be63fc19fcaa4c236b307420483578a56986a37
patch link:    https://lore.kernel.org/r/20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb%40rivosinc.com
patch subject: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240909/202409090150.Po6fKG3u-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090150.Po6fKG3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090150.Po6fKG3u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmap.c:1770:44: warning: shift count >= width of type [-Wshift-count-overflow]
    1770 |                 info->high_limit = MIN(info->high_limit, BIT(47) - 1);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^
   include/linux/minmax.h:329:30: note: expanded from macro 'MIN'
     329 | #define MIN(a,b) __cmp(min,a,b)
         |                  ~~~~~~~~~~~~^~
   include/linux/minmax.h:90:45: note: expanded from macro '__cmp'
      90 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                                             ^
>> mm/mmap.c:1770:44: warning: shift count >= width of type [-Wshift-count-overflow]
    1770 |                 info->high_limit = MIN(info->high_limit, BIT(47) - 1);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^
   include/linux/minmax.h:329:30: note: expanded from macro 'MIN'
     329 | #define MIN(a,b) __cmp(min,a,b)
         |                  ~~~~~~~~~~~~^~
   include/linux/minmax.h:90:57: note: expanded from macro '__cmp'
      90 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                                                         ^
   2 warnings generated.


vim +1770 mm/mmap.c

  1755	
  1756	/*
  1757	 * Search for an unmapped address range.
  1758	 *
  1759	 * We are looking for a range that:
  1760	 * - does not intersect with any VMA;
  1761	 * - is contained within the [low_limit, high_limit) interval;
  1762	 * - is at least the desired size.
  1763	 * - satisfies (begin_addr & align_mask) == (align_offset & align_mask)
  1764	 */
  1765	unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
  1766	{
  1767		unsigned long addr;
  1768	
  1769		if (current->personality & ADDR_LIMIT_47BIT)
> 1770			info->high_limit = MIN(info->high_limit, BIT(47) - 1);
  1771	
  1772		if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
  1773			addr = unmapped_area_topdown(info);
  1774		else
  1775			addr = unmapped_area(info);
  1776	
  1777		trace_vm_unmapped_area(addr, info);
  1778		return addr;
  1779	}
  1780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
