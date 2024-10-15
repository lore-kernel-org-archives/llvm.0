Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535429B0;
	Tue, 15 Oct 2024 04:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728965011; cv=none; b=d5WgBRkbPdcVMWyQ3LK7yevo2aqDcFoKklregh7HuQHfmXgfQM1tInZZ6Oi9c2AnEV72YQeKGahnXg50G9T60CmNTsLfm3IhmcvXdxyIgC+jzmau9KlAbwOxKXt0TW0UjzDUN50ggKy/YjFKazV9cikjRcaLyGy1VOOaQR0pqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728965011; c=relaxed/simple;
	bh=IKYIrv6cb0AvKeI0XAJgpw7YWcN3IjM7mDZYi2DQhtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loQwBtFJaV8oL8vWnVPgYWskcMvYLrvUu/EzbVPL68iazdPsd84Q5+a0nKbq/xy8ennRivbi1F3JVoASvO1Cjwps/ROkf8kxDeQuKOWJAOZfv8Te8s6L0ZJcr5ABDr0gXU2GFZfTTw8zqItAJ0087SDJrrggf8VdbJPu2nEvBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWSZXbXw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWSZXbXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728965010; x=1760501010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKYIrv6cb0AvKeI0XAJgpw7YWcN3IjM7mDZYi2DQhtE=;
  b=eWSZXbXwE3WaEIqW4PjurcOOxbueDdrtdnJQevOEhn5HDEewJwIJzlBI
   7ioFb/W2i9leRfpwkUz+e+8mQ15cBNuEWhthrVsSH6gsoggclvgXLst5y
   yIeJY06Zhi4wXFC4fFq5rrgfWihLNDaHsFJ4yIVB+zUKO16oKY8NNhoIe
   ZMpy+Szy57689QAq7Gl7MeYv9eK/7rgHj7EuuUPvo1/AVxilBxrJRl3K9
   nPp1A/R2bUIc+sXazuOivNCmhrFDgXvII0wp3fB/0JP8qinDoVSZkuRrE
   42T0kUHjz4+TQCq+O7QZ1V0E92ijggG6KVFA+p25YaIeUQlk8JBaach4I
   g==;
X-CSE-ConnectionGUID: 5SpV/5sLReyWkR+m2ye/Tg==
X-CSE-MsgGUID: IbWMpj2eTQurMXO1QFqieQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45808536"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45808536"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 21:03:29 -0700
X-CSE-ConnectionGUID: rPvqviv+QE+rGzh/mje4JQ==
X-CSE-MsgGUID: dBq+V0VxTHKeD4Zi0jYgUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77940296"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Oct 2024 21:03:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0YmK-000HbT-2r;
	Tue, 15 Oct 2024 04:03:24 +0000
Date: Tue, 15 Oct 2024 12:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 2276/4178] ld.lld: error: undefined symbol:
 iomap_want_unshare_iter
Message-ID: <202410151135.JEnziQwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7f773fd61baa9b136faa5c4e6555aa64c758d07c
commit: 6ef6a0e821d3dad6bf8a5d5508762dba9042c84b [2276/4178] iomap: share iomap_unshare_iter predicate code with fsdax
config: arm64-randconfig-003-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151135.JEnziQwU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151135.JEnziQwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151135.JEnziQwU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iomap_want_unshare_iter
   >>> referenced by dax.c:1271 (fs/dax.c:1271)
   >>>               fs/dax.o:(dax_file_unshare) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
