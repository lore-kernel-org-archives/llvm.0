Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A99208AD;
	Sat, 12 Apr 2025 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744429829; cv=none; b=J5VwQIfTlQuthIQuHbPSu3U0K2bfbPxPSged6bNPUvDnC1+ISn6LerHRCqdOBy+4Zg9ivDasBoiAlT5ZIJSQZ1vNNu5z9Mvg/laPrS/dAKhVVGapG/3SLMRhmofZ7p/iaQcnnlB0eaujqqSrRUvIjt0tMIbJ5GXjZdp9MBiDlFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744429829; c=relaxed/simple;
	bh=GDXRI427vQqYZ9FLsR2hNcwSFuMzJZrRZV4pvtLdJDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+upNcdCzlmdpq1vQYCWmi3FKVyDcbGLdth+gxTf5QPT09I/njbehdIW4hWSjG3BCmIUfAg2TdN2AF0L1M35a2/X34kSGAKe+d7uUg3rZYolbeWvWyf0eaQTgiLIdzx6y6Zf+WmeBynQX4dLetl6YbS0RZ3GUgCwD7uV2x9qbwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHwf3+rF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHwf3+rF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744429827; x=1775965827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDXRI427vQqYZ9FLsR2hNcwSFuMzJZrRZV4pvtLdJDg=;
  b=KHwf3+rFCHGJGMea0cNdbf6Mr8NHIPV2xgSHAwGcO4zow31wodUgoiRp
   KxFm4UF6qkGHf2sljTrvBqjYjN8bd07PzoqEBV5jpoiK5G9Wr31RQBJrF
   bQLiqfgkXlcw2ORbui3g+UnSN9stbZduWGgQNXQaYZ9rtl4cfd0wJrMFh
   wzKygwQj0VKAT37rcwGsoCDK7E7s6oZvUummSsEzgsu+mWO6a/5yIOL7m
   qmNWuOzUVaK/l1i46IlCxDRAzWGs5BQGye6zzDNtXlzzJGN242xjadbXQ
   mIkuCeTYdHZj5ZSPEUmAK2jlSqizs1vJEruWGwtm+CZHhjyD/7cd+PT3u
   A==;
X-CSE-ConnectionGUID: c65Lnff9Q1OGEJQqmF6HLw==
X-CSE-MsgGUID: 05QrwBaJRTmSWivoxbf74g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56165979"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="56165979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 20:50:27 -0700
X-CSE-ConnectionGUID: pExvMESORweUfcrQVqFwRg==
X-CSE-MsgGUID: AbnTyrZ9TMKo5ry18kfBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="160329390"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2025 20:50:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Rst-000BYU-1j;
	Sat, 12 Apr 2025 03:50:23 +0000
Date: Sat, 12 Apr 2025 11:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@intel.com>
Subject: [thesofproject:topic/sof-dev 8/8] ld.lld: error: duplicate symbol:
 adsp_clock_on
Message-ID: <202504121131.5hLC8EyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   f7978ee0239f435e07135fb50cd3ab6842f1f628
commit: f7978ee0239f435e07135fb50cd3ab6842f1f628 [8/8] ASoC: SOF: mediatek: Add mt8365 support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250412/202504121131.5hLC8EyX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121131.5hLC8EyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121131.5hLC8EyX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: adsp_clock_on
   >>> defined at mt8195-clk.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(adsp_clock_on) in archive vmlinux.a
   >>> defined at mt8365-clk.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x1a0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: adsp_clock_off
   >>> defined at mt8195-clk.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(adsp_clock_off) in archive vmlinux.a
   >>> defined at mt8365-clk.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x710) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sof_hifixdsp_boot_sequence
   >>> defined at mt8195-loader.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_boot_sequence) in archive vmlinux.a
   >>> defined at mt8365-loader.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: sof_hifixdsp_shutdown
   >>> defined at mt8195-loader.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(sof_hifixdsp_shutdown) in archive vmlinux.a
   >>> defined at mt8365-loader.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0xc0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
