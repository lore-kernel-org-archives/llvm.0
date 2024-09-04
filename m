Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11711DFE0A;
	Wed,  4 Sep 2024 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725463169; cv=none; b=h7JAYg3pNwDHy6SLb7NTB51DWqRKyKa/koGKACB6ozjVgiDNKcn/xR3p+i2kTMYf8y+xLZ/6nz1lsOeAzQKfLCKbioUjjRSKNZ6GaBsXNWhUg8OtGtX1Qfm9C9xIQrMDu6CHAUGaGGXAdN1lmQItz9a+6yYckC3UBc+x9W5ZcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725463169; c=relaxed/simple;
	bh=gSq7vb9u4cJxaHzBIHobaINd3seRBAaJwCchcacHiwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NOZZ9s2PDr3Y7LLFR4KplmqWENlFHckTuHkm5MN2/UUslMHB5a1VNdCUK+kDENlzdrKTJQiuk6RMnOOfIE9HvJhOaqiHwUuTvgJzd/wTqhUlvlhvNtWGs12MqOXZbdxe4KP4Q2JCleGXXFULklmcOovM+iJANN6xoYQ9ZPMqCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+0iyzom; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+0iyzom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725463168; x=1756999168;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gSq7vb9u4cJxaHzBIHobaINd3seRBAaJwCchcacHiwc=;
  b=i+0iyzomR7TWq/iyxCaB5QSJM06FRAgkINveLf8iU6GrDMJmgDggdMiA
   B+ldabLhkd1olNKdBp2TuP9ZQLIh2PdrcQer22nxMdKH2Nol/At00/Mf3
   OSQmGoQvMftWqHhiuJmRUps+81y68Qw3eASSlmnilvbOS99MCyl97e9Dx
   y/Z/9EMl5/OYmjdayteUbdflPcbr0ZZci/8AQIP8hRizL/CsB/TK2KNaC
   atrPyyXRC7TqK+KR3ZvHsDGMVimqhUeiWEKXlLhE1tgZcXCdKsWubI8ba
   SnKJ4d5GW1j9CxSX1HnC5DUl1ozNjd3hA44XJLymKMTep4YKmfJioEVvy
   g==;
X-CSE-ConnectionGUID: H8JwbiBxRn2OlFuhY16pLg==
X-CSE-MsgGUID: DQreXhztTXGShGL/ybjBLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24275858"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="24275858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 08:19:27 -0700
X-CSE-ConnectionGUID: u3zG7jDOTxqTflRbOjvuRg==
X-CSE-MsgGUID: MggbZ93rSCGjKXuyB/RoxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65823709"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2024 08:19:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slrn0-0008Fr-1Y;
	Wed, 04 Sep 2024 15:19:22 +0000
Date: Wed, 4 Sep 2024 23:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 230/238]
 drivers/gpu/drm/apple/audio.c:212:16: error: call to undeclared function
 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202409042355.WqksqtFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   8cd704aefe491d6d33806aa46f191536e926a26f
commit: 736e62fb8d3925cd950bff001e604faed1defafc [230/238] fixup! WIP: add header test target copied from i915
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240904/202409042355.WqksqtFY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042355.WqksqtFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042355.WqksqtFY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/audio.c:17:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2258:
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
>> drivers/gpu/drm/apple/audio.c:212:16: error: call to undeclared function 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     212 |         return snd_interval_rate_bits(r, hits.rates);
         |                ^
   drivers/gpu/drm/apple/audio.c:448:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     448 |         int ret;
         |             ^
   6 warnings and 1 error generated.


vim +/snd_interval_rate_bits +212 drivers/gpu/drm/apple/audio.c

5e64cc3dc97a4d Martin Povišer 2023-02-23  201  
5e64cc3dc97a4d Martin Povišer 2023-02-23  202  static int dcpaud_rule_rate(struct snd_pcm_hw_params *params,
5e64cc3dc97a4d Martin Povišer 2023-02-23  203                               struct snd_pcm_hw_rule *rule)
5e64cc3dc97a4d Martin Povišer 2023-02-23  204  {
5e64cc3dc97a4d Martin Povišer 2023-02-23  205  	struct dcp_audio *dcpaud = rule->private;
5e64cc3dc97a4d Martin Povišer 2023-02-23  206  	struct snd_interval *r = hw_param_interval(params,
5e64cc3dc97a4d Martin Povišer 2023-02-23  207  				SNDRV_PCM_HW_PARAM_RATE);
5e64cc3dc97a4d Martin Povišer 2023-02-23  208  	struct dcp_sound_format_mask hits;
5e64cc3dc97a4d Martin Povišer 2023-02-23  209  
5e64cc3dc97a4d Martin Povišer 2023-02-23  210          dcpaud_consult_elements(dcpaud, params, &hits);
5e64cc3dc97a4d Martin Povišer 2023-02-23  211  
5e64cc3dc97a4d Martin Povišer 2023-02-23 @212          return snd_interval_rate_bits(r, hits.rates);
5e64cc3dc97a4d Martin Povišer 2023-02-23  213  }
5e64cc3dc97a4d Martin Povišer 2023-02-23  214  

:::::: The code at line 212 was first introduced by commit
:::::: 5e64cc3dc97a4d727f98515c49478ffab19b3da5 gpu: drm: apple: Add DCP audio driver

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
