Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AE2E0D8;
	Thu, 15 Jun 2023 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686852227; x=1718388227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wthd2lJQRD04ZQBF8bCUhmiYws96/8vYEKhO2eW94FY=;
  b=Sce3fWfnnzIVT8WnM9gPT2sQFvN5/NuT4fBpah5V9zujtA4DvMN/kb8C
   lcG5dkAcT1Eu0qazQwKjsKs1y2rJac6OIAVdgp/bV61kHEiK0h6ttBk2R
   eDlZO/W6rNVOtsHgkizmc6kp1HzPYGN81DvSAmZF87H+qAtVAc/KbXC+y
   mB+rxefkcPyEnoP49cw9AP1clO+SMLaalxL0n9pbhwJCDbqZXTUZe6zqD
   wGDN4Ak+sgYzNTofa8WWnHa/qVgaZ9nUq3IBSpSLmPXby6JBDie3UcTvZ
   T5gPH/xrCHWF4VBQqjc37mdHVZLsnNUnqaHoB/ztboklQPnpnKlbXur7n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339339955"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="339339955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 11:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="689888484"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="689888484"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2023 11:03:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9rJu-0000FG-29;
	Thu, 15 Jun 2023 18:03:42 +0000
Date: Fri, 16 Jun 2023 02:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 995/10326] fs/ntfs3/super.c:986:12: warning:
 stack frame size (2448) exceeds limit (2048) in 'ntfs_fill_super'
Message-ID: <202306160203.DB48f7wR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: 1e61f154b03cbac048f7440efa3438073baf8a8a [995/10326] fs/ntfs3: Alternative boot if primary boot is corrupted
config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160203.DB48f7wR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1e61f154b03cbac048f7440efa3438073baf8a8a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1e61f154b03cbac048f7440efa3438073baf8a8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ fs/ mm//

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160203.DB48f7wR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/super.c:986:12: warning: stack frame size (2448) exceeds limit (2048) in 'ntfs_fill_super' [-Wframe-larger-than]
   static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
              ^
   1 warning generated.


vim +/ntfs_fill_super +986 fs/ntfs3/super.c

