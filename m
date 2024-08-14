Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0E39879;
	Wed, 14 Aug 2024 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723612129; cv=none; b=qFuEpRwGJB3FO0xUGPQmyiPgQkarzoi7rOZ/cgeG3KYzdACacS+rPiyGAHgEO9MtdtXEP97yPIQi7D4J0Nd1Hd23t1Ur2N1XWgcBsO5wvyKTo7DLw3i68+3lVGeQeGmQh1CNchhKYKQMj28xjgpU4nBDGqGffDngq17FK2PH5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723612129; c=relaxed/simple;
	bh=6N5QlFLhTSmeA3YBj5h392m3kLmfqE4/MBjB/1rI2eg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwW8a3ZX/FEPNSS1UkaSAwnMmhVYR9ZazT3ehydFpYrwJfrmRWwSrJcZNKlsjwUCK6J3uqMcbAs/Xu+F5LiEGTcOFADRsIYiNL4X+m3QISLN3Rn6wUUOeOJ1DSWFiLDLZ+e3BEpsrhlUm8m16w/gPZtTHZiwciTEhgvciRqEGgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms+/MuTw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms+/MuTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723612127; x=1755148127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6N5QlFLhTSmeA3YBj5h392m3kLmfqE4/MBjB/1rI2eg=;
  b=ms+/MuTwUUK8LXCEebN5xLpyUpXeRRazPovIx0jy7nTkcP/uoVIaH57O
   75ZpWRcLr8bG4VZJUqT92suOyvtkPrmXrZRdWkl7D6F6YQ0crXlNEi5Fg
   wFebeWlrkW8MrUoQ79/urWr1bAnSFg2IH+dHKoEyYJPeku4mINv3gaSSY
   ta3wAPuxf14DrsGreAyPCXw9WjFWrLmYDIHymGpScxCGOvHgX7L0mGUcU
   rHIX+shAov3stVg7GE6jUt9iDjO6a1aOD140PPn+ixQYUV/Y09JKYP6cc
   EDB9jhiwNG80Cz4sXgWSmwnp37nnnciNDgZ5/WeERXuodS766lbSXxPVN
   A==;
X-CSE-ConnectionGUID: g/r2wqy4RaiM1G5XlMRU6Q==
X-CSE-MsgGUID: wzELBU+kT/ud0p+RreMvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32485799"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="32485799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 22:08:46 -0700
X-CSE-ConnectionGUID: OSrffqCUTay8/TxkttNSMg==
X-CSE-MsgGUID: eXv/hiq+SDGCnor9C1A1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="63046731"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2024 22:08:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se6FW-0001B4-0S;
	Wed, 14 Aug 2024 05:08:42 +0000
Date: Wed, 14 Aug 2024 13:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [tiwai-sound:for-linus 2/7] ld.lld: error: undefined symbol:
 i2c_acpi_client_count
Message-ID: <202408141333.gYnaitcV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   8475a1d9bb7acf1cb15842dd24baab0e8ea4e4ff
commit: 03c5c350e38d9346b69357d0e52c3c40495c14a0 [2/7] ALSA: hda/realtek: Add support for new HP G12 laptops
config: i386-randconfig-013-20240811 (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141333.gYnaitcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_acpi_client_count
   >>> referenced by patch_realtek.c:6891 (sound/pci/hda/patch_realtek.c:6891)
   >>>               sound/pci/hda/patch_realtek.o:(cs35lxx_autodet_fixup) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
