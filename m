Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937AA3E0C4D;
	Wed,  8 Jul 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543058; cv=none; b=JGUJEFU68MIgfjO+ivqD1/FRiLllRNBaSmxgnXnnTPS26dK+46YtkzHMsg1Gd5GEBVOxBch/2rPeUQB/G4fumtISEa1P7mvIUK0ecCnDVtWxWhYX0+GTUZMDjh41Yt4xg9wjIIydLCALU3/OpPY5MWEcVVSondr79XulPIIN2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543058; c=relaxed/simple;
	bh=/ZNrIN3o4ae1u8yLeCAt9BsQDC28uhfwDSnL7xlXPrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CD2nSmaDqn8z7TdCeQ7U5IUkxuoAVksSM8x3/iCRKWh06ENEo2TPEa/5A/HZLsEzVZJPOeDINCg9fb1yaFvjgqZpjDgZeEThtvenApWG7ZxxiGKy1KEkAYtEymn5N/yllwjV2UpUktd9Nz3l5buM8S8LMNH2Dz08CnGbksW4VN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHeAcAQG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHeAcAQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783543056; x=1815079056;
  h=date:from:to:cc:subject:message-id;
  bh=/ZNrIN3o4ae1u8yLeCAt9BsQDC28uhfwDSnL7xlXPrg=;
  b=mHeAcAQGhPeOHFzqxy4gOZt+mC+AjV9WMD98TiTY+3xbQ/MUaCR7A0Sd
   gRKGrNhFN3R2pmIoA04yblDZ0rA6npOQTBoVa9vgM9iGA7JBvj0sp61kC
   jbw9OQvXARCftGcvtt6i++ghjfDGEtLjKJOAXLMFSf3VoWAEUjvvl46U7
   EqxExkCm9nf2w9ZEGcxaKqHD0b7OxKQv5kj511gJj6i01mCwWFoEmASEk
   TQU26Q94jqGpOmiW8NNa3qMCtmjMUMU173wkuENNmwmTfl4pzaw9l3Aqz
   JWs2XYvHej+LKc+8E0FocbFEY4eLrj6n5EWkSO7zDPXA82hzJ31QpGySb
   Q==;
X-CSE-ConnectionGUID: Gg7VuX/1Tk6fGvCt4zPJ9A==
X-CSE-MsgGUID: XqGnaY8nRiKQl3fiiJ1Gbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95594111"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95594111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 13:37:35 -0700
X-CSE-ConnectionGUID: otAo1BbAQkKDSIXXWNvbPw==
X-CSE-MsgGUID: TlThI7fhQV+pdzBWClpFjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249969699"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2026 13:37:33 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whZ1P-000000002mz-37rx;
	Wed, 08 Jul 2026 20:37:31 +0000
Date: Wed, 08 Jul 2026 22:36:41 +0200
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/time/jiffies.c:114:9: error: call to undeclared
 function 'proc_int_u2k_conv_uop'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607082257.zbH9VQsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Petr-Pavlu/umh-treewide-Explicitly-include-linux-umh-h-where-needed/20260708-234758
head:   d8311a93fd7c77f1a64787baaa1bd0e431a0f717
commit: d8311a93fd7c77f1a64787baaa1bd0e431a0f717 module: Bring includes in linux/kmod.h up to date
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260708/202607082257.zbH9VQsN-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082257.zbH9VQsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082257.zbH9VQsN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/jiffies.c:114:9: error: call to undeclared function 'proc_int_u2k_conv_uop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, mult_hz);
         |                ^
>> kernel/time/jiffies.c:119:9: error: call to undeclared function 'proc_int_k2u_conv_kop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |         return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, div_hz);
         |                ^
   kernel/time/jiffies.c:124:9: error: call to undeclared function 'proc_int_u2k_conv_uop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     124 |         return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, clock_t_to_jiffies);
         |                ^
   kernel/time/jiffies.c:134:9: error: call to undeclared function 'proc_int_k2u_conv_kop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_clock_t);
         |                ^
   kernel/time/jiffies.c:144:9: error: call to undeclared function 'proc_int_u2k_conv_uop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, sysctl_msecs_to_jiffies);
         |                ^
   kernel/time/jiffies.c:154:9: error: call to undeclared function 'proc_int_k2u_conv_kop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |         return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_msecs);
         |                ^
