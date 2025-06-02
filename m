Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267BEEAF9;
	Mon,  2 Jun 2025 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884344; cv=none; b=Zn+1q0RqXWy+g8WzYA0Vuy/Bj87+Kmgi5pxN94exYXVJhagkr53siz5QcTTkdStQ0Q1lifTEO0e4Koe+nNqmUVmaTvihe56sBbUtpSZmiiNWpdn5duFmHNgBsaX3QDDyvFAfSuYoTezcK0cWCEBpPznBcB+wDJl41WtmlIomWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884344; c=relaxed/simple;
	bh=1bGyJ2t8O4yVN6BEUWcWFoIxzcs0t5mAtPx7k711Uek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QX2ViFMYD+gslypidjihucVUddwfxIYka7wNu1y/OaJ6NgPT1+jLVY1rGuVlIJ6jtxAOgfB/j3uaotXVQiVYGnF/xPh+y3GZaJQecJnGR6HfoFWj/81dKUqhTfo4q7WL+74eDocsZrMB3ZmPivmg/Ew0d5FtU5/9ZBYBSstnj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtO7cY34; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtO7cY34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748884342; x=1780420342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bGyJ2t8O4yVN6BEUWcWFoIxzcs0t5mAtPx7k711Uek=;
  b=LtO7cY348ReXgrJFJTxSpPZJ4rGfDacRygP/D5UqZGydCVAZ6x3vEHZJ
   9Zej3lKfQcEIESM7BVY8ln1pF5YSiMHCev2Ay7/VRZirviO+rPs6EYSYy
   7ElbjFdXFYIk02Mxl44D8FjsmztVV/R1ArAzXhU9iZ/afFS3eldd3n3ge
   Ni7TS0x/YgmgpxazU6bIkEDfj8GNemNqXrn9bXaLKEw4At4u4ZpwzJY4w
   u9xQcbEXKbealZ5IEO6EqRL3SMyHA/LejgYjdXtk8Vv+aS6RWEBCAV3Qg
   7EVL8SC8oX/4+M8je/TwTvcI6AOkoHRnTMRm4CukMHKnmbrBFKMhUsVDw
   A==;
X-CSE-ConnectionGUID: zJdQYdxQS9Sj2AuXVVl6lw==
X-CSE-MsgGUID: VbId4fS5SyKXu1ITLgzEYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54702903"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="54702903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 10:12:22 -0700
X-CSE-ConnectionGUID: 6aLqJD11TVOn9yx9BAQy7A==
X-CSE-MsgGUID: JSQ0TBR7TC+sWrjKdpI4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144629103"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2025 10:12:20 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uM8hu-0001LW-1L;
	Mon, 02 Jun 2025 17:12:18 +0000
Date: Tue, 3 Jun 2025 01:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 10/47] compile_commands.json: warning: ignored
 by one of the .gitignore files
Message-ID: <202506030125.v1n0HhL2-lkp@intel.com>
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
commit: a78e3b7f7bdc7dfa26d26e24a703ba3674a0611b [10/47] JOEL: Add LSM metadata
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250603/202506030125.v1n0HhL2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030125.v1n0HhL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030125.v1n0HhL2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> compile_commands.json: warning: ignored by one of the .gitignore files
>> rust-project.json: warning: ignored by one of the .gitignore files
>> scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
