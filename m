Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1C374EA;
	Sat,  5 Oct 2024 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728144861; cv=none; b=jZY+b3pTG8bGjksFio5f8TRg1MDr5Z/lYwor5MOxu5kJCBDKrQ/QPA6n/t44t6x27ZuusNfPQ0hyjPyNkqVTvMhEAXCH/RD/tOU9lCBf37I7ntlBK9b4PkRIMZgBhgK9VmxtZ7GOjqh8o9oTbPTAfwSln7jOTgDJacE5zQeTcSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728144861; c=relaxed/simple;
	bh=dP6hTia6kanRux/iwqPSf7xjd7U3f/mifXmAoNu6JxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqIdrryZHYdiqJjNLL+eNx3fdIAg+yxePrvDSxY7C/gDOoTL5Nirmcads/Jay3mCsHc95NxLVl+uSrUrBCoOWc+GUMY2i8Tls9D0Gbdu46xXmJl2OXiewrrNx3BXTfWCLiK3NPEbEQxtficADDj1djgPeDSjxPle/OWrDrQ+uRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7aIaPVy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7aIaPVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728144859; x=1759680859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dP6hTia6kanRux/iwqPSf7xjd7U3f/mifXmAoNu6JxY=;
  b=i7aIaPVyThr8I6z/INchE1y2xB85Z/+R+xARIR5pZa1n6y1GxqWRW/lT
   zb4t2Sq9+PnIXhY1H8zxPu9U+y4xchdKpMJ6o8002xNBq7V8LybudzITR
   JdW8Pz3eUnYZnpsGMzFphLtIM3j6I+7j4senJuAeWi6K0wbyPZoGX3+xv
   n2mG8eMQr6rbMIsQOHxf02RF5m5o5AT/77YT4EpXa1lNEw1eHUZb7Cb/4
   gKv06/+Ehi/lShbV2xtjiTHo8uoCoxR5cPRiI+1hN+aD0D3xLld9O96Yr
   3IKxzRB6fZTMbiSao1NNCnwjCkqiIX2cZbInr9sd1Twc39a6/VVJ0RJ5h
   Q==;
X-CSE-ConnectionGUID: 8Iviww+lQI2UtNJdVfVHtg==
X-CSE-MsgGUID: PDn0Fp1NR7enVombwohUzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="52744827"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="52744827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 09:14:18 -0700
X-CSE-ConnectionGUID: LgIoTkPCT+yYxhzWr32iXw==
X-CSE-MsgGUID: dTDV0oRbTrSE+utD1oRp5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="74988956"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Oct 2024 09:14:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx7Q6-00037G-1w;
	Sat, 05 Oct 2024 16:14:14 +0000
Date: Sun, 6 Oct 2024 00:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 10/27] kernel/jump_label.c:185:19: error: use of
 undeclared identifier 'static_key_slow_inc_cpuslocked'; did you mean
 'static_key_slow_dec_deferred'?
