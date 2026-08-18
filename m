Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1B371068;
	Tue, 18 Aug 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095870; cv=none; b=CqCWmb/90yaFlAitrFloxpAR4coqmRO2DH6ltTRaFOEmN7DpO6Vllc2lmrGDD33lBDFHYSp35KKkwD36AHBH9OnalBsSPEimRT9Q/y6V+w0HumwTrGnqr5yQd8iy4+fee1fEt2Rf77B03gm7PINihoJpxK0gp5hcsvAmCi2dFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095870; c=relaxed/simple;
	bh=SCb9bo5eYDUwLUI6fHCUwiIjD72IrkbafRE5EBhZRzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h6arfDFcL3BCxoWJ426lwnq4MTB2c0c3IYyuT2OEJa7s+mt0k60tq7+xcb+wDEzcXgBacsLDhuRZsgJlsoxLWacqis8QCbsq9Z53fJppQMc3b/j7uV4SRrZOAcf2Q/hG/mSLo45eXjpnf5AiQ6lhdNXHdrUdgb1qNElXChSxOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arwRskWj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arwRskWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787095867; x=1818631867;
  h=date:from:to:cc:subject:message-id;
  bh=SCb9bo5eYDUwLUI6fHCUwiIjD72IrkbafRE5EBhZRzo=;
  b=arwRskWjPmGrNDZ34l4lVHMCMscREtDf2+N3QF2grxgc+oPQvQ8mhRcP
   MAZFihZDV1ldA7EKqt3l+kngpti5fBCanxVFMfgyuIApn83MidOStyydF
   2MQ6lM0r+lmAM5DJCygVjJlSQ9WseMU3PwEnd+r3Jeyl7xVZivQmgcF+E
   ToMJmr40gdg0CF1R3MBf8hZPAEu3Q+xQT/Z3D206/5Hr6RhSYtcy6cVQM
   R5AgT3qVZ2jug7o7fOX8wbv5qTEZoYt+75X1A2Vv5S/HTiC4XnJJUgbzo
   D1JatVFb4nT+cidIXCrtE31thB5i0xbfY34nS0pa4/aa9XYeeovMwQGca
   g==;
X-CSE-ConnectionGUID: EooFItfvTAqG28mIbM5k8Q==
X-CSE-MsgGUID: YkL4dn2OSFObKZ/NBumq0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105134560"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105134560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 16:31:05 -0700
X-CSE-ConnectionGUID: V6I2AkQ+Tv2gngRwk9W4dQ==
X-CSE-MsgGUID: 66LMmlyUQh2UkD75/UXWKA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2026 16:31:04 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwTGn-000000007Jh-3oyt;
	Tue, 18 Aug 2026 23:31:01 +0000
Date: Wed, 19 Aug 2026 01:30:11 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 6/13] fs/f2fs/recovery.c:439:21:
 warning: variable 'rn' set but not used
