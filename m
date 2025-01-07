Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27223259499;
	Tue,  7 Jan 2025 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261936; cv=none; b=paSpUkfaq8J16p6DmJyJnrUssMTowCJdmwljhZB3xjahtSfeAQMOnReM1r/N/fPS39vAnENW00whLf88V9zMq+qj9TC9u30xhtr69BXdRBiqSR7UbGgJpodELregMvaS0SM0dGMmYYd9Fvo00KrymAQxNv/LGa/B6d05gVMdeCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261936; c=relaxed/simple;
	bh=Fdd/qXxUOKyLEbfLqRWJaHAiGNUfNCVPGjChUerDnn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdEB1Nth4VAVnH3jDUE8KzFRpXWgAtoqT1GgaH/ZGHEU4vwwLgPRqNrTEleDh5J2XqL8ubpACmeBuWM4A7SXGfmIerIEp4IRY52juTtGIZRqs8aqCp/p6CwFL2h+6iU1i9+7GNvizzuKvByLf/OOlHdieYz6P9riPdVH4mPzNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bt7rzF2h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bt7rzF2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736261933; x=1767797933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fdd/qXxUOKyLEbfLqRWJaHAiGNUfNCVPGjChUerDnn8=;
  b=bt7rzF2hU27PBzyKl/v7hqE3Ym6PciaUqelcngndUq7iGn1P8idnEm5e
   4dksPjDv7kEdEPQ710H0GKMy2d1UrdD9MvM9F8wMxLHBmHC5lgZs7o4Vm
   MA8qHk88gIp0AAgyEt3eIYaIUh7noCnCh1byEuhec+RXC7Gfp5KtqFdH9
   +v1359w3wEqC2YevB8szHhUzP3nBqPneRz9WtU/e65o/aGRu164J7gh4N
   5m8FfyfCmipoOHd2TK/fv9XLevbhjDniLleZtrIGIWEHO/C4bs6VdqZt7
   GFNS1UdvZRnbzdku2QzZPHOuIxmQxJDX79aRwL358Vdw7EvUrSgX0FYjk
   Q==;
X-CSE-ConnectionGUID: pZZFCAdKQ+msVXYA9/kCRg==
X-CSE-MsgGUID: 0mbHo4j+Q9+rD2JH4VSPxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46944098"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="46944098"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:58:52 -0800
X-CSE-ConnectionGUID: RDvuaEXnQpa/h9OCAEyF9g==
X-CSE-MsgGUID: cqy4g4trSk6yPYPHjwBx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106811591"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 06:58:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVB2e-000ErL-0F;
	Tue, 07 Jan 2025 14:58:48 +0000
Date: Tue, 7 Jan 2025 22:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: niravkumar.l.rabara@intel.com, Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: socfpga: agilex5: add NAND board file
Message-ID: <202501072244.kNb1e8KP-lkp@intel.com>
References: <20250107084831.2750035-2-niravkumar.l.rabara@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107084831.2750035-2-niravkumar.l.rabara@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/niravkumar-l-rabara-intel-com/arm64-dts-socfpga-agilex5-add-NAND-board-file/20250107-165406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250107084831.2750035-2-niravkumar.l.rabara%40intel.com
patch subject: [PATCH] arm64: dts: socfpga: agilex5: add NAND board file
config: arm64-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501072244.kNb1e8KP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072244.kNb1e8KP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072244.kNb1e8KP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts:39.1-7 Label or path gpio0 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
