Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF10E188A13;
	Fri, 27 Sep 2024 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426409; cv=none; b=h897YB/JbAkHOckieLEybwfCRkz0hllxQNjolrsVpyCwamh1Imj5548GdrIeWv4hXauWxtem7v8q/iaLONpzxoBbf1AmF4I+Rp3V7PBFAQbep854HjO7ra0z02F2j+DlsVjeIOPPawAC+widntIAZWUzi8CI8W2XITlrFxoQYls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426409; c=relaxed/simple;
	bh=kNx1mLqX6E6DmKSnPlDb9wAM3dBtYX1FM0q0Y7RXu4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQKudhN5Q4cfvQk9KVOTIJ8Gug80kpKSpkWS6/lUADVcaFpR5lkCOMO6xFgaETXSlPGSPSUtDA81ZfYZqqILlM2gIO6pg5qAivIIz0NIARyuxUNOtAiGkEVZyRFz930UnA9tfilTsBmQ7I+M0lvFqsm6T9ys+LJApWjDR9R1wYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fd8M1a9c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fd8M1a9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727426408; x=1758962408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNx1mLqX6E6DmKSnPlDb9wAM3dBtYX1FM0q0Y7RXu4w=;
  b=Fd8M1a9cGjK4zOc25bJ86TX6QGOWHsayYvmuBJEY/o3GPVJkWubFVfOg
   55pKlhp++sMuDQh2oAgkJiuOTqdOmKyt0qFbkg+HVT1BUScy8fWiZAC4y
   2cpjiLa/l9L+3nOJHBJNEV/MuaSrHty61PcTjtlV0BYqnLsSOZ2U9IZPf
   +isX7uvhD/sL+orC1hMk/IeonI3XkihtwTcztcGVPbPNWdytOMRdqJ0B6
   fKwgOmGA5Pz/1iwevuFC1Fet4Bw/8zdSAltCXE5T7LbyO3nmNcOp4lmKs
   /1W4JdBkE7FhgZ+Xb+qqBaDO/Dz1ZnzhfMdD6MZsJrDKN8Mq+D7jmofh0
   A==;
X-CSE-ConnectionGUID: GXdU1dvkRoqKRRpn860QhA==
X-CSE-MsgGUID: TUykpkmzST2mBRAS8OtwmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37944374"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37944374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 01:40:08 -0700
X-CSE-ConnectionGUID: fQa0bZJrQluouik0Kesixw==
X-CSE-MsgGUID: 4Let26QHQSeDWOCpFbYmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76838539"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 01:40:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su6WB-000Li5-2t;
	Fri, 27 Sep 2024 08:40:03 +0000
Date: Fri, 27 Sep 2024 16:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/affinity-v4 11/20]
 kernel/sched/core.c:3428:32: error: use of undeclared identifier 'p'
Message-ID: <202409271600.hacg1D3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity-v4
head:   c98b17d85bd1b6b8919504cc48995765c3ef5756
commit: c147dfb3fc25b06f03dff1afcab62c99adbbca66 [11/20] sched: Handle CPU isolation on last resort fallback rq selection
config: arm64-randconfig-004-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271600.hacg1D3V-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271600.hacg1D3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271600.hacg1D3V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:3428:32: error: use of undeclared identifier 'p'
           mask = task_cpu_possible_mask(p);
                                         ^
   1 error generated.


vim +/p +3428 kernel/sched/core.c

  3423	
  3424	static const struct cpumask *task_cpu_fallback_mask(struct task_struct *t)
  3425	{
  3426		const struct cpumask *mask;
  3427	
> 3428		mask = task_cpu_possible_mask(p);
  3429		/*
  3430		 * Architectures that overrides the task possible mask
  3431		 * must handle CPU isolation.
  3432		 */
  3433		if (mask != cpu_possible_mask)
  3434			return mask;
  3435		else
  3436			return housekeeping_cpumask(HK_TYPE_TICK);
  3437	}
  3438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
