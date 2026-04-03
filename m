Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847C37FF62;
	Fri,  3 Apr 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205966; cv=none; b=uCDrWFs5jeQ6RWnpTA0Q+xkyaw0L0xFOLEYJiBnd4oUMQkG2yFo4kkEP/xxzG5lPR6MjGOGCM5OoQM6Dm7UYnEJlp1w4ORc8/naUPFd4BS72P2EygYDi0Exf7z6jt6IQNFHhNGbh0582Rnq2py2ZYnvF47QY+Tb4mnpdpBKTcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205966; c=relaxed/simple;
	bh=dGzvD3WMZ7ApgfNMnWpS6QRAoMFpStksJNke3nP04jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYdeHgFKMq16FiZyuNDEUigJvSMpkCJVE33h6zh29f0bfwdk44u88NfWTQPRrzHvIy5bG9Cbkokf59AZkwmlGL23p/zJy6jhz+kMpOTBi92FM6VP25t0f2eaAd5xjARQpFozRJuZyuBffE0jCEywRXlujWTy8NffDyveeb8WQqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mo+NHiWa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mo+NHiWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205965; x=1806741965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dGzvD3WMZ7ApgfNMnWpS6QRAoMFpStksJNke3nP04jI=;
  b=Mo+NHiWa0AroJKrYIxyzed56dYUIkuxpGSd0haaVI4lBSPKCnxt5ufaw
   iuhsNMFS3wPhprDaKfnYC4yJsFAn9ROpzKiLMqLQ9tKSHiTKEvSy6MTsN
   IxhbbDoIjUfZzW9NxykP0ae4vJ5bFpEmd5GPg/NRytgfIGuOaoPf/CUgP
   izwF1Nzg75t/eVG1uVFZZYKhaxWTgHZ5D/iQaB/CkMOcZBwHdPy4tvw4T
   qNRTE9uYTo4zhW+YBRNRd/GNzLQBIWXVsQWRk7Ni9CkO0sHHieAlaK4bl
   orSsZA8bLal5CZeiKbIj4JP6uHx6lRJmSvWWH8vwtxXmksKwxJrcXP5sZ
   g==;
X-CSE-ConnectionGUID: /m+QNbo4RNeYHk1zNoCHAg==
X-CSE-MsgGUID: Jta+YpuKQqWcICAVLlSydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889044"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: EslWojyKRh+qDZ3ITd05Sw==
X-CSE-MsgGUID: N93IYWjPRiC1dISNdbkVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368975"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000015x-1jED;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 3 Apr 2026 16:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
Message-ID: <202604031016.SQiyhL8h-lkp@intel.com>
References: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-cpuidle_ipi-v1-1-d0ff6350f4e2@oss.qualcomm.com>

Hi Maulik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Maulik-Shah/cpuidle-Deny-idle-entry-when-CPU-already-have-IPI-interrupt-pending/20260316-155453
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260316-cpuidle_ipi-v1-1-d0ff6350f4e2%40oss.qualcomm.com
patch subject: [PATCH] cpuidle: Deny idle entry when CPU already have IPI interrupt pending
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604031016.SQiyhL8h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031016.SQiyhL8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031016.SQiyhL8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cpuidle_enter_state+0x3d: call to cpus_peek_for_pending_ipi() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
