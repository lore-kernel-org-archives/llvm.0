Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D839B96B;
	Wed, 25 Mar 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431741; cv=none; b=ZbTSFvZteAO/ar35DqTZNoO8ALwqKNicwdV359lbFP/by5p2g/BCOVbzC2ur98fMuchW145PocaG0WwAdi0NZXXvciylUk2UOidI9cCkGfCxAYKO8Fb07sWY/CYvGzr5qyrb+RunNWiMnKvQM/TqgcShwmu3GhWeID2cQd/fZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431741; c=relaxed/simple;
	bh=N3twJ99/Syhl3l2+Pu9LTtTh+UZMPSs5ywGXzEPxBKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKMS2eNir2VfJngb+rj3R7ysaKgOipMGLRDU4ilFsV5JbfvJ2gfcKnqq8d2SDd8rsdcACLqIQZHliAMankbTOkLvZ4rVj2BYd9SMcOusQwfExPbl4ZWEVfyOhRons9eRwvwdu5WVEGzo7tC/0UIkmZYsWCkNunzQ7XMW6Ge/FVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6sLI8Jc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6sLI8Jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774431738; x=1805967738;
  h=date:from:to:cc:subject:message-id;
  bh=N3twJ99/Syhl3l2+Pu9LTtTh+UZMPSs5ywGXzEPxBKc=;
  b=l6sLI8JcW7NzEJbL71mLQwn4UxOS4BmC61kIPSJJI8a6v+u/E/YrS1FP
   kKwLW4xMBIwMrDkjDxLB3mtIYxcjDpfWXfslVHXWQkwP9rKpXrBqeNPEp
   X5mN966HR3TcLApnr6DaxUcmb9uYQUlFAw6uHGu07QmQ5nIcqTYReTeGG
   Djf1kkGjUgfUaW4iV7k9VG441RF1/zCWuyPtr4M0zH/juX32FM6Ox/W3V
   GXegQ3Fx+/Poh40B/0KEiSvCFX/U52pGah6bjJuIXnRVLSwnnKuhlpHUW
   U73DeYTzatOahKviwOq06bor5xz8vYV/DuVT8Ew2x2uonkyLKwfkArAjK
   A==;
X-CSE-ConnectionGUID: h/73GD6/QLyGHm1aaQUqPA==
X-CSE-MsgGUID: RJhS3OJaRRChNt8bb+JCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86835462"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86835462"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:42:16 -0700
X-CSE-ConnectionGUID: GZSpm0SaRauI0QjeTGdH/Q==
X-CSE-MsgGUID: artsbC3tST+h19pBlFkrGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224576670"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2026 02:42:14 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Kkd-000000006aX-0D0h;
	Wed, 25 Mar 2026 09:42:11 +0000
Date: Wed, 25 Mar 2026 17:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: avivdaum <aviv.daum@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-7.1.fat 1/1] fs/fat/fat_test.c:226:13:
 warning: stack frame size (2648) exceeds limit (1280) in
 'fat_time_fat2unix_test'
Message-ID: <202603251755.4UYY1Rcd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.1.fat
head:   4bbf3f58e00f8671eb384c7df6983d803058b204
commit: 4bbf3f58e00f8671eb384c7df6983d803058b204 [1/1] fat: add KUnit tests for timestamp conversion helpers
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603251755.4UYY1Rcd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251755.4UYY1Rcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251755.4UYY1Rcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fat/fat_test.c:226:13: warning: stack frame size (2648) exceeds limit (1280) in 'fat_time_fat2unix_test' [-Wframe-larger-than]
     226 | static void fat_time_fat2unix_test(struct kunit *test)
         |             ^
>> fs/fat/fat_test.c:249:13: warning: stack frame size (2640) exceeds limit (1280) in 'fat_time_unix2fat_test' [-Wframe-larger-than]
     249 | static void fat_time_unix2fat_test(struct kunit *test)
         |             ^
