Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD28E571;
	Wed, 11 Feb 2026 02:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770778092; cv=none; b=CQn907jZ11AjCilqIvvjvIaSY3jBmAkHBN8G+IKoqcgWfXvSmuvP++bQ0f2SBxCPpPtVVZUqVcbUH7ymvYZdxArzrdJSUqu6x8MPITEfDVh+I2IVD9l/uXaZ6obonDbDIAAHq/F26y4z1XTX/JjBjPQ+bORRv8SLM4/inJjpLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770778092; c=relaxed/simple;
	bh=Uz9HeZsoDx0cr09h1MzkpnhMHhavMZBgIlWuXDIe/ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZ2haSkHg7kRGXyjQMEFcJV9ZOa2X0CXmsqm3mxDI7vo16X0x3fKE/eZQqj3xcxSqzxZFImyqdQ3GS/M0IZsoG7okQhVDdDhSH06JCxdmSNoG/4yQQR5a100m4jq7pi8xRnVZm5XxxdEbhi5rxuy3m75jf8itmlm5eotFrWI/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPY4Q/8b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPY4Q/8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770778091; x=1802314091;
  h=date:from:to:cc:subject:message-id;
  bh=Uz9HeZsoDx0cr09h1MzkpnhMHhavMZBgIlWuXDIe/ew=;
  b=gPY4Q/8bQECAnqlKmfxkiNeq2BxdtutZYmNiIFk57CA+lszdhGZmufuz
   xUavbauXppLRvMqZgYzf+HsngMQVW6U9YTnrdAaHiyFa8o6SMGGxqttD/
   yzn9qB5l/ykmrAFPNoV/+gvrlhZVpCwhhmrHp58eq20lhPKXtsOR1yL1f
   uTBpPG3uXtaQPwa10+lBHngJpubBm9efahDLVQXTZZcmsQgFPveolTMJY
   0911d9sQkE4VSuw36X4oUo+FUo8zq/+o5AfAVSa3x7xecLXJQHC8SGAea
   KhCHoHfLOOprWw8LB9iTgAk6LadSoUZw7okxSebjgsjcCwK3xYAekyqQN
   Q==;
X-CSE-ConnectionGUID: OSQx0VtXQ9qqzzhYk/baDQ==
X-CSE-MsgGUID: 3rPoeCR3RNaZacHsYIdV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71816159"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71816159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:48:11 -0800
X-CSE-ConnectionGUID: xh5dOAA3QJWLDWdLaTw6MA==
X-CSE-MsgGUID: gUy0wNxVQUS4tbqoVV5AjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211088880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2026 18:48:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq0Gt-00000000pbw-1dQx;
	Wed, 11 Feb 2026 02:48:07 +0000
Date: Wed, 11 Feb 2026 10:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-slaunch 40/41] ld.lld: error: undefined symbol:
 __pi_bcmp
Message-ID: <202602111032.4Dnk05jr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: b3138d620ceb6371e697d5d7eefbd20ff485c3dd [40/41] x86/slaunch: Wire up early secure launch C code into startup/
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602111032.4Dnk05jr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111032.4Dnk05jr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111032.4Dnk05jr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __pi_bcmp
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__pi_sl_tpm1_extend)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
