Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FEBA50;
	Sat, 24 May 2025 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748051157; cv=none; b=Pv05NdfGnVgKjwc5BH9A3VqhKJam0hizDaWokIlw0pPLbhEh4j8K2k9yrReOqeiUYL7KowpOQjGQjTbe/Zp3qrCUCZ5sbbp5Gc04Cqd0EyY1jx9rOdhIjROgjy0aMu0zH3+yNIVpVixZVF9yvYMqzn7b50lniuccESIQxqhlD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748051157; c=relaxed/simple;
	bh=LvV17aq9+cbmKIrJvlM3I3dALhzrLJxE0jF3BfJoLQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDRYyD8A+g2Oi0Z8zkAyOVe++kl1HkJqLBPTx8XwOBsaAbXqwZUTWoTez07FvqnCWYPbaYrvPrubQpfRIQ5hHRblmKVefHlMMQY0z2oJV2lRioEM34+TbVfwAzXLex3jB8JwtX6mtvusYXXHmBnBQNjQiksDq8awLrR1gtjweIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjIvXa1/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjIvXa1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748051155; x=1779587155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvV17aq9+cbmKIrJvlM3I3dALhzrLJxE0jF3BfJoLQI=;
  b=bjIvXa1/6gKlWa6D83knGeZOhLthxS0J4/gMPFIJHi6EfyigwNBHWyuZ
   TocGPrjTcOux0A+f+cmE8TEHK00IvUoYAq72YsU9n4XFcPrTaM+Ouhjxk
   3zNb0vBK7emhz9zW4FHTvZRPsY+SP8qawqgDH+g3841uCpBToZocmYBn7
   9O9lApciFzrWBPOtxYz+bethxvucdZ2ywhQifZ/97tObkrntnMA3/gaOa
   TFdz/uW58F4g0byzRrjryhlsVWhhqCqKlHi46/esltSuLhtj7OIsrLKtq
   /Dq+WnksWJaWIsRYeSAltvJ8jL/rbw7oITQ03hxCVJQi/0mLVLU6rpWEZ
   A==;
X-CSE-ConnectionGUID: yB+IGjWZRFSkEcNZO+bp9w==
X-CSE-MsgGUID: n3nlGZ9IQ5mqleqKRYp9/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67671249"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="67671249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:45:54 -0700
X-CSE-ConnectionGUID: TeLTQig1Sgy9yTN4d3Ndfw==
X-CSE-MsgGUID: AiYHXAcbSTiETC+VuLxFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141239525"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2025 18:45:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdxO-000QrY-2M;
	Sat, 24 May 2025 01:45:50 +0000
Date: Sat, 24 May 2025 09:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 4/15] <stdin>:1621:2: warning: syscall
 fork_into_container not implemented
Message-ID: <202505240916.UgrQ6Gnm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 5285eca5cb487245bf0db103b5966c2c48b13245 [4/15] containers: Allow a process to be forked into a container
config: hexagon-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240916.UgrQ6Gnm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240916.UgrQ6Gnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240916.UgrQ6Gnm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
>> <stdin>:1621:2: warning: syscall fork_into_container not implemented [-W#warnings]
    1621 | #warning syscall fork_into_container not implemented
         |  ^
   2 warnings generated.
--
   <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
>> <stdin>:1621:2: warning: syscall fork_into_container not implemented [-W#warnings]
    1621 | #warning syscall fork_into_container not implemented
         |  ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
