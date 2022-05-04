Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932A17C9
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651627180; x=1683163180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4MxkxPDNSGtzMvlquogsvEU8lFtzY2vpeFrQnL7YOU=;
  b=T4Jm4+QUd0EKkiTIeC4QYnrSKvkkxrEJSaQfyeZgZ9L9zG3EFSsa9yHk
   DSgiavyrvLSH84TntMhkJHzlBZdKcGTkqxkUaeDOqv9pwTP5zWSdd2kAf
   ZCIRFWn4/vlwo9nfNjnyv/oO/weFUCNUmgTxeszhSW7ivSmEqj0GiCfyi
   MZen+HC5eWxzeGMyCTKA5X9vMTcpBsLSmCOPOocc59dQ4/ThHEDPNIhJq
   +oA8iaen7uH5hrNaCG3CQWs36QmovjsWKPNTA+4MD63SGuEP0xJGLXOC+
   DhzEPvVR/1AeVCPnJ/ljFiBjgAT3rfYmdciWqXJM1GmZS2wszYQr1N0mV
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328176807"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="328176807"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 18:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="516817108"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 May 2022 18:19:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm3fw-000Avv-BI;
	Wed, 04 May 2022 01:19:32 +0000
Date: Wed, 4 May 2022 09:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guowei Du <duguoweisz@gmail.com>, jack@suse.cz
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, amir73il@gmail.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk, jmorris@namei.org, serge@hallyn.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
	john.fastabend@gmail.com, kpsingh@kernel.org,
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, paul@paul-moore.com,
	stephen.smalley.work@gmail.com, eparis@parisplace.org,
	keescook@chromium.org, anton@enomsg.org, ccross@android.com,
	tony.luck@intel.com, selinux@vger.kernel.org, duguoweisz@gmail.com,
	duguowei <duguowei@xiaomi.com>
Subject: Re: [PATCH] fsnotify: add generic perm check for unlink/rmdir
Message-ID: <202205040959.SAV6vlzH-lkp@intel.com>
References: <20220503183750.1977-1-duguoweisz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503183750.1977-1-duguoweisz@gmail.com>

Hi Guowei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on linus/master v5.18-rc5]
[cannot apply to jack-fs/fsnotify next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Guowei-Du/fsnotify-add-generic-perm-check-for-unlink-rmdir/20220504-024310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
config: hexagon-randconfig-r041-20220501 (https://download.01.org/0day-ci/archive/20220504/202205040959.SAV6vlzH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6f635019bbd2ab22a64e03164c8812a46531966e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guowei-Du/fsnotify-add-generic-perm-check-for-unlink-rmdir/20220504-024310
        git checkout 6f635019bbd2ab22a64e03164c8812a46531966e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> security/security.c:1169:28: error: passing 'const struct path *' to parameter of type 'struct path *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return fsnotify_path_perm(dir, dentry, MAY_RMDIR);
                                     ^~~
   include/linux/fsnotify.h:83:51: note: passing argument to parameter 'path' here
   static inline int fsnotify_path_perm(struct path *path, struct dentry *dentry, __u32 mask)
                                                     ^
   security/security.c:1180:28: error: passing 'const struct path *' to parameter of type 'struct path *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           return fsnotify_path_perm(dir, dentry, MAY_UNLINK);
                                     ^~~
   include/linux/fsnotify.h:83:51: note: passing argument to parameter 'path' here
   static inline int fsnotify_path_perm(struct path *path, struct dentry *dentry, __u32 mask)
                                                     ^
   2 errors generated.


vim +1169 security/security.c

  1160	
  1161	int security_path_rmdir(const struct path *dir, struct dentry *dentry)
  1162	{
  1163		int ret;
  1164		if (unlikely(IS_PRIVATE(d_backing_inode(dir->dentry))))
  1165			return 0;
  1166		ret = call_int_hook(path_rmdir, 0, dir, dentry);
  1167		if (ret)
  1168			return ret;
> 1169		return fsnotify_path_perm(dir, dentry, MAY_RMDIR);
  1170	}
  1171	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
