Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DD6144D3F;
	Fri,  5 Jul 2024 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720199312; cv=none; b=kuTEdwzcB689wXID16uJtn06rulHj3m70s/eIvn9v4xKnvb8peyzphb4goomk1ywwZ5wJfiqiLgUBeXVT3MDaiMbGGBiq9B54QBTzpALrbs/QJbbp5d6NVnSYkJGfYcmKNJw9WPm5RkfFOo7b8ZesoL9lCz0EjhDvWvNbegmBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720199312; c=relaxed/simple;
	bh=uUk/idKt0cGyFPUqPdofkquSWwrCUQtkgDLJYBGqPng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQTLn4TD6BBmuIyh/8ziQESNJroP/e/a+X+Jae0XVMq/AJx84KZOwUiDaqxbth0MP++ggzPh9efSBNjA71SbM+1seLzCg8fkzlXYCKwfhGVCzJiKNeO4q0/LTRZ6/lzTl++CeJGMUO/URAa7uQfqjXAl6sXmB/BMPQGKpTXkx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iw9vaE/Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iw9vaE/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720199310; x=1751735310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUk/idKt0cGyFPUqPdofkquSWwrCUQtkgDLJYBGqPng=;
  b=Iw9vaE/Q6tBBPkQF8U4yPvz9dtogIdiblYddFBnO7g6v45P6OnM0JYq8
   fKFdoDnSeq4KrzqnDRGksnogeo5gksiQYhPxrtQSM0pLNHIC+gPDZUy+D
   cgjsUQWCeGevUOgluagRkvn+wS8s2BHc+MiVQkwQLmuCG/2iJG7rEJHfp
   1V3H0akmzhkJ1UWzVPQhCOsZPe2Tbii42AdKBg2E5ulAgAUjnAioNAhg4
   6WYufY3aDxL6SYiHV/1wIptYiMmv35qSDkMJTI9Ag5RDvmXVysf/RStJW
   7s9hKuOYBKOJkMHsoerfr8SXahjYIewHoD0dycpOURAeltI1f/FlOgqey
   w==;
X-CSE-ConnectionGUID: LUpzRq7SQUOG+wutRqRf2w==
X-CSE-MsgGUID: i9uxTw+4RWupGi7IjJy+EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28651476"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="28651476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 10:08:29 -0700
X-CSE-ConnectionGUID: 4328m6b5RNawer3LcavZcQ==
X-CSE-MsgGUID: X8Oh5qnEQhC/K6UjPifrig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="51521163"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2024 10:08:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPmQ5-000SeK-0F;
	Fri, 05 Jul 2024 17:08:25 +0000
Date: Sat, 6 Jul 2024 01:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@sandeen.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sandeen:f2fs-mount-api 11/11] fs/f2fs/super.c:1027:8: warning:
 variable 'arg' is used uninitialized whenever '&&' condition is false
Message-ID: <202407060106.8GhAKDBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git f2fs-mount-api
head:   bf51728fb8134742e7da61ecff42fd585d05f264
commit: bf51728fb8134742e7da61ecff42fd585d05f264 [11/11] patch f2fs_convert_new_mount_api
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240706/202407060106.8GhAKDBA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060106.8GhAKDBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060106.8GhAKDBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/super.c:772:8: warning: unused variable 'name' [-Wunused-variable]
     772 |         char *name;
         |               ^~~~
>> fs/f2fs/super.c:1027:8: warning: variable 'arg' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    1027 |                         if (args->from && match_int(args, &arg))
         |                             ^~~~~~~~~~
   fs/f2fs/super.c:1029:8: note: uninitialized use occurs here
    1029 |                         if (arg < 0 || arg > 100)
         |                             ^~~
   fs/f2fs/super.c:1027:8: note: remove the '&&' if its condition is always true
    1027 |                         if (args->from && match_int(args, &arg))
         |                             ^~~~~~~~~~~~~
   fs/f2fs/super.c:775:26: note: initialize the variable 'arg' to silence this warning
     775 |         int opt, ret, token, arg;
         |                                 ^
         |                                  = 0
   2 warnings generated.


vim +1027 fs/f2fs/super.c

