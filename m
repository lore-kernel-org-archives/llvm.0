Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357B4353
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645140849; x=1676676849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRKiPX3hDotMG4QNJzX8Q8QFFFUAgodi9q4LNypUsiY=;
  b=jjusBa1V7JIjpfoVt7t6IOrVrD5m2YbLh7U5DQxz0pAmbDaJlkPkEVSm
   DDgPziXsjKOjhgj34jpGj17wbs86t330NrbRzfSg0IzgRjh6Dgbx5s3kS
   zsBjfvSDaZ7S9PP5fKYq7B98oSXIY288QWaEqtMIIVQkBkeB5u9Or9ZB6
   sKlCjBSbPmB4jylqxYb/+ZEH9ekkMjn/jkula7rsE6vv7BQwt96ZAGPpE
   M0qQU9CanC6tLbWoaDy/yNfT30FHMhIszcC25T10E4DiyqNy+ZwoJxRCQ
   kQVAHs+jmCESpZuCN1Hzqlvk1W00Wny5IbkDkfk3O3TewZn/7gzoDw6fs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250757848"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="250757848"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 15:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="637445350"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Feb 2022 15:34:06 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKqHm-0000jl-3z; Thu, 17 Feb 2022 23:34:06 +0000
Date: Fri, 18 Feb 2022 07:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Cohen <amcohen@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpirko-mlxsw:ubridge 29/50]
 drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c:458:12: warning: stack
 frame size (1092) exceeds limit (1024) in
 'mlxsw_sp_fid_erif_eport_to_vid_map'
Message-ID: <202202180705.ObvKcGBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/jpirko/linux_mlxsw ubridge
head:   a9a4f2bd50dde60a52d9dda03d38875255fe0b9c
commit: e6f8d1542cdc497206db6e9cd460cba6ca34e9a3 [29/50] mlxsw: spectrum_fid: Configure layer 3 egress VID classification
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220218/202202180705.ObvKcGBW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/e6f8d1542cdc497206db6e9cd460cba6ca34e9a3
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw ubridge
        git checkout e6f8d1542cdc497206db6e9cd460cba6ca34e9a3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlxsw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c:458:12: warning: stack frame size (1092) exceeds limit (1024) in 'mlxsw_sp_fid_erif_eport_to_vid_map' [-Wframe-larger-than]
   static int mlxsw_sp_fid_erif_eport_to_vid_map(struct mlxsw_sp_fid *fid,
              ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c:705:12: warning: stack frame size (1124) exceeds limit (1024) in '__mlxsw_sp_fid_port_vid_map' [-Wframe-larger-than]
   static int __mlxsw_sp_fid_port_vid_map(const struct mlxsw_sp_fid *fid,
              ^
   2 warnings generated.


vim +/mlxsw_sp_fid_erif_eport_to_vid_map +458 drivers/net/ethernet/mellanox/mlxsw/spectrum_fid.c

   457	
 > 458	static int mlxsw_sp_fid_erif_eport_to_vid_map(struct mlxsw_sp_fid *fid,
   459						      u16 rif_index, bool valid)
   460	{
   461		struct mlxsw_sp *mlxsw_sp = fid->fid_family->mlxsw_sp;
   462		struct mlxsw_sp_fid_port_vid *port_vid, *tmp;
   463		char reiv_pl[MLXSW_REG_REIV_LEN] = {};
   464		bool records_to_write = false;
   465		u8 rec_num, current_page = 0;
   466		u16 last_local_port;
   467		int err;
   468	
   469		mlxsw_reg_reiv_pack(reiv_pl, current_page, rif_index);
   470		last_local_port = current_page * MLXSW_REG_REIV_REC_MAX_COUNT +
   471				  MLXSW_REG_REIV_REC_MAX_COUNT - 1;
   472	
   473		list_for_each_entry_safe(port_vid, tmp, &fid->port_vid_list, list) {
   474			/* The list is sorted by local_port. */
   475			if (port_vid->local_port > last_local_port)
   476				goto reg_write;
   477	
   478	new_record_fill:
   479			rec_num = port_vid->local_port % MLXSW_REG_REIV_REC_MAX_COUNT;
   480			mlxsw_reg_reiv_rec_update_set(reiv_pl, rec_num, true);
   481			mlxsw_reg_reiv_rec_evid_set(reiv_pl, rec_num,
   482						    valid ? port_vid->vid : 0);
   483			records_to_write = true;
   484			goto next_list_node;
   485	
   486	reg_write:
   487		err = mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(reiv), reiv_pl);
   488		if (err)
   489			return err;
   490	
   491		records_to_write = false;
   492		current_page++;
   493		memset(reiv_pl, 0, MLXSW_REG_REIV_LEN);
   494		mlxsw_reg_reiv_pack(reiv_pl, current_page, rif_index);
   495		last_local_port = current_page * MLXSW_REG_REIV_REC_MAX_COUNT +
   496				  MLXSW_REG_REIV_REC_MAX_COUNT - 1;
   497		goto new_record_fill;
   498	
   499	next_list_node:
   500			continue;
   501		}
   502	
   503		if (records_to_write)
   504			return mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(reiv),
   505					       reiv_pl);
   506		return 0;
   507	}
   508	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
