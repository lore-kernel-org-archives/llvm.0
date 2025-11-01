Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1928689F;
	Sat,  1 Nov 2025 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761988873; cv=none; b=TAl9/Eu9BFKDtUrbM2VL0hCi7L7HBE/IMKjurR/ZPVC6Ak+aRJQQ9aSQUPYf86xEnpJFyzszx9mIMjOKbr+Qkj01UR4V4jRq55AKH1qcNoyyv9dLmhsIjzvIt4yDH4kn69D+Q0XuZJS5p/qhqvS98xO0OYYjumYAPYfN98xliig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761988873; c=relaxed/simple;
	bh=jMWqQx7eiiIXX+S5y1i3zA9QEndKre7hGPMqcdUrQ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2Tq54V6RmHKmGphJg2FmSsp1Y8vKorNpehigqfz+sR+Zvlve6OLunso8EgJxnNj41q3r/OKKCsoSYscsIm460Z/hIxbG4znG8BgrILUfx7TXNAYjVdWe9sTFadSgW8nALVP45ZhtYX+efnzI2z+1diY3dmKtXFqKhrr6EiQ4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHSTTaqG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHSTTaqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761988871; x=1793524871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMWqQx7eiiIXX+S5y1i3zA9QEndKre7hGPMqcdUrQ0U=;
  b=CHSTTaqGd9vgYUc5DF299mtdXtD65fz80APR+3n4KvINW9gHx9Om2J4q
   sJwCyUwpNurhJl5T+TZ8kAz72rKPnpETLcLq6HlV2DrJmrwNoeSzAnYkp
   LLUez+21GKUDkByOwG3STo0Ujivg99xiBA6e4K7Gm9EJhW1qLzMHFVjHc
   8kzVRtQPQfcdZCGC22exYEPcI0msTMvDKOR/6RL+pJzSSqtn0XewxNWUc
   QjTDaDd6WWE5dmsk1GF7vJgVzXqwQmEfjwgJJE7XvrUiuV8rilwbrr83w
   +qvfdmkO4/yMN7zFubK4i4L99Ko2iHmHlJlWUEGUCRuugvcMRK3Nm/oSI
   A==;
X-CSE-ConnectionGUID: Cly97YlOQj2aNiQ8629VDw==
X-CSE-MsgGUID: z4yJXvn6T0ewCc5Wderp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="68000648"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="68000648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:21:10 -0700
X-CSE-ConnectionGUID: C1Hrgk8zQtmASH3imU2jPA==
X-CSE-MsgGUID: 9xcFD3z6QMqLhknzqZoJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="186382416"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 02:21:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF7nE-000O4c-1v;
	Sat, 01 Nov 2025 09:21:04 +0000
Date: Sat, 1 Nov 2025 17:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 995/5383] ld.lld: error: undefined symbol:
 __aeabi_uldivmod
Message-ID: <202511011707.zQYgpE7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: ace232eff50e8c898103c56b3b5303e776616274 [995/5383] drm/amdgpu: Add ras module files into amdgpu
config: arm-randconfig-003-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011707.zQYgpE7K-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011707.zQYgpE7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011707.zQYgpE7K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by ras_core.c
   >>>               drivers/gpu/drm/amd/ras/rascore/ras_core.o:(ras_core_convert_timestamp_to_time) in archive vmlinux.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
