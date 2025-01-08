Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D51F63D9;
	Wed,  8 Jan 2025 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333106; cv=none; b=YctSiWLpnRXmUdG058q47VUKNZbYXMsyy/lMl/v1AYkcf1mCQ0Ve6IDy3gtFbkZTMk4Zh1Y0jIBmTZy0UjfM+flSqW8xhY7GHMw/g9/lf4+yXVqI/1wmh98fEEbaSUUHYd7yQk9p107jOvdkVh1y+aFBant9aZPOjxpv/G7STlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333106; c=relaxed/simple;
	bh=jZj3U9zvGp9RhbZY0dGhreiLlwmJSPwf2VgRcFBQfGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJG47XZ3pMSNvirxKhNOBkYHjfQSuxXRTtyBMA7VBUKP02jeVr97HB7fkfIA4dyEbce93yz8/SIrCpqv55I/SnHtO3ykCBv7VQ3NB9do9ZwvzkXVldVomzUiEKcjVcSGw46oMmrn3O1NuYedhpGFaC6GDuLSO8Z1hQfm0epy1mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M81k1ls9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M81k1ls9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736333103; x=1767869103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZj3U9zvGp9RhbZY0dGhreiLlwmJSPwf2VgRcFBQfGM=;
  b=M81k1ls9LvwQATFldDnB9cgIadc70I/kFQt/PfX81CCIvtS8AOBVsi3K
   dLAsh/m32jfYQYa7I0cwJx2tUDq2171CDPuMlXDBM0zpxrVZrAIlr0wCG
   pk4EmKnQQBYeyVvi45JYXgtZoIIM1EUJbkURdwdMsWzRXdUgeHvB5YRRV
   6a8kNP8YkrZwUv/LpyQbP89poPFJTy3MVixyFoJLjJxzQ7nT1hv1IUv3S
   5UnwBH5pxJ2FQpCwoh37FThWdWr4lgKnAakOpZwOJE1WbrsBVF2sIt1nu
   TYn4EZaF9JBrBCl3q77bdW1uIsnEFgdP8QGUy54ELdv122OQbRzD5OAwj
   Q==;
X-CSE-ConnectionGUID: PvgqRsV7TK+FFgULPlpxXA==
X-CSE-MsgGUID: MQJMswZGSZe3BSkxKdh2Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47542743"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47542743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:45:03 -0800
X-CSE-ConnectionGUID: OZkRvRVeRQSUe1P5gmOlkQ==
X-CSE-MsgGUID: Jnqb0PWKQUuZlQS9XJ0Pew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103117447"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Jan 2025 02:44:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTYU-000Fww-1A;
	Wed, 08 Jan 2025 10:44:54 +0000
Date: Wed, 8 Jan 2025 18:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v1 20/22] bpf: Introduce rqspinlock kfuncs
Message-ID: <202501081854.xzCcM6nm-lkp@intel.com>
References: <20250107140004.2732830-21-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107140004.2732830-21-memxor@gmail.com>

Hi Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on f44275e7155dc310d36516fc25be503da099781c]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/locking-Move-MCS-struct-definition-to-public-header/20250107-220615
base:   f44275e7155dc310d36516fc25be503da099781c
patch link:    https://lore.kernel.org/r/20250107140004.2732830-21-memxor%40gmail.com
patch subject: [PATCH bpf-next v1 20/22] bpf: Introduce rqspinlock kfuncs
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250108/202501081854.xzCcM6nm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081854.xzCcM6nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081854.xzCcM6nm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
      44 | } arch_spinlock_t;
         |   ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
      25 | typedef struct { } arch_spinlock_t;
         |                    ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |         ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
      27 | #define __ARCH_SPIN_LOCK_UNLOCKED { }
         |         ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:144:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
     144 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         |         ^
   include/linux/spinlock_up.h:62:9: note: previous definition is here
      62 | #define arch_spin_is_locked(lock)       ((void)(lock), 0)
         |         ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:145:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
     145 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
         |         ^
   include/linux/spinlock_up.h:69:9: note: previous definition is here
      69 | #define arch_spin_is_contended(lock)    (((void)(lock), 0))
         |         ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:147:9: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
     147 | #define arch_spin_lock(l)               queued_spin_lock(l)
         |         ^
   include/linux/spinlock_up.h:64:10: note: previous definition is here
      64 | # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
         |          ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:148:9: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
     148 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
         |         ^
   include/linux/spinlock_up.h:66:10: note: previous definition is here
      66 | # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
         |          ^
   In file included from fs/kernfs/mount.c:22:
   In file included from fs/kernfs/kernfs-internal.h:20:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:149:9: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
     149 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
         |         ^
   include/linux/spinlock_up.h:65:10: note: previous definition is here
      65 | # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
         |          ^
   6 warnings and 1 error generated.
