Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF37A
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 07:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654844963; x=1686380963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prsKme4t8qsKePFyd1/lDxgNPz0quzkkSmZzNVZ8u2o=;
  b=VniXJF4wHiesJhg/FT8POPOBNIMU1ikxUPdW6+TmvO2+ssdympWH0SKu
   5KnB//hUMAfX+uOqVqI4VHap7d5TOuMw7NRZQywpmtIZgzl7G7wfzWgwb
   XhB//GfJVK/jprN3kktn8jUviUjuSt1I8KvPBUY1XHElGKH2wgIaoJtgA
   VMpuxUeiVfvXrwFECSydKMITuXZIBZHwFrWQwo1dBW3FnmRvRTbfM+7JQ
   ASMdFX+uFGgrxTm/MuJU9b+8gIG4rkZ6xoG8uZEwvnNklCygAuJmwx7lI
   u70iTgR5WKKg3pKpx9t1fjWWc3/B3giAKMsvmlqQRhbnCiF74uKx8drbI
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278344226"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="278344226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 00:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="828086581"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2022 00:09:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzYlT-000GmH-RB;
	Fri, 10 Jun 2022 07:09:03 +0000
Date: Fri, 10 Jun 2022 15:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:fns 8/8] lib/find_bit.c:105:1: error: redefinition of
 '__ksymtab__find_first_bit'
Message-ID: <202206101503.SiKOLRsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fns
head:   785e34f40a6ad867ddc1fccf032a54bb41563865
commit: 785e34f40a6ad867ddc1fccf032a54bb41563865 [8/8] fns
config: hexagon-randconfig-r041-20220609 (https://download.01.org/0day-ci/archive/20220610/202206101503.SiKOLRsZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/785e34f40a6ad867ddc1fccf032a54bb41563865
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov fns
        git checkout 785e34f40a6ad867ddc1fccf032a54bb41563865
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/find_bit.c:105:1: error: redefinition of '__ksymtab__find_first_bit'
   EXPORT_SYMBOL(_find_first_bit);
   ^
   include/linux/export.h:150:29: note: expanded from macro 'EXPORT_SYMBOL'
   #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
                                           ^
   include/linux/export.h:147:34: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
                                           ^
   include/linux/export.h:140:39: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
                                           ^
   include/linux/export.h:96:2: note: expanded from macro '___EXPORT_SYMBOL'
           __KSYMTAB_ENTRY(sym, sec)
           ^
   include/linux/export.h:57:36: note: expanded from macro '__KSYMTAB_ENTRY'
           static const struct kernel_symbol __ksymtab_##sym               \
                                             ^
   <scratch space>:183:1: note: expanded from here
   __ksymtab__find_first_bit
   ^
   lib/find_bit.c:89:1: note: previous definition is here
   EXPORT_SYMBOL(_find_first_bit);
   ^
   include/linux/export.h:150:29: note: expanded from macro 'EXPORT_SYMBOL'
   #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
                                           ^
   include/linux/export.h:147:34: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
                                           ^
   include/linux/export.h:140:39: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
                                           ^
   include/linux/export.h:96:2: note: expanded from macro '___EXPORT_SYMBOL'
           __KSYMTAB_ENTRY(sym, sec)
           ^
   include/linux/export.h:57:36: note: expanded from macro '__KSYMTAB_ENTRY'
           static const struct kernel_symbol __ksymtab_##sym               \
                                             ^
   <scratch space>:168:1: note: expanded from here
   __ksymtab__find_first_bit
   ^
   1 error generated.


vim +/__ksymtab__find_first_bit +105 lib/find_bit.c

    91	
    92	unsigned long _find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
    93	{
    94		unsigned long idx, w;
    95	
    96		for (idx = 0; idx * BITS_PER_LONG < size; idx++, n -= w) {
    97			w = hweight_long(addr[idx]);
    98			if (w >= n)
    99				return min(idx * BITS_PER_LONG + fns(addr[idx], n), size);
   100		}
   101	
   102		return size;
   103	
   104	}
 > 105	EXPORT_SYMBOL(_find_first_bit);
   106	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
