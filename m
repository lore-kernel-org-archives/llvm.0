Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B632104;
	Tue,  8 Aug 2023 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691481835; x=1723017835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySK3NlCA6fyTM7xr3G84YaQjAx5GVDZt2tqPMcZ+1SA=;
  b=WR7ragVfvzpjOgbgxhHAKw6oOUdIaYPsKEWwWjaETlYGFaTAvYeDAY35
   ttUNQqSjzCB6RVSaoDCqgSEeaQZnP5XHwd1KK/4Wl84R+cBM7AHYc32jW
   Q2ZF4OSUsmDXZ7I+akwoHa0bMf/Dq+5QuXBOk8nX4iJWRYJi46BfwABKL
   180zWKzdmD/QLn8DXp+ccpWqkq6DLGvngBNi773kaGTYHQLH3wrdHQQ6Y
   J8x4wf4DrshK9R5eHxg67BaDuGmw4L7s++DOUWFF3X8HcnfvDpXKkOTfZ
   O06eOophFKT48Fsypsja5H0I0Rd3VE0hQwgKDmJUh2cbS7EprlRUTjYc8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374428088"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="374428088"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 01:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="760808069"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="760808069"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2023 01:03:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTHh1-0005DS-0c;
	Tue, 08 Aug 2023 08:03:51 +0000
Date: Tue, 8 Aug 2023 16:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] Makefile.extrawarn: enable
 -Wmissing-variable-declarations for W=1
Message-ID: <202308081508.EI3CRzQo-lkp@intel.com>
References: <20230807-missing_proto-v2-1-3ae2e188bb0c@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807-missing_proto-v2-1-3ae2e188bb0c@google.com>

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on 52a93d39b17dc7eb98b6aa3edb93943248e03b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/Makefile-extrawarn-enable-Wmissing-variable-declarations-for-W-1/20230808-005859
base:   52a93d39b17dc7eb98b6aa3edb93943248e03b2f
patch link:    https://lore.kernel.org/r/20230807-missing_proto-v2-1-3ae2e188bb0c%40google.com
patch subject: [PATCH v2] Makefile.extrawarn: enable -Wmissing-variable-declarations for W=1
config: arm64-randconfig-r013-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081508.EI3CRzQo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081508.EI3CRzQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081508.EI3CRzQo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:9:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/arm64/include/asm/timex.h:8:
   In file included from arch/arm64/include/asm/arch_timer.h:18:
   In file included from include/linux/smp.h:110:
   In file included from include/linux/preempt.h:79:
   In file included from arch/arm64/include/asm/preempt.h:6:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/arm64/include/asm/thread_info.h:18:
>> arch/arm64/include/asm/stack_pointer.h:8:24: error: no previous extern declaration for non-static variable 'current_stack_pointer' [-Werror,-Wmissing-variable-declarations]
       8 | register unsigned long current_stack_pointer asm ("sp");
         |                        ^
   arch/arm64/include/asm/stack_pointer.h:8:10: note: declare 'static' if the variable is not intended to be used outside of this translation unit
       8 | register unsigned long current_stack_pointer asm ("sp");
         |          ^
   1 error generated.


vim +/current_stack_pointer +8 arch/arm64/include/asm/stack_pointer.h

a9ea0017ebe888 Mark Rutland 2016-11-03  4  
a9ea0017ebe888 Mark Rutland 2016-11-03  5  /*
a9ea0017ebe888 Mark Rutland 2016-11-03  6   * how to get the current stack pointer from C
a9ea0017ebe888 Mark Rutland 2016-11-03  7   */
a9ea0017ebe888 Mark Rutland 2016-11-03 @8  register unsigned long current_stack_pointer asm ("sp");
a9ea0017ebe888 Mark Rutland 2016-11-03  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
