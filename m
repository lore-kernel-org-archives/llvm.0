Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B051BBBC0;
	Thu, 20 Jun 2024 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907980; cv=none; b=sWEGGlIuTwm2q3DQQTkAVySa3e4QxsIwcpU6mMdOU6nA+oJBIOA6++6keLQ9s25vyrMmHvPe2T0mnLQM7yraghouKL+B2uqhErezfJYqcyeAbzq5DlRGCMSCv/3dIDY6MSfXo0iAUzv7IpdjCOVDiRSmKficdd1je4dmtpPovwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907980; c=relaxed/simple;
	bh=m/ysCyzJzHml36a8rSzgEn4Yz6rS00IokSf8VVJGSVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E++3IFc7x2nCaxfyk5m7GYqW8CexusTd/U7JGkiwwCqHy3P+CAfMIslVAwkn+/D+bV1fK0bvYwoQpsnoxecf3OMkSc5/OhZEIAph/mslIoWm8gqEkwsmlu/vxkqysngj1nfHelQFUe9tK/n9qRLtUnFMqALutdW8t7VF/kmibNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAjl64nl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAjl64nl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718907978; x=1750443978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/ysCyzJzHml36a8rSzgEn4Yz6rS00IokSf8VVJGSVQ=;
  b=dAjl64nlSSbhOX/e7XNTTpRDoGeFODdmz/VT40rrbrauglNYdibqVO+S
   RmcrNvAk2u3Be5BW6UuQr8bZ1XV5qlJI0BJw7Glik3M3KNPCLjRtixvPk
   Zt8lztDJwsE4mxYxCDJBqjGXS/DpKYLPQT5i9Ef0z14xbnnNVghEip3mv
   eJqq3YCLGW9IszOUWP4oQTswTja9ewTTICvE4WFWdIAA0GaWwT0Xb9D+O
   cW2rKi9a0NlqDZe979u9rcJBVU7wzr9JnHT3jlFzonerDe+jk311FGJGM
   lpHIpYj9LyJuVnyPUujg4/0vhLveYy2fvbcZeRNLKkgm2diM+O7LyQMo6
   Q==;
X-CSE-ConnectionGUID: w2TWxv6qSDqoCoVB/bJd0w==
X-CSE-MsgGUID: Gabt+VhESGiujPJmAeEIXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41317552"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="41317552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:26:17 -0700
X-CSE-ConnectionGUID: VZqMyfAVRBiY+yLhJa03KQ==
X-CSE-MsgGUID: NobaonhmSpKwKFt+23sdfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="43015015"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jun 2024 11:26:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMU9-0007pS-1w;
	Thu, 20 Jun 2024 18:26:13 +0000
Date: Fri, 21 Jun 2024 02:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>
Subject: [sysctl:sysctl-testing 1/1] fs/pipe.c:1475:27: error: passing 'const
 struct ctl_table *' to parameter of type 'struct ctl_table *' discards
 qualifiers
