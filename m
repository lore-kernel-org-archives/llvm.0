Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1823136A
	for <llvm@lists.linux.dev>; Sat,  4 Jun 2022 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654340441; x=1685876441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+eMIP4372CiyNzLU4uicwb1KwDon0gxRoNeNm90U5Kk=;
  b=b8IQhSP8zVwty+KnmPlvAlafWZ14ULgYHxQn6rgAlyP8gByJQnsWIwcB
   Nm/gMqe/CCEgx78ltfKEnG6LSvpsr5bS9fqwSaOAikIMG9i5v30XyX5zH
   yE74aw3lvE4AIloGZnxPVWpabNmCXFCkqjT0Ms4KZfhm6cXYg+rJk6mZe
   0Xey99SjtCNwXxBdi/sI6Ol909OtokJ44+xSFa5C9/JwT7qUQrVGA2ctY
   qKmahFctZmeK29IeLI53gNC8cDJEWTiFarUPwq5R3iPvDwcu+C9k9PHu/
   s/VysxbRhoJSZSruSlm5qZwrp1J//6SZWT/gqGzS2x0Y7Rjx6qV9mDnJc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="264100563"
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="264100563"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 04:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="613627143"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Jun 2022 04:00:31 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxRWB-000Ahp-6a;
	Sat, 04 Jun 2022 11:00:31 +0000
Date: Sat, 4 Jun 2022 19:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:jiri_devel_lc_dev 7/10]
 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:117:8: warning:
 variable 'flash_owner' is uninitialized when used here
Message-ID: <202206041845.0gXUtHQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_lc_dev
head:   e2de0017d7e8979fd196f786987bbb81a0ed3e9d
commit: a07ffbd025d76f046793282969a77fc55173b5e1 [7/10] mlxsw: core_linecards: Probe provisioned line cards for devices and expose FW version
config: arm64-buildonly-randconfig-r006-20220531 (https://download.01.org/0day-ci/archive/20220604/202206041845.0gXUtHQ7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/jpirko/linux_mlxsw/commit/a07ffbd025d76f046793282969a77fc55173b5e1
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_lc_dev
        git checkout a07ffbd025d76f046793282969a77fc55173b5e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:117:8: warning: variable 'flash_owner' is uninitialized when used here [-Wuninitialized]
                   if (!flash_owner) /* We care only about flashable ones. */
                        ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:99:19: note: initialize the variable 'flash_owner' to silence this warning
                   bool flash_owner;
                                   ^
                                    = 0
   1 warning generated.


vim +/flash_owner +117 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

    89	
    90	static int mlxsw_linecard_device_info_update(struct mlxsw_linecard *linecard)
    91	{
    92		struct mlxsw_core *mlxsw_core = linecard->linecards->mlxsw_core;
    93		bool flashable_found = false;
    94		u8 msg_seq = 0;
    95	
    96		do {
    97			struct mlxsw_linecard_device_info info;
    98			char mddq_pl[MLXSW_REG_MDDQ_LEN];
    99			bool flash_owner;
   100			bool data_valid;
   101			u8 device_index;
   102			int err;
   103	
   104			mlxsw_reg_mddq_device_info_pack(mddq_pl, linecard->slot_index,
   105							msg_seq);
   106			err = mlxsw_reg_query(mlxsw_core, MLXSW_REG(mddq), mddq_pl);
   107			if (err)
   108				return err;
   109			mlxsw_reg_mddq_device_info_unpack(mddq_pl, &msg_seq,
   110							  &data_valid, NULL,
   111							  &device_index,
   112							  &info.fw_major,
   113							  &info.fw_minor,
   114							  &info.fw_sub_minor);
   115			if (!data_valid)
   116				break;
 > 117			if (!flash_owner) /* We care only about flashable ones. */
   118				continue;
   119			if (flashable_found) {
   120				dev_warn_once(linecard->linecards->bus_info->dev, "linecard %u: More flashable devices present, exposing only the first one\n",
   121					      linecard->slot_index);
   122				return 0;
   123			}
   124			linecard->device.info = info;
   125			flashable_found = true;
   126		} while (msg_seq);
   127	
   128		return 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
