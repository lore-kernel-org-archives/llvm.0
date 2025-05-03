Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102B78F43;
	Sat,  3 May 2025 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251711; cv=none; b=OC25hsxlkfL+c0Fy+1fQzK8xE18DXzAB60HEVWKxS27thXVN8WsB3W3T1Lml4rN44r3tuC7AMtxrLH9I6KxcO1UZ4us+EPytAUuCieNeZkJgSVqlynqlK9JWTUJpqiP3iU2DLjf8AOJ+Qv/Rnfjjik86tlGLf7QhY5U1HkcZTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251711; c=relaxed/simple;
	bh=tSZgN38GyZ/t3oOtfszD05d8YL3guqdlHqC0NDAIMVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWe1yQWnJ8JgdcbeEII48c/VzbewVO80Q920kGzDI3GAFO5/95RR1sbcX5hnvAHigpMfv9N7d+31gi+xFt3YHR3ere5H6vhimLe6khxbi40lCe9stQqjuE0gpbc7UKfE/jazxsV+K5JRPC38c/qdcM6H7tDOGQg6KMAFnXi7bRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALJjU6oD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALJjU6oD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746251710; x=1777787710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tSZgN38GyZ/t3oOtfszD05d8YL3guqdlHqC0NDAIMVw=;
  b=ALJjU6oD6X64sm5GUGjAL3dZbpjJfkuEBmKZnYFcIyojDiHxWot6jita
   Jhhpy5qJWOwtH7iwy9aRfWTVhXQsR5hCQ4MIAf2wUrNPvMHWLz9PJQTpz
   PjlYJtZ2rp7a1x0wdp2Snzw1NJwmCKWKfyPFLfHV7Oqs/l1LRVGJYTP3x
   gjhpKriJF7sloAqt0x8vrPwY194XxMbvce/hd5t9ZFyoKN8B/4uFv1oGR
   EVNfbd0OGCiCxW1V3fx9yEcgOT/xy1PYZkCJ3GIxAK4gyQLIQKY0qyJl8
   8MJde0a5N/tjgFTjjeU4d+ReqsPsBIEN59GNak3E8JZ7SrAUerHxhsS3G
   g==;
X-CSE-ConnectionGUID: 3DhvX4YjSTuZvFA3WA6wUw==
X-CSE-MsgGUID: 55rKbi2VSxC0jULdw2Uf4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70438296"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="70438296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 22:55:10 -0700
X-CSE-ConnectionGUID: n/mMcwarR2SZ4r5/MN4qvg==
X-CSE-MsgGUID: r2tKxmIVS4edHOFYga10Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="139974074"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2025 22:55:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB5q2-0005DV-2i;
	Sat, 03 May 2025 05:55:02 +0000
Date: Sat, 3 May 2025 13:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505031327.h8w4ttsK-lkp@intel.com>
References: <20250502153915.734932-4-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502153915.734932-4-p-bhagat@ti.com>

Hi Paresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paresh-Bhagat/dt-bindings-arm-ti-Add-bindings-for-AM62D2-SoC/20250502-234223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250502153915.734932-4-p-bhagat%40ti.com
patch subject: [PATCH v2 3/3] arm64: dts: ti: Add support for AM62D2-EVM
config: arm64-randconfig-003-20250503 (https://download.01.org/0day-ci/archive/20250503/202505031327.h8w4ttsK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031327.h8w4ttsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031327.h8w4ttsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:409.1-13 Label or path wkup_r5fss0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:413.1-19 Label or path wkup_r5fss0_core0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:419.1-12 Label or path mcu_r5fss0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:423.1-18 Label or path mcu_r5fss0_core0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:429.1-7 Label or path c7x_0 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
