Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9CD1865
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655971230; x=1687507230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8UTosm5kmpwnazx0Z7uDYyVGA3n9PMg53aPK1RogWQk=;
  b=Z2mVToYZ9EC+VaXglC3eF7jhiHmiW0er0RK3V3vMdCnmdlEH/bs7FBqd
   hjcywwjKZXozZN8101G49OIt2pfarn5cZljxAziHF3X6MXd0kOxZZRBeX
   Sczu8O0E5rBGz4sS7CTb3Nbl8rLqOu1oiknzMsxgiM8SRUDSWQnv6DFoa
   m01IonhXzhvH1PbccZgD1ht3e2sxFtMfmWLfDy3tKMZbRR8skwqbjLmxN
   yW+r3kAglkfAEexVXmK05WDBTgjoTkR8Qh8CWqZDetNVioqTO6K43Z6ap
   C66rmh1Fdodq5ejthXjmN0q5RrJ8OsC+Qek4K/7WzzG1SiUpBYru6BOUl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279423555"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="279423555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 01:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="615491255"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jun 2022 01:00:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4HlH-0000uo-2J;
	Thu, 23 Jun 2022 08:00:23 +0000
Date: Thu, 23 Jun 2022 15:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Widawsky <bwidawsk@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [cxl:preview 38/49] include/linux/memregion.h:19:6: warning: no
 previous prototype for function 'memregion_free'
Message-ID: <202206231541.NNhh1JGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   b2d4fd5c97b59f622e6c45ac51020cdcd66bb022
commit: e4b2a6ac46c3288f73b88e0aa69afd2a815930d7 [38/49] cxl/region: Add region creation support
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220623/202206231541.NNhh1JGy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=e4b2a6ac46c3288f73b88e0aa69afd2a815930d7
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout e4b2a6ac46c3288f73b88e0aa69afd2a815930d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/core/port.c:4:
>> include/linux/memregion.h:19:6: warning: no previous prototype for function 'memregion_free' [-Wmissing-prototypes]
   void memregion_free(int id)
        ^
   include/linux/memregion.h:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void memregion_free(int id)
   ^
   static 
   1 warning generated.


vim +/memregion_free +19 include/linux/memregion.h

a6c7f4c6aea5f4 Dan Williams 2019-11-06  10  
33dd70752cd76f Dan Williams 2019-11-06  11  #ifdef CONFIG_MEMREGION
33dd70752cd76f Dan Williams 2019-11-06  12  int memregion_alloc(gfp_t gfp);
33dd70752cd76f Dan Williams 2019-11-06  13  void memregion_free(int id);
33dd70752cd76f Dan Williams 2019-11-06  14  #else
33dd70752cd76f Dan Williams 2019-11-06  15  static inline int memregion_alloc(gfp_t gfp)
33dd70752cd76f Dan Williams 2019-11-06  16  {
33dd70752cd76f Dan Williams 2019-11-06  17  	return -ENOMEM;
33dd70752cd76f Dan Williams 2019-11-06  18  }
33dd70752cd76f Dan Williams 2019-11-06 @19  void memregion_free(int id)

:::::: The code at line 19 was first introduced by commit
:::::: 33dd70752cd76f4d883a165a674f13121a4155ed lib: Uplevel the pmem "region" ida to a global allocator

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
