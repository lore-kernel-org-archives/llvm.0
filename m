Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223EE35950;
	Fri, 26 Sep 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758865715; cv=none; b=OZHN+8ntQIIrmKFFN/8KyGmqlJUs42+/HzDmq7sqIsB3/YQMfOcgLONO9HxokMtkQyHFvtgEkX644QGXe8si7oygOXu3nOOQ7dTjtoN0nw8Jsb7RcE1bVD5xgexvHWOQUeFvqLc7Y15PmUX2jOCk576bnTRGrNKhCKcazoVJoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758865715; c=relaxed/simple;
	bh=kGtUHGS91msd+xLGpw+kv13UN9tVyD2geDfwaYQDc9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMzOsf0jV6DW4ceY9u6HViA1NJfGwcfBtMr1S33ZHNawmHhJ75jQDgt2X3j+71dTDJBz2APVbCvzhIR8PlwJPEeoaw8RUTGNK/UQla7Ncog4pi5vgHcZdPy3fIZC0zVydbVBYLUxbOtc0f4FIyafZq/geyCg4WGBoFsEqBYTB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGrT5i1E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGrT5i1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758865714; x=1790401714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGtUHGS91msd+xLGpw+kv13UN9tVyD2geDfwaYQDc9U=;
  b=EGrT5i1E/xH0Q9NlNbhymyfO6VE6T8+R1LBVJAWYgIIjIZUr+iDKtOSs
   314i97o204xuDXfTKBTQD1q1TL3K6vxCzuCLTyKgSsF95eNr6JW4ehCxm
   M9610kTN1iTD0ez9/r4hQz7mYhwaEAHl2U6jmaevQPdXTptwHr7V62V8e
   oUe+7N6kVh4G8IJZ1zQouDScFlUn5Yy1kDD0PJ17YHEEXFXMiHijiVhLS
   Ljc70RRolmMrVIz/babIcaouLxyEf8pTsHn/XA1sj92oNZD5zlw6XHhZV
   QEtgCJHJA9DFHq5m08AO/AfIfzu1dodOpROlE+R26N4cUVyQNUbHths3/
   w==;
X-CSE-ConnectionGUID: luhuctHsQ/2yp3WlrPNjCQ==
X-CSE-MsgGUID: qgXJXIQAQwKJ6w7z9U0lcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78628558"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="78628558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 22:48:34 -0700
X-CSE-ConnectionGUID: atAcMg20TKSvdVnD+6yM5A==
X-CSE-MsgGUID: njBjIm1RSn2TYerxhAMNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176642508"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2025 22:48:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v21Jm-0005wf-02;
	Fri, 26 Sep 2025 05:48:30 +0000
Date: Fri, 26 Sep 2025 13:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <chao@kernel.org>
Subject: [chao:cleanup 2/2] fs/f2fs/data.c:332:39: error: expression cannot
 be followed by a postfix '->' operator; add parentheses
Message-ID: <202509261311.c1JiZZxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git cleanup
head:   ea458a3f3d672b53286ed7058ba33a95c0713cac
commit: ea458a3f3d672b53286ed7058ba33a95c0713cac [2/2] f2fs: use fscrypt_finalize_bounce_page() for cleanup
config: x86_64-buildonly-randconfig-002-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261311.c1JiZZxU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261311.c1JiZZxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261311.c1JiZZxU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:332:39: error: expression cannot be followed by a postfix '->' operator; add parentheses
     332 |                 fscrypt_finalize_bounce_page(&&folio->page);
         |                                              ~~~~~~~^
         |                                              (      )
>> fs/f2fs/data.c:332:39: error: member reference base type 'void' is not a structure or union
     332 |                 fscrypt_finalize_bounce_page(&&folio->page);
         |                                              ~~~~~~~^ ~~~~
>> fs/f2fs/data.c:332:34: error: use of undeclared label 'folio'
     332 |                 fscrypt_finalize_bounce_page(&&folio->page);
         |                                                ^
   3 errors generated.


vim +332 fs/f2fs/data.c

   316	
   317	static void f2fs_write_end_io(struct bio *bio)
   318	{
   319		struct f2fs_sb_info *sbi;
   320		struct folio_iter fi;
   321	
   322		iostat_update_and_unbind_ctx(bio);
   323		sbi = bio->bi_private;
   324	
   325		if (time_to_inject(sbi, FAULT_WRITE_IO))
   326			bio->bi_status = BLK_STS_IOERR;
   327	
   328		bio_for_each_folio_all(fi, bio) {
   329			struct folio *folio = fi.folio;
   330			enum count_type type;
   331	
 > 332			fscrypt_finalize_bounce_page(&&folio->page);
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
