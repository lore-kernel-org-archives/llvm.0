Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDF13FF8;
	Sun, 27 Aug 2023 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693159893; x=1724695893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZbs6KYTgreO1zAMD999DGJFvNLvBLkZsZYWJXrk9DQ=;
  b=ZDcEQ8CiA5+tOzXZKNOYLyB7QwH7OubYbF1xWqf7sYo/PrRykC63sCZq
   gMcf6qY5TJw1SrhSXv1qh8AkUkigfNqsbwTM4xuaD1gomuk0zp3/ouPae
   OULteSm96wgRFqET7nEpg4z1bn+yiLY6twdwF25iAJBqp2WN6V+C78hMx
   BkVZRhgAeHrF7aaxJ0wfSJM/PEgeTIuNM0BsKzl3T/a3tLaGhU3WZ2CGB
   LXfGGp0m1elI6GvqU82bZOjl1lEkhhNBzl6o/d1l/RS4dhWVCFCE/kact
   QtrwigyjufmVZ3nc5tvN4+//lH6hQRJI0dV5iy4PST/2AKo2wb0d5ooCj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="405956955"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="405956955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 11:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="714894001"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="714894001"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Aug 2023 11:11:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaKET-00065L-12;
	Sun, 27 Aug 2023 18:11:29 +0000
Date: Mon, 28 Aug 2023 02:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 8/13] fs/f2fs/super.c:3475:29: error: no member named
 'required_features' in 'struct f2fs_super_block'
Message-ID: <202308280145.k4jeYxJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   f706529d1298a5a8523aea0c5f1ff4fec76b07b1
commit: b155c9be2253a718240d4ae67e9df8a66c33f866 [8/13] f2fs: introduce sb.required_features to store incompatible features
config: riscv-randconfig-r021-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280145.k4jeYxJM-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280145.k4jeYxJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280145.k4jeYxJM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:14:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:14:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:14:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:14:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:14:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
   In file included from fs/f2fs/super.c:24:
   include/linux/f2fs_fs.h:153:1: error: version control conflict marker in file
   <<<<<<< HEAD
   ^
