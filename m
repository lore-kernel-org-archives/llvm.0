Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92D45948;
	Tue,  9 Jul 2024 05:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720503489; cv=none; b=j/upgyReAJOuOCIMasImneLjs0wtjERO+x+5ud3TZcYMOHTkCq2AbOl8sSKsFABaJW8kK8UZaWteWj4xkWsDgUS3GFHsAYc6XYfPqP9tMy2tmBUbcRqa+oh7zNBoZbt6A3EpJx608DWTIaG+a0GdTRh2A2OQdcl2FKQrM88sgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720503489; c=relaxed/simple;
	bh=nPDHhRrt/iTGrBveipGn7jTYvOBrqt5YqqlhOaEFfJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOiIerX62HH9XvYXBs3ksk4PSL+QdQayhu/trcmRJHoH2JH1jGd0qQAecpwgb2v+wIdq7oA4Y2eUpFsLkPECpITuAB3wfBds05/TV05BzsMwdAyWHbrMJQ9bkvjgaffZBJgykfk07FvVtFZNDiLVb+T7mJkBAzq+iJGor+2CXIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URYGldn3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URYGldn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720503486; x=1752039486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPDHhRrt/iTGrBveipGn7jTYvOBrqt5YqqlhOaEFfJ4=;
  b=URYGldn3qtydI+gT3HD7oOWlm6BPPSxZKF93pls3KKE5kgAs0Ve8bX6W
   QlT+BmhIr3aDjYkZXGS1vDCLaELFocnITxz85SFcQqp/EHJKX7KY+v2lT
   TM9zipiGJuocyB2L9eixplUCmUyGue+eFciWp0WiRYzRoXDMtc64CCYxs
   mZPLEFukajMVIiu+HnQrc1Cg9kAe+PcgfAlsiuuFi8j2a55viBNvVW364
   UrI4FjOl6VJ+yvgX7BOJ/7tTB+ED5libAII/QuspyDFt1M/aMWyXQ2xt2
   L6trpLBEaW/xurpsaZTtwZXburifqXPHore6f4PCWw+xG2+d9LmOFzPQH
   A==;
X-CSE-ConnectionGUID: b52LCLt+SRu8fKd9ao/mZw==
X-CSE-MsgGUID: IA2/sNpMS1mjmD4O/zlAWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40243772"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="40243772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 22:38:06 -0700
X-CSE-ConnectionGUID: n5KfivZ7SteUsuQf6RDKyw==
X-CSE-MsgGUID: vkruCqX2QsqcYF/V2MATCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="52670882"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2024 22:38:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR3YA-000WMA-2R;
	Tue, 09 Jul 2024 05:38:02 +0000
Date: Tue, 9 Jul 2024 13:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 15/17]
 arch/arm/boot/dts/xilinx/zynq-zed.dts:116:10: fatal error:
 'adi-fmcomms1.dtsi' file not found
Message-ID: <202407091321.o2rmotVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: 813decf00f69c8e38c0b78cbd93c9a2b332c8bdf [15/17] fixup! Out of tree stuff to test the ad9467 FMC
config: arm-randconfig-003-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091321.o2rmotVL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091321.o2rmotVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091321.o2rmotVL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/boot/dts/xilinx/zynq-zed.dts:116:10: fatal error: 'adi-fmcomms1.dtsi' file not found
     116 | #include "adi-fmcomms1.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +116 arch/arm/boot/dts/xilinx/zynq-zed.dts

   112	
   113	
   114	#define fmc_spi spi0
   115	//#include "adi-ad9467-fmc-250ebz.dtsi"
 > 116	#include "adi-fmcomms1.dtsi"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
