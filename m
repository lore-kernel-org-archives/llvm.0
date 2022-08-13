Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8148803
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660392379; x=1691928379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=La2MV/twutvtzIuiUnkuBxIZteeScrgpNTqFKmqxe8A=;
  b=P/7otl2zYw5hIjZC8XuYTOy2rNTvcVxobqEXTTzJv7M9Hu4pxTsspy1v
   7mIKHHwYyyF1w0lazMci3ccUoqljJIMlAp5XNU1BmrLAm1eHGZhCzR8u+
   sLyPy2XM+SRSFMj+ZVOiCuwqyBdYfsXHLAwBdkqLtCbORWbJckJVGHzis
   br/217qZdZM1Qf4rSekk7M5OtaUFKBCfJOUAM04niCinn3AJFQhyJ8D2N
   2y2FYBQKYYK01tQdczMQoeBnIo6azOQkaanGbW5ih1uuBlsUzfPzUGLsG
   lsY1N0tJ1sykvHzNmfGyL5dDqJwhMahlRnhaMKlwwU+OR64cAbZaUDKml
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="378039045"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="378039045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 05:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="639173369"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Aug 2022 05:06:17 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMpuC-0001e3-3D;
	Sat, 13 Aug 2022 12:06:17 +0000
Date: Sat, 13 Aug 2022 20:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] mm, slub: restrict sysfs validation to debug caches and
 make it safe
Message-ID: <202208131959.t6Tot4Ui-lkp@intel.com>
References: <20220809140043.9903-1-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809140043.9903-1-vbabka@suse.cz>

Hi Vlastimil,

I love your patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slub-restrict-sysfs-validation-to-debug-caches-and-make-it-safe/20220809-220312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r045-20220808 (https://download.01.org/0day-ci/archive/20220813/202208131959.t6Tot4Ui-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dc564f7a12794b651197f84e7ecb9904e6b09fff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vlastimil-Babka/mm-slub-restrict-sysfs-validation-to-debug-caches-and-make-it-safe/20220809-220312
        git checkout dc564f7a12794b651197f84e7ecb9904e6b09fff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/slub.c:1609:24: error: void function 'free_debug_processing' should not return a value [-Wreturn-type]
           unsigned long addr) { return 0; }
                                 ^      ~
   mm/slub.c:2182:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   1 warning and 1 error generated.


vim +/free_debug_processing +1609 mm/slub.c

41ecc55b8a8ca6 Christoph Lameter      2007-05-09  1602  
3ec0974210fe1b Christoph Lameter      2007-05-16  1603  static inline int alloc_debug_processing(struct kmem_cache *s,
dc564f7a12794b Vlastimil Babka        2022-08-09  1604  	struct slab *slab, void *object) { return 0; }
41ecc55b8a8ca6 Christoph Lameter      2007-05-09  1605  
dc564f7a12794b Vlastimil Babka        2022-08-09  1606  static inline void free_debug_processing(
bb192ed9aa7191 Vlastimil Babka        2021-11-03  1607  	struct kmem_cache *s, struct slab *slab,
81084651d73737 Jesper Dangaard Brouer 2015-11-20  1608  	void *head, void *tail, int bulk_cnt,
282acb436176db Laura Abbott           2016-03-15 @1609  	unsigned long addr) { return 0; }
41ecc55b8a8ca6 Christoph Lameter      2007-05-09  1610  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
