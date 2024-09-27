Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6243C6BA;
	Fri, 27 Sep 2024 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727480575; cv=none; b=VOLpaLV5domc6/lKhOTocLNzCobtdiZjjnP52C7ktsnw0VdVywyheG3RNDYWgoDMhknKxIflh3bzo2Gwn3nISfWb3g+B9pUiGLVHrcAJJ7dD+4FOUuG9RiXNGGr8Jiz1hJmxW6wnltJ9Cvzrx1DVmFeS06cheTwOxD/GjqAQ2jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727480575; c=relaxed/simple;
	bh=xYlVVErfuKBZm9W1HWMlCrroWA/RnYKFDv8Vs3dNsTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8z0iIJOE3BLG98q9BOpiU1tF5Z3j1uf9l1G3cwAF0NzIyp4cC7UbP5a3HvxDO3pYlm828GmKk5ERY6cUTdGP091dQWAMmVAiXyd00PX/iFlUJi4tJbmtpBb3z+adimiPWzvbYS8UtWgG58usf77RsPTOqz2kyS5lNN51AMkzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtCitGKS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtCitGKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727480574; x=1759016574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYlVVErfuKBZm9W1HWMlCrroWA/RnYKFDv8Vs3dNsTk=;
  b=gtCitGKSy1SJyoNGU9jR6oHm34FYvH6223aAclrPFLCp89uNp9nAGIyK
   ZuIVpqq/kc21OqToARd4HV2310dPxBgC/oRRraS7ezuVwHTcC6MRs4/e9
   Q0rjnShiSUz1yw9nDiESVbEDzsEtH4WOpwfDxIpXw1EKN2ui9Mb5QQ2gP
   E8l235JEnnee2wfVAcY2cl0b4aPI5kcV9PHrBngp5COH/0qwQrqms8p2w
   O88E4M4j0Lfe7xgIB0GV+ElbZmLV7CU0XoJGfU8m3BWhwtADMoBbxJjmR
   oeJYD4Wi0W25Upkf5xKdKE6FAicxUhY0g7Mle8JYA6G8GgGfWKEpP8XcL
   w==;
X-CSE-ConnectionGUID: +MqV2HmnTp2t2csImXRZrg==
X-CSE-MsgGUID: GDGZocgtRym73Ajd4nMwCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30344643"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30344643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 16:42:53 -0700
X-CSE-ConnectionGUID: 1QM4w65QRieDqKogJff77w==
X-CSE-MsgGUID: F14uF5NgR9KPQ87JU5fCEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72566088"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2024 16:42:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suKbp-000Mjq-0i;
	Fri, 27 Sep 2024 23:42:49 +0000
Date: Sat, 28 Sep 2024 07:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:staging/rust-pci 3/12] error[E0050]: method `init` has 1
 parameter but the declaration in trait `kernel::Module::init` has 2
Message-ID: <202409280721.FOJLRNqe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-pci
head:   249ffdfb5019c0bd62b4b67d915af6c2c98ead08
commit: acde67c82eb0233f3b58001d36882f23f5c8b0f1 [3/12] rust: pass module name to `Module::init`
config: x86_64-randconfig-076-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280721.FOJLRNqe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280721.FOJLRNqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280721.FOJLRNqe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> drivers/block/rnull.rs:39:22
   |
   39 |     fn init(_module: &'static ThisModule) -> Result<Self> {
   |                      ^^^^^^^^^^^^^^^^^^^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static kernel::prelude::CStr, &'static kernel::ThisModule) -> Result<Self, kernel::error::Error>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
