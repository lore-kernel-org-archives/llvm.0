Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808E7817
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657286032; x=1688822032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Udd/LCsKWROYZpOMU9ODv8sLnUrCHZPCKOTDfx/24+c=;
  b=NqN178VUvhNIHbFEc2T0Fj9z25dsyAHjHtWPqHGzIaCrs/rkuRfJosYr
   YsWpo4ZXuCJxglunYoXNeK2G/vEoSg5qX5HLHOc5+irGkLvVAWxIt/fx8
   3vQeSLpNprxv7jMI0HovwfGJqsZdGyo/mRYajWSL4/MaGcqjbAoCFAM2K
   Qxi4Lq/bg/HN5QvqjpUibFwA71vTaDI3ZL6F+S9NvVyOKlDpTuqJm2Y2v
   +jIu+hG39sMO2aqCrsZdIwdsJwytjtB3T7Puf32JgOfnkQ+4QmdNfg4xm
   Z6FrznbSCZU6ZL+TYvp7ESfiuWBmn0Q2jFrvTeERhm/SkxzMnkZpr4odE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284299196"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="284299196"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 06:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="736334808"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2022 06:13:50 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9nnp-000NVU-Ca;
	Fri, 08 Jul 2022 13:13:49 +0000
Date: Fri, 8 Jul 2022 21:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: [linux-next:master 8187/8914] lib/bitmap.c:351:6: error: conflicting
 types for '__bitmap_set'
Message-ID: <202207082141.JR9ENDa5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: aaa4ab5ec04480fd0c16c7452d28444c862b2b87 [8187/8914] lib/bitmap: Make length parameter `len` unsigned
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220708/202207082141.JR9ENDa5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aaa4ab5ec04480fd0c16c7452d28444c862b2b87
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout aaa4ab5ec04480fd0c16c7452d28444c862b2b87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD f2528c29385819a84480cacef4886b049761e2c5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> lib/bitmap.c:351:6: error: conflicting types for '__bitmap_set'
   void __bitmap_set(unsigned long *map, unsigned int start, unsigned int len)
        ^
   include/linux/bitmap.h:167:6: note: previous declaration is here
   void __bitmap_set(unsigned long *map, unsigned int start, int len);
        ^
   1 error generated.


vim +/__bitmap_set +351 lib/bitmap.c

   350	
 > 351	void __bitmap_set(unsigned long *map, unsigned int start, unsigned int len)
   352	{
   353		unsigned long *p = map + BIT_WORD(start);
   354		const unsigned int size = start + len;
   355		int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
   356		unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
   357	
   358		while (len >= bits_to_set) {
   359			*p |= mask_to_set;
   360			len -= bits_to_set;
   361			bits_to_set = BITS_PER_LONG;
   362			mask_to_set = ~0UL;
   363			p++;
   364		}
   365		if (len) {
   366			mask_to_set &= BITMAP_LAST_WORD_MASK(size);
   367			*p |= mask_to_set;
   368		}
   369	}
   370	EXPORT_SYMBOL(__bitmap_set);
   371	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
