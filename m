Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1D1547F5;
	Sun, 22 Dec 2024 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853781; cv=none; b=DE1XOP7hLOUeLGE7hgOJgJu8Fnd6K8pcCwjx7siy85WK4AU7LufmQE2PoiM3QfUOhh4TiLIm2UglUGy4WjhRjo2QKIeckuUzS0i+u3dYFQfdBUqpvT1/NdemtEmGornRDfSnNIzxemZN08cNcSEBA23TQbvJU+git/SqSOQKsrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853781; c=relaxed/simple;
	bh=fvpYtmNlP6JX1JM+3BYcUNs6sGhTnAociXKnGB8aW0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n85l/Y5wk14b4Dvw+RBtFRtlsPnN10vu6jCBRkH0rzm3cOc9CRtbIQiEvJ17Fib3+b8ZpcPGlIagheLw2kCPYK0ReU3unsiJCJI1FM66lZvz5cSuFngM4A+8KkA3sqRM0KOnPuB8kMb+nqpE9K8bjTIZTX4IviU29w8LveX400w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SU7ARzz4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SU7ARzz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734853779; x=1766389779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvpYtmNlP6JX1JM+3BYcUNs6sGhTnAociXKnGB8aW0g=;
  b=SU7ARzz4bdPYcBG3c+x+JwVhZuihDo+Cxus1DbUb/SrgpL74kOLsf78z
   q5jjF1q9S/bc0LbImEraBp7Ifk7CWTsjFuaiEu6Dj/wq8YMZjeTRarE5e
   8IHROaAjR0qcluiNbO+SIWKI2cvPekuDIvpnQAuTCHXSg47kKe5lknoEb
   MGAF+/0zZctrjTvy8EhbRdJojDpdexS3kEtNlOy+dTVxYphd9s+7DoBLG
   /vsbhUIfBL+Re3vw0z0+DAYcYXu7MAyFfJuW8YQaz/9hA4BYYmIzz8q5c
   hu0j3CzbEhgAgAKFSckPE6+gCPmLELvpWpDGOC7oNx197gkaEuJp4N9Ia
   w==;
X-CSE-ConnectionGUID: fABDwsToQ+6WjUjNqpDykw==
X-CSE-MsgGUID: E5X5INsRT02DV4Q4+NzV3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46767028"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46767028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:49:38 -0800
X-CSE-ConnectionGUID: xcyh8rfgS8m4Z6TopsQnbQ==
X-CSE-MsgGUID: Mnejlkh4SYyH9KF0YElFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98686992"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 23:49:37 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGiV-0002nO-1c;
	Sun, 22 Dec 2024 07:49:35 +0000
Date: Sun, 22 Dec 2024 15:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 12/26] include/linux/sframe.h:31:92: error: unknown
 type name 'unsinged'; did you mean 'unsigned'?
Message-ID: <202412221520.YWmqMjHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   3c5688da4922c1ff09b4973c69e7324950c7ef60
commit: e660bb57e4f94f01da72031da438d20fa25ee32c [12/26] sframe
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241222/202412221520.YWmqMjHq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221520.YWmqMjHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221520.YWmqMjHq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:108:
>> include/linux/sframe.h:31:92: error: unknown type name 'unsinged'; did you mean 'unsigned'?
      31 | static inline int sframe_add_section(unsigned long sframe_start, unsigned long sframe_end, unsinged long text_start, unsigned long text_end) { return -EINVAL; }
         |                                                                                            ^~~~~~~~
         |                                                                                            unsigned
   1 error generated.


vim +31 include/linux/sframe.h

    30	
  > 31	static inline int sframe_add_section(unsigned long sframe_start, unsigned long sframe_end, unsinged long text_start, unsigned long text_end) { return -EINVAL; }
    32	static inline int sframe_remove_section(unsigned long sframe_addr) { return -EINVAL; }
    33	static inline int sframe_find(unsigned long ip, struct unwind_user_frame *frame) { return -EINVAL; }
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
