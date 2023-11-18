Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47512B99;
	Sat, 18 Nov 2023 18:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FE/rPAMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700330468; x=1731866468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fR/gWG7UmZHUHWCZlMrp2CAg1hcutB2g53mZc9fLZxk=;
  b=FE/rPAMK8DYfg0b48zITXaxeJEGCV/TVlSJ1TCoj4UoNbPGxJo4eKCDj
   y1QQsLlfaq8o4lX6bMG4YpJs9syrk1Qd6mSxOOaJOj7wv+KhQNy10cxiX
   9RJf0IdAtzVGPxr+TgB6Z4e71f7qXjOC0+6IzjPUQTmlGVENwuQ+/My/n
   tyEAmHvcTfFRJVN588KDUvYdVHUQ9E0kcmlmdN3oQcCr9EV8Rhd7W7jgQ
   83KHSmcOCzMI9VyFmMm+uyHfjvuecbThFMSX7WCAGJg2tkaxrDQUBw3Og
   PXhFLRkft7W2d9oi778vpm06gn2XAcVVsB7vEqlIS81TluaVaue5p0Kq5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="4546116"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="4546116"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 10:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="759442521"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="759442521"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Nov 2023 10:01:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Pcs-0004A3-0w;
	Sat, 18 Nov 2023 18:01:02 +0000
Date: Sun, 19 Nov 2023 02:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 30/51] ld.lld: error: undefined symbol:
 __fscache_clear_page_bits
Message-ID: <202311190125.2FitEByz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   63aa4c69f32c9443f9e93ca8cbbdd692c5970119
commit: 1e16f3e3eb1f420959b3399abce55fa1d4776429 [30/51] netfs: Provide a writepages implementation
config: hexagon-randconfig-001-20231118 (https://download.01.org/0day-ci/archive/20231119/202311190125.2FitEByz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190125.2FitEByz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190125.2FitEByz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __fscache_clear_page_bits
   >>> referenced by buffered_write.c
   >>>               fs/netfs/buffered_write.o:(netfs_writepages_region) in archive vmlinux.a
   >>> referenced by buffered_write.c
   >>>               fs/netfs/buffered_write.o:(netfs_writepages_region) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
