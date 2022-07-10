Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3B1872
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657472363; x=1689008363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8SO8lk2RCb4UnItvUYFu2aqqahdE5WPxwTSY9aJEncg=;
  b=kbI6tX14/EdNLhbXUyuxKiuKJNJfcEvf99T6VgiNLjWBiF8VJSQBcSUm
   9eeJCb43K145+gHYq8KX5N0Bgt5R0CMcgHFnftWl+SkQGfhMVfdKQmMX9
   3+RWo7DyUoWDw5kiIyrvLSTaj8DD29AsLJ3eTrsgI+8XcTOJS6ip9xGRq
   9pgWGbcAr5gg/8px68qgt8uQSWjueII3WKvxydADHmQNgm5rdjMUbPIjX
   GbuYpwicVdYCMfPp1elaScADGTw8vm6OI9Zo8haVhVWJaFHZliE2NhWhR
   HbRwfZ0RXWghgve9Vgj5j2dYlDG1P4GXls60kz06axVsFT6U3LLP42+uY
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="264302488"
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="264302488"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 09:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="627237961"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2022 09:59:20 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAaH9-000Q1c-DA;
	Sun, 10 Jul 2022 16:59:19 +0000
Date: Mon, 11 Jul 2022 00:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Jen Chang <arthurchang09@gmail.com>, andy@kernel.org,
	akinobu.mita@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	Yu-Jen Chang <arthurchang09@gmail.com>
Subject: Re: [PATCH 2/2] lib/string.c: Optimize memchr()
Message-ID: <202207110028.KNZ3Yupd-lkp@intel.com>
References: <20220710142822.52539-3-arthurchang09@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710142822.52539-3-arthurchang09@gmail.com>

Hi Yu-Jen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Jen-Chang/Optimize-memchr/20220710-223118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
config: hexagon-randconfig-r041-20220710 (https://download.01.org/0day-ci/archive/20220711/202207110028.KNZ3Yupd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/307ee542c2bd8378b2225910f3f9b982df7a7669
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yu-Jen-Chang/Optimize-memchr/20220710-223118
        git checkout 307ee542c2bd8378b2225910f3f9b982df7a7669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/string.c:902:7: error: conflicting types for 'memchr'
   void *memchr(const void *p, int c, unsigned long length)
         ^
   include/linux/string.h:162:15: note: previous declaration is here
   extern void * memchr(const void *,int,__kernel_size_t);
                 ^
   1 error generated.


vim +/memchr +902 lib/string.c

   891	
   892	#ifndef __HAVE_ARCH_MEMCHR
   893	/**
   894	 * memchr - Find a character in an area of memory.
   895	 * @p: The memory area
   896	 * @c: The byte to search for
   897	 * @length: The size of the area.
   898	 *
   899	 * returns the address of the first occurrence of @c, or %NULL
   900	 * if @c is not found
   901	 */
 > 902	void *memchr(const void *p, int c, unsigned long length)
   903	{
   904		u64 mask, val;
   905		const void *end = p + length;
   906	
   907		c &= 0xff;
   908		if (p <= end - 8) {
   909			mask = c;
   910			MEMCHR_MASK_GEN(mask);
   911	
   912			for (; p <= end - 8; p += 8) {
   913				val = *(u64 *)p ^ mask;
   914				if ((val + 0xfefefefefefefeffu) &
   915				    (~val & 0x8080808080808080u))
   916					break;
   917			}
   918		}
   919	
   920		for (; p < end; p++)
   921			if (*(unsigned char *)p == c)
   922				return (void *)p;
   923	
   924		return NULL;
   925	}
   926	EXPORT_SYMBOL(memchr);
   927	#endif
   928	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
