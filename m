Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4DBA33;
	Wed,  1 Jan 2025 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735703491; cv=none; b=ovtWELIGo/kqeJkcJJ068I+/Xmss831nZiFAC9NXbeEToDf5nNCfraX2HFytuFO7QxB6eFC2edZE8oGvAb96QezHDz3hc9hadIXiicCZqY17k9EeHm32dU3Mm4f4jmDfvnCQtzYZAB076B3DawyPv2HXPptTPfpnpIIQuDY6eTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735703491; c=relaxed/simple;
	bh=Ar9EXi84cqAA9J2Z+GuokX9NHXTEilVAdGsUO0pBV84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZiQTMVRPZbQ7S9m4cr0qC9AX5AgGYmZAfrgBRRExak5+1WZH84m146JsqWNtb3uScY/5mFl5Evq4i9DzBiWzXAgb9XJ9G5b8t4b80mDjyXfoIJa6bvk9R/svNQ1RXo/UunZDw1C3m+nWoZikPcdkUw600wT96SKZWvhEJ2pVoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gC2DwQrD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gC2DwQrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735703490; x=1767239490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ar9EXi84cqAA9J2Z+GuokX9NHXTEilVAdGsUO0pBV84=;
  b=gC2DwQrD7ZlMGiBlxFLXcU8Oxc1N0Cw+h4aZfmlB/JNSfUGrMhSVM4sF
   KE+cot5CZSAyUuS6AWTR26sJ6n+ExLspZYypNkuVXqd3u2diYRYOwuspE
   PSvf2v9/eQwtHudhxP3g+L//bC96fAXe0Kpmz3fE+qEAl9VlaJwcI6CnC
   Syf4teaIWatvuXNe61K9DgTsKeB2/NPrbtDQmVZDn+I8R/bl1SQLZZFZA
   /90Cz++ssQLhkMsbyW4bhTtrsCDGMsCIB64VMdbVFVZlYRczoc+0x6vpd
   02+baeDe0HAnwIQJ7j3cw5V+ZZ3ZC2S41nG9M3U/F94a9cVmB/EzywTj1
   g==;
X-CSE-ConnectionGUID: hYo3YBbGQweJ+aVD2/RAlg==
X-CSE-MsgGUID: gaaa2f7VShaNWne1IgP4Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35216452"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35216452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 19:51:29 -0800
X-CSE-ConnectionGUID: v05cLbamTsGsmg7JqteeLA==
X-CSE-MsgGUID: fQVlsqVhQWCw11ZOJWQskg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101358434"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2024 19:51:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSplW-0007bz-00;
	Wed, 01 Jan 2025 03:51:26 +0000
Date: Wed, 1 Jan 2025 11:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.debugfs 9/20]
 drivers/net/wireless/broadcom/b43legacy/debugfs.c:308:34: error: variable
 has incomplete type 'struct debugfs_short_fops'
Message-ID: <202501011134.jCj6Z1gL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.debugfs
head:   7346de606ecf837810eb4f5cb7aca73beaba43bf
commit: a444dfe1f8508714a93fd5e7aed69d737bc6aa5f [9/20] b43legacy: make use of debugfs_get_aux()
config: powerpc-pmac32_defconfig (https://download.01.org/0day-ci/archive/20250101/202501011134.jCj6Z1gL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011134.jCj6Z1gL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011134.jCj6Z1gL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/b43legacy/debugfs.c:308:34: error: variable has incomplete type 'struct debugfs_short_fops'
     308 | static struct debugfs_short_fops debugfs_ops = {
         |                                  ^
   drivers/net/wireless/broadcom/b43legacy/debugfs.c:308:15: note: forward declaration of 'struct debugfs_short_fops'
     308 | static struct debugfs_short_fops debugfs_ops = {
         |               ^
   1 error generated.


vim +308 drivers/net/wireless/broadcom/b43legacy/debugfs.c

   307	
 > 308	static struct debugfs_short_fops debugfs_ops = {
   309		.read	= b43legacy_debugfs_read,
   310		.write	= b43legacy_debugfs_write,
   311		.llseek = generic_file_llseek
   312	};
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
