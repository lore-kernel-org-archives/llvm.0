Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072786;
	b=oiZ5GAi03tdXp4LJD3imuG9VbXQgajb1+FZRPZYg3Gez1Axt2sh2rIodv+8XRP73apSy
	 vIsqvBWsbYj5SlVTHBnBNXFBkqEu8CFaxFHCg6nhehFcOJFmeNf0Y+9ERWaGnwGj5yI3g
	 viocURb+8p5N8qczMfDA2Ki52DWs1bpIWhVIRNMcButvwMsjIsnDRgsAISnrnn3rl5sKO
	 8qqMAalx4cSkkJDN/1ac+6AdH4Z4pl0VYcJfbGjGBf/kHWMueSxRR7cXE7Zfx+Cy19gJ+
	 vLZ48rcJUZPVJT6uyDe3cdLyscd0f81vUXsmT6SJ1YtNNbXaGxGuRPq+9rZnIoeKdMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072786;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZZaB5IzI2kTBsPuo710t63jHDwLpM0jv2srG9Kj4Ldc=;
	b=h0mJwsoq2c5Xw1T9+Y3Bcl3HMahcDhqep6orMUa/JWPd8zSsMqoj8B1kg2D0yp9MUPN6
	 pgpDyKpWbZ788hu9djYS73ZVzz/0CgpJkpRwchCBJVi2J4UgeWCD2VlGfuso9JdJZAhqR
	 ob8xH3nu6CdiMlxVUfzhHV79V6Qdw2xoFH4GgiJiXF/EcLVDO+lLtjmahqI2klxJBTF7Y
	 WdbGhppz6CcAvPzmpiivny8rF54/Kb8Gsn2wXkdfQpgDoim85tanb12Wmm6kOIRc/kUqL
	 xcQkjs2JFXxK/NCvSivk1gF1Z3hItu23sl0+DT0Uf18VGfIlmrDhSTCerAQZr8vwm4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eo8iGIXU;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F7D606A325;
	Thu, 19 Nov 2026 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eo8iGIXU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795072787; x=1826608787;
  h=date:from:to:cc:subject:message-id;
  bh=BjHNuu1JXThROSIDqDGv+Cb7Vu749ORkKEa5TGDn6Bk=;
  b=eo8iGIXUzls6TF4YzY7taMqFDRKHI2DZVOavUIpHwoFpeVjZ17I5gMGb
   dLxESf/uCH5t2lQT9fRJxBcrtxC1SerhknVvkhYnh6oE7TEmmpvuUkInf
   qkrMGXYHCjYbgC+OlcO984OD8647V1MKnlbEsJSI59545SGBLrOocCa5B
   Zw534y8mTpBlb1aYITcAwyq7cEI0oa9wVjtRNhfDU4gCEA7Hwsh6Hcxm5
   MWQbBc5u8x/WQJg7R+l70ghasqVoqg8/0WHRsyqbbZOIvByPbn822SXqg
   nB1d6Fxhy/SNmD5eYOtVJSj2JGeIhY1dyEpV7vglODh6Z+xIgibSsBdja
   A==;
X-CSE-ConnectionGUID: k5INv0v6SXCPcACYt/6C5g==
X-CSE-MsgGUID: wC/K88ggTsS4cHD+Rj1ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3757005"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3757005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:19:46 -0800
X-CSE-ConnectionGUID: mupJ6O8tRsO8HmQGaNsz+g==
X-CSE-MsgGUID: 8+oD5v1ETAe8Sxoc8VqKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10164457"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2026 23:19:45 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwQo-00000001FHS-1edD;
	Thu, 19 Nov 2026 07:19:42 +0000
Date: Thu, 19 Nov 2026 15:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/resched_ipi_for_non_waiting_req 1/1] ERROR:
 modpost: arch/s390/kvm/arm64/kvm-arm64.ko: symbol 'arch_smp_send_reschedule'
 undefined!
Message-ID: <202611191516.1EQ2fw5S-lkp@intel.com>
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
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261119/202611191516.1EQ2fw5S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191516.1EQ2fw5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191516.1EQ2fw5S-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: arch/s390/kvm/s390/kvm.ko: symbol 'arch_smp_send_reschedule' undefined!
>> ERROR: modpost: arch/s390/kvm/arm64/kvm-arm64.ko: symbol 'arch_smp_send_reschedule' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
