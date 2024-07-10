Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B718FA02;
	Wed, 10 Jul 2024 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632101; cv=none; b=LKWfWX2o6tOOrwH08eOuh8umLfHnzTzuJX574WQbV4bG/RgQkm0l45CDugHcGXydqplPx7whq32HC4aazhSh2+lRlHLGXJisVkS5GMc8bV+odlZByvD/C+8sa6CQlw2NyP+7z4lEr6Oe3ZcXsVIbeR9qxghnxFfr0txJjIkDXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632101; c=relaxed/simple;
	bh=oUhwWEQPNhWcgFzknf4o3fQRquNb4F8adOzdJWSSiOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYVnB2ogoR5/hQY8S+mmEyhWIZsec0V9lld5Ux6Ic+b1Om6EaOBj8+NbFsuZ/Unvz6HAJbv7TEacA7cA1qrPp7w+HAS4hgymWU7SVQ3rCP29GhoDagWY9C+9oOqjGQCyWfFpYxryL9wDMM/wux/IzADUZE4Y6Dfw3gBWAeNeE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlYxPWSP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlYxPWSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720632100; x=1752168100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oUhwWEQPNhWcgFzknf4o3fQRquNb4F8adOzdJWSSiOg=;
  b=WlYxPWSPlm3rHwi/JWALL+hFEmzyLOkxMEwRUUmWqbAPKlX7KgRFtYR6
   IRzp1cmV60xvy66c7xpVywXmuz22KaO0lNAyyPNa7lOsmEkOfd2h0y1xZ
   vwJ1mnJVhvnLU/NmkkZhVU6NpuH9Z7EYkpuQ3tdOREbvj0c4+gy9FVoBv
   aJGHXa6DOwtwGOEorDURZyTDJkrZVbu2d+cYmoGdXhjZgQk4MS7B/DfHh
   E60VtgQeQ2T9T914K4I1WBzDnTQQySZrCgtiyfAi+PBJB/27O2qetj5wY
   ZSu53kK/V9VygiNjc4nKzWKZnwwdbZJjC6IwndSi/Bnq1rZKLYv6V0e/g
   Q==;
X-CSE-ConnectionGUID: cxjtvSYCT1+XuzrPc+Th+g==
X-CSE-MsgGUID: 3NtBwzhpRMahSwI66DsK5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="43398734"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="43398734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 10:21:39 -0700
X-CSE-ConnectionGUID: iatXMsSKS4qG+E7MQBp5Ww==
X-CSE-MsgGUID: PWkRxyXvTNSZuKZjfolBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53454345"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2024 10:21:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRb0Z-000Y5E-0h;
	Wed, 10 Jul 2024 17:21:35 +0000
Date: Thu, 11 Jul 2024 01:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/28] fs/smb/server/vfs.c:784:5: error: no
 member named 'delegated_inode' in 'struct renamedata'
Message-ID: <202407110152.IG26hKLV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   6f4f5017a9ee4feb212a5aa21decbeebc763340e
commit: 6f4f5017a9ee4feb212a5aa21decbeebc763340e [28/28] fs: add delegated_inode structure for handling delegation breaks
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407110152.IG26hKLV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110152.IG26hKLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110152.IG26hKLV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/smb/server/vfs.c:25:
   In file included from fs/smb/server/connection.h:10:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/smb/server/vfs.c:25:
   In file included from fs/smb/server/connection.h:10:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/smb/server/vfs.c:25:
   In file included from fs/smb/server/connection.h:10:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/smb/server/vfs.c:784:5: error: no member named 'delegated_inode' in 'struct renamedata'
     784 |         rd.delegated_inode      = NULL,
         |         ~~ ^
   17 warnings and 1 error generated.


vim +784 fs/smb/server/vfs.c

