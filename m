Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386D39A077;
	Tue, 12 May 2026 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778623872; cv=none; b=O/MfH5vBxBLGGWxlx0xrYMHydjNcxc32t28pQ7qI62p37qV8f/b69CheY7O7RI9TpD8348R+K33TbTcanjSiNG1mqF7kufcdl1HTxmu655/roWQUZzR7cxplzBxTw8vP/TaTPFbX/oof4g0ft8v1S0VB6tq8GGDCP2SUHtb5ERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778623872; c=relaxed/simple;
	bh=tVHXidQIm3ayay9bioivE8nDcfw5nCmgPp6pjLdQm9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZibzfO9pCPayEyXW7sEfxo0oY+3OyT7Uc4fy77woh9XABkDMAaU87idgd7uyZtXZ0qxrcLcrAiEA1Fdz/mme7MHPcbR0f5qWrsAJSQYPQMJTogkD/j1n0DpeTGGaErAc5KCC/S522XZViDfl1cs2DUwb5le5DssaMAOClBKiDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m14NSI6k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m14NSI6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778623871; x=1810159871;
  h=date:from:to:cc:subject:message-id;
  bh=tVHXidQIm3ayay9bioivE8nDcfw5nCmgPp6pjLdQm9U=;
  b=m14NSI6kLwfKHUWYHG1r9v5bVtmoKv+CLMl0M6AZ0jyscJgkBjPXpHee
   VcNMEoplm6/FynrdHtUuh302ZvisReFKNbpB3eK/ayI++VXNVgl3Vhg+t
   9nEHXOS1uwjRND+rL4bkvHuGPDGdiaytEvCtvXS2Kg9DrW5oOB5vFe/KW
   fou2ScaEDDtZgL9H69y+tUBb8wksB5i4clZibSE7ey1j1coTkVi2lbQFr
   V4FRjn75cl9eEvEiCISGYt/yzXFrsmohQVhwbOQH8VbWyCYWEULME9TTf
   +r5optDQPW11kdiU7Eg9utjaLnZCsw6R3xGuteVNQqo8CDIka7UPfTy89
   A==;
X-CSE-ConnectionGUID: 7iT+/zlURLGNZ2uP5iVL0g==
X-CSE-MsgGUID: CmDf/MvWRmiuZHCLG6qN/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79494709"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79494709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 15:11:10 -0700
X-CSE-ConnectionGUID: A+44K5KMSAWB28wgrFu5gA==
X-CSE-MsgGUID: lZjXXmosSPOLaKWzLLE9OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237984921"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2026 15:11:09 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMvJi-000000002tK-0zl7;
	Tue, 12 May 2026 22:11:06 +0000
Date: Wed, 13 May 2026 06:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:debug_hc_died_cmdring_race 1/1] error: return
 address can only be determined for the current frame
Message-ID: <202605130633.DtGzO2sj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git debug_hc_died_cmdring_race
head:   c7d4dfa22bd8c114d3899f9d4105f470d569fd8d
commit: c7d4dfa22bd8c114d3899f9d4105f470d569fd8d [1/1] xhci: add code to debug commad queue and suspend race
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260513/202605130633.DtGzO2sj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130633.DtGzO2sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130633.DtGzO2sj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: return address can only be determined for the current frame
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
