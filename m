Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44122313;
	Wed, 13 Dec 2023 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnLC+47Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702462012; x=1733998012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wt46aTT4AdfL9P9gCxMraEWkImaA94dGPx8Sl9GvCmc=;
  b=jnLC+47QEKmUm9A0goGtT3du6jf09/Q37wWyae5IpNdPnVo4e61FuU21
   re+dnOKFRXTQnwIRuiRpB0+q+Tx6Mobu7PES0w1C4kf7k3w+Xj1TsnSbo
   pF0GLWBak1XT1tEpU4XYAvXieWJMeYbwmQMNUHIVYzXmEQK2DczqCB5rM
   b8BTxdJZLWyxodvwAs109fjdQjUFA6FYqG/g/zIZv4ZFlvLN7oryuGQ5C
   09dXyzXMWcdmfOS/Rph4/hg+HsNRu+44mPeoGGsOAmIER0/544H0GX498
   iRmn9WXuv/9XDySnu0sR4hJBbTcISZOBDKDj1IF0FcVuQuAx628yeAFxP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2114171"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2114171"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 02:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1105261279"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1105261279"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2023 02:06:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDM8G-000KNY-2N;
	Wed, 13 Dec 2023 10:06:29 +0000
Date: Wed, 13 Dec 2023 18:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7115/7300] ld.lld: error: undefined symbol:
 __bad_xchg
Message-ID: <202312131823.hO2NP34f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 4a0d72ea10ce156eb2269358fa38528f62a96081 [7115/7300] afs: Overhaul invalidation handling to better support RO volumes
config: arm-randconfig-003-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131823.hO2NP34f-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131823.hO2NP34f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131823.hO2NP34f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __bad_xchg
   >>> referenced by callback.c
   >>>               fs/afs/callback.o:(__afs_break_callback) in archive vmlinux.a
   >>> referenced by rotate.c
   >>>               fs/afs/rotate.o:(afs_select_fileserver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
