Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CBA2638BF;
	Sat,  8 Nov 2025 01:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762565214; cv=none; b=ezEITTJKbAya4YwddZRrQQa6UChPL8KuH5PHXpocEHdX7lseOb0zr3X++cLgzfpqnvjEuNN3DX7gOO7pwx2MxkdxfAsZMfDHtWOvozCAduPBClu872boSRGDJFWme0bAydaCsPbF34C7srR4DYOCzAEXIkLQceA9paqSnPJYJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762565214; c=relaxed/simple;
	bh=+tYSa2LM1ktrvmoFVc6CXUhg3r0K2dllcbnvRNf7fiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtKug9QBBHRrVWVKlzMal7rv+MQ0PAODCClvz56N2Om46unR91qH/VwgfYSRqnTj92a4gGXmwhZb4RL3BNXD6WvpVBB3spIvOBbUhfU7QtO+HUNI52QUG+x3UliwcZXo53tiLLeUD44oZ/U6+QXsQyKEB2zmUJfrihyKhuECrBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8Ieg1LM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8Ieg1LM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762565212; x=1794101212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tYSa2LM1ktrvmoFVc6CXUhg3r0K2dllcbnvRNf7fiw=;
  b=J8Ieg1LMazb+YoxengAbCozqMvga2NjhZ30DSPk/BKNQTvPTakEwzA9p
   uC35/Y8SXkNrkn6kEqTXXzVDHP5KWUCPQjMRoyT5zX6bpMNQgct475fhT
   yNRVLSnSTt9ep33/8ULp+31ZYO64kkZ5QT9ighYwX0a8zI5RKb4li0dWG
   SceHP4/C8OnHGAnFi+W70gXPVbwEmI1UO45osUBv2/fx1gURqtaeOVb+3
   ZABADfr7WmuBmyAR1G7NCx1WllGLlDtL775KV6zPrG70avexIo+LsNLH5
   mzPiC4xZUU1TVDGM+rdKrX2IbwxOAOvwfIoWOKOSAdJ317pMjA8L+k9p3
   g==;
X-CSE-ConnectionGUID: yoRJov3+RD+fP5uNWOIbeg==
X-CSE-MsgGUID: xXR83zTxS1OFXpkBJGQWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="67326282"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="67326282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 17:26:52 -0800
X-CSE-ConnectionGUID: PwQigouySUaCuUsLWPRkyg==
X-CSE-MsgGUID: 52CYDMErQn+CVf7P+sgIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="211620460"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2025 17:26:51 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHXj7-0000Zt-0g;
	Sat, 08 Nov 2025 01:26:49 +0000
Date: Sat, 8 Nov 2025 09:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 3/8] arch/x86/kernel/uprobes.c:1439:36:
 warning: unused variable 'mov_xol_ops'
Message-ID: <202511080918.THWDN0lf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: a1e15dc94d1d860d6e066d7b547ee0451f2cc135 [3/8] emulate mov
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251108/202511080918.THWDN0lf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080918.THWDN0lf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080918.THWDN0lf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1439:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1439 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   1 warning generated.


vim +/mov_xol_ops +1439 arch/x86/kernel/uprobes.c

  1438	
> 1439	static const struct uprobe_xol_ops mov_xol_ops = {
  1440		.emulate  = mov_emulate_op,
  1441	};
  1442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
