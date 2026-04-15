Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B002F9998;
	Wed, 15 Apr 2026 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776284145; cv=none; b=iO5TUOz2SmpBGp6Bqh2/VftQlnjHqNGdiSLxHa1LMBc1vauJib0CzO9jOiTXdfSOUUvhwQRGEW30FmCuMe537xbyjy+vDbKOMtFi7QiPrOLb5x5EV+Vhr0DFw+evwrfzciqiG2PQOOWExHRxxw8Fnc4ML8KG8UO4NfjmDPWAOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776284145; c=relaxed/simple;
	bh=JmLjGTYZ6lvQB+mf004De8KiadB1kEWQNLS82aICFDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tl3Ft86fAQNjSBEzrGj7/lQXwcSO8eIe2Cx/kfM52G7XrjsrQ4O2IDbAzVI+QVVLqt85ia1O5b7e9dBWfLyZqmpxrH+5zS5OXD5wkLDH5U6ooKM0H2/imNM/Z+hcsETLBP3ROQGgICAs5FHLVc0dXBtw0etGrltke7KgOsE1LdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HikoDJwa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HikoDJwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776284143; x=1807820143;
  h=date:from:to:cc:subject:message-id;
  bh=JmLjGTYZ6lvQB+mf004De8KiadB1kEWQNLS82aICFDo=;
  b=HikoDJwaeUklDP1RFISK6Um6vWc8eAd+uWZW4SAhaguRA5Z+4v/8t6n+
   zohqIFD/3Kqo2puHgR2a/beCFvQPVpgWC5JAcrKfiIUTtU0dHqk1T/DW2
   q0LX0XXBdbJVfxDy/PiC8fDJH8dIdkXGKQftPvAwwGkr3EV+wQiqU8LDg
   P1I0TpA5t5DIZFLUBaiUKra1tHpN5bsLiVzVXpfOr6BJLkOWTg7bj2LSt
   7YDjXjAFHJxc1CqpV390PSj+MdsIi0E18tWrlWqOKmKp6KqZDYR9SntIp
   FTkUtEUmWxJa/X/FbnefmP3F+XeXmg9sZZ4vHdOXIr4/OZIzNntlfPyYQ
   Q==;
X-CSE-ConnectionGUID: KC7sJUCNSVi5Oz/GaTe/zA==
X-CSE-MsgGUID: Upse5376RX+8dMh3AV9WmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76975118"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="76975118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 13:15:42 -0700
X-CSE-ConnectionGUID: X24PYXXNTqunZNl/x1AAgA==
X-CSE-MsgGUID: +7qU9e+jTp2DjXNXUvRfcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="232254082"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 13:15:39 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD6e9-000000000tU-1cMm;
	Wed, 15 Apr 2026 20:15:37 +0000
Date: Thu, 16 Apr 2026 04:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: kernel/futex/core.c:604:23: error: cannot jump from this asm
 goto statement to one of its possible targets
