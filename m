Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C391758D;
	Wed,  1 May 2024 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714571124; cv=none; b=oHl4/5UYQ2iwc3f/xwOZmrc2i3aJLfoI428OqzWKbGIyimS9+wYi2SU/ISvEBvKhG9tu353s/YayWIaqhSsTl7eNJm7P6h8VyHDMwk95mTfe92/NtiGvkX8/D8tNWAs2ApmJpFca3l4SExyGiHccf/dV6/So9I1k8ipe45Ko6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714571124; c=relaxed/simple;
	bh=QJ2biIJX7GQojTAdufHRLb47yhfWu9vjEK6kJr6yAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYDPYwu7QgfliRBYMrJ43yR7Lg/BsQRI6aUZE5kZ6SOQZa52XCnf4sJXIFFPuVKXD1tZQr0cLnbZnBUNWPqchf5hdeCgof5cn8m7gbpM3USUD/Ly9WN4mnsR/49ktHa/UXqozyy4Sbfe2LIHJHWk/Njt5QWbHLc4guQi97gQR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzVB1Ac4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzVB1Ac4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714571124; x=1746107124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJ2biIJX7GQojTAdufHRLb47yhfWu9vjEK6kJr6yAZE=;
  b=SzVB1Ac4/V30HgJcWLXsowXesNqGFbZ16O6XfBjanm9VlnhOe0vNyt8U
   9tJSlbNmasYRmLxKMawXlTVOSTXfwsHocVqaIjsVKoDDz72jh1STqX7/Y
   otWloknEs74ufhhP4RkdazKcFB+VX1nrRvxqoiWfahZnoE88m/ZdpBSF5
   6yQwX6DAJ8auP5tVvU85ZsGpizERtm0mToX+UNjW2RQicp4KcNQDIJKZX
   HRo9um7txajygAFITH+UQIcJXWwALlKPX/tXdlr0YAzNX5HIirNNUhaax
   IEwXZo4en9WBeghvlzV4lrqy02uo08wL0wTsMIiOaI13MCofNEPN1u6X4
   w==;
X-CSE-ConnectionGUID: VjmwnNq4Qr2wgyD/fApUKQ==
X-CSE-MsgGUID: VnMDICpvROy0Ony6EKeHag==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14120229"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="14120229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 06:45:23 -0700
X-CSE-ConnectionGUID: TRY0XoeERXaHATngVNtNJA==
X-CSE-MsgGUID: YkbVjH2WQKWouBjzIARDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="27271458"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 06:45:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2AGs-0009ZP-12;
	Wed, 01 May 2024 13:45:18 +0000
Date: Wed, 1 May 2024 21:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9793/10134] drivers/of/of_reserved_mem.c:465:6:
 warning: variable 'nomap' is uninitialized when used here
Message-ID: <202405012148.1dCXzomq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 2acef04ad57cab44b33001542791fc93f81cadf1 [9793/10134] of: reserved_mem: Remove the use of phandle from the reserved_mem APIs
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405012148.1dCXzomq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012148.1dCXzomq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012148.1dCXzomq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/of/of_reserved_mem.c:19:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/of/of_reserved_mem.c:465:6: warning: variable 'nomap' is uninitialized when used here [-Wuninitialized]
     465 |                                         nomap ? "nomap" : "map",
         |                                         ^~~~~
   include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/of/of_reserved_mem.c:441:13: note: initialize the variable 'nomap' to silence this warning
     441 |                 bool nomap;
         |                           ^
         |                            = 0
   2 warnings generated.


vim +/nomap +465 drivers/of/of_reserved_mem.c

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  426  
3f0c8206644836 Marek Szyprowski   2014-02-28  427  /**
c8813f7ec01c67 chenqiwu           2020-05-11  428   * fdt_init_reserved_mem() - allocate and init all saved reserved memory regions
3f0c8206644836 Marek Szyprowski   2014-02-28  429   */
3f0c8206644836 Marek Szyprowski   2014-02-28  430  void __init fdt_init_reserved_mem(void)
3f0c8206644836 Marek Szyprowski   2014-02-28  431  {
3f0c8206644836 Marek Szyprowski   2014-02-28  432  	int i;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  433  
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  434  	/* check for overlapping reserved regions */
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  435  	__rmem_check_for_overlap();
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  436  
3f0c8206644836 Marek Szyprowski   2014-02-28  437  	for (i = 0; i < reserved_mem_count; i++) {
3f0c8206644836 Marek Szyprowski   2014-02-28  438  		struct reserved_mem *rmem = &reserved_mem[i];
3f0c8206644836 Marek Szyprowski   2014-02-28  439  		unsigned long node = rmem->fdt_node;
3f0c8206644836 Marek Szyprowski   2014-02-28  440  		int err = 0;
6f1188b4ac7577 Yue Hu             2020-07-30  441  		bool nomap;
3f0c8206644836 Marek Szyprowski   2014-02-28  442  
3f0c8206644836 Marek Szyprowski   2014-02-28  443  		if (rmem->size == 0)
3f0c8206644836 Marek Szyprowski   2014-02-28  444  			err = __reserved_mem_alloc_size(node, rmem->name,
3f0c8206644836 Marek Szyprowski   2014-02-28  445  						 &rmem->base, &rmem->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  446  		if (err == 0) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  447  			err = __reserved_mem_init_node(rmem);
d0b8ed47e83a22 pierre Kuo         2019-02-19  448  			if (err != 0 && err != -ENOENT) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  449  				pr_info("node %s compatible matching fail\n",
d0b8ed47e83a22 pierre Kuo         2019-02-19  450  					rmem->name);
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  451  
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  452  				nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
d0b8ed47e83a22 pierre Kuo         2019-02-19  453  				if (nomap)
7b25995f5319ad Dong Aisheng       2021-06-11  454  					memblock_clear_nomap(rmem->base, rmem->size);
3c6867a12a224d Dong Aisheng       2021-06-11  455  				else
3ecc68349bbab6 Mike Rapoport      2021-11-05  456  					memblock_phys_free(rmem->base,
3ecc68349bbab6 Mike Rapoport      2021-11-05  457  							   rmem->size);
aeb9267eb6b1df Martin Liu         2023-02-10  458  			} else {
aeb9267eb6b1df Martin Liu         2023-02-10  459  				phys_addr_t end = rmem->base + rmem->size - 1;
aeb9267eb6b1df Martin Liu         2023-02-10  460  				bool reusable =
aeb9267eb6b1df Martin Liu         2023-02-10  461  					(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
aeb9267eb6b1df Martin Liu         2023-02-10  462  
6ee7afbabcee4d Geert Uytterhoeven 2023-02-16  463  				pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
aeb9267eb6b1df Martin Liu         2023-02-10  464  					&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
aeb9267eb6b1df Martin Liu         2023-02-10 @465  					nomap ? "nomap" : "map",
aeb9267eb6b1df Martin Liu         2023-02-10  466  					reusable ? "reusable" : "non-reusable",
aeb9267eb6b1df Martin Liu         2023-02-10  467  					rmem->name ? rmem->name : "unknown");
d0b8ed47e83a22 pierre Kuo         2019-02-19  468  			}
d0b8ed47e83a22 pierre Kuo         2019-02-19  469  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  470  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  471  }
9dcfee01930e6c Marek Szyprowski   2014-07-14  472  

:::::: The code at line 465 was first introduced by commit
:::::: aeb9267eb6b1df992e39467a620da8fdf434df54 of: reserved-mem: print out reserved-mem details during boot

:::::: TO: Martin Liu <liumartin@google.com>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
