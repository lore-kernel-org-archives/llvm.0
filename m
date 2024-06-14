Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149282E83F;
	Fri, 14 Jun 2024 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380991; cv=none; b=BW4dG0Av5dOb344dAvhA9vWRytar9vptN996jqxXCOPv0MUxZGayOFqCQ2+v5h2xee4/opFGtMNd3ag9J4eCxMc5EVXz3ZopS6c1VnaAK5dQaUr62HUh6grJ0OWYkF/4IEUZziSnZEPQJF31mQ2atsdlyJ2Uwzyxrt/URrpn0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380991; c=relaxed/simple;
	bh=9A/jqOqBS9MCf4eOyP7DggQr5hwvAQA+gRex7aJt6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxFibAHCsU4Ov6hc/7Vjk9d+MFkezxSO1XaXQRMMrSSmoCMaeTkGmw9KinzzzKrCLhTFZ6p358zQZeA9d8b3MjUqNbc9X43zO4NoaPaJRRqL/8A9vd0pYgKRxbo1wWMJfyDBP0FZsjQ6CCOsd09YyaabycuDHvnMJX3qBdyzYAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9cTosgg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9cTosgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718380989; x=1749916989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9A/jqOqBS9MCf4eOyP7DggQr5hwvAQA+gRex7aJt6Gs=;
  b=W9cTosggterU745xQNLH4OlzLgCk8yUvscVjVGWz+n8d8QnTLpqgayG4
   I2iRygwl5ZJ4b3uhVl6wEHPTT3bGg8T9cH6nVq8EJoOp79E99eqRIm0C4
   becuezRPHPqBIAaQrrPLqcY7lTx0+qe93DxR9fXYuvm+sGfm6cuuqDOPi
   24VZ84WaTu0SSsp2CVZMjM6ySYM1I34Fcp453XfLtcY686kXTuxCeFZzA
   fIPzF9JuPqPoKhJgaaUa717DsbJhDfRXpPcw0B0wGRDMzfPQoFmYZdT+2
   GDHkywwq1rX2b02sH+M8PiZ+hNzer5MfvR09yO/uWyRojM/NkX4NIG7uV
   A==;
X-CSE-ConnectionGUID: SqXFts4LSN6ieZoZAGuwzw==
X-CSE-MsgGUID: 3s+3vVToQUSd+X5WDGrhRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15398683"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15398683"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 09:03:08 -0700
X-CSE-ConnectionGUID: hMcYBMsRRaWhPzBhSoCGTw==
X-CSE-MsgGUID: jmqHEHkZTxizZcPWWKVlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40642374"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2024 09:03:07 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI9OK-0001TW-36;
	Fri, 14 Jun 2024 16:03:04 +0000
Date: Sat, 15 Jun 2024 00:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 98/114]
 drivers/platform/arm64/mpam/mpam_resctrl.c:350:14: warning: result of
 comparison of constant 65536 with expression of type 'u16' (aka 'unsigned
 short') is always false
Message-ID: <202406150007.xsDBcEKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: 3b87a689f7311e64ff9a94ca9d22fb33aefcb372 [98/114] arm_mpam: resctrl: Add resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240615/202406150007.xsDBcEKC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150007.xsDBcEKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150007.xsDBcEKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:6:
   In file included from include/linux/arm_mpam.h:7:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/arm64/mpam/mpam_resctrl.c:350:14: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     350 |         if (cfg.mon == USE_RMID_IDX)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~
   6 warnings generated.


vim +350 drivers/platform/arm64/mpam/mpam_resctrl.c

   321	
   322	int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_domain *d,
   323				   u32 closid, u32 rmid, enum resctrl_event_id eventid,
   324				   u64 *val, void *arch_mon_ctx)
   325	{
   326		int err;
   327		u64 cdp_val;
   328		struct mon_cfg cfg;
   329		struct mpam_resctrl_dom *dom;
   330		u32 mon = *(u32 *)arch_mon_ctx;
   331		enum mpam_device_features type;
   332	
   333		resctrl_arch_rmid_read_context_check();
   334	
   335		dom = container_of(d, struct mpam_resctrl_dom, resctrl_dom);
   336	
   337		switch (eventid) {
   338		case QOS_L3_OCCUP_EVENT_ID:
   339			type = mpam_feat_msmon_csu;
   340			break;
   341		case QOS_L3_MBM_LOCAL_EVENT_ID:
   342		case QOS_L3_MBM_TOTAL_EVENT_ID:
   343			type = mpam_feat_msmon_mbwu;
   344			break;
   345		default:
   346			return -EINVAL;
   347		}
   348	
   349		cfg.mon = mon;
 > 350		if (cfg.mon == USE_RMID_IDX)
   351			cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
   352	
   353		cfg.match_pmg = true;
   354		cfg.pmg = rmid;
   355	
   356		if (cdp_enabled) {
   357			cfg.partid = closid << 1;
   358			err = mpam_msmon_read(dom->comp, &cfg, type, val);
   359			if (err)
   360				return err;
   361	
   362			cfg.partid += 1;
   363			err = mpam_msmon_read(dom->comp, &cfg, type, &cdp_val);
   364			if (!err)
   365				*val += cdp_val;
   366		} else {
   367			cfg.partid = closid;
   368			err = mpam_msmon_read(dom->comp, &cfg, type, val);
   369		}
   370	
   371		return err;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
