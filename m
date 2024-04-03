Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D34AEE3;
	Wed,  3 Apr 2024 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712123478; cv=none; b=siQweA81btVWFZTAo8Awxp6PqQM211BGQvZKyq81BAw+wmg8sdiBaVIxbYW12uAo69SQEwQNhruTYDP+nMlBTOs7XoBBEuExKKl5JDU+g1jUPhVOaHA9p3XWI1ULOsJOwi/j63rp0+2AK+lV6fLb6bS57dXJ+7n2AOIdSZEqgrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712123478; c=relaxed/simple;
	bh=fT8GmiEoR/sC9RAc60zPGFVi1luZQthqL7dkKjmLln0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aoCsGw9Cs/wo7yaDZMSHL8I4e9+3Bbjzyh+B618j16HpqeRQ+5n6iZDvCaLeE6h+syqYkiJEgexeZrOEj1Xzy3DbjrQtz/6+ZIxUIqRQGJ4X6GbVoWWE1egz9KRETNXXdLtBaMCrjFMIcdqh6WfZk6AZb2cR1Wk/HbMBXm5mlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apvkl0ch; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apvkl0ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712123476; x=1743659476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fT8GmiEoR/sC9RAc60zPGFVi1luZQthqL7dkKjmLln0=;
  b=apvkl0chDg6YVfTC90VlXkkts3+eU4qcBkY7GRyzYb0V8juDCF+zoeUw
   FROLESQ9+6bYhaO+v3gar9W3uqk+99kkAfj4pNLlSxWJ10+TlJcm8OQoG
   XzrD0oJDtAm6UlhCl9RsYwa9hKRoUYUYQM0u1tg7HnTwOLrfaUJT99MUX
   KT23LXnKgkHkIjOmy6y93VH31fddQX72EBcuokTRS9beF6egY5qP3u/a3
   CW7zZPz9rngWtyaK1XCCK33XBbQzXP0It+x+hknL40RWGRKXiYmz79TQm
   gCm6uw2V1BCn8RnDevqYcfZDN3TISO270sKYkM/GsxsXTqDUKhgVokLCM
   Q==;
X-CSE-ConnectionGUID: SyZ4IUTbQsONkfQqiImHyw==
X-CSE-MsgGUID: o9+cC2IHTG2ernoelhl1Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18059631"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18059631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 22:51:15 -0700
X-CSE-ConnectionGUID: Zuj8qeZsTAKyFuSXGoyBSg==
X-CSE-MsgGUID: d+ERS+0jRniE617pvGWGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="23015911"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Apr 2024 22:51:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrtWg-0001uE-38;
	Wed, 03 Apr 2024 05:51:10 +0000
Date: Wed, 3 Apr 2024 13:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ritvik Budhiraja <rbudhiraja@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 3307/3504] fs/smb/client/file.c:728:12: warning:
 variable 'rc' is used uninitialized whenever 'if' condition is false
