Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAAC1DDF4;
	Sat,  4 May 2024 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714845708; cv=none; b=Dr6s8qrSpQrj9TejgSi2zIVPGvve6iZdIc3k3/+PwyJP3Hld4S9L1MwJw6SIv2f0i0Gf5MAnEDIxULquuHKBptLCcVfSAFZQ5wJFtb4yhw9KHWqsBMOJC9OR/pV22hsiD6FhOF64cwYq2SHKD+79P7Sfhn++DIAXW0/7WJgbfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714845708; c=relaxed/simple;
	bh=CJyndH132PyZbSDkkvk1fLFsu4IFHGh/caTalDMZGNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RMD6hxr/vtvXOkJ42PcoSuDTO8KBot9CD7sOOc/Rx4I0hwC/ss3qTTSqqGR0/ym15fldYTIHaZKR7JKU1JSkiN6saiIE8qUvSQzzL+CDTDwv2DgF9ri+tIXY5+4XctS9d2MUHmBKj2eAuvKXP03dZLF6kzlcfWSVpjIBpnAb96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQFuzJDq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQFuzJDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714845707; x=1746381707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJyndH132PyZbSDkkvk1fLFsu4IFHGh/caTalDMZGNA=;
  b=QQFuzJDqtHXLy2FHoABqVldiySMbqV3+VnyXCxcEetSTItsGtT2kL/aC
   DBi/Chnb/Orevfdtx5tUaL4Hq5dgeLvD5Ikh1HusUQb9DdovGZEXe7q9N
   hNO8T9WkQ2iiH4H2qeHCuet0ypNdWPm08m7qyStznebB/Ov5c3B8Y9iKa
   vZOqEQYu28qkaBUlPv8kTJ/dAbI3xULCjbtgcoTbG67Rx0dxji0uzPhbE
   j3a3JDQPotJ97xKN7NvMY/QElrHzvUh+gSk8uXIDjQnP2KHcUuZpjl059
   XmILoPsCkZRt7m5dme7w/0FckzF+AdRzqJxI3tMiPKTjEKuVLkuFeTIZV
   Q==;
X-CSE-ConnectionGUID: ZNxrkJxOQaOKlVotErVlVA==
X-CSE-MsgGUID: TF0r+INMQEKw3xh02td9xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10487391"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="10487391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:01:44 -0700
X-CSE-ConnectionGUID: xVWCS8SfS6C07xy9wRI55g==
X-CSE-MsgGUID: 87T944gpSAexNbbYJgtjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32562282"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 11:01:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Jhb-000D2m-36;
	Sat, 04 May 2024 18:01:39 +0000
Date: Sun, 5 May 2024 02:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 5/27] include/linux/kexec.h:537:42:
 warning: declaration of 'struct kimage' will not be visible outside of this
 function
Message-ID: <202405050113.Kgjow73K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: 4d945e934565554b4f997c57162e833303f56cb0 [5/27] kexec: Add KHO support to kexec file loads
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240505/202405050113.Kgjow73K-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050113.Kgjow73K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050113.Kgjow73K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/panic.c:15:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/panic.c:25:
>> include/linux/kexec.h:537:42: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
     537 | static inline int kho_fill_kimage(struct kimage *image) { return 0; }
         |                                          ^
   2 warnings generated.


vim +537 include/linux/kexec.h

   534	
   535	/* egest handover metadata */
   536	static inline void kho_reserve_scratch(void) { }
 > 537	static inline int kho_fill_kimage(struct kimage *image) { return 0; }
   538	static inline int register_kho_notifier(struct notifier_block *nb) { return -EINVAL; }
   539	static inline int unregister_kho_notifier(struct notifier_block *nb) { return -EINVAL; }
   540	static inline bool kho_is_active(void) { return false; }
   541	#endif
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
