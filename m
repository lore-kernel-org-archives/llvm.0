Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82488833;
	Wed, 28 Jun 2023 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687945072; x=1719481072;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cvtMOU/1O9rqi2IIfrrYO4kZEaXO3dW2pCOMPWUIYyM=;
  b=kQuTS83itryyJf8NOjqNHEl/JNGEbIMEO/Jxs6DLdSTIZExXjF8G+f3u
   SWy1lhEC5uyy3QjoWsrEh8lt/IQ+cMVMjcj9WJk0fSJlN0/EhLb4XJYqJ
   NIO593UYZcTicDDe9fvAJZn6bhdLw/JbYn6ra6Q3p/dbj5VBeTgZ3TeRf
   XCOgoHjRbJKgnmGLXElfeKOUHXXIOMxwDowHyhc9ln0xocepP2kiQkNZH
   EW3JwoFgP9KkTZADf+s5xbo+0exkm4x3LQoYjpECPGGWnnerjVtkG8Ivo
   VedxRiBsI3WZm8kInrSFhRDXRbsCXFO0zcv+pYdeafNXQiZ2+eNYjjT+M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341384706"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="341384706"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 02:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="786986657"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="786986657"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 02:37:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qERc6-000DAD-03;
	Wed, 28 Jun 2023 09:37:26 +0000
Date: Wed, 28 Jun 2023 17:36:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: sound/core/pcm_native.c:3037:24: warning: taking address of packed
 member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an
 unaligned pointer value
Message-ID: <202306281755.S6BtcvAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
sound/core/pcm_native.c: 3037:24: warning: taking address of packed member
 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3038:35: warning: taking address of packed member
 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3067:31: warning: taking address of packed member
 'state' of class or structure 'snd_pcm_mmap_status32' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3068:32: warning: taking address of packed member
 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3069:39: warning: taking address of packed member
 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3070:40: warning: taking address of packed member
 'tstamp_nsec' of class or structure 'snd_pcm_mmap_status32' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3071:41: warning: taking address of packed member
 'suspended_state' of class or structure 'snd_pcm_mmap_status32' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3072:45: warning: taking address of packed member
 'audio_tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/core/pcm_native.c: 3073:46: warning: taking address of packed member
 'audio_tstamp_nsec' of class or structure 'snd_pcm_mmap_status32' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
sound/soc/fsl/fsl_easrc.c: 341:19: warning: taking address of packed member
 'center_tap' of class or structure 'interp_params' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/udf/ialloc.c: 38:18: warning: taking address of packed member 'numDirs' of
 class or structure 'logicalVolIntegrityDescImpUse' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/udf/ialloc.c: 40:18: warning: taking address of packed member 'numFiles'
 of class or structure 'logicalVolIntegrityDescImpUse' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/udf/inode.c: 2031:17: warning: taking address of packed member
 'lengthAllocDescs' of class or structure 'allocExtDesc' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/sysv/super.c: 73:24: warning: taking address of packed member 's_tfree' of
 class or structure 'xenix_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 74:20: warning: taking address of packed member 's_time' of
 class or structure 'xenix_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 128:24: warning: taking address of packed member 's_tfree'
 of class or structure 'sysv2_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 129:20: warning: taking address of packed member 's_time' of
 class or structure 'sysv2_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 152:24: warning: taking address of packed member 's_tfree'
 of class or structure 'coh_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 153:20: warning: taking address of packed member 's_time' of
 class or structure 'coh_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 173:24: warning: taking address of packed member 's_tfree'
 of class or structure 'v7_super_block' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/sysv/super.c: 174:20: warning: taking address of packed member 's_time' of
 class or structure 'v7_super_block' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfsplus/xattr.c: 104:17: warning: taking address of packed member
 'free_nodes' of class or structure 'hfs_btree_header_rec' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/hfsplus/super.c: 548:17: warning: taking address of packed member
 'write_count' of class or structure 'hfsplus_vh' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