Message-ID: <202608190156.XQjFF93q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: 843ddf01eb4efc800bdac9de795bdeb57940a3e0 [6/13] f2fs: cache: use meta cache
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260819/202608190156.XQjFF93q-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190156.XQjFF93q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190156.XQjFF93q-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                     ^
   fs/f2fs/recovery.c:360:29: error: call to undeclared function 'CACHE_FOLIO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |                     __func__, ino_of_node(CACHE_FOLIO(entry)), name_len, name,
         |                                           ^
   fs/f2fs/recovery.c:360:29: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     360 |                     __func__, ino_of_node(CACHE_FOLIO(entry)), name_len, name,
         |                                           ^~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2132:45: note: expanded from macro 'f2fs_notice'
    2132 |         f2fs_printk(sbi, false, KERN_NOTICE fmt, ##__VA_ARGS__)
         |                                                    ^~~~~~~~~~~
   fs/f2fs/node.h:243:53: note: passing argument to parameter 'node_folio' here
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                                     ^
   fs/f2fs/recovery.c:400:34: error: call to undeclared function 'CACHE_FOLIO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     400 |                 if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
         |                                                ^
   fs/f2fs/recovery.c:400:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     400 |                 if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
         |                                                ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:314:87: note: passing argument to parameter 'folio' here
     314 | static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi, const struct folio *folio)
         |                                                                                       ^
   fs/f2fs/recovery.c:407:27: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     407 |                                         next_blkaddr_of_node(CACHE_FOLIO(entry)));
         |                                                              ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:268:64: note: passing argument to parameter 'node_folio' here
     268 | static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
         |                                                                ^
   fs/f2fs/recovery.c:409:40: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     409 |                 *blkaddr_fast = next_blkaddr_of_node(CACHE_FOLIO(entry));
         |                                                      ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:268:64: note: passing argument to parameter 'node_folio' here
     268 | static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
         |                                                                ^
   fs/f2fs/recovery.c:451:34: error: call to undeclared function 'CACHE_FOLIO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     451 |                 if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
         |                                                ^
   fs/f2fs/recovery.c:451:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     451 |                 if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
         |                                                ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:314:87: note: passing argument to parameter 'folio' here
     314 | static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi, const struct folio *folio)
         |                                                                                       ^
   fs/f2fs/recovery.c:456:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     456 |                 if (!is_fsync_dnode(CACHE_FOLIO(entry)))
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:404:39: note: expanded from macro 'is_fsync_dnode'
     404 | #define is_fsync_dnode(folio)   is_node(folio, FSYNC_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: passing argument to parameter 'folio' here
     397 | static inline int is_node(const struct folio *folio, int type)
         |                                               ^
   fs/f2fs/recovery.c:459:51: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     459 |                 fsync_entry = get_fsync_inode(head, ino_of_node(CACHE_FOLIO(entry)));
         |                                                                 ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:243:53: note: passing argument to parameter 'node_folio' here
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                                     ^
   fs/f2fs/recovery.c:464:15: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     464 |                                         IS_INODE(CACHE_FOLIO(entry)) &&
         |                                                  ^~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3272:49: note: passing argument to parameter 'folio' here
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                                                 ^
   fs/f2fs/recovery.c:465:20: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     465 |                                         is_dent_dnode(CACHE_FOLIO(entry))) {
         |                                                       ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:405:38: note: expanded from macro 'is_dent_dnode'
     405 | #define is_dent_dnode(folio)    is_node(folio, DENT_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: passing argument to parameter 'folio' here
     397 | static inline int is_node(const struct folio *folio, int type)
         |                                               ^
   fs/f2fs/recovery.c:474:57: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     474 |                         fsync_entry = add_fsync_inode(sbi, head, ino_of_node(CACHE_FOLIO(entry)),
         |                                                                              ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:243:53: note: passing argument to parameter 'node_folio' here
     243 | static inline nid_t ino_of_node(const struct folio *node_folio)
         |                                                     ^
   fs/f2fs/recovery.c:493:16: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     493 |                 if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
         |                              ^~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3272:49: note: passing argument to parameter 'folio' here
    3272 | static inline bool IS_INODE(const struct folio *folio)
         |                                                 ^
   fs/f2fs/recovery.c:493:53: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     493 |                 if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
         |                                                                   ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:405:38: note: expanded from macro 'is_dent_dnode'
     405 | #define is_dent_dnode(folio)    is_node(folio, DENT_BIT_SHIFT)
         |                                         ^~~~~
   fs/f2fs/node.h:397:47: note: passing argument to parameter 'folio' here
     397 | static inline int is_node(const struct folio *folio, int type)
         |                                               ^
   fs/f2fs/recovery.c:497:34: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const struct folio *' [-Wint-conversion]
     497 |                 blkaddr = next_blkaddr_of_node(CACHE_FOLIO(entry));
         |                                                ^~~~~~~~~~~~~~~~~~
   fs/f2fs/node.h:268:64: note: passing argument to parameter 'node_folio' here
     268 | static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
         |                                                                ^
>> fs/f2fs/recovery.c:439:21: warning: variable 'rn' set but not used [-Wunused-but-set-variable]
     439 |                 struct f2fs_node *rn;
         |                                   ^
   fs/f2fs/recovery.c:659:15: error: call to undeclared function 'CACHE_FOLIO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         if (IS_INODE(CACHE_FOLIO(entry))) {
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/rn +439 fs/f2fs/recovery.c

   422	
   423	static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
   424					bool check_only, bool *new_inode)
   425	{
   426		struct curseg_info *curseg;
   427		block_t blkaddr, blkaddr_fast;
   428		bool is_detecting = true;
   429		int err = 0;
   430	
   431		/* get node pages in the current segment */
   432		curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
   433		blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
   434		blkaddr_fast = blkaddr;
   435	
   436		while (1) {
   437			struct fsync_inode_entry *fsync_entry;
   438			struct f2fs_cached_block *entry;
 > 439			struct f2fs_node *rn;
   440	
   441			if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
   442				return 0;
   443	
   444			entry = f2fs_get_tmp_cache(sbi, blkaddr);
   445			if (IS_ERR(entry)) {
   446				err = PTR_ERR(entry);
   447				break;
   448			}
   449			rn = CACHED_NODE(entry);
   450	
   451			if (!is_recoverable_dnode(sbi, CACHE_FOLIO(entry))) {
   452				f2fs_put_cache(entry, true);
   453				break;
   454			}
   455	
   456			if (!is_fsync_dnode(CACHE_FOLIO(entry)))
   457				goto next;
   458	
   459			fsync_entry = get_fsync_inode(head, ino_of_node(CACHE_FOLIO(entry)));
   460			if (!fsync_entry) {
   461				bool quota_inode = false;
   462	
   463				if (!check_only &&
   464						IS_INODE(CACHE_FOLIO(entry)) &&
   465						is_dent_dnode(CACHE_FOLIO(entry))) {
   466					err = f2fs_recover_inode_page(sbi, entry);
   467					if (err) {
   468						f2fs_put_cache(entry, true);
   469						break;
   470					}
   471					quota_inode = true;
   472				}
   473	
   474				fsync_entry = add_fsync_inode(sbi, head, ino_of_node(CACHE_FOLIO(entry)),
   475									quota_inode);
   476				if (IS_ERR(fsync_entry)) {
   477					err = PTR_ERR(fsync_entry);
   478					/*
   479					 * CP | dnode(F) | inode(DF)
   480					 * For this case, we should not give up now.
   481					 */
   482					if (err == -ENOENT) {
   483						if (check_only)
   484							*new_inode = true;
   485						goto next;
   486					}
   487					f2fs_put_cache(entry, true);
   488					break;
   489				}
   490			}
   491			fsync_entry->blkaddr = blkaddr;
   492	
   493			if (IS_INODE(CACHE_FOLIO(entry)) && is_dent_dnode(CACHE_FOLIO(entry)))
   494				fsync_entry->last_dentry = blkaddr;
   495	next:
   496			/* check next segment */
   497			blkaddr = next_blkaddr_of_node(CACHE_FOLIO(entry));
   498			f2fs_put_cache(entry, true);
   499	
   500			err = sanity_check_node_chain(sbi, blkaddr, &blkaddr_fast,
   501					&is_detecting);
   502			if (err)
   503				break;
   504		}
   505		return err;
   506	}
   507	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
