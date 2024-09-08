Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38897157E91;
	Sun,  8 Sep 2024 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725830086; cv=none; b=Aalm+vBuWchTv0TWx8iKZr7SiryyH7n9Mxisk1ZVoiejJyhKw0+r0AbW7iTYg1Ai8J2+vjpYSfDTk2blwzNc0fkTyirmMFfhJ8drYFt+erO6SrqIJo9yAPd/PObvBc4HciwEy56nuTN4LT2Lw0uoAAeDpSffXJrqONk4v0jiuOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725830086; c=relaxed/simple;
	bh=NXvN4ge7FUdylrvPMxJi6mIKuXsqQLs2f7Ll8mW8vz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acQoXdByGuEQN2GfwkdjnROxw1TOH8/I9fvTDLawGYX0sn3tm6gY+KC7K86L985kxdDjPtzAEymNCj8J9JHcoJxZiEc51vVmKq+Jz+LPaEgh0zqLOGQjWsiv8HD9dcgrp5nkXs8YTfUgisQbxYOVm4nvUNNwJt4TG6Z7Kx7omvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSehgHNF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSehgHNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725830084; x=1757366084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NXvN4ge7FUdylrvPMxJi6mIKuXsqQLs2f7Ll8mW8vz4=;
  b=BSehgHNFmqevsP+dfxe+28u5IUxtERVCLLtVnNvKbijlq2dcwsIMBcR9
   VbroP9hYKZl5i59jQNvnaQ1jjZVtAiD9bNoMApMQHP93RVIgTQkHc/ul0
   Mf+kdIK1xFBFT5P3XSq1eoDY06p1Oa2/aPNF7tdiT0saAY+1qV9y4CVTZ
   6EEvGgm7CmYU4VPpCwuJfu7i8ETyIba1j1g4LEL3S5lY6tmlWPPND+d4X
   AEiJ8tauAwjj7TvrxazMPXE14wR18LCaPGUVsTd4ZZ8rKeeKpzzlMl/8I
   YR2e+TcBg8vEroMvr9rx6l/5j+VFKSfLP/9ZMdmfB+PkTwEIWEG7HvPJ+
   w==;
X-CSE-ConnectionGUID: Lr34cDoGSD2ZLP+BWnAQSQ==
X-CSE-MsgGUID: wkinxRHLRQKcrE7F+Lkbsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35888283"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35888283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 14:14:41 -0700
X-CSE-ConnectionGUID: hEpRfrxtSc2wpBfi/zcNqQ==
X-CSE-MsgGUID: t1UqsI6oR3mc3m3ck0a4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="67203521"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2024 14:14:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snPEz-000DyZ-2M;
	Sun, 08 Sep 2024 21:14:37 +0000
Date: Mon, 9 Sep 2024 05:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] tsm: Add RTMR event logging
Message-ID: <202409090447.mSy6H0u8-lkp@intel.com>
References: <20240907-tsm-rtmr-v1-2-12fc4d43d4e7@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-tsm-rtmr-v1-2-12fc4d43d4e7@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20240908-142434
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240907-tsm-rtmr-v1-2-12fc4d43d4e7%40intel.com
patch subject: [PATCH RFC 2/3] tsm: Add RTMR event logging
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240909/202409090447.mSy6H0u8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090447.mSy6H0u8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090447.mSy6H0u8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tsm.c:821:5: warning: the value of the size argument in 'strncat' is too large, might lead to a buffer overflow [-Wstrncat-size]
     821 |                                 sizeof(sync));
         |                                 ^~~~~~~~~~~~
   drivers/virt/coco/tsm.c:821:5: note: change the argument to be the free space in the destination buffer minus the terminating null byte
     821 |                                 sizeof(sync));
         |                                 ^~~~~~~~~~~~
         |                                 sizeof(sync) - strlen(sync) - 1
   1 warning generated.


vim +/strncat +821 drivers/virt/coco/tsm.c

   788	
   789	DEFINE_FREE(shash, struct crypto_shash *,
   790		    if (!IS_ERR(_T)) crypto_free_shash(_T));
   791	
   792	static ssize_t append_event_store(struct kobject *kobj,
   793					  struct kobj_attribute *attr, const char *page,
   794					  size_t count)
   795	{
   796		struct _rtmr *rtmr;
   797		rtmr = container_of(kobj, typeof(*rtmr), kobj);
   798	
   799		const struct tsm_measurement_register *mr;
   800		mr = _rtmr_mr(rtmr);
   801	
   802		struct crypto_shash *tfm __free(shash) =
   803			crypto_alloc_shash(hash_algo_name[mr->mr_hash], 0, 0);
   804		if (IS_ERR(tfm))
   805			return PTR_ERR(tfm);
   806	
   807		struct _mr_provider *pvd;
   808		pvd = container_of(kobj->kset, typeof(*pvd), kset);
   809	
   810		ssize_t rc = down_write_killable(&pvd->rwsem);
   811		if (rc)
   812			return rc;
   813	
   814		if (!rtmr->log_in_sync) {
   815			if (mr->mr_flags & TSM_MR_F_L)
   816				rc = _call_refresh(pvd, mr);
   817	
   818			if (!IS_ERR_VALUE(rc)) {
   819				char sync[0x100] = "SYNC ";
   820				strncat(sync, hash_algo_name[mr->mr_hash],
 > 821					sizeof(sync));
   822				size_t len = strnlen(sync, sizeof(sync));
   823				sync[len++] = '/';
   824				len += snprint_hex(sync + len, sizeof(sync) - len,
   825						   mr->mr_value, mr->mr_size);
   826				rc = _log_extend_line(rtmr, sync, sync + len,
   827						      _rtmr_log_size(rtmr) > 0, tfm);
   828			}
   829		}
   830	
   831		if (!IS_ERR_VALUE(rc)) {
   832			rtmr->log_in_sync = true;
   833			rc = _log_extend(rtmr, page, count, tfm);
   834		}
   835	
   836		up_write(&pvd->rwsem);
   837		return IS_ERR_VALUE(rc) ? rc : count;
   838	}
   839	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