fs/exfat/file.c: 169:6: warning: taking address of packed member
 'modify_time' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/file.c: 170:6: warning: taking address of packed member
 'modify_date' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 56:5: warning: taking address of packed member
 'create_time' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 57:5: warning: taking address of packed member
 'create_date' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 61:5: warning: taking address of packed member
 'modify_time' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 62:5: warning: taking address of packed member
 'modify_date' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 66:5: warning: taking address of packed member
 'access_time' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/inode.c: 67:5: warning: taking address of packed member
 'access_date' of class or structure 'exfat_dentry::(anonymous union)::struct
 (unnamed at fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/exfat/dir.c: 459:5: warning: taking address of packed member 'create_time'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/exfat/dir.c: 460:5: warning: taking address of packed member 'create_date'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/exfat/dir.c: 464:5: warning: taking address of packed member 'modify_time'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/exfat/dir.c: 465:5: warning: taking address of packed member 'modify_date'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/exfat/dir.c: 469:5: warning: taking address of packed member 'access_time'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/exfat/dir.c: 470:5: warning: taking address of packed member 'access_date'
 of class or structure 'exfat_dentry::(anonymous union)::struct (unnamed at
 fs/exfat/exfat_raw.h:108:3)' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/ntfs/super.c: 583:42: warning: taking address of packed member 'checksum'
 of class or structure 'NTFS_BOOT_SECTOR' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/ntfs/unistr.c: 206:31: warning: taking address of packed member
 'file_name' of class or structure 'FILE_NAME_ATTR' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
fs/ntfs/namei.c: 174:17: warning: taking address of packed member 'name' of
 class or structure 'ntfs_name' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/ntfs/namei.c: 228:17: warning: taking address of packed member 'file_name'
 of class or structure 'FILE_NAME_ATTR' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/ntfs/dir.c: 144:17: warning: taking address of packed member 'file_name'
 of class or structure 'FILE_NAME_ATTR' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
fs/hfs/inode.c: 480:11: warning: taking address of packed member 'RLgLen' of
 class or structure 'hfs_cat_file' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/inode.c: 480:29: warning: taking address of packed member 'RPyLen' of
 class or structure 'hfs_cat_file' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/inode.c: 496:49: warning: taking address of packed member 'LgLen' of
 class or structure 'hfs_cat_file' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/inode.c: 496:66: warning: taking address of packed member 'PyLen' of
 class or structure 'hfs_cat_file' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/mdb.c: 224:17: warning: taking address of packed member 'drWrCnt' of
 class or structure 'hfs_mdb' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/mdb.c: 292:11: warning: taking address of packed member 'drXTFlSize'
 of class or structure 'hfs_mdb' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
fs/hfs/mdb.c: 294:11: warning: taking address of packed member 'drCTFlSize'
 of class or structure 'hfs_mdb' may result in an unaligned pointer value
 [-Waddress-of-packed-member]
drivers/pci/quirks.c: 5435:36: warning: taking address of packed member
 'ep_map' of class or structure 'ntb_info_regs' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/bus/mhi/core/init.c: 292:20: warning: taking address of packed member
 'wp' of class or structure 'mhi_event_ctxt' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/bus/mhi/core/init.c: 321:20: warning: taking address of packed member
 'wp' of class or structure 'mhi_cmd_ctxt' may result in an unaligned pointer
 value [-Waddress-of-packed-member]
