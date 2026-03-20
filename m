Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A93A75B1;
	Fri, 20 Mar 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005982; cv=none; b=VOXHMygma/FhGvW51xD6ZelNGPu/KsyHUs2baFYA1MBSk4OI8QNME+H69acy8iS3UNx5XrmPWOrK3fijeEwoNiLS3WiuONzOUxDxMf5TKLFPCK+dS/VCTFuhhEjK4SaI4ZIJFXKJvgqTC9TjOjDcZIMm7tvCeAUB75MRvcHzXSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005982; c=relaxed/simple;
	bh=uuHxpvvk+KMKo/NMJwYXrb2UA5H+9aWt/1abSvlkJdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlYaulO84U9GB8X/kW2gnJif6JELBJyMDrj8DnL9HFJh1vwiZcIqePW8186vMwinxG2GM57OzvT1udsQ6W35QloUyUxMO5inAHFSPuLLlEHIZXXajkrG71o9YgrUHDZ1L4LFFcy/+W8ZPQm0YqKzXNn91TtNU8bhjJ1aXAt7zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpgMkDAC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpgMkDAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774005981; x=1805541981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uuHxpvvk+KMKo/NMJwYXrb2UA5H+9aWt/1abSvlkJdM=;
  b=DpgMkDACE5Mz7PvS/m3JcY31U3G2dQfES4eVcxY7VmWEmhlCRa7BC9Pt
   bMYX/6NWJDqejHMi+tEWl/iWrpZNBljnvVJjwuZvt3ixCYB6UQrKRX1yx
   anFgkngnkWO7C/YyDU0WPp+cCN7a09ZbNmo4sawqkMHritrI+0G4kGcty
   XFdJbKDGK/B0iZteBfDS8SSXdVAWjff+rfX6t6LEZDMtUkQUXwjpaJmse
   ZEcQmbhTvgXBmAq+RFiT0kO/y7Oo7oB4Nw5FzfBW9UoULqye7TSE/qGTk
   FQIYmYWeIytRrVAPgiKxaiMptDp6QJdgJ2TXNMFmNleGZqbs2oGWVxK41
   w==;
X-CSE-ConnectionGUID: FYcF0aRSSBuwuQZKYHB7bg==
X-CSE-MsgGUID: 6kM958pERnOt4ujcJSZVVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85403921"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85403921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:25:57 -0700
X-CSE-ConnectionGUID: AvowKarpTfSGc8EpGWTeew==
X-CSE-MsgGUID: GUsOegipRcWhO/OUdJAmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227988118"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 04:25:53 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Xvq-000000002Ij-46fk;
	Fri, 20 Mar 2026 11:24:53 +0000
Date: Fri, 20 Mar 2026 19:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Demian Shulhan <demyansh@gmail.com>, ebiggers@kernel.org,
	ardb@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <202603201958.gFoHxLV7-lkp@intel.com>
References: <20260317065425.2684093-1-demyansh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317065425.2684093-1-demyansh@gmail.com>

Hi Demian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebiggers/crc-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Demian-Shulhan/lib-crc-arm64-add-NEON-accelerated-CRC64-NVMe-implementation/20260318-003936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
patch link:    https://lore.kernel.org/r/20260317065425.2684093-1-demyansh%40gmail.com
patch subject: [PATCH] lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201958.gFoHxLV7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201958.gFoHxLV7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201958.gFoHxLV7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/crc/arm64/crc64-neon-inner.c:20:5: warning: no previous prototype for function 'crc64_nvme_arm64_c' [-Wmissing-prototypes]
      20 | u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
         |     ^
   lib/crc/arm64/crc64-neon-inner.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
         | ^
         | static 
   1 warning generated.


vim +/crc64_nvme_arm64_c +20 lib/crc/arm64/crc64-neon-inner.c

    19	
  > 20	u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
