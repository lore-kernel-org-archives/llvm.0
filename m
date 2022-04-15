Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802EA182
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 02:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649990901; x=1681526901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fvKMTgYSbk6pJ8MqCyitz/wA3aCnBOZnivgruHxRgxI=;
  b=bKuuVT7Cnqyf3q9T2LjI5HkO37qqu5F8Uu0i7s/zt+ratvgznvKSlk6q
   ayMSoqWjsr9aYOpZz7sG8RDgmWzaVPZcO4NtGbC96FglvizMYpXkvX+gy
   95BokzSmkxWXQKdxLOof5xrWpHQFOXoUmlkZ0iNcBJZK3rIorHNl/O5Mn
   gijo0+dX0Yvt1Cu2H08X8l7Ddl6PMXqwgimTdGXfBmt36hoXs22WrMpJc
   gMkWgXwFppAe2IlZqwIx/kJUABumyvo20mqeUNhC7gSnndrk8Ga4hYV8s
   0jtSAdlzimkpPx0oHUB/JgaIkqARw5MP3ejS+YUsDWJOasUfC78BcEF/K
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="263257713"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="263257713"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 19:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="560421033"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2022 19:48:16 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfC0N-0001S9-M6;
	Fri, 15 Apr 2022 02:48:15 +0000
Date: Fri, 15 Apr 2022 10:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
	mike.kravetz@oracle.com, akpm@linux-foundation.org,
	mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
	osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 1/4] mm: hugetlb_vmemmap: introduce
 CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
Message-ID: <202204151043.JSdPGnod-lkp@intel.com>
References: <20220412111434.96498-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412111434.96498-2-songmuchun@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Muchun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]
[also build test ERROR on next-20220414]
[cannot apply to tip/x86/mm masahiroy-kbuild/for-next linus/master v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/add-hugetlb_optimize_vmemmap-sysctl/20220412-191713
base:   https://github.com/hnaz/linux-mm master
config: s390-randconfig-r025-20220414 (https://download.01.org/0day-ci/archive/20220415/202204151043.JSdPGnod-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bb63a010442d551909f826b4c05bf707a6dff052
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Muchun-Song/add-hugetlb_optimize_vmemmap-sysctl/20220412-191713
        git checkout bb63a010442d551909f826b4c05bf707a6dff052
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
>> include/linux/kconfig.h:8:10: fatal error: 'generated/autoconf_ext.h' file not found
   #include <generated/autoconf_ext.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.host:111: arch/s390/tools/gen_facilities] Error 1
   make[2]: Target 'kapi' not remade because of errors.
   make[1]: *** [arch/s390/Makefile:148: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +8 include/linux/kconfig.h

     6	
     7	#ifndef __EXCLUDE_AUTOCONF_EXT_H
   > 8	#include <generated/autoconf_ext.h>
     9	#endif
    10	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
