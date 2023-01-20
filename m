Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EB7474;
	Fri, 20 Jan 2023 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674249691; x=1705785691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+LPXapS4CaPeAk20B5zbKNGlz1ZD0Z9f9AOdtAx4To8=;
  b=gZOY63LR+tA5fAGRF29huN1jFI/iQoLfTQapy1s1AHwIXl50k7y7Zyvu
   33Key4LLEtZS6GHOXwsrLc74QiTzCmsR4uJ5n25b+VluvQ2B0DeP87Jjp
   A9Gtbm2Etonn5e5DkpF/vgmZzehSv1oHRVT1SQMYbCIlPin4H5WZD9jhF
   LgdWW4alkh1LSHilpa2pNnKda3mYvipFkTvdedjD+Fp3rvYlU7aCb64B4
   jgqSUwEwezI2HSsaH15gRBqAwnKFfEzP003KPGiRXPTYRGmYaBBazwf/k
   9ECwEy/7NVclq6at+vzqLCs0c/1N5BRh3m3Na5giU+WyRGcIKui8Pqh9M
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305368002"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="305368002"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 13:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989533300"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989533300"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 13:21:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIypC-0002yc-1G;
	Fri, 20 Jan 2023 21:21:26 +0000
Date: Sat, 21 Jan 2023 05:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: alejandro.lucero-palau@amd.com, netdev@vger.kernel.org,
	linux-net-drivers@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	edumazet@google.com, habetsm@gmail.com, ecree.xilinx@gmail.com,
	Alejandro Lucero <alejandro.lucero-palau@amd.com>
Subject: Re: [PATCH net-next 4/7] sfc: add devlink port support for ef100
Message-ID: <202301210559.Gj6wK4CN-lkp@intel.com>
References: <20230119113140.20208-5-alejandro.lucero-palau@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119113140.20208-5-alejandro.lucero-palau@amd.com>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/sfc-add-devlink-support-for-ef100/20230119-193440
patch link:    https://lore.kernel.org/r/20230119113140.20208-5-alejandro.lucero-palau%40amd.com
patch subject: [PATCH net-next 4/7] sfc: add devlink port support for ef100
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230121/202301210559.Gj6wK4CN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b06b1ae6605af55ed8127878054f8d69046b83c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alejandro-lucero-palau-amd-com/sfc-add-devlink-support-for-ef100/20230119-193440
        git checkout 5b06b1ae6605af55ed8127878054f8d69046b83c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "efx_ef100_fini_reps" [drivers/net/ethernet/sfc/sfc.ko] undefined!
ERROR: modpost: "efx_fini_mae" [drivers/net/ethernet/sfc/sfc.ko] undefined!
>> ERROR: modpost: "efx_mae_lookup_mport" [drivers/net/ethernet/sfc/sfc.ko] undefined!
>> ERROR: modpost: "efx_mae_get_mport" [drivers/net/ethernet/sfc/sfc.ko] undefined!
>> ERROR: modpost: "ef100_mport_on_local_intf" [drivers/net/ethernet/sfc/sfc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