drivers/bus/mhi/core/init.c: 552:23: warning: taking address of packed member
 'wp' of class or structure 'mhi_chan_ctxt' may result in an unaligned
 pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 928:16: warning: taking address of packed
 member 'NumEraseUnits' of class or structure 'NFTLMediaHeader' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 929:16: warning: taking address of packed
 member 'FirstPhysicalEUN' of class or structure 'NFTLMediaHeader' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 930:16: warning: taking address of packed
 member 'FormattedSize' of class or structure 'NFTLMediaHeader' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1038:16: warning: taking address of packed
 member 'NoOfBootImageBlocks' of class or structure 'INFTLMediaHeader' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1039:16: warning: taking address of packed
 member 'NoOfBinaryPartitions' of class or structure 'INFTLMediaHeader' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1040:16: warning: taking address of packed
 member 'NoOfBDTLPartitions' of class or structure 'INFTLMediaHeader' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1041:16: warning: taking address of packed
 member 'BlockMultiplierBits' of class or structure 'INFTLMediaHeader' may
 result in an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1042:16: warning: taking address of packed
 member 'FormatFlags' of class or structure 'INFTLMediaHeader' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1043:16: warning: taking address of packed
 member 'PercentUsed' of class or structure 'INFTLMediaHeader' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1080:17: warning: taking address of packed
 member 'virtualUnits' of class or structure 'INFTLPartition' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1081:17: warning: taking address of packed
 member 'firstUnit' of class or structure 'INFTLPartition' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1082:17: warning: taking address of packed
 member 'lastUnit' of class or structure 'INFTLPartition' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1083:17: warning: taking address of packed
 member 'flags' of class or structure 'INFTLPartition' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1084:17: warning: taking address of packed
 member 'spareUnits' of class or structure 'INFTLPartition' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/mtd/nand/raw/diskonchip.c: 1085:17: warning: taking address of packed
 member 'Reserved0' of class or structure 'INFTLPartition' may result in an
 unaligned pointer value [-Waddress-of-packed-member]

CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6aeadf7896bff4ca230702daba8788455e6b866e
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   2 years, 9 months ago
config: mips-randconfig-r033-20230627 (https://download.01.org/0day-ci/archive/20230628/202306281755.S6BtcvAT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281755.S6BtcvAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281755.S6BtcvAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/pcm_native.c:3037:24: warning: taking address of packed member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3037 |         if (get_user(sflags, &src->flags) ||
         |                               ^~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:21: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                            ^~~
>> sound/core/pcm_native.c:3037:24: warning: taking address of packed member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3037 |         if (get_user(sflags, &src->flags) ||
         |                               ^~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:48: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                                                       ^~~
>> sound/core/pcm_native.c:3037:24: warning: taking address of packed member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3037 |         if (get_user(sflags, &src->flags) ||
         |                               ^~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:303:34: note: expanded from macro '__get_user_check'
     303 |         if (likely(access_ok( __gu_ptr, size))) {               \
         |                                         ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
>> sound/core/pcm_native.c:3037:24: warning: taking address of packed member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3037 |         if (get_user(sflags, &src->flags) ||
         |                               ^~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:305:29: note: expanded from macro '__get_user_check'
     305 |                         __get_kernel_common((x), size, __gu_ptr);       \
         |                                                  ^~~~
   arch/mips/include/asm/uaccess.h:232:68: note: expanded from macro '__get_kernel_common'
     232 | #define __get_kernel_common(val, size, ptr) __get_user_common(val, size, ptr)
         |                                                                    ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3037:24: warning: taking address of packed member 'flags' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3037 |         if (get_user(sflags, &src->flags) ||
         |                               ^~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:307:27: note: expanded from macro '__get_user_check'
     307 |                         __get_user_common((x), size, __gu_ptr);         \
         |                                                ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3038:35: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3038 |             get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:21: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                            ^~~
>> sound/core/pcm_native.c:3038:35: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3038 |             get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:48: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                                                       ^~~
>> sound/core/pcm_native.c:3038:35: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3038 |             get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:303:34: note: expanded from macro '__get_user_check'
     303 |         if (likely(access_ok( __gu_ptr, size))) {               \
         |                                         ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
>> sound/core/pcm_native.c:3038:35: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3038 |             get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:305:29: note: expanded from macro '__get_user_check'
     305 |                         __get_kernel_common((x), size, __gu_ptr);       \
         |                                                  ^~~~
   arch/mips/include/asm/uaccess.h:232:68: note: expanded from macro '__get_kernel_common'
     232 | #define __get_kernel_common(val, size, ptr) __get_user_common(val, size, ptr)
         |                                                                    ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3038:35: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3038 |             get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:307:27: note: expanded from macro '__get_user_check'
     307 |                         __get_user_common((x), size, __gu_ptr);         \
         |                                                ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
   sound/core/pcm_native.c:3039:36: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3039 |             get_user(scontrol.avail_min, &src->c.control.avail_min))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:21: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                            ^~~
   sound/core/pcm_native.c:3039:36: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3039 |             get_user(scontrol.avail_min, &src->c.control.avail_min))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:25: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:300:48: note: expanded from macro '__get_user_check'
     300 |         const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);             \
         |                                                       ^~~
   sound/core/pcm_native.c:3039:36: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3039 |             get_user(scontrol.avail_min, &src->c.control.avail_min))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:303:34: note: expanded from macro '__get_user_check'
     303 |         if (likely(access_ok( __gu_ptr, size))) {               \
         |                                         ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/core/pcm_native.c:3039:36: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3039 |             get_user(scontrol.avail_min, &src->c.control.avail_min))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:305:29: note: expanded from macro '__get_user_check'
     305 |                         __get_kernel_common((x), size, __gu_ptr);       \
         |                                                  ^~~~
   arch/mips/include/asm/uaccess.h:232:68: note: expanded from macro '__get_kernel_common'
     232 | #define __get_kernel_common(val, size, ptr) __get_user_common(val, size, ptr)
         |                                                                    ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
   sound/core/pcm_native.c:3039:36: warning: taking address of packed member 'c' of class or structure 'snd_pcm_sync_ptr32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3039 |             get_user(scontrol.avail_min, &src->c.control.avail_min))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:175:40: note: expanded from macro 'get_user'
     175 |         __get_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:307:27: note: expanded from macro '__get_user_check'
     307 |                         __get_user_common((x), size, __gu_ptr);         \
         |                                                ^~~~
   arch/mips/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_common'
     275 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:15: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                      ^~~
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:42: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                                                 ^~~
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:441:15: note: expanded from macro '__put_user_check'
     441 |         __typeof__(*(ptr)) __pu_val = (x);                              \
         |                      ^~~
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:445:35: note: expanded from macro '__put_user_check'
     445 |         if (likely(access_ok( __pu_addr, size))) {      \
         |                                          ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:447:35: note: expanded from macro '__put_user_check'
     447 |                         __put_kernel_common(__pu_addr, size);           \
         |                                                        ^~~~
   arch/mips/include/asm/uaccess.h:368:63: note: expanded from macro '__put_kernel_common'
     368 | #define __put_kernel_common(ptr, size) __put_user_common(ptr, size)
         |                                                               ^~~~
   arch/mips/include/asm/uaccess.h:414:10: note: expanded from macro '__put_user_common'
     414 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3067:31: warning: taking address of packed member 'state' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3067 |         if (put_user(sstatus.state, &src->s.status.state) ||
         |                                      ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:449:33: note: expanded from macro '__put_user_check'
     449 |                         __put_user_common(__pu_addr, size);             \
         |                                                      ^~~~
   arch/mips/include/asm/uaccess.h:414:10: note: expanded from macro '__put_user_common'
     414 |         switch (size) {                                                 \
         |                 ^~~~
>> sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:15: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                      ^~~
>> sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:42: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                                                 ^~~
>> sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:441:15: note: expanded from macro '__put_user_check'
     441 |         __typeof__(*(ptr)) __pu_val = (x);                              \
         |                      ^~~
>> sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:445:35: note: expanded from macro '__put_user_check'
     445 |         if (likely(access_ok( __pu_addr, size))) {      \
         |                                          ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:447:35: note: expanded from macro '__put_user_check'
     447 |                         __put_kernel_common(__pu_addr, size);           \
         |                                                        ^~~~
   arch/mips/include/asm/uaccess.h:368:63: note: expanded from macro '__put_kernel_common'
     368 | #define __put_kernel_common(ptr, size) __put_user_common(ptr, size)
         |                                                               ^~~~
   arch/mips/include/asm/uaccess.h:414:10: note: expanded from macro '__put_user_common'
     414 |         switch (size) {                                                 \
         |                 ^~~~
   sound/core/pcm_native.c:3068:32: warning: taking address of packed member 'hw_ptr' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3068 |             put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
         |                                       ^~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:449:33: note: expanded from macro '__put_user_check'
     449 |                         __put_user_common(__pu_addr, size);             \
         |                                                      ^~~~
   arch/mips/include/asm/uaccess.h:414:10: note: expanded from macro '__put_user_common'
     414 |         switch (size) {                                                 \
         |                 ^~~~
   sound/core/pcm_native.c:3069:39: warning: taking address of packed member 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3069 |             put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:15: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                      ^~~
   sound/core/pcm_native.c:3069:39: warning: taking address of packed member 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3069 |             put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:440:42: note: expanded from macro '__put_user_check'
     440 |         __typeof__(*(ptr)) __user *__pu_addr = (ptr);                   \
         |                                                 ^~~
   sound/core/pcm_native.c:3069:39: warning: taking address of packed member 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3069 |             put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:25: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                ^~~
   arch/mips/include/asm/uaccess.h:441:15: note: expanded from macro '__put_user_check'
     441 |         __typeof__(*(ptr)) __pu_val = (x);                              \
         |                      ^~~
   sound/core/pcm_native.c:3069:39: warning: taking address of packed member 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3069 |             put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:445:35: note: expanded from macro '__put_user_check'
     445 |         if (likely(access_ok( __pu_addr, size))) {      \
         |                                          ^~~~
   arch/mips/include/asm/uaccess.h:134:30: note: expanded from macro 'access_ok'
     134 |         likely(__access_ok((addr), (size)))
         |                                     ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/core/pcm_native.c:3069:39: warning: taking address of packed member 'tstamp_sec' of class or structure 'snd_pcm_mmap_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
    3069 |             put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:154:40: note: expanded from macro 'put_user'
     154 |         __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                                               ^~~
   arch/mips/include/asm/uaccess.h:447:35: note: expanded from macro '__put_user_check'
     447 |                         __put_kernel_common(__pu_addr, size);           \
         |                                                        ^~~~
   arch/mips/include/asm/uaccess.h:368:63: note: expanded from macro '__put_kernel_common'
     368 | #define __put_kernel_common(ptr, size) __put_user_common(ptr, size)
..


vim +3037 sound/core/pcm_native.c

09d94175dbeac1 Arnd Bergmann 2018-04-24  3021  
09d94175dbeac1 Arnd Bergmann 2018-04-24  3022  static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
09d94175dbeac1 Arnd Bergmann 2018-04-24  3023  					 struct snd_pcm_sync_ptr32 __user *src)
09d94175dbeac1 Arnd Bergmann 2018-04-24  3024  {
09d94175dbeac1 Arnd Bergmann 2018-04-24  3025  	struct snd_pcm_runtime *runtime = substream->runtime;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3026  	volatile struct snd_pcm_mmap_status *status;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3027  	volatile struct snd_pcm_mmap_control *control;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3028  	u32 sflags;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3029  	struct snd_pcm_mmap_control scontrol;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3030  	struct snd_pcm_mmap_status sstatus;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3031  	snd_pcm_uframes_t boundary;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3032  	int err;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3033  
09d94175dbeac1 Arnd Bergmann 2018-04-24  3034  	if (snd_BUG_ON(!runtime))
09d94175dbeac1 Arnd Bergmann 2018-04-24  3035  		return -EINVAL;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3036  
09d94175dbeac1 Arnd Bergmann 2018-04-24 @3037  	if (get_user(sflags, &src->flags) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24 @3038  	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24  3039  	    get_user(scontrol.avail_min, &src->c.control.avail_min))
09d94175dbeac1 Arnd Bergmann 2018-04-24  3040  		return -EFAULT;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3041  	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
09d94175dbeac1 Arnd Bergmann 2018-04-24  3042  		err = snd_pcm_hwsync(substream);
09d94175dbeac1 Arnd Bergmann 2018-04-24  3043  		if (err < 0)
09d94175dbeac1 Arnd Bergmann 2018-04-24  3044  			return err;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3045  	}
09d94175dbeac1 Arnd Bergmann 2018-04-24  3046  	status = runtime->status;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3047  	control = runtime->control;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3048  	boundary = recalculate_boundary(runtime);
09d94175dbeac1 Arnd Bergmann 2018-04-24  3049  	if (! boundary)
09d94175dbeac1 Arnd Bergmann 2018-04-24  3050  		boundary = 0x7fffffff;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3051  	snd_pcm_stream_lock_irq(substream);
09d94175dbeac1 Arnd Bergmann 2018-04-24  3052  	/* FIXME: we should consider the boundary for the sync from app */
09d94175dbeac1 Arnd Bergmann 2018-04-24  3053  	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
09d94175dbeac1 Arnd Bergmann 2018-04-24  3054  		control->appl_ptr = scontrol.appl_ptr;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3055  	else
09d94175dbeac1 Arnd Bergmann 2018-04-24  3056  		scontrol.appl_ptr = control->appl_ptr % boundary;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3057  	if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
09d94175dbeac1 Arnd Bergmann 2018-04-24  3058  		control->avail_min = scontrol.avail_min;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3059  	else
09d94175dbeac1 Arnd Bergmann 2018-04-24  3060  		scontrol.avail_min = control->avail_min;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3061  	sstatus.state = status->state;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3062  	sstatus.hw_ptr = status->hw_ptr % boundary;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3063  	sstatus.tstamp = status->tstamp;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3064  	sstatus.suspended_state = status->suspended_state;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3065  	sstatus.audio_tstamp = status->audio_tstamp;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3066  	snd_pcm_stream_unlock_irq(substream);
09d94175dbeac1 Arnd Bergmann 2018-04-24 @3067  	if (put_user(sstatus.state, &src->s.status.state) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24 @3068  	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
80fe7430c70859 Arnd Bergmann 2018-04-24 @3069  	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
80fe7430c70859 Arnd Bergmann 2018-04-24 @3070  	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24 @3071  	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
80fe7430c70859 Arnd Bergmann 2018-04-24 @3072  	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
80fe7430c70859 Arnd Bergmann 2018-04-24 @3073  	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24  3074  	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
09d94175dbeac1 Arnd Bergmann 2018-04-24  3075  	    put_user(scontrol.avail_min, &src->c.control.avail_min))
09d94175dbeac1 Arnd Bergmann 2018-04-24  3076  		return -EFAULT;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3077  
09d94175dbeac1 Arnd Bergmann 2018-04-24  3078  	return 0;
09d94175dbeac1 Arnd Bergmann 2018-04-24  3079  }
80fe7430c70859 Arnd Bergmann 2018-04-24  3080  #define __SNDRV_PCM_IOCTL_SYNC_PTR32 _IOWR('A', 0x23, struct snd_pcm_sync_ptr32)
09d94175dbeac1 Arnd Bergmann 2018-04-24  3081  

:::::: The code at line 3037 was first introduced by commit
:::::: 09d94175dbeac12d38b1599a02c7000a5e51b4cb ALSA: move snd_pcm_ioctl_sync_ptr_compat into pcm_native.c

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
