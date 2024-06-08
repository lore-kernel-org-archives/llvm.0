Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B614F20C;
	Sat,  8 Jun 2024 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717832728; cv=none; b=UGoRcLHurC7q/pM4K5oACvEkzsqjFbSqFQ7r0wI4fXbNq+NKjJ0h/pgKXc1UaY2exPEFxjmnASfdlIqpWXf6aUV6un2gUmYbS2i5n2JD7E/KZ2ddZauF1phYi/02RDDOrx6LSx101lnTgkbrJfg2E9uy/FDyf5xPGviPx+I1AZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717832728; c=relaxed/simple;
	bh=iQdrGbyvJXxvu9FvcyKryPjCVl4CsbLadmA5hf6H/KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGRWJQm6zWuPV6RzCyepTxk4ioEQhiPgzbG9B7Bs3zlQCrAEhqQmEyWEvbC0iN2pQfN0S37vC+ly6GUBQexITAEgou7LrBCnjy1JPzmacdBsN8B3tcEy8n3EbJS2QPHbixKoOsbN1B3fFjJyK09DRppav+DiftN+G7IUl6WyUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdvsBSmP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdvsBSmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717832727; x=1749368727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQdrGbyvJXxvu9FvcyKryPjCVl4CsbLadmA5hf6H/KM=;
  b=XdvsBSmPFzGppQtonwsAhLpXXvhAl8HmgnXdkjvGksW5y9hi0Li4jJHO
   QOPEM1l8w25lcYORqC9ouNvZJD8jdp2NmJfnZptaXLIc8ojo9a66Qx1au
   wbeHWccvArcY6+PerDff7gq9VfBte3gJhezMi/KFcSbUzJRePkZvlxAnU
   4hFKVYmasrJTXHHJunARdEe8uEwApTHxnT5eSpF28vS9nGyipy5DPlWnZ
   tUm78qTMIH0DZhnGwkguhjZG41SUISof1qgI3nGr+kA+wurl9E9DbsgpG
   6SVfD0tADj5pcloKS4uyQSe2DimrOeeWJBHvKcl4EaucqIBRHOzTqjZjB
   w==;
X-CSE-ConnectionGUID: K9fa0Dr2QwG1QFhzKWEDOg==
X-CSE-MsgGUID: NQjmCyV1TNKvpaxIHz3Xdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32103214"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="32103214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 00:45:25 -0700
X-CSE-ConnectionGUID: XRo+HqdKS+m6g3C7odDyxA==
X-CSE-MsgGUID: O0Bf8nEATmeY+y1p1pDJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="69728244"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2024 00:45:23 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFqlN-0001Gb-1m;
	Sat, 08 Jun 2024 07:45:21 +0000
Date: Sat, 8 Jun 2024 15:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wenlingz <wenling.zhang@intel.com>, linux-doc@vger.kernel.org
Subject: [acrn:acrn_6.1.80 31/32] drivers/virt/acrn/hvlog.c:226: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202406081513.h0su7fOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel acrn_6.1.80
head:   2355d104a177c9f9bd98729076fe20f1bf0d03f3
commit: f528146c92c545c17a21206b87e70c7087247f88 [31/32] virt: acrn: add acrn hypervisor log back
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240608/202406081513.h0su7fOy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081513.h0su7fOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081513.h0su7fOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/acrn/hvlog.c:226: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * base0 = hvlog_buf_phyaddr_base;


vim +226 drivers/virt/acrn/hvlog.c

   224	
   225	/**
 > 226	 * base0 = hvlog_buf_phyaddr_base;
   227	 * base1 = hvlog_buf_phyaddr_base + (hvlog_buf_size >> 1)
   228	 * if there is valid data in base0, cur_logbuf = base1, last_logbuf = base0.
   229	 * if there is valid data in base1, cur_logbuf = base0, last_logbuf = base1.
   230	 * if there is no valid data both in base0 and base1, cur_logbuf = base0,
   231	 * last_logbuf = 0.
   232	 */
   233	static void assign_hvlog_buf_base(uint64_t *cur_logbuf, uint64_t *last_logbuf)
   234	{
   235		uint64_t base0, base1, offset;
   236		uint32_t ele_num, size;
   237		uint16_t pcpu_id;
   238		void *sbuf;
   239	
   240		base0 = hvlog_buf_phyaddr_base;
   241		base1 = hvlog_buf_phyaddr_base + (hvlog_buf_size >> 1);
   242		size = (hvlog_buf_size >> 1) / pcpu_nr;
   243		ele_num = (size - SBUF_HEAD_SIZE) / LOG_ENTRY_SIZE;
   244	
   245		foreach_cpu(pcpu_id, pcpu_nr) {
   246			offset = (base0 + (size * pcpu_id)) - hvlog_buf_phyaddr_base;
   247			sbuf = hvlog_buf_virtaddr_base + offset;
   248			if (sbuf_check_valid(ele_num, LOG_ENTRY_SIZE, sbuf)) {
   249				*last_logbuf = base0;
   250				*cur_logbuf = base1;
   251				return;
   252			}
   253		}
   254	
   255		foreach_cpu(pcpu_id, pcpu_nr) {
   256			offset = (base1 + (size * pcpu_id)) - hvlog_buf_phyaddr_base;
   257			sbuf = hvlog_buf_virtaddr_base + offset;
   258			if (sbuf_check_valid(ele_num, LOG_ENTRY_SIZE, sbuf)) {
   259				*last_logbuf = base1;
   260				*cur_logbuf = base0;
   261				return;
   262			}
   263		}
   264	
   265		/* No last logbuf found */
   266		*last_logbuf = 0;
   267		*cur_logbuf = base0;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
