Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2E345CA1;
	Wed, 17 Dec 2025 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956876; cv=none; b=iMgFW+0z82twK1kpmcPWLzODJgeVHpky1GUlxIX3nMj2lM4R7qPen1PfSgSNldNNunauzobJrPs+Gu1TJxduFYctWZi/3oswBsj7Rtw8iRZ0SQinEc36/8hMGsrXtvtQk6H7xv3vWko4UZaMQmpK1VbUW4LeOKUExZqRbN5EXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956876; c=relaxed/simple;
	bh=2z0McsjTOB+P3exuNFKH0/lauyHMHNPjxuqumEYpnPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yb+uctslbMECUXQl8BaKT7K35Ie4LNADHi19XjuMoqHT5ojfbWc5qqYpxpFuPW486dNzBVX/Jyu/o0fi8h4lPYvGkQnSVEeMJpIWZjIaCM/QE6bwiS4PjUH4qGym80+8p5x6F0lsEQylGd3ySj3IVaOIdSm2AZ/uO1BTJV4W3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZsuyYOM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZsuyYOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765956874; x=1797492874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2z0McsjTOB+P3exuNFKH0/lauyHMHNPjxuqumEYpnPs=;
  b=XZsuyYOMD13UTpecO+oRcYiA/lV5NKUJM9v4QVbqbKgOOwv48x3JcK8X
   kW88pncXxiyy07k5bsHbR031kjQsYp9svlGX5e6jnzWAFh83E8cIfFrdZ
   awJm6xverWXbb8kPs4jCTA/vmvfE8tef0X6yfQhfZkNQhJVOEKf/O67Lc
   WDYKj75LoQJs5pasNfDi8hieBb24ul5klpw9oCyJdmPJrJ6QLHrAB5cFe
   UMtbuKWJxdbd1qmizJrPTco1sMHATngiBCMZrUAZ5ILYgKY63zDzqNhWL
   xO9BsrlDUV36b24j2QjulV1Salw+31zDd2ylJy8JNwLvmu4itrzGleh2X
   A==;
X-CSE-ConnectionGUID: hhbs340RTMaeMC8Fd25ZPQ==
X-CSE-MsgGUID: 24Wm3QecTo27N4jROxEGTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70466158"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="70466158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:34:20 -0800
X-CSE-ConnectionGUID: CKayANs2Rw6D0QUgkGHKFw==
X-CSE-MsgGUID: xijq41dUSPiwjI6RGGZ3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="202733148"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 23:34:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVm35-000000000AH-2k25;
	Wed, 17 Dec 2025 07:34:15 +0000
Date: Wed, 17 Dec 2025 15:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 60/60] ld.lld: error: undefined symbol:
 envp_init
Message-ID: <202512171554.G484xf2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   88800d4048f5ffd0dfd05dd82b89affe6b74e55b
commit: 88800d4048f5ffd0dfd05dd82b89affe6b74e55b [60/60] init: mark envp_init as static
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251217/202512171554.G484xf2C-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171554.G484xf2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171554.G484xf2C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: envp_init
   >>> referenced by do_mounts_initrd.c
   >>>               init/do_mounts_initrd.o:(handle_initrd) in archive vmlinux.a
   >>> referenced by do_mounts_initrd.c
   >>>               init/do_mounts_initrd.o:(handle_initrd) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
