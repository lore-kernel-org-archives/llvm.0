Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D776DCE1;
	Tue, 24 Jun 2025 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769181; cv=none; b=mdI+7Py7apG/112dyoxzrinWL9MMhHM2MOKuQWCx1ah/Ui4RNqyIsrznEDrRjERBmV55fFhXCtQBeMfD0wYD03YCj1OSuSgkhwj6d7C13DenDxLEAXAzLXvhpJhSzTBdsGItKYFRmsEMn05hhvT0Wy+S0/4kIbjKIEhtenLiVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769181; c=relaxed/simple;
	bh=wJUhpZVXPlByDwuRdm72o2lxUR4sRDi2Y0BixD5XW7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcJYxLMpLRVoOfuZe5L7G9WVZ4Yxz9Aw0rl1YXw/dEbTiXq4NwRU5GW5kX2UIPI5oPlfNm1OWjE50TOfYZ7YrUFo6osjxmWRGxBuToKSsy0Z8Uewso88VxW4t/475NRu+uiW30lD2n5NQrvSbFOD60dbbMThpF7XtvNSZ0OX85I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=is5uPXcr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="is5uPXcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750769179; x=1782305179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJUhpZVXPlByDwuRdm72o2lxUR4sRDi2Y0BixD5XW7Q=;
  b=is5uPXcrwvdxdMufgE5cTKV0Zd2Oj3FRtjuF5AwelWKtCiMfX2kanGFI
   Y3BNybE55nnQ+sD7r873SoJZ3IF+5wOil7B+Ks3T0QWSPravmESQjmb1B
   mm73FYnJJbdqYGaPztNcNzUo7r9o09WvBTjHPkdKGeiXvxBm+eQw3DkGB
   LzsxUBDWdvDgoWU30//gU1SWVdWkqPFnoTUydAAqF0hC3P4d7GMOJJZOL
   sY2CDjk3Y0PBlgYtw9RoBYJa+xehjX2Nu2RhCpFFaUziQMRvK8fW0MlMS
   W8kRkLTrHZizWXs8A9md+VThPZgxq6n7KSFqmGy4nutYL9g3/pDQUi17Z
   A==;
X-CSE-ConnectionGUID: cyhmF6oVSK6LHYu8hxBtCg==
X-CSE-MsgGUID: wcJCgMVZSm+rpbf35+6wPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52941569"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52941569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:46:18 -0700
X-CSE-ConnectionGUID: t9MJEhBNRv2oLolbq0u35Q==
X-CSE-MsgGUID: /oeZPziWR8avQvUS9tYqLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152433129"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jun 2025 05:46:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU32V-000S7z-03;
	Tue, 24 Jun 2025 12:46:15 +0000
Date: Tue, 24 Jun 2025 20:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Gow <davidgow@google.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 16/17] <inline asm>:4:10:
 error: Could not find incbin file 'uapi-preinit'
Message-ID: <202506242046.MyE7tYTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   ba83258f9706f2b3454de1dfdfe925d0b259e04f
commit: 4a560f868e311314af14404ee36852711684d766 [16/17] kunit: uapi: Introduce preinit executable
config: i386-buildonly-randconfig-004-20250624 (https://download.01.org/0day-ci/archive/20250624/202506242046.MyE7tYTh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242046.MyE7tYTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506242046.MyE7tYTh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:4:10: error: Could not find incbin file 'uapi-preinit'
       4 |         .incbin "uapi-preinit"                          
         |                 ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
