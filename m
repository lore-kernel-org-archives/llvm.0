Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94832560
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654185395; x=1685721395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G260DLjKCKHF/IsA/C/V8T/NPk6CUeLQeiSsWDsH2IA=;
  b=PW8NkqtJkfsSbEaTlEqb71nzI5ap8r+PUf8SdPXo51WPRJkOkvI4EW6U
   Pmi225qIGC9Sd+4GEEtA3Rr2Cz71uN9pHHL/qoIaEeTdq2ut5RM4Stkav
   jRnqB2+VGodvirAGLM4I7xcKhrgxF/EWdHo7LN3XBdEP+CYTsFwoty/Va
   kqqDTV+OE8gVeNYgCV4yR2VmJN2sOS0KwsqCFOV9eoaUlRsgUHveYr+C5
   DLqHUCx/P9M1Ly68O49AIw0K5b75LV/Y67Y/nKBdH5HAFyMKeZHDpkFXW
   M1jhUW+Ai0Q1d/JF3xHSb/e+YjKrEoP85wj26iBW+YYcX+tOKtWfu72bZ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301357327"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="301357327"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 08:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="563366864"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2022 08:56:33 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwnBY-0005Ef-Va;
	Thu, 02 Jun 2022 15:56:32 +0000
Date: Thu, 2 Jun 2022 23:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_lc_dev 4/5]
 drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:26:5: warning: no
 previous prototype for function 'mlxsw_linecard_dev_id_alloc'
Message-ID: <202206022331.m9R8tlOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_lc_dev
head:   ef34c1c33c0ae43a9ad3c0ed3708eb1880972de0
commit: 2d0852c5fa89a48c6fa1f860600b5e24e2faab4b [4/5] mlxsw: core_linecards: Introduce per line card auxiliary device
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220602/202206022331.m9R8tlOt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/2d0852c5fa89a48c6fa1f860600b5e24e2faab4b
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_lc_dev
        git checkout 2d0852c5fa89a48c6fa1f860600b5e24e2faab4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:26:5: warning: no previous prototype for function 'mlxsw_linecard_dev_id_alloc' [-Wmissing-prototypes]
   int mlxsw_linecard_dev_id_alloc(void)
       ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mlxsw_linecard_dev_id_alloc(void)
   ^
   static 
>> drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:31:6: warning: no previous prototype for function 'mlxsw_linecard_dev_id_free' [-Wmissing-prototypes]
   void mlxsw_linecard_dev_id_free(int id)
        ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mlxsw_linecard_dev_id_free(int id)
   ^
   static 
   2 warnings generated.


vim +/mlxsw_linecard_dev_id_alloc +26 drivers/net/ethernet/mellanox/mlxsw/core_linecard_dev.c

    25	
  > 26	int mlxsw_linecard_dev_id_alloc(void)
    27	{
    28		return ida_alloc(&mlxsw_linecard_dev_ida, GFP_KERNEL);
    29	}
    30	
  > 31	void mlxsw_linecard_dev_id_free(int id)
    32	{
    33		ida_free(&mlxsw_linecard_dev_ida, id);
    34	}
    35	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
