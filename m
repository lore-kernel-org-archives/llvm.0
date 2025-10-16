Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC4B20322;
	Thu, 16 Oct 2025 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760576879; cv=none; b=lRBux2fhqG90HuQyOHPQrbN4VTqIApxJ8uQVXa8KRJB3vYZNLhk8qEg6zAINN2ai13AGIwh95VDCIMjDo0xLh2gBfZe40BDQPU5iOj8+PmCV4br7QZauPFl+V5DRc3J4twC8t3PBOWNCkQAhX5UVxRj1CFhxG4yfRyQuDFiZ82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760576879; c=relaxed/simple;
	bh=WMso22qcc4hS5DPFygxNosoQj12ZXstV5D+SsVCqaXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZncfDKkuFVlBeWng9R6nksbSqKikmvlFS+jUkVGwIfCqaT8m6oBiHYI84csd+t2jiGNQK05xUPKHCZ8dPBoyc5S4yEmfk6hN+j9f0vRZV5EouhS+vx+/M9as8/PiWSMkcQPFHE0Hfw1x2lnZTKAZAiDPG3HNRPeprVpsYexLiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rj50y7Se; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rj50y7Se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760576878; x=1792112878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMso22qcc4hS5DPFygxNosoQj12ZXstV5D+SsVCqaXk=;
  b=Rj50y7Se2O4+bOOTFNYHSMUivLMQeN+PPl0TMP1XRmlpLJ7cRlRO9kYg
   5U5lUO7lpSNON5eMz6w0V8IcSUtl1tZcR631a1vxvMtQW/bHStzWzTtKw
   bp0oGrPxZEfo3hU1hK+kKPQTJaP2OjTbu2oD3Dr4LAgKAbFlwf5usyxaS
   m2zdyjDZwv2SuhLAHEMErlInoir5MLkFGYPogJP4IpTIA5PODwdPocyi4
   GcpJvYyeKPc/ApRQiUgdSlTUX9NEsj8t4irp0IIslcDbcZDIy6O++PeWj
   IgyExiWdwSCrkF9BrJdifLhFrfM7a2EOj4hBVJ4eO5ldR8UXtoWuUWiE8
   w==;
X-CSE-ConnectionGUID: BI3EVtHSRHS3x9oofp3RaQ==
X-CSE-MsgGUID: enCS/d3pR9yycwvFsRMB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66412434"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66412434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 18:07:55 -0700
X-CSE-ConnectionGUID: 0ODWop/dTn+3P+3izhbc9g==
X-CSE-MsgGUID: GDQIueR7ROq4VSDypKGGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="186721817"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2025 18:07:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9CT8-0004L5-0t;
	Thu, 16 Oct 2025 01:07:50 +0000
Date: Thu, 16 Oct 2025 09:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:uaccess/masked 11/11] fs/select.c:781:4: error: cannot
 jump from this asm goto statement to one of its possible targets
Message-ID: <202510160910.a7jVqyFo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/masked
head:   acabe15d70b5c158154ca2c0e766e8e90ca15a59
commit: acabe15d70b5c158154ca2c0e766e8e90ca15a59 [11/11] select: Convert to scoped masked user access
config: arm64-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160910.a7jVqyFo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160910.a7jVqyFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160910.a7jVqyFo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:220:3: note: expanded from macro '__raw_get_mem'
     220 |                 __get_mem_asm(ldr, "%x",  __gu_val, (ptr), label, type);        \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:217:3: note: expanded from macro '__raw_get_mem'
     217 |                 __get_mem_asm(ldr, "%w", __gu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:214:3: note: expanded from macro '__raw_get_mem'
     214 |                 __get_mem_asm(ldr "h", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
>> fs/select.c:781:4: error: cannot jump from this asm goto statement to one of its possible targets
     781 |                         unsafe_get_user(to->size, &from->size, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:211:3: note: expanded from macro '__raw_get_mem'
     211 |                 __get_mem_asm(ldr "b", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:220:3: note: expanded from macro '__raw_get_mem'
     220 |                 __get_mem_asm(ldr, "%x",  __gu_val, (ptr), label, type);        \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:217:3: note: expanded from macro '__raw_get_mem'
     217 |                 __get_mem_asm(ldr, "%w", __gu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \
         |         ^
   include/linux/compiler_types.h:513:31: note: expanded from macro 'asm_goto_output'
     513 | #define asm_goto_output(x...) asm volatile goto(x)
         |                               ^
   fs/select.c:785:1: note: possible target of asm goto statement
     785 | Efault:
         | ^
   fs/select.c:779:3: note: jump exits scope of variable with __attribute__((cleanup))
     779 |                 scoped_masked_user_rw_access(from, Efault) {
         |                 ^
   include/linux/uaccess.h:831:2: note: expanded from macro 'scoped_masked_user_rw_access'
     831 |         scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
         |         ^
   include/linux/uaccess.h:819:2: note: expanded from macro 'scoped_masked_user_rw_access_size'
     819 |         __scoped_masked_user_access(rw, (_uptr), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   fs/select.c:780:4: error: cannot jump from this asm goto statement to one of its possible targets
     780 |                         unsafe_get_user(to->p, &from->p, Efault);
         |                         ^
   arch/arm64/include/asm/uaccess.h:428:2: note: expanded from macro 'unsafe_get_user'
     428 |         __raw_get_mem("ldtr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:214:3: note: expanded from macro '__raw_get_mem'
     214 |                 __get_mem_asm(ldr "h", "%w", __gu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:189:2: note: expanded from macro '__get_mem_asm'
     189 |         asm_goto_output(                                                \


vim +781 fs/select.c

7e71609f64ec81 Al Viro         2020-02-19  773  
7e71609f64ec81 Al Viro         2020-02-19  774  static inline int get_sigset_argpack(struct sigset_argpack *to,
7e71609f64ec81 Al Viro         2020-02-19  775  				     struct sigset_argpack __user *from)
7e71609f64ec81 Al Viro         2020-02-19  776  {
7e71609f64ec81 Al Viro         2020-02-19  777  	// the path is hot enough for overhead of copy_from_user() to matter
7e71609f64ec81 Al Viro         2020-02-19  778  	if (from) {
acabe15d70b5c1 Thomas Gleixner 2025-08-13  779  		scoped_masked_user_rw_access(from, Efault) {
7e71609f64ec81 Al Viro         2020-02-19  780  			unsafe_get_user(to->p, &from->p, Efault);
7e71609f64ec81 Al Viro         2020-02-19 @781  			unsafe_get_user(to->size, &from->size, Efault);
acabe15d70b5c1 Thomas Gleixner 2025-08-13  782  		}
7e71609f64ec81 Al Viro         2020-02-19  783  	}
7e71609f64ec81 Al Viro         2020-02-19  784  	return 0;
7e71609f64ec81 Al Viro         2020-02-19  785  Efault:
7e71609f64ec81 Al Viro         2020-02-19  786  	return -EFAULT;
7e71609f64ec81 Al Viro         2020-02-19  787  }
7e71609f64ec81 Al Viro         2020-02-19  788  

:::::: The code at line 781 was first introduced by commit
:::::: 7e71609f64ec81b8367b7fa59ab06bb571d17e3b pselect6() and friends: take handling the combined 6th/7th args into helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
