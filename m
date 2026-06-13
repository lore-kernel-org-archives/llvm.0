Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B78211A09;
	Sat, 13 Jun 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334437; cv=none; b=U9i1Qa8rFGXJOiW+Z/bnPZ2g6f2hS4KlvGS+btOAoONOEVQj5KCnviXzJR+w+SsI52IF4ThZR6apSOP/xmYAV+WhcUvzL02LjzL/udI+a5neARjo9Ea6QOrHjYqZkL7lJdDxTiy5uMd659ATr49HYK/dubqEmNKMy2qvbhIrzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334437; c=relaxed/simple;
	bh=zKFfoUEHkt6xHIp2QhFatO2ay9y1acR13jDC3ENok1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jXjw7AmTmg3iMBPrzG8dZKMzW1ckY+L/+kPVTXu5u+vVCw6VUIR4vrCHfNfUztLzrCzkacFbk+VJiyzim8WSA74y/RCZVGCF7QP637ZwmYBvQG39nLNhnMfOgkngTFkrKrZqTuJi5N57dxd92+a5KeP05RYr9hFWx1Nm0QnOFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb5b57St; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb5b57St"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781334436; x=1812870436;
  h=date:from:to:cc:subject:message-id;
  bh=zKFfoUEHkt6xHIp2QhFatO2ay9y1acR13jDC3ENok1g=;
  b=lb5b57StJjfkcCvZpULW2xGrsZCRwuwJlJxwxXyxFIeGGNJO44WmYiSK
   isSObFB7plB6UG1gy4LaqNhehxkOMMQNvXm49HdPH5Jt3nrOcsHIvaj70
   2D/H3DDHLLu0b0BPd1IMeNyi6/v9Kwrim0IsYOS4w+0c9X5JuYa/kff4z
   ENMVRfYQNiQKZNPNiD73gPb80VfajoWDJp386lsknnnjWUvRiBxe3iU5v
   TDZJ8ESmOm6nzCBjXEvVusy7h1EtTm+d7HNmQThnVhRwekcNGQntMAzoH
   n+AXABIRINpUWsH9Tjo6yl4aL27eatztR6TRTUgzR91+J/CBNjUr2Pmgh
   A==;
X-CSE-ConnectionGUID: fpcSGORNTeGKYXT9ArTTjw==
X-CSE-MsgGUID: iXcq7zVqRi+GZGqX840iRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107593776"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="107593776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 00:07:14 -0700
X-CSE-ConnectionGUID: nOcm7hJwTI+YXxxvjYH19Q==
X-CSE-MsgGUID: j4WrVqqESIych8gI/0xSwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="252109947"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 00:07:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYISV-00000000PlQ-0Qrw;
	Sat, 13 Jun 2026 07:07:11 +0000
Date: Sat, 13 Jun 2026 15:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/24]
 drivers/nvme/target/bpf_ops.c:11:20: warning: variable 'nvmet_bpf_ops_btf'
 set but not used
Message-ID: <202606131433.zX755KzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/24] nvmet-bpf: eBPF struct_ops support for log pages
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131433.zX755KzZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131433.zX755KzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131433.zX755KzZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/bpf_ops.c:11:20: warning: variable 'nvmet_bpf_ops_btf' set but not used [-Wunused-but-set-global]
      11 | static struct btf *nvmet_bpf_ops_btf;
         |                    ^
   1 warning generated.


vim +/nvmet_bpf_ops_btf +11 drivers/nvme/target/bpf_ops.c

    10	
  > 11	static struct btf *nvmet_bpf_ops_btf;
    12	static char nvmet_bpf_ops_name[] = "nvmet_bpf_ops";
    13	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