>> kernel/time/jiffies.c:160:9: error: call to undeclared function 'proc_int_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     160 |         return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
         |                ^
   kernel/time/jiffies.c:168:9: error: call to undeclared function 'proc_int_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |         return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
         |                ^
   kernel/time/jiffies.c:176:9: error: call to undeclared function 'proc_int_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
         |                ^
   kernel/time/jiffies.c:184:9: error: call to undeclared function 'proc_int_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |         return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
         |                ^
>> kernel/time/jiffies.c:234:9: error: call to undeclared function 'proc_dointvec_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |         return proc_dointvec_conv(table, dir, buffer, lenp, ppos,
         |                ^
   kernel/time/jiffies.c:257:9: error: call to undeclared function 'proc_dointvec_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |         return proc_dointvec_conv(table, dir, buffer, lenp, ppos,
         |                ^
   kernel/time/jiffies.c:280:9: error: call to undeclared function 'proc_dointvec_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     280 |         return proc_dointvec_conv(table, dir, buffer, lenp, ppos,
         |                ^
   kernel/time/jiffies.c:288:9: error: call to undeclared function 'proc_dointvec_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         return proc_dointvec_conv(table, dir, buffer, lenp, ppos,
         |                ^
   kernel/time/jiffies.c:312:9: error: call to undeclared function 'proc_doulongvec_minmax_conv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |         return proc_doulongvec_minmax_conv(table, dir, buffer, lenp, ppos,
         |                ^
   15 errors generated.


vim +/proc_int_u2k_conv_uop +114 kernel/time/jiffies.c

