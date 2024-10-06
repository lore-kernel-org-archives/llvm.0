Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A29184F;
	Sun,  6 Oct 2024 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728215059; cv=none; b=tPebv5bIp0E4jE1vCE9UnqOyrqTv79aDJm5fycllTwCSbkFJtL+gMDT/DcJ6XJ5l2/cuH28N0oo8xjlIC70hlKlzmr+rPlm8KlelKcdUu5rGmXCaBpjTnW35CWUhu0FAdRK4kN0dLdNQcgMn5N04SDMS7rTaHGQguTU7ZP3g2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728215059; c=relaxed/simple;
	bh=uzFj4uQXPB7fEDtMPoAI/HcotRPELA9KF+Mz+IoLZnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8bcl3tNnXtwtSA21nXfiRxd98RiM8btRp+70REUdTveuXFZhCf84CAcBwLuCjjDmAuiOaW9egD6aZvmXL3aIK3rsnPz7Am0FpI/cPxh66mCtASDLXN2i0wxNIkaw6spC9ftkxzc9e+sF4L/Pp0rpsj/+JSuFOmMcy1oq5abWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCZ59pig; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCZ59pig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728215058; x=1759751058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzFj4uQXPB7fEDtMPoAI/HcotRPELA9KF+Mz+IoLZnY=;
  b=FCZ59pigmtDDMffyQyWT9KWOQUEWqAgWAdsADcJUPzI4joBF5bSoah/J
   U44tSGkltZywbbt8EEdEA+nPxCmrsE007UIfsYi5+jA1bDgBgmsGiUqJZ
   2tU1JzccqvWmymmfLAq+fH3ZFYEayfoWJlpruY2C/XrT0Cjo9r3MWuvPO
   lKyakz2CfBDEtM0qhoRTtb98srzMBP82ehE2foqEKDl1RU/qTL0ynInY0
   AG7jv93XpsCU5NvQqOVwfulXo+/h3YtVFUrrx5ZZsKAchos53FhlLRKFc
   d5S4gY3wTAQBECazGjyO6GYAxd2Lq3Y+z+M8D6JV9Y41pGjQNEsvuQk0c
   g==;
X-CSE-ConnectionGUID: 9kIb3JqyQtaFPauRMP0iuA==
X-CSE-MsgGUID: i5EEOMqwQ3W66YzYDg9Lsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="30258127"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="30258127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 04:44:17 -0700
X-CSE-ConnectionGUID: jub8W5LHQseFdnekDSld5Q==
X-CSE-MsgGUID: wRy8c8WSSp6DT7WgygaoUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75019638"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Oct 2024 04:44:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxPgI-0003oW-2j;
	Sun, 06 Oct 2024 11:44:10 +0000
Date: Sun, 6 Oct 2024 19:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.6.53-2024-10-02 164/306] ERROR: Input tree
 has errors, aborting (use -f to force output)
Message-ID: <202410061908.Lm8VNLVk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.53-2024-10-02
head:   ff705f5bf8a9ed4ebcfed1a104896aba101f914e
commit: 98986fae4eeddc6ec59408071ba7a579dee12655 [164/306] arm64: dts: renesas: r9a07g043: Move interrupt-parent property to common DTSI
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410061908.Lm8VNLVk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061908.Lm8VNLVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061908.Lm8VNLVk-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smarc-som.dtsi:139.10-231.3
   also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smarc-pinfunction.dtsi:11.10-132.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
