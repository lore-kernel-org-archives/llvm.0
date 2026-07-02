Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4422E54B6;
	Thu,  2 Jul 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024947; cv=none; b=Gmm8qee+AxXuAnjAWqz+56J94UrLa6ymoIQ3OtokTtcXacjGUoOBeNlwTLL6rZ0zBG4z8+gSo6DjtDXKm19RWSxFeDRkgvgxcWad6h7JMJOaNpL6vajLTbkPM33oWFFZmC76JGwBODOAe8xhI+vz/j10qRea0+zwly6YqWauJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024947; c=relaxed/simple;
	bh=tbFRVi3OKBbJC+j8OwNU8S46fF4eR/wN4nQtyNO05w4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kiiSyOX3D6tLrYQxeHBrruTH8v7i3IDs9n5qfjTPCb7kYpENm7PT4hZleTZ/UcwVwGtA/zqqphX7pvGuu5j/YAjES/vhpYKFGSZZ0un2zPScEsXhXm8GuTDXeGLXi1iC6mt8MXnBYWW+vk2lSUoYFUHbi1v7gfUG2Ydo1vtCO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh0t/+qk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh0t/+qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783024944; x=1814560944;
  h=date:from:to:cc:subject:message-id;
  bh=tbFRVi3OKBbJC+j8OwNU8S46fF4eR/wN4nQtyNO05w4=;
  b=Rh0t/+qk9tW8gq6EyEES5/eZ8+tXEc8gaXp8ZF9RtWLzaiKKZhMPHiW+
   Mvjf14czqOJLqvYyFQJH4bZVf1fxpiLHEQOmcO+Mgpf41DyGaDOqqAnKr
   oSgOI+mBmleQ82l1Hq4XO9pHJONRpWxUkQ+CI+878YDwGpd0RWZdFFFpE
   WbDqUvmy4WIgOf7vdF5Y+4K06pMguw/91qFvuX6tZt0y8/fDtex6yY3Pf
   xpCrTX5ADUHscpPIKkenYSSq1X8h4Rif/YSeA7wCtuqTBJDkT3R/lcDuB
   gQhQiwbyitak7aVFB9ATu2jnCpAk3F7bdE9TFnNo1hDlzGenCyznD8QGs
   Q==;
X-CSE-ConnectionGUID: w2v2CpIZRWKmIovzFr4p/Q==
X-CSE-MsgGUID: 8L5NomjqRAaHhN7UDuxEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101322974"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="101322974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 13:42:24 -0700
X-CSE-ConnectionGUID: /E94QiibQvCj/M2hzVhpZQ==
X-CSE-MsgGUID: VS0ULxHLQm+at73QgBkDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="249604766"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2026 13:42:21 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfOEl-000000001I1-295X;
	Thu, 02 Jul 2026 20:42:19 +0000
Date: Thu, 02 Jul 2026 22:41:40 +0200
From: kernel test robot <lkp@intel.com>
To: Real Valiquette <real.valiquette@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Chinh Cao <chinh.t.cao@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Marcin Szycik <marcin.szycik@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_acl_ctrl.c:234:6:
 warning: variable 'resp_buf' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202607022231.FWjSU75X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Marcin-Szycik/ice-rename-shared-Flow-Director-functions-and-structs/20260702-193231
