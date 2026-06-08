Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB71EEA31;
	Mon,  8 Jun 2026 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780879824; cv=none; b=U7eTYMJ/x7mYt4gu3h9EMVxBHLxg106GDI96NcvaHjvRT1qNDT+c1JqPYLLv4xJI6eSotqliQJf4Q/2K5tnc9T/h/2vZ2XCRidQ28SbFyliNzlz1Q5cIQcQGxF5L75EmLlhPs2TnNw3ZwT1b5NFLlvf3aTBRvSH/Tw5HEMAWQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780879824; c=relaxed/simple;
	bh=fYRnmyy3qCtgVzRY14AlWbCiNQPkaeLN23BqQ9hflQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KyrpYZL/pAK3G2MiAn3a74YRQ/SnqujhzSo+rZgA0KjeQKvcYp96celRjbJzhsuxenuQDFmevLbF2TwIvlWC2AKNXM9QOKtBseNEwZlaijjh6thtLXM6rZUGLQjB9ZjSot9M6sKqiWCCchnVkzuuYcq1juXuTUCRLMIAsUuSA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5ZtX83K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5ZtX83K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780879822; x=1812415822;
  h=date:from:to:cc:subject:message-id;
  bh=fYRnmyy3qCtgVzRY14AlWbCiNQPkaeLN23BqQ9hflQA=;
  b=f5ZtX83KWDvRiNrNUK7WmGE9/bCY/OCs4BcNT1E+7eeXxrfIpI81VB6B
   +asIxusjZ6QAPSS0UvclwPJMgcUuJ7JaFdJBSG/njm5/MwypCXShRZdEl
   /juJTsiTfg1oxqGkm4nv49qsvRlLdQyNXvRvwyyk7Iy2DoJBmd0T1hyyy
   ldJ0m9QWEv77F8j3H4ZaFmIXWFOYkvAs+HjRiDPBDfjxDwJW7GgmKD7K0
   VdaZ2i7J8xiYiuNU1Ckw7vYLVppd9EFaU5MdAT+DdNRu6HGBcwoIq/E7g
   KaLCqre/0/cwU5Qcgsq6GTBUDYHlKnIWwJBWR+cAwzmNmR9Wkxz5s5+Ea
   Q==;
X-CSE-ConnectionGUID: 1Rr+D3o2SSm79iilAYnk6w==
X-CSE-MsgGUID: TLyq7xTCQiKH2291XXcjmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81522768"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="81522768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 17:50:21 -0700
X-CSE-ConnectionGUID: 2tUDnTOaQV6/vTbYmGqNdg==
X-CSE-MsgGUID: N+qqO4KhTW+IMGjV8BhIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="269355648"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2026 17:50:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWOC0-00000000IHS-0R8o;
	Mon, 08 Jun 2026 00:50:16 +0000
Date: Mon, 08 Jun 2026 08:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.2.misc 28/28]
 fs/smb/client/file.c:3237:23: warning: converting the result of '<<' to a
 boolean always evaluates to true
