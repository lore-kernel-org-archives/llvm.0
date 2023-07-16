Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C188F71;
	Sun, 16 Jul 2023 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689537572; x=1721073572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8FXXez/AxaxRnKEEIW+GEaYPuOSHsuNDKE7ecCS+lw=;
  b=WluGMyjganc4McXMPfZP0QGVUZXx0XRnU3F4MFSQP3V6SIWvxuu6wVLb
   mb2IfAvGTMQlm2SrU3r0VsSgdbLPanLAPErb3+5JFJtB2fICmKaBqLOxo
   puoWDlyGLUrLEBDdZUXUHss+z5y96Sv+9/4DVEVOmyWFJ/jaRlPR1ddy5
   IaaAtJDChOmCfR+gJ+A5NRRPvnW8nDx0aWpl6RKJq1iFqouQQRCf+CFP9
   7xX8nEx5en9oMe6zUTWCO7PRufIf+JrdypPUV2R6n77ltJro7f5q1A1WX
   UZnAjuHE5QJ6wPyEXPxskbyg+OGqxQ++2aWJ9Bahq97/aO5cNQGtYOfgp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="396611953"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="396611953"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 12:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="758192881"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="758192881"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2023 12:59:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL7tx-0008yq-0Q;
	Sun, 16 Jul 2023 19:59:29 +0000
Date: Mon, 17 Jul 2023 03:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/smb/server/vfs.c:113:41:
 error: use of undeclared identifier 'KSMBD_SHARE_FLAG_CROSSMNT'
Message-ID: <202307170312.GpAReBVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   ad297d25edb98d80a162f7ab8280ffbc025e8ebf
commit: ad297d25edb98d80a162f7ab8280ffbc025e8ebf [2/2] ksmbd: check if a mount point is crossed during path lookup
config: hexagon-randconfig-r041-20230717 (https://download.01.org/0day-ci/archive/20230717/202307170312.GpAReBVJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170312.GpAReBVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170312.GpAReBVJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/server/vfs.c:11:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/smb/server/vfs.c:11:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/smb/server/vfs.c:11:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/smb/server/vfs.c:113:41: error: use of undeclared identifier 'KSMBD_SHARE_FLAG_CROSSMNT'
     113 |         if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT)) {
         |                                                ^
   6 warnings and 1 error generated.


vim +/KSMBD_SHARE_FLAG_CROSSMNT +113 fs/smb/server/vfs.c

    63	
    64	static int ksmbd_vfs_path_lookup_locked(struct ksmbd_share_config *share_conf,
    65						char *pathname, unsigned int flags,
    66						struct path *parent_path,
    67						struct path *path)
    68	{
    69		struct qstr last;
    70		struct filename *filename;
    71		struct path *root_share_path = &share_conf->vfs_path;
    72		int err, type;
    73		struct dentry *d;
    74	
    75		if (pathname[0] == '\0') {
    76			pathname = share_conf->path;
    77			root_share_path = NULL;
    78		} else {
    79			flags |= LOOKUP_BENEATH;
    80		}
    81	
    82		filename = getname_kernel(pathname);
    83		if (IS_ERR(filename))
    84			return PTR_ERR(filename);
    85	
    86		err = vfs_path_parent_lookup(filename, flags,
    87					     parent_path, &last, &type,
    88					     root_share_path);
    89		if (err) {
    90			putname(filename);
    91			return err;
    92		}
    93	
    94		if (unlikely(type != LAST_NORM)) {
    95			path_put(parent_path);
    96			putname(filename);
    97			return -ENOENT;
    98		}
    99	
   100		inode_lock_nested(parent_path->dentry->d_inode, I_MUTEX_PARENT);
   101		d = lookup_one_qstr_excl(&last, parent_path->dentry, 0);
   102		if (IS_ERR(d))
   103			goto err_out;
   104	
   105		if (d_is_negative(d)) {
   106			dput(d);
   107			goto err_out;
   108		}
   109	
   110		path->dentry = d;
   111		path->mnt = mntget(parent_path->mnt);
   112	
 > 113		if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_CROSSMNT)) {
   114			err = follow_down(path, 0);
   115			if (err < 0) {
   116				path_put(path);
   117				goto err_out;
   118			}
   119		}
   120	
   121		putname(filename);
   122		return 0;
   123	
   124	err_out:
   125		inode_unlock(d_inode(parent_path->dentry));
   126		path_put(parent_path);
   127		putname(filename);
   128		return -ENOENT;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