--
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
      44 | } arch_spinlock_t;
         |   ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
      25 | typedef struct { } arch_spinlock_t;
         |                    ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |         ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
      27 | #define __ARCH_SPIN_LOCK_UNLOCKED { }
         |         ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:144:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
     144 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         |         ^
   include/linux/spinlock_up.h:62:9: note: previous definition is here
      62 | #define arch_spin_is_locked(lock)       ((void)(lock), 0)
         |         ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:145:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
     145 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
         |         ^
   include/linux/spinlock_up.h:69:9: note: previous definition is here
      69 | #define arch_spin_is_contended(lock)    (((void)(lock), 0))
         |         ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:147:9: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
     147 | #define arch_spin_lock(l)               queued_spin_lock(l)
         |         ^
   include/linux/spinlock_up.h:64:10: note: previous definition is here
      64 | # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
         |          ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:148:9: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
     148 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
         |         ^
   include/linux/spinlock_up.h:66:10: note: previous definition is here
      66 | # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
         |          ^
   In file included from fs/kernfs/inode.c:16:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:149:9: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
     149 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
         |         ^
   include/linux/spinlock_up.h:65:10: note: previous definition is here
      65 | # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
         |          ^
   fs/kernfs/inode.c:29:9: warning: excess elements in struct initializer [-Wexcess-initializers]
      29 |         static DEFINE_MUTEX(iattr_mutex);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:87:27: note: expanded from macro 'DEFINE_MUTEX'
      87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:81:18: note: expanded from macro '__MUTEX_INITIALIZER'
      81 |                 , .wait_lock = __RAW_SPIN_LOCK_UNLOCKED(lockname.wait_lock) \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:69:19: note: expanded from macro '__RAW_SPIN_LOCK_UNLOCKED'
      69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:64:14: note: expanded from macro '__RAW_SPIN_LOCK_INITIALIZER'
      64 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.
--
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:44:3: error: typedef redefinition with different types ('struct qspinlock' vs 'struct arch_spinlock_t')
      44 | } arch_spinlock_t;
         |   ^
   include/linux/spinlock_types_up.h:25:20: note: previous definition is here
      25 | typedef struct { } arch_spinlock_t;
         |                    ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:7:
