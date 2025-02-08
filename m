Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B381957FF;
	Sat,  8 Feb 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989904; cv=none; b=Rzhgzvljq6IbPNLKDCrAUEUijKsMoit0YatSvKIUdHj6HFLkdq7H0DCVmI5IT3VKk0tapyZvuqd86+7DqVgu2YtfKxoiT5j2vl5dynME4bIbLrjJitNkGlvLE8z3Rcc5K73Z+ycRXq4cE98z2uq2Rh7LyFNHmSQRgWAKMz0kXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989904; c=relaxed/simple;
	bh=GvYQaLiDW/yeR5mK5o7wYWIt7Bg9kP22YSV3dyDsULc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYQqJM9FKS2IwFwN0JlrgehZzcLspdESLTm7bXBrVU0Yx4SzkD3+IOpPaCTRKxc8efZFNlwqb7NPI+33L9xhCQ4GYdVJgaV9z7KneOjbQ1Ke7hBLNKIhN3IHbsfN3EgxEoNIkAs/pLtc9E+ihR5qz7UqGMIpc/XbqrElZcX8m/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0BBnFO3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0BBnFO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738989903; x=1770525903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvYQaLiDW/yeR5mK5o7wYWIt7Bg9kP22YSV3dyDsULc=;
  b=R0BBnFO31gkngFldh+5i8pifuJQVPhrSjh6iQa+4DR+D448RSmjsfw6h
   8tQCsFgrbrQr0uvZcJQBd+7RYQQMdiNqZegoPt/PVGaZXB03iqFfVwcpB
   tS+RECjzu9AfJaOOogKgoPUw335XMs49h3xy3T7Wu8l5MLNftkctCbyCF
   HqNY3qZHesV7g7tLBoEWS0z0RpzAqGQ8RxKBLGT0AWdb/rOP9pg3Tvp2f
   +8yLArTiiuUoLMa6PO0QAhaOxL2BAYkUArsQ8WWW1z9KCdyltGS9bENpG
   1GjX2wRHfpFJQEV6U/4fsl0GxE5EgM0lO3RrrYLIDz54h9z+MshCpHVFN
   Q==;
X-CSE-ConnectionGUID: w5/CwkjgQwKJ96dU+sML5Q==
X-CSE-MsgGUID: C8VaJXXOQxKWFCGEW4DtwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43401129"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="43401129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 20:45:02 -0800
X-CSE-ConnectionGUID: WgkKndJ3Qt+uoB/ZP1d8IA==
X-CSE-MsgGUID: ZlKvYrhsSNuso87MzZFjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116646881"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 20:45:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgci9-000zXH-34;
	Sat, 08 Feb 2025 04:44:57 +0000
Date: Sat, 8 Feb 2025 12:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, quic_lingbok@quicinc.com
Subject: Re: [PATCH] wifi: ath12k: report station mode per-chain signal
 strength
Message-ID: <202502081250.6rZZ2s6H-lkp@intel.com>
References: <20250207071003.162576-1-quic_lingbok@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207071003.162576-1-quic_lingbok@quicinc.com>

Hi Lingbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d132a72d768bae74d10e6539fcf6522dfdbd1115]

url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-report-station-mode-per-chain-signal-strength/20250207-151239
base:   d132a72d768bae74d10e6539fcf6522dfdbd1115
patch link:    https://lore.kernel.org/r/20250207071003.162576-1-quic_lingbok%40quicinc.com
patch subject: [PATCH] wifi: ath12k: report station mode per-chain signal strength
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250208/202502081250.6rZZ2s6H-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081250.6rZZ2s6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081250.6rZZ2s6H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/wmi.c:6:
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
>> drivers/net/wireless/ath/ath12k/wmi.c:7550:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    7550 |         default:
         |         ^
   drivers/net/wireless/ath/ath12k/wmi.c:7550:2: note: insert 'break;' to avoid fall-through
    7550 |         default:
         |         ^
         |         break; 
   4 warnings generated.


vim +7550 drivers/net/wireless/ath/ath12k/wmi.c

1715fcabad1648 Lingbo Kong 2025-02-07  7520  
79e7b04b5388c1 Lingbo Kong 2025-01-15  7521  static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
79e7b04b5388c1 Lingbo Kong 2025-01-15  7522  					 u16 tag, u16 len,
79e7b04b5388c1 Lingbo Kong 2025-01-15  7523  					 const void *ptr, void *data)
79e7b04b5388c1 Lingbo Kong 2025-01-15  7524  {
79e7b04b5388c1 Lingbo Kong 2025-01-15  7525  	struct wmi_tlv_fw_stats_parse *parse = data;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7526  	int ret = 0;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7527  
79e7b04b5388c1 Lingbo Kong 2025-01-15  7528  	switch (tag) {
79e7b04b5388c1 Lingbo Kong 2025-01-15  7529  	case WMI_TAG_STATS_EVENT:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7530  		parse->ev = ptr;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7531  		break;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7532  	case WMI_TAG_ARRAY_BYTE:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7533  		ret = ath12k_wmi_tlv_fw_stats_data_parse(ab, parse, ptr, len);
79e7b04b5388c1 Lingbo Kong 2025-01-15  7534  		break;
1715fcabad1648 Lingbo Kong 2025-02-07  7535  	case WMI_TAG_PER_CHAIN_RSSI_STATS:
1715fcabad1648 Lingbo Kong 2025-02-07  7536  		parse->rssi = ptr;
1715fcabad1648 Lingbo Kong 2025-02-07  7537  		if (le32_to_cpu(parse->ev->stats_id) & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
1715fcabad1648 Lingbo Kong 2025-02-07  7538  			parse->rssi_num = le32_to_cpu(parse->rssi->num_per_chain_rssi);
1715fcabad1648 Lingbo Kong 2025-02-07  7539  		break;
1715fcabad1648 Lingbo Kong 2025-02-07  7540  	case WMI_TAG_ARRAY_STRUCT:
1715fcabad1648 Lingbo Kong 2025-02-07  7541  		if (parse->rssi_num && !parse->chain_rssi_done) {
1715fcabad1648 Lingbo Kong 2025-02-07  7542  			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
1715fcabad1648 Lingbo Kong 2025-02-07  7543  						  ath12k_wmi_tlv_rssi_chain_parse,
1715fcabad1648 Lingbo Kong 2025-02-07  7544  						  parse);
1715fcabad1648 Lingbo Kong 2025-02-07  7545  			if (ret)
1715fcabad1648 Lingbo Kong 2025-02-07  7546  				return ret;
1715fcabad1648 Lingbo Kong 2025-02-07  7547  
1715fcabad1648 Lingbo Kong 2025-02-07  7548  			parse->chain_rssi_done = true;
1715fcabad1648 Lingbo Kong 2025-02-07  7549  		}
79e7b04b5388c1 Lingbo Kong 2025-01-15 @7550  	default:
79e7b04b5388c1 Lingbo Kong 2025-01-15  7551  		break;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7552  	}
79e7b04b5388c1 Lingbo Kong 2025-01-15  7553  	return ret;
79e7b04b5388c1 Lingbo Kong 2025-01-15  7554  }
79e7b04b5388c1 Lingbo Kong 2025-01-15  7555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
