Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5E1CA1C;
	Wed,  9 Aug 2023 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691605784; x=1723141784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zsTZ2pOARin2SBZwGNQ4ceunjn3tsWV4YskTSGbYrt0=;
  b=LEN1Mft/SQLTUQwNTs044n4ZDvwxPz1QYOgY43o1MX0kwMsPnJerjFWX
   PmdBwYtgoJzvMGvZDNR+PmD2g0LzZfcu39wCX9YgQhB6OpzQACVBtJm3W
   VyxB9jM7dMh22OoBx9e9YImhvU7GETU0NzBDBLnP5FWjkWuZSISbxXaKO
   aVKXJnG/Z87cCkZpElF3VSY26c1cD8+T+TflR3SbieM6aXcI3NYcs487F
   +HrlQ0RV7siJf2N5DEUEEotBDCRkjwjuGDD2OD6o8+hPQCJULt9caF44j
   9ynK4VLGnNxNCbuUiyncIG67+WeoWboqS/fPqJqVpVnudsxudWZLsYqyv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370099541"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="370099541"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 11:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846078966"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="846078966"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 11:29:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTnwD-0006K0-0K;
	Wed, 09 Aug 2023 18:29:41 +0000
Date: Thu, 10 Aug 2023 02:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8173/8441] warning: unsafe strcpy() usage lacked
 '__write_overflow' warning in lib/test_fortify/write_overflow-strcpy.c
Message-ID: <202308100247.oHTlRKLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug: introduce CONFIG_DEBUG_LIST_MINIMAL
config: arm-randconfig-r005-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100247.oHTlRKLx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100247.oHTlRKLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100247.oHTlRKLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe strcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strcpy.c
--
>> warning: unsafe memcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-memcpy.c
--
>> warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcmp.c
--
>> warning: unsafe strlcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strlcpy-src.c
--
>> warning: unsafe memmove() usage lacked '__read_overflow2_field' warning in lib/test_fortify/read_overflow2_field-memmove.c
--
>> warning: unsafe strncpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strncpy-src.c
--
>> warning: unsafe memset() usage lacked '__write_overflow_field' warning in lib/test_fortify/write_overflow_field-memset.c
--
>> warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memcmp.c
--
>> warning: unsafe memmove() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memmove.c
--
>> warning: unsafe strlcpy() usage lacked '__write_overflow' warning in lib/test_fortify/write_overflow-strlcpy.c
--
>> warning: unsafe memscan() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memscan.c
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
