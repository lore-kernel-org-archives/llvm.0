Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA62DA75B;
	Mon, 27 Oct 2025 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761595399; cv=none; b=KLVPyYgo5vBmPOOoI7nO8ww17T57r63yDFZCHACCfkiX/MJTbSDiTkeRV0yLewWhsGq1hh9/6x6vAHOgWyi93NmOZw/rFY58BlEORRaCB1LXkGB2zC5eFQcE+5y9cVLQkRrRoiVh3IGNxzEGNKdVKkaRqeWI6AQHKQz/kWuje0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761595399; c=relaxed/simple;
	bh=7n0N46R2XCYNLllAMJjnJ7GHjwVLpxXZsqvC1J3QfBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/HuNVSHpso1G+mBtJP15k3kyNYhx1Af7YruK/8LkKSs9zF0HjCAb91Pm9L2t/m2dxQocjZw9YO3x8A8zW5dJR8iVxpwFNo7ADPS+/wePZ8ZH6THsod4WzbPtixwuxM9nxjSqdj1J5xQbESR0ckwA1rUlpa53TfCOqQqi985/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqsY4BNU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqsY4BNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761595398; x=1793131398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7n0N46R2XCYNLllAMJjnJ7GHjwVLpxXZsqvC1J3QfBk=;
  b=UqsY4BNUJYvyGVmAYYvbkmLJcXgxzybq0FqU2HXfszfefc2rFw3V8lRi
   QonjWd4WCfPYH/C97ZK2XNp2z9cXS3u1J3MgdZ0PDsgjWQFJ2hEBJxxUf
   cw4V2TVxbhIssa6dPIfo90drgaUDjG3OKCT9irRKRcOREsRlbO0DccfRo
   r7MnCdNpHnJhpByuiadrAYkIhCVtjqHBLgcUC66292Gml/MnCTqc0QY8b
   S1jHp4t+icp01NRtssypruO6scXppZ3S6uTCIsr4r3cLl6Fisc0IzJnG8
   Ow1T5j8MbgmwC4KmSrtUeqA3Pogg1G0ahsI7ALPEy0xglYX2x3rhO7cmk
   Q==;
X-CSE-ConnectionGUID: dPlVg+0+QlKpM/W+wcWl2g==
X-CSE-MsgGUID: 3QqFi55qQrWPp3rx7EkWig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67523831"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67523831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 13:03:17 -0700
X-CSE-ConnectionGUID: 8amFvU1KTmOdJv/EKQV9/A==
X-CSE-MsgGUID: KMVIBuIASH23THPTx9WN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="190344057"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2025 13:03:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDTQe-000IQx-2C;
	Mon, 27 Oct 2025 20:03:03 +0000
Date: Tue, 28 Oct 2025 04:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 10/75] kernel/futex/futex.h:288:9: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202510280418.0xapnuLW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   7b95ad81f6a1e0d08a1e481f74e83a8a49c3ec30
commit: d7d377869b78cdb548143899a62b7239dee2110b [10/75] futex: Convert to get/put_user_inline()
config: arm64-randconfig-001-20251027 (https://download.01.org/0day-ci/archive/20251028/202510280418.0xapnuLW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280418.0xapnuLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280418.0xapnuLW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/pi.c:7:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   4 errors generated.
--
   In file included from kernel/futex/core.c:48:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/core.c:48:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/core.c:48:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   In file included from kernel/futex/core.c:48:
>> kernel/futex/futex.h:288:9: error: cannot jump from this asm goto statement to one of its possible targets
     288 |         return get_user_inline(*dest, from);
         |                ^
   include/linux/uaccess.h:845:3: note: expanded from macro 'get_user_inline'
     845 |                 unsafe_get_user(val, _tmpsrc, efault);          \
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
   kernel/futex/futex.h:288:9: note: possible target of asm goto statement
   include/linux/uaccess.h:847:2: note: expanded from macro 'get_user_inline'
     847 |         efault:                                                 \
         |         ^
   kernel/futex/futex.h:288:9: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:844:2: note: expanded from macro 'get_user_inline'
     844 |         scoped_user_read_access(_tmpsrc, efault)                \
         |         ^
   include/linux/uaccess.h:780:2: note: expanded from macro 'scoped_user_read_access'
     780 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
         |         ^
   include/linux/uaccess.h:768:2: note: expanded from macro 'scoped_user_read_access_size'
     768 |         __scoped_user_access(read, usrc, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
     604 |                 if (node_updated && put_user_inline(node, naddr))
         |                                     ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
     870 |                 unsafe_put_user(val, _tmpdst, efault);          \
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
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:872:2: note: expanded from macro 'put_user_inline'
     872 |         efault:                                                 \
         |         ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
     869 |         scoped_user_write_access(_tmpdst, efault)               \
         |         ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
     803 |         scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
         |         ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
     791 |         __scoped_user_access(write, udst, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
     604 |                 if (node_updated && put_user_inline(node, naddr))
         |                                     ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
     870 |                 unsafe_put_user(val, _tmpdst, efault);          \
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
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:872:2: note: expanded from macro 'put_user_inline'
     872 |         efault:                                                 \
         |         ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
     869 |         scoped_user_write_access(_tmpdst, efault)               \
         |         ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
     803 |         scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
         |         ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
     791 |         __scoped_user_access(write, udst, size, elbl)
         |         ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
     755 |                 for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
         |                                                  ^
   kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
     604 |                 if (node_updated && put_user_inline(node, naddr))


vim +288 kernel/futex/futex.h

   283	
   284	/* Read from user memory with pagefaults disabled */
   285	static inline int futex_get_value_locked(u32 *dest, u32 __user *from)
   286	{
   287		guard(pagefault)();
 > 288		return get_user_inline(*dest, from);
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
