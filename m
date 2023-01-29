Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB228F4;
	Sun, 29 Jan 2023 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675015762; x=1706551762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w52DeAdWkbaAkgb1cR/4HVzapxxMStljzG1ZESfc/s4=;
  b=PxsXBMYn4PCftaviUdee2bxUxByqT2cxR/bQM3T1hf2FXCqGjVQxzr1Z
   3IRQm/VXGCwG/52bwYdSLas2nhvPSUjka6QebRNBfmo3AsnDyjXcHXgaJ
   QXJTc+KeVQrdvWnFSkxwqW6BKw+bJdV7mCf1F9dHvcgY3QbHGjkCn53nY
   5eCWTi+EY8wA86CH9xqANuxKlPj00Zt8qMFP1vMWuRnloKTeQCP0V2C4n
   mQyIUFExCDKU8bBVP+ub+Y+v2wWnhaWkdTp+9/H4o5y/kO96JVYu4gTIH
   HjBDN+7cHV7UCXCp8P9egHfWMelwkObpBdEfM6M496Ktu+kMZLZvbm4Fc
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307763492"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307763492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 10:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="641315293"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="641315293"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Jan 2023 10:09:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMC7C-00030E-34;
	Sun, 29 Jan 2023 18:09:18 +0000
Date: Mon, 30 Jan 2023 02:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 4/6] fs/f2fs/data.c:995:17: warning: implicit
 truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1
Message-ID: <202301300239.gneoADGa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   056e15537d6822ad8ca6fadc55ba0a9f6d23c73d
commit: f859d84b708de34ddecf8a4217f264e0ea4abc90 [4/6] f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
config: riscv-randconfig-r042-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300239.gneoADGa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?id=f859d84b708de34ddecf8a4217f264e0ea4abc90
        git remote add chao https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
        git fetch --no-tags chao dev-test
        git checkout f859d84b708de34ddecf8a4217f264e0ea4abc90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/f2fs/data.c:995:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
           fio->submitted = true;
                          ^ ~~~~
   fs/f2fs/data.c:1011:15: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
                           fio->retry = true;
                                      ^ ~~~~
   2 warnings generated.
--
>> fs/f2fs/segment.c:3350:16: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
                   fio->in_list = true;
                                ^ ~~~~
   1 warning generated.


vim +/int +995 fs/f2fs/data.c

