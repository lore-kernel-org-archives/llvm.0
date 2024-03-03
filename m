Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0B41A80;
	Sun,  3 Mar 2024 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709488081; cv=none; b=CUoGeUPzXteZOM+GH3srmcToyLxwvhJYCsJMYCIf3grcPugsepix1baOzlQUp8Hw6sqI25RbYt8U6tk4K+I5Q8/VS52m8DKYElgdZ4VvBDEoL6tLW1ouH4EUGJ4zya5o3eIM+zd1ulUeemuWMFuqEJGdaRwxuzuoVX+PREaaOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709488081; c=relaxed/simple;
	bh=OiW8viBgyZlAs6LQRlt3Pdwe9dErtAADvRARLmqDSjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dnvyoy04hs5xU/VPdEBv9kaw2uVN6lKmxj373O857B/WNFDi/9CeMtGM4DUYhlVvLY/MFyKr0mixNXjVn+7Huay4euvSUUmngciymdtFlcoelROy8fb19AgIX6mYmQ+kpRml7dFzgOjl6azX5b5oSOmimdPSuDuPbBZX1I5dyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEROl7dN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEROl7dN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709488079; x=1741024079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OiW8viBgyZlAs6LQRlt3Pdwe9dErtAADvRARLmqDSjg=;
  b=aEROl7dNkbXguHJTh/n4lwl304iw4QYn0AuGeDMGgZnXQA5Yr4gPAvZI
   8GXwZFDa6MRObg+vV9eKEdpzkscoEXqXcWWmFkpXstPSDQM32E1GBOR5k
   SkwBa+4UMxFuHzIItp7lOz7WOWGxF7EasPS9WqPpaDefdfDEEtlEiSfbp
   k5LerJmMcp3Q5ZkEC9Vn8WKxJMCXRk8o9faCq3O+kr8cCyxtrYEnNf2fU
   Uorp0E//q5o0m816oIE10a1B4/VSx1LkTngGxvDtR+RGExjT1g5oNuFWf
   s0aJFtQ2e8z2Ij7MPrPU1Lw9u9s/xGp/oBvwJtyvvSlnsxKmuM2XedHXg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7786141"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7786141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8892405"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2024 09:47:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgpwI-0001zc-2T;
	Sun, 03 Mar 2024 17:47:54 +0000
Date: Mon, 4 Mar 2024 01:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [linux-next:master 9800/11394]
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:574:33: error: unused function
 'pdev_to_xe_device'
Message-ID: <202403040112.jDE7nwFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: 3f0e14651ab0ca340c4b6f77b2ea615605fcf8f8 [9800/11394] drm/xe: Runtime PM wake on every sysfs call
config: x86_64-randconfig-076-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040112.jDE7nwFC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040112.jDE7nwFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040112.jDE7nwFC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:574:33: error: unused function 'pdev_to_xe_device' [-Werror,-Wunused-function]
     574 | static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
         |                                 ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c:579:33: error: unused function 'to_xe_device' [-Werror,-Wunused-function]
     579 | static inline struct xe_device *to_xe_device(const struct drm_device *dev)
         |                                 ^~~~~~~~~~~~
   2 errors generated.


vim +/pdev_to_xe_device +574 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c

   573	
 > 574	static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
   575	{
   576		return pci_get_drvdata(pdev);
   577	}
   578	
 > 579	static inline struct xe_device *to_xe_device(const struct drm_device *dev)
   580	{
   581		return container_of(dev, struct xe_device, drm);
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