>> include/asm-generic/qspinlock_types.h:49:9: warning: '__ARCH_SPIN_LOCK_UNLOCKED' macro redefined [-Wmacro-redefined]
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |         ^
   include/linux/spinlock_types_up.h:27:9: note: previous definition is here
      27 | #define __ARCH_SPIN_LOCK_UNLOCKED { }
         |         ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:144:9: warning: 'arch_spin_is_locked' macro redefined [-Wmacro-redefined]
     144 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         |         ^
   include/linux/spinlock_up.h:62:9: note: previous definition is here
      62 | #define arch_spin_is_locked(lock)       ((void)(lock), 0)
         |         ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:145:9: warning: 'arch_spin_is_contended' macro redefined [-Wmacro-redefined]
     145 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
         |         ^
   include/linux/spinlock_up.h:69:9: note: previous definition is here
      69 | #define arch_spin_is_contended(lock)    (((void)(lock), 0))
         |         ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:147:9: warning: 'arch_spin_lock' macro redefined [-Wmacro-redefined]
     147 | #define arch_spin_lock(l)               queued_spin_lock(l)
         |         ^
   include/linux/spinlock_up.h:64:10: note: previous definition is here
      64 | # define arch_spin_lock(lock)           do { barrier(); (void)(lock); } while (0)
         |          ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:148:9: warning: 'arch_spin_trylock' macro redefined [-Wmacro-redefined]
     148 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
         |         ^
   include/linux/spinlock_up.h:66:10: note: previous definition is here
      66 | # define arch_spin_trylock(lock)        ({ barrier(); (void)(lock); 1; })
         |          ^
   In file included from fs/kernfs/dir.c:15:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:18:
   In file included from include/asm-generic/rqspinlock.h:15:
   In file included from arch/x86/include/asm/qspinlock.h:114:
>> include/asm-generic/qspinlock.h:149:9: warning: 'arch_spin_unlock' macro redefined [-Wmacro-redefined]
     149 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
         |         ^
   include/linux/spinlock_up.h:65:10: note: previous definition is here
      65 | # define arch_spin_unlock(lock) do { barrier(); (void)(lock); } while (0)
         |          ^
   fs/kernfs/dir.c:28:8: warning: excess elements in struct initializer [-Wexcess-initializers]
      28 | static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:43:43: note: expanded from macro 'DEFINE_SPINLOCK'
      43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:41:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
      41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:38:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
      38 |         { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:33:14: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
      33 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:30:8: warning: excess elements in struct initializer [-Wexcess-initializers]
      30 | static DEFINE_SPINLOCK(kernfs_idr_lock);        /* root->ino_idr */
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:43:43: note: expanded from macro 'DEFINE_SPINLOCK'
      43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:41:15: note: expanded from macro '__SPIN_LOCK_UNLOCKED'
      41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:38:15: note: expanded from macro '__SPIN_LOCK_INITIALIZER'
      38 |         { { .rlock = ___SPIN_LOCK_INITIALIZER(lockname) } }
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:33:14: note: expanded from macro '___SPIN_LOCK_INITIALIZER'
      33 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:37: note: expanded from macro '__ARCH_SPIN_LOCK_UNLOCKED'
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings and 1 error generated.
..


vim +/arch_spin_is_locked +144 include/asm-generic/qspinlock.h

2aa79af6426319 Peter Zijlstra (Intel  2015-04-24  138) 
ab83647fadae2f Alexandre Ghiti        2024-11-03  139  #ifndef __no_arch_spinlock_redefine
a33fda35e3a765 Waiman Long            2015-04-24  140  /*
a33fda35e3a765 Waiman Long            2015-04-24  141   * Remapping spinlock architecture specific functions to the corresponding
a33fda35e3a765 Waiman Long            2015-04-24  142   * queued spinlock functions.
a33fda35e3a765 Waiman Long            2015-04-24  143   */
a33fda35e3a765 Waiman Long            2015-04-24 @144  #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
a33fda35e3a765 Waiman Long            2015-04-24 @145  #define arch_spin_is_contended(l)	queued_spin_is_contended(l)
a33fda35e3a765 Waiman Long            2015-04-24  146  #define arch_spin_value_unlocked(l)	queued_spin_value_unlocked(l)
a33fda35e3a765 Waiman Long            2015-04-24 @147  #define arch_spin_lock(l)		queued_spin_lock(l)
a33fda35e3a765 Waiman Long            2015-04-24 @148  #define arch_spin_trylock(l)		queued_spin_trylock(l)
a33fda35e3a765 Waiman Long            2015-04-24 @149  #define arch_spin_unlock(l)		queued_spin_unlock(l)
ab83647fadae2f Alexandre Ghiti        2024-11-03  150  #endif
a33fda35e3a765 Waiman Long            2015-04-24  151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
