Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4D10E3;
	Fri, 18 Jul 2025 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752815930; cv=none; b=HOQxvWouA0MB9Lmx/5zOi6CdAWAQJIPNs0t9fE8XkLnKECj+g1888KCvtt7+4k6lbZZbySHDoCeSkeG4OpNO6CW3YEzqh17Bhrj/la6U59JWHgmETAj0JJq2ctfWLGJWn6DMaF/AjaD1mElPZPdDMk8hTQfdUyxTFGCfipKstpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752815930; c=relaxed/simple;
	bh=y4lCUG/2o9YK7gd+GQzt7Xr5Z+T0w8Jx9Rr8A5puefA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9HFkNz8gTUnTGIj97+s3Dc+bXJg9Qd16pUDx2jNM1GeA8er0XRzsR20IsvGsL+Cv3IOjJznF6BB98pPJFEyeoCZ0pTMG49EDNHGitMt72rilv5/bFCgea3lJqGjm/MW6TFOTuheA/1bm8EpjyqkOFBcw4gX28IqVOtUCrsj9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaJA4sdF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaJA4sdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752815928; x=1784351928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4lCUG/2o9YK7gd+GQzt7Xr5Z+T0w8Jx9Rr8A5puefA=;
  b=HaJA4sdFuXjbHY9txYjb8Cqa/Y9z39Ae3jASwijXCnfTip9jmMTssqGP
   xqx7OSwonQElvLdVFGnIeHXEBNrPYFRqhaIkx4MsIXhzYkkltTNZ+EISI
   h7dBqNchQwRQKr11HofZq9edGi2Ygl3BkqT1Nl3t0DW01xGGwPP4oHZGH
   jGSyD/5oMlYb7cqdrMOMj1qwLP3xZLsP9KWy2l9V5scSshl7S+s7Aq6SD
   SQnK9aVQ08PcuKcPPkdlA/VswweU3uJzbPhxI5PFwVhl1wI8m2uJ/JdW+
   g/jMvQ8onsga5ngj9TJ2gbnGhK4rqiAeSvVrui1Yn7H1THIt2T1/VGFVh
   g==;
X-CSE-ConnectionGUID: QjTIztEMQ66eFjamYLfEnA==
X-CSE-MsgGUID: UZNLXwzUSua6EbZeF1wwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55250573"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="55250573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 22:18:47 -0700
X-CSE-ConnectionGUID: 5Gn5GAWLR4q6Vy0UJwGg6Q==
X-CSE-MsgGUID: cfhFStRpTaiyZKlFVh1cNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158538890"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2025 22:18:46 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucdUa-0000qL-0u;
	Fri, 18 Jul 2025 05:18:44 +0000
Date: Fri, 18 Jul 2025 07:18:04 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 5/22]
 kernel/trace/rv/../trace.h:907:24: error: incomplete definition of type
 'struct ftrace_hash'
Message-ID: <202507180746.681PM7BT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   d0503d4013c49a3fde856947dfffe6c80c178eb1
commit: 1fcafd4d20b5c6b573c4a040b473d15bdb9c26a2 [5/22] ftrace: Export some of hash related functions
config: i386-buildonly-randconfig-2004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180746.681PM7BT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180746.681PM7BT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180746.681PM7BT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/rv.c:151:
   In file included from kernel/trace/rv/rv.h:9:
   In file included from kernel/trace/rv/../trace.h:13:
   include/linux/ftrace.h:575:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:580:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:585:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:585:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   In file included from kernel/trace/rv/rv.c:151:
   In file included from kernel/trace/rv/rv.h:9:
>> kernel/trace/rv/../trace.h:907:24: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   In file included from kernel/trace/rv/rv.c:151:
   In file included from kernel/trace/rv/rv.h:9:
   kernel/trace/rv/../trace.h:907:40: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   3 warnings and 2 errors generated.


vim +907 kernel/trace/rv/../trace.h

4046bf023b0647 Namhyung Kim            2017-01-20  904  
eb583cd484f9a7 Arnd Bergmann           2017-01-23  905  static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
4046bf023b0647 Namhyung Kim            2017-01-20  906  {
8c08f0d5c6fb10 Steven Rostedt (VMware  2017-06-26 @907) 	return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
4046bf023b0647 Namhyung Kim            2017-01-20  908  }
4046bf023b0647 Namhyung Kim            2017-01-20  909  

:::::: The code at line 907 was first introduced by commit
:::::: 8c08f0d5c6fb10ff93ffb1cbf416f4f1c3a52a80 ftrace: Have cached module filters be an active filter

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
