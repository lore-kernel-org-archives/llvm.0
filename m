Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88907FA
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661168630; x=1692704630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tt7xYuyVZ5OryjdpetomIsUm0dcKP7f20CLjm3NMmWs=;
  b=UiRmM0DtSeCSZSXaCqOfpJwh1iCFB54A12tbjTdy1tBEnf5OX02QFoIS
   aSaR6CsIBTyUeE8fsRAl7GagfQdxRxNjdtcBXwCSTFV/FSWEMONre1JXz
   JvjFt1auwdMWfLXzdDz+7bMsw8sUEbhYRg/0IL7v2LzuZBPIkRW2xWWTB
   DHd0UrpuTyEZ2/dS5Gl99/b6v+NOdlqzPoQSQLtSi4KkF9eDW5MQCMNZn
   QFbJ9m35Ps0MlUaLeiiRLyHGF/+viimVCXpcNIfEcAM0dVOUMdA60jwV4
   Kr+LoguXC7rqIqCgnhQT8AXkCTI7uZomPyIowJ3QpspNfp2YzCgQghShC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="276421273"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="276421273"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 04:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="937007235"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 04:43:48 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQ5qO-0005IV-0C;
	Mon, 22 Aug 2022 11:43:48 +0000
Date: Mon, 22 Aug 2022 19:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yue Hu <zbestahu@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] erofs: add on-disk compressed fragments support
Message-ID: <202208221956.uRQu5Di8-lkp@intel.com>
References: <b087322de2adfd8ce39a5d380191562b0b0e0086.1661146058.git.huyue2@coolpad.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b087322de2adfd8ce39a5d380191562b0b0e0086.1661146058.git.huyue2@coolpad.com>

Hi Yue,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on linus/master v6.0-rc2 next-20220822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yue-Hu/erofs-support-compressed-fragments-data/20220822-135454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
config: i386-randconfig-a003-20220822 (https://download.01.org/0day-ci/archive/20220822/202208221956.uRQu5Di8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fcee3af7935e7bb4544090297b4260c00fe2f9c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yue-Hu/erofs-support-compressed-fragments-data/20220822-135454
        git checkout fcee3af7935e7bb4544090297b4260c00fe2f9c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/erofs/super.c:384:7: error: no member named 'packed_inode' in 'struct erofs_sb_info'
           sbi->packed_inode = erofs_sb_has_fragments(sbi) ?
           ~~~  ^
   1 error generated.


vim +384 fs/erofs/super.c

   327	
   328	static int erofs_read_superblock(struct super_block *sb)
   329	{
   330		struct erofs_sb_info *sbi;
   331		struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
   332		struct erofs_super_block *dsb;
   333		unsigned int blkszbits;
   334		void *data;
   335		int ret;
   336	
   337		data = erofs_read_metabuf(&buf, sb, 0, EROFS_KMAP);
   338		if (IS_ERR(data)) {
   339			erofs_err(sb, "cannot read erofs superblock");
   340			return PTR_ERR(data);
   341		}
   342	
   343		sbi = EROFS_SB(sb);
   344		dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
   345	
   346		ret = -EINVAL;
   347		if (le32_to_cpu(dsb->magic) != EROFS_SUPER_MAGIC_V1) {
   348			erofs_err(sb, "cannot find valid erofs superblock");
   349			goto out;
   350		}
   351	
   352		sbi->feature_compat = le32_to_cpu(dsb->feature_compat);
   353		if (erofs_sb_has_sb_chksum(sbi)) {
   354			ret = erofs_superblock_csum_verify(sb, data);
   355			if (ret)
   356				goto out;
   357		}
   358	
   359		ret = -EINVAL;
   360		blkszbits = dsb->blkszbits;
   361		/* 9(512 bytes) + LOG_SECTORS_PER_BLOCK == LOG_BLOCK_SIZE */
   362		if (blkszbits != LOG_BLOCK_SIZE) {
   363			erofs_err(sb, "blkszbits %u isn't supported on this platform",
   364				  blkszbits);
   365			goto out;
   366		}
   367	
   368		if (!check_layout_compatibility(sb, dsb))
   369			goto out;
   370	
   371		sbi->sb_size = 128 + dsb->sb_extslots * EROFS_SB_EXTSLOT_SIZE;
   372		if (sbi->sb_size > EROFS_BLKSIZ) {
   373			erofs_err(sb, "invalid sb_extslots %u (more than a fs block)",
   374				  sbi->sb_size);
   375			goto out;
   376		}
   377		sbi->primarydevice_blocks = le32_to_cpu(dsb->blocks);
   378		sbi->meta_blkaddr = le32_to_cpu(dsb->meta_blkaddr);
   379	#ifdef CONFIG_EROFS_FS_XATTR
   380		sbi->xattr_blkaddr = le32_to_cpu(dsb->xattr_blkaddr);
   381	#endif
   382		sbi->islotbits = ilog2(sizeof(struct erofs_inode_compact));
   383		sbi->root_nid = le16_to_cpu(dsb->root_nid);
 > 384		sbi->packed_inode = erofs_sb_has_fragments(sbi) ?
   385			erofs_iget(sb, le64_to_cpu(dsb->packed_nid), false) : NULL;
   386		sbi->inos = le64_to_cpu(dsb->inos);
   387	
   388		sbi->build_time = le64_to_cpu(dsb->build_time);
   389		sbi->build_time_nsec = le32_to_cpu(dsb->build_time_nsec);
   390	
   391		memcpy(&sb->s_uuid, dsb->uuid, sizeof(dsb->uuid));
   392	
   393		ret = strscpy(sbi->volume_name, dsb->volume_name,
   394			      sizeof(dsb->volume_name));
   395		if (ret < 0) {	/* -E2BIG */
   396			erofs_err(sb, "bad volume name without NIL terminator");
   397			ret = -EFSCORRUPTED;
   398			goto out;
   399		}
   400	
   401		/* parse on-disk compression configurations */
   402		if (erofs_sb_has_compr_cfgs(sbi))
   403			ret = erofs_load_compr_cfgs(sb, dsb);
   404		else
   405			ret = z_erofs_load_lz4_config(sb, dsb, NULL, 0);
   406		if (ret < 0)
   407			goto out;
   408	
   409		/* handle multiple devices */
   410		ret = erofs_scan_devices(sb, dsb);
   411	
   412		if (erofs_sb_has_ztailpacking(sbi))
   413			erofs_info(sb, "EXPERIMENTAL compressed inline data feature in use. Use at your own risk!");
   414		if (erofs_is_fscache_mode(sb))
   415			erofs_info(sb, "EXPERIMENTAL fscache-based on-demand read feature in use. Use at your own risk!");
   416		if (erofs_sb_has_fragments(sbi))
   417			erofs_info(sb, "EXPERIMENTAL compressed fragments feature in use. Use at your own risk!");
   418	out:
   419		erofs_put_metabuf(&buf);
   420		return ret;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
