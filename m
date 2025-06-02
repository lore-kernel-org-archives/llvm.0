Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383B4C85;
	Mon,  2 Jun 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748889699; cv=none; b=gmmQ+eHalLAEtgV8FdbGxOtXDJnyQ4pGDw+W57pEobEg0e3FT2HtiXYBDUGjEw3wVAXBd2Tddy768LwzbVerCfR1Y7bsv5pjR+PAUqQHRw24nSKGXFvZvr/DsnGMXQdGjrMU0z7jHD8w++5i8zYJQsCwy10cRzpLnd3K0Pb3o2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748889699; c=relaxed/simple;
	bh=cZ5XLxx7Nplm0ahA0hMamO8OlS+P3dRSreXWXQu/n3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFhJlcoEwoaxjmg4sR/LxL9UlahabYQDpUKSqOirtIPc0BRIzXBCAFIDHA9/VWrP2aNRTiYv33y6uKZUMGzzk1FIunLvrBTxhjPXCHDEq13qGBO0TRRbvtM+ro881O6VE/9bzVY3I3Tt3uh2KqVOQQ2hl35gWbipW8xI4u4KTmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHjzdIO8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHjzdIO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748889698; x=1780425698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZ5XLxx7Nplm0ahA0hMamO8OlS+P3dRSreXWXQu/n3o=;
  b=CHjzdIO8c746HS9e9pTe19nV7znheo8AiPeqaA8aGs9r4dvAUApvjd3Z
   TDqbY5MS/dpGH3EyWAM6Gwp3KF/+VeSA2HKAEIejnB7Ks9Qfq3ZmIgl3h
   5HoDlT4j8KXNrUg2L6yEJ60fYkypftM8Wv8U8DwiG6wNDUEAGaw0v3N8s
   7AJizkzsBZmq58jBmFGAlPtqVcG7VUU4TLIfm0tXoP8d6O1FaAS/Ro3kR
   wCBhJ68t0lmYW6AR6W8QRxVD/NLEbd+QlSXvdhtFo3bLVkUQIy4EMSKJq
   KsA7AVMX1aWC4cTwdQhxEF/wmlor+TVKWRU3ftv7L739YP+H2I7Rjgzt+
   Q==;
X-CSE-ConnectionGUID: NoPqQyRYQmyXpyMcrsh/xw==
X-CSE-MsgGUID: BZJOy9gDSNGHx1Ca8IYBvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61524970"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="61524970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 11:41:37 -0700
X-CSE-ConnectionGUID: xsNFipGJTQq+iA/Q5SiAsg==
X-CSE-MsgGUID: gtnb/+ftSTSFpHxTqLDbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="148476176"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2025 11:41:36 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMA6H-0001M6-2w;
	Mon, 02 Jun 2025 18:41:33 +0000
Date: Tue, 3 Jun 2025 02:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:nova/sequencer 20/47]
 drivers/gpu/nova-core/nvfw/r570_144_bindings.h: warning: ignored by one of
 the .gitignore files
Message-ID: <202506030217.sVACHrbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   29f49c4178307cb46780fb8c476783697ed3b99d
commit: cc942b8c926b7693617473716a627e102c422070 [20/47] [Nova] Generate Rust bindings from OpenRM or Nouveau headers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250603/202506030217.sVACHrbY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030217.sVACHrbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030217.sVACHrbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   compile_commands.json: warning: ignored by one of the .gitignore files
>> drivers/gpu/nova-core/nvfw/r570_144_bindings.h: warning: ignored by one of the .gitignore files
   rust-project.json: warning: ignored by one of the .gitignore files
   scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
