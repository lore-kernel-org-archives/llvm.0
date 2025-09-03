Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38243155333;
	Wed,  3 Sep 2025 22:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756937279; cv=none; b=SZvL80/buuBT2fS3LGZ45JzGOQrrQYegW36I1eaf/+fgQ5uz8pV2msJZVhw9e2Gpz96sAyiqPXpMVpL0t17IMw7bZCO6+vFDo9g7e+z27+kYGRjK7xaTQGuz2eEZb60ZftEqFhXoJxWm5Zb1wZlg1Xo1RtaPWX13GZ0vcJFbh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756937279; c=relaxed/simple;
	bh=A9qEpdV41NMyUc4ljsz9G5jdDlMKoP5XpDVSoLbSoGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etqIrmFUUPtkYvr+mzVy3bK5+8YXr8BxPWZWdwR2EKewR0ewRwkb+4A+grESJWB+fKjcT5bL9PJ/l6/AGcXfIeQQ+vC7l/4kx69oCZsmAzE5BexlQ5cu7PHTeU0/+/ifd0dTI4LyVn8xEkv3gRsKpIzkRgJem19+d/KW4mUh22g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjCM80cn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjCM80cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756937278; x=1788473278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9qEpdV41NMyUc4ljsz9G5jdDlMKoP5XpDVSoLbSoGM=;
  b=hjCM80cnPzu3FIPNVtFEOq3iLi1YetABwf+6UoF6Wzi8nguEdKrTan5t
   8GZmhcxLE9Naxwr9XE/LPDKOoLM7JoY5gTlacaSfgWljvF8zki1gz7eBw
   TEpAoxoqnMB3W4y7xplBmxFzmaA8uJ7Dv2IuTkIbBjYe4JmjQ27mcIOv7
   ncvOVIn+TkkM+VBz+kh4fXtNUGGzOy/7zVaYBkaFSlW3AQuscO6GGUrNo
   CZMmdanmsf2WayJ/3LqFzcM0SvH7apexxY1tCx09csXWRhrX/MO78YPMb
   h1ZsgVLn5amaskFLW/mSFUPjHzOrhSsOMAVi1n7sc9WhHL5OlyzvBl00h
   Q==;
X-CSE-ConnectionGUID: sAYCIa95Rj2zoeU5szV+8g==
X-CSE-MsgGUID: 4+3szSK+QySax2HpiYAt9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59376143"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="59376143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 15:07:58 -0700
X-CSE-ConnectionGUID: Kz4haBCOQOObo4QcGRY6Pw==
X-CSE-MsgGUID: mKTvKUjJQAuSsa7tc4Qzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="202654287"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2025 15:07:56 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utvdy-0004TO-1V;
	Wed, 03 Sep 2025 22:07:54 +0000
Date: Thu, 4 Sep 2025 06:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-hier-prototype 9/14] clang diag:
 include/linux/sched/ext.h:214:42: warning: declaration of 'struct
 task_sturct' will not be visible outside of this function
Message-ID: <202509040505.EWMZKYIj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-hier-prototype
head:   7443f4ccb9e360cd50e991db81d27e3514f1be65
commit: 9c899613efcfc4e07c3b6a57e45ad3f95e637bdb [9/14] sched_ext: Keep dying tasks on a separate list
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250904/202509040505.EWMZKYIj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040505.EWMZKYIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040505.EWMZKYIj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]
--
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:16:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:88:
   include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]
     214 | static inline void sched_ext_exit(struct task_sturct *p) {}
         |                                          ^
   1 warning generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>> clang diag: include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]
>> clang diag: include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]
>> clang diag: include/linux/sched/ext.h:214:42: warning: declaration of 'struct task_sturct' will not be visible outside of this function [-Wvisibility]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
