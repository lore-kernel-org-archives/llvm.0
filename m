Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D658622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662689084; x=1694225084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmMEgv8Mus6S0QL8DMJjiRYOlIDwGAimk3Z5qLBTc7A=;
  b=Eft+g1eBkrs+7XkTTRSzPMAkGgfK5CsRQdMrjDSeC/EdkqdlWLaeXLac
   wGDq9NKKbkMcBm2R19XZj77tRQsBO6OdTvh4ZJh6JJf0YULwxw0IUBNwu
   bTav8mnhZWFa7VnabD9FoOPhWbM1m/VvIfaC4gBIup/Xuaw7reDKzWnWD
   NXwDlvvEwjMm58C0Hi+zs7+udZkTNExYyAa3arpzTl1KgADL3nZ9nDMC8
   8GOyyUNt95LMslxsHYYpJdNLpAvfLYtJYvIca+7LmbfzwZiTIagdi/eAz
   eFyXbFYzAiJaA23DS6ovTk8Yflqfdju8BjzGiR/1bFn/oAukPa04Os387
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359100796"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="359100796"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 19:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="943598837"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 19:04:41 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWTNp-0000Zx-0S;
	Fri, 09 Sep 2022 02:04:41 +0000
Date: Fri, 9 Sep 2022 10:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lior Nahmanson <liorna@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Raed Salem <raeds@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>
Subject: [linux-next:master 5241/6188]
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:539:6: warning:
 variable 'macsec_rule' is used uninitialized whenever 'if' condition is true
Message-ID: <202209090936.AOqYoiII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47c191411b68a771261be3dc0bd6f68394cef358
commit: 3b20949cb21bac26d50cdcc58896802a890cfe15 [5241/6188] net/mlx5e: Add MACsec RX steering rules
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220909/202209090936.AOqYoiII-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3b20949cb21bac26d50cdcc58896802a890cfe15
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3b20949cb21bac26d50cdcc58896802a890cfe15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:539:6: warning: variable 'macsec_rule' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (err)
               ^~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:598:9: note: uninitialized use occurs here
           return macsec_rule;
                  ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:539:2: note: remove the 'if' if its condition is always false
           if (err)
           ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:523:38: note: initialize the variable 'macsec_rule' to silence this warning
           union mlx5e_macsec_rule *macsec_rule;
                                               ^
                                                = NULL
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1131:6: warning: variable 'macsec_rule' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (err)
               ^~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1215:9: note: uninitialized use occurs here
           return macsec_rule;
                  ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1131:2: note: remove the 'if' if its condition is always false
           if (err)
           ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c:1118:38: note: initialize the variable 'macsec_rule' to silence this warning
           union mlx5e_macsec_rule *macsec_rule;
                                               ^
                                                = NULL
   2 warnings generated.


vim +539 drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec_fs.c

