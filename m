Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E107B176227;
	Fri, 26 Jul 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721991951; cv=none; b=Y2EcvcG9/GYMrZJ+X0+lPq51Lg5h/sPh4p6BF5vpsIHdZZGYOjgWjbSl/MujyfXlpA4RpAU1EZEot7Vs7k5rNpQ1d+zS6/ATHIJqD22htXYs7C6dbDlfbGsu5MyhFzUirmGizWDwCowlU29Lby3XHiBkEtG4prO0NNnqP3SaAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721991951; c=relaxed/simple;
	bh=7kUuRX80myzHhizwNNPBWLJ0LaYLDYiepzPiI/XZiu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIj3X5NybodmgaItYIEly9U+XkSEuWuffgrLSZ9ZULt/Goe8yOyo6DLdLnFM5TbtdzFrnkfel/r6W2cGBQVAzR+hKXKeegX2kp7rSoA62mEEX5E18X7sKcpxryD50dI2htyCgIiHqQq9vXu7vbzpB92+0KaOb9JU5+GyUAiqM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ch0OUsTD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ch0OUsTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721991950; x=1753527950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7kUuRX80myzHhizwNNPBWLJ0LaYLDYiepzPiI/XZiu4=;
  b=ch0OUsTDHFcpZcW1sCZdpH8LFJgCtQlrBogha+ErTR6CX/prMVQFiJkZ
   GcHO8GW9Wpv3HLggyusbUkUyrXgEP7q2PkV3N2njmsemvbSYkMLUL61G6
   eUcYQ+cRR7VrQ76LExKExIwtIG2VAafIONfAjSG5+WpO/cTVArJgelc0V
   qiHiYzKXl4gu99dN/d7/D1OHXpPFPeW+C2V8682fTv2OUL9gjl1zFK0sn
   AWepx8J8r5SqkTaS/7akdUv091/r19MElevJZkyeMa8Zc/KGtE35oPyt8
   TQL8nRFM7OLCPGqZIPRMk/7aYOsDefdJo/KYWjzS91acME6DquA4z1ZFc
   A==;
X-CSE-ConnectionGUID: 3MjOhUClSJKM7IswUxcEsA==
X-CSE-MsgGUID: pmYhAWHPRsioJG4cltN9cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23538101"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="23538101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 04:05:49 -0700
X-CSE-ConnectionGUID: s0wt+0LeTRiVGyryrvuHAg==
X-CSE-MsgGUID: uUqBvYtiQ+m8Tu0RNepA/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53463000"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jul 2024 04:05:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXIld-000p1Y-2q;
	Fri, 26 Jul 2024 11:05:45 +0000
Date: Fri, 26 Jul 2024 19:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-hash-rfcv1 8/10] WARNING: modpost: vmlinux:
 section mismatch in reference: htab_bolt_mapping+0x5fc (section: .text) ->
 hash_kfence_add_slot (section: .init.text)
Message-ID: <202407261926.HcVRPugo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-hash-rfcv1
head:   ab870b7bbabf70b4c07abf9163a509fbfaa79fe4
commit: a6abdbc7601fc172b2b07366f935771a2d02f284 [8/10] book3s64/hash: Add kfence functionality
config: powerpc64-randconfig-003-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261926.HcVRPugo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261926.HcVRPugo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261926.HcVRPugo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: htab_bolt_mapping+0x5fc (section: .text) -> hash_kfence_add_slot (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
