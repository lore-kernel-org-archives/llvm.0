Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625763CB;
	Mon, 20 Jan 2025 01:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737337110; cv=none; b=elfS5HkpC47I5RlTzfrMvRGG4BIx4dQ9+F4FwhobKUe4ju9v60AoLkb4UPViWZvpXR5FRCA9gxzUuApljxc7pG11EBpc1pPyZTY7ac3oGKRhZ4N2EqgsFlS4YkYSe3sxa2+ZODczjmzISpPMBEOarDpBQCRkcIhh8DQKcERL8YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737337110; c=relaxed/simple;
	bh=m8hfQaeeAZ1PG/HkD93vAifRJiE4J1xOoGar6YICN+E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bx1FmtKHYcKY1BvU+XvPSALMvwBpPldR9cRRkBVfv6aNwte6nvNkbpIjxAlZvGmfS9puQtm3ecWjDkxZcMUdbBHitYpo2Ea5PX04FKeeP5/5TjsNp8cTTY9RVeK/vQbwywF0UXgTfINvlUg8JngazTIDSb+kYuozfULpTWHJ8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWtol2s5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWtol2s5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737337109; x=1768873109;
  h=date:from:cc:subject:message-id:mime-version;
  bh=m8hfQaeeAZ1PG/HkD93vAifRJiE4J1xOoGar6YICN+E=;
  b=CWtol2s50iPFGNN/5DR+T5GIl7Kp/upsvUi1rVYDz6og/Nfv2/18B0AA
   4oO+i7c93TyDNz8asILIFfWIk5WumjZytzt0Wl3gNAWwKUFE24aBLpx2H
   +3cyRfCUb8Cb/nG4iWgD8WscBmILueXnUhSc6rGCeF+NDuPZftTxQ0TVT
   fDvFr6WgiwIUCt41gflPvFuVOeZBtZU/m1U4tdFMGrRfpamIHJMAF4CEY
   HLHKmJTRe3KPswTxcoti8w/7QyZS/QU84OGO50WIRxPuhkUU58cqKsSg2
   YV3DnrPVFtmB4wgWg4P2LtP4RMRnOmng0oJWL5juI/bET8n+5tYja8Oxb
   g==;
X-CSE-ConnectionGUID: hoWbFdPYSHqadT+dE/V0MQ==
X-CSE-MsgGUID: qdgzo1k2RBOGmKqZLzHEIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41365401"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41365401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 17:38:27 -0800
X-CSE-ConnectionGUID: bvICwsZ9ShuMbLqFVE5gug==
X-CSE-MsgGUID: 6VK0a0ReRQ2LkPriaZfw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="111319562"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2025 17:38:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZgkB-000W1n-0R;
	Mon, 20 Jan 2025 01:38:23 +0000
