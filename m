Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAFF641;
	Sun, 17 Dec 2023 04:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjQClUZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702787723; x=1734323723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/CKhibLSsabfWrljkNUbvqqa2vmRjqg2kt4A6MFO0U=;
  b=KjQClUZb2pgw+zZAKJ7BHyd4mEaEJCQH0y0i6zLh+5hpcjkJv6uOQo2Y
   9PAVxZYPcYcj8834I35R5+Ghp5NT6WtC53zR+98yfGH4A19kIggk/m5m1
   ocEUOU/Psx5mHHvSknIAtlJlnev6p7ACUvFfZo/gMdLXT8NnXevQJnNIk
   wP8eV2QuSaUI72ZvKCrcp6MBTREJ8HvJ7e71tR/gJ8yYPII+Y08pwg+s/
   JRKgiMi5lfJMAr6cvGGjoZR9pOLETdc9IeSBei7DlKGlDwwKVaoNoxcRG
   xU7fcUwUbvICqtTFoBoDKYOVObw6OKw5SjUSrUzYKnkF27XmONiFCxM/w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398186550"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="398186550"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="23320655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2023 20:35:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEis1-0002e3-0q;
	Sun, 17 Dec 2023 04:35:17 +0000
Date: Sun, 17 Dec 2023 12:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 22/50] ipc/util.h:188:10: error: call to
 undeclared function 'get_pid'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202312171259.yIFOP8e6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: e7caeebe946875edba9000d1168cac3b0d9d8d21 [22/50] pid: Split out pid_types.h
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171259.yIFOP8e6-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171259.yIFOP8e6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171259.yIFOP8e6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ipc/ipc_sysctl.c:17:
>> ipc/util.h:188:10: error: call to undeclared function 'get_pid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   *pos = get_pid(pid);
                          ^
>> ipc/util.h:188:8: error: incompatible integer to pointer conversion assigning to 'struct pid *' from 'int' [-Wint-conversion]
                   *pos = get_pid(pid);
                        ^ ~~~~~~~~~~~~
>> ipc/util.h:189:3: error: call to undeclared function 'put_pid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   put_pid(old);
                   ^
   3 errors generated.


vim +/get_pid +188 ipc/util.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  176  
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  void kernel_to_ipc64_perm(struct kern_ipc_perm *in, struct ipc64_perm *out);
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  void ipc64_perm_to_ipc_perm(struct ipc64_perm *in, struct ipc_perm *out);
1efdb69b0bb41d Eric W. Biederman 2012-02-07  179  int ipc_update_perm(struct ipc64_perm *in, struct kern_ipc_perm *out);
4241c1a3040785 Manfred Spraul    2018-08-21  180  struct kern_ipc_perm *ipcctl_obtain_check(struct ipc_namespace *ns,
444d0f621b6471 Davidlohr Bueso   2013-04-30  181  					     struct ipc_ids *ids, int id, int cmd,
444d0f621b6471 Davidlohr Bueso   2013-04-30  182  					     struct ipc64_perm *perm, int extra_perm);
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  
03f1fc09180b34 Eric W. Biederman 2018-03-23  184  static inline void ipc_update_pid(struct pid **pos, struct pid *pid)
03f1fc09180b34 Eric W. Biederman 2018-03-23  185  {
03f1fc09180b34 Eric W. Biederman 2018-03-23  186  	struct pid *old = *pos;
03f1fc09180b34 Eric W. Biederman 2018-03-23  187  	if (old != pid) {
03f1fc09180b34 Eric W. Biederman 2018-03-23 @188  		*pos = get_pid(pid);
03f1fc09180b34 Eric W. Biederman 2018-03-23 @189  		put_pid(old);
03f1fc09180b34 Eric W. Biederman 2018-03-23  190  	}
03f1fc09180b34 Eric W. Biederman 2018-03-23  191  }
03f1fc09180b34 Eric W. Biederman 2018-03-23  192  

:::::: The code at line 188 was first introduced by commit
:::::: 03f1fc09180b345582889a344b012d069b3a6dbe ipc/util: Helpers for making the sysvipc operations pid namespace aware

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
