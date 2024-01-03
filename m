Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C518057;
	Wed,  3 Jan 2024 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADjBoUcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704271776; x=1735807776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V46QIVu/w6IKzB/axNhw4sdC3a/BRufG9OsVwZWmjuY=;
  b=ADjBoUcnrzE5ZAH0KudUXYJjHNx4ztU/uPZYHhtds6EWLK8FPWTGLZOs
   R3K7Yn8++OrXjalILq6LPpBRqCfOSzT6+wFrdsbCeYheb2SnCuUVg4fOW
   Q27IZSnMqcwEFfesXKtK85JNR8fDJYsbljbAOGD9r4pjzLPDtdTttcimi
   am46u2VCJC4tGNQ7uloJfMYxWqLYnhAJHGxMshmDdKCmnW/RfR0OO/nnV
   8UOb5Q18CFfwION8LOYUHvMXxsqGpL85+OBG6ogdL/LxI+gHgB8H04OXf
   j3iWhyAIQXVYpORw6Uq44AKJ+09HDNKZ6BIGpeZyIOyBive23o6ntf6Lp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483165845"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="483165845"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 00:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808774486"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="808774486"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Jan 2024 00:49:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKwwM-000Lra-1q;
	Wed, 03 Jan 2024 08:49:30 +0000
Date: Wed, 3 Jan 2024 16:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>, Christoph Hellwig <hch@lst.de>,
	Liu Song <liusong@linux.alibaba.com>
Subject: [linux-nvme:nvme-6.8 4/16] ld.lld: error: undefined symbol:
 nvme_ns_head_ops
Message-ID: <202401031629.T2JS4GwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.8
head:   3b99fc0cd3a7e44fb294d9f6c13173f3dadf4136
commit: 44bc827e396809faa6a4e2dc9bd5f148373ce88b [4/16] nvme: introduce nvme_disk_is_ns_head helper
config: arm-randconfig-001-20240103 (https://download.01.org/0day-ci/archive/20240103/202401031629.T2JS4GwS-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project baf8a39aaf8b61a38b5b2b5591deb765e42eb00b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401031629.T2JS4GwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401031629.T2JS4GwS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nvme_ns_head_ops
   >>> referenced by sysfs.c
   >>>               drivers/nvme/host/sysfs.o:(nvme_ns_attrs_are_visible) in archive vmlinux.a
   >>> referenced by sysfs.c
   >>>               drivers/nvme/host/sysfs.o:(nvme_ns_attrs_are_visible) in archive vmlinux.a
   >>> referenced by sysfs.c
   >>>               drivers/nvme/host/sysfs.o:(uuid_show) in archive vmlinux.a
   >>> referenced 15 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
