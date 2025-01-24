Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D522D2B9A6;
	Fri, 24 Jan 2025 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737682225; cv=none; b=Y9h/CvVxXCJX3sMAO5rV+BTX75zN/4auWWlUbn9trxxYcjKeWvs8MBnTpFzQyYST5GBCtCUmFXp0nwhJ5K8A92Q4f+UOEF0AW/UOnsQl9B795Sadrs+xdJN3vuPK4hzw/iELA0B5SFAC9AcUGDoP8mWd01GnM4uiDI7tYI0cLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737682225; c=relaxed/simple;
	bh=Edg/rahXr6zMPT1GULY2J2glCSsVxW8a+267Rjz8WYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZ3hZmdpJ1T8betFxf6yaf2NG/stwVEd8oSbkyi3lOZHk6aQ8ib74cFlT34+NJKb3w62LOsCEF//UKsJ830XlBZtaXQso7HmbIB2wj+D/neyxzUtvylmVVf99PA5qdvnlY9hp4O3Fq/yL1ZBgpAAxjYXa2KZY47686Qec0LYr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFzlswML; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFzlswML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737682224; x=1769218224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Edg/rahXr6zMPT1GULY2J2glCSsVxW8a+267Rjz8WYc=;
  b=lFzlswML+ulPHIi2r1uSDGd7vDEDiN0rkoMQtfxoWeB7SVHlG5cwft6y
   X3Z8ZxhxBweZ1eEClDK4JT/1NHVv6XHBpPNaZA0lXUK1UMcuqTOh++5Rl
   1wur5zsX3erM9lUr+gOM6FFeQIDrlilvFovEWHbkKJIQ1r8KzEjFkPJA8
   6U74ICJOgHjLyg+SYGfPrbjV7xl8jGPpt230+KPbEfS+66ucpekUwFk1U
   WEP13qGltkG/oU6TOWvSOCqMHjrdI5V+TB+gsB75CNPn8OOprYIck1Kcw
   DrsqSvcW8f8XxJO9B4RUSzsfJWrx2CkrVXmAdfU+q72KVQBn3tHuhOL+g
   Q==;
X-CSE-ConnectionGUID: 0qL9t9wFSXSWjIi68Vc8cA==
X-CSE-MsgGUID: 4pZg35i6TbeJDbMdQDVm8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48713795"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48713795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 17:30:24 -0800
X-CSE-ConnectionGUID: F+XhDzzVRbOoXELv9Lawww==
X-CSE-MsgGUID: NvIcBsStQq6Toy4iYHCIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112766529"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2025 17:30:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb8WZ-000byt-1i;
	Fri, 24 Jan 2025 01:30:19 +0000
Date: Fri, 24 Jan 2025 09:30:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: [linux-next:master 8826/10150] mm/zsmalloc.c:431:20: warning:
 function 'is_first_zpdesc' is not needed and will not be emitted
Message-ID: <202501240958.4ILzuBrH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   853d1f41ba73e78d22e7075d9a95670aab187eba
commit: 1c6c153b503f90d1099ae606198e080a452687f6 [8826/10150] mm/zsmalloc: use zpdesc in trylock_zspage()/lock_zspage()
config: i386-randconfig-005-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240958.4ILzuBrH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240958.4ILzuBrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240958.4ILzuBrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:431:20: warning: function 'is_first_zpdesc' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     431 | static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
         |                    ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/is_first_zpdesc +431 mm/zsmalloc.c

   430	
 > 431	static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
   432	{
   433		return PagePrivate(zpdesc_page(zpdesc));
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
