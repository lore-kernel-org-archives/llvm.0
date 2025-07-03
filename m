Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC42BE638;
	Thu,  3 Jul 2025 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575988; cv=none; b=U1U6VaCg3icqREGACyOx+kn6kN/z3s7ErAnIjkSiGcxkCiflF/x3Ueq/9f76umWqPAiIh+bBO8nyTEnv/WKOvWtCGECTCBnrdQB8lnHStbZ3zz5lrilmThAHKbRU7cazDId46PRQic0w/g2f1pJVWLghMcxba1DMqysbQ8ovIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575988; c=relaxed/simple;
	bh=wv9VvPS4fjBXWTrN6yNy3Rage0ckw/ZFAyGjZVqRIGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZaC3JtrgXZh0+7N453ehtzUUsjvfF+2aQtm7z2oDQnV7YGC4AMvhpHxR7tnW0gKZsp7fpKEsF+toJRNcl1Dydc9XKlshlr3ae3l8XQ6pJZ7080Yd9oG8N2dWhqO32zyK5iYyBvOGgPR+GDi7/zHgkKm79Is3I4VFAB0FIh/QxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jahQg0zp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jahQg0zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751575986; x=1783111986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wv9VvPS4fjBXWTrN6yNy3Rage0ckw/ZFAyGjZVqRIGA=;
  b=jahQg0zpV/3qFZEw5UyZVUolhdNWEIRIVddNev0u7jmTq8GCdqYW7pgv
   LPurVSOJJtJsWoFAydBCWGklh+DWj0x0ok+/4VzYry9KR4k4PkTFEb283
   s0+QkgNZCjWW6g9L/N7XoCtMRIJfp135cwaRtds43V579gvgSQ7OmsjU4
   8rYdxuqYNI6B3OwanAcxldlHwNbDxrRXpJigvBEsYLYsFxFg4xBb+O5D4
   Oid8klI4+JXXAMND7EG3bt41Ef9JoLhvpZUmZOYbFGj/Fnn4Ypv28IqB8
   f4bMJAFfco7G50cFtzRefOmnsHC0KxjHhng8nTMEaJW/2soWk3gpuLSwM
   Q==;
X-CSE-ConnectionGUID: GXc6ONzqRn2dgDT4XA1mxg==
X-CSE-MsgGUID: mWzdiaUvRDimiX5NcS3txA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53887164"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53887164"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:53:04 -0700
X-CSE-ConnectionGUID: FYtM/43DQySMhFGpELZY6Q==
X-CSE-MsgGUID: wxyi8PfpSNqY8gAIYY1kSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="185490077"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 13:53:03 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQvU-0000W5-3B;
	Thu, 03 Jul 2025 20:53:01 +0000
Date: Thu, 3 Jul 2025 22:52:19 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 39/47]
 lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:47:13:
 error: variable '_rval' is uninitialized when used here
Message-ID: <202507032200.vEEzeWmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   1d66824abdccea956a455fc694f5967c0163ce31
commit: fc4285b7a7e0aa6052ef3a59a2a3920f2ab86ed3 [39/47] vdso: hook up selftests to kunit
config: powerpc-randconfig-2002-20250701 (https://download.01.org/0day-ci/archive/20250703/202507032200.vEEzeWmw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507032200.vEEzeWmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032200.vEEzeWmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/vdso/tests/vdso_test_gettimeofday.c:4:
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:47:13: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
      47 |         long ret = VDSO_CALL(gtod, 2, &tv, 0);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:47:13: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   1 error generated.
--
   In file included from lib/vdso/tests/vdso_test_getcpu.c:4:
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:46:8: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
      46 |         ret = VDSO_CALL(get_cpu, 3, &cpu, &node, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:46:8: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   1 error generated.
--
   In file included from lib/vdso/tests/vdso_test_abi.c:4:
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:62:13: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
      62 |         long ret = VDSO_CALL(vdso_gettimeofday, 2, &tv, 0);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:62:13: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   In file included from lib/vdso/tests/vdso_test_abi.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:87:13: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
      87 |         long ret = VDSO_CALL(vdso_clock_gettime, 2, clk_id, &ts);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:87:13: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   In file included from lib/vdso/tests/vdso_test_abi.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:112:13: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
     112 |         long ret = VDSO_CALL(vdso_time, 1, NULL);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:112:13: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   In file included from lib/vdso/tests/vdso_test_abi.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:139:13: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
     139 |         long ret = VDSO_CALL(vdso_clock_getres, 2, clk_id, &ts);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:139:13: note: variable '_rval' is declared here
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   4 errors generated.


vim +/_rval +47 lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c

2650554da3f895 tools/testing/selftests/vDSO/vdso_test.c              Greg Hackmann            2017-11-01  23  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  24  int main(int argc, char **argv)
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  25  {
48f044a784d678 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Tiezhu Yang              2024-04-28  26  	const char *version = versions[VDSO_VERSION];
48f044a784d678 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Tiezhu Yang              2024-04-28  27  	const char **name = (const char **)&names[VDSO_NAMES];
48f044a784d678 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Tiezhu Yang              2024-04-28  28  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  29  	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  30  	if (!sysinfo_ehdr) {
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  31  		printf("AT_SYSINFO_EHDR is not present!\n");
d2d49495b5c0df tools/testing/selftests/vDSO/vdso_test.c              Shuah Khan (Samsung OSG  2018-06-22  32) 		return KSFT_SKIP;
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  33  	}
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  34  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  35  	vdso_init_from_sysinfo_ehdr(getauxval(AT_SYSINFO_EHDR));
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  36  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  37  	/* Find gettimeofday. */
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  38  	typedef long (*gtod_t)(struct timeval *tv, struct timezone *tz);
48f044a784d678 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Tiezhu Yang              2024-04-28  39  	gtod_t gtod = (gtod_t)vdso_sym(version, name[0]);
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  40  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  41  	if (!gtod) {
48f044a784d678 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Tiezhu Yang              2024-04-28  42  		printf("Could not find %s\n", name[0]);
d2d49495b5c0df tools/testing/selftests/vDSO/vdso_test.c              Shuah Khan (Samsung OSG  2018-06-22  43) 		return KSFT_SKIP;
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  44  	}
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  45  
4ebbefd6b93c34 Documentation/vDSO/vdso_test.c                        Andy Lutomirski          2014-06-12  46  	struct timeval tv;
6eda706a535c3d tools/testing/selftests/vDSO/vdso_test_gettimeofday.c Christophe Leroy         2024-08-30 @47  	long ret = VDSO_CALL(gtod, 2, &tv, 0);

:::::: The code at line 47 was first introduced by commit
:::::: 6eda706a535c3d0119eaefaad5fc119609639ed2 selftests: vDSO: fix the way vDSO functions are called for powerpc

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
