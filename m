Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA723101AE;
	Tue, 16 Dec 2025 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902726; cv=none; b=ClcJVmgbk9r3ErvfJGHcLxDcSCALOfTfqZLsJaTpSEEtdFKKHa+BzhhstuT9uqQk1CVS26nMZlmfs3cRt2Yw6F0ODHm0qN5fwtUNWBBRPMwpZwrraue3eS8llImyNIY/gzlkA6twaX32HwZkam6TveypRCVuANIPE/AgZnUsgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902726; c=relaxed/simple;
	bh=mAHMClaSupiD/N5egNxQbg8yDT3x9dSGgDM71iYTXII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FWISKLto/zJE6F3zmnCrvkgEolfILx5BxLyhzy4VLrnvnyxpZKHXisTraiRXGtp/CA8CP1F+Xt4WsyXkwsjZ2IiDhdch1mpXDT3+uPaTVD2AkqVxuNfKo7nRM21RS8MXaVN7FHm08WXNOqyS1wI5/M86Yp8LR/1sDi7Bxssbedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1MYtC4q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1MYtC4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765902724; x=1797438724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAHMClaSupiD/N5egNxQbg8yDT3x9dSGgDM71iYTXII=;
  b=J1MYtC4qJdtw89HRKsoQYz6s3TeS91U673M1VNBoSpxtR7sleVDk8SXD
   HquqOzIQ1dLPpF5o1MRCg8nj3KmYusFoSsHg1z43c/neYbXTD9spbfUyM
   kNVhDn5p7Is2GrxT6e+NqUQXZc8hLTOWWZ40YyApp4qNMNYmJlVnP5V7r
   GDRjRrGoZ5hUa87MXTkK/u0wkRZbZibQZXUDdeOo/GEmgg7gPvars/krK
   hnDHLd16JjRh8Ad6abhIN3bycqGYXW9u2QI3c1r/ERHvduhCzrkQQRRDV
   JFFMb9Sr3a8HrQ/P5YQ1VBjX+wgB4p3N9K4qpUBA61GGmM6FA0E1ZuZy2
   Q==;
X-CSE-ConnectionGUID: /UsnXQoCSmONr4zIzYeLog==
X-CSE-MsgGUID: WrFlEAz6Qv2G1mz8RxPGHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71453492"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="71453492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:32:02 -0800
X-CSE-ConnectionGUID: pC7bzX3WTduU5GPjE26+uw==
X-CSE-MsgGUID: 68m9OVENQ2OcSzrLhU+UMA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 08:32:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVXxu-000000003YS-0Wqb;
	Tue, 16 Dec 2025 16:31:58 +0000
Date: Wed, 17 Dec 2025 00:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 11/13] kernel/sysctl.c:1290:5:
 error: conflicting types for 'proc_doulongvec_minmax_conv'
Message-ID: <202512170002.Zo44Hspd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   9134ddd35af0dce7b5ee8b8cfc248acac95eb422
commit: 3fc1abf74ebe19e822604a73790cd9612f309882 [11/13] sysctl: Replace do_proc_doulongvec with a type-generic macro
config: hexagon-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251217/202512170002.Zo44Hspd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170002.Zo44Hspd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170002.Zo44Hspd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1290:5: error: conflicting types for 'proc_doulongvec_minmax_conv'
    1290 | int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
         |     ^
   include/linux/sysctl.h:104:5: note: previous declaration is here
     104 | int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
         |     ^
   1 error generated.
--
>> kernel/time/jiffies.c:298:47: error: use of undeclared identifier 'sysctl_msecs_to_jiffies'
     298 |         return proc_ulong_u2k_conv_uop(u_ptr, k_ptr, sysctl_msecs_to_jiffies);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/jiffies.c:303:47: error: use of undeclared identifier 'sysctl_jiffies_to_msecs'; did you mean 'jiffies_to_msecs'?
     303 |         return proc_ulong_k2u_conv_kop(u_ptr, k_ptr, sysctl_jiffies_to_msecs);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                      jiffies_to_msecs
   include/linux/jiffies.h:437:21: note: 'jiffies_to_msecs' declared here
     437 | extern unsigned int jiffies_to_msecs(const unsigned long j);
         |                     ^
>> kernel/time/jiffies.c:303:47: error: incompatible function pointer types passing 'unsigned int (const unsigned long)' to parameter of type 'ulong (*)(const ulong)' (aka 'unsigned long (*)(const unsigned long)') [-Wincompatible-function-pointer-types]
     303 |         return proc_ulong_k2u_conv_kop(u_ptr, k_ptr, sysctl_jiffies_to_msecs);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:135:15: note: passing argument to parameter 'k_ptr_op' here
     135 |                             ulong(*k_ptr_op)(const ulong));
         |                                    ^
   3 errors generated.


vim +/proc_doulongvec_minmax_conv +1290 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  1289  
4639faaa607f3b Joel Granados     2025-10-14 @1290  int proc_doulongvec_minmax_conv(const struct ctl_table *table, int dir,
4639faaa607f3b Joel Granados     2025-10-14  1291  				void *buffer, size_t *lenp, loff_t *ppos,
4639faaa607f3b Joel Granados     2025-10-14  1292  				unsigned long convmul, unsigned long convdiv)
af91322ef3f29a Dave Young        2009-09-22  1293  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1294  	return -ENOSYS;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1295  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  1296  

:::::: The code at line 1290 was first introduced by commit
:::::: 4639faaa607f3bed85f2cdde686a88453c99ef06 sysctl: Move proc_doulongvec_ms_jiffies_minmax to kernel/time/jiffies.c

:::::: TO: Joel Granados <joel.granados@kernel.org>
:::::: CC: Joel Granados <joel.granados@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