f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  682  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  683  int ksmbd_vfs_rename(struct ksmbd_work *work, const struct path *old_path,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  684  		     char *newname, int flags)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  685  {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  686  	struct dentry *old_parent, *new_dentry, *trap;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  687  	struct dentry *old_child = old_path->dentry;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  688  	struct path new_path;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  689  	struct qstr new_last;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  690  	struct renamedata rd;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  691  	struct filename *to;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  692  	struct ksmbd_share_config *share_conf = work->tcon->share_conf;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  693  	struct ksmbd_file *parent_fp;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  694  	int new_type;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  695  	int err, lookup_flags = LOOKUP_NO_SYMLINKS;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  696  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  697  	if (ksmbd_override_fsids(work))
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  698  		return -ENOMEM;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  699  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  700  	to = getname_kernel(newname);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  701  	if (IS_ERR(to)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  702  		err = PTR_ERR(to);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  703  		goto revert_fsids;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  704  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  705  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  706  retry:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  707  	err = vfs_path_parent_lookup(to, lookup_flags | LOOKUP_BENEATH,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  708  				     &new_path, &new_last, &new_type,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  709  				     &share_conf->vfs_path);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  710  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  711  		goto out1;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  712  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  713  	if (old_path->mnt != new_path.mnt) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  714  		err = -EXDEV;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  715  		goto out2;
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  716  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  717  
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  718  	err = mnt_want_write(old_path->mnt);
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  719  	if (err)
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  720  		goto out2;
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  721  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  722  	trap = lock_rename_child(old_child, new_path.dentry);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  723  	if (IS_ERR(trap)) {
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  724  		err = PTR_ERR(trap);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  725  		goto out_drop_write;
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  726  	}
4b637fc1890260 fs/cifsd/vfs.c      Namjae Jeon       2021-06-18  727  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  728  	old_parent = dget(old_child->d_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  729  	if (d_unhashed(old_child)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  730  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  731  		goto out3;
c36fca8630dda0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-30  732  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  733  
4274a9dc6aeb9f fs/smb/server/vfs.c Namjae Jeon       2023-11-20  734  	parent_fp = ksmbd_lookup_fd_inode(old_child->d_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  735  	if (parent_fp) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  736  		if (parent_fp->daccess & FILE_DELETE_LE) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  737  			pr_err("parent dir is opened with delete access\n");
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  738  			err = -ESHARE;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  739  			ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  740  			goto out3;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  741  		}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  742  		ksmbd_fd_put(work, parent_fp);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  743  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  744  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  745  	new_dentry = lookup_one_qstr_excl(&new_last, new_path.dentry,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  746  					  lookup_flags | LOOKUP_RENAME_TARGET);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  747  	if (IS_ERR(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  748  		err = PTR_ERR(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  749  		goto out3;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  750  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  751  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  752  	if (d_is_symlink(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  753  		err = -EACCES;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  754  		goto out4;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  755  	}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  756  
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  757  	/*
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  758  	 * explicitly handle file overwrite case, for compatibility with
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  759  	 * filesystems that may not support rename flags (e.g: fuse)
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  760  	 */
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  761  	if ((flags & RENAME_NOREPLACE) && d_is_positive(new_dentry)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  762  		err = -EEXIST;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  763  		goto out4;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  764  	}
4973b04d3ea577 fs/smb/server/vfs.c Marios Makassikis 2024-04-15  765  	flags &= ~(RENAME_NOREPLACE);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  766  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  767  	if (old_child == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  768  		err = -EINVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  769  		goto out4;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  770  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  771  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  772  	if (new_dentry == trap) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  773  		err = -ENOTEMPTY;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  774  		goto out4;
265fd1991c1db8 fs/ksmbd/vfs.c      Hyunchul Lee      2021-09-25  775  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  776  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  777  	rd.old_mnt_idmap	= mnt_idmap(old_path->mnt),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  778  	rd.old_dir		= d_inode(old_parent),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  779  	rd.old_dentry		= old_child,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  780  	rd.new_mnt_idmap	= mnt_idmap(new_path.mnt),
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  781  	rd.new_dir		= new_path.dentry->d_inode,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  782  	rd.new_dentry		= new_dentry,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  783  	rd.flags		= flags,
48b47f0caaa8a9 fs/smb/server/vfs.c Namjae Jeon       2023-05-12 @784  	rd.delegated_inode	= NULL,
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  785  	err = vfs_rename(&rd);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  786  	if (err)
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  787  		ksmbd_debug(VFS, "vfs_rename failed err %d\n", err);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  788  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  789  out4:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  790  	dput(new_dentry);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  791  out3:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  792  	dput(old_parent);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  793  	unlock_rename(old_parent, new_path.dentry);
a8b0026847b8c4 fs/smb/server/vfs.c Al Viro           2023-11-20  794  out_drop_write:
40b268d384a222 fs/smb/server/vfs.c Namjae Jeon       2023-06-15  795  	mnt_drop_write(old_path->mnt);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  796  out2:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  797  	path_put(&new_path);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  798  
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  799  	if (retry_estale(err, lookup_flags)) {
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  800  		lookup_flags |= LOOKUP_REVAL;
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  801  		goto retry;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  802  	}
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  803  out1:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  804  	putname(to);
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  805  revert_fsids:
74d7970febf7e9 fs/ksmbd/vfs.c      Namjae Jeon       2023-04-21  806  	ksmbd_revert_fsids(work);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  807  	return err;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  808  }
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  809  

:::::: The code at line 784 was first introduced by commit
:::::: 48b47f0caaa8a9f05ed803cb4f335fa3a7bfc622 ksmbd: fix uninitialized pointer read in ksmbd_vfs_rename()

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
