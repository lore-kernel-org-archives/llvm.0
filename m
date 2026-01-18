Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645AB2EC560;
	Sun, 18 Jan 2026 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744858; cv=none; b=OVPAHK0CQpLRgxWFEeHFhRompYlI7hy8DMefK8qJsELF9hrb74pMNxqk730zHjHJZy3/9FKrFLTzCKGR1/6UgBj0f6A5UyaTSUNwlgjq9FZPwBL8oU+SXuiehMrpU1wXJ0P9txgFp9vx2DpFJGA8lJ3s693/QzluYAqvH+ZOZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744858; c=relaxed/simple;
	bh=HAWDDZezVQG0z4WcarE8uki5BVIhBG4bDw70ZNTCIoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBBRH/mLooB8UdJc/HQUUShTg/8QT9VxnsjJwMCU2W0PU+NpckEPxcOFSoeaESadaSLanlysGGdZ3s03DZd12t5chWFGVWrEcpBCf3FUCfXbne2eJoWAfjimLam1+Jq85JU/hck6hWZi8nMdaTCng2SSpBnmePu/Md1Tr0n3TMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3+8Yibh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3+8Yibh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768744856; x=1800280856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAWDDZezVQG0z4WcarE8uki5BVIhBG4bDw70ZNTCIoU=;
  b=U3+8YibhtUOlEzZl7WraD1T/PN7uKq6i1Ifamb5U1Pxkc72FR2gGUCrW
   ryn9p3mztKO1+fweFkJMO0sQJDrPj85ZWnmwQ59PBVyb1SOQwryWb04fj
   k6dL75eBnvfexvLB9MW7GZnN2MrVH6pOXD4vYq8/Xygu1Q2JQAte0S06X
   LKzH3l8lCVMJwEtpYgbZQrh71qLyscBerEACy/1itwo2blwOpdHB8xfOX
   TZADyrZKErxcsQ9O9pU7mftcLxOBKiEHnLAJl3qZBNJ54ymZi48OZI9Fb
   DL5ujaDcls3WQvwSLbTRDWMXcEVdNJZaDhnszifip9DCHrpH3OZHWhKBy
   g==;
X-CSE-ConnectionGUID: 13ha84/KRuGBqQ+74HsHeA==
X-CSE-MsgGUID: mw+JokX6RA22WGbe+d+VfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80278136"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80278136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 06:00:56 -0800
X-CSE-ConnectionGUID: 5zynD8ypQy6sOQ7UAdqILA==
X-CSE-MsgGUID: EJIkJ1E4QN6GsGU/ZP5oIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205262773"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jan 2026 06:00:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhTKm-00000000MzS-3BDc;
	Sun, 18 Jan 2026 14:00:52 +0000
Date: Sun, 18 Jan 2026 22:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Coiby Xu <coxu@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] s390x/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <202601182109.oKlosNBC-lkp@intel.com>
References: <20260116103347.523747-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116103347.523747-1-coxu@redhat.com>

Hi Coiby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7f98ab9da046865d57c102fd3ca9669a29845f67]

url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/s390x-kdump-pass-dm-crypt-keys-to-kdump-kernel/20260116-183709
base:   7f98ab9da046865d57c102fd3ca9669a29845f67
patch link:    https://lore.kernel.org/r/20260116103347.523747-1-coxu%40redhat.com
patch subject: [RFC] s390x/kdump: pass dm-crypt keys to kdump kernel
config: s390-randconfig-002-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182109.oKlosNBC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182109.oKlosNBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182109.oKlosNBC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dm_crypt_keys_addr
   >>> referenced by crash_dump.c:0 (arch/s390/kernel/crash_dump.c:0)
   >>>               arch/s390/kernel/crash_dump.o:(dm_crypt_keys_read) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
