Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C904A0A;
	Fri, 18 Oct 2024 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252902; cv=none; b=rEEbYG8fLr2OF/bu/KkmiA85zCs1UkN9VENpoS3QRg1qucYW9m2gRm7531FWqo4lDoGi4NLfCbFVYisQdcA2QbS1Orr223HRyJb6wMJLLauf/L/BFtRp/zKo3yRPXhBpHHpw4OUSb3Pru0Q3v5jKStSe0FMtC2nXX4wX82WWldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252902; c=relaxed/simple;
	bh=zUhrMsNA1295rQ+PzX7CTzRhRBEqQzICzfaHp5sUdcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOfb5V/1yS6aDOx/01zzza9ExidYQB8A7aD9gvAqyHPqHnlLE0yLIFza4Wt9hPs4tY3pPwrLboDlE5V4Jg4ZWcBouKzZMfLX7DGiHd7TBNz7CaMLYkiqNSsbH0424bMmmrXXohvkXtgstz2hrbe1a/TPp302WO+vbXwGRhOMcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGhy5E21; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGhy5E21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729252900; x=1760788900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUhrMsNA1295rQ+PzX7CTzRhRBEqQzICzfaHp5sUdcM=;
  b=AGhy5E21yZKRbddpxgxXy456zRPGjnDbbD3SEsIeYMZtG/eMyk8Fax9V
   nUKVTtx9gxyItzaV3jpStKwj86b4dtJB16i2v+Zs+sBQsXVek8PbQro7D
   Ro9NCsLhlflquKKHhpChivtg2b74UMu/Z9nZYSXiAXcmRc5KTRQKvGB0x
   IWzmhg8gf+5jfeqFrmYa8PTSAlTWV9wvHtHUw6MHg5f2VHPp+VdvlYwTY
   OfbIVYiR7dT+Sv+KHM9XPqJpPi9ECZe3Ih4dpzNX4565Z+a/NpJcrjjEw
   EAABYtevlybt1yiBcPVINkKGD69Uc/unPvPhpbFO8+0ihYsB+/HjseDRa
   w==;
X-CSE-ConnectionGUID: YdfbSmHqSaiYKTg2Cfu+Tg==
X-CSE-MsgGUID: 4eYOpxDeT6mNeP5LDB0MdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28659986"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="28659986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 05:01:39 -0700
X-CSE-ConnectionGUID: Tx1tGTk9S1iXf93rDkJeeg==
X-CSE-MsgGUID: M9SS7Z/3Q7Kg7Vmu6ITNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78867687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2024 05:01:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1lfd-000Nlj-3B;
	Fri, 18 Oct 2024 12:01:29 +0000
Date: Fri, 18 Oct 2024 20:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de,
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com,
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, pasha.tatashin@soleen.com,
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org,
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com,
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com
Subject: Re: [PATCH v3 3/5] alloc_tag: populate memory for module tags as
 needed
Message-ID: <202410181939.vLqV33c7-lkp@intel.com>
References: <20241014203646.1952505-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014203646.1952505-4-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 828d7267c42c2aab3877c08b4bb00b1e56769557]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/maple_tree-add-mas_for_each_rev-helper/20241015-044156
base:   828d7267c42c2aab3877c08b4bb00b1e56769557
patch link:    https://lore.kernel.org/r/20241014203646.1952505-4-surenb%40google.com
patch subject: [PATCH v3 3/5] alloc_tag: populate memory for module tags as needed
config: i386-randconfig-006-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181939.vLqV33c7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181939.vLqV33c7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181939.vLqV33c7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/alloc_tag.c:394:4: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     393 |                 pr_err("Failed to map %lu bytes for module allocation tags\n",
         |                                       ~~~
         |                                       %u
     394 |                         MODULE_ALLOC_TAG_VMAP_SIZE);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   lib/alloc_tag.c:386:36: note: expanded from macro 'MODULE_ALLOC_TAG_VMAP_SIZE'
     386 | #define MODULE_ALLOC_TAG_VMAP_SIZE (100000 * sizeof(struct alloc_tag))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +394 lib/alloc_tag.c

5b662b363f38b01 Suren Baghdasaryan 2024-10-14  387  
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  388  static int __init alloc_mod_tags_mem(void)
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  389  {
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  390  	/* Map space to copy allocation tags */
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  391  	vm_module_tags = execmem_vmap(EXECMEM_MODULE_DATA, MODULE_ALLOC_TAG_VMAP_SIZE);
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  392  	if (!vm_module_tags) {
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  393  		pr_err("Failed to map %lu bytes for module allocation tags\n",
5b662b363f38b01 Suren Baghdasaryan 2024-10-14 @394  			MODULE_ALLOC_TAG_VMAP_SIZE);
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  395  		module_tags.start_addr = 0;
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  396  		return -ENOMEM;
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  397  	}
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  398  
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  399  	vm_module_tags->pages = kmalloc_array(get_vm_area_size(vm_module_tags) >> PAGE_SHIFT,
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  400  					sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  401  	if (!vm_module_tags->pages) {
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  402  		free_vm_area(vm_module_tags);
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  403  		return -ENOMEM;
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  404  	}
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  405  
f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  406  	module_tags.start_addr = (unsigned long)vm_module_tags->addr;
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  407  	module_tags.end_addr = module_tags.start_addr + MODULE_ALLOC_TAG_VMAP_SIZE;
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  408  
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  409  	return 0;
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  410  }
5b662b363f38b01 Suren Baghdasaryan 2024-10-14  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
