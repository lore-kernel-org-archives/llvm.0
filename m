Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830DB15625A;
	Mon,  9 Dec 2024 04:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717472; cv=none; b=jOxLDBcN80wcw8sIGtt19cMAWO7cZyfFyHyqMM4UZuzQY7hmPoT5Q7o+qKdZTDi0qK0ubTkNZu5RKTaZ+O5K++wgsko1fnZ/wmj8N9og4V8Aur/u/FfVeWiI1Yk4JNHW3zKnInW0jErkpHlXAzQGzBoelElvn+JUmsVxQ41a0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717472; c=relaxed/simple;
	bh=LTeSiA4SAQvn0wFTNehmolPy+YuydOWG3ltyb5U6WNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQITujPc2/8i7mdzPJhv1UEFbHDX/mv5pojVSlY728IYkzPvFAmGSs5sLfiShYY2JP9L1mLkd/6UY/rtgUNMcGN2G1TZegerNNkeqAJY8h7uzREVL3Synto3mDeeojD3dIl9PxBO9aVO1zOIXC+eVdQEyqkolyIn2ntzJ1bQkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mibf6DnS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mibf6DnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717471; x=1765253471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LTeSiA4SAQvn0wFTNehmolPy+YuydOWG3ltyb5U6WNo=;
  b=Mibf6DnS98SSsNW/EUc3H5r5xfwbHszgmkMGKGLFtq+CrbxmfzEfV4Ce
   Zncy8mYuR2OkpQ4qYXzDJRTGG7Q6v7GNlZao/cZMF3+yofLEzU4gV5JkK
   8/n4KeTc3P7kc8EurmuDuNFU2cFkU/zi6+SFX5dbbHUbRuplJQ+Edfrf8
   oXZRadGtp7IdGPQnhF/lB3IgExfOAQ2GhP4LBxE+jKnm0vwQkyL/EMizX
   hOP17CqlqAoknOPCFrW5hKnWTpoUWrRu3khXKAdpFbHD7+4+ErptvhUg5
   CrCwBY+Oe1xtcald6PUSnNP0aurNGV0c2BcqXyDMH12mpUzaTMEildkZo
   w==;
X-CSE-ConnectionGUID: h+c39XpuRJWNLwNme003/g==
X-CSE-MsgGUID: jJ3Xb4YhTWefDexwAinUIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591001"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:11:10 -0800
X-CSE-ConnectionGUID: KkDDo+X0QG+MMTDLM0qZMA==
X-CSE-MsgGUID: QzP86d9nQG2hb8/goSCllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125841210"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:11:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV6v-0003nn-0j;
	Mon, 09 Dec 2024 04:11:05 +0000
Date: Mon, 9 Dec 2024 12:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
	Karel Zak <kzak@redhat.com>,
	Lennart Poettering <lennart@poettering.net>,
	Ian Kent <raven@themaw.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2] fanotify: notify on mount attach and detach
Message-ID: <202412071410.oxkaXcVR-lkp@intel.com>
References: <20241206151154.60538-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206151154.60538-1-mszeredi@redhat.com>

Hi Miklos,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.13-rc1]
[cannot apply to jack-fs/fsnotify pcmoore-selinux/next next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/fanotify-notify-on-mount-attach-and-detach/20241206-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241206151154.60538-1-mszeredi%40redhat.com
patch subject: [PATCH v2] fanotify: notify on mount attach and detach
config: hexagon-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071410.oxkaXcVR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071410.oxkaXcVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071410.oxkaXcVR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/coredump.c:36:
   include/linux/fsnotify.h:258:20: error: redefinition of 'fsnotify_mntns_delete'
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
   include/linux/fsnotify_backend.h:914:20: note: previous definition is here
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
   In file included from fs/coredump.c:36:
>> include/linux/fsnotify.h:260:2: error: implicit declaration of function '__fsnotify_mntns_delete' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           __fsnotify_mntns_delete(mntns);
           ^
   include/linux/fsnotify.h:260:2: note: did you mean 'fsnotify_mntns_delete'?
   include/linux/fsnotify.h:258:20: note: 'fsnotify_mntns_delete' declared here
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
   2 errors generated.
--
   In file included from fs/namespace.c:22:
   include/linux/fsnotify.h:258:20: error: redefinition of 'fsnotify_mntns_delete'
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
   include/linux/fsnotify_backend.h:914:20: note: previous definition is here
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
   In file included from fs/namespace.c:22:
>> include/linux/fsnotify.h:260:2: error: implicit declaration of function '__fsnotify_mntns_delete' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           __fsnotify_mntns_delete(mntns);
           ^
   include/linux/fsnotify.h:260:2: note: did you mean 'fsnotify_mntns_delete'?
   include/linux/fsnotify.h:258:20: note: 'fsnotify_mntns_delete' declared here
   static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
                      ^
>> fs/namespace.c:1126:10: error: no member named 'n_fsnotify_marks' in 'struct mnt_namespace'
           if (ns->n_fsnotify_marks)
               ~~  ^
   3 errors generated.


vim +/__fsnotify_mntns_delete +260 include/linux/fsnotify.h

   257	
 > 258	static inline void fsnotify_mntns_delete(struct mnt_namespace *mntns)
   259	{
 > 260		__fsnotify_mntns_delete(mntns);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
