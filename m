Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4C10A08;
	Sat, 20 Jan 2024 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705774074; cv=none; b=HSrauGT3m7R3146TLUAcZ3Qm6zw50fEwkl8vH458kKQMyA4hE9Y1IZqWsnJbAdw0GgMgMBHTPsHe02uwE1bbZUMJFG8h1Xv1iIUtIsfD8yCk4mvfBmuYMSlNkFtmPM69l2onQ0fMoOL4pjf/sgI54tL1irxYJnnxWdy++mfwHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705774074; c=relaxed/simple;
	bh=9iH2U7pUtgFS76JXG+8tNM9WNpAF00TE+sMZWNI9lZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KgP3npFwzqa18Z4mBxHw5NFVv7JSp9p9OJX6XGIgTE6TQIMAMDaS9d7YcOmvlctEY/bLVgBuvX2m7gFwN7y9j28GKHQpuQY9iluCI+nbcWdus1Izh6IQyqmEyFt2tElKXXyS4uQFz4uGMHmzaaw97KvWUzEYjB7PZgSBCsvnJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGCeJpS/; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGCeJpS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705774072; x=1737310072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9iH2U7pUtgFS76JXG+8tNM9WNpAF00TE+sMZWNI9lZw=;
  b=nGCeJpS/1J07W3C8Q7dj+ULrykfWqLKfV2f8nfcwYgxczYxI1IzQcYnm
   cSvY3Oj1/+NOJnoDGKRVCMXTtjFfEeyve4ADmr1OR4A9vrIjqdzbSuT9s
   uPVHIpv4RDN4oD/PAfHN17UYO16gH0Ji6CINeSM4PO1NA6D6mrbYji1G5
   zpXHZjZYN/PlUnzb0lhCAqd6I4BOESG9hR3txRbi0CMx9dLgeZ1bdZ6Mf
   8KrMdfLy+dOnDwxwKq5tDBTX9/hLvnAoOCZUNNu08uEaKgELhdJvRLUxZ
   4Yg3guimCIhOEFjhpaLTNBnOUmXFvYSajZCsAVbpRIpd1sM9jA2NYDzVo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="400612518"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="400612518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 10:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="805323"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2024 10:07:49 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRFkx-0005La-2A;
	Sat, 20 Jan 2024 18:07:47 +0000
Date: Sun, 21 Jan 2024 02:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:v2/6.7 8/11] arch/arm/vdso/vgettimeofday.c:15:9:
 error: implicit declaration of function '__cvdso_clock_gettime32' is invalid
 in C99
Message-ID: <202401210234.D0pkqR97-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.7
head:   59b53403fac6433487b678d487564fa2ee67f229
commit: df8b67f4493c3b35575a87765a6afdfeb61ebb64 [8/11] ctf: generate CTF information for the kernel
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240121/202401210234.D0pkqR97-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210234.D0pkqR97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210234.D0pkqR97-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/vdso/vgettimeofday.c:15:9: error: implicit declaration of function '__cvdso_clock_gettime32' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return __cvdso_clock_gettime32(clock, ts);
                  ^
   arch/arm/vdso/vgettimeofday.c:15:9: note: did you mean '__cvdso_clock_gettime'?
   lib/vdso/gettimeofday.c:266:1: note: '__cvdso_clock_gettime' declared here
   __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
   ^
>> arch/arm/vdso/vgettimeofday.c:33:9: error: implicit declaration of function '__cvdso_clock_getres_time32' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return __cvdso_clock_getres_time32(clock_id, res);
                  ^
   arch/arm/vdso/vgettimeofday.c:33:9: note: did you mean '__cvdso_clock_getres_common'?
   lib/vdso/gettimeofday.c:357:5: note: '__cvdso_clock_getres_common' declared here
   int __cvdso_clock_getres_common(const struct vdso_data *vd, clockid_t clock,
       ^
   2 errors generated.


vim +/__cvdso_clock_gettime32 +15 arch/arm/vdso/vgettimeofday.c

8512287a816559 Nathan Lynch      2015-03-25  11  
20e2fc42312f96 Vincenzo Frascino 2019-11-04  12  int __vdso_clock_gettime(clockid_t clock,
20e2fc42312f96 Vincenzo Frascino 2019-11-04  13  			 struct old_timespec32 *ts)
8512287a816559 Nathan Lynch      2015-03-25  14  {
20e2fc42312f96 Vincenzo Frascino 2019-11-04 @15  	return __cvdso_clock_gettime32(clock, ts);
8512287a816559 Nathan Lynch      2015-03-25  16  }
8512287a816559 Nathan Lynch      2015-03-25  17  
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  18  int __vdso_clock_gettime64(clockid_t clock,
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  19  			   struct __kernel_timespec *ts)
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  20  {
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  21  	return __cvdso_clock_gettime(clock, ts);
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  22  }
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  23  
20e2fc42312f96 Vincenzo Frascino 2019-11-04  24  int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
20e2fc42312f96 Vincenzo Frascino 2019-11-04  25  			struct timezone *tz)
8512287a816559 Nathan Lynch      2015-03-25  26  {
20e2fc42312f96 Vincenzo Frascino 2019-11-04  27  	return __cvdso_gettimeofday(tv, tz);
8512287a816559 Nathan Lynch      2015-03-25  28  }
8512287a816559 Nathan Lynch      2015-03-25  29  
052e76a31b4a64 Vincenzo Frascino 2019-11-04  30  int __vdso_clock_getres(clockid_t clock_id,
052e76a31b4a64 Vincenzo Frascino 2019-11-04  31  			struct old_timespec32 *res)
052e76a31b4a64 Vincenzo Frascino 2019-11-04  32  {
052e76a31b4a64 Vincenzo Frascino 2019-11-04 @33  	return __cvdso_clock_getres_time32(clock_id, res);
052e76a31b4a64 Vincenzo Frascino 2019-11-04  34  }
052e76a31b4a64 Vincenzo Frascino 2019-11-04  35  

:::::: The code at line 15 was first introduced by commit
:::::: 20e2fc42312f960f497ac2d617e3742754e1fa5e ARM: 8930/1: Add support for generic vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
