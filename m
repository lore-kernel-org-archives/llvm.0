Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925621ED25;
	Fri, 21 Jul 2023 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689954831; x=1721490831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZyXtUS7bskPkQepR8jD+E0svb+G4NCuyFbBEPrx/Ac0=;
  b=XY3Z1ON9BE4jgi5VFURvuw5jn39mJI8Z9yyUtET44a9IUW7yN6hiyrKX
   cr3mdTJm4tHOmGlM03K0rToo9A0v5Jw6iKFY71IRJT2md1t1qbRZXYXPg
   DfVmnNzTwcVpyLFVOIE0HV5Mem2hHVg82CywpL+O/FTc1nOViOtVHsHy3
   Ee3Mh9/PNiM2WtZj7e6otMq30G4Fgc0bD0/17nksgZFGMX5BTSfYHj0F2
   SLWPKiFBDBhOqAMgICWiIdHXq8YAfdJfYfXchgupF6on5PsYX6Ynj4+Ep
   2PzpBVb1jWUtScSvuwMw1pTe9VjAzEuO8diGA0WXjEDOsXZ8EaMr3fhuj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364515606"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="364515606"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728147720"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="728147720"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 08:53:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMsRZ-0007Px-2Z;
	Fri, 21 Jul 2023 15:53:29 +0000
Date: Fri, 21 Jul 2023 23:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Herve Codina <herve.codina@bootlin.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/1] minmax: Fix header inclusions
Message-ID: <202307212350.YQFKs9v6-lkp@intel.com>
References: <20230721133932.12679-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721133932.12679-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on crng-random/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/minmax-Fix-header-inclusions/20230721-214152
base:   linus/master
patch link:    https://lore.kernel.org/r/20230721133932.12679-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] minmax: Fix header inclusions
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230721/202307212350.YQFKs9v6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212350.YQFKs9v6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212350.YQFKs9v6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/os-Linux/sigio.c:6:
   In file included from include/linux/minmax.h:5:
   In file included from include/linux/build_bug.h:5:
>> include/linux/compiler.h:246:10: fatal error: 'asm/rwonce.h' file not found
     246 | #include <asm/rwonce.h>
         |          ^~~~~~~~~~~~~~
   1 error generated.


vim +246 include/linux/compiler.h

a9a3ed1eff3601 Borislav Petkov 2020-04-22  245  
e506ea451254ab Will Deacon     2019-10-15 @246  #include <asm/rwonce.h>
e506ea451254ab Will Deacon     2019-10-15  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
