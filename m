Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA67B28313E;
	Thu,  8 May 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721226; cv=none; b=UMmtjUOKdWpvpkS02daqrWL1GCF3S2x+POD6oYcgs4d+MDtcgDB89eyd5ln+8mekV6wRV6U5PdSum89xeoO56iwabjJy1xI79LEL4jria2+nbM0Ume4wAnWgn0kvPTdVaBu9Eua8i9hdqL2miM37cE+KlOVZJX2hvNsnM/IRkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721226; c=relaxed/simple;
	bh=FwoSkUBSJYB9+k3u1OJ8N4yNvaswt3iX28KiEnbUyZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/Pj+0c+1k+YeWhY3/EDgAwzhca3gF+Rzwkk8W365wAzU0tX8K0Q08iiSY+B2XoSBXFmqfcmF5hIPzAJS3rRDANAX4p4gKn0M7TXFgPSVF/lSAh86OLwBZ03hKa0xOXXDs7kRhRIeNtnudggiN55Kop8pe8jQtxySQXl+sythcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C87eObR3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C87eObR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746721225; x=1778257225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwoSkUBSJYB9+k3u1OJ8N4yNvaswt3iX28KiEnbUyZ4=;
  b=C87eObR3DyPo2mnNa1SSwI0usus7oqO64BGABFdj+ZOMrD0aHwviJ9VW
   zyj8T57U4xnEkdiIzDLbq36Au/tHSID0haq7eQX16CpfZxwcU9ORHjJrH
   BHNebGo96qyzJqjgv1cQOL4GWIhB+5wfj1XhGryXGklBBQh+QcjSiPgVl
   652RWcwB9sCE3v56eic+vSfSsmgijLwZLhf1EZbUwED9SVAfM9OH8RPnx
   hhYcveNtIYyFxJ8CiQcyV0OFBwnGVlbk8jri2aa8A03LfN9XXWVPBnr1J
   g7zGFQrhu3Oq30Pcdd5SrZnQnsqquzcaVjsdtoY9tiMrjAVnSDMxUR2Hq
   Q==;
X-CSE-ConnectionGUID: 4FiYt8QUSOuSId//32gaDA==
X-CSE-MsgGUID: djsWENx8Tr+gy7udUZ+3ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59863414"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59863414"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:20:20 -0700
X-CSE-ConnectionGUID: qFPGCJq/R5qdx5LdXt2XJA==
X-CSE-MsgGUID: 5vWi38+KTU6fUep0fxVIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136056693"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 09:20:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3yq-000B9v-1k;
	Thu, 08 May 2025 16:20:16 +0000
Date: Fri, 9 May 2025 00:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 15/18]
 arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute
 only applies to functions, global variables, Objective-C methods, and
 Objective-C properties
Message-ID: <202505090001.FS7smjqJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
commit: 54ae382c92b4521365fde402a792038b968188f8 [15/18] x86/boot: Move startup code out of __head section
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090001.FS7smjqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090001.FS7smjqJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/boot/startup/sev-startup.c:141:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
     141 | static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
         |               ^
   include/linux/init.h:52:17: note: expanded from macro '__init'
      52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
         |                         ^
   include/linux/compiler_attributes.h:321:56: note: expanded from macro '__section'
     321 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
>> arch/x86/boot/startup/sev-startup.c:141:15: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
   include/linux/init.h:52:41: note: expanded from macro '__init'
      52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
         |                                                 ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   1 warning and 1 error generated.


vim +/__section__ +141 arch/x86/boot/startup/sev-startup.c

   127	
   128	/*
   129	 * Initial set up of SNP relies on information provided by the
   130	 * Confidential Computing blob, which can be passed to the kernel
   131	 * in the following ways, depending on how it is booted:
   132	 *
   133	 * - when booted via the boot/decompress kernel:
   134	 *   - via boot_params
   135	 *
   136	 * - when booted directly by firmware/bootloader (e.g. CONFIG_PVH):
   137	 *   - via a setup_data entry, as defined by the Linux Boot Protocol
   138	 *
   139	 * Scan for the blob in that order.
   140	 */
 > 141	static struct __init cc_blob_sev_info *find_cc_blob(struct boot_params *bp)
   142	{
   143		struct cc_blob_sev_info *cc_info;
   144	
   145		/* Boot kernel would have passed the CC blob via boot_params. */
   146		if (bp->cc_blob_address) {
   147			cc_info = (struct cc_blob_sev_info *)(unsigned long)bp->cc_blob_address;
   148			goto found_cc_info;
   149		}
   150	
   151		/*
   152		 * If kernel was booted directly, without the use of the
   153		 * boot/decompression kernel, the CC blob may have been passed via
   154		 * setup_data instead.
   155		 */
   156		cc_info = find_cc_blob_setup_data(bp);
   157		if (!cc_info)
   158			return NULL;
   159	
   160	found_cc_info:
   161		if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
   162			snp_abort();
   163	
   164		return cc_info;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
