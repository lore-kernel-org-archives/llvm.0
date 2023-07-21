Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B923BD7;
	Fri, 21 Jul 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689970883; x=1721506883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWojE98H1I9f9gcE175SUdH7BVpUMfjtBO7smRSiHV0=;
  b=Lk5jfTyXvVKaoeGXg3RSBRo6MwPXJWSlNSAgqonG0r/V616y/t4Fxl+S
   pUC+86UfMb1sSvOT+tgeOBnxKF/sX+WdO0M5poECk7IDg1WrDJPaM0gtk
   pa3h4JRE/EEsLjWrn3jqze0q6M0/AydVhZyfqS8P1anphIsa1M2GKAmyf
   kFwL+dWGZ27uZ4QHe//1kZWY5TUbcwebWR7Y243SbBONk84hr2+ZqKFc6
   EXGIY7anREV8qngRP4g5m4oPmngt0hVnRv0lIAtkEGMt2rfFbJI3Kdotx
   a7AFirnrdcGxO4r5nTXgqZ14YnOdyeaUwTgUYcYVnue4Ck/GsvUpT5mnU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351996893"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="351996893"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724986527"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="724986527"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 13:21:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwcn-0007dE-2o;
	Fri, 21 Jul 2023 20:21:17 +0000
Date: Sat, 22 Jul 2023 04:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [linux-stable-rc:linux-4.19.y 6515/6544] fs/ext4/ioctl.c:583:7:
 error: incompatible pointer to integer conversion assigning to 'int' from
 'struct super_block *'
Message-ID: <202307220431.IDq5qWzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
head:   71e850d72cc54c75316c30f51b1163a0da4f00e1
commit: c1a588a876df1ca461ee0bc432e78ed7f646ca86 [6515/6544] ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230722/202307220431.IDq5qWzF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220431.IDq5qWzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220431.IDq5qWzF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext4/ioctl.c:583:7: error: incompatible pointer to integer conversion assigning to 'int' from 'struct super_block *' [-Wint-conversion]
                   ret = freeze_bdev(sb->s_bdev);
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +583 fs/ext4/ioctl.c

   559	
   560	static int ext4_shutdown(struct super_block *sb, unsigned long arg)
   561	{
   562		struct ext4_sb_info *sbi = EXT4_SB(sb);
   563		__u32 flags;
   564		int ret;
   565	
   566		if (!capable(CAP_SYS_ADMIN))
   567			return -EPERM;
   568	
   569		if (get_user(flags, (__u32 __user *)arg))
   570			return -EFAULT;
   571	
   572		if (flags > EXT4_GOING_FLAGS_NOLOGFLUSH)
   573			return -EINVAL;
   574	
   575		if (ext4_forced_shutdown(sbi))
   576			return 0;
   577	
   578		ext4_msg(sb, KERN_ALERT, "shut down requested (%d)", flags);
   579		trace_ext4_shutdown(sb, flags);
   580	
   581		switch (flags) {
   582		case EXT4_GOING_FLAGS_DEFAULT:
 > 583			ret = freeze_bdev(sb->s_bdev);
   584			if (ret)
   585				return ret;
   586			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   587			thaw_bdev(sb->s_bdev, sb);
   588			break;
   589		case EXT4_GOING_FLAGS_LOGFLUSH:
   590			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   591			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal)) {
   592				(void) ext4_force_commit(sb);
   593				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   594			}
   595			break;
   596		case EXT4_GOING_FLAGS_NOLOGFLUSH:
   597			set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
   598			if (sbi->s_journal && !is_journal_aborted(sbi->s_journal))
   599				jbd2_journal_abort(sbi->s_journal, -ESHUTDOWN);
   600			break;
   601		default:
   602			return -EINVAL;
   603		}
   604		clear_opt(sb, DISCARD);
   605		return 0;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