82cae269cfa953 Konstantin Komarov 2021-08-13   982  
e8b8e97f91b80f Kari Argillander   2021-08-03   983  /*
e8b8e97f91b80f Kari Argillander   2021-08-03   984   * ntfs_fill_super - Try to mount.
e8b8e97f91b80f Kari Argillander   2021-08-03   985   */
610f8f5a7baf99 Kari Argillander   2021-09-07  @986  static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
82cae269cfa953 Konstantin Komarov 2021-08-13   987  {
82cae269cfa953 Konstantin Komarov 2021-08-13   988  	int err;
610f8f5a7baf99 Kari Argillander   2021-09-07   989  	struct ntfs_sb_info *sbi = sb->s_fs_info;
82cae269cfa953 Konstantin Komarov 2021-08-13   990  	struct block_device *bdev = sb->s_bdev;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15   991  	struct ntfs_mount_options *options;
10b4f12c702839 Kari Argillander   2021-09-09   992  	struct inode *inode;
82cae269cfa953 Konstantin Komarov 2021-08-13   993  	struct ntfs_inode *ni;
ec5fc720137625 Konstantin Komarov 2022-10-11   994  	size_t i, tt, bad_len, bad_frags;
82cae269cfa953 Konstantin Komarov 2021-08-13   995  	CLST vcn, lcn, len;
82cae269cfa953 Konstantin Komarov 2021-08-13   996  	struct ATTRIB *attr;
82cae269cfa953 Konstantin Komarov 2021-08-13   997  	const struct VOLUME_INFO *info;
82cae269cfa953 Konstantin Komarov 2021-08-13   998  	u32 idx, done, bytes;
82cae269cfa953 Konstantin Komarov 2021-08-13   999  	struct ATTR_DEF_ENTRY *t;
82cae269cfa953 Konstantin Komarov 2021-08-13  1000  	u16 *shared;
82cae269cfa953 Konstantin Komarov 2021-08-13  1001  	struct MFT_REF ref;
1e61f154b03cba Konstantin Komarov 2023-05-08  1002  	bool ro = sb_rdonly(sb);
82cae269cfa953 Konstantin Komarov 2021-08-13  1003  
82cae269cfa953 Konstantin Komarov 2021-08-13  1004  	ref.high = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1005  
82cae269cfa953 Konstantin Komarov 2021-08-13  1006  	sbi->sb = sb;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1007  	sbi->options = options = fc->fs_private;
cd39981fb92adf Konstantin Komarov 2022-05-11  1008  	fc->fs_private = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1009  	sb->s_flags |= SB_NODIRATIME;
82cae269cfa953 Konstantin Komarov 2021-08-13  1010  	sb->s_magic = 0x7366746e; // "ntfs"
82cae269cfa953 Konstantin Komarov 2021-08-13  1011  	sb->s_op = &ntfs_sops;
82cae269cfa953 Konstantin Komarov 2021-08-13  1012  	sb->s_export_op = &ntfs_export_ops;
82cae269cfa953 Konstantin Komarov 2021-08-13  1013  	sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
82cae269cfa953 Konstantin Komarov 2021-08-13  1014  	sb->s_xattr = ntfs_xattr_handlers;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1015  	sb->s_d_op = options->nocase ? &ntfs_dentry_ops : NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1016  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1017  	options->nls = ntfs_load_nls(options->nls_name);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1018  	if (IS_ERR(options->nls)) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1019  		options->nls = NULL;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1020  		errorf(fc, "Cannot load nls %s", options->nls_name);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1021  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1022  		goto out;
610f8f5a7baf99 Kari Argillander   2021-09-07  1023  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1024  
7b47ef52d0a202 Christoph Hellwig  2022-04-15  1025  	if (bdev_max_discard_sectors(bdev) && bdev_discard_granularity(bdev)) {
7b47ef52d0a202 Christoph Hellwig  2022-04-15  1026  		sbi->discard_granularity = bdev_discard_granularity(bdev);
82cae269cfa953 Konstantin Komarov 2021-08-13  1027  		sbi->discard_granularity_mask_inv =
82cae269cfa953 Konstantin Komarov 2021-08-13  1028  			~(u64)(sbi->discard_granularity - 1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1029  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1030  
e8b8e97f91b80f Kari Argillander   2021-08-03  1031  	/* Parse boot. */
f09dac9afb8e3c Christoph Hellwig  2022-04-15  1032  	err = ntfs_init_from_boot(sb, bdev_logical_block_size(bdev),
d54f13a8e479ad Christoph Hellwig  2021-10-18  1033  				  bdev_nr_bytes(bdev));
82cae269cfa953 Konstantin Komarov 2021-08-13  1034  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1035  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1036  
82cae269cfa953 Konstantin Komarov 2021-08-13  1037  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  1038  	 * Load $Volume. This should be done before $LogFile
e8b8e97f91b80f Kari Argillander   2021-08-03  1039  	 * 'cause 'sbi->volume.ni' is used 'ntfs_set_state'.
82cae269cfa953 Konstantin Komarov 2021-08-13  1040  	 */
82cae269cfa953 Konstantin Komarov 2021-08-13  1041  	ref.low = cpu_to_le32(MFT_REC_VOL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1042  	ref.seq = cpu_to_le16(MFT_REC_VOL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1043  	inode = ntfs_iget5(sb, &ref, &NAME_VOLUME);
82cae269cfa953 Konstantin Komarov 2021-08-13  1044  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1045  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1046  		ntfs_err(sb, "Failed to load $Volume (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1047  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1048  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1049  
82cae269cfa953 Konstantin Komarov 2021-08-13  1050  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1051  
e8b8e97f91b80f Kari Argillander   2021-08-03  1052  	/* Load and save label (not necessary). */
82cae269cfa953 Konstantin Komarov 2021-08-13  1053  	attr = ni_find_attr(ni, NULL, NULL, ATTR_LABEL, NULL, 0, NULL, NULL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1054  
82cae269cfa953 Konstantin Komarov 2021-08-13  1055  	if (!attr) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1056  		/* It is ok if no ATTR_LABEL */
82cae269cfa953 Konstantin Komarov 2021-08-13  1057  	} else if (!attr->non_res && !is_attr_ext(attr)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  1058  		/* $AttrDef allows labels to be up to 128 symbols. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1059  		err = utf16s_to_utf8s(resident_data(attr),
82cae269cfa953 Konstantin Komarov 2021-08-13  1060  				      le32_to_cpu(attr->res.data_size) >> 1,
82cae269cfa953 Konstantin Komarov 2021-08-13  1061  				      UTF16_LITTLE_ENDIAN, sbi->volume.label,
82cae269cfa953 Konstantin Komarov 2021-08-13  1062  				      sizeof(sbi->volume.label));
82cae269cfa953 Konstantin Komarov 2021-08-13  1063  		if (err < 0)
82cae269cfa953 Konstantin Komarov 2021-08-13  1064  			sbi->volume.label[0] = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1065  	} else {
e8b8e97f91b80f Kari Argillander   2021-08-03  1066  		/* Should we break mounting here? */
82cae269cfa953 Konstantin Komarov 2021-08-13  1067  		//err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1068  		//goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1069  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1070  
82cae269cfa953 Konstantin Komarov 2021-08-13  1071  	attr = ni_find_attr(ni, attr, NULL, ATTR_VOL_INFO, NULL, 0, NULL, NULL);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1072  	if (!attr || is_attr_ext(attr) ||
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1073  	    !(info = resident_data_ex(attr, SIZEOF_ATTRIBUTE_VOLUME_INFO))) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1074  		ntfs_err(sb, "$Volume is corrupted.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1075  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1076  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1077  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1078  
82cae269cfa953 Konstantin Komarov 2021-08-13  1079  	sbi->volume.major_ver = info->major_ver;
82cae269cfa953 Konstantin Komarov 2021-08-13  1080  	sbi->volume.minor_ver = info->minor_ver;
82cae269cfa953 Konstantin Komarov 2021-08-13  1081  	sbi->volume.flags = info->flags;
82cae269cfa953 Konstantin Komarov 2021-08-13  1082  	sbi->volume.ni = ni;
1e61f154b03cba Konstantin Komarov 2023-05-08  1083  	if (info->flags & VOLUME_FLAG_DIRTY) {
1e61f154b03cba Konstantin Komarov 2023-05-08  1084  		sbi->volume.real_dirty = true;
1e61f154b03cba Konstantin Komarov 2023-05-08  1085  		ntfs_info(sb, "It is recommened to use chkdsk.");
1e61f154b03cba Konstantin Komarov 2023-05-08  1086  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1087  
e8b8e97f91b80f Kari Argillander   2021-08-03  1088  	/* Load $MFTMirr to estimate recs_mirr. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1089  	ref.low = cpu_to_le32(MFT_REC_MIRR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1090  	ref.seq = cpu_to_le16(MFT_REC_MIRR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1091  	inode = ntfs_iget5(sb, &ref, &NAME_MIRROR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1092  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1093  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1094  		ntfs_err(sb, "Failed to load $MFTMirr (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1095  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1096  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1097  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1098  	sbi->mft.recs_mirr = ntfs_up_cluster(sbi, inode->i_size) >>
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1099  			     sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1100  
82cae269cfa953 Konstantin Komarov 2021-08-13  1101  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1102  
d3624466b56dd5 Konstantin Komarov 2021-08-31  1103  	/* Load LogFile to replay. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1104  	ref.low = cpu_to_le32(MFT_REC_LOG);
82cae269cfa953 Konstantin Komarov 2021-08-13  1105  	ref.seq = cpu_to_le16(MFT_REC_LOG);
82cae269cfa953 Konstantin Komarov 2021-08-13  1106  	inode = ntfs_iget5(sb, &ref, &NAME_LOGFILE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1107  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1108  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1109  		ntfs_err(sb, "Failed to load \x24LogFile (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1110  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1111  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1112  
82cae269cfa953 Konstantin Komarov 2021-08-13  1113  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1114  
82cae269cfa953 Konstantin Komarov 2021-08-13  1115  	err = ntfs_loadlog_and_replay(ni, sbi);
82cae269cfa953 Konstantin Komarov 2021-08-13  1116  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1117  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1118  
82cae269cfa953 Konstantin Komarov 2021-08-13  1119  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1120  
1e61f154b03cba Konstantin Komarov 2023-05-08  1121  	if ((sbi->flags & NTFS_FLAGS_NEED_REPLAY) && !ro) {
1e61f154b03cba Konstantin Komarov 2023-05-08  1122  		ntfs_warn(sb, "failed to replay log file. Can't mount rw!");
9b75450d6c5801 Konstantin Komarov 2021-09-28  1123  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1124  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1125  	}
1e61f154b03cba Konstantin Komarov 2023-05-08  1126  
1e61f154b03cba Konstantin Komarov 2023-05-08  1127  	if ((sbi->volume.flags & VOLUME_FLAG_DIRTY) && !ro && !options->force) {
1e61f154b03cba Konstantin Komarov 2023-05-08  1128  		ntfs_warn(sb, "volume is dirty and \"force\" flag is not set!");
9b75450d6c5801 Konstantin Komarov 2021-09-28  1129  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1130  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1131  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1132  
e8b8e97f91b80f Kari Argillander   2021-08-03  1133  	/* Load $MFT. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1134  	ref.low = cpu_to_le32(MFT_REC_MFT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1135  	ref.seq = cpu_to_le16(1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1136  
82cae269cfa953 Konstantin Komarov 2021-08-13  1137  	inode = ntfs_iget5(sb, &ref, &NAME_MFT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1138  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1139  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1140  		ntfs_err(sb, "Failed to load $MFT (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1141  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1142  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1143  
82cae269cfa953 Konstantin Komarov 2021-08-13  1144  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1145  
82cae269cfa953 Konstantin Komarov 2021-08-13  1146  	sbi->mft.used = ni->i_valid >> sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1147  	tt = inode->i_size >> sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1148  	sbi->mft.next_free = MFT_REC_USER;
82cae269cfa953 Konstantin Komarov 2021-08-13  1149  
82cae269cfa953 Konstantin Komarov 2021-08-13  1150  	err = wnd_init(&sbi->mft.bitmap, sb, tt);
82cae269cfa953 Konstantin Komarov 2021-08-13  1151  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1152  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1153  
82cae269cfa953 Konstantin Komarov 2021-08-13  1154  	err = ni_load_all_mi(ni);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1155  	if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1156  		ntfs_err(sb, "Failed to load $MFT's subrecords (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1157  		goto put_inode_out;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1158  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1159  
82cae269cfa953 Konstantin Komarov 2021-08-13  1160  	sbi->mft.ni = ni;
82cae269cfa953 Konstantin Komarov 2021-08-13  1161  
e8b8e97f91b80f Kari Argillander   2021-08-03  1162  	/* Load $Bitmap. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1163  	ref.low = cpu_to_le32(MFT_REC_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1164  	ref.seq = cpu_to_le16(MFT_REC_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1165  	inode = ntfs_iget5(sb, &ref, &NAME_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1166  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1167  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1168  		ntfs_err(sb, "Failed to load $Bitmap (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1169  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1170  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1171  

:::::: The code at line 986 was first introduced by commit
:::::: 610f8f5a7baf998e70a61c63e53869b676d9b04c fs/ntfs3: Use new api for mounting

:::::: TO: Kari Argillander <kari.argillander@gmail.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
