Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D524C62;
	Wed, 14 May 2025 05:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747202092; cv=none; b=P/B3blahje9RPQZiFfQqqNgTV7XSGJM1ntVvKOXfkSkkGol25ClsQvQhL7VIfuqh96nqHfoRJoeZdJ48pGV1QCuEwSoFpVgpAB8j75zS3RYTjjcBA1dZUAXQyRsxUXBUBBdSjIk1vXwdjo05J+MpcDEHDMxf3s5Hz8FwaB+dFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747202092; c=relaxed/simple;
	bh=tA6VLacgF+WQafwEVjWU7WAuXNTrgKDKB3mBxBBMv5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIn61sp6y0/EbPZDk74mtBmbDwOXoJ8nQRI7Xpa7dRm95twpIu67GCgg4acryii4iz1tf06PrXFouujy7GALqQWnkVPmyISc0/w0a9svZvj+uqQSb/O7X1WXvsuWeCu+M9L+e1Yu4JgpigtsW5C7X+KVRJkdzH86tl9jPKVKI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfiFzNjG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfiFzNjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747202090; x=1778738090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tA6VLacgF+WQafwEVjWU7WAuXNTrgKDKB3mBxBBMv5I=;
  b=PfiFzNjGYvtqAXAXeBY9U1ZFZ/q6pOLKu8tOHHRHN8O7AaaOSTU+5Yz0
   dg6FpsmUICrdM6ccrAzaWbfiFur0QSe7h/gS61sO4ASGmDyvK+8uwu6sd
   o1LcWKEvmyHGehPLyZPkK3SL+vG8GERS0Hw75i8MNM7OkKOR9Q6nVRdzs
   vOFLhCQIxjBaF6rlzWizjMCcNN4pas8Byzo/3Hbemhz72iMsgysxNaVNQ
   d0qb5ZK8XZ07Y2q8TDSQUIfEbEqRsoJs295W/kszsf6KvQYVShjSUcGKs
   BrUeVB6iLNPa90FzWdMahQa3y2T3KXLWzk4Xy4pfuakkQ/EOC+x4NdvIs
   w==;
X-CSE-ConnectionGUID: zUgdV4RkRGunLbdIJNfpoA==
X-CSE-MsgGUID: +Q7CQDYtQSqGDpuPefc+KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59710514"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="59710514"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 22:54:49 -0700
X-CSE-ConnectionGUID: Ll0uSBygQzK8vqFSR3aPwQ==
X-CSE-MsgGUID: M+4T2nz6QmGABo13htJVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="137978599"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2025 22:54:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF54o-000Gj1-0C;
	Wed, 14 May 2025 05:54:46 +0000
Date: Wed, 14 May 2025 13:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@intel.com>
Subject: [thesofproject:topic/sof-dev 8/8] ld.lld: error: duplicate symbol:
 adsp_clock_on
Message-ID: <202505141332.4EDZr2b3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aary,

FYI, the error/warning still remains.

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   12a92590ea0b31e63bfa88f0354137ef939ee397
commit: f7978ee0239f435e07135fb50cd3ab6842f1f628 [8/8] ASoC: SOF: mediatek: Add mt8365 support
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250514/202505141332.4EDZr2b3-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141332.4EDZr2b3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141332.4EDZr2b3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: adsp_clock_on
   >>> defined at mt8195-clk.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(adsp_clock_on) in archive vmlinux.a
   >>> defined at mt8365-clk.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x586) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: adsp_clock_off
   >>> defined at mt8195-clk.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(adsp_clock_off) in archive vmlinux.a
   >>> defined at mt8365-clk.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x1106) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sof_hifixdsp_boot_sequence
   >>> defined at mt8195-loader.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_boot_sequence) in archive vmlinux.a
   >>> defined at mt8365-loader.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0x44) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sof_hifixdsp_shutdown
   >>> defined at mt8195-loader.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_shutdown) in archive vmlinux.a
   >>> defined at mt8365-loader.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0x370) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
