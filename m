Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF121B9D9;
	Fri, 27 Jun 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024516; cv=none; b=ZGjvt3PuZ+RtodKqQc5p9hSG/uj0ivSrKM9Fa0onb9g3eWp0v8R6GJMek3JSe++27zQqV0mdPcpjFguNxjEAQtrWefRVU0jgK9+2LslhZTXIuiHCTs0Ein7rlXPWN+/FTUOuKdrCOWFCbA2qYEWiky2lTSv9gWOF/peNB5prNG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024516; c=relaxed/simple;
	bh=FXhBx0OthCqz2RLBYUTA50kQImSongku/UekKYkxueo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGhUkMsZyCRULfYtjnFzdlQI5n672kz8QIQnKzRVRXM9m7cWrWBqhWdatdXY6FVfHzJkQPdHX9PPY6GrCiSqQiSg9oj/kQwMhV/XqLLor2TibD93jtq4Xfey5bdyp7Mk1pAADErWDGjd59D1CKlBKdNMmMj3dv15Sr2QbK57FRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHsqk4ll; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHsqk4ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751024515; x=1782560515;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FXhBx0OthCqz2RLBYUTA50kQImSongku/UekKYkxueo=;
  b=RHsqk4llYvyKWSlBiSt7RAwOmWr0LbHg1FZD/zz1obvvIm75mb6IiOI3
   49ba1EmWBxW/UH8jAeHqjV0dxGva9RNkyfNl+tU4YqAXojRGU9DFflBtP
   daXsDzDfee5j1BcQ6jaZvccDh4gmDh3h5hROsoZN3qG93ngHWIcKbi+M1
   9Krzl4WOpCZ+kxrgx8YBDE+IkGBMWS2qVvBqIo/KvWTMRxvZa3bzGD6Cj
   PpWy2KdsuxfZbSZudkvp3qOnlL0aXB1Rlb1cwkLSZi1lpRN5jWtYRh2uU
   ZPu5hAotxOHQGsv56ke8Be4nRZVsHV760ZoaWUBKQM38cnhRGREeoFMF7
   w==;
X-CSE-ConnectionGUID: aRMrhhrvTiehUT1QTahb7Q==
X-CSE-MsgGUID: KTeE4S4xRe+Rrafhno2MRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64690895"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64690895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:41:54 -0700
X-CSE-ConnectionGUID: MRqSS25YQ5KWGVrgrOII6Q==
X-CSE-MsgGUID: dukylRGmRHKrI0zgZPN0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183822282"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 04:41:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7Sp-000W8R-0A;
	Fri, 27 Jun 2025 11:41:51 +0000
Date: Fri, 27 Jun 2025 19:40:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: call to __read_overflow marked "dontcall-error":
 detected read beyond size of object (1st parameter)
Message-ID: <202506271959.rmmh0j8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a993863163cb88b1b68974c31b0d84ece4293e
commit: 6ee149f61bcce39692f0335a01e99355d4cec8da kunit/fortify: Replace "volatile" with OPTIMIZER_HIDE_VAR()
date:   4 months ago
config: x86_64-randconfig-071-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271959.rmmh0j8X-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271959.rmmh0j8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271959.rmmh0j8X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