ef153851af5b05 Joel Granados 2025-12-03  111  
ef153851af5b05 Joel Granados 2025-12-03  112  static int sysctl_u2k_int_conv_hz(const bool *negp, const ulong *u_ptr, int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  113  {
ef153851af5b05 Joel Granados 2025-12-03 @114  	return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, mult_hz);
ef153851af5b05 Joel Granados 2025-12-03  115  }
ef153851af5b05 Joel Granados 2025-12-03  116  
ef153851af5b05 Joel Granados 2025-12-03  117  static int sysctl_k2u_int_conv_hz(bool *negp, ulong *u_ptr, const int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  118  {
ef153851af5b05 Joel Granados 2025-12-03 @119  	return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, div_hz);
ef153851af5b05 Joel Granados 2025-12-03  120  }
ef153851af5b05 Joel Granados 2025-12-03  121  
ef153851af5b05 Joel Granados 2025-12-03  122  static int sysctl_u2k_int_conv_userhz(const bool *negp, const ulong *u_ptr, int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  123  {
ef153851af5b05 Joel Granados 2025-12-03  124  	return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, clock_t_to_jiffies);
ef153851af5b05 Joel Granados 2025-12-03  125  }
ef153851af5b05 Joel Granados 2025-12-03  126  
ef153851af5b05 Joel Granados 2025-12-03  127  static ulong sysctl_jiffies_to_clock_t(const ulong val)
ef153851af5b05 Joel Granados 2025-12-03  128  {
ef153851af5b05 Joel Granados 2025-12-03  129  	return jiffies_to_clock_t(val);
ef153851af5b05 Joel Granados 2025-12-03  130  }
ef153851af5b05 Joel Granados 2025-12-03  131  
ef153851af5b05 Joel Granados 2025-12-03  132  static int sysctl_k2u_int_conv_userhz(bool *negp, ulong *u_ptr, const int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  133  {
ef153851af5b05 Joel Granados 2025-12-03 @134  	return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_clock_t);
ef153851af5b05 Joel Granados 2025-12-03  135  }
ef153851af5b05 Joel Granados 2025-12-03  136  
ef153851af5b05 Joel Granados 2025-12-03  137  static ulong sysctl_msecs_to_jiffies(const ulong val)
ef153851af5b05 Joel Granados 2025-12-03  138  {
ef153851af5b05 Joel Granados 2025-12-03  139  	return msecs_to_jiffies(val);
ef153851af5b05 Joel Granados 2025-12-03  140  }
ef153851af5b05 Joel Granados 2025-12-03  141  
ef153851af5b05 Joel Granados 2025-12-03  142  static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  143  {
ef153851af5b05 Joel Granados 2025-12-03  144  	return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, sysctl_msecs_to_jiffies);
ef153851af5b05 Joel Granados 2025-12-03  145  }
ef153851af5b05 Joel Granados 2025-12-03  146  
ef153851af5b05 Joel Granados 2025-12-03  147  static ulong sysctl_jiffies_to_msecs(const ulong val)
ef153851af5b05 Joel Granados 2025-12-03  148  {
ef153851af5b05 Joel Granados 2025-12-03  149  	return jiffies_to_msecs(val);
ef153851af5b05 Joel Granados 2025-12-03  150  }
ef153851af5b05 Joel Granados 2025-12-03  151  
ef153851af5b05 Joel Granados 2025-12-03  152  static int sysctl_k2u_int_conv_ms(bool *negp, ulong *u_ptr, const int *k_ptr)
ef153851af5b05 Joel Granados 2025-12-03  153  {
ef153851af5b05 Joel Granados 2025-12-03  154  	return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_msecs);
ef153851af5b05 Joel Granados 2025-12-03  155  }
ef153851af5b05 Joel Granados 2025-12-03  156  
d174174c6776a3 Joel Granados 2025-12-04  157  static int do_proc_int_conv_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
d174174c6776a3 Joel Granados 2025-12-04  158  				    int dir, const struct ctl_table *tbl)
d174174c6776a3 Joel Granados 2025-12-04  159  {
d174174c6776a3 Joel Granados 2025-12-04 @160  	return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
d174174c6776a3 Joel Granados 2025-12-04  161  			     sysctl_u2k_int_conv_hz, sysctl_k2u_int_conv_hz);
d174174c6776a3 Joel Granados 2025-12-04  162  }
ef153851af5b05 Joel Granados 2025-12-03  163  
d174174c6776a3 Joel Granados 2025-12-04  164  static int do_proc_int_conv_userhz_jiffies(bool *negp, ulong *u_ptr,
d174174c6776a3 Joel Granados 2025-12-04  165  					   int *k_ptr, int dir,
d174174c6776a3 Joel Granados 2025-12-04  166  					   const struct ctl_table *tbl)
d174174c6776a3 Joel Granados 2025-12-04  167  {
d174174c6776a3 Joel Granados 2025-12-04 @168  	return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
ef153851af5b05 Joel Granados 2025-12-03  169  			     sysctl_u2k_int_conv_userhz,
d174174c6776a3 Joel Granados 2025-12-04  170  			     sysctl_k2u_int_conv_userhz);
d174174c6776a3 Joel Granados 2025-12-04  171  }
d174174c6776a3 Joel Granados 2025-12-04  172  
d174174c6776a3 Joel Granados 2025-12-04  173  static int do_proc_int_conv_ms_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
d174174c6776a3 Joel Granados 2025-12-04  174  				       int dir, const struct ctl_table *tbl)
d174174c6776a3 Joel Granados 2025-12-04  175  {
d174174c6776a3 Joel Granados 2025-12-04  176  	return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
d174174c6776a3 Joel Granados 2025-12-04  177  			     sysctl_u2k_int_conv_ms, sysctl_k2u_int_conv_ms);
d174174c6776a3 Joel Granados 2025-12-04  178  }
d174174c6776a3 Joel Granados 2025-12-04  179  
d174174c6776a3 Joel Granados 2025-12-04  180  static int do_proc_int_conv_ms_jiffies_minmax(bool *negp, ulong *u_ptr,
d174174c6776a3 Joel Granados 2025-12-04  181  					      int *k_ptr, int dir,
d174174c6776a3 Joel Granados 2025-12-04  182  					      const struct ctl_table *tbl)
d174174c6776a3 Joel Granados 2025-12-04  183  {
d174174c6776a3 Joel Granados 2025-12-04  184  	return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
d174174c6776a3 Joel Granados 2025-12-04  185  			     sysctl_u2k_int_conv_ms, sysctl_k2u_int_conv_ms);
d174174c6776a3 Joel Granados 2025-12-04  186  }
ef153851af5b05 Joel Granados 2025-12-03  187  
ef153851af5b05 Joel Granados 2025-12-03  188  #else // CONFIG_PROC_SYSCTL
ef153851af5b05 Joel Granados 2025-12-03  189  static int do_proc_int_conv_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
ef153851af5b05 Joel Granados 2025-12-03  190  				    int dir, const struct ctl_table *tbl)
ef153851af5b05 Joel Granados 2025-12-03  191  {
ef153851af5b05 Joel Granados 2025-12-03  192  	return -ENOSYS;
ef153851af5b05 Joel Granados 2025-12-03  193  }
ef153851af5b05 Joel Granados 2025-12-03  194  
ef153851af5b05 Joel Granados 2025-12-03  195  static int do_proc_int_conv_userhz_jiffies(bool *negp, ulong *u_ptr,
ef153851af5b05 Joel Granados 2025-12-03  196  					   int *k_ptr, int dir,
ef153851af5b05 Joel Granados 2025-12-03  197  					   const struct ctl_table *tbl)
ef153851af5b05 Joel Granados 2025-12-03  198  {
ef153851af5b05 Joel Granados 2025-12-03  199  	return -ENOSYS;
ef153851af5b05 Joel Granados 2025-12-03  200  }
ef153851af5b05 Joel Granados 2025-12-03  201  
ef153851af5b05 Joel Granados 2025-12-03  202  static int do_proc_int_conv_ms_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
ef153851af5b05 Joel Granados 2025-12-03  203  				       int dir, const struct ctl_table *tbl)
ef153851af5b05 Joel Granados 2025-12-03  204  {
ef153851af5b05 Joel Granados 2025-12-03  205  	return -ENOSYS;
ef153851af5b05 Joel Granados 2025-12-03  206  }
ef153851af5b05 Joel Granados 2025-12-03  207  
ef153851af5b05 Joel Granados 2025-12-03  208  static int do_proc_int_conv_ms_jiffies_minmax(bool *negp, ulong *u_ptr,
ef153851af5b05 Joel Granados 2025-12-03  209  					      int *k_ptr, int dir,
ef153851af5b05 Joel Granados 2025-12-03  210  					      const struct ctl_table *tbl)
ef153851af5b05 Joel Granados 2025-12-03  211  {
ef153851af5b05 Joel Granados 2025-12-03  212  	return -ENOSYS;
ef153851af5b05 Joel Granados 2025-12-03  213  }
ef153851af5b05 Joel Granados 2025-12-03  214  #endif
54932988c42309 Joel Granados 2025-10-14  215  
54932988c42309 Joel Granados 2025-10-14  216  /**
54932988c42309 Joel Granados 2025-10-14  217   * proc_dointvec_jiffies - read a vector of integers as seconds
54932988c42309 Joel Granados 2025-10-14  218   * @table: the sysctl table
54932988c42309 Joel Granados 2025-10-14  219   * @dir: %TRUE if this is a write to the sysctl file
54932988c42309 Joel Granados 2025-10-14  220   * @buffer: the user buffer
54932988c42309 Joel Granados 2025-10-14  221   * @lenp: the size of the user buffer
54932988c42309 Joel Granados 2025-10-14  222   * @ppos: file position
54932988c42309 Joel Granados 2025-10-14  223   *
54932988c42309 Joel Granados 2025-10-14  224   * Reads/writes up to table->maxlen/sizeof(unsigned int) integer
54932988c42309 Joel Granados 2025-10-14  225   * values from/to the user buffer, treated as an ASCII string.
54932988c42309 Joel Granados 2025-10-14  226   * The values read are assumed to be in seconds, and are converted into
54932988c42309 Joel Granados 2025-10-14  227   * jiffies.
54932988c42309 Joel Granados 2025-10-14  228   *
54932988c42309 Joel Granados 2025-10-14  229   * Returns 0 on success.
54932988c42309 Joel Granados 2025-10-14  230   */
54932988c42309 Joel Granados 2025-10-14  231  int proc_dointvec_jiffies(const struct ctl_table *table, int dir,
54932988c42309 Joel Granados 2025-10-14  232  			  void *buffer, size_t *lenp, loff_t *ppos)
54932988c42309 Joel Granados 2025-10-14  233  {
54932988c42309 Joel Granados 2025-10-14 @234  	return proc_dointvec_conv(table, dir, buffer, lenp, ppos,
54932988c42309 Joel Granados 2025-10-14  235  				  do_proc_int_conv_jiffies);
54932988c42309 Joel Granados 2025-10-14  236  }
54932988c42309 Joel Granados 2025-10-14  237  EXPORT_SYMBOL(proc_dointvec_jiffies);
54932988c42309 Joel Granados 2025-10-14  238  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
