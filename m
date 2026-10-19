Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50C48D874;
	Mon, 19 Oct 2026 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395508; cv=none; b=WBGOUKBdbdn0fCOHDrn9DSjNG6yG63L2+n7WrGUF9nEdJ9OApWgqJjkh8vt699WXF6O8Y/+1rgtERL55eedJTz3L8zfw2eG+jyjrTwW5GgFgJqbCMfME4wbTsMTOi/FSRWqCwm8NII4lob3c8Vr6gkjkiTr5Ge6nnipmmY4slN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395508; c=relaxed/simple;
	bh=vwEhsDoaz94vi3L7HLiRt10cVXXZiZEpuehGWh8MUcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g++EX8YVdfyOm7CtQsnCLwXlNP413qY/RahjdjXnvUm55CJKKLQoFdP/nsPQ1nJoGanznCzjpJGugXf+ID4FuBxYeEe1i57g+Oa347PqAMHINPx5rTPh82z6g5AMUYO8R/lpDjv8yEnVL+DNJOsWtL1iKEB5TAb50+1ye+HEh+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByynpXcw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByynpXcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792395506; x=1823931506;
  h=date:from:to:cc:subject:message-id;
  bh=vwEhsDoaz94vi3L7HLiRt10cVXXZiZEpuehGWh8MUcE=;
  b=ByynpXcw2jMs+KKQzcDO1twvrt3JKKY+L+modHSwdb/R2M32HOwHslhk
   YUXwH7N8hZGyHHWHLaN+z2E1kH12GJ/1AXtRH/TyNTQ4DL8HJ6+kdWZhA
   NosYQuquIQUTHSH5QH9AFrYnkOHvPxCafefC8vQp0EqR8LYp42OLMOdLI
   MTSoffkYk+lfuLdwLKu6oORLEhQVSyS+eFme21OZzmgi1tcsXeyGuTBAf
   IydkllQTbjFpcsCQpF36EBEMg5hOo06DJ+tMKfYXRN6UhRp+N1/IETDTR
   PtRen7k45k1+fHArpSzRUo4urtYijL3TrWdsWn4IM33RLQ/NvCzw1iKsb
   g==;
X-CSE-ConnectionGUID: EKeab58PScKnGnQo5ou92w==
X-CSE-MsgGUID: aWp2z6YoQWmN8de16nwEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1084938"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1084938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:38:25 -0700
X-CSE-ConnectionGUID: KYurmUuOQJOf3uzvvxgcDg==
X-CSE-MsgGUID: N4zVDU/1TiqmfuemivamEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2532981"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2026 00:38:25 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIhwr-00000000LNu-3Pgj;
	Mon, 19 Oct 2026 07:38:21 +0000
Date: Mon, 19 Oct 2026 15:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [jic23-iio:testing 55/58]
 drivers/iio/sensorhubs/osf/osf_core.c:17:6: warning: stack frame size (1344)
 exceeds limit (1280) in 'osf_core_init'
Message-ID: <202610191514.fRYyu0HX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   43ffda3c7f8456bbe641ae8249a077a361b97880
commit: 2da37c28edc66848f7ff302011b765ae66ee8cf2 [55/58] iio: osf: add IIO devices from capability reports
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261019/202610191514.fRYyu0HX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191514.fRYyu0HX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/sensorhubs/osf/osf_core.c:17:6: warning: stack frame size (1344) exceeds limit (1280) in 'osf_core_init' [-Wframe-larger-than]
      17 | void osf_core_init(struct osf_device *osf, struct device *dev)
         |      ^
   1 warning generated.


vim +/osf_core_init +17 drivers/iio/sensorhubs/osf/osf_core.c

33efb787fb5f8c Jinseob Kim 2026-10-12  16  
33efb787fb5f8c Jinseob Kim 2026-10-12 @17  void osf_core_init(struct osf_device *osf, struct device *dev)
33efb787fb5f8c Jinseob Kim 2026-10-12  18  {
33efb787fb5f8c Jinseob Kim 2026-10-12  19  	*osf = (struct osf_device) {
33efb787fb5f8c Jinseob Kim 2026-10-12  20  		.dev = dev,
33efb787fb5f8c Jinseob Kim 2026-10-12  21  	};
2da37c28edc668 Jinseob Kim 2026-10-12  22  	mutex_init(&osf->latest_lock);
2da37c28edc668 Jinseob Kim 2026-10-12  23  }
2da37c28edc668 Jinseob Kim 2026-10-12  24  

:::::: The code at line 17 was first introduced by commit
:::::: 33efb787fb5f8cc2053b241375a97c219b399aa3 iio: osf: add UART transport and core receive path

:::::: TO: Jinseob Kim <kimjinseob88@gmail.com>
:::::: CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
