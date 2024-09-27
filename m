Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D514A0A4;
	Fri, 27 Sep 2024 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727401256; cv=none; b=ZQRadUsYfDwQ/NsRnYx9SvhvOzB+5afdjTlk1rEM3VjREZTo11tQrM9iomMiufJgIfYuW8o39lOcA7qlEvcBJYfu0d3hXvhmjmG54YxiJwwn7N2TmXa6Gmgc4TrsZbgNVYZuZKp2Vlb9cMK+8ZfYAjCf68y8puW/2TJgFXTd/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727401256; c=relaxed/simple;
	bh=ceaNwKxZAuq7nQu4VkJYYYz/pYY7GkI330wZn8im7Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYNMnsnt9Dckm3QGD5vvHj8wG+WR3lNdpZb//GUwBhaSWkrheQVOdXWLRkG0zdlrLphyJFul6k+KCm0e7hwALeFefvjiGGzxNxZxWjcP+c5MWUiN6OUcMAZCnoYl+Sdc6KFV5Hkz3sLTfp+jnuCifP0mhH4q3a+RaaixskbKSTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ML0e5wWl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ML0e5wWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727401255; x=1758937255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ceaNwKxZAuq7nQu4VkJYYYz/pYY7GkI330wZn8im7Ww=;
  b=ML0e5wWlRJB6SH6Ql2tQhg6V5D2DpRPc41qx54v1tw3uyYnalJAOCTCP
   +H0R0PMrxyojDAh8dryuOxwJZL5MldscNUsfbsnewb7FzzfSgeNeVSSWB
   sSimaqPfHVVDijTwKLADbuHKDeXO0eSExwbWuWtanDc+X5KTXKjwtsOhj
   66vC6oGeddthS1c1yp1LcxjCcKB/l795pMIZ+ZbAY3PvoOGTr6eS+rjkK
   VCLn69S6SrqVntOhknVCHo/ot4bofpUbIbt5aZZC5dCy88MlTleA+LDjv
   MqLRiR9eOsOW4D8w49GQmQDQBd+lbEEeaf7mHP7QYKMQR47DFmBKnmoAb
   Q==;
X-CSE-ConnectionGUID: Qdg/xw5hQbm0hjIh7XE6Zg==
X-CSE-MsgGUID: O8lROsQDRA2oedP+E/Ux+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37203932"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37203932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 18:40:52 -0700
X-CSE-ConnectionGUID: te7QSxtJSMCOCtKMPPSUlA==
X-CSE-MsgGUID: cTni2BSoRb+Jxe9cNPjSlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103175089"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 18:40:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzyS-000LMb-1z;
	Fri, 27 Sep 2024 01:40:48 +0000
Date: Fri, 27 Sep 2024 09:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 13/25] drivers/cxl/cxlmem.h:798:44: error:
 'counted_by' argument must be a simple declaration reference
Message-ID: <202409270908.NJPL38kw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 5a0496c19151d83cd0d926f8a1488eeaab27509b [13/25] cxl: Add Get Supported Features command for kernel usage
config: arm-randconfig-004-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270908.NJPL38kw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270908.NJPL38kw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270908.NJPL38kw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/port.c:7:
   In file included from drivers/cxl/cxlmem.h:6:
   In file included from include/linux/pci.h:1646:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/cxl/port.c:7:
>> drivers/cxl/cxlmem.h:798:44: error: 'counted_by' argument must be a simple declaration reference
     798 |         struct cxl_feat_entry ents[] __counted_by(le32_to_cpu(supported_feats));
         |                                      ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                          ^
   include/linux/compiler_attributes.h:105:62: note: expanded from macro '__counted_by'
     105 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
   1 warning and 1 error generated.


vim +/counted_by +798 drivers/cxl/cxlmem.h

   793	
   794	struct cxl_mbox_get_sup_feats_out {
   795		__le16 num_entries;
   796		__le16 supported_feats;
   797		u8 reserved[4];
 > 798		struct cxl_feat_entry ents[] __counted_by(le32_to_cpu(supported_feats));
   799	} __packed;
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
