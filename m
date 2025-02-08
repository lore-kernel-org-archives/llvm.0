Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D941A5BB9;
	Sat,  8 Feb 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739014068; cv=none; b=DAZXY99zzJaRHEXBfdbKrgZDaxziShd4zgCPhRAg9r55STLlIjSB6lKqz0/9K7eQqOXDaWSYAepgd/hlmJ+k9TpAE8lpop+MZniPa6yL+WYSurufRIfG6/3Vra0rloeAka+hpO6dbXDrpVnybvZ45/hQYujMKawfhUB89koya4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739014068; c=relaxed/simple;
	bh=wXhqC+6F+tOU+/QtVSYZ9LSc71CI3x138xfxhyZVr64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/n3ysVGOI22a7OxhK0DgLN2AZI9UGsq7VM3A6iX13xS0+Lz2kYExe/kOgwQp3+nG+opMTNtrPKc8cPa/Jf8UzYL6N2HIrSeAOhTZeS2iA6cUfKgf0PPFNyz9iihU5UwbSeuXqxmwLBiZvT4VPT1+UEFSDQZGTOpvxVeWDBAlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEpYJq9S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEpYJq9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739014066; x=1770550066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXhqC+6F+tOU+/QtVSYZ9LSc71CI3x138xfxhyZVr64=;
  b=TEpYJq9SYiq+h2MRJa2f4iJqi3ZxyBTAsdT7VVczOT7tWKDfAZO2W2yK
   6r29Qfb2oKaQZSzDFKT9xt0EomRO3GX6UebxGR7sjNsYZf5TqnAoqzU4l
   MN7/BhlevfbMFnZR2A/ZfcizeKP8+IX1HlbsyFUb8SOtgwovhCmIJWnh+
   JodVxvZHefj7rufAwzlgReNsg9E8vB0hJBosCLKioqKcnHQj6VGoWsEsj
   6AtcQO4Q3VCy9vhbrNK81w4owEAWVC/0v53n0NZhmQQABVraVtiz2SKQT
   qbL2mUxzc1oHpppevaobQeVtEKvcX344TMnDZJTuGl+ADnmPS1j+p0CTy
   w==;
X-CSE-ConnectionGUID: GKEQJiHZS5a1pZIv54d+mQ==
X-CSE-MsgGUID: 4AUNsiNUR5aXaGj3oPgMIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42495768"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="42495768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 03:27:46 -0800
X-CSE-ConnectionGUID: R2WiNbAbRNG6YQD55/nXjw==
X-CSE-MsgGUID: LyigwvD8TlWL+NgNyEXSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142633286"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Feb 2025 03:27:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgizu-000zuF-21;
	Sat, 08 Feb 2025 11:27:42 +0000
Date: Sat, 8 Feb 2025 19:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 2/2] include/linux/security.h:2379:12:
 warning: no previous prototype for function 'security_uring_allowed'
Message-ID: <202502081912.TeokpAAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   c6ad9fdbd44b78f51fa50138247694774ab99e97
commit: c6ad9fdbd44b78f51fa50138247694774ab99e97 [2/2] io_uring,lsm,selinux: add LSM hooks for io_uring_setup()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250208/202502081912.TeokpAAe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081912.TeokpAAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081912.TeokpAAe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/apic.c:18:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:2379:12: warning: no previous prototype for function 'security_uring_allowed' [-Wmissing-prototypes]
    2379 | extern int security_uring_allowed(void)
         |            ^
   include/linux/security.h:2379:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2379 | extern int security_uring_allowed(void)
         |        ^
   arch/x86/kernel/apic/apic.c:1889:20: warning: unused function '__x2apic_enable' [-Wunused-function]
    1889 | static inline void __x2apic_enable(void) { }
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from arch/x86/kernel/apic/vector.c:18:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:7:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:2379:12: warning: no previous prototype for function 'security_uring_allowed' [-Wmissing-prototypes]
    2379 | extern int security_uring_allowed(void)
         |            ^
   include/linux/security.h:2379:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2379 | extern int security_uring_allowed(void)
         |        ^
   1 warning generated.


vim +/security_uring_allowed +2379 include/linux/security.h

  2359	
  2360	#ifdef CONFIG_IO_URING
  2361	#ifdef CONFIG_SECURITY
  2362	extern int security_uring_override_creds(const struct cred *new);
  2363	extern int security_uring_sqpoll(void);
  2364	extern int security_uring_cmd(struct io_uring_cmd *ioucmd);
  2365	extern int security_uring_allowed(void);
  2366	#else
  2367	static inline int security_uring_override_creds(const struct cred *new)
  2368	{
  2369		return 0;
  2370	}
  2371	static inline int security_uring_sqpoll(void)
  2372	{
  2373		return 0;
  2374	}
  2375	static inline int security_uring_cmd(struct io_uring_cmd *ioucmd)
  2376	{
  2377		return 0;
  2378	}
> 2379	extern int security_uring_allowed(void)
  2380	{
  2381		return 0;
  2382	}
  2383	#endif /* CONFIG_SECURITY */
  2384	#endif /* CONFIG_IO_URING */
  2385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
