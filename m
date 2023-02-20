Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526112FAF;
	Mon, 20 Feb 2023 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676892016; x=1708428016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMeOaeos5L6XiWWz7HSIAXLFkTHkldTIrwXmCya5Dmg=;
  b=hE0YTNSa5QEJTkq1nHlN2w0sI4edp/mdREcU5Q1CM+M47RoiPoxGHnb7
   q09csgMiLja/MUoaI8jo0QPhKN0hC+Vwdr9U4NvH7Pn9A9VQoUXFVFsGT
   /u+kJ43H/4+46r9p26Apju9tmLHInuGljkKVHZ4Lpu31EcOoO8xmNbTqi
   IVuN1pCAW4/eWOAbAsYGSeKASgo7wWeX2ElAfAV/mjzSs8YBhaCRXxYCs
   utppOJmeg4+ZbO4D+xnFqz2+GRVHsG/Eiq5Jl7kEb+RQDenWheKAQvsAK
   hCVrSo872eLIzQrLHgVokM9PMIQ4aBwhWibe4VFkVVLSSE9HXx58SEtfl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359843388"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="359843388"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 03:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="780623919"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="780623919"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2023 03:20:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU4DN-000DsP-30;
	Mon, 20 Feb 2023 11:20:13 +0000
Date: Mon, 20 Feb 2023 19:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: [saeed:dynamic-msix 2/15] lib/cpu_rmap.c:153:12: warning: result of
 comparison of constant -1 with expression of type 'u16' (aka 'unsigned
 short') is always false
Message-ID: <202302201908.Hmw6vw1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git dynamic-msix
head:   0f2bf1fcae96a83b8c5581854713c9fc3407556e
commit: 39ab85caf5626a84a138add0d222a7cc5d69f00b [2/15] lib: cpu_rmap: Use allocator for rmap entries
config: i386-randconfig-a011-20230220 (https://download.01.org/0day-ci/archive/20230220/202302201908.Hmw6vw1t-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=39ab85caf5626a84a138add0d222a7cc5d69f00b
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed dynamic-msix
        git checkout 39ab85caf5626a84a138add0d222a7cc5d69f00b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201908.Hmw6vw1t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/cpu_rmap.c:153:12: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           if (index == -1)
               ~~~~~ ^  ~~
   lib/cpu_rmap.c:311:18: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           if (glue->index == -1)
               ~~~~~~~~~~~ ^  ~~
   2 warnings generated.


vim +153 lib/cpu_rmap.c

   141	
   142	/**
   143	 * cpu_rmap_add - add object to a rmap
   144	 * @rmap: CPU rmap allocated with alloc_cpu_rmap()
   145	 * @obj: Object to add to rmap
   146	 *
   147	 * Return index of object.
   148	 */
   149	int cpu_rmap_add(struct cpu_rmap *rmap, void *obj)
   150	{
   151		u16 index = get_free_index(rmap);
   152	
 > 153		if (index == -1)
   154			return index;
   155	
   156		rmap->obj[index] = obj;
   157		return index;
   158	}
   159	EXPORT_SYMBOL(cpu_rmap_add);
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