Message-ID: <202404031346.wpIhNpyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: a423dcbdabf457c0fff3669b0b20708d287c92c2 [3307/3504] smb3: retrying on failed server close
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240403/202404031346.wpIhNpyF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031346.wpIhNpyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031346.wpIhNpyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/smb/client/file.c:27:
   In file included from fs/smb/client/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/smb/client/file.c:27:
   In file included from fs/smb/client/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/smb/client/file.c:27:
   In file included from fs/smb/client/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/smb/client/file.c:728:12: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     728 |                 else if (server->ops->close)
         |                          ^~~~~~~~~~~~~~~~~~
   fs/smb/client/file.c:732:7: note: uninitialized use occurs here
     732 |                 if (rc == -EBUSY || rc == -EAGAIN) {
         |                     ^~
   fs/smb/client/file.c:728:8: note: remove the 'if' if its condition is always true
     728 |                 else if (server->ops->close)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
     729 |                         rc = server->ops->close(xid, tcon, &cifs_file->fid);
   fs/smb/client/file.c:723:9: note: initialize the variable 'rc' to silence this warning
     723 |                 int rc;
         |                       ^
         |                        = 0
   18 warnings generated.


vim +728 fs/smb/client/file.c

b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  646  
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  647  /**
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  648   * _cifsFileInfo_put - release a reference of file priv data
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  649   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  650   * This may involve closing the filehandle @cifs_file out on the
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  651   * server. Must be called without holding tcon->open_file_lock,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  652   * cinode->open_file_lock and cifs_file->file_info_lock.
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  653   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  654   * If @wait_for_oplock_handler is true and we are releasing the last
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  655   * reference, wait for any running oplock break handler of the file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  656   * and cancel any pending one.
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  657   *
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  658   * @cifs_file:	cifs/smb3 specific info (eg refcounts) for an open file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  659   * @wait_oplock_handler: must be false if called from oplock_break_handler
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  660   * @offload:	not offloaded on close and oplock breaks
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  661   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  662   */
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  663  void _cifsFileInfo_put(struct cifsFileInfo *cifs_file,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  664  		       bool wait_oplock_handler, bool offload)
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  665  {
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  666  	struct inode *inode = d_inode(cifs_file->dentry);
96daf2b09178d8 fs/cifs/file.c       Steve French     2011-05-27  667  	struct cifs_tcon *tcon = tlink_tcon(cifs_file->tlink);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  668  	struct TCP_Server_Info *server = tcon->ses->server;
e66673e39ac9d4 fs/cifs/file.c       Pavel Shilovsky  2010-11-02  669  	struct cifsInodeInfo *cifsi = CIFS_I(inode);
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  670  	struct super_block *sb = inode->i_sb;
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  671  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
2bff0659338e58 fs/cifs/file.c       Steve French     2022-10-14  672  	struct cifs_fid fid = {};
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  673  	struct cifs_pending_open open;
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  674  	bool oplock_break_cancelled;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  675  	bool serverclose_offloaded = false;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  676  
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  677  	spin_lock(&tcon->open_file_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  678  	spin_lock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  679  	spin_lock(&cifs_file->file_info_lock);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  680  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  681  	cifs_file->offload = offload;
5f6dbc9e4afe4d fs/cifs/file.c       Jeff Layton      2010-10-15  682  	if (--cifs_file->count > 0) {
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  683  		spin_unlock(&cifs_file->file_info_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  684  		spin_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  685  		spin_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  686  		return;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  687  	}
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  688  	spin_unlock(&cifs_file->file_info_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  689  
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  690  	if (server->ops->get_lease_key)
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  691  		server->ops->get_lease_key(inode, &fid);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  692  
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  693  	/* store open in pending opens to make sure we don't miss lease break */
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  694  	cifs_add_pending_open_locked(&fid, cifs_file->tlink, &open);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  695  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  696  	/* remove it from the lists */
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  697  	list_del(&cifs_file->flist);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  698  	list_del(&cifs_file->tlist);
fae8044c03c3c0 fs/cifs/file.c       Steve French     2018-10-19  699  	atomic_dec(&tcon->num_local_opens);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  700  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  701  	if (list_empty(&cifsi->openFileList)) {
f96637be081141 fs/cifs/file.c       Joe Perches      2013-05-04  702  		cifs_dbg(FYI, "closing last open instance for inode %p\n",
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  703  			 d_inode(cifs_file->dentry));
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  704  		/*
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  705  		 * In strict cache mode we need invalidate mapping on the last
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  706  		 * close  because it may cause a error when we open this file
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  707  		 * again and get at least level II oplock.
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  708  		 */
4f8ba8a0c09593 fs/cifs/file.c       Pavel Shilovsky  2010-11-21  709  		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
aff8d5ca7a3dca fs/cifs/file.c       Jeff Layton      2014-04-30  710  			set_bit(CIFS_INO_INVALID_MAPPING, &cifsi->flags);
c67236281c5d74 fs/cifs/file.c       Pavel Shilovsky  2010-11-03  711  		cifs_set_oplock_level(cifsi, 0);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  712  	}
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  713  
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  714  	spin_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  715  	spin_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  716  
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  717  	oplock_break_cancelled = wait_oplock_handler ?
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  718  		cancel_work_sync(&cifs_file->oplock_break) : false;
ad635942c869ad fs/cifs/file.c       Jeff Layton      2011-07-26  719  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  720  	if (!tcon->need_reconnect && !cifs_file->invalidHandle) {
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  721  		struct TCP_Server_Info *server = tcon->ses->server;
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  722  		unsigned int xid;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  723  		int rc;
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  724  
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  725  		xid = get_xid();
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02  726  		if (server->ops->close_getattr)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  727  			rc = server->ops->close_getattr(xid, tcon, cifs_file);
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02 @728  		else if (server->ops->close)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  729  			rc = server->ops->close(xid, tcon, &cifs_file->fid);
760ad0cac19835 fs/cifs/file.c       Pavel Shilovsky  2012-09-25  730  		_free_xid(xid);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  731  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  732  		if (rc == -EBUSY || rc == -EAGAIN) {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  733  			// Server close failed, hence offloading it as an async op
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  734  			queue_work(serverclose_wq, &cifs_file->serverclose);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  735  			serverclose_offloaded = true;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  736  		}
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  737  	}
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  738  
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  739  	if (oplock_break_cancelled)
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  740  		cifs_done_oplock_break(cifsi);
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  741  
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  742  	cifs_del_pending_open(&open);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  743  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  744  	// if serverclose has been offloaded to wq (on failure), it will
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  745  	// handle offloading put as well. If serverclose not offloaded,
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  746  	// we need to handle offloading put here.
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  747  	if (!serverclose_offloaded) {
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  748  		if (offload)
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  749  			queue_work(fileinfo_put_wq, &cifs_file->put);
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  750  		else
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  751  			cifsFileInfo_put_final(cifs_file);
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  752  	}
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  753  }
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  754  

:::::: The code at line 728 was first introduced by commit
:::::: 43f8a6a74ee2442b9410ed297f5d4c77e7cb5ace smb3: query attributes on file close

:::::: TO: Steve French <stfrench@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
