Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C71FF1DC;
	Wed, 11 Dec 2024 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733948875; cv=none; b=o1RfTqH1mLILR1ugo+BBw1biHoXMnLGYHABDJd/ZOJSw9iEsYd/gcorsOEiHhu3AHAi+/hcptZNDeWlHxCylGm9j4G2SB5dus1VP2Aqz273rwZ2DxJfzoPdZMJ1PyZxQ/GrkhKEyMB2PrXMjd0MSDUn1KRppaxWesyOoPJZhNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733948875; c=relaxed/simple;
	bh=2K4t0NLImZN31/087u5stEVTaaE1SZbJaI1qESokal0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SdNT3GBA5vAKwQeHzh+ltnxYSnZ7ypJttqIdzCMt/VauKkYjKkAzl9t209Mc7V6ju9jo0921frnxT79VyMMsZ4HW0ZXK//E1wLsLU/Pjqpa1p7BAmCCaj0PLGpsFfycYmt/hivzYyK9mXU6ADzB5hYAqQxpMGXzWRWla6TLzAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn5xjB4n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn5xjB4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733948872; x=1765484872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2K4t0NLImZN31/087u5stEVTaaE1SZbJaI1qESokal0=;
  b=nn5xjB4nPp2ugt4qKV1MC/IGlleR2vzF+IhH1PPEDR7JKrKMv6kgusUN
   zPmVxzRB6Y0CVXVnDPhojOBTs9VGhPjp4cHZ5GeWw1X5ppC2TK7mdu4HR
   UhGXO1+2TqL4W5QqJ6euSvq6m8tLPKmqaWF5Cp+K8jzwMCCHQlQRHfWqv
   HW6k4by8SU9Tr6YQ1YybiJhqOX2p9XnsrmWNqCgzS4q0v+RLoEE5XhfbT
   uG/y0OAZ9aprPx15Ll6uK1iJm3yTF2U0y4tOubx++9U5RY5yASwR6RWup
   a0ivakj4fink5mUfuKOykm6s8VpAVIWnYpWqFtcVGdiQLAExmTrDG/Hmi
   g==;
X-CSE-ConnectionGUID: J61jjTm9S32p+DlcfAvLaw==
X-CSE-MsgGUID: Jdct+Wi1T1aVAg9BAwUe+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34074200"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34074200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 12:27:50 -0800
X-CSE-ConnectionGUID: YVwkaNqKRM6qTl+MirrUlQ==
X-CSE-MsgGUID: uCpoaNwfR+yjO3wWfWQO9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96146850"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2024 12:27:49 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLTJD-00073V-0H;
	Wed, 11 Dec 2024 20:27:47 +0000
Date: Thu, 12 Dec 2024 04:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2191/3192] fs/bcachefs/str_hash.c:164:2: error:
 expected expression
Message-ID: <202412120442.nAWplWOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 2519d3b0d656d1a3106bc2c1f23c178f83570607 [2191/3192] bcachefs: bch2_str_hash_check_key() now checks inode hash info
config: hexagon-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120442.nAWplWOh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120442.nAWplWOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120442.nAWplWOh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/str_hash.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/bcachefs/str_hash.c:164:2: error: expected expression
     164 |         struct bch_inode_unpacked inode;
         |         ^
>> fs/bcachefs/str_hash.c:165:30: error: use of undeclared identifier 'inode'
     165 |         ret = bch2_inode_unpack(k, &inode);
         |                                     ^
   fs/bcachefs/str_hash.c:169:55: error: use of undeclared identifier 'inode'
     169 |         struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
         |                                                              ^
   fs/bcachefs/str_hash.c:171:40: error: use of undeclared identifier 'inode'
     171 |                 ret = repair_inode_hash_info(trans, &inode);
         |                                                      ^
   6 warnings and 4 errors generated.


vim +164 fs/bcachefs/str_hash.c

   140	
   141	/*
   142	 * All versions of the same inode in different snapshots must have the same hash
   143	 * seed/type: verify that the hash info we're using matches the root
   144	 */
   145	static int check_inode_hash_info_matches_root(struct btree_trans *trans, u64 inum,
   146						      struct bch_hash_info *hash_info)
   147	{
   148		struct bch_fs *c = trans->c;
   149		struct btree_iter iter;
   150		struct bkey_s_c k;
   151		int ret = 0;
   152	
   153		for_each_btree_key_reverse_norestart(trans, iter, BTREE_ID_inodes, SPOS(0, inum, U32_MAX),
   154						     BTREE_ITER_all_snapshots, k, ret) {
   155			if (k.k->p.offset != inum)
   156				break;
   157			if (bkey_is_inode(k.k))
   158				goto found;
   159		}
   160		bch_err(c, "%s(): inum %llu not found", __func__, inum);
   161		ret = -BCH_ERR_fsck_repair_unimplemented;
   162		goto err;
   163	found:
 > 164		struct bch_inode_unpacked inode;
 > 165		ret = bch2_inode_unpack(k, &inode);
   166		if (ret)
   167			goto err;
   168	
   169		struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
   170		if (memcmp(hash_info, &hash2, sizeof(hash2))) {
   171			ret = repair_inode_hash_info(trans, &inode);
   172			if (!ret) {
   173				bch_err(c, "inode hash info mismatch with root, but mismatch not found");
   174				ret = -BCH_ERR_fsck_repair_unimplemented;
   175			}
   176		}
   177	err:
   178		bch2_trans_iter_exit(trans, &iter);
   179		return ret;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
