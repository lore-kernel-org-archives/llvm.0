Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126603;
	b=YbKg0taNRau+Kzu5Fnf7st02HwOHicgzmqXN6Vjn6Bbv575q5PgCnolXQr7aZ0G3y3dA
	 I04VzQV0M5OWUnfdlefM70hAXmllNOnzyU/xc9kFPJvR0QNdp1GjBbdVll4Kj7f7KFUAl
	 J89CqOk0WttNSVWgZZ7QotXm8w88YeDApIZL//f2ht4bHp5KCutwausZS8cHnKs1DIbY7
	 dGXmZl+9XvJJ/4rZYECQe98IG0i1h0C9mOSbp/f3CB/1oLmOp6TMluaecth3y3q3xkU4P
	 NYTvtr7rO/eWyjrwNhsxIH8p20i+JIb2N5elk/a/SXU6M8m59by2kZ2I0RE0XFqZOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=91RB5iiiOsE2f4rF73tJ97rmZZjyGA0SCODrP/VZoR0=;
	b=cul+krWLi6wTyENb2yzaqsAAgYunLmTL6Cj9R81eBfwHM9Hpo1w0sjjauT/tMd/rJd9o
	 3ei8x9gkNczq/EM5tQcf6HRPkvqljwhWfGf8M9eJ5Mx88J96FKicIQtBL9qh6oUsZp5KL
	 yHrWoCkMji4uV0LlO+g5174xXnydvj3T1Ts9AFOv6vrf65ivKNpXCl9l0GU/JEuijiG72
	 cUk/7igrN6qJMETGOmc1aB1uCd8eAtcfPtDxCImj/kt/Y0ErEEB4p05RR8ekSnbEXdMG/
	 hcHW/miyqJbFIy7VXTB0FBn0KuC//ptoYa3hH8hr8fJmlldgdLbKNEvIHAvP+EwC7Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZ85JaUs;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E95606A320;
	Thu, 19 Nov 2026 22:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aZ85JaUs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795126601; x=1826662601;
  h=date:from:to:cc:subject:message-id;
  bh=+jyhNbcOejthPr+w0NK5SGH+7ftmI1GVbAEjHJVViy0=;
  b=aZ85JaUsx1Bnikb+14OQyQx9tr9AZNYQ+ompTklq0cfbXI47sC37iBPV
   MRAEe4t64VSh/2imTebMAZRBkyATVo/yllcRD8LoC9DAetxkf2JCZ8+ra
   YxJ8k6VMr/YgCYhoGzDVM8O6b/I+I7HjcPZlamEkeyeOGHPeSAZcioegH
   hZyy/rEXpXmh/b13SgNoPZoVfzxz6WOPM6tkosmr9v/StxwAH3z1B7GW8
   Ofv9a2V2r7THhuZlm26GrhpqsLzM7FP5ME9Gk1BLaoGJzZD30tZ2ZuXpi
   cyPnyvAs8NcBAtDEP/0IgVazwuHHiZYm5Uwb3H45rsk3l2mpqO/nFbHPx
   g==;
X-CSE-ConnectionGUID: JDVshQ1GSuCDPh/7A2UY3A==
X-CSE-MsgGUID: rzkV5YZLSFa7tQht7oRW4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3887906"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3887906"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 14:16:41 -0800
X-CSE-ConnectionGUID: n0oEfzN4RNOrgVWdV3d+xg==
X-CSE-MsgGUID: nKqPnLa2RHmx2afsbrfBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10799708"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 14:16:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUAQn-00000001Gf9-0xPj;
	Thu, 19 Nov 2026 22:16:37 +0000
Date: Fri, 20 Nov 2026 06:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-11-13 351/351] Warning:
 sound/soc/soc-pcm.c:349 function parameter 'update' not described in
 'snd_soc_runtime_stream_user_update'
Message-ID: <202611200548.qRqh5vJm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-11-13
head:   437686bf7c08c92113908bda25c90a3a7761459c
commit: 37ee356977d8ce942467c69246be762a83e12750 [351/351] ASoC: soc-pcm: tidyup snd_soc_runtime_action()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261120/202611200548.qRqh5vJm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611200548.qRqh5vJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611200548.qRqh5vJm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-pcm.c:349 function parameter 'update' not described in 'snd_soc_runtime_stream_user_update'
>> Warning: sound/soc/soc-pcm.c:349 Excess function parameter 'action' description in 'snd_soc_runtime_stream_user_update'
>> Warning: sound/soc/soc-pcm.c:349 function parameter 'update' not described in 'snd_soc_runtime_stream_user_update'
>> Warning: sound/soc/soc-pcm.c:349 Excess function parameter 'action' description in 'snd_soc_runtime_stream_user_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