head:   4242d9c4546a94409fd9096939b3d1b14bcb6512
commit: c5d6fe3b94f051789022db8eff7e7b719a3bef10 ice: initialize ACL table
date:   9 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260702/202607022231.FWjSU75X-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022231.FWjSU75X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022231.FWjSU75X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_acl_ctrl.c:234:6: warning: variable 'resp_buf' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     234 |         if (!tbl) {
         |             ^~~~
   drivers/net/ethernet/intel/ice/ice_acl_ctrl.c:287:39: note: uninitialized use occurs here
     287 |         ice_aq_dealloc_acl_tbl(hw, alloc_id, resp_buf, NULL);
         |                                              ^~~~~~~~
   drivers/net/ethernet/intel/ice/ice_acl_ctrl.c:234:2: note: remove the 'if' if its condition is always false
     234 |         if (!tbl) {
         |         ^~~~~~~~~~~
     235 |                 err = -ENOMEM;
         |                 ~~~~~~~~~~~~~~
     236 |                 goto err_dealloc_tbl;
         |                 ~~~~~~~~~~~~~~~~~~~~~
     237 |         }
         |         ~
   drivers/net/ethernet/intel/ice/ice_acl_ctrl.c:175:38: note: initialize the variable 'resp_buf' to silence this warning
     175 |         struct ice_aqc_acl_generic *resp_buf;
         |                                             ^
         |                                              = NULL
   1 warning generated.


vim +234 drivers/net/ethernet/intel/ice/ice_acl_ctrl.c

   160	
   161	/**
   162	 * ice_acl_create_tbl - create ACL table
   163	 * @hw: pointer to the HW struct
   164	 * @params: parameters for the table to be created
   165	 *
   166	 * Create a LEM table for ACL usage. We are currently starting with some fixed
   167	 * values for the size of the table, but this will need to grow as more flow
   168	 * entries are added by the user level.
   169	 *
   170	 * Return: 0 on success, negative on error
   171	 */
   172	int ice_acl_create_tbl(struct ice_hw *hw, struct ice_acl_tbl_params *params)
   173	{
   174		struct ice_acl_alloc_tbl tbl_alloc = {};
   175		struct ice_aqc_acl_generic *resp_buf;
   176		u16 width, depth, first_e, last_e;
   177		struct ice_acl_tbl *tbl;
   178		u16 alloc_id;
   179		int err;
   180	
   181		if (hw->acl_tbl)
   182			return -EEXIST;
   183	
   184		/* round up the width to the next TCAM width boundary. */
   185		width = roundup(params->width, (u16)ICE_AQC_ACL_KEY_WIDTH_BYTES);
   186		/* depth should be provided in chunk (64 entry) increments */
   187		depth = ALIGN(params->depth, ICE_ACL_ENTRY_ALLOC_UNIT);
   188	
   189		if (params->entry_act_pairs < width / ICE_AQC_ACL_KEY_WIDTH_BYTES) {
   190			params->entry_act_pairs = width / ICE_AQC_ACL_KEY_WIDTH_BYTES;
   191	
   192			if (params->entry_act_pairs > ICE_AQC_TBL_MAX_ACTION_PAIRS)
   193				params->entry_act_pairs = ICE_AQC_TBL_MAX_ACTION_PAIRS;
   194		}
   195	
   196		/* Validate that width*depth will not exceed the TCAM limit */
   197		if ((DIV_ROUND_UP(depth, ICE_AQC_ACL_TCAM_DEPTH) *
   198		     (width / ICE_AQC_ACL_KEY_WIDTH_BYTES)) > ICE_AQC_ACL_SLICES)
   199			return -ENOSPC;
   200	
   201		tbl_alloc.width = width;
   202		tbl_alloc.depth = depth;
   203		tbl_alloc.act_pairs_per_entry = params->entry_act_pairs;
   204		tbl_alloc.concurr = params->concurr;
   205	
   206		if (params->concurr) {
   207			int i;
   208	
   209			tbl_alloc.num_dependent_alloc_ids = params->num_dep_tbls;
   210	
   211			for (i = 0; i < params->num_dep_tbls; i++)
   212				tbl_alloc.buf.data_buf.alloc_ids[i] =
   213					cpu_to_le16(params->dep_tbls[i]);
   214	
   215			for (; i < ICE_AQC_MAX_CONCURRENT_ACL_TBL; i++)
   216				tbl_alloc.buf.data_buf.alloc_ids[i] =
   217					cpu_to_le16(ICE_AQC_CONCURR_ID_INVALID);
   218		}
   219	
   220		err = ice_aq_alloc_acl_tbl(hw, &tbl_alloc, NULL);
   221		if (err) {
   222			dev_err(ice_hw_to_dev(hw), "ACL table allocation failed with error %d\n",
   223				err);
   224			return err;
   225		}
   226	
   227		alloc_id = le16_to_cpu(tbl_alloc.buf.resp_buf.alloc_id);
   228		if (alloc_id < ICE_AQC_ALLOC_ID_4K) {
   229			dev_err(ice_hw_to_dev(hw), "ACL table allocation failed due to unavailable resources.\n");
   230			return -ENOMEM;
   231		}
   232	
   233		tbl = kzalloc_obj(*tbl);
 > 234		if (!tbl) {
   235			err = -ENOMEM;
   236			goto err_dealloc_tbl;
   237		}
   238	
   239		resp_buf = &tbl_alloc.buf.resp_buf;
   240	
   241		/* Retrieve information of the allocated table */
   242		tbl->id = alloc_id;
   243		tbl->first_tcam = resp_buf->ops.table.first_tcam;
   244		tbl->last_tcam = resp_buf->ops.table.last_tcam;
   245		tbl->first_entry = le16_to_cpu(resp_buf->first_entry);
   246		tbl->last_entry = le16_to_cpu(resp_buf->last_entry);
   247	
   248		tbl->info = *params;
   249		tbl->info.width = width;
   250		tbl->info.depth = depth;
   251		hw->acl_tbl = tbl;
   252	
   253		for (int i = 0; i < ICE_AQC_MAX_ACTION_MEMORIES; i++)
   254			tbl->act_mems[i].act_mem = resp_buf->act_mem[i];
   255	
   256		/* Figure out which TCAMs that these newly allocated action memories
   257		 * belong to.
   258		 */
   259		ice_acl_divide_act_mems_to_tcams(tbl);
   260	
   261		/* Initialize the resources allocated by invalidating all TCAM entries
   262		 * and all the action pairs
   263		 */
   264		err = ice_acl_init_tbl(hw);
   265		if (err) {
   266			ice_debug(hw, ICE_DBG_ACL, "Initialization of TCAM entries failed. status: %d\n",
   267				  err);
   268			goto err_free_tbl;
   269		}
   270	
   271		first_e = (tbl->first_tcam * ICE_AQC_MAX_TCAM_ALLOC_UNITS) +
   272			(tbl->first_entry / ICE_ACL_ENTRY_ALLOC_UNIT);
   273		last_e = (tbl->last_tcam * ICE_AQC_MAX_TCAM_ALLOC_UNITS) +
   274			(tbl->last_entry / ICE_ACL_ENTRY_ALLOC_UNIT);
   275	
   276		/* Indicate available entries in the table */
   277		bitmap_set(tbl->avail, first_e, last_e - first_e + 1);
   278	
   279		INIT_LIST_HEAD(&tbl->scens);
   280	
   281		return 0;
   282	
   283	err_free_tbl:
   284		hw->acl_tbl = NULL;
   285		kfree(tbl);
   286	err_dealloc_tbl:
   287		ice_aq_dealloc_acl_tbl(hw, alloc_id, resp_buf, NULL);
   288		return err;
   289	}
   290	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