Message-ID: <202406210206.iZZnnnGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
head:   0942e6ae35b60b8f67ac961637e734b9cc34f225
commit: 0942e6ae35b60b8f67ac961637e734b9cc34f225 [1/1] sysctl: treewide: constify the ctl_table argument of proc_handlers
config: i386-buildonly-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210206.iZZnnnGp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210206.iZZnnnGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210206.iZZnnnGp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pipe.c:1475:27: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1475 |         return do_proc_douintvec(table, write, buffer, lenp, ppos,
         |                                  ^~~~~
   include/linux/sysctl.h:240:41: note: passing argument to parameter 'table' here
     240 | int do_proc_douintvec(struct ctl_table *table, int write,
         |                                         ^
   1 error generated.
--
>> kernel/sysctl.c:263:40: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     263 |                 proc_first_pos_non_zero_ignore(ppos, table);
         |                                                      ^~~~~
   kernel/sysctl.c:226:27: note: passing argument to parameter 'table' here
     226 |                                            struct ctl_table *table)
         |                                                              ^
   kernel/sysctl.c:745:26: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     745 |         return do_proc_dointvec(table, write, buffer, lenp, ppos, NULL, NULL);
         |                                 ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:764:27: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     764 |         return do_proc_douintvec(table, write, buffer, lenp, ppos,
         |                                  ^~~~~
   kernel/sysctl.c:678:41: note: passing argument to parameter 'table' here
     678 | int do_proc_douintvec(struct ctl_table *table, int write,
         |                                         ^
   kernel/sysctl.c:874:26: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     874 |         return do_proc_dointvec(table, write, buffer, lenp, ppos,
         |                                 ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:943:27: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     943 |         return do_proc_douintvec(table, write, buffer, lenp, ppos,
         |                                  ^~~~~
   kernel/sysctl.c:678:41: note: passing argument to parameter 'table' here
     678 | int do_proc_douintvec(struct ctl_table *table, int write,
         |                                         ^
   kernel/sysctl.c:1014:33: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1014 |         ret = __do_proc_dointvec(&tmp, table, write, buffer,
         |                                        ^~~~~
   kernel/sysctl.c:471:65: note: passing argument to parameter 'table' here
     471 | static int __do_proc_dointvec(void *tbl_data, struct ctl_table *table,
         |                                                                 ^
   kernel/sysctl.c:1126:38: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1126 |     return do_proc_doulongvec_minmax(table, write, buffer, lenp, ppos, 1l, 1l);
         |                                      ^~~~~
   kernel/sysctl.c:1099:56: note: passing argument to parameter 'table' here
    1099 | static int do_proc_doulongvec_minmax(struct ctl_table *table, int write,
         |                                                        ^
   kernel/sysctl.c:1149:38: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1149 |     return do_proc_doulongvec_minmax(table, write, buffer,
         |                                      ^~~~~
   kernel/sysctl.c:1099:56: note: passing argument to parameter 'table' here
    1099 | static int do_proc_doulongvec_minmax(struct ctl_table *table, int write,
         |                                                        ^
   kernel/sysctl.c:1270:29: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1270 |     return do_proc_dointvec(table,write,buffer,lenp,ppos,
         |                             ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:1281:26: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1281 |         return do_proc_dointvec(table, write, buffer, lenp, ppos,
         |                                 ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:1303:26: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1303 |         return do_proc_dointvec(table, write, buffer, lenp, ppos,
         |                                 ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:1326:26: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1326 |         return do_proc_dointvec(table, write, buffer, lenp, ppos,
         |                                 ^~~~~
   kernel/sysctl.c:544:47: note: passing argument to parameter 'table' here
     544 | static int do_proc_dointvec(struct ctl_table *table, int write,
         |                                               ^
   kernel/sysctl.c:1339:31: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1339 |         r = __do_proc_dointvec(&tmp, table, write, buffer,
         |                                      ^~~~~
   kernel/sysctl.c:471:65: note: passing argument to parameter 'table' here
     471 | static int __do_proc_dointvec(void *tbl_data, struct ctl_table *table,
         |                                                                 ^
   13 errors generated.
--
>> kernel/utsname_sysctl.c:50:27: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      50 |         memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
         |                                  ^~~~~
   arch/x86/include/asm/string_32.h:150:45: note: expanded from macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                             ^
   kernel/utsname_sysctl.c:18:40: note: passing argument to parameter 'table' here
      18 | static void *get_uts(struct ctl_table *table)
         |                                        ^
   kernel/utsname_sysctl.c:63:18: error: passing 'const struct ctl_table *' to parameter of type 'struct ctl_table *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      63 |                 memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
         |                                ^~~~~
   arch/x86/include/asm/string_32.h:150:42: note: expanded from macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                          ^
   kernel/utsname_sysctl.c:18:40: note: passing argument to parameter 'table' here
      18 | static void *get_uts(struct ctl_table *table)
         |                                        ^
   2 errors generated.


vim +1475 fs/pipe.c

1998f19324d24d Luis Chamberlain 2022-01-21  1471  
0942e6ae35b60b Joel Granados    2024-06-20  1472  static int proc_dopipe_max_size(const struct ctl_table *table, int write,
1998f19324d24d Luis Chamberlain 2022-01-21  1473  				void *buffer, size_t *lenp, loff_t *ppos)
1998f19324d24d Luis Chamberlain 2022-01-21  1474  {
1998f19324d24d Luis Chamberlain 2022-01-21 @1475  	return do_proc_douintvec(table, write, buffer, lenp, ppos,
1998f19324d24d Luis Chamberlain 2022-01-21  1476  				 do_proc_dopipe_max_size_conv, NULL);
1998f19324d24d Luis Chamberlain 2022-01-21  1477  }
1998f19324d24d Luis Chamberlain 2022-01-21  1478  

:::::: The code at line 1475 was first introduced by commit
:::::: 1998f19324d24df7de4e74d81503b4299eb99e7d fs: move pipe sysctls to is own file

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
