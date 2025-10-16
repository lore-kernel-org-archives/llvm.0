Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACB288D6;
	Thu, 16 Oct 2025 00:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760573719; cv=none; b=XaiJaZiWZASn1N8EpcyqzpGvrBQU3sGOIkdBY7kLoWRo0VvYMGLR1Gzxkc/qEeAOUX8ddI7dkP16kdN0A6n5Z/ca/urTCyPgX93znTiLn8lYUCoF+sw+BS80SpfcHJ6XoiVe2bCG1OQ1ssNjnHY907h61cpxm/zUUzyr4tnYfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760573719; c=relaxed/simple;
	bh=yona0hHwyPWZS6JEJRdaEaHZFb5RkayYXfcCQXttcG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkZ03lT6qKjOUpjgVrCt+i9PEVYp8LHHbsVxwA7jey9TDo4kt3JUljnB1Dp3mej9bAxBtO/U5Y3TjBKtIpXz2Yo2HEHh3Jn2xSc1wqJg5njtVYId7wNlOhWnP3kGkDj93JDXA5QmJ8X1lnxi9bJbfyxfLD5klDU09XguDpDuPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KB0W5aha; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KB0W5aha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760573717; x=1792109717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yona0hHwyPWZS6JEJRdaEaHZFb5RkayYXfcCQXttcG8=;
  b=KB0W5aha/3v6i2qmelqqiTkE3quCa7d6DI5/9tg6l14+EcfRoREsuhCc
   ynEgJId1TL0suSvOX8jb017EgP+FGk+XBTFpGf0u3tm6h9Rui8jWdVA+0
   GnQkkWdd0rfGmf2J9SkScdPpZFgIqXPEFECMX6iaC3jfGFbUjJ9YYCq24
   LO4RS84xNNvkIrOAsFmmLcQaTszJYSWKjc7txyfw33J2szRDhoJyirilZ
   FLofBmRQbcWBz3ZzLE9SX060OE/82zIqDGi0n7mBYBArVPGuUxtTUyCh3
   ve69TfnQPutJQQblRcd/thqCWiIrpV3GRLa2YsCVbNDPoJEcVp3TxiVWa
   Q==;
X-CSE-ConnectionGUID: c96O6dhxQFW2NtSFMKJLbw==
X-CSE-MsgGUID: 2Co3jc99TCetvDslFiytJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74100052"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="74100052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:15:16 -0700
X-CSE-ConnectionGUID: VLnRiviqRgCsCJkWHng1NQ==
X-CSE-MsgGUID: 7TUBNIODRPqu+At4Ri5xLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182713960"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2025 17:15:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9BeD-0004Jf-14;
	Thu, 16 Oct 2025 00:15:13 +0000
