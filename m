Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF162390229;
	Mon, 18 May 2026 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134271; cv=none; b=A1Juh4Rmc6pigytCR6jHyEtudLatnzen/VdcoDfhKOKYoFIalmeCqXobukH7vWVcB1OTkTDTjPi9y8OXILC32ccoGpsy66M3ZPGq07fIJCoiKwkEmznIdCrXDuFi7UTHPZD0D+h2lHwKD/TXDlEjplBtEsFhdztfqi3hwRe9wiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134271; c=relaxed/simple;
	bh=9/ZaDDIERHf95V5MsWsPsSZpOoMh5BIpi/8l+mpuNfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a5nzIR+GnSXz9IYsWWCovrO+s1V7X/0GDh8QX09iD9a0JHwcQzpkQPlfRMBnAISjltBZWWrgIr/avWGcT/RanEw09x/40btZ6oigstz0z1E6wguPqGdhm5+VIZlFM/PxEB3cJdXSM8G8lXDrDUNfOo29icvbODUlq47lSiFLiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4/m+FUo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4/m+FUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779134270; x=1810670270;
  h=date:from:to:cc:subject:message-id;
  bh=9/ZaDDIERHf95V5MsWsPsSZpOoMh5BIpi/8l+mpuNfQ=;
  b=D4/m+FUoQeMxWnHTQBwF5XxCwph2WiXx1+mAToLBDEkYcaATgK7Ftuha
   Q8IXDHnEXSCjboG+lCyl63GkcBoVdQTcLS7vQNesfFfoJ1ZkrBLBeZBWV
   QPauQbiRtg4es2ca9tRysffQCm02jLlCWsx5ctetCeDo9qS6LmMiCry+N
   0eOVBsK1p/Pd8Fmj3d8+mPOLyG4a+lY6KzE2LyXSb0TpBERIufTXXepyy
   3xxGwqtedJme3lFcRoeSqPRJfA8E1WNMbn8XX7Ceeg3wr+8fXPx4APYCL
   Ilz0LTQGKJCmZovNpINodQV83yML5uwJzhYTWahTKTNz+KeEqB1UDI9Ca
   g==;
X-CSE-ConnectionGUID: HVByrcJjQDK8GTE42qPA5g==
X-CSE-MsgGUID: 1ji1vl1zQk66B73yYP2nrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102674731"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="102674731"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:57:48 -0700
X-CSE-ConnectionGUID: sZsEdYSmQTai9zzn+qSZlg==
X-CSE-MsgGUID: 1SYeyffkT8yl9VKfX2C+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="277642296"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 12:57:45 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP45v-000000003LY-0RH6;
	Mon, 18 May 2026 19:57:43 +0000
Date: Tue, 19 May 2026 03:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 14/238]
 drivers/md/bcache/bset.c:330:57: error: too many arguments to function call,
 expected single argument 'size', have 2 arguments
Message-ID: <202605190333.0Sllgqcg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 0481d1dfb6cc95e2c2f4df47869dd9dbf8003f49 [14/238] bcache: replace __get_free_pages() with kmalloc()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260519/202605190333.0Sllgqcg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190333.0Sllgqcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190333.0Sllgqcg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/bcache/bset.c:330:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/bset.c:330:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/bset.c:330:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     330 |                 : kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/bset.c:336:57: error: too many arguments to function call, expected single argument 'size', have 2 arguments
     336 |                 : kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
         |                                         ~~~~~~~~~                     ^~~
   include/asm-generic/getorder.h:29:48: note: 'get_order' declared here
      29 | static __always_inline __attribute_const__ int get_order(unsigned long size)
         |                                                ^         ~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/size +330 drivers/md/bcache/bset.c

   313	
   314	int bch_btree_keys_alloc(struct btree_keys *b,
   315				 unsigned int page_order,
   316				 gfp_t gfp)
   317	{
   318		struct bset_tree *t = b->set;
   319	
   320		BUG_ON(t->data);
   321	
   322		b->page_order = page_order;
   323	
   324		t->data = kmalloc(PAGE_SIZE << (b->page_order), __GFP_COMP|gfp);
   325		if (!t->data)
   326			goto err;
   327	
   328		t->tree = bset_tree_bytes(b) < PAGE_SIZE
   329			? kmalloc(bset_tree_bytes(b), gfp)
 > 330			: kmalloc(PAGE_SIZE << (get_order(bset_tree_bytes(b), gfp)));
   331		if (!t->tree)
   332			goto err;
   333	
   334		t->prev = bset_prev_bytes(b) < PAGE_SIZE
   335			? kmalloc(bset_prev_bytes(b), gfp)
   336			: kmalloc(PAGE_SIZE << (get_order(bset_prev_bytes(b), gfp)));
   337		if (!t->prev)
   338			goto err;
   339	
   340		return 0;
   341	err:
   342		bch_btree_keys_free(b);
   343		return -ENOMEM;
   344	}
   345	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
