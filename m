Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051369;
	b=l1AUXO/5/eHO+zrvs78L0ucUYJWpzHRvZhcvZ8uCpO35bN2ZS+4OgomaD5gbqZr/pPDl
	 gdHuZj5uHmxlBbbmEJrkb+OFFqfC0yAIKpxAQHc5wLfKgDtVfF8sjGCKiobgJPt8tc5e+
	 hEt6yLKKe/8mDuMz9xK9oZSgkdTwYpAPTlPL4d/9+m2UnHsnjj3F/c9x4CD5Nl+A5HSHb
	 9Yc0xat1NT01EQxBACBj7gVOW4OU9Y2ZpTqskgbcZztoqx38uj+Wnq8h8EzQgWRcwceKK
	 2XNuYIGK3BILedVTLGkYjAmu8cVv5FbsV62WCg3YbeO//rHBXcsFaqEl/ZIW0eTdteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051369;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vjM0BiBwBpXksYqn+QvDUxKfYWtJVi1PNYtkFnTTTvA=;
	b=Jh5fJjS5MTFltEFoNrZ1MbbGD1xFdco3iWoa16BOZcD/tki5Wvz4CJuwgYqAd9TIXwCc
	 pHs6YxsxbJlhcyge7up0xhdqjR3RDt7t27estGmKz4vukqjTu/+cRA695ZCB5SRlRTxLB
	 YUizDlHOSVoi6ByynnWs3fIysLM7TJyu3wLVChg7Q77oeScccQ+UYMeWo5fR+PBRaPtSU
	 o62LiEan5jqYXdiOixULW/008czbQ5Ns/yCB0Ry9c9eRM4n4sA6RkvhIRhB/TtfFj+pvk
	 HOq1tclHEytyXUwcczZLXV7G+I/vVAZj4D1012EWKJvp35arTDnaepCZPm5tnRK8VdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajibnJtQ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C28606A32C;
	Thu, 19 Nov 2026 01:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C28606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajibnJtQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051368; x=1826587368;
  h=date:from:to:cc:subject:message-id;
  bh=5pmrfBK98hRl7gAsasuId5/fDS109zKHAQZqkT8EcFw=;
  b=ajibnJtQRqb77pjnB5WI1FjQDdODBfmjIungqU+2/UNrQjg+UMtiN6Iv
   79CbPN4XVONpUJoSc7GWHnudEAD74UyOAU7mq2L4hfl+artAyr2QW2UlL
   G5H+RqSqctSFdCMbrUgxMgVlOv6QJ5EZTkz1Ca06XNwVra+imn9uFgDJu
   cJonUHeB+aCLZpJX2WV/FxuRDBvPb9+n+i4AlR5ZAvo20AQh8pt2LqPsG
   jMjxokVeKFP59BlqinRh4kQn0AaqQuGOYVS9MTIMfyh13IdIrt+8Ho3j1
   KA1WoheSlzZMRtT0Uh3sRF8FSPbN4qBx6B6NHSQ0xU43RhSpS6WqMqfES
   w==;
X-CSE-ConnectionGUID: cN3b1j2rSLqQqQwBv3rCTw==
X-CSE-MsgGUID: jA+u9wynTcOmStZQj81TFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3781461"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3781461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:22:48 -0800
X-CSE-ConnectionGUID: cizDIkV0RnmbvZDEnEarkg==
X-CSE-MsgGUID: swlc0ie/RvKMy0yPGRD29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10564436"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 17:22:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqrM-00000001Ej6-1K5H;
	Thu, 19 Nov 2026 01:22:44 +0000
Date: Thu, 19 Nov 2026 09:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/resched_ipi_for_non_waiting_req 1/1] ERROR:
 modpost: arch/s390/kvm/s390/kvm.ko: symbol 'arch_smp_send_reschedule'
 undefined!
Message-ID: <202611190830.nmNhtdps-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/sean-jc/linux x86/resched_ipi_for_non_waiting_req
head:   89b331f8ee69527a9e6be534d898d36ae96f17bf
commit: 89b331f8ee69527a9e6be534d898d36ae96f17bf [1/1] KVM: Send reschedule IPIs instead of SMP function calls for non-waiting requests
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261119/202611190830.nmNhtdps-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190830.nmNhtdps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190830.nmNhtdps-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: arch/s390/kvm/s390/kvm.ko: symbol 'arch_smp_send_reschedule' undefined!
ERROR: modpost: arch/s390/kvm/arm64/kvm-arm64.ko: symbol 'arch_smp_send_reschedule' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
