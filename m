Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB472627;
	Mon,  2 Feb 2026 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013051; cv=none; b=XRk7aRnZGs3tMOe297dgaHiXoZRALERYJv3XuVH/IWAxnbryjh0elJVt0QGey8MjgABMYmGvyji4ePZ38/K/YmcpiUH15pm7g5oK4MANGVCeKe7p0YB8aYuI7DP/V3mLhwHp3f7O7RotO2Qn2xpKmvX3iNwppVEp4Cg0mmMO428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013051; c=relaxed/simple;
	bh=NHYvunAOGXXz8ELNxs70r8AG9PZlKHm5A4htpnAe1Hs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJgo2rDdyIp0kz1tvHAHOizDbktXreUBBOCOVyPAR3ejWVlYUd2bflBXrpr9h7JS8PGMi5p8yfOoJC4Ww9aC9vU91dtuYYYP0mcL073RtliGJm+Oow/tLgWCk4G8Hznj+TInKPfnnD3dx4kiu09GdmBUnzk+enxBFfhTAlpsVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS1xQajq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS1xQajq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770013050; x=1801549050;
  h=date:from:to:cc:subject:message-id;
  bh=NHYvunAOGXXz8ELNxs70r8AG9PZlKHm5A4htpnAe1Hs=;
  b=WS1xQajqbs4/EAJYtZQ5Zq56IDf4oDQ0BdtkEDIxojcpkKQpWeSblvjW
   MEZzUlzRYlk+Gezi7iu3tApUSdtXv/WcUiQeAsAoNHRvzY9VcnfQWe+kW
   jrbtvAwZhybVwzjGoKNfcaj5J+ZhoSp97vGRz1woa7HhUmkvBuOVbK/Cs
   7LdMiN4BRwIx78Hyoz75wy/78W/p3JjXq/jdVJcFiK3tyOdgk2o6b/a2h
   6HW/46mfDwMblNWSdVZpHymo7tf93sGABUR6ZQfefxLgWONMLjtjifRKp
   ZfibwtllfmVEQD5mfI53jJNpmdgDl81RfzZGg7kIRJjGMG42CQqlO1syf
   w==;
X-CSE-ConnectionGUID: OOQmsJmwRvW1Z72BxxRrag==
X-CSE-MsgGUID: CHutcxa2Tgq3gofvHGN9CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88588262"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="88588262"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 22:17:30 -0800
X-CSE-ConnectionGUID: xE4Tp2AkTUOBJermBP/9Sw==
X-CSE-MsgGUID: sAP1D344RSqE78UYBrgxbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="214267143"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2026 22:17:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmnFU-00000000fHc-3RAl;
	Mon, 02 Feb 2026 06:17:24 +0000
Date: Mon, 02 Feb 2026 14:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 9/29]
 security/apparmor/policy_unpack.c:477:7: warning: format specifies type
 'unsigned long' but the argument has type 'int'
Message-ID: <202602021429.CcmWkR9K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: c140dcd1246bfe705921ca881bbb247ff1ba2bca [9/29] apparmor: make str table more generic and be able to have multiple entries
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260202/202602021429.CcmWkR9K-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021429.CcmWkR9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021429.CcmWkR9K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/policy_unpack.c:477:7: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     476 |                                          "starting with null save=%lu size %d c=%d",
         |                                                                   ~~~
         |                                                                   %d
     477 |                                          str - save, size, c);
         |                                          ^~~~~~~~~~
   security/apparmor/include/lib.h:44:48: note: expanded from macro 'AA_DEBUG'
      44 |                         pr_warn_ratelimited("%s: " fmt, __func__, ##args); \
         |                                                    ~~~              ^~~~
   include/linux/printk.h:722:49: note: expanded from macro 'pr_warn_ratelimited'
     722 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:706:17: note: expanded from macro 'printk_ratelimited'
     706 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +477 security/apparmor/policy_unpack.c

   452	
   453	static int process_strs_entry(char *str, int size, bool multi)
   454	{
   455		int c = 1;
   456	
   457		if (size <= 0)
   458			return -1;
   459		if (multi) {
   460			if (size < 2)
   461				return -2;
   462			/* multi ends with double \0 */
   463			if (str[size - 2])
   464				return -3;
   465		}
   466	
   467		char *save = str;
   468		char *pos = str;
   469		char *end = multi ? str + size - 2 : str + size - 1;
   470		/* count # of internal \0 */
   471		while (str < end) {
   472			if (str == pos) {
   473				/* starts with ... */
   474				if (!*str) {
   475					AA_DEBUG(DEBUG_UNPACK,
   476						 "starting with null save=%lu size %d c=%d",
 > 477						 str - save, size, c);
   478					return -4;
   479				}
   480				if (isspace(*str))
   481					return -5;
   482				if (*str == ':') {
   483					/* :ns_str\0str\0
   484					 * first character after : must be valid
   485					 */
   486					if (!str[1])
   487						return -6;
   488				}
   489			} else if (!*str) {
   490				if (*pos == ':')
   491					*str = ':';
   492				else
   493					c++;
   494				pos = str +  1;
   495			}
   496			str++;
   497		} /* while */
   498	
   499		return c;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
