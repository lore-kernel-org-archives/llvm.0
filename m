Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12B3CCE7;
	Wed, 20 Sep 2023 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695238811; x=1726774811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGrbJVE947kLcNQvJHXv006YPxanfka9C/SJUX7Mv1E=;
  b=ep1Jidtd9rDzRkEHf+MLpKJW0hnrWG6HIXATKFN0KUjd2ByEKNJE3t1P
   0eSYL7L2Ys1DKsPTJSkIU5+kLvkiCvthEIv9yvQQaLto6u/p/IkR32fUT
   b7vp1mxsS0D4AFeQshTeMMtIDecsAS/bB7QpGXhXHgIpVyuLwNz0JxMvF
   PmIZWL4imrctvv0F7xeAO0KC1Y8eJ3VFfN0Wy8Py3pY5WTjFfONJqFnkQ
   nnuoXh8wUudCi+uNrhUo+LcXNcdEMfKTKWzdAHAnvoce3TmI6QBugxrIy
   8O7LHbVR7+wHs4BdFqoWho5WDUBJ+jjxkmYbkx5JafBl/ef5QyjlJtfLA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377621381"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="377621381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 12:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812291475"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="812291475"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 12:40:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj33M-00094S-0w;
	Wed, 20 Sep 2023 19:40:04 +0000
Date: Thu, 21 Sep 2023 03:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>
Subject: arch/powerpc/kernel/traps.c:1167:19: error: unused function
 '__parse_fpscr'
Message-ID: <202309210327.WkqSd5Bq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a229cf67ab851a6e92395f37ed141d065176575a
commit: ca13c130a43fe3ab625d22ada0a61e5c0b612229 powerpc/4xx: Remove WatchdogHandler() to fix no previous prototype error
date:   5 weeks ago
config: powerpc-kilauea_defconfig (https://download.01.org/0day-ci/archive/20230921/202309210327.WkqSd5Bq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210327.WkqSd5Bq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210327.WkqSd5Bq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/traps.c:1167:19: error: unused function '__parse_fpscr' [-Werror,-Wunused-function]
    1167 | static inline int __parse_fpscr(unsigned long fpscr)
         |                   ^
   1 error generated.


vim +/__parse_fpscr +1167 arch/powerpc/kernel/traps.c

14cf11af6cf608 Paul Mackerras    2005-09-26  1166  
5fad293bcbd48d Kumar Gala        2007-02-07 @1167  static inline int __parse_fpscr(unsigned long fpscr)
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1168  {
aeb1c0f6ff18f5 Eric W. Biederman 2018-04-17  1169  	int ret = FPE_FLTUNK;
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1170  
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1171  	/* Invalid operation */
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1172  	if ((fpscr & FPSCR_VE) && (fpscr & FPSCR_VX))
5fad293bcbd48d Kumar Gala        2007-02-07  1173  		ret = FPE_FLTINV;
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1174  
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1175  	/* Overflow */
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1176  	else if ((fpscr & FPSCR_OE) && (fpscr & FPSCR_OX))
5fad293bcbd48d Kumar Gala        2007-02-07  1177  		ret = FPE_FLTOVF;
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1178  
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1179  	/* Underflow */
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1180  	else if ((fpscr & FPSCR_UE) && (fpscr & FPSCR_UX))
5fad293bcbd48d Kumar Gala        2007-02-07  1181  		ret = FPE_FLTUND;
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1182  
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1183  	/* Divide by zero */
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1184  	else if ((fpscr & FPSCR_ZE) && (fpscr & FPSCR_ZX))
5fad293bcbd48d Kumar Gala        2007-02-07  1185  		ret = FPE_FLTDIV;
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1186  
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1187  	/* Inexact result */
dc1c1ca3dcd94c Stephen Rothwell  2005-10-01  1188  	else if ((fpscr & FPSCR_XE) && (fpscr & FPSCR_XX))
5fad293bcbd48d Kumar Gala        2007-02-07  1189  		ret = FPE_FLTRES;
5fad293bcbd48d Kumar Gala        2007-02-07  1190  
5fad293bcbd48d Kumar Gala        2007-02-07  1191  	return ret;
5fad293bcbd48d Kumar Gala        2007-02-07  1192  }
5fad293bcbd48d Kumar Gala        2007-02-07  1193  

:::::: The code at line 1167 was first introduced by commit
:::::: 5fad293bcbd48d9a2370020cf60e4b4a42559b12 [POWERPC] Fixup error handling when emulating a floating point instruction

:::::: TO: Kumar Gala <galak@kernel.crashing.org>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
