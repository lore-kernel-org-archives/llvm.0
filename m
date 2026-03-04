Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B029436C0C8;
	Wed,  4 Mar 2026 23:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666987; cv=none; b=i7BPj3lBwUXLEl0MzR1//HftSLtKBQkI/5ThR0aYF5hNluurd6VVKxCASctBhfZi1qaJuhwCcmkawy4ZzIkVdPHudvUQgiIg0tau/Gw3jYQFf56Aez5DONp2pSfT5co08dP26vxaxISsk8rIHIIbXLA27/NrXdwvEhcNVqiw/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666987; c=relaxed/simple;
	bh=+0H9HprVwAWE2Ar7kp6MKWDYkLmUQNAqugCZREnNhJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmSE5f6JHYnbgP/vWDdqYX99uQjcD8btKYfyXwJKN/pdJ5b5dJcj/MBedJEua020IFAEzNsWC4wmGMbWvZt1W6/zWc6ZnSEldChpDFRFUgllNsUlhV2a3TP79FHlkn04+zC6DDI4FvtVCqwtyqwfSnvRmfTlK5XQb/qjXeLuwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ko7KhTz9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ko7KhTz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772666986; x=1804202986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+0H9HprVwAWE2Ar7kp6MKWDYkLmUQNAqugCZREnNhJU=;
  b=Ko7KhTz9ZJbpgjLuqWkqACB1N7lUFS1rfODmVUBXOE0x3KHHLG2C27Lu
   CO8LPhV/twcpWLUYF2H6FEcfr3ucnQEt5O24o+EPC4eQK4ExRwM2IhZgn
   64yyAyU1lmAchuD83Qqxn8vZXMrB3jVT85RTfhdAxVyTT0Lf/0mlAojiV
   bHo4/xNALk5UpZBJNLNudHiDVOohhKJ1ONXI4nilF7cVYV/JbyokKBTmY
   EmWWgLTB2MjWKAmHC31vol+NbO4lnaDKL2rlSYtvqCkwzXvVhxaNyL66S
   +0Ozn0w2UHlieEn0/11NGHqHk25XPpQX7Qe44/JdUG+k5/g8ZZ0dF4IbE
   g==;
X-CSE-ConnectionGUID: xRdibBadQ/2GOR24LJAycg==
X-CSE-MsgGUID: X9kgmL5/RhO4Ymq0aeFQhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="76346469"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="76346469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:29:44 -0800
X-CSE-ConnectionGUID: vYG5u79iQ0SK5e5P5lSF9A==
X-CSE-MsgGUID: SlKUrp6iQXO6IKL9Gqt3eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256374219"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 15:29:42 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvet-000000004gP-2ouD;
	Wed, 04 Mar 2026 23:29:39 +0000
Date: Thu, 5 Mar 2026 07:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: wen.yang@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/2] sysctl: convert kernel/sysctl-test.c to use
 CTLTBL_ENTRY_XXX()
