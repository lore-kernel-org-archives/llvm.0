Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF653E23;
	Mon, 17 Jun 2024 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643695; cv=none; b=WLd8lRKIimcsGEgxPdZ9qKqIF1PZdClgVjF/Zwem+QH+2wXDCeW6kfcWtRdH5N4iUId6BYHXItAEexlTQwHClmq0QkteriqJwuh69pBuJzZJQm18pDvMfbdRstCVqiv23c1nw9TvuohIZ3MbAeNIt+rPQJF8E99tmc0/C6Lz+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643695; c=relaxed/simple;
	bh=ZNJWz97UxQwH+2kJA7SKrDGn+HLG/DZWOSaiCpUIuk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lC3y9sm0IM92BPqsDRWMi1/03GruGUAfBRpy6onfl3Z4pOoV8qPdzUyVWs3XHo0kcDyjUcScpyE45LHe79jz8bg9DcnDXM/MQW42Bb6w3/6KN+sJoffH0F9ELb87uUW443GNPtzvZ6ZqrRvrP7MBd2kqSWEGIxARe2Nqd4z7vTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4/oC0wg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4/oC0wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718643694; x=1750179694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNJWz97UxQwH+2kJA7SKrDGn+HLG/DZWOSaiCpUIuk4=;
  b=l4/oC0wgjMIpOyFOskmEhooJbcTR/oJ0eBb4Uu8E3HLQ/Nt1JxtCqzns
   vbQYpCTkwTh7701V3MrqlpkMyGKafIFt4nekCm75G58IOkiKLRqowTsmN
   P5ftkeP1tsxzVrsN7tGZlQdrXCIsswr03eZ5j7TTeIO1d/Achluxcr/B3
   fWnyKbQYHGZwP8w9qKudMbD33ulNGwgMW6tVEKN8oA9OJeTg197PomH3K
   PFTUN0+o62DhfSk02240biLSeKdUy8A8d37rqKKRgtfgA0nlXts29BL0F
   d86HyACZki9SEQX+oBjULj3LIuhtd7/SPg04QEpZy6XaeY2hYnE0QXzhn
   Q==;
X-CSE-ConnectionGUID: tjBSSjppS6azz056FWFF6Q==
X-CSE-MsgGUID: UpOgOiHURPSmeFW7+p9t4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15313300"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15313300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:01:33 -0700
X-CSE-ConnectionGUID: Zk+1FeARR7GozCQpYc/djw==
X-CSE-MsgGUID: /ie0V+tYTvuQoURjIhpDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="72014336"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2024 10:01:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJFjU-0004hX-2l;
	Mon, 17 Jun 2024 17:01:28 +0000
Date: Tue, 18 Jun 2024 01:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [qcom:drivers-for-6.11 20/20] ld.lld: error: undefined symbol:
 mbox_request_channel
Message-ID: <202406180006.Z397C67h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-6.11
head:   75287992f58a74271a083fef0356bc81d629f671
commit: 75287992f58a74271a083fef0356bc81d629f671 [20/20] soc: qcom: smsm: Support using mailbox interface
config: i386-buildonly-randconfig-005-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180006.Z397C67h-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180006.Z397C67h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180006.Z397C67h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mbox_request_channel
   >>> referenced by smsm.c
   >>>               drivers/soc/qcom/smsm.o:(qcom_smsm_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mbox_free_channel
   >>> referenced by smsm.c
   >>>               drivers/soc/qcom/smsm.o:(qcom_smsm_probe) in archive vmlinux.a
   >>> referenced by smsm.c
   >>>               drivers/soc/qcom/smsm.o:(qcom_smsm_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mbox_send_message
   >>> referenced by smsm.c
   >>>               drivers/soc/qcom/smsm.o:(smsm_update_bits) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mbox_client_txdone
   >>> referenced by smsm.c
   >>>               drivers/soc/qcom/smsm.o:(smsm_update_bits) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
