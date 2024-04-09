Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFA4657A3;
	Tue,  9 Apr 2024 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712633196; cv=none; b=b2HZwrePxiYmFdMEj5UAztQTlcG9NXRJuY97EyRIpb8GTG+Fx2cWdQ6QnV4A9TxW5+xbtttl3W92C6In1EHVLW2AvALyFpwT7A93SHFoTyO6HqlqvfMh2OlrRG1M+goQfuJHkv5wC+wM6pUn0ypo6n3Hysaxgr+q+Nj1niqI1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712633196; c=relaxed/simple;
	bh=82XYRuk54f5H8P+Kuw40DhmOp0L3xqS0F7Ok55GMhi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eh8JTsVLLRtidHVIwaxWxGjMThyI1Alp6ODUS9qyYuhndTGgwPMdO8qdSlmwwaXF4WTUoCG3qt0lDehcgR6HN5rIsS6HtWOcX5ubYwrkD/b/sMC9qhvvWLGkb4PAVk7y60PtprGR5PGPKlchBeCrrm4WUfkrkbjTIiNamx4PHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS6UZAbr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS6UZAbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712633195; x=1744169195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82XYRuk54f5H8P+Kuw40DhmOp0L3xqS0F7Ok55GMhi0=;
  b=OS6UZAbrLXhe3AmxwxERb14k77Ee82Mav815TRRDn4z9xzOeMvGqWQMa
   53gmZOOdBbfDAVRCK7h1coontuFTW8sctgG2ipvApp+zqrWu4RSlgIXDw
   BXzlc9x+Lv66GVIO5y+UP78xVgRUsmGxM+you3kDk3l6ABgfc4cWEtGDG
   jQ/ePKwTQR0Xk3i9eH0DNYazIdLS/n3jcfXcnZBAXAHIo3hnV6PwWtbXa
   uKjOEddWKAx4PBcST7KGZp+nSQ5NlHecDW63A9F1hYpi0Uq335AIxzpw5
   iDnhOC5mFzp526lrFLyQ8ha4bL8yR+uIefveGmMRfQaiKqz9rF77Qua3t
   g==;
X-CSE-ConnectionGUID: bX2Gm5XpTtu7f3P6P/Nj+g==
X-CSE-MsgGUID: 1jPAo4NyRxSGOaFKmc1rIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30426117"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="30426117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 20:26:35 -0700
X-CSE-ConnectionGUID: xcXMV3hRSEK1AzjI6GDaLw==
X-CSE-MsgGUID: LlCF30tVQ8GnpYE/rBVNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="51100397"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2024 20:26:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru27y-0005gI-2A;
	Tue, 09 Apr 2024 03:26:30 +0000
Date: Tue, 9 Apr 2024 11:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 85/222] drivers/mtd/ubi/upd.c:380: warning:
 Function parameter or struct member 'from' not described in
 'ubi_more_leb_change_data'
Message-ID: <202404091122.S1B50Aop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b753e0233329ee0ba1a112274adf052c0ac2e84a
commit: 5dc5cc2a53d9dab1f3b386c052029f18d302c6bc [85/222] drivers/mtd: convert to ->read_iter and ->write_iter
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240409/202404091122.S1B50Aop-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091122.S1B50Aop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091122.S1B50Aop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/ubi/upd.c:380: warning: Function parameter or struct member 'from' not described in 'ubi_more_leb_change_data'
>> drivers/mtd/ubi/upd.c:380: warning: Excess function parameter 'buf' description in 'ubi_more_leb_change_data'
>> drivers/mtd/ubi/upd.c:380: warning: Excess function parameter 'count' description in 'ubi_more_leb_change_data'


vim +380 drivers/mtd/ubi/upd.c

e653879c269735c Artem Bityutskiy 2008-01-24  363  
e653879c269735c Artem Bityutskiy 2008-01-24  364  /**
e653879c269735c Artem Bityutskiy 2008-01-24  365   * ubi_more_leb_change_data - accept more data for atomic LEB change.
ebaaf1af3e9ef05 Artem Bityutskiy 2008-07-18  366   * @ubi: UBI device description object
e653879c269735c Artem Bityutskiy 2008-01-24  367   * @vol: volume description object
e653879c269735c Artem Bityutskiy 2008-01-24  368   * @buf: write data (user-space memory buffer)
e653879c269735c Artem Bityutskiy 2008-01-24  369   * @count: how much bytes to write
e653879c269735c Artem Bityutskiy 2008-01-24  370   *
e653879c269735c Artem Bityutskiy 2008-01-24  371   * This function accepts more data to the volume which is being under the
e653879c269735c Artem Bityutskiy 2008-01-24  372   * "atomic LEB change" operation. It may be called arbitrary number of times
e653879c269735c Artem Bityutskiy 2008-01-24  373   * until all data arrives. This function returns %0 in case of success, number
e653879c269735c Artem Bityutskiy 2008-01-24  374   * of bytes written during the last call if the whole "atomic LEB change"
e653879c269735c Artem Bityutskiy 2008-01-24  375   * operation has been successfully finished, and a negative error code in case
e653879c269735c Artem Bityutskiy 2008-01-24  376   * of failure.
e653879c269735c Artem Bityutskiy 2008-01-24  377   */
e653879c269735c Artem Bityutskiy 2008-01-24  378  int ubi_more_leb_change_data(struct ubi_device *ubi, struct ubi_volume *vol,
5dc5cc2a53d9dab Jens Axboe       2024-04-04  379  			     struct iov_iter *from)
e653879c269735c Artem Bityutskiy 2008-01-24 @380  {

:::::: The code at line 380 was first introduced by commit
:::::: e653879c269735c9ff6684e03edf1d4e041ff3d3 UBI: implement atomic LEB change ioctl

:::::: TO: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
