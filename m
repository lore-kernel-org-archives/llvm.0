Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914886;
	b=f1v1DyrhAEpa3gbVeu4tKZhT2QohSuyy97BFwN3B+Jrx1SBsGnLjz6XQ2poU7wCKVwg6
	 dVtogypdjtNWaljm5dmMCwloFTB7DqnVapi5BhAqgpmnDOe4IOHcEyIg8h57bHFtpV+hx
	 YijxW7Y7lYmHAMewz9jZSesf1NxBVJPZvu8jCDbdU/+Sg+pH4l0GxKbWunI8Z6IKbnmJm
	 rggV2BPRaBflIiKUEzXDcMIwjByqMrEe5MAvYaUjnd3x6K25VJ9MJGbBZUQx0I5fxu15D
	 xnRfq+kyKglhWw0R8ejd3dzlz3He3RG4Yk2Vfaw0T96L2YNqLZIURz9evnVGcLH67PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aiM/oE8kgKShJq//27WSNnLze8+c/nTxri7ZTU98wHM=;
	b=Ev+tcViCgEDj/ad0Lfw8ejqb3URAPOlukzQCRaZtU/PXj4xag1Uk+e3jdx9EWQZCnl0G
	 imkmnhuoJ3MzwPCJMd59hiVRmPGP1jJ4wx7APNOjucuPkw1A2mXJg01q2nF5G+871FfNz
	 kaW5OS7dnhfKf+uHU0cXFfgnI25r0Dl+YI1jxMWeF5iYYgNpSjHBwCPDoVY+Vap0P9V7a
	 w+wyOJYbnJ7/y9sVlt0G+oo9hOZK/XdTJFJNJJzJb3mGSNQwcKQRa9lHeICbkSTihYveg
	 SehfwyNvRuWkDCfdb7S7w31PWO2Qf4mWpl78t800LShbxyV7ES6dWuV8RX8lZp+jm6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mn5jASi9;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA24606A31F;
	Sun, 25 Oct 2026 07:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA24606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mn5jASi9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792914885; x=1824450885;
  h=date:from:to:cc:subject:message-id;
  bh=RXkyXH1HW0XxaoN6pdDQeA+FxqLuUzhirnNnU0ZZ5To=;
  b=mn5jASi9IiPWoOGpdcqhUT0uzeFVNsv3NsF0NNOR0pSRbRrCOVJDkGXP
   LDAEOaYGPCfFTTYw0/Jij3c7kwqgi7gyVaO48SIvKJ3FaxFCXQn3P6ldv
   WnD5TsgKgNHjQc56HC2xJr+/fbnkIvCtIKvTDemE9ToMuznG5W9HY4ojv
   BoopcPmTFXBGIFnYO13KrbWrKsOBKZT2OvPSx3hPLbyFz2J02gbxHzivQ
   WekNL8WSwrXVRk+i6R/hXtWHtK8EkeZYhs4OJo3eMDYVT+ImWp9UNCi1c
   vFNo5E9pl7E6QLcu6rosBPqhCSUQGTRiJnrKouXcUtRFLBSHYu6cdzlSx
   w==;
X-CSE-ConnectionGUID: Dx7oK5QlQNGNfiUgf7W2lA==
X-CSE-MsgGUID: Z3om9+jCQ0GOtuPb7FrWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1496455"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1496455"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 00:54:44 -0700
X-CSE-ConnectionGUID: WYQYVIa1QeaTIPycnQ5opQ==
X-CSE-MsgGUID: UZ8Kgc/GSLuvCKRao9fYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3982497"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2026 00:54:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKt3v-00000000Ues-266g;
	Sun, 25 Oct 2026 07:54:39 +0000
Date: Sun, 25 Oct 2026 15:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 85/98] fs/rpdfs/meta.c:184:6:
 warning: variable 'folio' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202610251501.pwJfD1H3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Zach,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   8a293e5c1bf0416f4d4e116bf8693c00dbe876da
commit: 2f7d4b4295890ece08df31aa8e2d0150594c6c07 [85/98] rpdfs: update inode code
config: hexagon-randconfig-1000-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251501.pwJfD1H3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251501.pwJfD1H3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251501.pwJfD1H3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:184:33: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^
   include/asm-generic/bug.h:170:28: note: expanded from macro 'WARN_ON'
     170 | #define WARN_ON(condition) ({                                           \
         |                            ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     188 |                 goto out;
         |                 ~~~~~~~~~
     189 |         }
         |         ~
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:184:33: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^
   include/asm-generic/bug.h:170:28: note: expanded from macro 'WARN_ON'
     170 | #define WARN_ON(condition) ({                                           \
         |                            ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:184:33: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^
   include/asm-generic/bug.h:170:28: note: expanded from macro 'WARN_ON'
     170 | #define WARN_ON(condition) ({                                           \
         |                            ^
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:184:33: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:170:28: note: expanded from macro 'WARN_ON'
     170 | #define WARN_ON(condition) ({                                           \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     171 |         int __ret_warn_on = !!(condition);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |         unlikely(__ret_warn_on);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     173 | })
         | ~~
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:184:33: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^
   include/asm-generic/bug.h:170:28: note: expanded from macro 'WARN_ON'
     170 | #define WARN_ON(condition) ({                                           \
         |                            ^
   fs/rpdfs/meta.c:178:21: note: initialize the variable 'folio' to silence this warning
     178 |         struct folio *folio;
         |                            ^
         |                             = NULL
   3 warnings generated.
