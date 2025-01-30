Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12011A8F7A;
	Thu, 30 Jan 2025 20:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738270076; cv=none; b=oD43Huq3ABXmtKiUVhtaBQTJnFu027tX7MzDa7Jz+pDjbl6YNq9pPEMDOyYxdqCrW8bSirrZx6C/bDXdNWKZcpfKqa5h/WE8iiurBZR7RDX5N4ToUfZZA7kribnXjb1dHT4yA9bVZ5VCwzJgI1RfY61xIu+tsbK8BmKOxoEHnLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738270076; c=relaxed/simple;
	bh=2XshESbqXkzZH7+KIay99Y3Ub9fMreMGdOi+NSRZPfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5G+aRp0GviB9ujor48nHW3Yp7BlRfPSGa/DmhM3KgGrHzR4dtssjhM6iJrqKKnlXyxz8nGjLANqdPV6tGSLRa3qxDCm0o2LH3c2iqdo2e6d2pb0ZdZGQkSJr6o3GakN8lFdwQ7ib3aY2mkgRGYeAOjX4qfYJSCKyA+gyGSRZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHFef/l6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHFef/l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738270074; x=1769806074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2XshESbqXkzZH7+KIay99Y3Ub9fMreMGdOi+NSRZPfI=;
  b=XHFef/l6zPqGvaE+Mpcm5gT+oepdzkvuE9Dna8by8CpIp5X78j7gjrGb
   wQrMdtVdvwJ8oaS3Jl3Uf4LMiXP8tgnst7CsXNeSfVeNyWveXQl6iKBzP
   YsVCbpJT3GIBHkPyH0yl12PUjQ4a5t7ucHW1lC62MiS/FhnadSAMp+g2U
   dUmwg8jCqDP4qswkZ2alg/j65NzTI5ju77jN/pa5IP9TPqyUl5VErKHoY
   vWgvFJwcTfz+kWPpkiJ0Z0O1U7Z9ME4F4YMGEfI/HEJQ6EfSoYeuSiCNM
   iSxqeA56rZHbHQCMIoX/jKAr5epD79hG7uHCzQ+mFAjGi7d7pVyi18bKP
   A==;
X-CSE-ConnectionGUID: GTA5F3nMTZGZPy8BHdvo0A==
X-CSE-MsgGUID: 999mLZZBQr6reiz2DojBfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64200083"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="64200083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 12:47:54 -0800
X-CSE-ConnectionGUID: kn0rzrFyS4O7U8BLGrhW2Q==
X-CSE-MsgGUID: FTNAsj9MTJmT43XqftiW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="109587772"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2025 12:47:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdbS2-000kxP-2A;
	Thu, 30 Jan 2025 20:47:50 +0000
Date: Fri, 31 Jan 2025 04:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2025-01-30 2/2]
 sound/soc/renesas/rcar/msiof.c:356:2: warning: label at end of compound
 statement is a C23 extension
Message-ID: <202501310440.yBsUyEuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-01-30
head:   d9a82c93cca8d2f5381062d77bbab0736dd6dc5b
commit: d9a82c93cca8d2f5381062d77bbab0736dd6dc5b [2/2] msiof
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250131/202501310440.yBsUyEuq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310440.yBsUyEuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310440.yBsUyEuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/renesas/rcar/msiof.c:19:
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
>> sound/soc/renesas/rcar/msiof.c:356:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     356 |         }
         |         ^
   4 warnings generated.


vim +356 sound/soc/renesas/rcar/msiof.c

   332	
   333	static int msiof_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
   334	{
   335		struct msiof_priv *priv = snd_soc_dai_get_drvdata(dai);
   336	
   337		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
   338		case SND_SOC_DAIFMT_BP_FP:
   339			priv->is_provider = 1;
   340			break;
   341		case SND_SOC_DAIFMT_BC_FC:
   342			priv->is_provider = 0;
   343			break;
   344		default:
   345			return -EINVAL;
   346		}
   347	
   348		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   349		case SND_SOC_DAIFMT_NB_IF:
   350		case SND_SOC_DAIFMT_IB_NF:
   351		case SND_SOC_DAIFMT_IB_IF:
   352			return -EINVAL;
   353		/* it supports NB_NF only */
   354		case SND_SOC_DAIFMT_NB_NF:
   355		default:
 > 356		}
   357	
   358		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   359		case SND_SOC_DAIFMT_I2S:
   360			priv->need_delay = 1;
   361			break;
   362		case SND_SOC_DAIFMT_LEFT_J:
   363			priv->need_delay = 0;
   364			break;
   365		default:
   366			return -EINVAL;
   367		}
   368	
   369		return 0;
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
