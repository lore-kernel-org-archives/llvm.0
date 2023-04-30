Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FEE2F26;
	Sun, 30 Apr 2023 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682886706; x=1714422706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ALMugpowdnaYvzwePwc14gwC7oEX04tbGrdkKSZhI44=;
  b=SSoMmVbEqYNjKbVpsRB156bztzCqfvZP2pbP3ZeedomMygu6hVQSNkOV
   CKtnWd8Xl53StW6O97p38no9Vr9lsjSVRmJ5uOgrIOJNp8zPiJRibMcog
   +RfnkdfGhAHaEjB6Z0j8uRTsOSONCn0qaLym3vDxgBT0kTAcbiiCE6Djz
   iWSzDdaS9TYbX4+SMgWuvccyqQA0YbV/RdGGhupXdayuYZheava8h+BYU
   L2Vxe9NV+pTZgXsc8yyj+FqR5q++Fqx2/m6KwqCB0ySPN2tuTibPxwOef
   HuF0V0wpp77IGyLH1o/WAKzqnVYAoDlTxOCmRVzX4VlJ+cO0vKXF4mdMn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="337166816"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="337166816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 13:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="726140965"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="726140965"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2023 13:31:45 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptDhw-00007L-0w;
	Sun, 30 Apr 2023 20:31:44 +0000
Date: Mon, 1 May 2023 04:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 7/8] sched: drop for_each_numa_hop_mask()
Message-ID: <202305010435.uWmPKEnD-lkp@intel.com>
References: <20230430171809.124686-8-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430171809.124686-8-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on v6.3]
[cannot apply to horms-ipvs/master net/main net-next/main linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/sched-fix-sched_numa_find_nth_cpu-in-non-NUMA-case/20230501-012204
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230430171809.124686-8-yury.norov%40gmail.com
patch subject: [PATCH v3 7/8] sched: drop for_each_numa_hop_mask()
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230501/202305010435.uWmPKEnD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a5818e63fc53a7f0cfeb65622ddad6cbe1d41929
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yury-Norov/sched-fix-sched_numa_find_nth_cpu-in-non-NUMA-case/20230501-012204
        git checkout a5818e63fc53a7f0cfeb65622ddad6cbe1d41929
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010435.uWmPKEnD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_base.c:664:23: error: no member named 'numa_node' in 'struct device'
           int numa_node = dev->numa_node;
                           ~~~  ^
>> drivers/net/ethernet/intel/ice/ice_base.c:681:2: error: implicit declaration of function 'for_each_numa_hop_mask' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           for_each_numa_hop_mask(aff_mask, numa_node) {
           ^
>> drivers/net/ethernet/intel/ice/ice_base.c:681:45: error: expected ';' after expression
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
2795b87092e057 Pawel Chmielewski      2023-02-16  662  	cpumask_t *aff_mask, *last_aff_mask = cpu_none_mask;
3306f79f428e85 Anirudh Venkataramanan 2020-02-06  663  	struct device *dev = ice_pf_to_dev(vsi->back);
2795b87092e057 Pawel Chmielewski      2023-02-16 @664  	int numa_node = dev->numa_node;
2795b87092e057 Pawel Chmielewski      2023-02-16  665  	u16 v_idx, cpu = 0;
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
2795b87092e057 Pawel Chmielewski      2023-02-16  679  	v_idx = 0;
2795b87092e057 Pawel Chmielewski      2023-02-16  680  
2795b87092e057 Pawel Chmielewski      2023-02-16 @681  	for_each_numa_hop_mask(aff_mask, numa_node) {
2795b87092e057 Pawel Chmielewski      2023-02-16  682  		for_each_cpu_andnot(cpu, aff_mask, last_aff_mask) {
2795b87092e057 Pawel Chmielewski      2023-02-16  683  			if (v_idx >= vsi->num_q_vectors)
2795b87092e057 Pawel Chmielewski      2023-02-16  684  				goto out;
2795b87092e057 Pawel Chmielewski      2023-02-16  685  
2795b87092e057 Pawel Chmielewski      2023-02-16  686  			if (cpu_online(cpu)) {
2795b87092e057 Pawel Chmielewski      2023-02-16  687  				cpumask_set_cpu(cpu, &vsi->q_vectors[v_idx]->affinity_mask);
2795b87092e057 Pawel Chmielewski      2023-02-16  688  				v_idx++;
2795b87092e057 Pawel Chmielewski      2023-02-16  689  			}
2795b87092e057 Pawel Chmielewski      2023-02-16  690  		}
2795b87092e057 Pawel Chmielewski      2023-02-16  691  
2795b87092e057 Pawel Chmielewski      2023-02-16  692  		last_aff_mask = aff_mask;
2795b87092e057 Pawel Chmielewski      2023-02-16  693  	}
2795b87092e057 Pawel Chmielewski      2023-02-16  694  
2795b87092e057 Pawel Chmielewski      2023-02-16  695  out:
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
