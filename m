Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505AB156663;
	Wed,  3 Apr 2024 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712187019; cv=none; b=FIQMXjbwd3kMGEH1jPtT+tCZpSsi8+5doTnbbpt0c1NXSezN15m7ZY3bKWvjWrsQ63OH6E0dTZcHZN1fTXBpbF4qNPVhm2dJ/K95lWiQbymr+qs9YnHWpE4pa5pLPhSXCyDWGqgKBzyit90IDgUHkxVx9g6UC7H0BYB/3gIMi0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712187019; c=relaxed/simple;
	bh=loAVFzG6xIhSt4p7rp71AyU9Iqo1Tl5vLML5P3CK2no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KU7e97iwj4Bn3lL2ctjkeUkhArx2bcFA2Tc/sAG4cz9fqN9SU8FZ+X4FxyidmM2I4UQHza2NXdNaEzWNgreVuevzCt6ylf/udp8xlM4nfIpcl3gkxu3vXIELA8iqYtHAnihqAExGMA0dNUfGloG06vG5d2uvNaKq2ynStTlAPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyA1xq8A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyA1xq8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712187018; x=1743723018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=loAVFzG6xIhSt4p7rp71AyU9Iqo1Tl5vLML5P3CK2no=;
  b=GyA1xq8AfShvt7Bk2Tmg4/KponmxPZy6F6xqsmo+SadKVdwudbDns5+J
   5HqX01V63ERMJgqt6Tam/MaB0lE3JRgVS110q+NQdd1W0g+hhUnoir57z
   XZTTikBu4r08PMRFre2hRculEVsOPDNK3yP2MlsmC9qq2rvpC6QoAklvc
   jqYd74euuxaFuiz1wYxm8U1VseSzKXxUtoIR41zseAY2Iv7DSse7RaGSQ
   Dxd+AqVCtMAnX2XK8TQOFrgaEuNi6sJB5hFK7EskUrEasCbUj5mLcVybs
   b48C/KMpgDU3mtt7pogYfmHuJRu7Ix23nVTwtDd5q3jErMpAu0i+e+84g
   A==;
X-CSE-ConnectionGUID: I2IgsPftQ2ieR8INxjZQww==
X-CSE-MsgGUID: F44EdptHRIup1c6raCqklQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7618867"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7618867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 16:30:17 -0700
X-CSE-ConnectionGUID: x6iDNCJoTzO+8KkmV1aLhA==
X-CSE-MsgGUID: I3BYMYWITwWJhYwKWOEd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="41762602"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2024 16:30:16 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsA3a-0000MY-1L;
	Wed, 03 Apr 2024 23:30:14 +0000
Date: Thu, 4 Apr 2024 07:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 9/12] fs/tracefs/inode.c:56:9: error: implicit
 declaration of function 'iov_iter_count' is invalid in C99
Message-ID: <202404040725.9Abdcjc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e8fd62fac9e105d05cfda66070e98a3a255e1a0
commit: bb285b16cf180b4178bb9a45a8ffbf1ca5d9a701 [9/12] fs: convert remaining users of ->read and ->write to iterator variants
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040725.9Abdcjc9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040725.9Abdcjc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040725.9Abdcjc9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/tracefs/inode.c:56:9: error: implicit declaration of function 'iov_iter_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return iov_iter_count(from);
                  ^
   1 error generated.


vim +/iov_iter_count +56 fs/tracefs/inode.c

    53	
    54	static ssize_t default_write_file_iter(struct kiocb *iocb, struct iov_iter *from)
    55	{
  > 56		return iov_iter_count(from);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