8648de2c581eed Chao Yu           2019-02-19   961  
fe16efe6a7952f Chao Yu           2018-05-28   962  void f2fs_submit_page_write(struct f2fs_io_info *fio)
93dfe2ac516250 Jaegeuk Kim       2013-11-30   963  {
05ca3632e5a73b Jaegeuk Kim       2015-04-23   964  	struct f2fs_sb_info *sbi = fio->sbi;
458e6197c37de5 Jaegeuk Kim       2013-12-11   965  	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
a912b54d3aaa01 Jaegeuk Kim       2017-05-10   966  	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
4375a33664de17 Jaegeuk Kim       2015-04-23   967  	struct page *bio_page;
93dfe2ac516250 Jaegeuk Kim       2013-11-30   968  
b9109b0e49b93b Jaegeuk Kim       2017-05-10   969  	f2fs_bug_on(sbi, is_read_io(fio->op));
93dfe2ac516250 Jaegeuk Kim       2013-11-30   970  
e4544b63a7ee49 Tim Murray        2022-01-07   971  	f2fs_down_write(&io->io_rwsem);
fb830fc5cfc90b Chao Yu           2017-05-19   972  next:
fb830fc5cfc90b Chao Yu           2017-05-19   973  	if (fio->in_list) {
fb830fc5cfc90b Chao Yu           2017-05-19   974  		spin_lock(&io->io_lock);
fb830fc5cfc90b Chao Yu           2017-05-19   975  		if (list_empty(&io->io_list)) {
fb830fc5cfc90b Chao Yu           2017-05-19   976  			spin_unlock(&io->io_lock);
fe16efe6a7952f Chao Yu           2018-05-28   977  			goto out;
fb830fc5cfc90b Chao Yu           2017-05-19   978  		}
fb830fc5cfc90b Chao Yu           2017-05-19   979  		fio = list_first_entry(&io->io_list,
fb830fc5cfc90b Chao Yu           2017-05-19   980  						struct f2fs_io_info, list);
fb830fc5cfc90b Chao Yu           2017-05-19   981  		list_del(&fio->list);
fb830fc5cfc90b Chao Yu           2017-05-19   982  		spin_unlock(&io->io_lock);
fb830fc5cfc90b Chao Yu           2017-05-19   983  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30   984  
93770ab7a6e963 Chao Yu           2019-04-15   985  	verify_fio_blkaddr(fio);
93dfe2ac516250 Jaegeuk Kim       2013-11-30   986  
4c8ff7095bef64 Chao Yu           2019-11-01   987  	if (fio->encrypted_page)
4c8ff7095bef64 Chao Yu           2019-11-01   988  		bio_page = fio->encrypted_page;
4c8ff7095bef64 Chao Yu           2019-11-01   989  	else if (fio->compressed_page)
4c8ff7095bef64 Chao Yu           2019-11-01   990  		bio_page = fio->compressed_page;
4c8ff7095bef64 Chao Yu           2019-11-01   991  	else
4c8ff7095bef64 Chao Yu           2019-11-01   992  		bio_page = fio->page;
36951b38d13ac7 Chao Yu           2016-11-16   993  
ebf7c522fdc2ec Thomas Meyer      2017-10-07   994  	/* set submitted = true as a return value */
ebf7c522fdc2ec Thomas Meyer      2017-10-07  @995  	fio->submitted = true;
d68f735b3bc934 Jaegeuk Kim       2017-02-03   996  
36951b38d13ac7 Chao Yu           2016-11-16   997  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
36951b38d13ac7 Chao Yu           2016-11-16   998  
27aacd28ea3b89 Satya Tangirala   2020-07-02   999  	if (io->bio &&
27aacd28ea3b89 Satya Tangirala   2020-07-02  1000  	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1001  			      fio->new_blkaddr) ||
27aacd28ea3b89 Satya Tangirala   2020-07-02  1002  	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1003  				       bio_page->index, fio)))
458e6197c37de5 Jaegeuk Kim       2013-12-11  1004  		__submit_merged_bio(io);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1005  alloc_new:
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1006  	if (io->bio == NULL) {
8223ecc456d079 Chao Yu           2019-08-28  1007  		if (F2FS_IO_ALIGNED(sbi) &&
8223ecc456d079 Chao Yu           2019-08-28  1008  				(fio->type == DATA || fio->type == NODE) &&
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1009  				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1010  			dec_page_count(sbi, WB_DATA_TYPE(bio_page));
fe16efe6a7952f Chao Yu           2018-05-28  1011  			fio->retry = true;
fe16efe6a7952f Chao Yu           2018-05-28  1012  			goto skip;
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1013  		}
a8affc03a9b375 Christoph Hellwig 2021-03-11  1014  		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
27aacd28ea3b89 Satya Tangirala   2020-07-02  1015  		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1016  				       bio_page->index, fio, GFP_NOIO);
458e6197c37de5 Jaegeuk Kim       2013-12-11  1017  		io->fio = *fio;
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1018  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1019  
a912b54d3aaa01 Jaegeuk Kim       2017-05-10  1020  	if (bio_add_page(io->bio, bio_page, PAGE_SIZE, 0) < PAGE_SIZE) {
458e6197c37de5 Jaegeuk Kim       2013-12-11  1021  		__submit_merged_bio(io);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1022  		goto alloc_new;
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1023  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1024  
578c647879f74c Yufen Yu          2018-01-09  1025  	if (fio->io_wbc)
34e51a5e1a6e93 Tejun Heo         2019-06-27  1026  		wbc_account_cgroup_owner(fio->io_wbc, bio_page, PAGE_SIZE);
578c647879f74c Yufen Yu          2018-01-09  1027  
7a9d75481b85d5 Chao Yu           2016-02-22  1028  	io->last_block_in_bio = fio->new_blkaddr;
fb830fc5cfc90b Chao Yu           2017-05-19  1029  
fb830fc5cfc90b Chao Yu           2017-05-19  1030  	trace_f2fs_submit_page_write(fio->page, fio);
fe16efe6a7952f Chao Yu           2018-05-28  1031  skip:
fb830fc5cfc90b Chao Yu           2017-05-19  1032  	if (fio->in_list)
fb830fc5cfc90b Chao Yu           2017-05-19  1033  		goto next;
fe16efe6a7952f Chao Yu           2018-05-28  1034  out:
4354994f097d06 Daniel Rosenberg  2018-08-20  1035  	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
00e09c0bccc718 Chao Yu           2019-08-23  1036  				!f2fs_is_checkpoint_ready(sbi))
5ce805869cbed9 Jaegeuk Kim       2018-09-06  1037  		__submit_merged_bio(io);
e4544b63a7ee49 Tim Murray        2022-01-07  1038  	f2fs_up_write(&io->io_rwsem);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1039  }
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1040  

:::::: The code at line 995 was first introduced by commit
:::::: ebf7c522fdc2ec2fa0fc2351ef613841f79586e5 f2fs: Fix bool initialization/comparison

:::::: TO: Thomas Meyer <thomas@m3y3r.de>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
