Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7507583A19;
	Fri, 19 Jul 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721407600; cv=none; b=U43uNSrZc8lcga5vOB+EZdsKqYrUhgefUFw+WAXESW/kt3/QOdsVzFHERMAB0xyx7skQJvQrhW2XV+PHON2LR4XHr9F4Wnrglpb1Sn5zx3w2XDSTYMztB2NiyYW8tPCg02JSdeV7VvRDT2h13uDtWDgbsL5hC70aGemeXy//PEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721407600; c=relaxed/simple;
	bh=PmrGwqy0/+HzH7eZ059mo1x8pB+3UOaTmrMBrm7BtHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bc2xvzJRzLM4rGXIULVl7z6IwHTaxhf0HbTlkCzJFO5u4wdKO8eXCBB5hwyGmribtNdzY+9yDrEyt6doA1hlmKtm/dgUL3FdB+pLs8J4FsXAxNH7Ymcge3S2q6g9awFDqqhEZ8ByP8xx73KIghIFjIKLIpZoe5ni2RQmQwIJUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df+x9Qmg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df+x9Qmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721407598; x=1752943598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PmrGwqy0/+HzH7eZ059mo1x8pB+3UOaTmrMBrm7BtHg=;
  b=Df+x9QmgWeJontjfky818wa909Jy1dYdt/jjjl/L73f3epIUk9n5Yiq9
   6EezHD7y6BJ1diSZR+BMy/OKxp6N6T51UmE9y/IkvwoTQPVVyMfCcYrAi
   r+b/p8erm1vl6oyr05YrWf5F5Oj7j6jyt/bSGoTvzJPAuRMoGFCcrx0aK
   BxlXV90mrbxiF11Y//RY/z7Q9Xn7mmRcWJeC9eJ7Zaj0fDh51wdORJTxK
   +H+FdXNVaVWWQgy0dUQGD+q0bPXjJqDKF5d1ZP4zpAhjQsPwAYs5UDmbQ
   RQIa4DNfb9nsQyGD7DljThFVTN/itqdOgqJsQWSfR+E3dNQgFaa5t6I2A
   g==;
X-CSE-ConnectionGUID: 3sufJMeRQMmrwNPkObSNcA==
X-CSE-MsgGUID: kL0uZnNAQFeivgQ7yY6JVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="41555140"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="41555140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:46:37 -0700
X-CSE-ConnectionGUID: Rl8sNf1CRbiV9p6b/7LxOg==
X-CSE-MsgGUID: 1Yp9yM0PQOmG/WvE0gDfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="50849575"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jul 2024 09:46:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqkc-000iOY-1X;
	Fri, 19 Jul 2024 16:46:34 +0000
Date: Sat, 20 Jul 2024 00:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.mount.namespace 6/6]
 ./usr/include/linux/nsfs.h:30:2: error: unknown type name '__u32'
Message-ID: <202407200025.xjTcP74I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.mount.namespace
head:   e35c75b426e13d08020c7b9884f2db4fe15b0cbc
commit: 6972489d7aad005e2a31990058a015e344f6aa4e [6/6] nsfs: iterate through mount namespaces
config: i386-buildonly-randconfig-002-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200025.xjTcP74I-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200025.xjTcP74I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200025.xjTcP74I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/nsfs.h:30:2: error: unknown type name '__u32'
      30 |         __u32 size;
         |         ^
   ./usr/include/linux/nsfs.h:31:2: error: unknown type name '__u32'
      31 |         __u32 nr_mounts;
         |         ^
>> ./usr/include/linux/nsfs.h:32:2: error: unknown type name '__u64'
      32 |         __u64 mnt_ns_id;
         |         ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
