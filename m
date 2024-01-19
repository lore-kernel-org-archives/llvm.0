Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15023C68C;
	Fri, 19 Jan 2024 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705663561; cv=none; b=JTSVCORF611Ai5+wW43n24O7PNyUy0Bq6QbVvi72G3qKvEHzXsV0j01nOJf/RQ0gf/vCDvUN42dKd2aUwx8vFSWMU1QN6LHcILIG/vKUEVaI7qPHvVxSj+wH4Nijet0bujIdBcVQHd5Wy7ODnHaN8qdneR6Ryo/y4ix5eZh4dY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705663561; c=relaxed/simple;
	bh=qxa0v1Z+GoSIgdTC7uAWF31npr3n1rFTpBeHsVxzqtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTJ7pd5Mel5oZBvTC4XKyLlOVgyEOrG8Yj8HTpMSKKzkxUyhfTjWDWALhUQN3wbRnWxZSq3LLC/FF6oKuvCm5SFJLHxqgK9SAPVIUU/5h4tgXesDs87O7WtMZbsW0v30vztCrcqs/zYSBRHvP+AmQMlQI0zoF+GBX5C9C2jE1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/Haa7jX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/Haa7jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705663559; x=1737199559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxa0v1Z+GoSIgdTC7uAWF31npr3n1rFTpBeHsVxzqtc=;
  b=g/Haa7jXmxnF/hdrTMzgEvwzGFa7zMcLm6U59wFP8RTv3ovV3s+ajhKu
   gsuc6SEuvTW+dVBBkjtvqncBZZGegTsIxSAYHoLdlSXBnywsXGaDg5D+W
   2/cLDZ6J7c4ugtyKoZjbkaheb7Nx5Zmurf+Lu1EZYU2YuhZzSSG6CO5Nn
   OCzWTWEgWa6fdbbQZYJSPbJTozHtR7HJ6AFxfZOnHc4BAvTpzXqkCUO4x
   X0PhPiZ55z4zsJqnwi23VAGvY/CRjRaVu34sQXpRFtm6CQaChOUiDpGVi
   5FqnPOi/Hw1qLTfo2s5KymUeY8iOwwUc9LaVKuCWZuz9ooTHi0Yp355sm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7425528"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7425528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 03:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="27026604"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2024 03:25:57 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQn0U-0003xk-2C;
	Fri, 19 Jan 2024 11:25:54 +0000
Date: Fri, 19 Jan 2024 19:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/22 1/2]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:565:1: warning: unused label
 'xsk_pool_if_up'
Message-ID: <202401191938.aPZsOozB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/22
head:   5b85f55897260cca2ecea3bb5f11555a5cc5f3ea
commit: c1d37109c5b20998384649a68f7e461fd59613d9 [1/2] Fix AF_XDP Tx & Rx for multi XSk instances
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240119/202401191938.aPZsOozB-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191938.aPZsOozB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191938.aPZsOozB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:565:1: warning: unused label 'xsk_pool_if_up' [-Wunused-label]
     565 | xsk_pool_if_up:
         | ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/xsk_pool_if_up +565 drivers/net/ethernet/intel/idpf/idpf_xsk.c

4550e7f47e2e0f3 Michal Kubiak 2023-11-27  520  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  521  /**
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  522   * idpf_xsk_pool_setup - enable/disable a BUFF POOL region
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  523   * @vport: current vport of interest
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  524   * @pool: pointer to a requested BUFF POOL region
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  525   * @qid: queue id
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  526   *
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  527   * Returns 0 on success, negative on failure
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  528   */
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  529  int idpf_xsk_pool_setup(struct idpf_vport *vport, struct xsk_buff_pool *pool,
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  530  			u32 qid)
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  531  {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  532  	bool if_running, pool_present = !!pool;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  533  	int err = 0, pool_failure = 0, num_qs;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  534  	struct idpf_q_vector *q_vector;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  535  	struct idpf_queue *rxq, **qs;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  536  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  537  	if_running = netif_running(vport->netdev) &&
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  538  		     idpf_xdp_is_prog_ena(vport);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  539  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  540  	if (if_running) {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  541  		rxq = idpf_find_rxq(vport, qid);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  542  		q_vector = rxq->q_vector;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  543  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  544  		qs = idpf_create_queue_list(vport, qid, &num_qs);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  545  		if (!qs) {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  546  			err = -ENOMEM;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  547  			goto xsk_exit;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  548  		}
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  549  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  550  		err = idpf_qp_dis(vport, q_vector, qs, num_qs, qid);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  551  		if (err) {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  552  			netdev_err(vport->netdev, "Cannot disable queues for XSK setup, error = %d\n",
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  553  				   err);
c1d37109c5b2099 Michal Kubiak 2024-01-10  554  			//goto xsk_pool_if_up;
c1d37109c5b2099 Michal Kubiak 2024-01-10  555  			//TODO: Fix FW!!!!
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  556  		}
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  557  	}
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  558  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  559  	pool_failure = pool_present ? idpf_xsk_pool_enable(vport, qid) :
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  560  				      idpf_xsk_pool_disable(vport, qid);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  561  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  562  	if (!idpf_xdp_is_prog_ena(vport))
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  563  		netdev_warn(vport->netdev, "RSS may schedule pkts to q occupied by AF XDP\n");
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  564  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27 @565  xsk_pool_if_up:
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  566  	if (if_running) {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  567  		err = idpf_qp_ena(vport, q_vector, qs, num_qs, qid);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  568  		if (!err && pool_present)
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  569  			napi_schedule(&rxq->q_vector->napi);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  570  		else if (err)
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  571  			netdev_err(vport->netdev,
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  572  				   "Could not enable queues after XSK setup, error = %d\n",
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  573  				   err);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  574  		kfree(qs);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  575  	}
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  576  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  577  	if (pool_failure) {
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  578  		netdev_err(vport->netdev, "Could not %sable BUFF POOL, error = %d\n",
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  579  			   pool_present ? "en" : "dis", pool_failure);
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  580  		err = pool_failure;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  581  	}
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  582  
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  583  xsk_exit:
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  584  	return err;
4550e7f47e2e0f3 Michal Kubiak 2023-11-27  585  }
cf0706903cff863 Michal Kubiak 2023-12-07  586  

:::::: The code at line 565 was first introduced by commit
:::::: 4550e7f47e2e0f3e1beff777eec679467092567d idpf: add XSk pool initialization

:::::: TO: Michal Kubiak <michal.kubiak@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