e467b283ffd50c Lior Nahmanson 2022-09-05  510  
3b20949cb21bac Lior Nahmanson 2022-09-05  511  static union mlx5e_macsec_rule *
e467b283ffd50c Lior Nahmanson 2022-09-05  512  macsec_fs_tx_add_rule(struct mlx5e_macsec_fs *macsec_fs,
e467b283ffd50c Lior Nahmanson 2022-09-05  513  		      const struct macsec_context *macsec_ctx,
9515978eee0b93 Lior Nahmanson 2022-09-05  514  		      struct mlx5_macsec_rule_attrs *attrs,
9515978eee0b93 Lior Nahmanson 2022-09-05  515  		      u32 *sa_fs_id)
e467b283ffd50c Lior Nahmanson 2022-09-05  516  {
e467b283ffd50c Lior Nahmanson 2022-09-05  517  	char reformatbf[MLX5_MACSEC_TAG_LEN + MACSEC_SCI_LEN];
e467b283ffd50c Lior Nahmanson 2022-09-05  518  	struct mlx5_pkt_reformat_params reformat_params = {};
e467b283ffd50c Lior Nahmanson 2022-09-05  519  	struct mlx5e_macsec_tx *tx_fs = macsec_fs->tx_fs;
e467b283ffd50c Lior Nahmanson 2022-09-05  520  	struct net_device *netdev = macsec_fs->netdev;
e467b283ffd50c Lior Nahmanson 2022-09-05  521  	struct mlx5_flow_destination dest = {};
3b20949cb21bac Lior Nahmanson 2022-09-05  522  	struct mlx5e_macsec_tables *tx_tables;
3b20949cb21bac Lior Nahmanson 2022-09-05  523  	union mlx5e_macsec_rule *macsec_rule;
e467b283ffd50c Lior Nahmanson 2022-09-05  524  	struct mlx5e_macsec_tx_rule *tx_rule;
e467b283ffd50c Lior Nahmanson 2022-09-05  525  	struct mlx5_flow_act flow_act = {};
e467b283ffd50c Lior Nahmanson 2022-09-05  526  	struct mlx5_flow_handle *rule;
e467b283ffd50c Lior Nahmanson 2022-09-05  527  	struct mlx5_flow_spec *spec;
e467b283ffd50c Lior Nahmanson 2022-09-05  528  	size_t reformat_size;
e467b283ffd50c Lior Nahmanson 2022-09-05  529  	int err = 0;
e467b283ffd50c Lior Nahmanson 2022-09-05  530  	u32 fs_id;
e467b283ffd50c Lior Nahmanson 2022-09-05  531  
3b20949cb21bac Lior Nahmanson 2022-09-05  532  	tx_tables = &tx_fs->tables;
3b20949cb21bac Lior Nahmanson 2022-09-05  533  
e467b283ffd50c Lior Nahmanson 2022-09-05  534  	spec = kvzalloc(sizeof(*spec), GFP_KERNEL);
e467b283ffd50c Lior Nahmanson 2022-09-05  535  	if (!spec)
e467b283ffd50c Lior Nahmanson 2022-09-05  536  		return NULL;
e467b283ffd50c Lior Nahmanson 2022-09-05  537  
e467b283ffd50c Lior Nahmanson 2022-09-05  538  	err = macsec_fs_tx_ft_get(macsec_fs);
e467b283ffd50c Lior Nahmanson 2022-09-05 @539  	if (err)
e467b283ffd50c Lior Nahmanson 2022-09-05  540  		goto out_spec;
e467b283ffd50c Lior Nahmanson 2022-09-05  541  
3b20949cb21bac Lior Nahmanson 2022-09-05  542  	macsec_rule = kzalloc(sizeof(*macsec_rule), GFP_KERNEL);
3b20949cb21bac Lior Nahmanson 2022-09-05  543  	if (!macsec_rule) {
e467b283ffd50c Lior Nahmanson 2022-09-05  544  		macsec_fs_tx_ft_put(macsec_fs);
e467b283ffd50c Lior Nahmanson 2022-09-05  545  		goto out_spec;
e467b283ffd50c Lior Nahmanson 2022-09-05  546  	}
e467b283ffd50c Lior Nahmanson 2022-09-05  547  
3b20949cb21bac Lior Nahmanson 2022-09-05  548  	tx_rule = &macsec_rule->tx_rule;
3b20949cb21bac Lior Nahmanson 2022-09-05  549  
e467b283ffd50c Lior Nahmanson 2022-09-05  550  	/* Tx crypto table crypto rule */
e467b283ffd50c Lior Nahmanson 2022-09-05  551  	macsec_fs_tx_create_sectag_header(macsec_ctx, reformatbf, &reformat_size);
e467b283ffd50c Lior Nahmanson 2022-09-05  552  
e467b283ffd50c Lior Nahmanson 2022-09-05  553  	reformat_params.type = MLX5_REFORMAT_TYPE_ADD_MACSEC;
e467b283ffd50c Lior Nahmanson 2022-09-05  554  	reformat_params.size = reformat_size;
e467b283ffd50c Lior Nahmanson 2022-09-05  555  	reformat_params.data = reformatbf;
e467b283ffd50c Lior Nahmanson 2022-09-05  556  	flow_act.pkt_reformat = mlx5_packet_reformat_alloc(macsec_fs->mdev,
e467b283ffd50c Lior Nahmanson 2022-09-05  557  							   &reformat_params,
e467b283ffd50c Lior Nahmanson 2022-09-05  558  							   MLX5_FLOW_NAMESPACE_EGRESS_MACSEC);
e467b283ffd50c Lior Nahmanson 2022-09-05  559  	if (IS_ERR(flow_act.pkt_reformat)) {
e467b283ffd50c Lior Nahmanson 2022-09-05  560  		err = PTR_ERR(flow_act.pkt_reformat);
e467b283ffd50c Lior Nahmanson 2022-09-05  561  		netdev_err(netdev, "Failed to allocate MACsec Tx reformat context err=%d\n",  err);
e467b283ffd50c Lior Nahmanson 2022-09-05  562  		goto err;
e467b283ffd50c Lior Nahmanson 2022-09-05  563  	}
e467b283ffd50c Lior Nahmanson 2022-09-05  564  	tx_rule->pkt_reformat = flow_act.pkt_reformat;
e467b283ffd50c Lior Nahmanson 2022-09-05  565  
e467b283ffd50c Lior Nahmanson 2022-09-05  566  	err = macsec_fs_tx_setup_fte(macsec_fs, spec, &flow_act, attrs->macsec_obj_id, &fs_id);
e467b283ffd50c Lior Nahmanson 2022-09-05  567  	if (err) {
e467b283ffd50c Lior Nahmanson 2022-09-05  568  		netdev_err(netdev,
e467b283ffd50c Lior Nahmanson 2022-09-05  569  			   "Failed to add packet reformat for MACsec TX crypto rule, err=%d\n",
e467b283ffd50c Lior Nahmanson 2022-09-05  570  			   err);
e467b283ffd50c Lior Nahmanson 2022-09-05  571  		goto err;
e467b283ffd50c Lior Nahmanson 2022-09-05  572  	}
e467b283ffd50c Lior Nahmanson 2022-09-05  573  
e467b283ffd50c Lior Nahmanson 2022-09-05  574  	tx_rule->fs_id = fs_id;
9515978eee0b93 Lior Nahmanson 2022-09-05  575  	*sa_fs_id = fs_id;
e467b283ffd50c Lior Nahmanson 2022-09-05  576  
e467b283ffd50c Lior Nahmanson 2022-09-05  577  	flow_act.action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST |
e467b283ffd50c Lior Nahmanson 2022-09-05  578  			  MLX5_FLOW_CONTEXT_ACTION_CRYPTO_ENCRYPT |
e467b283ffd50c Lior Nahmanson 2022-09-05  579  			  MLX5_FLOW_CONTEXT_ACTION_PACKET_REFORMAT;
e467b283ffd50c Lior Nahmanson 2022-09-05  580  	dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
3b20949cb21bac Lior Nahmanson 2022-09-05  581  	dest.ft = tx_tables->ft_check;
3b20949cb21bac Lior Nahmanson 2022-09-05  582  	rule = mlx5_add_flow_rules(tx_tables->ft_crypto.t, spec, &flow_act, &dest, 1);
e467b283ffd50c Lior Nahmanson 2022-09-05  583  	if (IS_ERR(rule)) {
e467b283ffd50c Lior Nahmanson 2022-09-05  584  		err = PTR_ERR(rule);
e467b283ffd50c Lior Nahmanson 2022-09-05  585  		netdev_err(netdev, "Failed to add MACsec TX crypto rule, err=%d\n", err);
e467b283ffd50c Lior Nahmanson 2022-09-05  586  		goto err;
e467b283ffd50c Lior Nahmanson 2022-09-05  587  	}
e467b283ffd50c Lior Nahmanson 2022-09-05  588  	tx_rule->rule = rule;
e467b283ffd50c Lior Nahmanson 2022-09-05  589  
e467b283ffd50c Lior Nahmanson 2022-09-05  590  	goto out_spec;
e467b283ffd50c Lior Nahmanson 2022-09-05  591  
e467b283ffd50c Lior Nahmanson 2022-09-05  592  err:
e467b283ffd50c Lior Nahmanson 2022-09-05  593  	macsec_fs_tx_del_rule(macsec_fs, tx_rule);
3b20949cb21bac Lior Nahmanson 2022-09-05  594  	macsec_rule = NULL;
e467b283ffd50c Lior Nahmanson 2022-09-05  595  out_spec:
e467b283ffd50c Lior Nahmanson 2022-09-05  596  	kvfree(spec);
e467b283ffd50c Lior Nahmanson 2022-09-05  597  
3b20949cb21bac Lior Nahmanson 2022-09-05  598  	return macsec_rule;
e467b283ffd50c Lior Nahmanson 2022-09-05  599  }
e467b283ffd50c Lior Nahmanson 2022-09-05  600  

:::::: The code at line 539 was first introduced by commit
:::::: e467b283ffd50cf15b84c73eef68787e257eaed5 net/mlx5e: Add MACsec TX steering rules

:::::: TO: Lior Nahmanson <liorna@nvidia.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
