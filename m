Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857423A6;
	Fri, 21 Apr 2023 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682066357; x=1713602357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9/knMt+c3keBzuLKPxKBx2CH2yF5uGa3zZp5CZhQcos=;
  b=WzuKd0YxUmM1dvJSiteodb51inQ5TXy+C0mvEFwygQpHCAZSBgoKUuCP
   A1Zz5TLIbnXMbFQmMs8i57ymNAT86QCtfyrWsnxq4avwES0dUEH4DmhGd
   d7mH9H9p8XEeOhp7qKI6LC80IZgPKaAkGeL42DJDicl4gjm0Ps1bdcMza
   Mso4cixDWWuOHSYJ+Qc0G9WJidphEKPb1DKryrBw7ZgjGaHeUP1DyR8pQ
   Z3t6vsaITGycnpDsTvtvdAmGbcoZv3//+GdEJQvblw66Ywf+dQeRg3x59
   gNlML8SrdF70G0ZCtK2pcW6Imr3kISfXxs01REPhMaOJcl/ym0ojrT/aP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325547479"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325547479"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 01:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021851058"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="1021851058"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 01:39:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppmIO-000gSi-1n;
	Fri, 21 Apr 2023 08:39:08 +0000
Date: Fri, 21 Apr 2023 16:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] sched: drop for_each_numa_hop_mask()
Message-ID: <202304211610.1Xprvad2-lkp@intel.com>
References: <20230420051946.7463-9-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420051946.7463-9-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to tip/sched/core horms-ipvs/master net-next/main next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/lib-find-add-find_next_and_andnot_bit/20230420-132247
patch link:    https://lore.kernel.org/r/20230420051946.7463-9-yury.norov%40gmail.com
patch subject: [PATCH v2 8/8] sched: drop for_each_numa_hop_mask()
config: powerpc-randconfig-r016-20230417 (https://download.01.org/0day-ci/archive/20230421/202304211610.1Xprvad2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2425882bb68586aad08582c2efbb860a78e1b8e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yury-Norov/lib-find-add-find_next_and_andnot_bit/20230420-132247
        git checkout 2425882bb68586aad08582c2efbb860a78e1b8e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211610.1Xprvad2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_base.c:664:23: error: no member named 'numa_node' in 'struct device'
           int numa_node = dev->numa_node;
                           ~~~  ^
>> drivers/net/ethernet/intel/ice/ice_base.c:681:2: error: call to undeclared function 'for_each_numa_hop_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           for_each_numa_hop_mask(aff_mask, numa_node) {
           ^
   drivers/net/ethernet/intel/ice/ice_base.c:681:45: error: expected ';' after expression
           for_each_numa_hop_mask(aff_mask, numa_node) {
                                                      ^
                                                      ;
   3 errors generated.


vim +/for_each_numa_hop_mask +681 drivers/net/ethernet/intel/ice/ice_base.c

eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  652  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  653  /**
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  654   * ice_vsi_alloc_q_vectors - Allocate memory for interrupt vectors
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  655   * @vsi: the VSI being configured
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  656   *
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  657   * We allocate one q_vector per queue interrupt. If allocation fails we
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  658   * return -ENOMEM.
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  659   */
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  660  int ice_vsi_alloc_q_vectors(struct ice_vsi *vsi)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  661  {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  662  	cpumask_t *aff_mask, *last_aff_mask = cpu_none_mask;
3306f79f428e85 Anirudh Venkataramanan 2020-02-06  663  	struct device *dev = ice_pf_to_dev(vsi->back);
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  664  	int numa_node = dev->numa_node;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  665  	u16 v_idx, cpu = 0;
88865fc4bbd61e Karol Kolacinski       2020-05-07  666  	int err;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  667  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  668  	if (vsi->q_vectors[0]) {
4015d11e4b9720 Brett Creeley          2019-11-08  669  		dev_dbg(dev, "VSI %d has existing q_vectors\n", vsi->vsi_num);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  670  		return -EEXIST;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  671  	}
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  672  
3306f79f428e85 Anirudh Venkataramanan 2020-02-06  673  	for (v_idx = 0; v_idx < vsi->num_q_vectors; v_idx++) {
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  674  		err = ice_vsi_alloc_q_vector(vsi, v_idx);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  675  		if (err)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  676  			goto err_out;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  677  	}
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  678  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  679  	v_idx = 0;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  680  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16 @681  	for_each_numa_hop_mask(aff_mask, numa_node) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  682  		for_each_cpu_andnot(cpu, aff_mask, last_aff_mask) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  683  			if (v_idx >= vsi->num_q_vectors)
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  684  				goto out;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  685  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  686  			if (cpu_online(cpu)) {
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  687  				cpumask_set_cpu(cpu, &vsi->q_vectors[v_idx]->affinity_mask);
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  688  				v_idx++;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  689  			}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  690  		}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  691  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  692  		last_aff_mask = aff_mask;
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  693  	}
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  694  
5dfb0e8f9fff34 Pawel Chmielewski      2023-02-16  695  out:
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  696  	return 0;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  697  
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  698  err_out:
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  699  	while (v_idx--)
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  700  		ice_free_q_vector(vsi, v_idx);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  701  
4015d11e4b9720 Brett Creeley          2019-11-08  702  	dev_err(dev, "Failed to allocate %d q_vector for VSI %d, ret=%d\n",
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  703  		vsi->num_q_vectors, vsi->vsi_num, err);
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  704  	vsi->num_q_vectors = 0;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  705  	return err;
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  706  }
eff380aaffedb2 Anirudh Venkataramanan 2019-10-24  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
