Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7AC281341;
	Mon,  8 Dec 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228753; cv=none; b=oxR8hpaaH7QeXIZTuGcf8zh6INHrmhFLFLA4i/ouyEOzUVXd0mDuPlKY8Q21kAXv58LaIbX0nX5adoJ+4QHcNcofIeHIhpXmJ8gbcUDVRGVdYeE7zvv7Tjjas89CuSVQGeazOEEeThev+AVMxb4hKlBfv8GoaGVBKyXw5583b/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228753; c=relaxed/simple;
	bh=19mEY0sJ38OcBYzPHKcjSQBlBgs0qEEHKmNeGqG7q1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MC1T9IYP/onHFh/77wG9BDj5zb3o5wuZxju4zgSdCJbzzcWgnFAy6PcqMVZ4jsmG1FtUW5FxNbxIT4IZCDme4kiszoHl4CQeKu2VouN+o5IdF7chyN5w5WKH6TftIdZLdQIgWfTCOpWxyWlz/MSq6dvqUz200B/dHjulbUtu+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVgrARj/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVgrARj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765228751; x=1796764751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19mEY0sJ38OcBYzPHKcjSQBlBgs0qEEHKmNeGqG7q1U=;
  b=AVgrARj/pArE41Fs2/DANce4Z+d80z3ubJZwkjaKsvdy8+t5mpIZSfaN
   v92DC3ag+VyuJ9mVdVBsoEZtPPI8jvfq4zfxMN+rXfnUjtegAZXDDyyTk
   s9HTkYTaiyjPHvGGSXnQxUkoQZEGY+eN6xFnlOMZRrNMAj3pImeG9T4ll
   2arQC7NyCHJeJLGRp2CHX1+DvUC0kPODpMYtWh05/89Ibp2sh5WTCRPow
   ETOUYhvWvhsHdR43x+N678E/T2KLuy+Czq92Y60vuNyS+8+Ld2IdfkT33
   X505hf7ddZDp/Pk478v+5DlDcRVJVierJ9rRkRFbQPsDcxa9N+6nVrprq
   g==;
X-CSE-ConnectionGUID: k2GA1KqlSBejdZEvQxuu5w==
X-CSE-MsgGUID: YmPI1pv9SMSxUd2OFyOJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84785252"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="84785252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 13:19:10 -0800
X-CSE-ConnectionGUID: +13paA+9ReKrnWExPKvifw==
X-CSE-MsgGUID: xJxC0ajlQUekpzEudrCaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195829752"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 13:19:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSidM-000000000rV-3Ar1;
	Mon, 08 Dec 2025 21:19:04 +0000
Date: Tue, 9 Dec 2025 05:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512090554.7pZ9xOQ5-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-030730
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251209/202512090554.7pZ9xOQ5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090554.7pZ9xOQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090554.7pZ9xOQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/console/vgacon.c:51:
>> include/video/vga.h:489:1: error: expected identifier or '('
     489 | ?
         | ^
>> drivers/video/console/vgacon.c:126:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     126 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                                   ^
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:131:30: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     131 |         raw_spin_unlock_irqrestore(&vga_lock, flags);
         |                                     ^~~~~~~~
         |                                     pgd_lock
   include/linux/spinlock.h:282:31: note: expanded from macro 'raw_spin_unlock_irqrestore'
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^
   include/linux/spinlock_api_up.h:86:26: note: expanded from macro '_raw_spin_unlock_irqrestore'
      86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                                             ^
   include/linux/spinlock_api_up.h:56:43: note: expanded from macro '__UNLOCK_IRQRESTORE'
      56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
         |                                           ^
   include/linux/spinlock_api_up.h:46:36: note: expanded from macro '__UNLOCK'
      46 |   do { preempt_enable(); ___UNLOCK(lock); } while (0)
         |                                    ^
   include/linux/spinlock_api_up.h:43:32: note: expanded from macro '___UNLOCK'
      43 |   do { __release(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:485:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     485 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^
   include/linux/spinlock_api_up.h:31:35: note: expanded from macro '__LOCK'
      31 |   do { preempt_disable(); ___LOCK(lock); } while (0)
         |                                   ^
   include/linux/spinlock_api_up.h:28:32: note: expanded from macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:503:30: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     503 |         raw_spin_unlock_irqrestore(&vga_lock, flags);
         |                                     ^~~~~~~~
         |                                     pgd_lock
   include/linux/spinlock.h:282:31: note: expanded from macro 'raw_spin_unlock_irqrestore'
     282 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^
   include/linux/spinlock_api_up.h:86:26: note: expanded from macro '_raw_spin_unlock_irqrestore'
      86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                                             ^
   include/linux/spinlock_api_up.h:56:43: note: expanded from macro '__UNLOCK_IRQRESTORE'
      56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
         |                                           ^
   include/linux/spinlock_api_up.h:46:36: note: expanded from macro '__UNLOCK'
      46 |   do { preempt_enable(); ___UNLOCK(lock); } while (0)
         |                                    ^
   include/linux/spinlock_api_up.h:43:32: note: expanded from macro '___UNLOCK'
      43 |   do { __release(lock); (void)(lock); } while (0)
         |                                ^
   arch/x86/include/asm/pgtable.h:58:19: note: 'pgd_lock' declared here
      58 | extern spinlock_t pgd_lock;
         |                   ^
   drivers/video/console/vgacon.c:563:25: error: use of undeclared identifier 'vga_lock'; did you mean 'pgd_lock'?
     563 |         raw_spin_lock_irqsave(&vga_lock, flags);
         |                                ^~~~~~~~
         |                                pgd_lock
   include/linux/spinlock.h:266:26: note: expanded from macro 'raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                                        ^
   include/linux/spinlock_api_up.h:69:60: note: expanded from macro '_raw_spin_lock_irqsave'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                                ^
   include/linux/spinlock_api_up.h:40:38: note: expanded from macro '__LOCK_IRQSAVE'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                                      ^


vim +489 include/video/vga.h

   487	
   488	#endif /* __linux_video_vga_h__ */
 > 489	?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
