Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96592565
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648562598; x=1680098598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7ljZpLuhVxvG1lByeWMuXSfovsfSjMocKlsX1aE0+o=;
  b=AK3SrwTW+6D6v33KjMmoVMkT6jyxHdluxFyckHM4SNUwnmzB4HAzFJ9o
   t/OpDCvwKdW3Jd58fNflYyNIzDgI1wWZRNQY5DK3gAZBjssoYFL3BU+cW
   PqH5y/IWIHDcBN0iXJ7ty7GTpNY4ibbam5elo3KrNT1yToVr4x3QnAS98
   wohL+SBswjo0JW5FIyLDfBCjjrUS2U8sOnEz+NjZ/5gB/Ei73UbdGsLfo
   sJVp+vIhJD9ImIFQHS199buTQkSrbwaTCUeDOKs3K9myCa0FQEgtg0dlM
   nZlQdETISkoFXuA7XYwIX/skkpN+xENFzAoM1/KGpJ3pQrawQGyNRqy6Y
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259228024"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259228024"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 07:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="585586371"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2022 07:03:12 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nZCRD-0000I4-R1; Tue, 29 Mar 2022 14:03:11 +0000
Date: Tue, 29 Mar 2022 22:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
	Ingo Molnar <mingo@elte.hu>, Adrian Bunk <bunk@stusta.de>,
	Randy Dunlap <rdunlap@xenotime.net>,
	Michel Lespinasse <walken@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [hnaz-mm:master 478/481] kernel/synchro-test.c:393:49: warning:
 variable 'zeros' set but not used
Message-ID: <202203292115.plWUiMYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/hnaz/linux-mm master
head:   673977c1d5c4c5bc15abf8f01ebaddc66116a9cd
commit: 52880bd2b8272052d5ccf95f94704a959796c9f6 [478/481] mutex subsystem, synchro-test module
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220329/202203292115.plWUiMYU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/hnaz/linux-mm/commit/52880bd2b8272052d5ccf95f94704a959796c9f6
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 52880bd2b8272052d5ccf95f94704a959796c9f6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/synchro-test.c:267:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&sp_comp[N], 0);
           ^
   kernel/synchro-test.c:268:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/synchro-test.c:288:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&mx_comp[N], 0);
           ^
   kernel/synchro-test.c:289:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/synchro-test.c:309:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&sm_comp[N], 0);
           ^
   kernel/synchro-test.c:310:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/synchro-test.c:332:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&rd_comp[N], 0);
           ^
   kernel/synchro-test.c:333:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/synchro-test.c:355:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&wr_comp[N], 0);
           ^
   kernel/synchro-test.c:356:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   kernel/synchro-test.c:383:2: error: implicit declaration of function 'complete_and_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           complete_and_exit(&dg_comp[N], 0);
           ^
   kernel/synchro-test.c:384:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> kernel/synchro-test.c:393:49: warning: variable 'zeros' set but not used [-Wunused-but-set-variable]
           unsigned int tot = 0, max = 0, min = UINT_MAX, zeros = 0, cnt;
                                                          ^
   1 warning and 12 errors generated.


vim +/zeros +393 kernel/synchro-test.c

   390	
   391	static unsigned int total(const char *what, unsigned int counts[], int num)
   392	{
 > 393		unsigned int tot = 0, max = 0, min = UINT_MAX, zeros = 0, cnt;
   394		int loop;
   395	
   396		for (loop = 0; loop < num; loop++) {
   397			cnt = counts[loop];
   398	
   399			if (cnt == 0) {
   400				zeros++;
   401				min = 0;
   402				continue;
   403			}
   404	
   405			tot += cnt;
   406			if (tot > max)
   407				max = tot;
   408			if (tot < min)
   409				min = tot;
   410		}
   411	
   412		if (verbose && tot > 0) {
   413			printk("%s:", what);
   414	
   415			for (loop = 0; loop < num; loop++) {
   416				cnt = counts[loop];
   417	
   418				if (cnt == 0)
   419					printk(" zzz");
   420				else
   421					printk(" %d%%", cnt * 100 / tot);
   422			}
   423	
   424			printk("\n");
   425		}
   426	
   427		return tot;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
