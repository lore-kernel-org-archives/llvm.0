Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18E2C80
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 03:42:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="321836701"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="321836701"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 19:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="675425189"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2021 19:42:04 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqS7f-0007QW-Nh; Fri, 26 Nov 2021 03:42:03 +0000
Date: Fri, 26 Nov 2021 11:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <djrscally@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] media: entity: Add support for ancillary links
Message-ID: <202111261133.XqFnu5wF-lkp@intel.com>
References: <20211126001603.41148-2-djrscally@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126001603.41148-2-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20211126-081931
base:   git://linuxtv.org/media_tree.git master
config: mips-buildonly-randconfig-r003-20211125 (https://download.01.org/0day-ci/archive/20211126/202111261133.XqFnu5wF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0332d105b9ad7f1f0ffca7e78b71de8b3a48f158)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/3770587c7546ff01080c99a552fa3fd486528b1d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Introduce-ancillary-links/20211126-081931
        git checkout 3770587c7546ff01080c99a552fa3fd486528b1d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:1058:6: warning: no previous prototype for function 'media_remove_ancillary_link' [-Wmissing-prototypes]
   void media_remove_ancillary_link(struct media_link *link)
        ^
   drivers/media/mc/mc-entity.c:1058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void media_remove_ancillary_link(struct media_link *link)
   ^
   static 
   drivers/media/mc/mc-entity.c:17:27: warning: unused function 'gobj_type' [-Wunused-function]
   static inline const char *gobj_type(enum media_gobj_type type)
                             ^
   2 warnings generated.


vim +/media_remove_ancillary_link +1058 drivers/media/mc/mc-entity.c

  1057	
> 1058	void media_remove_ancillary_link(struct media_link *link)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
