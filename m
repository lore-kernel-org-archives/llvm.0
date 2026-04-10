Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734233FE26;
	Fri, 10 Apr 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822979; cv=none; b=HWo9bfojCUjABhL0A7+bXDBnpDOvgOO+Cuqc/Dg3xCf9wbaR3cxwiLgFwqUerhVtsNhmlKRRun0yvDPjH+3azXDZ5zNM27puy7G23dKnsETRia/TigROIzT20zpyL7f5EH7TnQtr2TVpUeez3zePbXRKZZ2BJoBtlsS2ISUAxsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822979; c=relaxed/simple;
	bh=Nhbzl12qWdzWCcTXkm9donw+R51k3PNRxyNTAxjy9Z4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRy6EC5jF0jcH97jVJciHfQ2kKzN4b5IkRuuAEq9Zm8xtPoNot/GHysnAdBcnFHKeObFuvxfCx///hl6JtMwNN+RwAVVg9fDePybhk65GVG6W+OyZfLmsJFX54mVnlwmeIEowzAqxfnuelVqaEDiEe97oi2vd7C2I8VRMxgfmTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE2+lu2f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE2+lu2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775822978; x=1807358978;
  h=date:from:to:cc:subject:message-id;
  bh=Nhbzl12qWdzWCcTXkm9donw+R51k3PNRxyNTAxjy9Z4=;
  b=cE2+lu2fnfmoEtLo8S3fNsGM02wzLKcD9Ed/YppUQUlPCivSJ6HtxbiF
   y5Czy0HwcO673X43q0tBqM04EDqMk/d5JFBs/c6W2uX1KkC6wWWLulHHV
   BN5BGETrpYRAkf3VMBN7BWG2hqgfe+o4phLLRdNfejl8POanCFQRmSmVY
   m/SRHo/dbJaCgcWP2eaeFilhVrZW7heouJyn+88b1r91zx80RyBVa5ZaG
   ghrvobjqIUXMH1GIXZvWffzE1KWSOSeiIyYQ0DHxmB17rYynK8HDk7Pv9
   ZswVamGOyr79HHCiqRBMjlb+N+TtU+pi+p0h2MAEwgnbD8gLaCOLQzAcJ
   Q==;
X-CSE-ConnectionGUID: YmewP/A6TPq+17g8MocTWA==
X-CSE-MsgGUID: UCdjK0QYTgGLD0h/lG5KgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87538519"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87538519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:09:37 -0700
X-CSE-ConnectionGUID: B5a+EyPQToaAtbKNjcPXkw==
X-CSE-MsgGUID: 1uUR4cUITuCW6mHJmntl7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252227871"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 05:09:35 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBAg1-000000003hT-1rlw;
	Fri, 10 Apr 2026 12:09:33 +0000
Date: Fri, 10 Apr 2026 20:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.fixes 3/5] fs/sysfs/mount.c:75:23: error:
 call to undeclared function 'to_net_ns'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202604102027.ThjFv090-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   98d1a51c628ef056c2d5a06d39c2d5b38aff9237
commit: 9a8098b1d5023ca94d91ce9b7c3dbf762fe3b3fb [3/5] kernfs: pass struct ns_common instead of const void * for namespace tags
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260410/202604102027.ThjFv090-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102027.ThjFv090-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102027.ThjFv090-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/sysfs/mount.c:75:23: error: call to undeclared function 'to_net_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |                 struct net *netns = to_net_ns(ns);
         |                                     ^
>> fs/sysfs/mount.c:75:15: error: incompatible integer to pointer conversion initializing 'struct net *' with an expression of type 'int' [-Wint-conversion]
      75 |                 struct net *netns = to_net_ns(ns);
         |                             ^       ~~~~~~~~~~~~~
   2 errors generated.


vim +/to_net_ns +75 fs/sysfs/mount.c

    54	
    55	static int sysfs_init_fs_context(struct fs_context *fc)
    56	{
    57		struct kernfs_fs_context *kfc;
    58		struct ns_common *ns;
    59	
    60		if (!(fc->sb_flags & SB_KERNMOUNT)) {
    61			if (!kobj_ns_current_may_mount(KOBJ_NS_TYPE_NET))
    62				return -EPERM;
    63		}
    64	
    65		kfc = kzalloc_obj(struct kernfs_fs_context);
    66		if (!kfc)
    67			return -ENOMEM;
    68	
    69		kfc->ns_tag = ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
    70		kfc->root = sysfs_root;
    71		kfc->magic = SYSFS_MAGIC;
    72		fc->fs_private = kfc;
    73		fc->ops = &sysfs_fs_context_ops;
    74		if (ns) {
  > 75			struct net *netns = to_net_ns(ns);
    76	
    77			put_user_ns(fc->user_ns);
    78			fc->user_ns = get_user_ns(netns->user_ns);
    79		}
    80		fc->global = true;
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
