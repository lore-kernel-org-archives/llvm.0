Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678320D504;
	Wed,  6 Nov 2024 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730937526; cv=none; b=GCEnx7HTCYtigoLolGpjkm8iH9Zj8yBrGKQ8lIHuJFy4Raa8nC6ODalZnE7Lr6pczaV3soefTGU7CplG3e66AoVLg7v/zcW9lLccQbz4zfwSQqzMTn1Xoti/1o4Wz6nmU1kdw0ajOuEiZsQ4esNf6XN0b4NMME2ReU+DXlFkmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730937526; c=relaxed/simple;
	bh=zN88TMTErqtO1c3WCklYm4+nB8mQcgQ8V7wbsAvp1ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4OIPZYPBUkYzlr/BPPZFrXn5+PXJajiIYytEIkUuXdDUsEZG7shUg9SeoRoT/oQ2QWQ7BFA3ssTGfUEvn+hbZEr7Q9h6uu6eu0N9CgmVig+7lw7AZE7+WY3+IYYhMOOtj/hc/W1hOonp6wOb3LlQn5iiOA2lNMKHS3eRdwCks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGvc3sJQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGvc3sJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730937525; x=1762473525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zN88TMTErqtO1c3WCklYm4+nB8mQcgQ8V7wbsAvp1ss=;
  b=MGvc3sJQkkxtsl87hXtoyfbQMBj7l2kPyeJ8e4lM0v+zwkpZUdvy71cI
   45kmcUsaKPLUC+3pBSUHkds7E3dwZ3jdZ2z9SQdYGeHe8Elu47vG23khK
   LzH2OESj1Xgvo3rk3WpMDs0aturog7vqHo9GlyuoqH0mHEpac1aXVozaK
   BYNJT5BAcsWNFFpEH0aDinTXDLFA/h9O3Nc0sOUsA8Aqjxhqf8TydjvIz
   1E6T+4i5+Oed65AaOTZdhxItpy9vvLFIl/WWTPs+mKfOZlKTgTuu60RpD
   4Fouqq8QUj1VKnMAsf7jwow9LIfuUcf8phS4uYyrV17S6fBFtrUuGZczw
   A==;
X-CSE-ConnectionGUID: mml7IzKlTk6MAg7Moa4UBg==
X-CSE-MsgGUID: y1uvHo8BQNmWnbulg7Cg4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34458999"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34458999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:58:44 -0800
X-CSE-ConnectionGUID: KoSMHPYwSxilE/6RokuqUg==
X-CSE-MsgGUID: T4ih8baURl6DLDI7wYuKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="122352622"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Nov 2024 15:58:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8pv6-000pXy-0j;
	Wed, 06 Nov 2024 23:58:40 +0000
Date: Thu, 7 Nov 2024 07:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-percpu-sheaves 2/9] mm/slub.c:3677:47: warning:
 tentative definition of variable with internal linkage has incomplete
 non-array type 'typeof(struct slub_flush_work)' (aka 'struct
 slub_flush_work')
Message-ID: <202411070716.bY6XhY3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   c9a0c0d9abbb215ecaca59e751140fc4f46652af
commit: 9ad85e9871942fcd8c470e07cd10875bc101b73a [2/9] mm/slub: add opt-in caching layer of percpu sheaves
config: arm-randconfig-001-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070716.bY6XhY3r-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070716.bY6XhY3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070716.bY6XhY3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:3677:47: warning: tentative definition of variable with internal linkage has incomplete non-array type 'typeof(struct slub_flush_work)' (aka 'struct slub_flush_work') [-Wtentative-definition-incomplete-type]
   static DEFINE_PER_CPU(struct slub_flush_work, slub_flush);
                                                 ^
   mm/slub.c:3677:30: note: forward declaration of 'struct slub_flush_work'
   static DEFINE_PER_CPU(struct slub_flush_work, slub_flush);
                                ^
   1 warning generated.


vim +3677 mm/slub.c

  3675	
  3676	static DEFINE_MUTEX(flush_lock);
> 3677	static DEFINE_PER_CPU(struct slub_flush_work, slub_flush);
  3678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
