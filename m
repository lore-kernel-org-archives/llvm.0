Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426524503F;
	Wed, 18 Mar 2026 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799091; cv=none; b=N9NuWpSXyfP6rwQ5JZLd8yN6HmhuJhcOLGr/RbwIGHDY8zodGXJAuthS8mIid+HOoAugFNo7plFt2IWRp1IfR26KoNmYRsI0tUZWhA4sP7hgzinoIVz8xAVTOFhkPjZNu2dKSfpbbjit7PfTHzAPqk/OFrA56N79GDju4hbldtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799091; c=relaxed/simple;
	bh=XY/nAtgLo4oHBs7VJ8JYkJBCTc59Gl0AiqBNYOOAZ4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dso5KpAi2IU3Er9Nu+bNAUul4dnfqs7ta/hoYvmE7q+miYecPlDLe/D5Ot3eJZqehehT0uQeFCCSEjhLsiN46AtfVj0V/OXHbEsGzlYY3MoYjQlrofh0HTZryfPd5QY9KveLCuYV0WvSUyE0e+Dutmz/cvLnVhU/FXW5HFs4B4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB+M1gFw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB+M1gFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773799089; x=1805335089;
  h=date:from:to:cc:subject:message-id;
  bh=XY/nAtgLo4oHBs7VJ8JYkJBCTc59Gl0AiqBNYOOAZ4I=;
  b=YB+M1gFwxlIeNMXZaCjEzi6r+tbOpEl/GY2qv5lwV0gAmwR98nwdXCc3
   mfVzL/npH/1uBhCy05+M7ShiIjiR8B48aYok0zcR2votobKD0ZcPCw6jb
   BJjikItsbcXLbiJpG99lPmduBzmq8H2aTWEgcD4IXTXA6t0rzWRXDm7vg
   DV7eD7b+sVtm/SpgSIAIgvWXEbwWNtR2dxTSTAJOrHrYrMTzoq3zvyG2A
   80rl0dxtDb7WQALyYaqUekS2uaCt7UNbdl+mKEYgF92EzsyUznosPUGdz
   JDipPyaRkf2AEQnkn3AHl0OftgjYEN9XokLe05auvdWrKFWvcLicxdZ0t
   w==;
X-CSE-ConnectionGUID: I9WtJFp3T6SDxsJf3PdQwQ==
X-CSE-MsgGUID: s0l4YhDCSwiDijSxJScv4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74731130"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74731130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:58:08 -0700
X-CSE-ConnectionGUID: O7kh/eVXSO2BQcYDmYjUaQ==
X-CSE-MsgGUID: 5lpuGFayS22+DqSlopW0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227131409"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 18:58:06 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gAd-000000002Jx-1si7;
	Wed, 18 Mar 2026 01:58:03 +0000
Date: Wed, 18 Mar 2026 09:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: 
 [broonie-ci:20260310_rf_asoc_wm_adsp_some_improvements_to_firmware_file_search
 4/10] ld.lld: error: undefined symbol: wm_adsp_event
Message-ID: <202603180936.x9mjTDg3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20260310_rf_asoc_wm_adsp_some_improvements_to_firmware_file_search
head:   8fc5c7895185d1119ae76b509892a1d14e0bd483
commit: bf2d44d07de726b0393439cb4d4defc5cf89a4fc [4/10] ASoC: wm_adsp: Add kunit test for firmware file search
config: i386-buildonly-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180936.x9mjTDg3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180936.x9mjTDg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180936.x9mjTDg3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: wm_adsp_event
   >>> referenced by cs35l56.c
   >>>               sound/soc/codecs/cs35l56.o:(cs35l56_dsp_event) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