3fde13f817e23f Chao Yu          2021-01-22   760  
bf51728fb81347 Eric Sandeen     2024-07-04   761  static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
696c018c7718f5 Namjae Jeon      2013-06-16   762  {
bf51728fb81347 Eric Sandeen     2024-07-04   763  	struct f2fs_sb_info *sbi = fc->s_fs_info;
bf51728fb81347 Eric Sandeen     2024-07-04   764  	struct fs_parse_result result;
bf51728fb81347 Eric Sandeen     2024-07-04   765  	bool is_remount = (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE);
696c018c7718f5 Namjae Jeon      2013-06-16   766  	substring_t args[MAX_OPT_ARGS];
1f0b067b6e4927 Chao Yu          2020-07-29   767  #ifdef CONFIG_F2FS_FS_COMPRESSION
4c8ff7095bef64 Chao Yu          2019-11-01   768  	unsigned char (*ext)[F2FS_EXTENSION_LEN];
151b1982be5d9f Fengnan Chang    2021-06-08   769  	unsigned char (*noext)[F2FS_EXTENSION_LEN];
151b1982be5d9f Fengnan Chang    2021-06-08   770  	int ext_cnt, noext_cnt;
1f0b067b6e4927 Chao Yu          2020-07-29   771  #endif
bf51728fb81347 Eric Sandeen     2024-07-04   772  	char *name;
7c2e59632b846a Jaegeuk Kim      2018-01-04   773  	kuid_t uid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   774  	kgid_t gid;
bf51728fb81347 Eric Sandeen     2024-07-04   775  	int opt, ret, token, arg;
5f029c045c948b Yi Zhuang        2021-04-06   776  
bf51728fb81347 Eric Sandeen     2024-07-04   777  	opt = fs_parse(fc, f2fs_fs_parameters, param, &result);
bf51728fb81347 Eric Sandeen     2024-07-04   778  	if (opt < 0)
bf51728fb81347 Eric Sandeen     2024-07-04   779  		return opt;
696c018c7718f5 Namjae Jeon      2013-06-16   780  
bf51728fb81347 Eric Sandeen     2024-07-04   781  	switch (opt) {
696c018c7718f5 Namjae Jeon      2013-06-16   782  	case Opt_gc_background:
bf51728fb81347 Eric Sandeen     2024-07-04   783  		F2FS_OPTION(sbi).bggc_mode = result.uint_32;
696c018c7718f5 Namjae Jeon      2013-06-16   784  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   785  	case Opt_disable_roll_forward:
696c018c7718f5 Namjae Jeon      2013-06-16   786  		set_opt(sbi, DISABLE_ROLL_FORWARD);
696c018c7718f5 Namjae Jeon      2013-06-16   787  		break;
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23   788  	case Opt_norecovery:
eedc63ff501ca0 Eric Sandeen     2024-07-04   789  		/* this option mounts f2fs with ro, check in fill_super */
a9117eca1de6b7 Chao Yu          2020-02-14   790  		set_opt(sbi, NORECOVERY);
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23   791  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   792  	case Opt_discard:
bf51728fb81347 Eric Sandeen     2024-07-04   793  		if (result.negated)
64058be9c8e357 Chao Yu          2016-07-03   794  			clear_opt(sbi, DISCARD);
bf51728fb81347 Eric Sandeen     2024-07-04   795  		else
bf51728fb81347 Eric Sandeen     2024-07-04   796  			set_opt(sbi, DISCARD);
d77329745f0266 Eric Sandeen     2024-07-04   797  		F2FS_OPTION(sbi).user_set_discard = true;
487df616dec332 Damien Le Moal   2016-10-28   798  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   799  	case Opt_noheap:
7a20b8a61eff81 Jaegeuk Kim      2017-03-24   800  	case Opt_heap:
4e0197f9932f70 Jaegeuk Kim      2024-02-20   801  		f2fs_warn(sbi, "heap/no_heap options were deprecated");
7a20b8a61eff81 Jaegeuk Kim      2017-03-24   802  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   803  #ifdef CONFIG_F2FS_FS_XATTR
4058c5117d6d8a Kelly Anderson   2013-10-07   804  	case Opt_user_xattr:
bf51728fb81347 Eric Sandeen     2024-07-04   805  		if (result.negated)
696c018c7718f5 Namjae Jeon      2013-06-16   806  			clear_opt(sbi, XATTR_USER);
bf51728fb81347 Eric Sandeen     2024-07-04   807  		else
bf51728fb81347 Eric Sandeen     2024-07-04   808  			set_opt(sbi, XATTR_USER);
696c018c7718f5 Namjae Jeon      2013-06-16   809  		break;
444c580f7e9ad2 Jaegeuk Kim      2013-08-08   810  	case Opt_inline_xattr:
bf51728fb81347 Eric Sandeen     2024-07-04   811  		if (result.negated)
23cf7212a1cae2 Chao Yu          2017-02-15   812  			clear_opt(sbi, INLINE_XATTR);
bf51728fb81347 Eric Sandeen     2024-07-04   813  		else
bf51728fb81347 Eric Sandeen     2024-07-04   814  			set_opt(sbi, INLINE_XATTR);
23cf7212a1cae2 Chao Yu          2017-02-15   815  		break;
6afc662e68b5f9 Chao Yu          2017-09-06   816  	case Opt_inline_xattr_size:
6afc662e68b5f9 Chao Yu          2017-09-06   817  		set_opt(sbi, INLINE_XATTR_SIZE);
bf51728fb81347 Eric Sandeen     2024-07-04   818  		F2FS_OPTION(sbi).inline_xattr_size = result.uint_32;
6afc662e68b5f9 Chao Yu          2017-09-06   819  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   820  #else
4058c5117d6d8a Kelly Anderson   2013-10-07   821  	case Opt_user_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18   822  		f2fs_info(sbi, "user_xattr options not supported");
4058c5117d6d8a Kelly Anderson   2013-10-07   823  		break;
444c580f7e9ad2 Jaegeuk Kim      2013-08-08   824  	case Opt_inline_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18   825  		f2fs_info(sbi, "inline_xattr options not supported");
444c580f7e9ad2 Jaegeuk Kim      2013-08-08   826  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   827  #endif
696c018c7718f5 Namjae Jeon      2013-06-16   828  #ifdef CONFIG_F2FS_FS_POSIX_ACL
4058c5117d6d8a Kelly Anderson   2013-10-07   829  	case Opt_acl:
bf51728fb81347 Eric Sandeen     2024-07-04   830  		if (result.negated)
696c018c7718f5 Namjae Jeon      2013-06-16   831  			clear_opt(sbi, POSIX_ACL);
bf51728fb81347 Eric Sandeen     2024-07-04   832  		else
bf51728fb81347 Eric Sandeen     2024-07-04   833  			set_opt(sbi, POSIX_ACL);
696c018c7718f5 Namjae Jeon      2013-06-16   834  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   835  #else
4058c5117d6d8a Kelly Anderson   2013-10-07   836  	case Opt_acl:
dcbb4c10e6d969 Joe Perches      2019-06-18   837  		f2fs_info(sbi, "acl options not supported");
4058c5117d6d8a Kelly Anderson   2013-10-07   838  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   839  #endif
696c018c7718f5 Namjae Jeon      2013-06-16   840  	case Opt_active_logs:
bf51728fb81347 Eric Sandeen     2024-07-04   841  		if (result.uint_32 != 2 && result.uint_32 != 4 &&
bf51728fb81347 Eric Sandeen     2024-07-04   842  			result.uint_32 != NR_CURSEG_PERSIST_TYPE)
696c018c7718f5 Namjae Jeon      2013-06-16   843  			return -EINVAL;
bf51728fb81347 Eric Sandeen     2024-07-04   844  		F2FS_OPTION(sbi).active_logs = result.uint_32;
696c018c7718f5 Namjae Jeon      2013-06-16   845  		break;
696c018c7718f5 Namjae Jeon      2013-06-16   846  	case Opt_disable_ext_identify:
696c018c7718f5 Namjae Jeon      2013-06-16   847  		set_opt(sbi, DISABLE_EXT_IDENTIFY);
696c018c7718f5 Namjae Jeon      2013-06-16   848  		break;
8274de77b7072d Huajun Li        2013-11-10   849  	case Opt_inline_data:
8274de77b7072d Huajun Li        2013-11-10   850  		set_opt(sbi, INLINE_DATA);
8274de77b7072d Huajun Li        2013-11-10   851  		break;
5efd3c6f1be9cf Chao Yu          2014-09-24   852  	case Opt_inline_dentry:
bf51728fb81347 Eric Sandeen     2024-07-04   853  		if (result.negated)
97c1794a5dc160 Chao Yu          2016-05-09   854  			clear_opt(sbi, INLINE_DENTRY);
bf51728fb81347 Eric Sandeen     2024-07-04   855  		else
bf51728fb81347 Eric Sandeen     2024-07-04   856  			set_opt(sbi, INLINE_DENTRY);
97c1794a5dc160 Chao Yu          2016-05-09   857  		break;
6b4afdd794783f Jaegeuk Kim      2014-04-02   858  	case Opt_flush_merge:
bf51728fb81347 Eric Sandeen     2024-07-04   859  		if (result.negated)
69e9e4274450c7 Jaegeuk Kim      2016-05-20   860  			clear_opt(sbi, FLUSH_MERGE);
bf51728fb81347 Eric Sandeen     2024-07-04   861  		else
0f7b2abd188089 Jaegeuk Kim      2014-07-23   862  			set_opt(sbi, NOBARRIER);
bf51728fb81347 Eric Sandeen     2024-07-04   863  		F2FS_OPTION(sbi).user_set_flush_merge = true;
0f7b2abd188089 Jaegeuk Kim      2014-07-23   864  		break;
6047de5482c33d Yangtao Li       2022-10-25   865  	case Opt_barrier:
bf51728fb81347 Eric Sandeen     2024-07-04   866  		if (result.negated)
6047de5482c33d Yangtao Li       2022-10-25   867  			clear_opt(sbi, NOBARRIER);
bf51728fb81347 Eric Sandeen     2024-07-04   868  		else
bf51728fb81347 Eric Sandeen     2024-07-04   869  			set_opt(sbi, NOBARRIER);
6047de5482c33d Yangtao Li       2022-10-25   870  		break;
d5053a34a9cc79 Jaegeuk Kim      2014-10-30   871  	case Opt_fastboot:
d5053a34a9cc79 Jaegeuk Kim      2014-10-30   872  		set_opt(sbi, FASTBOOT);
d5053a34a9cc79 Jaegeuk Kim      2014-10-30   873  		break;
8967215954a509 Chao Yu          2015-02-05   874  	case Opt_extent_cache:
bf51728fb81347 Eric Sandeen     2024-07-04   875  		if (result.negated)
12607c1ba7637e Jaegeuk Kim      2022-11-30   876  			clear_opt(sbi, READ_EXTENT_CACHE);
bf51728fb81347 Eric Sandeen     2024-07-04   877  		else
bf51728fb81347 Eric Sandeen     2024-07-04   878  			set_opt(sbi, READ_EXTENT_CACHE);
7daaea256de42d Jaegeuk Kim      2015-06-25   879  		break;
75342797988a0f Wanpeng Li       2015-03-24   880  	case Opt_noinline_data:
75342797988a0f Wanpeng Li       2015-03-24   881  		clear_opt(sbi, INLINE_DATA);
75342797988a0f Wanpeng Li       2015-03-24   882  		break;
343f40f0a70eb7 Chao Yu          2015-12-16   883  	case Opt_data_flush:
343f40f0a70eb7 Chao Yu          2015-12-16   884  		set_opt(sbi, DATA_FLUSH);
343f40f0a70eb7 Chao Yu          2015-12-16   885  		break;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   886  	case Opt_reserve_root:
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   887  		if (test_opt(sbi, RESERVE_ROOT)) {
dcbb4c10e6d969 Joe Perches      2019-06-18   888  			f2fs_info(sbi, "Preserve previous reserve_root=%u",
63189b785960c3 Chao Yu          2018-03-08   889  				  F2FS_OPTION(sbi).root_reserved_blocks);
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   890  		} else {
bf51728fb81347 Eric Sandeen     2024-07-04   891  			F2FS_OPTION(sbi).root_reserved_blocks = result.uint_32;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   892  			set_opt(sbi, RESERVE_ROOT);
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   893  		}
7e65be49ed94f8 Jaegeuk Kim      2017-12-27   894  		break;
7c2e59632b846a Jaegeuk Kim      2018-01-04   895  	case Opt_resuid:
bf51728fb81347 Eric Sandeen     2024-07-04   896  		uid = make_kuid(current_user_ns(), result.uint_32);
7c2e59632b846a Jaegeuk Kim      2018-01-04   897  		if (!uid_valid(uid)) {
bf51728fb81347 Eric Sandeen     2024-07-04   898  			f2fs_err(sbi, "Invalid uid value %d", result.uint_32);
7c2e59632b846a Jaegeuk Kim      2018-01-04   899  			return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04   900  		}
63189b785960c3 Chao Yu          2018-03-08   901  		F2FS_OPTION(sbi).s_resuid = uid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   902  		break;
7c2e59632b846a Jaegeuk Kim      2018-01-04   903  	case Opt_resgid:
bf51728fb81347 Eric Sandeen     2024-07-04   904  		gid = make_kgid(current_user_ns(), result.uint_32);
7c2e59632b846a Jaegeuk Kim      2018-01-04   905  		if (!gid_valid(gid)) {
bf51728fb81347 Eric Sandeen     2024-07-04   906  			f2fs_err(sbi, "Invalid gid value %d", result.uint_32);
7c2e59632b846a Jaegeuk Kim      2018-01-04   907  			return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04   908  		}
63189b785960c3 Chao Yu          2018-03-08   909  		F2FS_OPTION(sbi).s_resgid = gid;
7c2e59632b846a Jaegeuk Kim      2018-01-04   910  		break;
36abef4e796d38 Jaegeuk Kim      2016-06-03   911  	case Opt_mode:
bf51728fb81347 Eric Sandeen     2024-07-04   912  		F2FS_OPTION(sbi).fs_mode = result.uint_32;
36abef4e796d38 Jaegeuk Kim      2016-06-03   913  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   914  #ifdef CONFIG_F2FS_FAULT_INJECTION
73faec4d99358b Jaegeuk Kim      2016-04-29   915  	case Opt_fault_injection:
bf51728fb81347 Eric Sandeen     2024-07-04   916  		if (f2fs_build_fault_attr(sbi, result.uint_32, F2FS_ALL_FAULT_TYPE))
4ed886b187f474 Chao Yu          2024-05-07   917  			return -EINVAL;
d494500a704342 Chao Yu          2018-08-08   918  		set_opt(sbi, FAULT_INJECTION);
d494500a704342 Chao Yu          2018-08-08   919  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   920  
d494500a704342 Chao Yu          2018-08-08   921  	case Opt_fault_type:
bf51728fb81347 Eric Sandeen     2024-07-04   922  		if (f2fs_build_fault_attr(sbi, 0, result.uint_32))
4ed886b187f474 Chao Yu          2024-05-07   923  			return -EINVAL;
0cc0dec2b6f9bf Kaixu Xia        2017-01-27   924  		set_opt(sbi, FAULT_INJECTION);
4cb037ec3f754f Chengguang Xu    2018-09-12   925  		break;
73faec4d99358b Jaegeuk Kim      2016-04-29   926  #else
4cb037ec3f754f Chengguang Xu    2018-09-12   927  	case Opt_fault_injection:
dcbb4c10e6d969 Joe Perches      2019-06-18   928  		f2fs_info(sbi, "fault_injection options not supported");
73faec4d99358b Jaegeuk Kim      2016-04-29   929  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   930  
4cb037ec3f754f Chengguang Xu    2018-09-12   931  	case Opt_fault_type:
dcbb4c10e6d969 Joe Perches      2019-06-18   932  		f2fs_info(sbi, "fault_type options not supported");
4cb037ec3f754f Chengguang Xu    2018-09-12   933  		break;
4cb037ec3f754f Chengguang Xu    2018-09-12   934  #endif
0abd675e97e60d Chao Yu          2017-07-09   935  #ifdef CONFIG_QUOTA
4b2414d04e9912 Chao Yu          2017-08-08   936  	case Opt_quota:
0abd675e97e60d Chao Yu          2017-07-09   937  	case Opt_usrquota:
0abd675e97e60d Chao Yu          2017-07-09   938  		set_opt(sbi, USRQUOTA);
0abd675e97e60d Chao Yu          2017-07-09   939  		break;
0abd675e97e60d Chao Yu          2017-07-09   940  	case Opt_grpquota:
0abd675e97e60d Chao Yu          2017-07-09   941  		set_opt(sbi, GRPQUOTA);
0abd675e97e60d Chao Yu          2017-07-09   942  		break;
5c57132eaf5265 Chao Yu          2017-07-26   943  	case Opt_prjquota:
5c57132eaf5265 Chao Yu          2017-07-26   944  		set_opt(sbi, PRJQUOTA);
5c57132eaf5265 Chao Yu          2017-07-26   945  		break;
4b2414d04e9912 Chao Yu          2017-08-08   946  	case Opt_usrjquota:
bf51728fb81347 Eric Sandeen     2024-07-04   947  		ret = f2fs_set_qf_name(sbi, USRQUOTA, param->string);
4b2414d04e9912 Chao Yu          2017-08-08   948  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   949  			return ret;
bf51728fb81347 Eric Sandeen     2024-07-04   950  		param->string = NULL; /* param->string stolen */
4b2414d04e9912 Chao Yu          2017-08-08   951  		break;
4b2414d04e9912 Chao Yu          2017-08-08   952  	case Opt_grpjquota:
bf51728fb81347 Eric Sandeen     2024-07-04   953  		ret = f2fs_set_qf_name(sbi, GRPQUOTA, param->string);
4b2414d04e9912 Chao Yu          2017-08-08   954  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   955  			return ret;
bf51728fb81347 Eric Sandeen     2024-07-04   956  		param->string = NULL; /* param->string stolen */
4b2414d04e9912 Chao Yu          2017-08-08   957  		break;
4b2414d04e9912 Chao Yu          2017-08-08   958  	case Opt_prjjquota:
bf51728fb81347 Eric Sandeen     2024-07-04   959  		ret = f2fs_set_qf_name(sbi, PRJQUOTA, param->string);
4b2414d04e9912 Chao Yu          2017-08-08   960  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   961  			return ret;
bf51728fb81347 Eric Sandeen     2024-07-04   962  		param->string = NULL; /* param->string stolen */
4b2414d04e9912 Chao Yu          2017-08-08   963  		break;
4b2414d04e9912 Chao Yu          2017-08-08   964  	case Opt_offusrjquota:
86087f7ffe9590 Eric Sandeen     2024-07-04   965  		ret = f2fs_clear_qf_name(sbi, USRQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   966  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   967  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   968  		break;
4b2414d04e9912 Chao Yu          2017-08-08   969  	case Opt_offgrpjquota:
86087f7ffe9590 Eric Sandeen     2024-07-04   970  		ret = f2fs_clear_qf_name(sbi, GRPQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   971  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   972  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   973  		break;
4b2414d04e9912 Chao Yu          2017-08-08   974  	case Opt_offprjjquota:
86087f7ffe9590 Eric Sandeen     2024-07-04   975  		ret = f2fs_clear_qf_name(sbi, PRJQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   976  		if (ret)
4b2414d04e9912 Chao Yu          2017-08-08   977  			return ret;
4b2414d04e9912 Chao Yu          2017-08-08   978  		break;
bf51728fb81347 Eric Sandeen     2024-07-04   979  	case Opt_jqfmt:
bf51728fb81347 Eric Sandeen     2024-07-04   980  		F2FS_OPTION(sbi).s_jquota_fmt = result.uint_32;;
4b2414d04e9912 Chao Yu          2017-08-08   981  		break;
4b2414d04e9912 Chao Yu          2017-08-08   982  	case Opt_noquota:
4b2414d04e9912 Chao Yu          2017-08-08   983  		clear_opt(sbi, QUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   984  		clear_opt(sbi, USRQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   985  		clear_opt(sbi, GRPQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   986  		clear_opt(sbi, PRJQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08   987  		break;
0abd675e97e60d Chao Yu          2017-07-09   988  #else
4b2414d04e9912 Chao Yu          2017-08-08   989  	case Opt_quota:
0abd675e97e60d Chao Yu          2017-07-09   990  	case Opt_usrquota:
0abd675e97e60d Chao Yu          2017-07-09   991  	case Opt_grpquota:
5c57132eaf5265 Chao Yu          2017-07-26   992  	case Opt_prjquota:
4b2414d04e9912 Chao Yu          2017-08-08   993  	case Opt_usrjquota:
4b2414d04e9912 Chao Yu          2017-08-08   994  	case Opt_grpjquota:
4b2414d04e9912 Chao Yu          2017-08-08   995  	case Opt_prjjquota:
4b2414d04e9912 Chao Yu          2017-08-08   996  	case Opt_offusrjquota:
4b2414d04e9912 Chao Yu          2017-08-08   997  	case Opt_offgrpjquota:
4b2414d04e9912 Chao Yu          2017-08-08   998  	case Opt_offprjjquota:
bf51728fb81347 Eric Sandeen     2024-07-04   999  	case Opt_jqfmt:
4b2414d04e9912 Chao Yu          2017-08-08  1000  	case Opt_noquota:
dcbb4c10e6d969 Joe Perches      2019-06-18  1001  		f2fs_info(sbi, "quota operations not supported");
0abd675e97e60d Chao Yu          2017-07-09  1002  		break;
0abd675e97e60d Chao Yu          2017-07-09  1003  #endif
079396270b0f1e Jaegeuk Kim      2018-02-18  1004  	case Opt_alloc:
bf51728fb81347 Eric Sandeen     2024-07-04  1005  		F2FS_OPTION(sbi).alloc_mode = result.uint_32;
079396270b0f1e Jaegeuk Kim      2018-02-18  1006  		break;
93cf93f17c8ef7 Junling Zheng    2018-03-07  1007  	case Opt_fsync:
bf51728fb81347 Eric Sandeen     2024-07-04  1008  		F2FS_OPTION(sbi).fsync_mode = result.uint_32;
93cf93f17c8ef7 Junling Zheng    2018-03-07  1009  		break;
ff62af200b94e0 Sheng Yong       2018-03-15  1010  	case Opt_test_dummy_encryption:
bf51728fb81347 Eric Sandeen     2024-07-04  1011  		ret = f2fs_set_test_dummy_encryption(param, sbi, is_remount);
ed318a6cc0b620 Eric Biggers     2020-05-12  1012  		if (ret)
ed318a6cc0b620 Eric Biggers     2020-05-12  1013  			return ret;
ff62af200b94e0 Sheng Yong       2018-03-15  1014  		break;
27aacd28ea3b89 Satya Tangirala  2020-07-02  1015  	case Opt_inlinecrypt:
27aacd28ea3b89 Satya Tangirala  2020-07-02  1016  #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
ba227ce6211267 Eric Sandeen     2024-07-04  1017  		set_opt(sbi, INLINECRYPT);
27aacd28ea3b89 Satya Tangirala  2020-07-02  1018  #else
27aacd28ea3b89 Satya Tangirala  2020-07-02  1019  		f2fs_info(sbi, "inline encryption not supported");
27aacd28ea3b89 Satya Tangirala  2020-07-02  1020  #endif
27aacd28ea3b89 Satya Tangirala  2020-07-02  1021  		break;
bf51728fb81347 Eric Sandeen     2024-07-04  1022  	case Opt_checkpoint:
bf51728fb81347 Eric Sandeen     2024-07-04  1023  		/* revert to match_table for this odd option */
bf51728fb81347 Eric Sandeen     2024-07-04  1024  		token = match_token(param->string, f2fs_checkpoint_tokens, args);
bf51728fb81347 Eric Sandeen     2024-07-04  1025  		switch (token) {
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1026  		case Opt_checkpoint_disable_cap_perc:
4d3aed70902f29 Daniel Rosenberg 2019-05-29 @1027  			if (args->from && match_int(args, &arg))
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1028  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1029  			if (arg < 0 || arg > 100)
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1030  				return -EINVAL;
1ae18f71cb5226 Jaegeuk Kim      2020-05-15  1031  			F2FS_OPTION(sbi).unusable_cap_perc = arg;
4354994f097d06 Daniel Rosenberg 2018-08-20  1032  			set_opt(sbi, DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1033  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1034  		case Opt_checkpoint_disable_cap:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1035  			if (args->from && match_int(args, &arg))
4354994f097d06 Daniel Rosenberg 2018-08-20  1036  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1037  			F2FS_OPTION(sbi).unusable_cap = arg;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1038  			set_opt(sbi, DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1039  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1040  		case Opt_checkpoint_disable:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1041  			set_opt(sbi, DISABLE_CHECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1042  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1043  		case Opt_checkpoint_enable:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  1044  			clear_opt(sbi, DISABLE_CHECKPOINT);
4354994f097d06 Daniel Rosenberg 2018-08-20  1045  			break;
bf51728fb81347 Eric Sandeen     2024-07-04  1046  		}
261eeb9c1585de Daeho Jeong      2021-01-19  1047  		break;
bf51728fb81347 Eric Sandeen     2024-07-04  1048  	case Opt_checkpoint_merge:
bf51728fb81347 Eric Sandeen     2024-07-04  1049  		if (result.negated)
261eeb9c1585de Daeho Jeong      2021-01-19  1050  			clear_opt(sbi, MERGE_CHECKPOINT);
bf51728fb81347 Eric Sandeen     2024-07-04  1051  		else
bf51728fb81347 Eric Sandeen     2024-07-04  1052  			set_opt(sbi, MERGE_CHECKPOINT);
261eeb9c1585de Daeho Jeong      2021-01-19  1053  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1054  #ifdef CONFIG_F2FS_FS_COMPRESSION
4c8ff7095bef64 Chao Yu          2019-11-01  1055  	case Opt_compress_algorithm:
bf51728fb81347 Eric Sandeen     2024-07-04  1056  		name = param->string;
3c57f75182452c Eric Biggers     2020-05-01  1057  		if (!strcmp(name, "lzo")) {
32be0e97c71366 Chao Yu          2021-01-22  1058  #ifdef CONFIG_F2FS_FS_LZO
3fde13f817e23f Chao Yu          2021-01-22  1059  			F2FS_OPTION(sbi).compress_level = 0;
bf51728fb81347 Eric Sandeen     2024-07-04  1060  			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
32be0e97c71366 Chao Yu          2021-01-22  1061  #else
32be0e97c71366 Chao Yu          2021-01-22  1062  			f2fs_info(sbi, "kernel doesn't support lzo compression");
32be0e97c71366 Chao Yu          2021-01-22  1063  #endif
3fde13f817e23f Chao Yu          2021-01-22  1064  		} else if (!strncmp(name, "lz4", 3)) {
32be0e97c71366 Chao Yu          2021-01-22  1065  #ifdef CONFIG_F2FS_FS_LZ4
3fde13f817e23f Chao Yu          2021-01-22  1066  			ret = f2fs_set_lz4hc_level(sbi, name);
bf51728fb81347 Eric Sandeen     2024-07-04  1067  			if (ret)
3fde13f817e23f Chao Yu          2021-01-22  1068  				return -EINVAL;
bf51728fb81347 Eric Sandeen     2024-07-04  1069  			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
32be0e97c71366 Chao Yu          2021-01-22  1070  #else
32be0e97c71366 Chao Yu          2021-01-22  1071  			f2fs_info(sbi, "kernel doesn't support lz4 compression");
32be0e97c71366 Chao Yu          2021-01-22  1072  #endif
3fde13f817e23f Chao Yu          2021-01-22  1073  		} else if (!strncmp(name, "zstd", 4)) {
32be0e97c71366 Chao Yu          2021-01-22  1074  #ifdef CONFIG_F2FS_FS_ZSTD
3fde13f817e23f Chao Yu          2021-01-22  1075  			ret = f2fs_set_zstd_level(sbi, name);
bf51728fb81347 Eric Sandeen     2024-07-04  1076  			if (ret)
3fde13f817e23f Chao Yu          2021-01-22  1077  				return -EINVAL;
bf51728fb81347 Eric Sandeen     2024-07-04  1078  			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_ZSTD;
32be0e97c71366 Chao Yu          2021-01-22  1079  #else
32be0e97c71366 Chao Yu          2021-01-22  1080  			f2fs_info(sbi, "kernel doesn't support zstd compression");
32be0e97c71366 Chao Yu          2021-01-22  1081  #endif
6d92b201035dfe Chao Yu          2020-04-08  1082  		} else if (!strcmp(name, "lzo-rle")) {
32be0e97c71366 Chao Yu          2021-01-22  1083  #ifdef CONFIG_F2FS_FS_LZORLE
3fde13f817e23f Chao Yu          2021-01-22  1084  			F2FS_OPTION(sbi).compress_level = 0;
bf51728fb81347 Eric Sandeen     2024-07-04  1085  			F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZORLE;
32be0e97c71366 Chao Yu          2021-01-22  1086  #else
32be0e97c71366 Chao Yu          2021-01-22  1087  			f2fs_info(sbi, "kernel doesn't support lzorle compression");
32be0e97c71366 Chao Yu          2021-01-22  1088  #endif
bf51728fb81347 Eric Sandeen     2024-07-04  1089  			} else
4c8ff7095bef64 Chao Yu          2019-11-01  1090  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1091  			break;
4c8ff7095bef64 Chao Yu          2019-11-01  1092  	case Opt_compress_log_size:
bf51728fb81347 Eric Sandeen     2024-07-04  1093  		if (result.uint_32 < MIN_COMPRESS_LOG_SIZE ||
bf51728fb81347 Eric Sandeen     2024-07-04  1094  			result.uint_32 > MAX_COMPRESS_LOG_SIZE) {
4c8ff7095bef64 Chao Yu          2019-11-01  1095  			f2fs_err(sbi,
4c8ff7095bef64 Chao Yu          2019-11-01  1096  				"Compress cluster log size is out of range");
4c8ff7095bef64 Chao Yu          2019-11-01  1097  			return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1098  		}
bf51728fb81347 Eric Sandeen     2024-07-04  1099  		F2FS_OPTION(sbi).compress_log_size = result.uint_32;
4c8ff7095bef64 Chao Yu          2019-11-01  1100  		break;
4c8ff7095bef64 Chao Yu          2019-11-01  1101  	case Opt_compress_extension:
4c8ff7095bef64 Chao Yu          2019-11-01  1102  		ext = F2FS_OPTION(sbi).extensions;
4c8ff7095bef64 Chao Yu          2019-11-01  1103  		ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
4c8ff7095bef64 Chao Yu          2019-11-01  1104  
bf51728fb81347 Eric Sandeen     2024-07-04  1105  		if (strlen(param->string) >= F2FS_EXTENSION_LEN ||
4c8ff7095bef64 Chao Yu          2019-11-01  1106  			ext_cnt >= COMPRESS_EXT_NUM) {
bf51728fb81347 Eric Sandeen     2024-07-04  1107  			f2fs_err(sbi, "invalid extension length/number");
4c8ff7095bef64 Chao Yu          2019-11-01  1108  			return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  1109  		}
4c8ff7095bef64 Chao Yu          2019-11-01  1110  
bf51728fb81347 Eric Sandeen     2024-07-04  1111  		if (is_compress_extension_exist(sbi, param->string, true))
7e1b150fece033 Chao Yu          2023-08-28  1112  			break;
7e1b150fece033 Chao Yu          2023-08-28  1113  
bf51728fb81347 Eric Sandeen     2024-07-04  1114  		/* XXX ERS can we just steal param->string */
bf51728fb81347 Eric Sandeen     2024-07-04  1115  		strcpy(ext[ext_cnt], param->string);
4c8ff7095bef64 Chao Yu          2019-11-01  1116  		F2FS_OPTION(sbi).compress_ext_cnt++;
4c8ff7095bef64 Chao Yu          2019-11-01  1117  		break;
151b1982be5d9f Fengnan Chang    2021-06-08  1118  	case Opt_nocompress_extension:
151b1982be5d9f Fengnan Chang    2021-06-08  1119  		noext = F2FS_OPTION(sbi).noextensions;
151b1982be5d9f Fengnan Chang    2021-06-08  1120  		noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
151b1982be5d9f Fengnan Chang    2021-06-08  1121  
bf51728fb81347 Eric Sandeen     2024-07-04  1122  		if (strlen(param->string) >= F2FS_EXTENSION_LEN ||
151b1982be5d9f Fengnan Chang    2021-06-08  1123  			noext_cnt >= COMPRESS_EXT_NUM) {
bf51728fb81347 Eric Sandeen     2024-07-04  1124  			f2fs_err(sbi, "invalid extension length/number");
151b1982be5d9f Fengnan Chang    2021-06-08  1125  			return -EINVAL;
151b1982be5d9f Fengnan Chang    2021-06-08  1126  		}
151b1982be5d9f Fengnan Chang    2021-06-08  1127  
bf51728fb81347 Eric Sandeen     2024-07-04  1128  		if (is_compress_extension_exist(sbi, param->string, false))
7e1b150fece033 Chao Yu          2023-08-28  1129  			break;
7e1b150fece033 Chao Yu          2023-08-28  1130  
bf51728fb81347 Eric Sandeen     2024-07-04  1131  		/* XXX ERS can we just steal param->string */
bf51728fb81347 Eric Sandeen     2024-07-04  1132  		strcpy(noext[noext_cnt], param->string);
151b1982be5d9f Fengnan Chang    2021-06-08  1133  		F2FS_OPTION(sbi).nocompress_ext_cnt++;
151b1982be5d9f Fengnan Chang    2021-06-08  1134  		break;
b28f047b28c51d Chao Yu          2020-11-26  1135  	case Opt_compress_chksum:
b28f047b28c51d Chao Yu          2020-11-26  1136  		F2FS_OPTION(sbi).compress_chksum = true;
b28f047b28c51d Chao Yu          2020-11-26  1137  		break;
602a16d58e9aab Daeho Jeong      2020-12-01  1138  	case Opt_compress_mode:
bf51728fb81347 Eric Sandeen     2024-07-04  1139  		F2FS_OPTION(sbi).compress_mode = result.uint_32;
602a16d58e9aab Daeho Jeong      2020-12-01  1140  		break;
6ce19aff0b8cd3 Chao Yu          2021-05-20  1141  	case Opt_compress_cache:
6ce19aff0b8cd3 Chao Yu          2021-05-20  1142  		set_opt(sbi, COMPRESS_CACHE);
6ce19aff0b8cd3 Chao Yu          2021-05-20  1143  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1144  #else
1f0b067b6e4927 Chao Yu          2020-07-29  1145  	case Opt_compress_algorithm:
1f0b067b6e4927 Chao Yu          2020-07-29  1146  	case Opt_compress_log_size:
1f0b067b6e4927 Chao Yu          2020-07-29  1147  	case Opt_compress_extension:
151b1982be5d9f Fengnan Chang    2021-06-08  1148  	case Opt_nocompress_extension:
b28f047b28c51d Chao Yu          2020-11-26  1149  	case Opt_compress_chksum:
602a16d58e9aab Daeho Jeong      2020-12-01  1150  	case Opt_compress_mode:
6ce19aff0b8cd3 Chao Yu          2021-05-20  1151  	case Opt_compress_cache:
1f0b067b6e4927 Chao Yu          2020-07-29  1152  		f2fs_info(sbi, "compression options not supported");
1f0b067b6e4927 Chao Yu          2020-07-29  1153  		break;
1f0b067b6e4927 Chao Yu          2020-07-29  1154  #endif
093749e296e29a Chao Yu          2020-08-04  1155  	case Opt_atgc:
093749e296e29a Chao Yu          2020-08-04  1156  		set_opt(sbi, ATGC);
093749e296e29a Chao Yu          2020-08-04  1157  		break;
5911d2d1d1a38b Chao Yu          2021-03-27  1158  	case Opt_gc_merge:
bf51728fb81347 Eric Sandeen     2024-07-04  1159  		if (result.negated)
5911d2d1d1a38b Chao Yu          2021-03-27  1160  			clear_opt(sbi, GC_MERGE);
bf51728fb81347 Eric Sandeen     2024-07-04  1161  		else
bf51728fb81347 Eric Sandeen     2024-07-04  1162  			set_opt(sbi, GC_MERGE);
5911d2d1d1a38b Chao Yu          2021-03-27  1163  		break;
4f993264fe2965 Chao Yu          2021-08-03  1164  	case Opt_discard_unit:
bf51728fb81347 Eric Sandeen     2024-07-04  1165  		F2FS_OPTION(sbi).discard_unit = result.uint_32;
4f993264fe2965 Chao Yu          2021-08-03  1166  		break;
7a8fc586180d8c Daeho Jeong      2022-06-20  1167  	case Opt_memory_mode:
bf51728fb81347 Eric Sandeen     2024-07-04  1168  		F2FS_OPTION(sbi).memory_mode = result.uint_32;
7a8fc586180d8c Daeho Jeong      2022-06-20  1169  		break;
71644dff481180 Jaegeuk Kim      2022-12-01  1170  	case Opt_age_extent_cache:
71644dff481180 Jaegeuk Kim      2022-12-01  1171  		set_opt(sbi, AGE_EXTENT_CACHE);
71644dff481180 Jaegeuk Kim      2022-12-01  1172  		break;
b62e71be2110d8 Chao Yu          2023-04-23  1173  	case Opt_errors:
bf51728fb81347 Eric Sandeen     2024-07-04  1174  		F2FS_OPTION(sbi).errors = result.uint_32;
b62e71be2110d8 Chao Yu          2023-04-23  1175  		break;
696c018c7718f5 Namjae Jeon      2013-06-16  1176  	default:
696c018c7718f5 Namjae Jeon      2013-06-16  1177  		return -EINVAL;
696c018c7718f5 Namjae Jeon      2013-06-16  1178  	}
5e033d8237844b Eric Sandeen     2024-07-04  1179  	return 0;
5e033d8237844b Eric Sandeen     2024-07-04  1180  }
5e033d8237844b Eric Sandeen     2024-07-04  1181  

:::::: The code at line 1027 was first introduced by commit
:::::: 4d3aed70902f299ff2ed7048ef44f0d4d573d786 f2fs: Add option to limit required GC for checkpoint=disable

:::::: TO: Daniel Rosenberg <drosen@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
