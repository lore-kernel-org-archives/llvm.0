Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34C21C182;
	Tue, 12 Nov 2024 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453088; cv=none; b=ef4kAOfAQj+MdeVw9la8N7fXONbE/hmavPs9iRa7jIlzwKWZga76RjfPBGbHPoNFPc15qGFx+tQAhsnyW1UAVsh2pL2cPwzbieor0fV3GiciFz1MF8MkuTdF11cgr6Q8beVpj5xFB/tjsfGwg4gCaRd3IXxtjp0zZQPUD+vlNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453088; c=relaxed/simple;
	bh=J7DBiVuB6kujXPgM2sUDXNT5TqziFoc+KvigSgt2iTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lOH0z3R8ayh7lrOWcHy4f2+exokatkFoEhRYoKVAJWdNcs8S8AKXtPFLvYgQ27yB1N1c65w26VGV4wVw4QS/7ZVYOVGfmsZbo3GOFlHuGnfdTOxhcHXhKU9pJsaS0CTJF2zLFx+4o7uf5BXqirjr9Vg7F1rHmX1ky4Ck6JHQ88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMtGMzxd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMtGMzxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731453087; x=1762989087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7DBiVuB6kujXPgM2sUDXNT5TqziFoc+KvigSgt2iTw=;
  b=lMtGMzxdU7+achybDwoHDCOzmB0O9j8GVy9HUBcSSoP6vqzddpt50M2v
   98QBIFgdT0VeygZPnbjoLbLWinX8i0TPxT6luiUac74SqzYrQ1OmdhyIs
   Vu6ZvBg3ZzBRrZZMmJalO9ncM4VoST0fAV3ophbXJQDDKxuJmH3l5Kjmj
   UpOjl5qA2OU5mVv+fq6emq09NB4Mq2+SvR7o9fv7UyQgG/L8iPiMaz+50
   tp8dt0khrypHEBN40GhQPUIQRiAVb2jXY0ElgLe3NPRb4u216Xobh0J0g
   7coM7QNIxM27ALHC+Ku+m8UpXo7WIxvoguzej+YTDjzL1OqNMMZBUElOE
   A==;
X-CSE-ConnectionGUID: pNjova28S1aV0xiNeheETg==
X-CSE-MsgGUID: r79d26TLQYKR+3lUa8J98Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31088592"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31088592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:11:27 -0800
X-CSE-ConnectionGUID: EDB4BjpVSFGZxmIWWyhrQQ==
X-CSE-MsgGUID: hlAlJtR+QVOMW6HCEKFdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87580451"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2024 15:11:25 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB02c-0001ob-1T;
	Tue, 12 Nov 2024 23:11:22 +0000
Date: Wed, 13 Nov 2024 07:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Melon Liu <melon1335@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [rmk:for-next 3/7] arch/arm/mm/ioremap.c:130:32: error: call to
 undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411130711.xfVEiMKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   315cfa0efa30b8f1c9b8d6b8b5cc9e6c337906ff
commit: 15c0b4cb0223a5cf9783e3759be115c1ca643368 [3/7] ARM: 9427/1: mm: Fix stack recursion caused by KASAN
config: arm-integrator_defconfig (https://download.01.org/0day-ci/archive/20241113/202411130711.xfVEiMKn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130711.xfVEiMKn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130711.xfVEiMKn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/mm/ioremap.c:26:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/mm/ioremap.c:130:32: error: call to undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
         |                                              ^
   1 warning and 1 error generated.


vim +/kasan_mem_to_shadow +130 arch/arm/mm/ioremap.c

   125	
   126	static inline void sync_vmalloc_pgds(struct mm_struct *mm)
   127	{
   128		sync_pgds(mm, VMALLOC_START, VMALLOC_END);
   129		if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
 > 130			sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
   131						(void *)VMALLOC_START),
   132				      (unsigned long)kasan_mem_to_shadow(
   133						(void *)VMALLOC_END));
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