--
>> fs/rpdfs/mkfs.c:23:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      23 |         if (IS_ERR(folio)) {
         |             ^~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:46:9: note: uninitialized use occurs here
      46 |         return ret;
         |                ^~~
   fs/rpdfs/mkfs.c:23:2: note: remove the 'if' if its condition is always true
      23 |         if (IS_ERR(folio)) {
         |         ^~~~~~~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:20:9: note: initialize the variable 'ret' to silence this warning
      20 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.
--
>> fs/rpdfs/ehtable.c:259:2: warning: variable 'del' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:275:31: note: uninitialized use occurs here
     275 |         for_each_entry_continue(ehb, del, ent, pl) {
         |                                      ^~~
   fs/rpdfs/ehtable.c:151:25: note: expanded from macro 'for_each_entry_continue'
     151 |         __for_each_entry(ehb, (cont + 1), ent, pl)
         |                                ^~~~
   fs/rpdfs/ehtable.c:143:13: note: expanded from macro '__for_each_entry'
     143 |         for (ent = INIT, pl = 0; \
         |                    ^~~~
   fs/rpdfs/ehtable.c:259:2: note: remove the condition if it is always true
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^
   fs/rpdfs/ehtable.c:254:33: note: initialize the variable 'del' to silence this warning
     254 |         struct rpdfs_ehtable_entry *del;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +184 fs/rpdfs/meta.c

2658c3c902752b5 Zach Brown 2026-07-09  150  
2658c3c902752b5 Zach Brown 2026-07-09  151  /*
2658c3c902752b5 Zach Brown 2026-07-09  152   * Get a folio that contains the block of the described type and index.
2658c3c902752b5 Zach Brown 2026-07-09  153   * Modeled loosely after __filemap_get_folio, except that we have much
2658c3c902752b5 Zach Brown 2026-07-09  154   * less variation in callers.
2658c3c902752b5 Zach Brown 2026-07-09  155   *
2658c3c902752b5 Zach Brown 2026-07-09  156   * Generally folios are returned without the folio lock held.  Callers
2658c3c902752b5 Zach Brown 2026-07-09  157   * are expected to have higher level serialization of safe access to the
2658c3c902752b5 Zach Brown 2026-07-09  158   * block's contents.
2658c3c902752b5 Zach Brown 2026-07-09  159   *
2658c3c902752b5 Zach Brown 2026-07-09  160   * The waiting flags (_READ, _WRITE) are killable and only suitable for
2658c3c902752b5 Zach Brown 2026-07-09  161   * task contexts.
2658c3c902752b5 Zach Brown 2026-07-09  162   *
2658c3c902752b5 Zach Brown 2026-07-09  163   * MGF_NEW: return a locked folio that is not uptodate and whose
2658c3c902752b5 Zach Brown 2026-07-09  164   * contents are uninitialized.  The caller must unlock, and must either
2658c3c902752b5 Zach Brown 2026-07-09  165   * mark the folio in error or initialize the contents and set it
2658c3c902752b5 Zach Brown 2026-07-09  166   * uptodate.
2658c3c902752b5 Zach Brown 2026-07-09  167   *
2658c3c902752b5 Zach Brown 2026-07-09  168   * MGF_READ: return a folio that is uptodate.  The folio may be
2658c3c902752b5 Zach Brown 2026-07-09  169   * undergoing writeback.
2658c3c902752b5 Zach Brown 2026-07-09  170   *
2658c3c902752b5 Zach Brown 2026-07-09  171   * MGF_WRITE: return a locked folio that is uptodate and not under
2658c3c902752b5 Zach Brown 2026-07-09  172   * writeback.  The folio is returned locked so that writeback won't
2658c3c902752b5 Zach Brown 2026-07-09  173   * start until the caller unlocks.
2658c3c902752b5 Zach Brown 2026-07-09  174   */
2658c3c902752b5 Zach Brown 2026-07-09  175  struct folio *rpdfs_meta_get_folio(struct inode *inode, mgf_t mgf, u8 type, u64 t_index)
2658c3c902752b5 Zach Brown 2026-07-09  176  {
2658c3c902752b5 Zach Brown 2026-07-09  177  	struct address_space *mapping = shadow_mapping(inode);
2658c3c902752b5 Zach Brown 2026-07-09  178  	struct folio *folio;
2658c3c902752b5 Zach Brown 2026-07-09  179  	pgoff_t f_index;
2658c3c902752b5 Zach Brown 2026-07-09  180  	int ret;
2658c3c902752b5 Zach Brown 2026-07-09  181  
2658c3c902752b5 Zach Brown 2026-07-09  182  	BUILD_BUG_ON(PAGE_SIZE != RPDFS_BLOCK_SIZE);
2658c3c902752b5 Zach Brown 2026-07-09  183  
2658c3c902752b5 Zach Brown 2026-07-09 @184  	if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
2658c3c902752b5 Zach Brown 2026-07-09  185  	    WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
2658c3c902752b5 Zach Brown 2026-07-09  186  	    WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
2658c3c902752b5 Zach Brown 2026-07-09  187  		ret = -EINVAL;
2658c3c902752b5 Zach Brown 2026-07-09  188  		goto out;
2658c3c902752b5 Zach Brown 2026-07-09  189  	}
2658c3c902752b5 Zach Brown 2026-07-09  190  
2658c3c902752b5 Zach Brown 2026-07-09  191  	ret = folio_index_from_type(inode, type, t_index, &f_index);
2658c3c902752b5 Zach Brown 2026-07-09  192  	if (ret < 0) {
2658c3c902752b5 Zach Brown 2026-07-09  193  		folio = ERR_PTR(ret);
2658c3c902752b5 Zach Brown 2026-07-09  194  		goto out;
2658c3c902752b5 Zach Brown 2026-07-09  195  	}
2658c3c902752b5 Zach Brown 2026-07-09  196  
2658c3c902752b5 Zach Brown 2026-07-09  197  	if (mgf & MGF_NEW) {
2658c3c902752b5 Zach Brown 2026-07-09  198  		folio = __filemap_get_folio(mapping, f_index, FGP_LOCK|FGP_CREAT, GFP_NOFS);
2658c3c902752b5 Zach Brown 2026-07-09  199  		goto out;
2658c3c902752b5 Zach Brown 2026-07-09  200  	}
2658c3c902752b5 Zach Brown 2026-07-09  201  
2658c3c902752b5 Zach Brown 2026-07-09  202  	folio = mapping_read_folio_gfp(mapping, f_index, GFP_NOFS);
2658c3c902752b5 Zach Brown 2026-07-09  203  	if (IS_ERR(folio))
2658c3c902752b5 Zach Brown 2026-07-09  204  		goto out;
2658c3c902752b5 Zach Brown 2026-07-09  205  
2658c3c902752b5 Zach Brown 2026-07-09  206  	if (mgf & MGF_WRITE) {
2658c3c902752b5 Zach Brown 2026-07-09  207  		ret = folio_lock_killable(folio);
2658c3c902752b5 Zach Brown 2026-07-09  208  		if (ret == 0) {
2658c3c902752b5 Zach Brown 2026-07-09  209  			ret = folio_wait_writeback_killable(folio);
2658c3c902752b5 Zach Brown 2026-07-09  210  			if (ret < 0)
2658c3c902752b5 Zach Brown 2026-07-09  211  				folio_unlock(folio);
2658c3c902752b5 Zach Brown 2026-07-09  212  		}
2658c3c902752b5 Zach Brown 2026-07-09  213  		if (ret < 0) {
2658c3c902752b5 Zach Brown 2026-07-09  214  			folio_put(folio);
2658c3c902752b5 Zach Brown 2026-07-09  215  			folio = ERR_PTR(ret);
2658c3c902752b5 Zach Brown 2026-07-09  216  			goto out;
2658c3c902752b5 Zach Brown 2026-07-09  217  		}
2658c3c902752b5 Zach Brown 2026-07-09  218  	}
2658c3c902752b5 Zach Brown 2026-07-09  219  
2658c3c902752b5 Zach Brown 2026-07-09  220  out:
2658c3c902752b5 Zach Brown 2026-07-09  221  	if (!IS_ERR(folio))
2658c3c902752b5 Zach Brown 2026-07-09  222  		rpdfs_prd("mgf %x type %u index %llu "RFF, mgf, type, t_index, RFA(folio));
2658c3c902752b5 Zach Brown 2026-07-09  223  	else
2658c3c902752b5 Zach Brown 2026-07-09  224  		rpdfs_prd("mgf %x type %u index %llu ret %ld", mgf, type, t_index, PTR_ERR(folio));
2658c3c902752b5 Zach Brown 2026-07-09  225  
2658c3c902752b5 Zach Brown 2026-07-09  226  	return folio;
2658c3c902752b5 Zach Brown 2026-07-09  227  }
2658c3c902752b5 Zach Brown 2026-07-09  228  

:::::: The code at line 184 was first introduced by commit
:::::: 2658c3c902752b51b9bebb9bb36cf7dcde32d28d rpdfs: add meta code for caching metadata

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
