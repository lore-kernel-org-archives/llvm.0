Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14642AD51;
	Tue,  3 Dec 2024 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205226; cv=none; b=S1mwjDz9DiES8/0xCUekf1eX/Ctf9rPStI7W6f0su2DLZJUpO9O6Ix3NKccrE+PoanGazQjbTR+BKUF3M459UE9/xhnrMD0sDZyXljeYXWTFVAJaY03ik6VDlpM5SxYLgUH+BVaGFmhjzA3IZIPWGUwf6xx3udZBMxtP7gSVG5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205226; c=relaxed/simple;
	bh=jUrHYnr2dwS45FTcMnvcfecPGFoU8SSoYQYuEaM1vJk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCIJiqAPWhQdfSZcmrxIWfc0GhXDfUebhQdRzO7kdzVAyWWjunskhxqOXq/y9EVhhBKbIffRUHOpodjNYr8+CJlYLOBeWd7s8pC1F/ZR0Vnj08yRQhWw+yGg2k/KVxzaIxuISvoQoFaPLAL2w7rWHzZzCQ5GRdF3rSlKYPDebVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGfd+hrA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGfd+hrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205225; x=1764741225;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jUrHYnr2dwS45FTcMnvcfecPGFoU8SSoYQYuEaM1vJk=;
  b=PGfd+hrAeBQYBCmTP5gs7t5/8sDvJCnIRstVo3jx6lxiJU53WrtzcR/D
   yAMqY08nvTNN6CPd+wt6w4aNHWjKBGlLz972zdgW4+B/BtOxjYVVZzyfR
   fHFux4ix+a0U43o12WCerfkpSPtThtYS2OJIUDCO5QnCAfl/hjbLX3HBa
   Rcdbdy7wx1BBitPVCgjl+9k/D6uln3YBv9QqNUoyEtN4hON1WKfueilzx
   tmKMcvjm6+oXOsjjkZ+uAYu9AtO3/1NKXpp53JEKHA6+hlabF+Qx1aIPc
   neVzGnR6ol39Gp7UCdVnfHDqS9VliC8e6QeAEM+xcOKJ47FNunG+0Crwc
   g==;
X-CSE-ConnectionGUID: KIM+GFG8QoqF7O1XmkpCeQ==
X-CSE-MsgGUID: LbSkM/xMSeCoT72WJtHeBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43885721"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="43885721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 21:53:44 -0800
X-CSE-ConnectionGUID: s3ILY+6DRO+MlZkK5JMDPg==
X-CSE-MsgGUID: dWzUV8lBSmS58FGe3/xaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97390968"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 21:53:43 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tILqv-0000BN-1f;
	Tue, 03 Dec 2024 05:53:41 +0000
Date: Tue, 3 Dec 2024 13:53:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_user_addr_fault+0x75c: unreachable
 instruction
Message-ID: <202412031348.GhJ9O2g2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 443ed4c302fff6a26af980300463343a7adc9ee8 objtool: mem*() are not uaccess safe
date:   1 year, 10 months ago
config: x86_64-randconfig-001-20240106 (https://download.01.org/0day-ci/archive/20241203/202412031348.GhJ9O2g2-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031348.GhJ9O2g2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.GhJ9O2g2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_user_addr_fault+0x75c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
