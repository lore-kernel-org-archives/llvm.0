Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418FB168
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 00:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639441388; x=1670977388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvjaaEJztaz2NKrU4E2NnRtD5QTLRaK2cd8iT/cBFAk=;
  b=L4QuBEkGWkxdEjz+PoZC+bg+r/39OJqAlOwc3WY6w2T47Fm+9VEnYBvj
   T3o91ahIVXzUnEWtW+XehaZxCTTMYI00SXQMKeLruWGD16apq1cIIBYB8
   V7BkuAYsVHzo5ll/B2FhjH8CPgZLU6HUY6+h6HQ3eMwFLxbK9rirJj+9B
   Hc9KbDryjPtk+AFsivnkOHzm8x844MNE0PxhC6lh3UxJZFvv98W1SXHlw
   jCbDpTBw+hpTfZXofiZKvGVOexyWMLLsxA3JlnTK7Qr1M8de7VC3tfnB6
   skqWBaAS/ye2oGruind8KtcsqNNb9u1KecZCpU8DUV9D0+lrOAq2iKJ6L
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219544932"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="219544932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 16:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="566889520"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2021 16:23:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwvau-0007F6-Ak; Tue, 14 Dec 2021 00:23:00 +0000
Date: Tue, 14 Dec 2021 08:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:linecards 55/109]
 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:366:26: warning:
 variable 'linecards' set but not used
Message-ID: <202112140859.ZE3HQNoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/jpirko/linux_mlxsw linecards
head:   2399de99a931630e05915fbcb4f84ca21a8e000a
commit: 8693f5ee04deacc07510585fee350a2e30f7d4fc [55/109] mlxsw: core_linecards: Add line card objects and implement provisioning
config: i386-randconfig-a001-20211213 (https://download.01.org/0day-ci/archive/20211214/202112140859.ZE3HQNoo-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/8693f5ee04deacc07510585fee350a2e30f7d4fc
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw linecards
        git checkout 8693f5ee04deacc07510585fee350a2e30f7d4fc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:366:26: warning: variable 'linecards' set but not used [-Wunused-but-set-variable]
           struct mlxsw_linecards *linecards;
                                   ^
   1 warning generated.


vim +/linecards +366 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

   359	
   360	static int mlxsw_linecard_unprovision(struct devlink_linecard *devlink_linecard,
   361					      void *priv,
   362					      struct netlink_ext_ack *extack)
   363	{
   364		enum mlxsw_reg_mbct_fsm_state fsm_state;
   365		struct mlxsw_linecard *linecard = priv;
 > 366		struct mlxsw_linecards *linecards;
   367		enum mlxsw_reg_mbct_status status;
   368		unsigned int ini_wait_retries = 0;
   369		struct mlxsw_core *mlxsw_core;
   370		int err;
   371	
   372		mutex_lock(&linecard->lock);
   373	
   374		linecards = linecard->linecards;
   375		mlxsw_core = linecard->linecards->mlxsw_core;
   376	
   377	query_ini_status:
   378		err = mlxsw_linecard_query_status(linecard, &status,
   379						  &fsm_state, extack);
   380		if (err)
   381			goto err_out;
   382	
   383		switch (fsm_state) {
   384		case MLXSW_REG_MBCT_FSM_STATE_INI_IN_USE:
   385			if (ini_wait_retries++ > MLXSW_LINECARD_INI_WAIT_RETRIES) {
   386				NL_SET_ERR_MSG_MOD(extack, "Failed to wait for linecard INI to be not used");
   387				goto err_out;
   388			}
   389			mdelay(MLXSW_LINECARD_INI_WAIT_MS);
   390			goto query_ini_status;
   391		default:
   392			break;
   393		}
   394	
   395		mlxsw_reg_mbct_pack(linecard->mbct_pl, linecard->slot_index,
   396				    MLXSW_REG_MBCT_OP_ERASE_INI_IMAGE, 0,
   397				    false, false, NULL);
   398		err = mlxsw_reg_write(mlxsw_core, MLXSW_REG(mbct),
   399				      linecard->mbct_pl);
   400		if (err) {
   401			NL_SET_ERR_MSG_MOD(extack, "Failed to erase linecard INI");
   402			goto err_out;
   403		}
   404		mlxsw_reg_mbct_unpack(linecard->mbct_pl, NULL, &status, &fsm_state);
   405		switch (status) {
   406		case MLXSW_REG_MBCT_STATUS_ERASE_COMPLETE:
   407			break;
   408		default:
   409			/* Should not happen */
   410			fallthrough;
   411		case MLXSW_REG_MBCT_STATUS_ERASE_FAILED:
   412			NL_SET_ERR_MSG_MOD(extack, "Failed to erase linecard INI");
   413			goto fix_fsm_err_out;
   414		case MLXSW_REG_MBCT_STATUS_ERROR_INI_IN_USE:
   415			NL_SET_ERR_MSG_MOD(extack, "Failed to erase linecard INI while being used");
   416			goto fix_fsm_err_out;
   417		}
   418		goto out;
   419	
   420	fix_fsm_err_out:
   421		mlxsw_linecard_fix_fsm_state(linecard, fsm_state);
   422	err_out:
   423		mlxsw_linecard_provision_fail(linecard);
   424	out:
   425		mutex_unlock(&linecard->lock);
   426		return err;
   427	}
   428	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
