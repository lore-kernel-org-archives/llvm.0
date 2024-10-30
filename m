Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D618EFDE;
	Wed, 30 Oct 2024 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730255690; cv=none; b=jyfpzySUv/is7ECR8eRDkK3qKFselashrSEAO9FRgdrdgwy6QK+AGeDS6pGIUJBumJIETsE/7sy1JJ5rEn4mhuMqvUSt8Iqx9tsxrgkLOpaTA6LUZsjRtPJnCVpFcpua8F4bGdH47Qc8HpxN4khxr0YbgsqN225qqtzctJ8/vwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730255690; c=relaxed/simple;
	bh=M6eGC86Zbs1h8bQmgHpwKbbBUBw/HHIkyDtI3CdhGnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4UVJ64Wo1SqrLNme+fkhtYvjW+RJ0T9YxKbTr2zZYtWwB0INV5SCrsYuANJfuWj/Sz8UWxLMD/PmsbcJ2jRiTfSCxLPUiKF7Abrkfq2BXoWwU7tbvhjapr9Gr5EwvyoixtGQ84/PZwAEBFhR/raNG29pFOWIjac34aa9+01iT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W77YiVFI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W77YiVFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730255688; x=1761791688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6eGC86Zbs1h8bQmgHpwKbbBUBw/HHIkyDtI3CdhGnw=;
  b=W77YiVFIvFIgl3b26Ugi0XY1T9ZTu5z0NYoQcwglQcZwLnRUTophjFCM
   PsNNvRo28N4agRlelW1X6wjUu1ThJpC+Uc3qrQIZMikm1Oguh/0IUhZ+D
   WBGEuWy9XkmdSnd1c8vh8jyp7by0Vvm6tPD7sV86gtxYu6FyKtT9AOynE
   GwJQRrG34c5H19UFzrY6/DqxVvJ0J9oMopyEy7DsILrn8Fx0y+NxKE/Yj
   Tdvd/ruiuyIcQ/wlJSpxWiV+5URMKHfol51cmTScv5R9+YW8FOJXjpxSi
   0zKHmQAViM9ky81SMMdC0rbuH9t3q1nE6eG8UBpyMO0IcazfR3i7poJyx
   w==;
X-CSE-ConnectionGUID: 4Gga+akkSuC6Ya8M6zHImg==
X-CSE-MsgGUID: d9qdhLkCTD6XQSbNUvKtqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47399984"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47399984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 19:34:44 -0700
X-CSE-ConnectionGUID: lM7rB+uXTl62UVeUGCB3DA==
X-CSE-MsgGUID: 2WxLPSOCSF6A2NvfSJOJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="119646038"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2024 19:34:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5yXh-000eQ8-0g;
	Wed, 30 Oct 2024 02:34:41 +0000
Date: Wed, 30 Oct 2024 10:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx-j7-fix 2/2]
 drivers/net/ethernet/ti/am65-cpsw-nuss.c:775:28: warning: variable 'flow'
 set but not used
Message-ID: <202410301024.ZPqlEacO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx-j7-fix
head:   b0c1f576f96f0081c0e2a0ccbd8ae3c7e6c02a88
commit: b0c1f576f96f0081c0e2a0ccbd8ae3c7e6c02a88 [2/2] net: ethernet: ti: am65-cpsw: Fix multi RX flows on J7
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410301024.ZPqlEacO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301024.ZPqlEacO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301024.ZPqlEacO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/am65-cpsw-nuss.c:8:
   In file included from include/linux/bpf_trace.h:5:
   In file included from include/trace/events/xdp.h:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-nuss.c:517:9: warning: cast to smaller integer type 'enum am65_cpsw_tx_buf_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
     517 |         return (enum am65_cpsw_tx_buf_type)k3_cppi_desc_pool_desc_info(tx_chn->desc_pool,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     518 |                                                                        desc_idx);
         |                                                                        ~~~~~~~~~
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:775:28: warning: variable 'flow' set but not used [-Wunused-but-set-variable]
     775 |         struct am65_cpsw_rx_flow *flow;
         |                                   ^
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:1154:16: warning: variable 'desc_idx' set but not used [-Wunused-but-set-variable]
    1154 |         int headroom, desc_idx, ret;
         |                       ^
   7 warnings generated.


vim +/flow +775 drivers/net/ethernet/ti/am65-cpsw-nuss.c

   769	
   770	static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
   771	{
   772		struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
   773		struct am65_cpsw_tx_chn *tx_chn = common->tx_chns;
   774		int i;
 > 775		struct am65_cpsw_rx_flow *flow;
   776	
   777		if (common->usage_count != 1)
   778			return 0;
   779	
   780		cpsw_ale_control_set(common->ale, HOST_PORT_NUM,
   781				     ALE_PORT_STATE, ALE_PORT_STATE_DISABLE);
   782	
   783		/* shutdown tx channels */
   784		atomic_set(&common->tdown_cnt, common->tx_ch_num);
   785		/* ensure new tdown_cnt value is visible */
   786		smp_mb__after_atomic();
   787		reinit_completion(&common->tdown_complete);
   788	
   789		for (i = 0; i < common->tx_ch_num; i++)
   790			k3_udma_glue_tdown_tx_chn(tx_chn[i].tx_chn, false);
   791	
   792		i = wait_for_completion_timeout(&common->tdown_complete,
   793						msecs_to_jiffies(1000));
   794		if (!i)
   795			dev_err(common->dev, "tx timeout\n");
   796		for (i = 0; i < common->tx_ch_num; i++) {
   797			napi_disable(&tx_chn[i].napi_tx);
   798			hrtimer_cancel(&tx_chn[i].tx_hrtimer);
   799		}
   800	
   801		for (i = 0; i < common->tx_ch_num; i++) {
   802			k3_udma_glue_reset_tx_chn(tx_chn[i].tx_chn, &tx_chn[i],
   803						  am65_cpsw_nuss_tx_cleanup);
   804			k3_udma_glue_disable_tx_chn(tx_chn[i].tx_chn);
   805		}
   806	
   807		reinit_completion(&common->tdown_complete);
   808		k3_udma_glue_tdown_rx_chn(rx_chn->rx_chn, true);
   809	
   810		if (common->pdata.quirks & AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ) {
   811			i = wait_for_completion_timeout(&common->tdown_complete, msecs_to_jiffies(1000));
   812			if (!i)
   813				dev_err(common->dev, "rx teardown timeout\n");
   814		}
   815	
   816		for (i = common->rx_ch_num_flows - 1; i >= 0; i--) {
   817			flow = &rx_chn->flows[i];
   818			napi_disable(&rx_chn->flows[i].napi_rx);
   819			hrtimer_cancel(&rx_chn->flows[i].rx_hrtimer);
   820			k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, rx_chn,
   821						  am65_cpsw_nuss_rx_cleanup, !!i);
   822		}
   823	
   824		k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
   825	
   826		cpsw_ale_stop(common->ale);
   827	
   828		writel(0, common->cpsw_base + AM65_CPSW_REG_CTL);
   829		writel(0, common->cpsw_base + AM65_CPSW_REG_STAT_PORT_EN);
   830	
   831		am65_cpsw_destroy_xdp_rxqs(common);
   832	
   833		dev_dbg(common->dev, "cpsw_nuss stopped\n");
   834		return 0;
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
