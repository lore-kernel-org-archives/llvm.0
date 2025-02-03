Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B51BEF81;
	Mon,  3 Feb 2025 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738566646; cv=none; b=Pgzd8SmzQNnC+4TzDQdzW18JdqiuZkL3maOyyCMu74LTWNqCkTgprrmvZcYo34fjgtNRLnAw7HAG+KBrA0bq0rEu34p3DaLnb0EWh0XNuoroS7zRGimti6zKIFIR37LW+86mWK5Ht46R4+cKSY2dRSJ6sUFNhDJ79tZWwWYRT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738566646; c=relaxed/simple;
	bh=yvK0U+VkOrkwcn3q8i6+YXlnE1xgOn25v1bjjh3zeJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDHaTpKaNJY7Y05tWZSjc1OWTiiPkwB80Id52/mF3Hmo+Wa00yc2f7TX5yCTcdKKk/41DxD/gYCfcYA+MbHFhhzBsknyfmLaWArIEQUvw9m5NFVGfRAbM69pCUfkbv5unxqKpy1UhjXzlqS83VaHO2icEJlnnLSU0pnp6YUnNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iieM9ovs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iieM9ovs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738566644; x=1770102644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvK0U+VkOrkwcn3q8i6+YXlnE1xgOn25v1bjjh3zeJY=;
  b=iieM9ovsKztmLndsP+/zdRm5a2WpxyeVMHCbMna0rFo77SN3fJnKAfWV
   NpBaQS8dwK5GC/4FvVmtiW9lfbnY8Zu8NwT6ayq7o1pDx4jUi88WNOyrW
   V1YbJ8nxRbDRYqIvKmwJ7zvlhcawInoKx8EegudbO3xOwW0+Q6DCUx/P/
   d057UhWq40zJ6HB2He+hp6+IYCMiCSlhsCpF6bxrVTTTa5z2oVIjpgdrw
   ij8Zkpc3+FidSmtS0i19fLAGs0kurrcAPLfMefeABPMJtP7yEAoX4MXCP
   Dy/uF5fwYGCdhyqDa/U/DYfEfs2rDWN6G2HUrKeWMGJwTsw8LlmO3AoKO
   Q==;
X-CSE-ConnectionGUID: OJqA1577TNafwcqddKAQEw==
X-CSE-MsgGUID: usRou6EGSM2f6uhL+H81Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42800051"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42800051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:10:43 -0800
X-CSE-ConnectionGUID: GNMgqPtDR46kaFB2bhazog==
X-CSE-MsgGUID: auZXjLjxSNq9wobOzvQx0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109973701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Feb 2025 23:10:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teqbP-000qad-2S;
	Mon, 03 Feb 2025 07:10:39 +0000
Date: Mon, 3 Feb 2025 15:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
 4/11] sound/soc/intel/avs/boards/pcm3168a.c:69:33: warning: unused variable
 'avs_pcm3168a_ops'
Message-ID: <202502031523.xMDJng2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
head:   3318c70b5b94baa4e764ab05fa97c74643e7dc35
commit: b0d1438e2006a914d55496f4a5e588ca9d3c0a6f [4/11] ASoC: Intel: avs: Add pcm3168a machine board
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502031523.xMDJng2t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031523.xMDJng2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031523.xMDJng2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/boards/pcm3168a.c:8:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
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
>> sound/soc/intel/avs/boards/pcm3168a.c:69:33: warning: unused variable 'avs_pcm3168a_ops' [-Wunused-const-variable]
      69 | static const struct snd_soc_ops avs_pcm3168a_ops = {
         |                                 ^~~~~~~~~~~~~~~~
   4 warnings generated.


vim +/avs_pcm3168a_ops +69 sound/soc/intel/avs/boards/pcm3168a.c

    68	
  > 69	static const struct snd_soc_ops avs_pcm3168a_ops = {
    70		.hw_params = avs_pcm3168a_hw_params,
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