>> fs/fat/fat_test.c:275:13: warning: stack frame size (2640) exceeds limit (1280) in 'fat_time_unix2fat_clamp_test' [-Wframe-larger-than]
     275 | static void fat_time_unix2fat_clamp_test(struct kunit *test)
         |             ^
>> fs/fat/fat_test.c:300:13: warning: stack frame size (2656) exceeds limit (1280) in 'fat_time_unix2fat_no_csec_test' [-Wframe-larger-than]
     300 | static void fat_time_unix2fat_no_csec_test(struct kunit *test)
         |             ^
>> fs/fat/fat_test.c:322:13: warning: stack frame size (2632) exceeds limit (1280) in 'fat_truncate_atime_test' [-Wframe-larger-than]
     322 | static void fat_truncate_atime_test(struct kunit *test)
         |             ^
   5 warnings generated.


vim +/fat_time_fat2unix_test +226 fs/fat/fat_test.c

b0d4adaf3b3c44 David Gow 2021-04-15  225  
b0d4adaf3b3c44 David Gow 2021-04-15 @226  static void fat_time_fat2unix_test(struct kunit *test)
b0d4adaf3b3c44 David Gow 2021-04-15  227  {
b0d4adaf3b3c44 David Gow 2021-04-15  228  	static struct msdos_sb_info fake_sb;
b0d4adaf3b3c44 David Gow 2021-04-15  229  	struct timespec64 ts;
b0d4adaf3b3c44 David Gow 2021-04-15  230  	struct fat_timestamp_testcase *testcase =
b0d4adaf3b3c44 David Gow 2021-04-15  231  		(struct fat_timestamp_testcase *)test->param_value;
b0d4adaf3b3c44 David Gow 2021-04-15  232  
4bbf3f58e00f86 avivdaum  2026-03-16  233  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
b0d4adaf3b3c44 David Gow 2021-04-15  234  
b0d4adaf3b3c44 David Gow 2021-04-15  235  	fat_time_fat2unix(&fake_sb, &ts,
b0d4adaf3b3c44 David Gow 2021-04-15  236  			  testcase->time,
b0d4adaf3b3c44 David Gow 2021-04-15  237  			  testcase->date,
b0d4adaf3b3c44 David Gow 2021-04-15  238  			  testcase->cs);
b0d4adaf3b3c44 David Gow 2021-04-15  239  	KUNIT_EXPECT_EQ_MSG(test,
b0d4adaf3b3c44 David Gow 2021-04-15  240  			    testcase->ts.tv_sec,
b0d4adaf3b3c44 David Gow 2021-04-15  241  			    ts.tv_sec,
b0d4adaf3b3c44 David Gow 2021-04-15  242  			    "Timestamp mismatch (seconds)\n");
b0d4adaf3b3c44 David Gow 2021-04-15  243  	KUNIT_EXPECT_EQ_MSG(test,
b0d4adaf3b3c44 David Gow 2021-04-15  244  			    testcase->ts.tv_nsec,
b0d4adaf3b3c44 David Gow 2021-04-15  245  			    ts.tv_nsec,
b0d4adaf3b3c44 David Gow 2021-04-15  246  			    "Timestamp mismatch (nanoseconds)\n");
b0d4adaf3b3c44 David Gow 2021-04-15  247  }
b0d4adaf3b3c44 David Gow 2021-04-15  248  
b0d4adaf3b3c44 David Gow 2021-04-15 @249  static void fat_time_unix2fat_test(struct kunit *test)
b0d4adaf3b3c44 David Gow 2021-04-15  250  {
b0d4adaf3b3c44 David Gow 2021-04-15  251  	static struct msdos_sb_info fake_sb;
b0d4adaf3b3c44 David Gow 2021-04-15  252  	__le16 date, time;
b0d4adaf3b3c44 David Gow 2021-04-15  253  	u8 cs;
b0d4adaf3b3c44 David Gow 2021-04-15  254  	struct fat_timestamp_testcase *testcase =
b0d4adaf3b3c44 David Gow 2021-04-15  255  		(struct fat_timestamp_testcase *)test->param_value;
b0d4adaf3b3c44 David Gow 2021-04-15  256  
4bbf3f58e00f86 avivdaum  2026-03-16  257  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
b0d4adaf3b3c44 David Gow 2021-04-15  258  
b0d4adaf3b3c44 David Gow 2021-04-15  259  	fat_time_unix2fat(&fake_sb, &testcase->ts,
b0d4adaf3b3c44 David Gow 2021-04-15  260  			  &time, &date, &cs);
b0d4adaf3b3c44 David Gow 2021-04-15  261  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  262  			    testcase->time,
4bbf3f58e00f86 avivdaum  2026-03-16  263  			    time,
b0d4adaf3b3c44 David Gow 2021-04-15  264  			    "Time mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  265  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  266  			    testcase->date,
4bbf3f58e00f86 avivdaum  2026-03-16  267  			    date,
b0d4adaf3b3c44 David Gow 2021-04-15  268  			    "Date mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  269  	KUNIT_EXPECT_EQ_MSG(test,
b0d4adaf3b3c44 David Gow 2021-04-15  270  			    testcase->cs,
b0d4adaf3b3c44 David Gow 2021-04-15  271  			    cs,
b0d4adaf3b3c44 David Gow 2021-04-15  272  			    "Centisecond mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  273  }
b0d4adaf3b3c44 David Gow 2021-04-15  274  
4bbf3f58e00f86 avivdaum  2026-03-16 @275  static void fat_time_unix2fat_clamp_test(struct kunit *test)
4bbf3f58e00f86 avivdaum  2026-03-16  276  {
4bbf3f58e00f86 avivdaum  2026-03-16  277  	static struct msdos_sb_info fake_sb;
4bbf3f58e00f86 avivdaum  2026-03-16  278  	__le16 date, time;
4bbf3f58e00f86 avivdaum  2026-03-16  279  	u8 cs;
4bbf3f58e00f86 avivdaum  2026-03-16  280  	struct fat_unix2fat_clamp_testcase *testcase =
4bbf3f58e00f86 avivdaum  2026-03-16  281  		(struct fat_unix2fat_clamp_testcase *)test->param_value;
4bbf3f58e00f86 avivdaum  2026-03-16  282  
4bbf3f58e00f86 avivdaum  2026-03-16  283  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
4bbf3f58e00f86 avivdaum  2026-03-16  284  
4bbf3f58e00f86 avivdaum  2026-03-16  285  	fat_time_unix2fat(&fake_sb, &testcase->ts, &time, &date, &cs);
4bbf3f58e00f86 avivdaum  2026-03-16  286  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  287  			    testcase->time,
4bbf3f58e00f86 avivdaum  2026-03-16  288  			    time,
4bbf3f58e00f86 avivdaum  2026-03-16  289  			    "Clamped time mismatch\n");
4bbf3f58e00f86 avivdaum  2026-03-16  290  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  291  			    testcase->date,
4bbf3f58e00f86 avivdaum  2026-03-16  292  			    date,
4bbf3f58e00f86 avivdaum  2026-03-16  293  			    "Clamped date mismatch\n");
4bbf3f58e00f86 avivdaum  2026-03-16  294  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  295  			    testcase->cs,
4bbf3f58e00f86 avivdaum  2026-03-16  296  			    cs,
4bbf3f58e00f86 avivdaum  2026-03-16  297  			    "Clamped centisecond mismatch\n");
4bbf3f58e00f86 avivdaum  2026-03-16  298  }
4bbf3f58e00f86 avivdaum  2026-03-16  299  
4bbf3f58e00f86 avivdaum  2026-03-16 @300  static void fat_time_unix2fat_no_csec_test(struct kunit *test)
4bbf3f58e00f86 avivdaum  2026-03-16  301  {
4bbf3f58e00f86 avivdaum  2026-03-16  302  	static struct msdos_sb_info fake_sb;
4bbf3f58e00f86 avivdaum  2026-03-16  303  	struct timespec64 ts = {
4bbf3f58e00f86 avivdaum  2026-03-16  304  		.tv_sec = 946684799LL,
4bbf3f58e00f86 avivdaum  2026-03-16  305  		.tv_nsec = 0L,
4bbf3f58e00f86 avivdaum  2026-03-16  306  	};
4bbf3f58e00f86 avivdaum  2026-03-16  307  	__le16 date, time;
4bbf3f58e00f86 avivdaum  2026-03-16  308  
4bbf3f58e00f86 avivdaum  2026-03-16  309  	fat_test_set_time_offset(&fake_sb, 0);
4bbf3f58e00f86 avivdaum  2026-03-16  310  
4bbf3f58e00f86 avivdaum  2026-03-16  311  	fat_time_unix2fat(&fake_sb, &ts, &time, &date, NULL);
4bbf3f58e00f86 avivdaum  2026-03-16  312  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  313  			    49021,
4bbf3f58e00f86 avivdaum  2026-03-16  314  			    le16_to_cpu(time),
4bbf3f58e00f86 avivdaum  2026-03-16  315  			    "Time mismatch without centiseconds\n");
4bbf3f58e00f86 avivdaum  2026-03-16  316  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  317  			    10143,
4bbf3f58e00f86 avivdaum  2026-03-16  318  			    le16_to_cpu(date),
4bbf3f58e00f86 avivdaum  2026-03-16  319  			    "Date mismatch without centiseconds\n");
4bbf3f58e00f86 avivdaum  2026-03-16  320  }
4bbf3f58e00f86 avivdaum  2026-03-16  321  
4bbf3f58e00f86 avivdaum  2026-03-16 @322  static void fat_truncate_atime_test(struct kunit *test)
4bbf3f58e00f86 avivdaum  2026-03-16  323  {
4bbf3f58e00f86 avivdaum  2026-03-16  324  	static struct msdos_sb_info fake_sb;
4bbf3f58e00f86 avivdaum  2026-03-16  325  	struct timespec64 actual;
4bbf3f58e00f86 avivdaum  2026-03-16  326  	struct fat_truncate_atime_testcase *testcase =
4bbf3f58e00f86 avivdaum  2026-03-16  327  		(struct fat_truncate_atime_testcase *)test->param_value;
4bbf3f58e00f86 avivdaum  2026-03-16  328  
4bbf3f58e00f86 avivdaum  2026-03-16  329  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
4bbf3f58e00f86 avivdaum  2026-03-16  330  
4bbf3f58e00f86 avivdaum  2026-03-16  331  	actual = fat_truncate_atime(&fake_sb, &testcase->ts);
4bbf3f58e00f86 avivdaum  2026-03-16  332  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  333  			    testcase->expected.tv_sec,
4bbf3f58e00f86 avivdaum  2026-03-16  334  			    actual.tv_sec,
4bbf3f58e00f86 avivdaum  2026-03-16  335  			    "Atime truncation seconds mismatch\n");
4bbf3f58e00f86 avivdaum  2026-03-16  336  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  337  			    testcase->expected.tv_nsec,
4bbf3f58e00f86 avivdaum  2026-03-16  338  			    actual.tv_nsec,
4bbf3f58e00f86 avivdaum  2026-03-16  339  			    "Atime truncation nanoseconds mismatch\n");
4bbf3f58e00f86 avivdaum  2026-03-16  340  }
4bbf3f58e00f86 avivdaum  2026-03-16  341  

:::::: The code at line 226 was first introduced by commit
:::::: b0d4adaf3b3c4402d9c3b6186e02aa1e4f7985cd fat: Add KUnit tests for checksums and timestamps

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