Message-ID: <202606080831.mf22xxxh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Jori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/brauner/linux.git vfs-7.2.misc
head:   0da79c259ad0554b36761a7135d4f92eb7c46263
commit: 0da79c259ad0554b36761a7135d4f92eb7c46263 [28/28] vfs: uapi: retire octal and hex numbers in favor of (1 << n) for O_ flags
config: s390-randconfig-002 (https://download.01.org/0day-ci/archive/20260608/202606080831.mf22xxxh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606080831.mf22xxxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606080831.mf22xxxh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/file.c:3237:23: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
    3237 |                         break_lease(inode, O_WRONLY);
         |                                            ^
   include/uapi/asm-generic/fcntl.h:20:21: note: expanded from macro 'O_WRONLY'
      20 | #define O_WRONLY        (1 << 0)
         |                            ^
   1 warning generated.


vim +3237 fs/smb/client/file.c

^1da177e4c3f41 fs/cifs/file.c       Linus Torvalds     2005-04-16  3184  
9b646972467fb5 fs/cifs/file.c       Tejun Heo          2010-07-20  3185  void cifs_oplock_break(struct work_struct *work)
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3186  {
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3187  	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3188  						  oplock_break);
2b0143b5c986be fs/cifs/file.c       David Howells      2015-03-17  3189  	struct inode *inode = d_inode(cfile->dentry);
705c79101ccf9e fs/smb/client/file.c Wang Zhaolong      2025-07-07  3190  	struct super_block *sb = inode->i_sb;
705c79101ccf9e fs/smb/client/file.c Wang Zhaolong      2025-07-07  3191  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3192  	struct cifsInodeInfo *cinode = CIFS_I(inode);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3193  	bool cache_read, cache_write, cache_handle;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3194  	struct cifs_tcon *tcon;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3195  	struct TCP_Server_Info *server;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3196  	struct tcon_link *tlink;
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3197  	unsigned int oplock;
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  3198  	int rc = 0;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3199  	bool purge_cache = false, oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3200  	__u64 persistent_fid, volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3201  	__u16 net_fid;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3202  
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  3203  	wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
743162013d40ca fs/cifs/file.c       NeilBrown          2014-07-07  3204  			TASK_UNINTERRUPTIBLE);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  3205  
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3206  	tlink = cifs_sb_tlink(cifs_sb);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3207  	if (IS_ERR(tlink))
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3208  		goto out;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3209  	tcon = tlink_tcon(tlink);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3210  	server = tcon->ses->server;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3211  
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3212  	scoped_guard(spinlock, &cinode->open_file_lock) {
4fc3a433c13944 fs/smb/client/file.c Paulo Alcantara    2026-02-23  3213  		unsigned int sbflags = cifs_sb_flags(cifs_sb);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3214  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  3215  		server->ops->downgrade_oplock(server, cinode, cfile->oplock_level,
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  3216  					      cfile->oplock_epoch, &purge_cache);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3217  		oplock = READ_ONCE(cinode->oplock);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3218  		cache_read = (oplock & CIFS_CACHE_READ_FLG) ||
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3219  			(sbflags & CIFS_MOUNT_RO_CACHE);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3220  		cache_write = (oplock & CIFS_CACHE_WRITE_FLG) ||
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3221  			(sbflags & CIFS_MOUNT_RW_CACHE);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3222  		cache_handle = oplock & CIFS_CACHE_HANDLE_FLG;
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3223  	}
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  3224  
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3225  	if (!cache_write && cache_read && cifs_has_mand_locks(cinode)) {
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  3226  		cifs_dbg(FYI, "Reset oplock to None for inode=%p due to mand locks\n",
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  3227  			 inode);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3228  		cifs_reset_oplock(cinode);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3229  		oplock = 0;
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3230  		cache_read = cache_write = cache_handle = false;
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  3231  	}
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  3232  
9fb2e20e4f6aca fs/smb/client/file.c Ivan Abramov       2025-03-10  3233  	if (S_ISREG(inode->i_mode)) {
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3234  		if (cache_read)
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24  3235  			break_lease(inode, O_RDONLY);
d54ff73259a852 fs/cifs/file.c       Steve French       2010-04-27  3236  		else
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24 @3237  			break_lease(inode, O_WRONLY);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3238  		rc = filemap_fdatawrite(inode->i_mapping);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3239  		if (!cache_read || purge_cache) {
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  3240  			rc = filemap_fdatawait(inode->i_mapping);
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  3241  			mapping_set_error(inode->i_mapping, rc);
4f73c7d342d57d fs/cifs/file.c       Jeff Layton        2014-04-30  3242  			cifs_zap_mapping(inode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3243  		}
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  3244  		cifs_dbg(FYI, "Oplock flush inode %p rc %d\n", inode, rc);
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3245  		if (cache_write)
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  3246  			goto oplock_break_ack;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3247  	}
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3248  
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  3249  	rc = cifs_push_locks(cfile);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  3250  	if (rc)
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  3251  		cifs_dbg(VFS, "Push locks rc = %d\n", rc);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  3252  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  3253  oplock_break_ack:
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3254  	/*
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3255  	 * When oplock break is received and there are no active
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3256  	 * file handles but cached, then schedule deferred close immediately.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3257  	 * So, new open will not use cached handle.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3258  	 */
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3259  
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3260  	if (!cache_handle && !list_empty(&cinode->deferred_closes))
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3261  		cifs_close_deferred_file(cinode);
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  3262  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3263  	persistent_fid = cfile->fid.persistent_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3264  	volatile_fid = cfile->fid.volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3265  	net_fid = cfile->fid.netfid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3266  	oplock_break_cancelled = cfile->oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3267  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  3268  	_cifsFileInfo_put(cfile, false /* do not wait for ourself */, false);
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  3269  	/*
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  3270  	 * MS-SMB2 3.2.5.19.1 and 3.2.5.19.2 (and MS-CIFS 3.2.5.42) do not require
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  3271  	 * an acknowledgment to be sent when the file has already been closed.
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  3272  	 */
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  3273  	spin_lock(&cinode->open_file_lock);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3274  	/* check list empty since can race with kill_sb calling tree disconnect */
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3275  	if (!oplock_break_cancelled && !list_empty(&cinode->openFileList)) {
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  3276  		spin_unlock(&cinode->open_file_lock);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3277  		rc = server->ops->oplock_response(tcon, persistent_fid,
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3278  						  volatile_fid, net_fid,
4c91b67f87ac03 fs/smb/client/file.c Paulo Alcantara    2026-02-12  3279  						  cinode, oplock);
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  3280  		cifs_dbg(FYI, "Oplock release rc = %d\n", rc);
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11  3281  	} else
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  3282  		spin_unlock(&cinode->open_file_lock);
9e31678fb403ea fs/cifs/file.c       Bharath SM         2022-08-11  3283  
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3284  	cifs_put_tlink(tlink);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  3285  out:
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  3286  	cifs_done_oplock_break(cinode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3287  }
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  3288  

:::::: The code at line 3237 was first introduced by commit
:::::: 8737c9305bd5602b11f7eb4655d5695d4a42a0c6 Switch may_open() and break_lease() to passing O_...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