Message-ID: <202410060052.YNWtim6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   0d0ee8bd78a020881af96974dc0e72416b29d14c
commit: 3aa7a4c6571f539734621e2d103f428abeaf903f [10/27] jump_label: export static_key_slow_{inc,dec}_cpuslocked()
config: x86_64-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241006/202410060052.YNWtim6p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060052.YNWtim6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060052.YNWtim6p-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                    ^
   kernel/jump_label.c:30:6: error: redefinition of 'jump_label_unlock'
      30 | void jump_label_unlock(void)
         |      ^
   include/linux/jump_label.h:318:20: note: previous definition is here
     318 | static inline void jump_label_unlock(void) {}
         |                    ^
   kernel/jump_label.c:43:6: error: call to undeclared function 'jump_entry_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |         if (jump_entry_key(jea) < jump_entry_key(jeb))
         |             ^
   kernel/jump_label.c:54:6: error: call to undeclared function 'jump_entry_code'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         if (jump_entry_code(jea) < jump_entry_code(jeb))
         |             ^
   kernel/jump_label.c:68:20: error: variable has incomplete type 'struct jump_entry'
      68 |         struct jump_entry tmp = *jea;
         |                           ^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:70:5: error: incomplete definition of type 'struct jump_entry'
      70 |         jea->code       = jeb->code - delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:70:17: error: incomplete definition of type 'struct jump_entry'
      70 |         jea->code       = jeb->code - delta;
         |                           ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:71:5: error: incomplete definition of type 'struct jump_entry'
      71 |         jea->target     = jeb->target - delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:71:19: error: incomplete definition of type 'struct jump_entry'
      71 |         jea->target     = jeb->target - delta;
         |                           ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:72:5: error: incomplete definition of type 'struct jump_entry'
      72 |         jea->key        = jeb->key - delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:72:16: error: incomplete definition of type 'struct jump_entry'
      72 |         jea->key        = jeb->key - delta;
         |                           ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:74:5: error: incomplete definition of type 'struct jump_entry'
      74 |         jeb->code       = tmp.code + delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:75:5: error: incomplete definition of type 'struct jump_entry'
      75 |         jeb->target     = tmp.target + delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:76:5: error: incomplete definition of type 'struct jump_entry'
      76 |         jeb->key        = tmp.key + delta;
         |         ~~~^
   kernel/jump_label.c:66:9: note: forward declaration of 'struct jump_entry'
      66 |         struct jump_entry *jea = a;
         |                ^
   kernel/jump_label.c:80:32: warning: declaration of 'struct jump_entry' will not be visible outside of this function [-Wvisibility]
      80 | jump_label_sort_entries(struct jump_entry *start, struct jump_entry *stop)
         |                                ^
   kernel/jump_label.c:89:8: error: invalid application of 'sizeof' to an incomplete type 'struct jump_entry'
      89 |                                         / sizeof(struct jump_entry));
         |                                           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/jump_label.c:80:32: note: forward declaration of 'struct jump_entry'
      80 | jump_label_sort_entries(struct jump_entry *start, struct jump_entry *stop)
         |                                ^
   kernel/jump_label.c:90:20: error: invalid application of 'sizeof' to an incomplete type 'struct jump_entry'
      90 |         sort(start, size, sizeof(struct jump_entry), jump_label_cmp, swapfn);
         |                           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/jump_label.c:80:32: note: forward declaration of 'struct jump_entry'
      80 | jump_label_sort_entries(struct jump_entry *start, struct jump_entry *stop)
         |                                ^
   kernel/jump_label.c:104:5: error: redefinition of 'static_key_count'
     104 | int static_key_count(struct static_key *key)
         |     ^
   include/linux/jump_label.h:259:28: note: previous definition is here
     259 | static __always_inline int static_key_count(struct static_key *key)
         |                            ^
   kernel/jump_label.c:127:6: error: redefinition of 'static_key_fast_inc_not_disabled'
     127 | bool static_key_fast_inc_not_disabled(struct static_key *key)
         |      ^
   include/linux/jump_label.h:285:20: note: previous definition is here
     285 | static inline bool static_key_fast_inc_not_disabled(struct static_key *key)
         |                    ^
>> kernel/jump_label.c:185:19: error: use of undeclared identifier 'static_key_slow_inc_cpuslocked'; did you mean 'static_key_slow_dec_deferred'?
     185 | EXPORT_SYMBOL_GPL(static_key_slow_inc_cpuslocked);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   static_key_slow_dec_deferred
   include/linux/export.h:69:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^
   include/linux/export.h:65:54: note: expanded from macro '_EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:56:16: note: expanded from macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                       ^
   include/linux/jump_label_ratelimit.h:80:20: note: 'static_key_slow_dec_deferred' declared here
      80 | static inline void static_key_slow_dec_deferred(struct static_key_deferred *key)
         |                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +185 kernel/jump_label.c

   150	
   151	bool static_key_slow_inc_cpuslocked(struct static_key *key)
   152	{
   153		lockdep_assert_cpus_held();
   154	
   155		/*
   156		 * Careful if we get concurrent static_key_slow_inc/dec() calls;
   157		 * later calls must wait for the first one to _finish_ the
   158		 * jump_label_update() process.  At the same time, however,
   159		 * the jump_label_update() call below wants to see
   160		 * static_key_enabled(&key) for jumps to be updated properly.
   161		 */
   162		if (static_key_fast_inc_not_disabled(key))
   163			return true;
   164	
   165		guard(mutex)(&jump_label_mutex);
   166		/* Try to mark it as 'enabling in progress. */
   167		if (!atomic_cmpxchg(&key->enabled, 0, -1)) {
   168			jump_label_update(key);
   169			/*
   170			 * Ensure that when static_key_fast_inc_not_disabled() or
   171			 * static_key_dec_not_one() observe the positive value,
   172			 * they must also observe all the text changes.
   173			 */
   174			atomic_set_release(&key->enabled, 1);
   175		} else {
   176			/*
   177			 * While holding the mutex this should never observe
   178			 * anything else than a value >= 1 and succeed
   179			 */
   180			if (WARN_ON_ONCE(!static_key_fast_inc_not_disabled(key)))
   181				return false;
   182		}
   183		return true;
   184	}
 > 185	EXPORT_SYMBOL_GPL(static_key_slow_inc_cpuslocked);
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
