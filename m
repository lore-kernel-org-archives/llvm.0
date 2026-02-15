Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F4E2BFC70;
	Sun, 15 Feb 2026 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142802; cv=none; b=MBta8E7bjktePBYLZkSfxDMejECfxZRIzwaTwO7Tua2YM+p7VYWmRClEVjbhqNvatjKsmRefiTGHoGM1lEL7rdBHn1AfouJ4vjcoYEfATKZgagPm2Wfg+yWHd0bCWVPQW0VdisiwO5iTKygES1FUfXr1GKEda+vOJjlV53E3VGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142802; c=relaxed/simple;
	bh=p6R3JVBLNb0ojIrogFJy7HIPbbNisRsA5mnD73hgqGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCu4b2pZg0BmVy7cgi7dU03GVJjzbjUivl/I2WIk8b082Val65wZ4hBd8hOfRbkglpyTmcNHm6Mo66QoMp2kUjH5VfOZPtg+CRAtIiR68i+P3oJtq+G8kz/PTrEwNFpD0TQR06Ux7tD2S68DJTOLrWrdTvx/Rekha0dwdWmKbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWu7DySV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWu7DySV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771142800; x=1802678800;
  h=date:from:to:cc:subject:message-id;
  bh=p6R3JVBLNb0ojIrogFJy7HIPbbNisRsA5mnD73hgqGU=;
  b=VWu7DySVElPJzgkuFhjCZShENw6cBscQ3aYGk+YVBedWXD0vPjqiOsMu
   mKrW8w/FHaru/Kd5Cpasg7+lfnkrARxnQu07a2o1Ru2mH0r3cAKS9tIrV
   M6hQLQLs+HxBOudl91/lm9vZTP+6Ftw4C3Z9qywTREAvI3hj40cqLXzXI
   29Qu1pvoRdmAj1Q5nrT26rJ50eNl7P/Q6af90Hl8awmeybYBFFNMqSjKO
   lfamS5s4Xa3bRksinOMcXXcm0OoAXxNaV5kDKYQ0r4PmN+KeTwp9PMFwU
   KD2RSYEIGJNkGPtmofqhhF8GCHYJP13QKIYFXo0TmPWJbKH+XhIfP0G+5
   A==;
X-CSE-ConnectionGUID: xcEL/N8JR7ip8PA8oy7FhQ==
X-CSE-MsgGUID: ojdsWgCbS6+Pak7Jylkjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="97724476"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="97724476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 00:06:39 -0800
X-CSE-ConnectionGUID: pKczbN4zR9610woB+bCvBQ==
X-CSE-MsgGUID: Sl7GheIqTFebOh8vgXU07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212669023"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 00:06:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrX9H-00000000xyi-0LqB;
	Sun, 15 Feb 2026 08:06:35 +0000
Date: Sun, 15 Feb 2026 16:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/38] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
Message-ID: <202602151652.3Nbyb3P5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   ed0968ffeee877f8f95703933ab1aca99c643408
commit: 82fd67081b4abe26c915c0b2f6908465047a9a85 [20/38] hexagon: update build system and Kconfig
config: hexagon-randconfig-002-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151652.3Nbyb3P5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151652.3Nbyb3P5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151652.3Nbyb3P5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
