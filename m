Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF71A01D8;
	Sat,  2 Nov 2024 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730561327; cv=none; b=ll3vPPC7JEs8PG3EFZrN9prxYFG5IfLjRLAaYU/rbup2eKiwawmYNK5GKgLi22z5UBCxJQQqY/PyjVlG/RE6Z0EoWichS+sPrmo9mRxWFCgGf6BzlYUaoXRnoH3viQMlVA1vTkge7FKJ6URm0Qw7WeOM+hNDKFkZo1D77VvNym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730561327; c=relaxed/simple;
	bh=zAUFqbRnx3QrIZL0lXYiEoGKtF5VPcXttxczM7SZY6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0GTRFsOsVZiU8s8ZDwrJk9rX3tH57yEDoVRH8ysLH1+Bp+fXbxL6xZ+ixeB3A+S4XXT+lOhrrRzT6miDHL4vN9ynfyxlYQ5/OyKN7dRfRWy6KuxFb3GDRU9+Qg7TqMalD+SkjGUlIYCss3rbjn6qAyGhr/76c+JkMNB/y1aPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USG+6xhO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USG+6xhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730561325; x=1762097325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zAUFqbRnx3QrIZL0lXYiEoGKtF5VPcXttxczM7SZY6c=;
  b=USG+6xhO3bNumqh7xUYJoV4HD5stEe+mGJbVHV/6jNOc/HzR1hFOJf4W
   n032K2Jp6YXLMS0pVZZSnqB9QRRfrUyu3UmF1w322xyS0nGEbLVBRTfYG
   WWNLGR+DmW1TxZWSaIgSR5+GosHSmSVmeZNtB1qqvKZesMJgCLUN8c0V1
   IqERh5RzmU9qQIhC/v1UGcfI/0oilAyt81C6c5/UHx61oJ7it1iF9IM/k
   hFAUy5992ek6xSC5pzzpiYckcRPVexqERBat8ZW0bBjb5aN4QHMH6Uds/
   0PK7SDWYoxCe7FatHkOor/DIN5GqXE9sdsfHgMDuynKw2lYuWnsc+3GX7
   Q==;
X-CSE-ConnectionGUID: +0Jf7gjzT4eDLjF3QWHPzA==
X-CSE-MsgGUID: 6sA7swfoSVqa7/IfZb42xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30411886"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="30411886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 08:28:45 -0700
X-CSE-ConnectionGUID: B6v/LPEhTo64evpmnST69g==
X-CSE-MsgGUID: jRQcgbeoT7+OwZQGIUT5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83685863"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Nov 2024 08:28:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7G3L-000j6H-1q;
	Sat, 02 Nov 2024 15:28:39 +0000
Date: Sat, 2 Nov 2024 23:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 10/11] riscv: mm: Use physical memory aliases to apply
 PMAs
Message-ID: <202411022337.JHozQieV-lkp@intel.com>
References: <20241102000843.1301099-11-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102000843.1301099-11-samuel.holland@sifive.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/dt-bindings-riscv-Describe-physical-memory-regions/20241102-081311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241102000843.1301099-11-samuel.holland%40sifive.com
patch subject: [PATCH 10/11] riscv: mm: Use physical memory aliases to apply PMAs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20241102/202411022337.JHozQieV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022337.JHozQieV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022337.JHozQieV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "riscv_fixup_memory_alias" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
