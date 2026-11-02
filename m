Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635171;
	b=wI/7IedVaL2zy7FAXyUNmcicCqNq1/06GY4rmgq5GBhVqp1lJfUT0UPUuZWFvA489vud
	 mgz1zSkaekCdH78ZxbYNSEMWeyDO/7Y8X3N2Nonq/ICPIRfzzHmlLRf3dhXjSnIPSyG/S
	 9N69kzndl1VFVQ2MsDCkjNbVUl7EqjSJG6vsWxA13aSvmFF86SndUxcD57LuS7RTC06Wl
	 51+XocumFlYs769xk4BChctI4By7H7AZftQH3NXUmCyg8jg1OQXZws8JlrpaqjE5/lLBT
	 KDgUo6hjLMHRKJz4BqiNoRQmPenoBHXv88RJI/Qy7pWijRf7L9R76zK0b1CsFMQC4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D0i2eJhct4lVnv3jYqFiTKy7E3ET5Ck8DgYNv8uqdd0=;
	b=dM/tAZELfp1KOmiJP65GA8C5UOaOFCGGj2jtqXmZ4NObPFn4zngWbzYMG4AnkDPpDKcw
	 DhDkwJ5vFWAPXeju6xxJeDnIdRqIey4jqoyBxyICfpSSA77gm9ue8id7GcYnis8lJDT31
	 gZG0Y/atZRsCusz42308RY2or3pVgvvh475kjWCutLmaWH30dMQ54IhK5WnTpEEpD0NEY
	 z2dGR742SXcZ+n2ijsmiLDo8pPybMd1Eo3l5atNISqigfZMSwVee57FGpuxy5YgoMcLEF
	 61WCvm6nLyjfv0lAeQZlnNlTxTBIFok4GL7PAy68197bZmRlZe8Wv1NwNB5lXb0BO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgIlSrf3;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F69606E011;
	Mon,  2 Nov 2026 15:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F69606E011
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgIlSrf3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793635171; x=1825171171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jr72uMiZ8lu5SNyAIaR1hpnAnxC9sKbALEfjKIcjjAQ=;
  b=KgIlSrf3iFv8kVJgVNlnTeRoGYrrQGtyw5aYmfyUuDV+u0OIPJU+ih3a
   AiwOzOcTjFiejWc4DEAdJCchcZq4QXIpmIw+x3m6MFfgodl390oAsWSWa
   q98k6oVKyZw6HON5UUvlufn6gEcMqTBX5sy6hb91I80/JLVIH1TLF1UdS
   htrr7cZszZUOoPTGWAIObTUfa0C6jHBNxLbzrCqXqIr0Ja8+dMpfdozim
   q/qxCM2nfWnA+PVnabNh4IC+X8RTGEyYarqVuluQOpL/cCPIVuK7bKZ8S
   aJY4uSqE6WXIbv+hBv3vuu8CZxp0kiDkXcuE8G0F+xgcxlo1wuySnm7HN
   Q==;
X-CSE-ConnectionGUID: 3tdQ+mHCQhKPXsxTCTLuSw==
X-CSE-MsgGUID: XqZQNl/JQXmczAYeCd4azA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2345742"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2345742"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:59:29 -0800
X-CSE-ConnectionGUID: /5C42JiUTUujHcmaqrrNPg==
X-CSE-MsgGUID: wPutJd7vRz6N5JHbqLgYMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="7947234"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 02 Nov 2026 07:59:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNuRQ-00000000hFQ-3mJR;
	Mon, 02 Nov 2026 15:59:24 +0000
Date: Mon, 2 Nov 2026 23:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Adam Davis <eadavis@sina.com>,
	syzbot+a31cda410a4ccd419712@syzkaller.appspotmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, axboe@kernel.dk,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] loop: prohibit the use of sysfs as a backing file
Message-ID: <202611022315.fQUGv982-lkp@intel.com>
References: <20261102103354.427722-1-eadavis@sina.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102103354.427722-1-eadavis@sina.com>

Hi Edward,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/loop-prohibit-the-use-of-sysfs-as-a-backing-file/20261102-183354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20261102103354.427722-1-eadavis%40sina.com
patch subject: [PATCH] loop: prohibit the use of sysfs as a backing file
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20261102/202611022315.fQUGv982-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022315.fQUGv982-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611022315.fQUGv982-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/loop.c:537:41: error: use of undeclared identifier 'SYSFS_MAGIC'
     537 |         if (file_inode(file)->i_sb->s_magic == SYSFS_MAGIC)
         |                                                ^~~~~~~~~~~
   1 error generated.


vim +/SYSFS_MAGIC +537 drivers/block/loop.c

   528	
   529	static int loop_check_backing_file(struct file *file)
   530	{
   531		if (!file->f_op->read_iter)
   532			return -EINVAL;
   533	
   534		if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
   535			return -EINVAL;
   536	
 > 537		if (file_inode(file)->i_sb->s_magic == SYSFS_MAGIC)
   538			return -EINVAL;
   539	
   540		return 0;
   541	}
   542	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
