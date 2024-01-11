Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4E20E0;
	Thu, 11 Jan 2024 05:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBBerVnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704950091; x=1736486091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4Uk2RvcV5FItTKxI9nzciwuds1tZHn3YsoD/K29g2c=;
  b=TBBerVnTHog9QapwVFlvssC6Wp3le/axpof2bjxcRG55Zh/dfPBWjt34
   muRn6BeDJ+eu7VqK7aRhZsS8USOc2C4zXVYgAMZiArFJeFz/DX6GUzw2h
   Q6OeccOf5/6mFL0MHoOBajW5zV77AIxa17TGeNVnsjZ+tinlhsNWnyvqs
   c8vQdPZWD75sMiQrr52dJURQUCqrIZTiB3077m/JZyqPNrkpN2Dh+NH2U
   ufRG3iasL9F07oyaJF7bDzuW1DKJEI3qv6MLMyHbQB5AZIu6B1tiOi/UE
   bptjCTbJROAf1U+Eg4b2ReaZ8P333wYw9VlP7n1cKPbs4oESol7/k1B5m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5826901"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="5826901"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 21:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113705786"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="1113705786"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2024 21:14:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNnOv-0007rW-1W;
	Thu, 11 Jan 2024 05:14:45 +0000
Date: Thu, 11 Jan 2024 13:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12999/13245] mm/vmalloc.c:4652:25: warning:
 variable 'addr' is uninitialized when used here
Message-ID: <202401111304.N5dkFGNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: e88b85b81d5313a69cb62829b957d4a9ecde600b [12999/13245] mm: vmalloc: offload free_vmap_area_lock lock
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111304.N5dkFGNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111304.N5dkFGNe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:4652:25: warning: variable 'addr' is uninitialized when used here [-Wuninitialized]
                   va = __find_vmap_area(addr, &vn->busy.root);
                                         ^~~~
   mm/vmalloc.c:4645:20: note: initialize the variable 'addr' to silence this warning
           unsigned long addr;
                             ^
                              = 0
   1 warning generated.


vim +/addr +4652 mm/vmalloc.c

a10aa579878fc6 Christoph Lameter       2008-04-28  4637  
5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4638  #ifdef CONFIG_PRINTK
98f180837a896e Paul E. McKenney        2020-12-08  4639  bool vmalloc_dump_obj(void *object)
98f180837a896e Paul E. McKenney        2020-12-08  4640  {
98f180837a896e Paul E. McKenney        2020-12-08  4641  	void *objp = (void *)PAGE_ALIGN((unsigned long)object);
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4642) 	const void *caller;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4643) 	struct vmap_area *va;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4644) 	struct vmap_node *vn;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4645) 	unsigned long addr;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4646) 	unsigned int nr_pages;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4647) 	bool success = false;
98f180837a896e Paul E. McKenney        2020-12-08  4648  
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4649) 	vn = addr_to_node((unsigned long)objp);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4650) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4651) 	if (spin_trylock(&vn->busy.lock)) {
86817057732a9c Uladzislau Rezki (Sony  2024-01-02 @4652) 		va = __find_vmap_area(addr, &vn->busy.root);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4653) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4654) 		if (va && va->vm) {
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4655) 			addr = (unsigned long)va->vm->addr;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4656) 			caller = va->vm->caller;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4657) 			nr_pages = va->vm->nr_pages;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4658) 			success = true;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4659) 		}
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4660) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4661) 		spin_unlock(&vn->busy.lock);
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4662) 	}
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4663) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4664) 	if (success)
bd34dcd4120d7e Paul E. McKenney        2020-12-09  4665  		pr_cont(" %u-page vmalloc region starting at %#lx allocated at %pS\n",
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4666) 			nr_pages, addr, caller);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4667) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4668) 	return success;
98f180837a896e Paul E. McKenney        2020-12-08  4669  }
5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4670  #endif
98f180837a896e Paul E. McKenney        2020-12-08  4671  

:::::: The code at line 4652 was first introduced by commit
:::::: 86817057732a9ce9cefdb6f513b6554a55ebbbbb mm: vmalloc: remove global vmap_area_root rb-tree

:::::: TO: Uladzislau Rezki (Sony) <urezki@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
