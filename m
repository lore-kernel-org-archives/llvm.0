Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE1341069;
	Mon, 22 Dec 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411440; cv=none; b=qMEARZK4Bm98SAsgyIei3zvNtWxW7vK3WvhAkC9Q38ZnilsEEk6mvOAyWMOYKGQzaA7BF49YclKJw8Jx0O1JSr2UL31mMjk5mP45ftpBYpAsqof0lyEVfTtDPGRKLkfsBGwghNjNZPq8ngeOCzaSBpKPQSuq1tYDJln8kLSFVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411440; c=relaxed/simple;
	bh=YukHp3m3CK9TP6iZeez1PlibQ8YGtPzWTWRLXgMYCwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hIAIxLP4yqYkn9u3b6HhQkuftNBonlCAtKQMVZAjawCqao8Sw9gcL3T7Jv32h+VU7SrGiuQl4JCyoTGdrfrqCWOpfv6V+SnpKksIcHC/0+iAiXihfjVxOLJ/Ix1AmseiLrSSfzGzMXtK3K6oVJ7/mkUbPse9ADXIla7hgX4pTeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvvM9cI9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvvM9cI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766411439; x=1797947439;
  h=date:from:to:cc:subject:message-id;
  bh=YukHp3m3CK9TP6iZeez1PlibQ8YGtPzWTWRLXgMYCwk=;
  b=VvvM9cI9cy7TFtOd1ahlQr0Ifzti1PsYCnxhGoMSz7OMc0uNDSGiS9te
   uPrnCb969UdLZnOQlfjooKZNABzYrGBD1cOp1m+ypCh413v/1IlURU1Jf
   LWhJZDcoFzCtktKo11u9YZMuSiTJRVYT+N7UuHOcJEiI8t9JL9rvrJEuR
   gpkc58pcNq2/q9FPLyRt9Y5lwkUqJQUaqOrzT8JcIoRYYUkvNn/2HA3sK
   g9HkJ4iVKbXNIaN0lLS5NJyL7sbh2lPOO8Ul1zLdHtjEUiHVzJBNUpNCZ
   ZV6UZNoG5j2xCd2CSEXsVMmMRMzWiHBIVeFRjiwc0qOtl0cvDxJ5hwJ7s
   g==;
X-CSE-ConnectionGUID: fz3TQpVUSXWlPSefEloLqg==
X-CSE-MsgGUID: d931fo1eRiqEOQpxLlJyAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68155930"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68155930"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:50:37 -0800
X-CSE-ConnectionGUID: MsCn8tOvQX6VNHV/kVzY+A==
X-CSE-MsgGUID: GYqENvjcQo+lPpKIlcynTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199443662"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 05:50:35 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgIz-000000000eH-0ess;
	Mon, 22 Dec 2025 13:50:33 +0000
Date: Mon, 22 Dec 2025 21:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1091/1155] fs/bcachefs/fs/check.c:113:36:
 error: initializer element is not a compile-time constant
Message-ID: <202512222203.9McmT4jj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   4f049ce84e68ab1195439b4a3ed394d7363d60b5
commit: 8ed85840adf72d951032bb4eb397c8ca4ebda2bb [1091/1155] bcachefs: split out create_lostfound()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251222/202512222203.9McmT4jj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222203.9McmT4jj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222203.9McmT4jj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/fs/check.c:113:36: error: initializer element is not a compile-time constant
     113 | static struct qstr lostfound_str = QSTR("lost+found");
         |                                    ^
   include/linux/dcache.h:61:17: note: expanded from macro 'QSTR'
      61 | #define QSTR(n) QSTR_LEN(n, strlen(n))
         |                 ^
   include/linux/dcache.h:60:36: note: expanded from macro 'QSTR_LEN'
      60 | #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
         |                                    ^
   include/linux/dcache.h:59:26: note: expanded from macro 'QSTR_INIT'
      59 | #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
         |                          ^
   1 error generated.


vim +113 fs/bcachefs/fs/check.c

   112	
 > 113	static struct qstr lostfound_str = QSTR("lost+found");
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
