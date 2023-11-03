Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C61D699;
	Fri,  3 Nov 2023 20:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqJrLnUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699045102; x=1730581102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hop1hWSKNwWvUclqkUBX97GZojdbQij4g26CvbPbl/Q=;
  b=mqJrLnUoSLqLlekcFrY5BEQ65g0Ep6gG3+mOdMtVyDgfmztJZ+QEnxJp
   zERVqpmn8Mkww6uKwWDCRLZHw62eYG+S7K3mwrmoC0PYzUjMEDvhyd8Gs
   BbIndXgKsz7PJKy33xoubxHBVg+B4Vs7vvaZxdChzAa5S7aBN50bWvHYb
   J+iPR0cO7M5pDIoOw4U0ExzlN1ndHkXOIOdvsBgKMXT2Fxp4JQuJS4yT+
   zjL6PbIvQ90fDhvZSwdcUuHZ7zaogce7I+3MYbH16sHrLtruC9CJew2lO
   1YFmHbM07NZQi8zmrYJKhjb9kBKQpGfBS/ZzolqnPrSNGGUhkW8srSlTa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="7651631"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="7651631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852380256"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="852380256"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2023 13:58:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz1FA-0002vw-28;
	Fri, 03 Nov 2023 20:58:16 +0000
Date: Sat, 4 Nov 2023 04:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] refcount: introduce generic lockptr funcs
Message-ID: <202311040410.y4UjYFn9-lkp@intel.com>
References: <20231103161635.1902667-1-aahringo@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103161635.1902667-1-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/kref-introduce-kref_put_lockptr-and-use-lockptr/20231104-002152
base:   linus/master
patch link:    https://lore.kernel.org/r/20231103161635.1902667-1-aahringo%40redhat.com
patch subject: [RFC 1/2] refcount: introduce generic lockptr funcs
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311040410.y4UjYFn9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040410.y4UjYFn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040410.y4UjYFn9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/refcount.c:183:6: warning: no previous prototype for function 'lockptr_lock_irqsave' [-Wmissing-prototypes]
     183 | void lockptr_lock_irqsave(void *lockptr)
         |      ^
   lib/refcount.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     183 | void lockptr_lock_irqsave(void *lockptr)
         | ^
         | static 
>> lib/refcount.c:191:6: warning: no previous prototype for function 'lockptr_unlock_irqsave' [-Wmissing-prototypes]
     191 | void lockptr_unlock_irqsave(void *lockptr)
         |      ^
   lib/refcount.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     191 | void lockptr_unlock_irqsave(void *lockptr)
         | ^
         | static 
   2 warnings generated.


vim +/lockptr_lock_irqsave +183 lib/refcount.c

   182	
 > 183	void lockptr_lock_irqsave(void *lockptr)
   184	{
   185		struct lockptr_irqsave_data *d = lockptr;
   186	
   187		spin_lock_irqsave(d->lockptr, *d->flags);
   188	}
   189	EXPORT_SYMBOL(lockptr_lock_irqsave);
   190	
 > 191	void lockptr_unlock_irqsave(void *lockptr)
   192	{
   193		struct lockptr_irqsave_data *d = lockptr;
   194	
   195		spin_unlock_irqrestore(d->lockptr, *d->flags);
   196	}
   197	EXPORT_SYMBOL(lockptr_unlock_irqsave);
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
