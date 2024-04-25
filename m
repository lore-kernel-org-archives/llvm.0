Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092667A1A;
	Thu, 25 Apr 2024 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031692; cv=none; b=QPIU6D7SxRFrETJXM0fd3LheNr0UD7a4kDThFmyImjzmIGC6U7hE5fswNeDftqI6UFNj/gh59KFygNL5x+0Z5jGxjD8CfJHZ+ERnsf/yZ2xQP40krgTSk+M+18/X8DAn5kZjPx3aWZR4TnyIidfgiLW4QsEAjRbCfTo4O/TXODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031692; c=relaxed/simple;
	bh=ztRiqViKJ+q5oftAvl57/PnIKRX4KNoXV5bg8OOz/UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhJ0YFNl9lnSoUHKgX6p9ubNDbj8mvnssn+RHDf/+1UgeJjkGuMU7sNE53Qwqo94iyWG2ZFx38bTvH4T/Lol0ff3z8U/3UeGcPePXiQw8XrjcMY9hvx9CcWN4ssrmBRhVa8/E7vjhQlSIEF0l2LNsQrBrT8M+/4DmpiHNMKnUEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVg64pLE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVg64pLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714031691; x=1745567691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztRiqViKJ+q5oftAvl57/PnIKRX4KNoXV5bg8OOz/UQ=;
  b=hVg64pLE/YpKmIth+ehv/2j8A3Rxz/ftNhGQwhSNneX1wK4ltLgwlzQT
   7tohsfOWHMTySHZL5LZvsJcILvGGZ58zKxSwJwt7rKYrbX33s+cJzrTx1
   n67JFGVLs3bJt1UzYdeGDsSMhsH/2mJfWH89OJFowJI22F5F0HkGfePwK
   CUI24yepC4eaFETlMWYxvY9Yg/8NHyrJeUCGMgQupNotL+lrIoiA3hdaR
   jJLlFgH+Smp+LW6ksaje4PTeHNHFvNZRkeRc2yEk6wXzRmd0qDHV5UrQd
   VdDafZ/SVOWS0c3n2J9ismshLI7nra59tpO63hNKU11DD3uQzyV114RQ/
   g==;
X-CSE-ConnectionGUID: NCfbZq7JTYCmEtYn5bVGeA==
X-CSE-MsgGUID: EFGHLafBR1+2tbEQLFnyFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13533793"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="13533793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 00:54:51 -0700
X-CSE-ConnectionGUID: WurocdhzTpOwCweuTb2pYQ==
X-CSE-MsgGUID: grOGRx7sTVaYot91n+6/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25484472"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2024 00:54:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rztwM-00028q-01;
	Thu, 25 Apr 2024 07:54:46 +0000
Date: Thu, 25 Apr 2024 15:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-mem-ctrl:mem-ctrl-next 5/10]
 drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:9: error: called object
 type 'u32' (aka 'unsigned int') is not a function or function pointer
Message-ID: <202404251551.UBeK28Ra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git mem-ctrl-next
head:   edbf2db5ae95c4d8f189d05e827d9dd3ea75cfbc
commit: 09dd3744d7c02a3844e8a6c96ab2fb3c1e94de52 [5/10] memory: tegra: Move DQSOSC measurement to common place
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240425/202404251551.UBeK28Ra-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251551.UBeK28Ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251551.UBeK28Ra-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/memory/tegra/tegra210-emc-cc-r21021.c:12:
   In file included from include/soc/tegra/mc.h:13:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/memory/tegra/tegra210-emc-cc-r21021.c:136:9: error: called object type 'u32' (aka 'unsigned int') is not a function or function pointer
     136 |                 udelay(udelay);
         |                 ~~~~~~^
   5 warnings and 1 error generated.