>> fs/f2fs/super.c:3475:29: error: no member named 'required_features' in 'struct f2fs_super_block'
           if (le32_to_cpu(raw_super->required_features) &
                           ~~~~~~~~~  ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   fs/f2fs/super.c:3478:29: error: no member named 'required_features' in 'struct f2fs_super_block'
                             le32_to_cpu(raw_super->required_features) ^
                                         ~~~~~~~~~  ^
   fs/f2fs/f2fs.h:2348:36: note: expanded from macro 'f2fs_info'
           f2fs_printk(sbi, KERN_INFO fmt, ##__VA_ARGS__)
                                             ^~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   13 warnings and 3 errors generated.


vim +3475 fs/f2fs/super.c

  3457	
  3458	static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
  3459					struct buffer_head *bh)
  3460	{
  3461		block_t segment_count, segs_per_sec, secs_per_zone, segment_count_main;
  3462		block_t total_sections, blocks_per_seg;
  3463		struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
  3464						(bh->b_data + F2FS_SUPER_OFFSET);
  3465		size_t crc_offset = 0;
  3466		__u32 crc = 0;
  3467	
  3468		if (le32_to_cpu(raw_super->magic) != F2FS_SUPER_MAGIC) {
  3469			f2fs_info(sbi, "Magic Mismatch, valid(0x%x) - read(0x%x)",
  3470				  F2FS_SUPER_MAGIC, le32_to_cpu(raw_super->magic));
  3471			return -EINVAL;
  3472		}
  3473	
  3474		/* check whether current kernel supports all features on image */
> 3475		if (le32_to_cpu(raw_super->required_features) &
  3476				~F2FS_INCOMPAT_FEATURES) {
  3477			f2fs_info(sbi, "Unsupported feature: %x: supported: %x",
  3478				  le32_to_cpu(raw_super->required_features) ^
  3479				  F2FS_INCOMPAT_FEATURES,
  3480				  F2FS_INCOMPAT_FEATURES);
  3481			return -EINVAL;
  3482		}
  3483	
  3484		/* Check checksum_offset and crc in superblock */
  3485		if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
  3486			crc_offset = le32_to_cpu(raw_super->checksum_offset);
  3487			if (crc_offset !=
  3488				offsetof(struct f2fs_super_block, crc)) {
  3489				f2fs_info(sbi, "Invalid SB checksum offset: %zu",
  3490					  crc_offset);
  3491				return -EFSCORRUPTED;
  3492			}
  3493			crc = le32_to_cpu(raw_super->crc);
  3494			if (!f2fs_crc_valid(sbi, crc, raw_super, crc_offset)) {
  3495				f2fs_info(sbi, "Invalid SB checksum value: %u", crc);
  3496				return -EFSCORRUPTED;
  3497			}
  3498		}
  3499	
  3500		/* Currently, support only 4KB block size */
  3501		if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
  3502			f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
  3503				  le32_to_cpu(raw_super->log_blocksize),
  3504				  F2FS_BLKSIZE_BITS);
  3505			return -EFSCORRUPTED;
  3506		}
  3507	
  3508		/* check log blocks per segment */
  3509		if (le32_to_cpu(raw_super->log_blocks_per_seg) != 9) {
  3510			f2fs_info(sbi, "Invalid log blocks per segment (%u)",
  3511				  le32_to_cpu(raw_super->log_blocks_per_seg));
  3512			return -EFSCORRUPTED;
  3513		}
  3514	
  3515		/* Currently, support 512/1024/2048/4096 bytes sector size */
  3516		if (le32_to_cpu(raw_super->log_sectorsize) >
  3517					F2FS_MAX_LOG_SECTOR_SIZE ||
  3518			le32_to_cpu(raw_super->log_sectorsize) <
  3519					F2FS_MIN_LOG_SECTOR_SIZE) {
  3520			f2fs_info(sbi, "Invalid log sectorsize (%u)",
  3521				  le32_to_cpu(raw_super->log_sectorsize));
  3522			return -EFSCORRUPTED;
  3523		}
  3524		if (le32_to_cpu(raw_super->log_sectors_per_block) +
  3525			le32_to_cpu(raw_super->log_sectorsize) !=
  3526				F2FS_MAX_LOG_SECTOR_SIZE) {
  3527			f2fs_info(sbi, "Invalid log sectors per block(%u) log sectorsize(%u)",
  3528				  le32_to_cpu(raw_super->log_sectors_per_block),
  3529				  le32_to_cpu(raw_super->log_sectorsize));
  3530			return -EFSCORRUPTED;
  3531		}
  3532	
  3533		segment_count = le32_to_cpu(raw_super->segment_count);
  3534		segment_count_main = le32_to_cpu(raw_super->segment_count_main);
  3535		segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
  3536		secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
  3537		total_sections = le32_to_cpu(raw_super->section_count);
  3538	
  3539		/* blocks_per_seg should be 512, given the above check */
  3540		blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
  3541	
  3542		if (segment_count > F2FS_MAX_SEGMENT ||
  3543					segment_count < F2FS_MIN_SEGMENTS) {
  3544			f2fs_info(sbi, "Invalid segment count (%u)", segment_count);
  3545			return -EFSCORRUPTED;
  3546		}
  3547	
  3548		if (total_sections > segment_count_main || total_sections < 1 ||
  3549				segs_per_sec > segment_count || !segs_per_sec) {
  3550			f2fs_info(sbi, "Invalid segment/section count (%u, %u x %u)",
  3551				  segment_count, total_sections, segs_per_sec);
  3552			return -EFSCORRUPTED;
  3553		}
  3554	
  3555		if (segment_count_main != total_sections * segs_per_sec) {
  3556			f2fs_info(sbi, "Invalid segment/section count (%u != %u * %u)",
  3557				  segment_count_main, total_sections, segs_per_sec);
  3558			return -EFSCORRUPTED;
  3559		}
  3560	
  3561		if ((segment_count / segs_per_sec) < total_sections) {
  3562			f2fs_info(sbi, "Small segment_count (%u < %u * %u)",
  3563				  segment_count, segs_per_sec, total_sections);
  3564			return -EFSCORRUPTED;
  3565		}
  3566	
  3567		if (segment_count > (le64_to_cpu(raw_super->block_count) >> 9)) {
  3568			f2fs_info(sbi, "Wrong segment_count / block_count (%u > %llu)",
  3569				  segment_count, le64_to_cpu(raw_super->block_count));
  3570			return -EFSCORRUPTED;
  3571		}
  3572	
  3573		if (RDEV(0).path[0]) {
  3574			block_t dev_seg_count = le32_to_cpu(RDEV(0).total_segments);
  3575			int i = 1;
  3576	
  3577			while (i < MAX_DEVICES && RDEV(i).path[0]) {
  3578				dev_seg_count += le32_to_cpu(RDEV(i).total_segments);
  3579				i++;
  3580			}
  3581			if (segment_count != dev_seg_count) {
  3582				f2fs_info(sbi, "Segment count (%u) mismatch with total segments from devices (%u)",
  3583						segment_count, dev_seg_count);
  3584				return -EFSCORRUPTED;
  3585			}
  3586		} else {
  3587			if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_BLKZONED) &&
  3588						!bdev_is_zoned(sbi->sb->s_bdev)) {
  3589				f2fs_info(sbi, "Zoned block device path is missing");
  3590				return -EFSCORRUPTED;
  3591			}
  3592		}
  3593	
  3594		if (secs_per_zone > total_sections || !secs_per_zone) {
  3595			f2fs_info(sbi, "Wrong secs_per_zone / total_sections (%u, %u)",
  3596				  secs_per_zone, total_sections);
  3597			return -EFSCORRUPTED;
  3598		}
  3599		if (le32_to_cpu(raw_super->extension_count) > F2FS_MAX_EXTENSION ||
  3600				raw_super->hot_ext_count > F2FS_MAX_EXTENSION ||
  3601				(le32_to_cpu(raw_super->extension_count) +
  3602				raw_super->hot_ext_count) > F2FS_MAX_EXTENSION) {
  3603			f2fs_info(sbi, "Corrupted extension count (%u + %u > %u)",
  3604				  le32_to_cpu(raw_super->extension_count),
  3605				  raw_super->hot_ext_count,
  3606				  F2FS_MAX_EXTENSION);
  3607			return -EFSCORRUPTED;
  3608		}
  3609	
  3610		if (le32_to_cpu(raw_super->cp_payload) >=
  3611					(blocks_per_seg - F2FS_CP_PACKS -
  3612					NR_CURSEG_PERSIST_TYPE)) {
  3613			f2fs_info(sbi, "Insane cp_payload (%u >= %u)",
  3614				  le32_to_cpu(raw_super->cp_payload),
  3615				  blocks_per_seg - F2FS_CP_PACKS -
  3616				  NR_CURSEG_PERSIST_TYPE);
  3617			return -EFSCORRUPTED;
  3618		}
  3619	
  3620		/* check reserved ino info */
  3621		if (le32_to_cpu(raw_super->node_ino) != 1 ||
  3622			le32_to_cpu(raw_super->meta_ino) != 2 ||
  3623			le32_to_cpu(raw_super->root_ino) != 3) {
  3624			f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
  3625				  le32_to_cpu(raw_super->node_ino),
  3626				  le32_to_cpu(raw_super->meta_ino),
  3627				  le32_to_cpu(raw_super->root_ino));
  3628			return -EFSCORRUPTED;
  3629		}
  3630	
  3631		/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
  3632		if (sanity_check_area_boundary(sbi, bh))
  3633			return -EFSCORRUPTED;
  3634	
  3635		return 0;
  3636	}
  3637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
