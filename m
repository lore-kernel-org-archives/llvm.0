Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABB7C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654587649; x=1686123649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+WYoP6Zk3TaibE1wctiooiWrRYzinG+AW1DrGNq9DM=;
  b=SzNkBgMCaH1ddGT4+J+/o3Ub5BhCYF63qYeF/d62CIJ6tA62VQjFRKwJ
   C2Yctsv3FT2JDb/lZ4qBYnqIRbl3AmJ4JdCu/IKKz5t9+zQ7ZfY6a/1xC
   nFFt8J5nHi+k0oLBRbZtJ9JNwEDJL4mqjPjBlLx0ZW/Ksk6QEzTtT6LdK
   KIOooAvL99kez1u+FOtJQQxKxNqB3AES1Ym8A7ocwh6QvTucXkc1PbPol
   kEvzwdU7zEgLPH9io+1YObhBgyryHVCjVWde8qEe2HiixUAQQhMZo5OoX
   E5pLFIIniNWqkflrGGEGyVJAbshrt5I2WYb1KU/CgUENYFIQSGFITx3dW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="274248033"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="274248033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 00:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="636004037"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2022 00:40:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyTpW-000DTx-Aa;
	Tue, 07 Jun 2022 07:40:46 +0000
Date: Tue, 7 Jun 2022 15:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Qiu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 2/2] fs/f2fs/file.c:3908:15: error: use of
 undeclared identifier 'sbi'
Message-ID: <202206071533.vc9l1Css-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   7f7c4d65019e9c82538b92ec5df2e4f0c6765998
commit: 7f7c4d65019e9c82538b92ec5df2e4f0c6765998 [2/2] f2fs: optimize error handling in redirty_blocks
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220607/202206071533.vc9l1Css-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=7f7c4d65019e9c82538b92ec5df2e4f0c6765998
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 7f7c4d65019e9c82538b92ec5df2e4f0c6765998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/file.c:3908:15: error: use of undeclared identifier 'sbi'
                   f2fs_bug_on(sbi, !page);
                               ^
   1 error generated.


vim +/sbi +3908 fs/f2fs/file.c

  3884	
  3885	static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
  3886	{
  3887		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
  3888		struct address_space *mapping = inode->i_mapping;
  3889		struct page *page;
  3890		pgoff_t redirty_idx = page_idx;
  3891		int i, page_len = 0, ret = 0;
  3892	
  3893		page_cache_ra_unbounded(&ractl, len, 0);
  3894	
  3895		for (i = 0; i < len; i++, page_idx++) {
  3896			page = read_cache_page(mapping, page_idx, NULL, NULL);
  3897			if (IS_ERR(page)) {
  3898				ret = PTR_ERR(page);
  3899				break;
  3900			}
  3901			page_len++;
  3902		}
  3903	
  3904		for (i = 0; i < page_len; i++, redirty_idx++) {
  3905			page = find_lock_page(mapping, redirty_idx);
  3906	
  3907			/* It will never fail, when page has pinned above */
> 3908			f2fs_bug_on(sbi, !page);
  3909	
  3910			set_page_dirty(page);
  3911			f2fs_put_page(page, 1);
  3912			f2fs_put_page(page, 0);
  3913		}
  3914	
  3915		return ret;
  3916	}
  3917	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