vim +136 drivers/memory/tegra/tegra210-emc-cc-r21021.c

    73	
    74	/*
    75	 * The division portion of the average operation.
    76	 */
    77	#define __AVERAGE_PTFV(dev)						\
    78		({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =	\
    79		   next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
    80		   next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
    81	
    82	/*
    83	 * Convert val to fixed point and add it to the temporary average.
    84	 */
    85	#define __INCREMENT_PTFV(dev, val)					\
    86		({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] +=	\
    87		   ((val) * MOVAVG_PRECISION_FACTOR); })
    88	
    89	/*
    90	 * Convert a moving average back to integral form and return the value.
    91	 */
    92	#define __MOVAVG_AC(timing, dev)					\
    93		((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
    94		 MOVAVG_PRECISION_FACTOR)
    95	
    96	/* Weighted update. */
    97	#define __WEIGHTED_UPDATE_PTFV(dev, nval)				\
    98		do {								\
    99			int w = PTFV_MOVAVG_WEIGHT_INDEX;			\
   100			int dqs = PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX;		\
   101										\
   102			next->ptfv_list[dqs] =					\
   103				((nval * MOVAVG_PRECISION_FACTOR) +		\
   104				 (next->ptfv_list[dqs] *			\
   105				  next->ptfv_list[w])) /			\
   106				(next->ptfv_list[w] + 1);			\
   107										\
   108			emc_dbg(emc, EMA_UPDATES, "%s: (s=%lu) EMA: %u\n",	\
   109				__stringify(dev), nval, next->ptfv_list[dqs]);	\
   110		} while (0)
   111	
   112	/* Access a particular average. */
   113	#define __MOVAVG(timing, dev)                      \
   114		((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX])
   115	
   116	static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
   117	{
   118		bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
   119		struct tegra210_emc_timing *last = emc->last;
   120		struct tegra210_emc_timing *next = emc->next;
   121		u32 last_timing_rate_mhz = last->rate / 1000;
   122		u32 next_timing_rate_mhz = next->rate / 1000;
   123		bool dvfs_update = type == DVFS_UPDATE;
   124		s32 tdel = 0, tmdel = 0, adel = 0;
   125		bool dvfs_pt1 = type == DVFS_PT1;
   126		u32 temp[2][2], value, udelay;
   127		unsigned long cval = 0;
   128		unsigned int i;
   129	
   130		if (dvfs_pt1 || periodic_training_update) {
   131			udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
   132			udelay *= 1000;
   133			udelay = 2 + (udelay / last->rate);
   134	
   135			tegra210_emc_start_periodic_compensation(emc);
 > 136			udelay(udelay);
   137		}
   138	
   139		/*
   140		 * Dev0 MSB.
   141		 */
   142		if (dvfs_pt1 || periodic_training_update) {
   143			value = tegra210_emc_mrr_read(emc, 2, 19);
   144	
   145			for (i = 0; i < emc->num_channels; i++) {
   146				temp[i][0] = (value & 0x00ff) << 8;
   147				temp[i][1] = (value & 0xff00) << 0;
   148				value >>= 16;
   149			}
   150	
   151			/*
   152			 * Dev0 LSB.
   153			 */
   154			value = tegra210_emc_mrr_read(emc, 2, 18);
   155	
   156			for (i = 0; i < emc->num_channels; i++) {
   157				temp[i][0] |= (value & 0x00ff) >> 0;
   158				temp[i][1] |= (value & 0xff00) >> 8;
   159				value >>= 16;
   160			}
   161		}
   162	
   163		if (dvfs_pt1 || periodic_training_update) {
   164			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   165			cval *= 1000000;
   166			cval /= last_timing_rate_mhz * 2 * temp[0][0];
   167		}
   168	
   169		if (dvfs_pt1)
   170			__INCREMENT_PTFV(C0D0U0, cval);
   171		else if (dvfs_update)
   172			__AVERAGE_PTFV(C0D0U0);
   173		else if (periodic_training_update)
   174			__WEIGHTED_UPDATE_PTFV(C0D0U0, cval);
   175	
   176		if (dvfs_update || periodic_training_update) {
   177			tdel = next->current_dram_clktree[C0D0U0] -
   178					__MOVAVG_AC(next, C0D0U0);
   179			tmdel = (tdel < 0) ? -1 * tdel : tdel;
   180			adel = tmdel;
   181	
   182			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   183			    next->tree_margin)
   184				next->current_dram_clktree[C0D0U0] =
   185					__MOVAVG_AC(next, C0D0U0);
   186		}
   187	
   188		if (dvfs_pt1 || periodic_training_update) {
   189			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   190			cval *= 1000000;
   191			cval /= last_timing_rate_mhz * 2 * temp[0][1];
   192		}
   193	
   194		if (dvfs_pt1)
   195			__INCREMENT_PTFV(C0D0U1, cval);
   196		else if (dvfs_update)
   197			__AVERAGE_PTFV(C0D0U1);
   198		else if (periodic_training_update)
   199			__WEIGHTED_UPDATE_PTFV(C0D0U1, cval);
   200	
   201		if (dvfs_update || periodic_training_update) {
   202			tdel = next->current_dram_clktree[C0D0U1] -
   203					__MOVAVG_AC(next, C0D0U1);
   204			tmdel = (tdel < 0) ? -1 * tdel : tdel;
   205	
   206			if (tmdel > adel)
   207				adel = tmdel;
   208	
   209			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   210			    next->tree_margin)
   211				next->current_dram_clktree[C0D0U1] =
   212					__MOVAVG_AC(next, C0D0U1);
   213		}
   214	
   215		if (emc->num_channels > 1) {
   216			if (dvfs_pt1 || periodic_training_update) {
   217				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   218				cval *= 1000000;
   219				cval /= last_timing_rate_mhz * 2 * temp[1][0];
   220			}
   221	
   222			if (dvfs_pt1)
   223				__INCREMENT_PTFV(C1D0U0, cval);
   224			else if (dvfs_update)
   225				__AVERAGE_PTFV(C1D0U0);
   226			else if (periodic_training_update)
   227				__WEIGHTED_UPDATE_PTFV(C1D0U0, cval);
   228	
   229			if (dvfs_update || periodic_training_update) {
   230				tdel = next->current_dram_clktree[C1D0U0] -
   231						__MOVAVG_AC(next, C1D0U0);
   232				tmdel = (tdel < 0) ? -1 * tdel : tdel;
   233	
   234				if (tmdel > adel)
   235					adel = tmdel;
   236	
   237				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   238				    next->tree_margin)
   239					next->current_dram_clktree[C1D0U0] =
   240						__MOVAVG_AC(next, C1D0U0);
   241			}
   242	
   243			if (dvfs_pt1 || periodic_training_update) {
   244				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   245				cval *= 1000000;
   246				cval /= last_timing_rate_mhz * 2 * temp[1][1];
   247			}
   248	
   249			if (dvfs_pt1)
   250				__INCREMENT_PTFV(C1D0U1, cval);
   251			else if (dvfs_update)
   252				__AVERAGE_PTFV(C1D0U1);
   253			else if (periodic_training_update)
   254				__WEIGHTED_UPDATE_PTFV(C1D0U1, cval);
   255	
   256			if (dvfs_update || periodic_training_update) {
   257				tdel = next->current_dram_clktree[C1D0U1] -
   258						__MOVAVG_AC(next, C1D0U1);
   259				tmdel = (tdel < 0) ? -1 * tdel : tdel;
   260	
   261				if (tmdel > adel)
   262					adel = tmdel;
   263	
   264				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   265				    next->tree_margin)
   266					next->current_dram_clktree[C1D0U1] =
   267						__MOVAVG_AC(next, C1D0U1);
   268			}
   269		}
   270	
   271		if (emc->num_devices < 2)
   272			goto done;
   273	
   274		/*
   275		 * Dev1 MSB.
   276		 */
   277		if (dvfs_pt1 || periodic_training_update) {
   278			value = tegra210_emc_mrr_read(emc, 1, 19);
   279	
   280			for (i = 0; i < emc->num_channels; i++) {
   281				temp[i][0] = (value & 0x00ff) << 8;
   282				temp[i][1] = (value & 0xff00) << 0;
   283				value >>= 16;
   284			}
   285	
   286			/*
   287			 * Dev1 LSB.
   288			 */
   289			value = tegra210_emc_mrr_read(emc, 1, 18);
   290	
   291			for (i = 0; i < emc->num_channels; i++) {
   292				temp[i][0] |= (value & 0x00ff) >> 0;
   293				temp[i][1] |= (value & 0xff00) >> 8;
   294				value >>= 16;
   295			}
   296		}
   297	
   298		if (dvfs_pt1 || periodic_training_update) {
   299			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   300			cval *= 1000000;
   301			cval /= last_timing_rate_mhz * 2 * temp[0][0];
   302		}
   303	
   304		if (dvfs_pt1)
   305			__INCREMENT_PTFV(C0D1U0, cval);
   306		else if (dvfs_update)
   307			__AVERAGE_PTFV(C0D1U0);
   308		else if (periodic_training_update)
   309			__WEIGHTED_UPDATE_PTFV(C0D1U0, cval);
   310	
   311		if (dvfs_update || periodic_training_update) {
   312			tdel = next->current_dram_clktree[C0D1U0] -
   313					__MOVAVG_AC(next, C0D1U0);
   314			tmdel = (tdel < 0) ? -1 * tdel : tdel;
   315	
   316			if (tmdel > adel)
   317				adel = tmdel;
   318	
   319			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   320			    next->tree_margin)
   321				next->current_dram_clktree[C0D1U0] =
   322					__MOVAVG_AC(next, C0D1U0);
   323		}
   324	
   325		if (dvfs_pt1 || periodic_training_update) {
   326			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   327			cval *= 1000000;
   328			cval /= last_timing_rate_mhz * 2 * temp[0][1];
   329		}
   330	
   331		if (dvfs_pt1)
   332			__INCREMENT_PTFV(C0D1U1, cval);
   333		else if (dvfs_update)
   334			__AVERAGE_PTFV(C0D1U1);
   335		else if (periodic_training_update)
   336			__WEIGHTED_UPDATE_PTFV(C0D1U1, cval);
   337	
   338		if (dvfs_update || periodic_training_update) {
   339			tdel = next->current_dram_clktree[C0D1U1] -
   340					__MOVAVG_AC(next, C0D1U1);
   341			tmdel = (tdel < 0) ? -1 * tdel : tdel;
   342	
   343			if (tmdel > adel)
   344				adel = tmdel;
   345	
   346			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   347			    next->tree_margin)
   348				next->current_dram_clktree[C0D1U1] =
   349					__MOVAVG_AC(next, C0D1U1);
   350		}
   351	
   352		if (emc->num_channels > 1) {
   353			if (dvfs_pt1 || periodic_training_update) {
   354				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   355				cval *= 1000000;
   356				cval /= last_timing_rate_mhz * 2 * temp[1][0];
   357			}
   358	
   359			if (dvfs_pt1)
   360				__INCREMENT_PTFV(C1D1U0, cval);
   361			else if (dvfs_update)
   362				__AVERAGE_PTFV(C1D1U0);
   363			else if (periodic_training_update)
   364				__WEIGHTED_UPDATE_PTFV(C1D1U0, cval);
   365	
   366			if (dvfs_update || periodic_training_update) {
   367				tdel = next->current_dram_clktree[C1D1U0] -
   368						__MOVAVG_AC(next, C1D1U0);
   369				tmdel = (tdel < 0) ? -1 * tdel : tdel;
   370	
   371				if (tmdel > adel)
   372					adel = tmdel;
   373	
   374				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   375				    next->tree_margin)
   376					next->current_dram_clktree[C1D1U0] =
   377						__MOVAVG_AC(next, C1D1U0);
   378			}
   379	
   380			if (dvfs_pt1 || periodic_training_update) {
   381				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
   382				cval *= 1000000;
   383				cval /= last_timing_rate_mhz * 2 * temp[1][1];
   384			}
   385	
   386			if (dvfs_pt1)
   387				__INCREMENT_PTFV(C1D1U1, cval);
   388			else if (dvfs_update)
   389				__AVERAGE_PTFV(C1D1U1);
   390			else if (periodic_training_update)
   391				__WEIGHTED_UPDATE_PTFV(C1D1U1, cval);
   392	
   393			if (dvfs_update || periodic_training_update) {
   394				tdel = next->current_dram_clktree[C1D1U1] -
   395						__MOVAVG_AC(next, C1D1U1);
   396				tmdel = (tdel < 0) ? -1 * tdel : tdel;
   397	
   398				if (tmdel > adel)
   399					adel = tmdel;
   400	
   401				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
   402				    next->tree_margin)
   403					next->current_dram_clktree[C1D1U1] =
   404						__MOVAVG_AC(next, C1D1U1);
   405			}
   406		}
   407	
   408	done:
   409		return adel;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
