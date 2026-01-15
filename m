Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8933B6C7;
	Thu, 15 Jan 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480506; cv=none; b=StC76sAzvT4dj0JQYm3JiPz0fRjPhuH8gIhkr0MoAzbn88zYZsgfVIBPNSmJyi8p7Gx+NLnrn2RTEcjqtWSzS24qwojBwKdY6Dhz6cVH/IJe23bD90E14r1IOjAIrykV2ttiVjwCeChnodXSuxdESd3AwBCzX42rPD7fa/h4SKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480506; c=relaxed/simple;
	bh=L1c8Aq3KLV/WoexwQljM5oIKGohwaerSveZiYYxlK3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVLmltlL5dZRAv6YeEXcjdzMyLAKQXsytHGxBsBgdJ3kdnmqjxgvFFfaEUtgvob5oXtlbz21h5F4xE47jREJx1WBk6LudOee74S9kMp4rjN9oYKq9DKSwcMyjz6VHyD6M50qXm/k//emkcD3/CoReTXJwkc8hr6xARqd2fa/tdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnmQk8lW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnmQk8lW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768480505; x=1800016505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L1c8Aq3KLV/WoexwQljM5oIKGohwaerSveZiYYxlK3A=;
  b=lnmQk8lWYoRNTZD3iMw6YV63yC22nsocKrMfRjPsFvTBS7oFf2tb7Sdo
   tlO0prHhHn+wvjRnKKAjd7CdZqu2rl7wV1gDHaJDRiEAe+0lGj0rIVH15
   DhRUjyPuyBoOXVJ5/5rQrgWrlEiSelLJEa9zMPABXeGYI52hlgRhKBc7E
   no1tNDLOSy2bItMM3Cur2koSXtBYtSSPvW3apUcip1CVtMfMGgeMi+kd5
   SHlfYa/MN+2cSimcNsDCXK+aeK7V50t3JFxe0Jm38Ew1zKnUMz/NwTnP8
   07afJbRKr7TXm74ko95G/zohN7/jnqQrRGuK/F2SCdVokor9qBD0TJq1z
   Q==;
X-CSE-ConnectionGUID: 1eJmCjDHRuO9YYbDkxlAEg==
X-CSE-MsgGUID: Rcy72sy0SiyuBj/v+ijZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69692177"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:35:04 -0800
X-CSE-ConnectionGUID: gH8wfGg5Th+RctxoDIpkXw==
X-CSE-MsgGUID: N0Dl2YujSAaRPdsznU/KkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209805653"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 04:35:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgMZ2-00000000HxK-38FO;
	Thu, 15 Jan 2026 12:35:00 +0000
Date: Thu, 15 Jan 2026 20:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU
 pages for lruvec lock
Message-ID: <202601152057.xgusZpKm-lkp@intel.com>
References: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260114]
[cannot apply to akpm-mm/mm-everything brauner-vfs/vfs.all trace/for-next linus/master dennis-percpu/for-next v6.19-rc5 v6.19-rc4 v6.19-rc3 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-remove-dead-code-of-checking-parent-memory-cgroup/20260114-193921
base:   next-20260114
patch link:    https://lore.kernel.org/r/0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
config: powerpc64-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152057.xgusZpKm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:9:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
>> include/linux/memcontrol.h:772:14: error: use of undeclared identifier 'lruvec'
     772 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:773:13: error: use of undeclared identifier 'rcu'
     773 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:775:14: error: use of undeclared identifier 'lruvec'
     775 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:776:13: error: use of undeclared identifier 'rcu'
     776 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:779:14: error: use of undeclared identifier 'lruvec'
     779 |         __acquires(&lruvec->lru_lock)
         |                     ^~~~~~
   include/linux/memcontrol.h:780:13: error: use of undeclared identifier 'rcu'
     780 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
    1507 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
    1515 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
    1523 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
    1532 |         __releases(rcu)
         |                    ^~~
   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from crypto/ahash.c:26:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:9:


vim +/lruvec +772 include/linux/memcontrol.h

   770	
   771	struct lruvec *folio_lruvec_lock(struct folio *folio);
 > 772		__acquires(&lruvec->lru_lock)
   773		__acquires(rcu)
   774	struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
   775		__acquires(&lruvec->lru_lock)
   776		__acquires(rcu)
   777	struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
   778							unsigned long *flags);
   779		__acquires(&lruvec->lru_lock)
   780		__acquires(rcu)
   781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
