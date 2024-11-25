Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF818DF93;
	Mon, 25 Nov 2024 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732577770; cv=none; b=VgVKbBWHdvdU86YW6LysETxZq2diaqgLDAWoIN1V17j0CCIN/bRVL8rLmXLEG7oX456F3tYIDWkVpxNF7ycX6xKrnLTOYyC/CK3diAmlJe4Y0XP+OEnP75+KWwnn94pfxPRI0HXapTso2GnMdEV536GxhmV5JcD2kfN7aonfps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732577770; c=relaxed/simple;
	bh=MCih+ClT4khF42iQDY/ibHKO6YAzSl3nojZK17sSW2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thLTIJYFV3YX7SBizdokKnKi7rKio1Sdug1+lcF65PyR8nZ0mqAaprbeSiY/3S3f9EJMYKfuV3gTjBmHhOuj6F4fpHlQUZs5Q+TzvrzFFgqq9SAAYmw8Z3xeKL3flPCpGwQNr/leyvH0GD7/8yZvmbFp70jy72fls7qaPlU7O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciLobH8z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciLobH8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732577765; x=1764113765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MCih+ClT4khF42iQDY/ibHKO6YAzSl3nojZK17sSW2k=;
  b=ciLobH8zIBy/C5QWJg3Fjmn01zfQafuri30odV5oaJZi0fbkcR00OKqI
   tSh1BBBeGDe2SD9ToV0qVb0ThOPL/Zm6U3QPIK1z1bp0kgeun1e8cYQu0
   Hv/blLNsbN1tOXKE2RqI+8ABPZ98sdYFLZDzyj6Y+bp1Jk8IVRlKWkpPy
   D03JveErTCiN/VSeXG1FumS5uf/A3UNBjUb68mGS7XfYuWiKMrOARi21A
   MN4zdP7cVl4FZkxEYRbRLyESEy5y6InNP1SHfzv0pSG1TFtqU6j9g3d+8
   vi0blUT4Hww73owTawAMQfawMVFv3w8XGmiSmE6/3TouozSrvJmutv2b0
   w==;
X-CSE-ConnectionGUID: UKQXrIhMTOiSSggk7tZbjg==
X-CSE-MsgGUID: k2aJh2UJRrOS26eOt2t5WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44106594"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="44106594"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 15:36:05 -0800
X-CSE-ConnectionGUID: A7EzZjACR5uLZ00wKur3ew==
X-CSE-MsgGUID: D5OYNPDeRsi8D5xT7CIJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="92237048"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 15:36:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFicb-0006u5-0A;
	Mon, 25 Nov 2024 23:36:01 +0000
Date: Tue, 26 Nov 2024 07:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 6/6] <instantiation>:12:36: error:
 expected ')'
Message-ID: <202411260751.JOCXML3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   94875b72da986f998cdcfc2eec3350132ed81749
commit: 94875b72da986f998cdcfc2eec3350132ed81749 [6/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
config: x86_64-buildonly-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20241126/202411260751.JOCXML3c-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260751.JOCXML3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260751.JOCXML3c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:12:36: error: expected ')'
   10: ; 2: ud2; ASM_BUGTABLE_FLAGS(2b, 1b, 139, BUGFLAG_WARNING | BUGFLAG_ONCE); REACHABLE
                                      ^
   arch/x86/lib/getuser.S:146:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:36: error: expected ')'
   10: ; 2: ud2; ASM_BUGTABLE_FLAGS(2b, 1b, 139, BUGFLAG_WARNING | BUGFLAG_ONCE); REACHABLE
                                      ^
   arch/x86/lib/getuser.S:156:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:36: error: expected ')'
   10: ; 2: ud2; ASM_BUGTABLE_FLAGS(2b, 1b, 139, BUGFLAG_WARNING | BUGFLAG_ONCE); REACHABLE
                                      ^
   arch/x86/lib/getuser.S:166:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:36: error: expected ')'
   10: ; 2: ud2; ASM_BUGTABLE_FLAGS(2b, 1b, 139, BUGFLAG_WARNING | BUGFLAG_ONCE); REACHABLE
                                      ^
   arch/x86/lib/getuser.S:176:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