Message-ID: <202603050724.SZxrEyyu-lkp@intel.com>
References: <ae37f783d33aeab5769551df4d500467eb0676e5.1772432502.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae37f783d33aeab5769551df4d500467eb0676e5.1772432502.git.wen.yang@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on sysctl/sysctl-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-introduce-CTLTBL_ENTRY_XXX-helper-macros/20260302-143709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-next
patch link:    https://lore.kernel.org/r/ae37f783d33aeab5769551df4d500467eb0676e5.1772432502.git.wen.yang%40linux.dev
patch subject: [RFC PATCH v3 2/2] sysctl: convert kernel/sysctl-test.c to use CTLTBL_ENTRY_XXX()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050724.SZxrEyyu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050724.SZxrEyyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050724.SZxrEyyu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sysctl-test.c:23:37: warning: pointer type mismatch ('void *' and 'int (*)(const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)')) [-Wpointer-type-mismatch]
      23 |         struct ctl_table null_data_table = CTLTBL_ENTRY_VNMHR(
         |                                            ^~~~~~~~~~~~~~~~~~~
      24 |                         SYSCTL_NULL, "foo", 0644, proc_dointvec,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      25 |                         SYSCTL_ZERO, SYSCTL_ONE_HUNDRED);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:440:2: note: expanded from macro 'CTLTBL_ENTRY_VNMHR'
     440 |         __CTLTBL_ENTRY(__var, __name, __mode, __handler, __min, __max, -1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:313:18: note: expanded from macro '__CTLTBL_ENTRY'
     313 |         .proc_handler = __CTL_HANDLER(_handler),                        \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:284:5: note: expanded from macro '__CTL_HANDLER'
     284 |         (0 ?                                                            \
         |            ^
     285 |                 ((void)sizeof(char[__builtin_types_compatible_p(        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                         __typeof__(__handler), proc_handler) ?          \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     287 |                         1 : -1]), NULL) :                               \
         |                         ~~~~~~~~~~~~~~~
     288 |         __handler)
         |         ~~~~~~~~~
   kernel/sysctl-test.c:67:45: warning: pointer type mismatch ('void *' and 'int (*)(const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)')) [-Wpointer-type-mismatch]
      67 |         struct ctl_table data_maxlen_unset_table = CTLTBL_ENTRY_VNMHRL(
         |                                                    ^~~~~~~~~~~~~~~~~~~~
      68 |                         data, "foo", 0644, proc_dointvec,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                         SYSCTL_ZERO, SYSCTL_ONE_HUNDRED, 0);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:462:2: note: expanded from macro 'CTLTBL_ENTRY_VNMHRL'
     462 |         __CTLTBL_ENTRY(__var, __name, __mode, __handler, __min, __max, __maxlen)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:313:18: note: expanded from macro '__CTLTBL_ENTRY'
     313 |         .proc_handler = __CTL_HANDLER(_handler),                        \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:284:5: note: expanded from macro '__CTL_HANDLER'
     284 |         (0 ?                                                            \
         |            ^
     285 |                 ((void)sizeof(char[__builtin_types_compatible_p(        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                         __typeof__(__handler), proc_handler) ?          \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     287 |                         1 : -1]), NULL) :                               \
         |                         ~~~~~~~~~~~~~~~
     288 |         __handler)
         |         ~~~~~~~~~
   kernel/sysctl-test.c:105:27: warning: pointer type mismatch ('void *' and 'int (*)(const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)')) [-Wpointer-type-mismatch]
     105 |         struct ctl_table table = CTLTBL_ENTRY_VNMR(data, "foo",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     106 |                         0644, SYSCTL_ZERO, SYSCTL_ONE_HUNDRED);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:423:2: note: expanded from macro 'CTLTBL_ENTRY_VNMR'
     423 |         __CTLTBL_ENTRY(__var, __name, __mode,                           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     424 |                 __CTL_AUTO_HANDLER_RANGE(__var), __min, __max, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:313:18: note: expanded from macro '__CTLTBL_ENTRY'
     313 |         .proc_handler = __CTL_HANDLER(_handler),                        \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:284:5: note: expanded from macro '__CTL_HANDLER'
     284 |         (0 ?                                                            \
         |            ^
     285 |                 ((void)sizeof(char[__builtin_types_compatible_p(        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                         __typeof__(__handler), proc_handler) ?          \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     287 |                         1 : -1]), NULL) :                               \
         |                         ~~~~~~~~~~~~~~~
     288 |         __handler)
         |         ~~~~~~~~~
   kernel/sysctl-test.c:132:27: warning: pointer type mismatch ('void *' and 'int (*)(const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)')) [-Wpointer-type-mismatch]
     132 |         struct ctl_table table = CTLTBL_ENTRY_VNMR(data, "foo", 0644,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                         SYSCTL_ZERO, SYSCTL_ONE_HUNDRED);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:423:2: note: expanded from macro 'CTLTBL_ENTRY_VNMR'
     423 |         __CTLTBL_ENTRY(__var, __name, __mode,                           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     424 |                 __CTL_AUTO_HANDLER_RANGE(__var), __min, __max, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:313:18: note: expanded from macro '__CTLTBL_ENTRY'
     313 |         .proc_handler = __CTL_HANDLER(_handler),                        \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:284:5: note: expanded from macro '__CTL_HANDLER'
     284 |         (0 ?                                                            \
         |            ^
     285 |                 ((void)sizeof(char[__builtin_types_compatible_p(        \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     286 |                         __typeof__(__handler), proc_handler) ?          \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     287 |                         1 : -1]), NULL) :                               \
         |                         ~~~~~~~~~~~~~~~
     288 |         __handler)
         |         ~~~~~~~~~
   kernel/sysctl-test.c:160:27: warning: pointer type mismatch ('void *' and 'int (*)(const struct ctl_table *, int, void *, size_t *, loff_t *)' (aka 'int (*)(const struct ctl_table *, int, void *, unsigned long *, long long *)')) [-Wpointer-type-mismatch]
     160 |         struct ctl_table table = CTLTBL_ENTRY_VNMR(data, "foo", 0644,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     161 |                         SYSCTL_ZERO, SYSCTL_ONE_HUNDRED);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 kernel/sysctl-test.c

    11	
    12	/*
    13	 * Test that proc_dointvec will not try to use a NULL .data field even when the
    14	 * length is non-zero.
    15	 */
    16	static void sysctl_test_api_dointvec_null_tbl_data(struct kunit *test)
    17	{
    18		/*
    19		 * Here we are testing that proc_dointvec behaves correctly when
    20		 * we give it a NULL .data field. Normally this would point to a
    21		 * piece of memory where the value would be stored.
    22		 */
  > 23		struct ctl_table null_data_table = CTLTBL_ENTRY_VNMHR(
    24				SYSCTL_NULL, "foo", 0644, proc_dointvec,
    25				SYSCTL_ZERO, SYSCTL_ONE_HUNDRED);
    26		/*
    27		 * proc_dointvec expects a buffer in user space, so we allocate one. We
    28		 * also need to cast it to __user so sparse doesn't get mad.
    29		 */
    30		void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
    31								   GFP_USER);
    32		size_t len;
    33		loff_t pos;
    34	
    35		/*
    36		 * We don't care what the starting length is since proc_dointvec should
    37		 * not try to read because .data is NULL.
    38		 */
    39		len = 1234;
    40		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    41						       KUNIT_PROC_READ, buffer, &len,
    42						       &pos));
    43		KUNIT_EXPECT_EQ(test, 0, len);
    44	
    45		/*
    46		 * See above.
    47		 */
    48		len = 1234;
    49		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    50						       KUNIT_PROC_WRITE, buffer, &len,
    51						       &pos));
    52		KUNIT_EXPECT_EQ(test, 0, len);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
