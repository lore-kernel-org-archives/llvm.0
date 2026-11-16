Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862259;
	b=nPnOuz024fd7xzC1lQDbK/l6isFjlJf8lf4Fj5vrbpsF/SCpFMQmslj9XNSQCAF0b0CM
	 Qn5os9FiloQ46UGmUbsZvj14Ue39PqBPUt4zK0uEQjp70mFXDxgtTEqbx4kJ2Rmm3LrV6
	 201LdHCWnJzuKbuWOBmVSPLV7+cujxMjRu+iOBIhyTDwuKF+0ZyhWeaADO7DA9ie4X+Ep
	 b8wmpUe5wJlEZ5YijOh6xCSKD6h2Ds+lNlvIgBtWUTtQE+Zi/xgXgIwoW9EY7jKvdX45C
	 Vhb3lbffIHhLHRZ2OW1TPdYTB7+xp+SnMDz+bqIPvXOlu+njB6NNkILmA6e00SwRx/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862259;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mF+5LJPny8StaD39CFoDqff04cfc3UL1BENucKw5erQ=;
	b=TeCf7A4lHAysxnyWeITsQbvtJcAylDeQVgIlxvJSFG+mLZpM9h7Q1aVcz1AYjMh5k9lJ
	 Tai+NlsOduBn50k/dkGwf4H+CQ2z0QhGcksTAw0XnijKV3zezUl2nacnU0+8+e1BTJeFI
	 aEtWko9dz8+bJEg2nDnXZ2FfHzaLKegkJrEh1whYeE5vS3NLobqqTzMMpXtAKE5L60UYn
	 91lick8+MBRyTwWM2hyHBeY1rYjpbPdksVTaDyQKiKCPcXwLqpLKD7zLLfYawnsopNa2+
	 6r5ajaEPtLnWsOw8UZgaYTJHFTbiLH6PkeoFVrOJbxiZML3VjrZNnbuBIjR9bDQ7rhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CokH3zAJ;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A59606A31C;
	Mon, 16 Nov 2026 20:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CokH3zAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794862258; x=1826398258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGPITMRExA4k1FsoRlFIhpMvIupdLuYZuYltGtidHuE=;
  b=CokH3zAJSwK4hYPEhgvSr+7kQioZJ+UX9BmsDFUaR7dfDZOkmmJ3p8no
   OKmBoJ7hULyXJyW3E8aNjzRnZy8ZU8lTVO0RPKCH+0IzKygtmHnCERdGk
   myszkeeWy6XakoO3hyBWyBgGLfphz6pWYlyS/d6iiZDDmsVVg24XimWrR
   6OTl/WK3VPRqNuNDXRJDsKgVgv5+x2n6qTKA83zQF0XPMC2X1Geq+zkKZ
   lIF2qiFoAHZz56FBZ5+3doMcgLMks4D6k+Y0rFgOnFvugg21ScrbBnY67
   XdeCxSFIvG7ClrPzz6faQjJXLdNWi4mc2LAB6emtCK7J4dZDQlC7nueOl
   A==;
X-CSE-ConnectionGUID: SyZtZQvJSeG14CwGe84s9w==
X-CSE-MsgGUID: 6jjst9MRTt2Xk/24l8zPUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627624"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 12:50:58 -0800
X-CSE-ConnectionGUID: 3br2HG2yQbaqG5uDAy28jQ==
X-CSE-MsgGUID: 7pnb/xcOSci17EykFV5phg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9660346"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 12:50:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3fB-000000019PN-24hQ;
	Mon, 16 Nov 2026 20:50:53 +0000
Date: Tue, 17 Nov 2026 04:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: huang zheng <huangzheng9869@gmail.com>, jaegeuk@kernel.org,
	chao@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, huangzheng1@xiaomi.com,
	Huang Zheng <huangzheng9869@gmail.com>
Subject: Re: [PATCH v2] f2fs: add checkpoint step timing statistics to debugfs
Message-ID: <202611170426.9bqr9xq4-lkp@intel.com>
References: <20261116095011.2868219-1-huangzheng9869@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116095011.2868219-1-huangzheng9869@gmail.com>

Hi huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master v7.4-rc3 next-20261113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/huang-zheng/f2fs-add-checkpoint-step-timing-statistics-to-debugfs/20261116-175011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20261116095011.2868219-1-huangzheng9869%40gmail.com
patch subject: [PATCH v2] f2fs: add checkpoint step timing statistics to debugfs
config: i386-randconfig-1010-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170426.9bqr9xq4-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170426.9bqr9xq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170426.9bqr9xq4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:1744:3: error: call to undeclared function 'update_cp_stats'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1744 |                 update_cp_stats(sbi, cpc);
         |                 ^
   fs/f2fs/checkpoint.c:1744:3: note: did you mean 'update_ckpt_flags'?
   fs/f2fs/checkpoint.c:1616:13: note: 'update_ckpt_flags' declared here
    1616 | static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
         |             ^
   1 error generated.


vim +/update_cp_stats +1744 fs/f2fs/checkpoint.c

  1732	
  1733	static inline void check_cp_time(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  1734	{
  1735		unsigned long long sb_diff, cur_diff;
  1736		enum cp_time ct;
  1737	
  1738		sb_diff = (u64)ktime_ms_delta(sbi->cp_stats.times[CP_TIME_END],
  1739						sbi->cp_stats.times[CP_TIME_START]);
  1740		cur_diff = (u64)ktime_ms_delta(cpc->stats.times[CP_TIME_END],
  1741						cpc->stats.times[CP_TIME_START]);
  1742	
  1743		if (cur_diff > sb_diff) {
> 1744			update_cp_stats(sbi, cpc);
  1745			if (cur_diff < CP_LONG_LATENCY_THRESHOLD)
  1746				return;
  1747	
  1748			f2fs_warn(sbi, "checkpoint was blocked for %llu ms", cur_diff);
  1749			for (ct = CP_TIME_START; ct < CP_TIME_MAX - 1; ct++)
  1750				f2fs_warn(sbi, "Step#%d: %llu ms", ct,
  1751					(u64)ktime_ms_delta(cpc->stats.times[ct + 1],
  1752							cpc->stats.times[ct]));
  1753		}
  1754	}
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
