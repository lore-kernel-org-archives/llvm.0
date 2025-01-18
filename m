Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137C18CBFB;
	Sat, 18 Jan 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737203352; cv=none; b=IN3QxxjEj8vRPy/VdE259m3Bnt2mpQ3DmmnJ45Ube1ns1FscYY+Pl+Y2hiIlGHbxoPo/RXHpxr5B3YgMlPmo7IHv3EFspgxhkx+LwQ4QVtdrKytKlxxz2MPxCaS7ihv/r2m82SQ/IU10lzAnW7yD6YgOuMLi0SN+MO2ouM59NBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737203352; c=relaxed/simple;
	bh=vM7gZujibXks/wmu6XmRXYJpsfQVC+J/dNwYoM6F3Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKfCGW98MDfBdUMV+/YvTW3NK3ZvKO9LES2PxQus9xOWEPX3wFJz9uZl9ir5T4GLP8pyE3m20FSsQdotJUnVuVgfu1GFolUqtsyzqJtuN2DAsaqhHN4qVg/pxCTT+X67k7MvlNV7Gk8fDZ10rgNkgVVQqFRds/W5zw6QqKgLrE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwhNfZf/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwhNfZf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737203350; x=1768739350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vM7gZujibXks/wmu6XmRXYJpsfQVC+J/dNwYoM6F3Ho=;
  b=CwhNfZf/teQG1bKvT2lJRuaGKMeXcKX6zzAglNoMJgG3Y1767cCdPpsF
   KrkTCJ17iAKTdLTMQDrLXHTYgA4T/9xwcHF9e65gXWQPUVZsnQ3ul+ZUD
   sUDPKs1TYqPobHvzGZOsVRLd+QyZJc2KVHgt9i7qBIED0M8vwxWYnqWk7
   lrCmZjgZNfkTR/kIIqseNxfu+/UizW5t/J4/uuR5b18LJ8nsPDtejUZsd
   a+H9YGOZEf0EZXDqupcrc3KIdAmTkrL6sVMkuIcQeN9lrYXsFPElRzmh4
   lXNEpGeCeSrJRKX3XqNYXYHRPJVEFCCizJS9mN49R9yigGb5NniNmVE2b
   g==;
X-CSE-ConnectionGUID: k1aeR4CJTUSq9qdK4WKoJA==
X-CSE-MsgGUID: p2daWOTAT3i5HPl3PVqkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37538957"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37538957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 04:29:09 -0800
X-CSE-ConnectionGUID: K7dsNpvfQsG2cYdsV5Ad2w==
X-CSE-MsgGUID: STArnz2ESf2WJ8QkfQ36Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="111040540"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2025 04:29:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ7wn-000UQx-1R;
	Sat, 18 Jan 2025 12:29:05 +0000
Date: Sat, 18 Jan 2025 20:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: John Sperbeck <jsperbeck@google.com>,
	Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Sperbeck <jsperbeck@google.com>, Kees Cook <kees@kernel.org>,
	Wen Yang <wen.yang@linux.dev>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3] sysctl: expose sysctl_check_table for unit testing
 and use it
Message-ID: <202501182003.Gfi63jzH-lkp@intel.com>
References: <20250113070001.143690-1-jsperbeck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113070001.143690-1-jsperbeck@google.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master sysctl/sysctl-next v6.13-rc7]
[cannot apply to kees/for-next/pstore]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Sperbeck/sysctl-expose-sysctl_check_table-for-unit-testing-and-use-it/20250113-150214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20250113070001.143690-1-jsperbeck%40google.com
patch subject: [PATCH v3] sysctl: expose sysctl_check_table for unit testing and use it
config: um-randconfig-002-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182003.Gfi63jzH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182003.Gfi63jzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182003.Gfi63jzH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl-test.c:414:4: error: call to undeclared function 'sysctl_check_table_test_helper'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           sysctl_check_table_test_helper("foo", table_foo));
                           ^
   kernel/sysctl-test.c:416:4: error: call to undeclared function 'sysctl_check_table_test_helper'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           sysctl_check_table_test_helper("foo", table_bar));
                           ^
   kernel/sysctl-test.c:418:4: error: call to undeclared function 'sysctl_check_table_test_helper'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           sysctl_check_table_test_helper("foo", table_qux));
                           ^
   3 errors generated.


vim +/sysctl_check_table_test_helper +414 kernel/sysctl-test.c

   369	
   370	/*
   371	 * Test that registering an invalid extra value is not allowed.
   372	 */
   373	static void sysctl_test_register_sysctl_sz_invalid_extra_value(
   374			struct kunit *test)
   375	{
   376		unsigned char data = 0;
   377		struct ctl_table table_foo[] = {
   378			{
   379				.procname	= "foo",
   380				.data		= &data,
   381				.maxlen		= sizeof(u8),
   382				.mode		= 0644,
   383				.proc_handler	= proc_dou8vec_minmax,
   384				.extra1		= SYSCTL_FOUR,
   385				.extra2		= SYSCTL_ONE_THOUSAND,
   386			},
   387		};
   388	
   389		struct ctl_table table_bar[] = {
   390			{
   391				.procname	= "bar",
   392				.data		= &data,
   393				.maxlen		= sizeof(u8),
   394				.mode		= 0644,
   395				.proc_handler	= proc_dou8vec_minmax,
   396				.extra1		= SYSCTL_NEG_ONE,
   397				.extra2		= SYSCTL_ONE_HUNDRED,
   398			},
   399		};
   400	
   401		struct ctl_table table_qux[] = {
   402			{
   403				.procname	= "qux",
   404				.data		= &data,
   405				.maxlen		= sizeof(u8),
   406				.mode		= 0644,
   407				.proc_handler	= proc_dou8vec_minmax,
   408				.extra1		= SYSCTL_ZERO,
   409				.extra2		= SYSCTL_TWO_HUNDRED,
   410			},
   411		};
   412	
   413		KUNIT_EXPECT_EQ(test, -EINVAL,
 > 414				sysctl_check_table_test_helper("foo", table_foo));
   415		KUNIT_EXPECT_EQ(test, -EINVAL,
   416				sysctl_check_table_test_helper("foo", table_bar));
   417		KUNIT_EXPECT_EQ(test, 0,
   418				sysctl_check_table_test_helper("foo", table_qux));
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
