Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534384;
	b=18HXRJX4HPtoYXWG8L4C9N8yhQ8dycE1SUrPZ5wknywPoqmyiHoN64FbUfpMp9XvnL+G
	 sEy7CHy7wKzTpxizTiLvPuOXSX7bTvMKxJVvzo3Ay2dPUL4Hi3hsLBi2ClHxofQOEN4py
	 fmNPhj6B4w89IXqM0WKEysuozltWqkO4M28yXmjbYnps13ihOPu7B2M5HOZgk30/dCYrB
	 7vf0QFNifbY0FTdrTLv3aozWfX4XbaEoefpoMTy1BzgNGFHNlLuJTO/RcPoc00m/DSYI7
	 mzisAGbTV2CihXqn/t5w/thbztW9JbB+DktlAAvjDqaiA4JzZBuGJjByM9fGunT47iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gISKFZgrPgYjpdXhdgkjZ88SIU6lDLBMB+wC3wrVwpg=;
	b=QDt1OosJLArpQaXFbqmQvYQALKrnJL9kZUZTd4mebuDCFhN1bxpgPAZ5EmcbEv1OJdSJ
	 UPbkyalRKhIvNaC1clXnmWUtVaGVgD2iGaMPaa+4xVv7yM7gVFiy50QKP8L1YCDsIbI86
	 FxFHauSbudCU4tRnoA9xnJxZ4/VK2KGheObWOeZs2t1pyAVRPIs7LMwICw7OpzoRpDTy3
	 4aNoTbClXgtugN8DDhILLsROqSjI5sUKdr8fMSR+dVtryDo4hsr94zb08o2ceOu9YfR94
	 SyDFplU/ZPBPPbNhcaGgk+jupUhJgYxMjqzIShSsLMfauN8Dcvi3lcmG+gWUDbJEkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPWhDbDN;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E3606A323;
	Fri, 13 Nov 2026 01:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPWhDbDN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794534384; x=1826070384;
  h=date:from:to:cc:subject:message-id;
  bh=RUk3zXnJjj8KQt+Gx7cF1Jsyg851xFUNTW1+wCe00So=;
  b=VPWhDbDN25qiEP7g2CzWfk3mWOL/Qe67mSU/Zr2IkwH6FZNFdB4O++A6
   MhjOfw6aqpYX7CZap5DG9CWCyqWQ92X9OaT5xmsqHBQRRfEnfjDwiYXDn
   fA/rT8NguppDv2jErrDfJYOXD+P6U/dja0QxA1pXGrjRXisihZPeMrhnU
   b2FEAWzPiLOH9dUeLUQBVz8hgIjyjpXD8SIKu8Gwly6KyZaj2JSONK5e2
   x/I4hQYM+hvB8DZn1e3Twa1ESaM+mOXAHFBSzwQsSAwlpmoxJLXjbo/cD
   S3VBgV2qnAOwZtzf7k+hffhz0jAgM2K2TbJRC60yeosP86NdylVs2Lelh
   w==;
X-CSE-ConnectionGUID: 3sQQyZxIT9CbmPvkfpraVw==
X-CSE-MsgGUID: 7TKFeiQ9RCeMaC17ZU5YTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3361732"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3361732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 17:46:24 -0800
X-CSE-ConnectionGUID: tmg4FqBeQBSi9NERwJN8Ag==
X-CSE-MsgGUID: uqGqxfbXREqrRwJwzytz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8694046"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2026 17:46:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRgMt-0000000014d-3Pwi;
	Fri, 13 Nov 2026 01:46:19 +0000
Date: Fri, 13 Nov 2026 02:45:28 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_ffh_ffa 4/4]
 include/linux/arm_ffa.h:189:30: warning: declaration of 'struct
 arm_smccc_1_2_regs' will not be visible outside of this function
Message-ID: <202611130207.5etShYWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_ffh_ffa
head:   97703bfac03a9e3c2f351b14974457f8bd9f8775
commit: 97703bfac03a9e3c2f351b14974457f8bd9f8775 [4/4] firmware: arm_ffa: Share FF-A version negotiation
config: arm-randconfig-2002-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130207.5etShYWM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130207.5etShYWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130207.5etShYWM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tee/optee/ffa_abi.c:8:
>> include/linux/arm_ffa.h:189:30: warning: declaration of 'struct arm_smccc_1_2_regs' will not be visible outside of this function [-Wvisibility]
     189 |         void (*invoke)(const struct arm_smccc_1_2_regs *args,
         |                                     ^
   1 warning generated.


vim +189 include/linux/arm_ffa.h

   182	
   183	#if IS_BUILTIN(CONFIG_ARM_FFA_VERSION_NEGOTIATION)
   184	int arm_ffa_version_get(void (*invoke)(const struct arm_smccc_1_2_regs *args,
   185					       struct arm_smccc_1_2_regs *res),
   186				u32 input_version, u32 *version);
   187	#else
   188	static inline int arm_ffa_version_get(
 > 189		void (*invoke)(const struct arm_smccc_1_2_regs *args,
   190			       struct arm_smccc_1_2_regs *res),
   191		u32 input_version, u32 *version) { return -EOPNOTSUPP; }
   192	#endif /* CONFIG_ARM_FFA_VERSION_NEGOTIATION */
   193	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
