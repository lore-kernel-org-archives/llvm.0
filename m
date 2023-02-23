Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA27E;
	Thu, 23 Feb 2023 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677180197; x=1708716197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PvhOgv3nkFj/F0NNqzpGnjaFNVGCFlZFsTrRZxjEVpg=;
  b=JVwAKh/TRasr2i5gipjIUgHctVSejAUOnux3U+yr0MPUdegcIgzSECpj
   zj0s267KGwdL+/9aSzLOMzQrL4BIY9o8ykr3wIvmps0zZHCZBKTdLqiCP
   sfKjzJuVL3PQ9KhrOe3wtr9SF8mzZXbq6Ng+rnu9D1ZGpkCBNTlm231uZ
   16GzPz/Xo7jv1mZgZ+xatUs+DCQ2wFCFB3gTOILxXiLdq4DW8Kb4/qHGf
   +cHNnTqUei+t9u+V6aO4ZeiY8pCaq37igZpsVGv36Dq9SZNlTpGQmnmPy
   kH7j5dudG1ravQmVPBeWJOVgzCxAsrMSP0kYzP8XfBZdub3e8iPTa7gOk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333310088"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="333310088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782027209"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="782027209"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 11:23:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHBT-0001fN-2Z;
	Thu, 23 Feb 2023 19:23:15 +0000
Date: Fri, 24 Feb 2023 03:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation
 helper.
Message-ID: <202302240340.GL1etcaC-lkp@intel.com>
References: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223142531.8446-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230223142531.8446-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 2/3] drm/amd: Convert amdgpu to use suballocation helper.
config: hexagon-randconfig-r041-20230223 (https://download.01.org/0day-ci/archive/20230224/202302240340.GL1etcaC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/566352490ef7a031bd23f9d6524057fd7b31330c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-225547
        git checkout 566352490ef7a031bd23f9d6524057fd7b31330c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240340.GL1etcaC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_umoddi3
   >>> referenced by drm_suballoc.c
   >>>               drivers/gpu/drm/drm_suballoc.o:(drm_suballoc_new) in archive vmlinux.a
   >>> referenced by drm_suballoc.c
   >>>               drivers/gpu/drm/drm_suballoc.o:(drm_suballoc_new) in archive vmlinux.a
   >>> referenced by drm_suballoc.c
   >>>               drivers/gpu/drm/drm_suballoc.o:(drm_suballoc_new) in archive vmlinux.a
   >>> referenced 17 more times
   >>> did you mean: __hexagon_umodsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/umodsi3.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
