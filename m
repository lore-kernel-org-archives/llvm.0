Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E312B87;
	Fri,  9 Jun 2023 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686303365; x=1717839365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2G/ZBWJ+bChfZroJsrTfZdBnqBEt1G0Os4orLnXNfg=;
  b=J1TAXvrA+UdsFbrLuK8RyhmNfNNK9PqTWZgLG5IpAse3qrP6rlivXDNW
   qaBWd3cXPbtoxiaUt4Kk9ioxthu70Fl25dhB/j0OxqJRFYS/Z08xX3DwM
   qUxLVTmwI5JZJ3wpqHWFLSzokULpy7YTrdi18CQu6iiBBU33+LM6Is23Z
   J4Ad7V8k9KwmhrHyF9byDpQCBkdO8BHXAnmvD19tufaWuOFZutkYy4opY
   E9U2q8QqWDjZk3bdcous6NPOSW03ds7oBDX8EUy5aiqQV+0aUBqCe01gV
   sbnKIWpeiT75rNzqXrOKBplaeldR3h2Qwbs/qPPFuBvqUJxzN40LkoRu+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337919076"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="337919076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854687095"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="854687095"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 02:36:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7YXJ-0008tq-1w;
	Fri, 09 Jun 2023 09:36:01 +0000
Date: Fri, 9 Jun 2023 17:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lu Hongfei <luhongfei@vivo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	opensource.kernel@vivo.com, luhongfei@vivo.com
Subject: Re: [PATCH] mm/vmalloc: Replace the ternary conditional operator
 with min()
Message-ID: <202306091701.KHIG4Osf-lkp@intel.com>
References: <20230609061309.42453-1-luhongfei@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609061309.42453-1-luhongfei@vivo.com>

Hi Lu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-Hongfei/mm-vmalloc-Replace-the-ternary-conditional-operator-with-min/20230609-141417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230609061309.42453-1-luhongfei%40vivo.com
patch subject: [PATCH] mm/vmalloc: Replace the ternary conditional operator with min()
config: i386-randconfig-i011-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091701.KHIG4Osf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch akpm-mm mm-everything
        git checkout akpm-mm/mm-everything
        b4 shazam https://lore.kernel.org/r/20230609061309.42453-1-luhongfei@vivo.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091701.KHIG4Osf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:3574:9: warning: comparison of distinct pointer types ('typeof (remains) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   num = min(remains, PAGE_SIZE);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.


vim +3574 mm/vmalloc.c

  3561	
  3562	/*
  3563	 * Atomically zero bytes in the iterator.
  3564	 *
  3565	 * Returns the number of zeroed bytes.
  3566	 */
  3567	static size_t zero_iter(struct iov_iter *iter, size_t count)
  3568	{
  3569		size_t remains = count;
  3570	
  3571		while (remains > 0) {
  3572			size_t num, copied;
  3573	
> 3574			num = min(remains, PAGE_SIZE);
  3575			copied = copy_page_to_iter_nofault(ZERO_PAGE(0), 0, num, iter);
  3576			remains -= copied;
  3577	
  3578			if (copied < num)
  3579				break;
  3580		}
  3581	
  3582		return count - remains;
  3583	}
  3584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