Date: Mon, 20 Jan 2025 09:37:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v3 10/10] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
Message-ID: <202501200931.mFKm0hsW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250119135751.2221902-11-quic_periyasa@quicinc.com>
References: <20250119135751.2221902-11-quic_periyasa@quicinc.com>
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
TO: ath12k@lists.infradead.org
CC: linux-wireless@vger.kernel.org
CC: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: P Praneesh <quic_ppranees@quicinc.com>
CC: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Hi Karthikeyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e7ef944b3e2c31b608800925e784f67596375770]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-ath12k-Add-HAL_PHYRX_GENERIC_U_SIG-TLV-parsing-support/20250119-220042
base:   e7ef944b3e2c31b608800925e784f67596375770
patch link:    https://lore.kernel.org/r/20250119135751.2221902-11-quic_periyasa%40quicinc.com
patch subject: [PATCH v3 10/10] wifi: ath12k: Add peer extended Rx statistics debugfs support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250120/202501200931.mFKm0hsW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200931.mFKm0hsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200931.mFKm0hsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/debugfs_sta.c:8:
   In file included from drivers/net/wireless/ath/ath12k/debugfs_sta.h:9:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/debugfs_sta.c:80:32: warning: arithmetic between different enumeration types ('enum hal_rx_bw' and 'enum hal_rx_gi') [-Wenum-enum-conversion]
      80 |         for (i = 0; i < HAL_RX_BW_MAX * HAL_RX_GI_MAX * HAL_RX_MAX_NSS; i++) {
         |                         ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/debugfs_sta.c:162:3: error: cannot jump from this goto statement to its label
     162 |                 goto out;
         |                 ^
   drivers/net/wireless/ath/ath12k/debugfs_sta.c:167:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
     167 |         u8 *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
         |             ^
   drivers/net/wireless/ath/ath12k/debugfs_sta.c:156:3: error: cannot jump from this goto statement to its label
     156 |                 goto out;
         |                 ^
   drivers/net/wireless/ath/ath12k/debugfs_sta.c:167:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
     167 |         u8 *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
         |             ^
   4 warnings and 2 errors generated.


vim +80 drivers/net/wireless/ath/ath12k/debugfs_sta.c

    14	
    15	static
    16	u32 ath12k_dbg_sta_dump_rate_stats(u8 *buf, u32 offset, const int size,
    17					   bool he_rates_avail,
    18					   const struct ath12k_rx_peer_rate_stats *stats)
    19	{
    20		static const char *legacy_rate_str[HAL_RX_MAX_NUM_LEGACY_RATES] = {
    21						"1 Mbps", "2 Mbps", "5.5 Mbps", "6 Mbps",
    22						"9 Mbps", "11 Mbps", "12 Mbps", "18 Mbps",
    23						"24 Mbps", "36 Mbps", "48 Mbps", "54 Mbps"};
    24		int mcs = 0, bw = 0, nss = 0, gi = 0, bw_num = 0;
    25		u32 i, len = offset;
    26		bool found;
    27	
    28		len += scnprintf(buf + len, size - len, "\nEHT stats:\n");
    29		for (i = 0; i <= HAL_RX_MAX_MCS_BE; i++)
    30			len += scnprintf(buf + len, size - len,
    31					   "MCS %d: %llu%s", i, stats->be_mcs_count[i],
    32					   (i + 1) % 8 ? "\t" : "\n");
    33	
    34		len += scnprintf(buf + len, size - len, "\nHE stats:\n");
    35		for (i = 0; i <= HAL_RX_MAX_MCS_HE; i++)
    36			len += scnprintf(buf + len, size - len,
    37					   "MCS %d: %llu%s", i, stats->he_mcs_count[i],
    38					   (i + 1) % 6 ? "\t" : "\n");
    39	
    40		len += scnprintf(buf + len, size - len, "\nVHT stats:\n");
    41		for (i = 0; i <= HAL_RX_MAX_MCS_VHT; i++)
    42			len += scnprintf(buf + len, size - len,
    43					   "MCS %d: %llu%s", i, stats->vht_mcs_count[i],
    44					   (i + 1) % 5 ? "\t" : "\n");
    45	
    46		len += scnprintf(buf + len, size - len, "\nHT stats:\n");
    47		for (i = 0; i <= HAL_RX_MAX_MCS_HT; i++)
    48			len += scnprintf(buf + len, size - len,
    49					   "MCS %d: %llu%s", i, stats->ht_mcs_count[i],
    50					   (i + 1) % 8 ? "\t" : "\n");
    51	
    52		len += scnprintf(buf + len, size - len, "\nLegacy stats:\n");
    53		for (i = 0; i < HAL_RX_MAX_NUM_LEGACY_RATES; i++)
    54			len += scnprintf(buf + len, size - len,
    55					   "%s: %llu%s", legacy_rate_str[i],
    56					   stats->legacy_count[i],
    57					   (i + 1) % 4 ? "\t" : "\n");
    58	
    59		len += scnprintf(buf + len, size - len, "\nNSS stats:\n");
    60		for (i = 0; i < HAL_RX_MAX_NSS; i++)
    61			len += scnprintf(buf + len, size - len,
    62					   "%dx%d: %llu ", i + 1, i + 1,
    63					   stats->nss_count[i]);
    64	
    65		len += scnprintf(buf + len, size - len,
    66				  "\n\nGI: 0.8 us %llu 0.4 us %llu 1.6 us %llu 3.2 us %llu\n",
    67				  stats->gi_count[0],
    68				  stats->gi_count[1],
    69				  stats->gi_count[2],
    70				  stats->gi_count[3]);
    71	
    72		len += scnprintf(buf + len, size - len,
    73				   "BW: 20 MHz %llu 40 MHz %llu 80 MHz %llu 160 MHz %llu 320 MHz %llu\n",
    74				   stats->bw_count[0],
    75				   stats->bw_count[1],
    76				   stats->bw_count[2],
    77				   stats->bw_count[3],
    78				   stats->bw_count[4]);
    79	
  > 80		for (i = 0; i < HAL_RX_BW_MAX * HAL_RX_GI_MAX * HAL_RX_MAX_NSS; i++) {
    81			found = false;
    82	
    83			for (mcs = 0; mcs <= HAL_RX_MAX_MCS_HT; mcs++) {
    84				if (stats->rx_rate[bw][gi][nss][mcs]) {
    85					found = true;
    86					break;
    87				}
    88			}
    89	
    90			if (!found)
    91				goto skip_report;
    92	
    93			switch (bw) {
    94			case HAL_RX_BW_20MHZ:
    95				bw_num = 20;
    96				break;
    97			case HAL_RX_BW_40MHZ:
    98				bw_num = 40;
    99				break;
   100			case HAL_RX_BW_80MHZ:
   101				bw_num = 80;
   102				break;
   103			case HAL_RX_BW_160MHZ:
   104				bw_num = 160;
   105				break;
   106			case HAL_RX_BW_320MHZ:
   107				bw_num = 320;
   108				break;
   109			}
   110	
   111			len += scnprintf(buf + len, size - len, "\n%d Mhz gi %d us %dx%d : ",
   112					 bw_num, gi, nss + 1, nss + 1);
   113	
   114			for (mcs = 0; mcs <= HAL_RX_MAX_MCS_HT; mcs++) {
   115				if (stats->rx_rate[bw][gi][nss][mcs])
   116					len += scnprintf(buf + len, size - len,
   117							 " %d:%llu", mcs,
   118							 stats->rx_rate[bw][gi][nss][mcs]);
   119			}
   120	
   121	skip_report:
   122			if (nss++ >= HAL_RX_MAX_NSS - 1) {
   123				nss = 0;
   124				if (gi++ >= HAL_RX_GI_MAX - 1) {
   125					gi = 0;
   126					if (bw < HAL_RX_BW_MAX - 1)
   127						bw++;
   128				}
   129			}
   130		}
   131	
   132		len += scnprintf(buf + len, size - len, "\n");
   133	
   134		return len - offset;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
