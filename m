Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397EFBED;
	Wed, 13 Dec 2023 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOuT0z4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702464543; x=1734000543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7m4VkiQL17WtpdUWccMtC5FhDWfWNBamQe9dPfZc9E=;
  b=UOuT0z4Gv0JHaa+Vzrrm2c2DaD55H4IiW5nlZFeCMSSDMDh2o0eeZi6x
   EHXZp7IvOyV4lNtfkqg6vjYmqmM6krw0DbZGwLS7B1Nc6mElhTUTLo9g6
   Hos5od2WiGGzvwkgmqul9JDFCGlQUwKB5UYtJ53Hdc5TsP1WXCQHHVvOe
   YbJ0gnuZUF6TyykzdVVIY5DZu1Ancqy0mgUel0EtXe0efqpg9PuciJnEH
   LvRoexT0FT3epjNAGCLtOKuBKkLN0Xd9ivEhY+BRlfA2Lkj4qSyUCRCXT
   jl9tJrmJ/grRSAk5B58c8Xcz8Nd3s4ufZZ46eexBqPrVVYUz9gnctIHe2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="379940027"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="379940027"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 02:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947142624"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="947142624"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 02:49:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDMnT-000KQX-04;
	Wed, 13 Dec 2023 10:48:59 +0000
Date: Wed, 13 Dec 2023 18:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-next 40/43] fs/afs/callback.c:82:6: error: invalid
 output size for constraint '+q'
Message-ID: <202312131803.JZPzoKWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-next
head:   f1302568cc65d3fdd85e6413688779e5235f4e2b
commit: b8f604776e35dd984fbf93f49276543461cbbb22 [40/43] afs: Overhaul invalidation handling to better support RO volumes
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231213/202312131803.JZPzoKWV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131803.JZPzoKWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131803.JZPzoKWV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/afs/callback.c:82:6: error: invalid output size for constraint '+q'
           if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE) {
               ^
   include/linux/atomic/atomic-instrumented.h:4716:2: note: expanded from macro 'xchg'
           raw_xchg(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
   #define raw_xchg arch_xchg
                    ^
   arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
   #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
                                   ^
   arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
                                         : "+q" (__ret), "+m" (*(ptr))     \
                                                 ^
   1 error generated.
--
>> fs/afs/rotate.c:62:7: error: invalid output size for constraint '+q'
                   if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE)
                       ^
   include/linux/atomic/atomic-instrumented.h:4716:2: note: expanded from macro 'xchg'
           raw_xchg(__ai_ptr, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
   #define raw_xchg arch_xchg
                    ^
   arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
   #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
                                   ^
   arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
                                         : "+q" (__ret), "+m" (*(ptr))     \
                                                 ^
   1 error generated.


vim +82 fs/afs/callback.c

    73	
    74	/*
    75	 * actually break a callback
    76	 */
    77	void __afs_break_callback(struct afs_vnode *vnode, enum afs_cb_break_reason reason)
    78	{
    79		_enter("");
    80	
    81		clear_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
  > 82		if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE) {
    83			vnode->cb_break++;
    84			vnode->cb_v_check = atomic_read(&vnode->volume->cb_v_break);
    85			afs_clear_permits(vnode);
    86	
    87			if (vnode->lock_state == AFS_VNODE_LOCK_WAITING_FOR_CB)
    88				afs_lock_may_be_available(vnode);
    89	
    90			if (reason != afs_cb_break_for_deleted &&
    91			    vnode->status.type == AFS_FTYPE_FILE &&
    92			    atomic_read(&vnode->cb_nr_mmap))
    93				queue_work(system_unbound_wq, &vnode->cb_work);
    94	
    95			trace_afs_cb_break(&vnode->fid, vnode->cb_break, reason, true);
    96		} else {
    97			trace_afs_cb_break(&vnode->fid, vnode->cb_break, reason, false);
    98		}
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