Message-ID: <202604160412.f6SIMtr9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5ffc672165ff851063a5fd044b727ab2517ae3
commit: e4e28fd6986e8cf963ec4137e6c0b95403f636ab futex: Convert to get/put_user_inline()
date:   5 months ago
config: powerpc64-randconfig-001-20260416 (https://download.01.org/0day-ci/archive/20260416/202604160412.f6SIMtr9-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160412.f6SIMtr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e4e28fd6986e ("futex: Convert to get/put_user_inline()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160412.f6SIMtr9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
>> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
                   if (node_updated && put_user_inline(node, naddr))
                                       ^
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
           arch_unsafe_put_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
           __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
           ^
   arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
           asm goto(                                       \
           ^
   kernel/futex/core.c:604:23: note: possible target of asm goto statement
   include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
                   unsafe_put_user(val, _tmpdst, efault);          \
                   ^
   include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
           local_label:                                    \
           ^
   kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
           scoped_user_write_access(_tmpdst, efault)               \
           ^
   include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
           scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
           ^
   include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
           __scoped_user_access(write, udst, size, elbl)
           ^
   include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
                   for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
                                                    ^
   6 errors generated.


vim +604 kernel/futex/core.c

   520	
   521	/**
   522	 * get_futex_key() - Get parameters which are the keys for a futex
   523	 * @uaddr:	virtual address of the futex
   524	 * @flags:	FLAGS_*
   525	 * @key:	address where result is stored.
   526	 * @rw:		mapping needs to be read/write (values: FUTEX_READ,
   527	 *              FUTEX_WRITE)
   528	 *
   529	 * Return: a negative error code or 0
   530	 *
   531	 * The key words are stored in @key on success.
   532	 *
   533	 * For shared mappings (when @fshared), the key is:
   534	 *
   535	 *   ( inode->i_sequence, page offset within mapping, offset_within_page )
   536	 *
   537	 * [ also see get_inode_sequence_number() ]
   538	 *
   539	 * For private mappings (or when !@fshared), the key is:
   540	 *
   541	 *   ( current->mm, address, 0 )
   542	 *
   543	 * This allows (cross process, where applicable) identification of the futex
   544	 * without keeping the page pinned for the duration of the FUTEX_WAIT.
   545	 *
   546	 * lock_page() might sleep, the caller should not hold a spinlock.
   547	 */
   548	int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
   549			  enum futex_access rw)
   550	{
   551		unsigned long address = (unsigned long)uaddr;
   552		struct mm_struct *mm = current->mm;
   553		struct page *page;
   554		struct folio *folio;
   555		struct address_space *mapping;
   556		int node, err, size, ro = 0;
   557		bool node_updated = false;
   558		bool fshared;
   559	
   560		fshared = flags & FLAGS_SHARED;
   561		size = futex_size(flags);
   562		if (flags & FLAGS_NUMA)
   563			size *= 2;
   564	
   565		/*
   566		 * The futex address must be "naturally" aligned.
   567		 */
   568		key->both.offset = address % PAGE_SIZE;
   569		if (unlikely((address % size) != 0))
   570			return -EINVAL;
   571		address -= key->both.offset;
   572	
   573		if (unlikely(!access_ok(uaddr, size)))
   574			return -EFAULT;
   575	
   576		if (unlikely(should_fail_futex(fshared)))
   577			return -EFAULT;
   578	
   579		node = FUTEX_NO_NODE;
   580	
   581		if (flags & FLAGS_NUMA) {
   582			u32 __user *naddr = (void *)uaddr + size / 2;
   583	
   584			if (get_user_inline(node, naddr))
   585				return -EFAULT;
   586	
   587			if ((node != FUTEX_NO_NODE) &&
   588			    ((unsigned int)node >= MAX_NUMNODES || !node_possible(node)))
   589				return -EINVAL;
   590		}
   591	
   592		if (node == FUTEX_NO_NODE && (flags & FLAGS_MPOL)) {
   593			node = futex_mpol(mm, address);
   594			node_updated = true;
   595		}
   596	
   597		if (flags & FLAGS_NUMA) {
   598			u32 __user *naddr = (void *)uaddr + size / 2;
   599	
   600			if (node == FUTEX_NO_NODE) {
   601				node = numa_node_id();
   602				node_updated = true;
   603			}
 > 604			if (node_updated && put_user_inline(node, naddr))
   605				return -EFAULT;
   606		}
   607	
   608		key->both.node = node;
   609	
   610		/*
   611		 * PROCESS_PRIVATE futexes are fast.
   612		 * As the mm cannot disappear under us and the 'key' only needs
   613		 * virtual address, we dont even have to find the underlying vma.
   614		 * Note : We do have to check 'uaddr' is a valid user address,
   615		 *        but access_ok() should be faster than find_vma()
   616		 */
   617		if (!fshared) {
   618			/*
   619			 * On no-MMU, shared futexes are treated as private, therefore
   620			 * we must not include the current process in the key. Since
   621			 * there is only one address space, the address is a unique key
   622			 * on its own.
   623			 */
   624			if (IS_ENABLED(CONFIG_MMU))
   625				key->private.mm = mm;
   626			else
   627				key->private.mm = NULL;
   628	
   629			key->private.address = address;
   630			return 0;
   631		}
   632	
   633	again:
   634		/* Ignore any VERIFY_READ mapping (futex common case) */
   635		if (unlikely(should_fail_futex(true)))
   636			return -EFAULT;
   637	
   638		err = get_user_pages_fast(address, 1, FOLL_WRITE, &page);
   639		/*
   640		 * If write access is not required (eg. FUTEX_WAIT), try
   641		 * and get read-only access.
   642		 */
   643		if (err == -EFAULT && rw == FUTEX_READ) {
   644			err = get_user_pages_fast(address, 1, 0, &page);
   645			ro = 1;
   646		}
   647		if (err < 0)
   648			return err;
   649		else
   650			err = 0;
   651	
   652		/*
   653		 * The treatment of mapping from this point on is critical. The folio
   654		 * lock protects many things but in this context the folio lock
   655		 * stabilizes mapping, prevents inode freeing in the shared
   656		 * file-backed region case and guards against movement to swap cache.
   657		 *
   658		 * Strictly speaking the folio lock is not needed in all cases being
   659		 * considered here and folio lock forces unnecessarily serialization.
   660		 * From this point on, mapping will be re-verified if necessary and
   661		 * folio lock will be acquired only if it is unavoidable
   662		 *
   663		 * Mapping checks require the folio so it is looked up now. For
   664		 * anonymous pages, it does not matter if the folio is split
   665		 * in the future as the key is based on the address. For
   666		 * filesystem-backed pages, the precise page is required as the
   667		 * index of the page determines the key.
   668		 */
   669		folio = page_folio(page);
   670		mapping = READ_ONCE(folio->mapping);
   671	
   672		/*
   673		 * If folio->mapping is NULL, then it cannot be an anonymous
   674		 * page; but it might be the ZERO_PAGE or in the gate area or
   675		 * in a special mapping (all cases which we are happy to fail);
   676		 * or it may have been a good file page when get_user_pages_fast
   677		 * found it, but truncated or holepunched or subjected to
   678		 * invalidate_complete_page2 before we got the folio lock (also
   679		 * cases which we are happy to fail).  And we hold a reference,
   680		 * so refcount care in invalidate_inode_page's remove_mapping
   681		 * prevents drop_caches from setting mapping to NULL beneath us.
   682		 *
   683		 * The case we do have to guard against is when memory pressure made
   684		 * shmem_writepage move it from filecache to swapcache beneath us:
   685		 * an unlikely race, but we do need to retry for folio->mapping.
   686		 */
   687		if (unlikely(!mapping)) {
   688			int shmem_swizzled;
   689	
   690			/*
   691			 * Folio lock is required to identify which special case above
   692			 * applies. If this is really a shmem page then the folio lock
   693			 * will prevent unexpected transitions.
   694			 */
   695			folio_lock(folio);
   696			shmem_swizzled = folio_test_swapcache(folio) || folio->mapping;
   697			folio_unlock(folio);
   698			folio_put(folio);
   699	
   700			if (shmem_swizzled)
   701				goto again;
   702	
   703			return -EFAULT;
   704		}
   705	
   706		/*
   707		 * Private mappings are handled in a simple way.
   708		 *
   709		 * If the futex key is stored in anonymous memory, then the associated
   710		 * object is the mm which is implicitly pinned by the calling process.
   711		 *
   712		 * NOTE: When userspace waits on a MAP_SHARED mapping, even if
   713		 * it's a read-only handle, it's expected that futexes attach to
   714		 * the object not the particular process.
   715		 */
   716		if (folio_test_anon(folio)) {
   717			/*
   718			 * A RO anonymous page will never change and thus doesn't make
   719			 * sense for futex operations.
   720			 */
   721			if (unlikely(should_fail_futex(true)) || ro) {
   722				err = -EFAULT;
   723				goto out;
   724			}
   725	
   726			key->both.offset |= FUT_OFF_MMSHARED; /* ref taken on mm */
   727			key->private.mm = mm;
   728			key->private.address = address;
   729	
   730		} else {
   731			struct inode *inode;
   732	
   733			/*
   734			 * The associated futex object in this case is the inode and
   735			 * the folio->mapping must be traversed. Ordinarily this should
   736			 * be stabilised under folio lock but it's not strictly
   737			 * necessary in this case as we just want to pin the inode, not
   738			 * update i_pages or anything like that.
   739			 *
   740			 * The RCU read lock is taken as the inode is finally freed
   741			 * under RCU. If the mapping still matches expectations then the
   742			 * mapping->host can be safely accessed as being a valid inode.
   743			 */
   744			rcu_read_lock();
   745	
   746			if (READ_ONCE(folio->mapping) != mapping) {
   747				rcu_read_unlock();
   748				folio_put(folio);
   749	
   750				goto again;
   751			}
   752	
   753			inode = READ_ONCE(mapping->host);
   754			if (!inode) {
   755				rcu_read_unlock();
   756				folio_put(folio);
   757	
   758				goto again;
   759			}
   760	
   761			key->both.offset |= FUT_OFF_INODE; /* inode-based key */
   762			key->shared.i_seq = get_inode_sequence_number(inode);
   763			key->shared.pgoff = page_pgoff(folio, page);
   764			rcu_read_unlock();
   765		}
   766	
   767	out:
   768		folio_put(folio);
   769		return err;
   770	}
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