Date: Thu, 16 Oct 2025 08:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:uaccess/masked 9/11] kernel/futex/futex.h:292:3: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202510160811.WXvO1laX-lkp@intel.com>
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
commit: f6ac10db12b5fa73d73089af300ac80c45255fd2 [9/11] futex: Convert to scoped masked user access
config: arm64-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160811.WXvO1laX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160811.WXvO1laX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160811.WXvO1laX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:292:3: error: cannot jump from this asm goto statement to one of its possible targets
     292 |                 unsafe_get_user(*dest, from, efault);
         |                 ^
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
   kernel/futex/futex.h:294:1: note: possible target of asm goto statement
     294 | efault:
         | ^
   kernel/futex/futex.h:291:2: note: jump exits scope of variable with __attribute__((cleanup))
     291 |         scoped_masked_user_read_access(from, efault)
         |         ^
   include/linux/uaccess.h:778:2: note: expanded from macro 'scoped_masked_user_read_access'
     778 |         scoped_masked_user_read_access_size((_usrc), sizeof(*(_usrc)), _elbl)
         |         ^
   include/linux/uaccess.h:766:2: note: expanded from macro 'scoped_masked_user_read_access_size'
     766 |         __scoped_masked_user_access(read, (_usrc), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:292:3: error: cannot jump from this asm goto statement to one of its possible targets
     292 |                 unsafe_get_user(*dest, from, efault);
         |                 ^
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
   kernel/futex/futex.h:294:1: note: possible target of asm goto statement
     294 | efault:
         | ^
   kernel/futex/futex.h:291:2: note: jump exits scope of variable with __attribute__((cleanup))
     291 |         scoped_masked_user_read_access(from, efault)
         |         ^
   include/linux/uaccess.h:778:2: note: expanded from macro 'scoped_masked_user_read_access'
     778 |         scoped_masked_user_read_access_size((_usrc), sizeof(*(_usrc)), _elbl)
         |         ^
   include/linux/uaccess.h:766:2: note: expanded from macro 'scoped_masked_user_read_access_size'
     766 |         __scoped_masked_user_access(read, (_usrc), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:292:3: error: cannot jump from this asm goto statement to one of its possible targets
     292 |                 unsafe_get_user(*dest, from, efault);
         |                 ^
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
   kernel/futex/futex.h:294:1: note: possible target of asm goto statement
     294 | efault:
         | ^
   kernel/futex/futex.h:291:2: note: jump exits scope of variable with __attribute__((cleanup))
     291 |         scoped_masked_user_read_access(from, efault)
         |         ^
   include/linux/uaccess.h:778:2: note: expanded from macro 'scoped_masked_user_read_access'
     778 |         scoped_masked_user_read_access_size((_usrc), sizeof(*(_usrc)), _elbl)
         |         ^
   include/linux/uaccess.h:766:2: note: expanded from macro 'scoped_masked_user_read_access_size'
     766 |         __scoped_masked_user_access(read, (_usrc), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:292:3: error: cannot jump from this asm goto statement to one of its possible targets
     292 |                 unsafe_get_user(*dest, from, efault);
         |                 ^
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
   kernel/futex/futex.h:294:1: note: possible target of asm goto statement
     294 | efault:
         | ^
   kernel/futex/futex.h:291:2: note: jump exits scope of variable with __attribute__((cleanup))
     291 |         scoped_masked_user_read_access(from, efault)
         |         ^
   include/linux/uaccess.h:778:2: note: expanded from macro 'scoped_masked_user_read_access'
     778 |         scoped_masked_user_read_access_size((_usrc), sizeof(*(_usrc)), _elbl)
         |         ^
   include/linux/uaccess.h:766:2: note: expanded from macro 'scoped_masked_user_read_access_size'
     766 |         __scoped_masked_user_access(read, (_usrc), (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
   kernel/futex/futex.h:301:3: error: cannot jump from this asm goto statement to one of its possible targets
     301 |                 unsafe_put_user(val, to, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:318:3: note: expanded from macro '__raw_put_mem'
     318 |                 __put_mem_asm(str, "%x", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   kernel/futex/futex.h:303:1: note: possible target of asm goto statement
     303 | efault:
         | ^
   kernel/futex/futex.h:300:2: note: jump exits scope of variable with __attribute__((cleanup))
     300 |         scoped_masked_user_write_access(to, efault)
         |         ^
   include/linux/uaccess.h:808:2: note: expanded from macro 'scoped_masked_user_write_access'
     808 |         scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
         |         ^
   include/linux/uaccess.h:796:2: note: expanded from macro 'scoped_masked_user_write_access_size'
     796 |         __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
   kernel/futex/futex.h:301:3: error: cannot jump from this asm goto statement to one of its possible targets
     301 |                 unsafe_put_user(val, to, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:315:3: note: expanded from macro '__raw_put_mem'
     315 |                 __put_mem_asm(str, "%w", __pu_val, (ptr), label, type);         \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   kernel/futex/futex.h:303:1: note: possible target of asm goto statement
     303 | efault:
         | ^
   kernel/futex/futex.h:300:2: note: jump exits scope of variable with __attribute__((cleanup))
     300 |         scoped_masked_user_write_access(to, efault)
         |         ^
   include/linux/uaccess.h:808:2: note: expanded from macro 'scoped_masked_user_write_access'
     808 |         scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)
         |         ^
   include/linux/uaccess.h:796:2: note: expanded from macro 'scoped_masked_user_write_access_size'
     796 |         __scoped_masked_user_access(write, (_udst),  (_size), _elbl)
         |         ^
   include/linux/uaccess.h:751:44: note: expanded from macro '__scoped_masked_user_access'
     751 |                 for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;           \
         |                                                          ^
   In file included from kernel/futex/pi.c:7:
   kernel/futex/futex.h:301:3: error: cannot jump from this asm goto statement to one of its possible targets
     301 |                 unsafe_put_user(val, to, efault);
         |                 ^
   arch/arm64/include/asm/uaccess.h:426:2: note: expanded from macro 'unsafe_put_user'
     426 |         __raw_put_mem("sttr", x, uaccess_mask_ptr(ptr), label, U)
         |         ^
   arch/arm64/include/asm/uaccess.h:312:3: note: expanded from macro '__raw_put_mem'
     312 |                 __put_mem_asm(str "h", "%w", __pu_val, (ptr), label, type);     \
         |                 ^
   arch/arm64/include/asm/uaccess.h:298:2: note: expanded from macro '__put_mem_asm'
     298 |         asm goto(                                                       \
         |         ^
   kernel/futex/futex.h:303:1: note: possible target of asm goto statement
     303 | efault:


vim +292 kernel/futex/futex.h

   283	
   284	/*
   285	 * This does a plain atomic user space read, and the user pointer has
   286	 * already been verified earlier by get_futex_key() to be both aligned
   287	 * and actually in user space, just like futex_atomic_cmpxchg_inatomic().
   288	 */
   289	static __always_inline int futex_get_value(u32 *dest, u32 __user *from)
   290	{
   291		scoped_masked_user_read_access(from, efault)
 > 292			unsafe_get_user(*dest, from, efault);
   293		return 0;
   294	efault:
   295		return -EFAULT;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
