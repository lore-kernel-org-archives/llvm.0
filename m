Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380D2264B3;
	Sat, 19 Jul 2025 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752928397; cv=none; b=gk/rcg9a8SCU/cLWkCc6QEd3z0XHgSTfP2WRvEFHLQuZ0wRii6TTYv1580aNebGHSvzzdOsvckp8hBebvCzAjL5+KPaZmKg4/teBvnV7Hf2pz9vpTtyZS2o7okCYpaZN/UtLs3T/bew+KTvWrL/NiNjcO7pwJVkcZvx9ou55Be0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752928397; c=relaxed/simple;
	bh=OoWTn86S/wzPfInI0YVYIOh8btez0qEmOg3YNqB057E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwmvtE0n/reY/n7jb+C6l9bkg4+YFxI2ebNshzwDf4ydb1A/kBFF6EBtucwzH9qZtJpRBxNwrScKXYI1Tj7+IBaPk4eaosJduxQJqzHyUWNbVaG7DPUMqoUEiRxnhV8fqB7zD3LzPvZi+/xiFDYfGFrNj5coGVJCGea+3nsffsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+H2BOuw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+H2BOuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752928395; x=1784464395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OoWTn86S/wzPfInI0YVYIOh8btez0qEmOg3YNqB057E=;
  b=n+H2BOuwF6ARHmfGkZAPbgwQHJ3gIEQnzHodd1/PtiOoDC/dL/XUQdF6
   CVD7f6kjEDmkiFepS6NY+0PCTxduFdEhcwCQnjZMXp4b8laCrGwD9kk1R
   QaJH49bL0C9YU75cxKHulwB+SeMgbW7P1X/ITkNkxGgQnpKgh/xUtxdve
   /d/PdXM704KEewo6hWZR75A6ltgkUEjUsKJsxOukymCvIIcH5SuE1rKOm
   x+wgcO9Sm42P7ft8FOm4o7vx0EaqAKHhKfb2gLH6crXSqWlOfhbr2TnXK
   oU7h8edlL57UPZHn+OKiGECRN6uxYzRE6ffNQm2qbYCFqgCObE5MDSI3T
   w==;
X-CSE-ConnectionGUID: goBq0bTcSi+ly5JQtaXOZg==
X-CSE-MsgGUID: XGryt+URRMSx1LyCTbV1dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55088142"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="55088142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 05:33:14 -0700
X-CSE-ConnectionGUID: jC8b1ftnQ6uby/bxzkdHAw==
X-CSE-MsgGUID: BeBpsqEZQhG0cN6nKOTDEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="189417871"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jul 2025 05:33:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud6kW-000FUN-32;
	Sat, 19 Jul 2025 12:33:08 +0000
Date: Sat, 19 Jul 2025 20:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zizhi Wo <wozizhi@huawei.com>, viro@zeniv.linux.org.uk, jack@suse.com,
	brauner@kernel.org, axboe@kernel.dk, hch@lst.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	wozizhi@huawei.com, yukuai3@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH] fs: Add additional checks for block devices during mount
Message-ID: <202507192025.N75TF4Gp-lkp@intel.com>
References: <20250719024403.3452285-1-wozizhi@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719024403.3452285-1-wozizhi@huawei.com>

Hi Zizhi,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on jack-fs/for_next linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zizhi-Wo/fs-Add-additional-checks-for-block-devices-during-mount/20250719-105053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250719024403.3452285-1-wozizhi%40huawei.com
patch subject: [PATCH] fs: Add additional checks for block devices during mount
config: i386-buildonly-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192025.N75TF4Gp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192025.N75TF4Gp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507192025.N75TF4Gp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: disk_live
   >>> referenced by super.c:1385 (fs/super.c:1385)
   >>>               fs/super.o:(super_s_dev_test) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
