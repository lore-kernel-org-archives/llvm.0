Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6C19BA6;
	Tue, 26 Nov 2024 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732587505; cv=none; b=GEQXo5qF9Jk7AimppEtMru8mVnaUWu7rhIEk81IVdkQuEYtQd/VdtSYptUS2JKnYtcJNffbWxASk9gyhW+t1nrpE7EXsneQLLMOA1XsIDWcAAmyMOcHly1zTyzXCzjDG+Ny+8SFAhya8Bq5iMDqEAVVBCYqFP84X/3QG/KphUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732587505; c=relaxed/simple;
	bh=ctuU+IjIApE2Mddiarw//xwfi7b45yJSKCJtMQfYj5k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhXLHHBm5hoSaAsPnHcLltS5wzU/hX7tgrp8bWTuYx0pFH+1zTdg7oQL9Qtmou+z12loiRiIbJEtUh5cQNzTpnsmMNh/MxpDMYj87Fhpg5lNEzJ74vq/EgZWm0eSk5JT5LGWjupTbQnyLjBlpRZdr6aawAxSMpcxuhd20F28jgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZ5MWzsg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZ5MWzsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732587504; x=1764123504;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ctuU+IjIApE2Mddiarw//xwfi7b45yJSKCJtMQfYj5k=;
  b=ZZ5MWzsgHYbkyMAyQ9ZoDq8Js4lX3br/r33uB4ROV1Ybd3JdEzKLZsEr
   dpuLW/9u2LCwePpHMonqa2jzmfEG89GWpIlwdHuRy9Y8vQ0sET6Jt8cLa
   wv1qgln+MpXLVg26mvBtXLVAkwzY7ktO+m5DXjcsd1krADwhj/Dsgp2au
   Zhmhql5FAv7QyCVJOmr0N6msLfYYuspLI4Dzyn9T21IfF66PiqjYicEBF
   5K3eDYvecaEtaxOqtC9GuSJ5iL3jaYgb7bzU9tirsakQ6Ce53Mck1polW
   T0faZGh9zFVYdFnpeER34ykp2B0A7weypAu8TEWs3twHltT4X7q6fZ9II
   g==;
X-CSE-ConnectionGUID: 5+iPEOAsSuqR6lKr8dRi8Q==
X-CSE-MsgGUID: KvVtBSWwTiGNWC4YcuzfYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43219981"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="43219981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:18:23 -0800
X-CSE-ConnectionGUID: dNi145kuTw+FUAF1IrU8nA==
X-CSE-MsgGUID: TE+U7QblT+ydXRMEsY1pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="96538406"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2024 18:18:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFl9f-0006yo-34;
	Tue, 26 Nov 2024 02:18:19 +0000
Date: Tue, 26 Nov 2024 10:18:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 3/12] net/ipv6/ipv6.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202411261005.ZfxUfV3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   82fc18f199baa2c79e7c1bc887b453b4b84ebd86
commit: f4b16a1d266666624331222f640e9de652bc1dd4 [3/12] objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
config: x86_64-buildonly-randconfig-002-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261005.ZfxUfV3z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261005.ZfxUfV3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261005.ZfxUfV3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv6/ipv6.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
