Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC21EB45;
	Fri, 24 Nov 2023 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQYalG88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826452; x=1732362452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkbDOeOYge0EjkrYOBkWsAHJwKznbGhKxoZx43RMnZ0=;
  b=TQYalG88whndwacBiyM4wWAVi3+AmvNW/w8HeSla3OrcFv2ZZdGQ4FCB
   05xrhQfLcg45VwhGSNZpwXjViEfHoxxCWAB+BXvG7CLrXb7NGV7CcZhPZ
   jRmin07Gl0XT9ZnqfqbcTE4hSkH49i4omSOo6BINaGCguhcnBEnGBNbBl
   Ak5eoWgFahrNwm2TBWrHc/3diKkVKsqcZrQK198kn38mxUTX5duBSFGVx
   vldLW8Q0uPkX+YxtB0cWzN+EV62tX6i/Ayw6ocSDi55XBMcTu6d7lAWhp
   IhL29QkcYtc+42EykPTNx6B+Mf1VtOvhLxulIOcv5ZRvWJF9mK7fxaWPz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478620571"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="478620571"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="802159981"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="802159981"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Nov 2023 03:47:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Ued-0002i0-1r;
	Fri, 24 Nov 2023 11:47:27 +0000
Date: Fri, 24 Nov 2023 19:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 4/56] ld.lld: error: undefined symbol:
 fscache_init
Message-ID: <202311241444.Y5lrxS0I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   43d25b256ce0f02be1a82781479564cf3133700f
commit: 1393e680d493f18bc2c9537e7dceb14df64d0773 [4/56] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231124/202311241444.Y5lrxS0I-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241444.Y5lrxS0I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241444.Y5lrxS0I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fscache_init
   >>> referenced by main.c
   >>>               fs/netfs/main.o:(netfs_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fscache_exit
   >>> referenced by main.c
   >>>               fs/netfs/main.o:(netfs_exit) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
