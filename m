Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515BAF9E6;
	Sun,  2 Mar 2025 02:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883920; cv=none; b=tb+JTQ+GOTnNCJ5O9c9pGRwYrdw4cxnFPKSB6GeMLyQn20XLNCeOtDiE1Dkm3ZjNrgOMVAeRFs8kNjd9iwIELXTQuM3TITyUm8/TbQcPZtmwbCFLjqIo9vnOlgGC3I6OhO3iPOfGySQWB4itIVIwMrRSiR/ghNu1EgxhVJZHZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883920; c=relaxed/simple;
	bh=2ZTZrLBJ64BP9BxeOo9FESDFabc34mUR2kkCiWJcyz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKrK7tfXIbxD7r/RE7B81yyYmM+2vRI1mkn85QQ0+G7fTUWTtUEYDSJBSf5CCJAiZw+JoxZK7+6oHmpfp+VL8lE6E29wzV7wSgxN7i7c8tel+Zk7vC0xGmOnpQ41JcqIHnIp7tKOcZLtDNXE5sbJdmHHlBxxzCWIOBdGRho6vt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNKlzbb1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNKlzbb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740883918; x=1772419918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ZTZrLBJ64BP9BxeOo9FESDFabc34mUR2kkCiWJcyz8=;
  b=gNKlzbb1vRlBJxxG2H+TQeODdQM4MO6gvR06cVKPLOpXzq2zqrNtOzBK
   zzn3xGHaN236QMv/dJlpVnFDAbJKIMgSAje08wC8QG6xEErv6Kdo2gDCv
   HXwbarkPjEYNxgVzp3AV3D/Ba2smOkUEKND5Es9aiMEx4V7ylvSHzsNfY
   CiWlDtGhy059aROoC5M6rCiGNNpbW+JuX9FAKDJ2cuOE0Wr9Le/bBYYKA
   YVTxGsBPi/eINkiLe9euXpGslWXBjEHkGq9++GbNNLDla9bYp1PfZ3I6q
   nV32H1EWJeeSaH+SjXiBYHduzQqIArL1Bqg1/etKBfvkgHwnF+VpMbB7V
   A==;
X-CSE-ConnectionGUID: BqaJeC7/SbKm/3/Rd8LslQ==
X-CSE-MsgGUID: ZavNS5YMTQCuo29aONgUIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41902480"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41902480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:51:56 -0800
X-CSE-ConnectionGUID: zEPiC1zSRzSf1YGUeHCztw==
X-CSE-MsgGUID: pztk+zy9Ti29UD7qF35NKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122822377"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2025 18:51:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toZQh-000Gys-1J;
	Sun, 02 Mar 2025 02:51:47 +0000
Date: Sun, 2 Mar 2025 10:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 18/18] bitops: Add parity() macro for automatic
 type-based selection
Message-ID: <202503021043.2qaG7vXF-lkp@intel.com>
References: <20250301142409.2513835-19-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301142409.2513835-19-visitorckw@gmail.com>

Hi Kuan-Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250228]
[cannot apply to akpm-mm/mm-nonmm-unstable dtor-input/next dtor-input/for-linus tty/tty-testing tty/tty-next tty/tty-linus wireless-next/main wireless/main mtd/mtd/next mtd/mtd/fixes linus/master v6.14-rc4 v6.14-rc3 v6.14-rc2 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-parity-Add-__builtin_parity-fallback-implementations/20250301-222957
base:   next-20250228
patch link:    https://lore.kernel.org/r/20250301142409.2513835-19-visitorckw%40gmail.com
patch subject: [PATCH v2 18/18] bitops: Add parity() macro for automatic type-based selection
config: x86_64-buildonly-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021043.2qaG7vXF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021043.2qaG7vXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021043.2qaG7vXF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:13:
   In file included from include/drm/bridge/dw_hdmi.h:9:
   In file included from include/sound/hdmi-codec.h:16:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:493:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     493 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     494 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:513:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     513 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     514 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:173:12: error: expected identifier or '('
     173 | static u32 parity(u32 sample)
         |            ^
   include/linux/bitops.h:343:2: note: expanded from macro 'parity'
     343 | ({                                      \
         |  ^
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:173:12: error: expected ')'
   include/linux/bitops.h:343:2: note: expanded from macro 'parity'
     343 | ({                                      \
         |  ^
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:173:12: note: to match this '('
   include/linux/bitops.h:342:23: note: expanded from macro 'parity'
     342 | #define parity(val)                     \
         |                                         ^
   4 warnings and 2 errors generated.


vim +173 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c

7ed6c665e19d4c drivers/gpu/drm/bridge/dw_hdmi-ahb-audio.c          Russell King  2013-11-07  172  
7ed6c665e19d4c drivers/gpu/drm/bridge/dw_hdmi-ahb-audio.c          Russell King  2013-11-07 @173  static u32 parity(u32 sample)
7ed6c665e19d4c drivers/gpu/drm/bridge/dw_hdmi-ahb-audio.c          Russell King  2013-11-07  174  {
251332255cc5da drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c Kuan-Wei Chiu 2025-03-01  175  	return parity32(sample) << 27;
7ed6c665e19d4c drivers/gpu/drm/bridge/dw_hdmi-ahb-audio.c          Russell King  2013-11-07  176  }
7ed6c665e19d4c drivers/gpu/drm/bridge/dw_hdmi-ahb-audio.c          Russell King  2013-11-07  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
