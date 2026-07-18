Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61451347DD;
	Sat, 18 Jul 2026 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342015; cv=none; b=EDNUxKJIZkOYqoR4NsNzPhhtOy3MWaJnDrmMI6NYUod0IgKqfiG2lo6VamgcERlXn55t/D3wUat3m2HLRCaB9O6FeGEiR6+aWYysXlORgBcdCBwZ62y/cpb/9d84Gd6v5icoiir7lZmMBTuUfvFqisvI6JLZnrpE0bbLSZlFrbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342015; c=relaxed/simple;
	bh=zHbvgx1zOOTeJy6+W9qFKtskfyJraM57PAVjIwKCVts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=noguOUTjYQpmbDfxX0Y/sqOZPerYn7dX5GptXXtTn5sUmyl66HssbY5HtnrrfKtHxNCUoJ/u2wlEWEUpS6WT9uQWHV4ujlh6ditLA85heiiIjtKBYUphFC2jsn/7G6ZqHnvecZE+iuOsQnzwiIraSQXbxNbQuWvQZ8FKWBeGy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAu41PHO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAu41PHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784342012; x=1815878012;
  h=date:from:to:cc:subject:message-id;
  bh=zHbvgx1zOOTeJy6+W9qFKtskfyJraM57PAVjIwKCVts=;
  b=hAu41PHOUKYolBXNBexFXr7e4uRIbzb49asyJS4dyVRTyKSKfdwngKGM
   iTt6R63Zhux7PR+vTw0dlkTCHIHz6fMgK696VioBDXYHV7UmzIr1vpWNf
   nO6LcUlVnFExQw9qIp7s/YskUNBvq0zlTtaMN5mgdEN9Jd5k1Tp74U+Zz
   YLK4wGgrnQ6Xy/YtK+tTRmg2HlyRNzVJJlaeKlmmVNu9HOycjXKlBm2zj
   e3HMLmpREOqkchcM7uncrobbCUu7c2ARysejCui68i6L1pinMjt1rtgzH
   8AG8SaEC7NZ0/lYJGLM7caDWMjUSUciEHiyHzS9lBXPxXdnhM9878mZLJ
   g==;
X-CSE-ConnectionGUID: QYXpPfTRQiquxWQebMYs+w==
X-CSE-MsgGUID: 6M/m17ToR4+lNNZSldUTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="72549531"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="72549531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 19:33:31 -0700
X-CSE-ConnectionGUID: MJIC5jnUQjSIJkqw3gHzPw==
X-CSE-MsgGUID: gEvqLVYpRlOw7xnq5/Eo8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255164838"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 19:33:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkurn-00000000TNb-2D92;
	Sat, 18 Jul 2026 02:33:27 +0000
Date: Sat, 18 Jul 2026 10:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 5/9]
 arch/arm64/include/asm/kvm_nested.h:281:3: error: use of undeclared
 identifier 'elr'
Message-ID: <202607180927.HAmB6swe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   a26aa760586e73f8bb0a6cf67438ad0d89c486f5
commit: b2c35cdee47a019777aa9f9216b49a6392cc79e3 [5/9] KVM: arm64: Validate GCS exception lock when emulating ERET
config: arm64-randconfig-004-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180927.HAmB6swe-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180927.HAmB6swe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180927.HAmB6swe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:46:
   In file included from arch/arm64/include/asm/kvm_mmu.h:99:
   In file included from arch/arm64/include/asm/kvm_emulate.h:21:
>> arch/arm64/include/asm/kvm_nested.h:281:3: error: use of undeclared identifier 'elr'
     281 |         *elr = 0xbad9acc0debadbad;
         |          ^~~
   1 error generated.


vim +/elr +281 arch/arm64/include/asm/kvm_nested.h

   274	
   275	#else
   276	static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
   277							   u64 spsr)
   278	{
   279		/* We really should never execute this... */
   280		WARN_ON_ONCE(1);
 > 281		*elr = 0xbad9acc0debadbad;
   282		return false;
   283	}
   284	#endif
   285	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
