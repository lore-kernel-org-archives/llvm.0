Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F83EAF9;
	Fri, 27 Sep 2024 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727396273; cv=none; b=PMFfHk4cIiTGDo6245SRmqywP73a+3eShZEvjYyYLV9VZ3IcpuVeDynlzCKGRtVjOBCLLFJLT147Fb77sa2OibBP4zJzpljvrSVElTGnvsGEmYnz7MOLQzddenzPQELOo/cMLNkl2jGaH4seWTgdQeiuGU6hDk6MfGJgNy2Kl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727396273; c=relaxed/simple;
	bh=pJXipiGZHElv2/BHLanSK0trpf6yWj+TFXsXm6sNUVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHj4gvYUu1M/TL1O74J0EJpYiFXgFYrJHq6Ct8p2qLxb67U8vPD1Rr2VzXTwfa7+Bp5WZp1okQ2WNgrt3HOjNW8nvNZBdB617cijxIA8gDZVIpOixS1l9a24H3hsGMukpNiPJ8tyEjPgJ4nZuPZypoYPOBtAO9Z9uQyrZGTYCXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TksM/zhs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TksM/zhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727396271; x=1758932271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJXipiGZHElv2/BHLanSK0trpf6yWj+TFXsXm6sNUVU=;
  b=TksM/zhs6YV3taszLKjhF5hvTWrRWliBQppDWppgUG/D5Fyl7ht/hBwt
   WiCUacH5h+O9sCQCkYWX8Iei0cv14zkw74xDgW5CDLDiDb6nY8vZgg1UA
   K9wL3ykEPQ6nLpEnsP3iq0Cg8OyPgqf6q/RI9hbsjYrxLQlxL4Wk3HlBV
   rOKwyCEAfJQOMy7cykTfF0ZT8s/RvxznCnGR3ECZO69NqIGQMXdLJ0m8A
   sUsw5xQUtxX9kEK+8zHZkupIGu/NcZXtuTO47iS9oh4GO0DQ9us8T5A2y
   E1MceGj6kRoRNmXvTEImzKpkiTQUN69N4ZnbK0LQTNDsQMMGxlioubsMg
   Q==;
X-CSE-ConnectionGUID: 6+u7X7uuQfenaA5YCwo5FA==
X-CSE-MsgGUID: 0m1xPkGJQFq+xPpYga+kCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37666929"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37666929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:17:50 -0700
X-CSE-ConnectionGUID: rWAytr5UQFe82dBn4xCQog==
X-CSE-MsgGUID: Gs7eDM+ISG2X70Opv74B+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="77292693"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2024 17:17:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1styg7-000LJv-0X;
	Fri, 27 Sep 2024 00:17:47 +0000
Date: Fri, 27 Sep 2024 08:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 13/25] drivers/cxl/cxlmem.h:798:56: error: use of
 undeclared identifier 'supported_feats'
Message-ID: <202409270801.q5j3vH3U-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270801.q5j3vH3U-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270801.q5j3vH3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270801.q5j3vH3U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/port.c:7:
>> drivers/cxl/cxlmem.h:798:56: error: use of undeclared identifier 'supported_feats'
     798 |         struct cxl_feat_entry ents[] __counted_by(le32_to_cpu(supported_feats));
         |                                                               ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^
   1 error generated.


vim +/supported_feats +798 drivers/cxl/cxlmem.h

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
