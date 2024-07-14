Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B8FC11;
	Sun, 14 Jul 2024 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720986389; cv=none; b=YKQARbuy/ismkOG+tFHZYab93h5CNrlCmZ1s8a62Lvj2/IXhuZs2KqYk0e1VM2yz0VDpsqIqwc+o66t4YfeJdre1EJhzNs3l5lwbNmEHd9gPd00yp/hebCZEYDdFo3H05FFHGNUgrK0YhV8fRXpHbWwYx8sHzL2AiSDavwOW9Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720986389; c=relaxed/simple;
	bh=rLnEQ8o/nD03d1A0FDtz+xd65IOTgQ2jze91Tqq+sy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=au0znR8UaBtWf7x3FEJMrD19x8xOjXbGodPONqE3epEn6jqQL4lR6O5p3ZJoH0jtnt5zlfI8fF7VoOXPUotyANGksLPEnLxvjL7gJf5901RA3N+recELAWyWogYtkZ4HD4g5qBnCtCf+m9pl4PLfg4WCMuI/Ektqm7br82jbfm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SULp0JI3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SULp0JI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720986388; x=1752522388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLnEQ8o/nD03d1A0FDtz+xd65IOTgQ2jze91Tqq+sy8=;
  b=SULp0JI3rVv4rPVKdDZGvuV2CnPJDXpSG+TTm8uSNLhOAuiPpL9lnQMk
   oyg9M0zCg+dYeRdTIu2SViwnK/NpIUvxi26LOK8qdCsGhEu5PzPn0om7V
   e7gzriA1z0uGGqRKmWPPuZOt1inoIMi19DvvWXqCCICHQKWcystwRL0gp
   hLRmO19Hagu/ZllK7lQriFEX42jjxNFB7I9849nVuDzWSH4c5o6JSt3MD
   0OQXrG2tgaUTW3uvSKjM68J54tSySbM3ktcttkr78pUSPSqH9rTnCe9uV
   DMQFxyQIkvP1mzrH7DfaryqCdD4iAq4EkM9qVF4FkuSHaX8mItX9qkmle
   Q==;
X-CSE-ConnectionGUID: aIoTocCvR06EuY+2SiLl+w==
X-CSE-MsgGUID: 4LnNuaYMQsiPQNQ25Pd9HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18313616"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="18313616"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 12:46:27 -0700
X-CSE-ConnectionGUID: XXCXB4xaTwqYcQXnKpCUqg==
X-CSE-MsgGUID: p+gQc477Qa6ORAYRsVbyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="49293985"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jul 2024 12:46:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT5At-000dh0-1o;
	Sun, 14 Jul 2024 19:46:23 +0000
Date: Mon, 15 Jul 2024 03:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4]
 fs/smb/server/vfs_cache.c:39:27: warning: unused variable 'dh_task'
Message-ID: <202407150316.TZgyiAbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   c11a5805413bdbe0a22e94458aeeda3bac9b63a7
commit: c11a5805413bdbe0a22e94458aeeda3bac9b63a7 [4/4] ksmbd: add durable scavenger timer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240715/202407150316.TZgyiAbN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150316.TZgyiAbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150316.TZgyiAbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/vfs_cache.c:39:27: warning: unused variable 'dh_task' [-Wunused-variable]
      39 | static struct task_struc *dh_task;
         |                           ^~~~~~~
   1 warning generated.


vim +/dh_task +39 fs/smb/server/vfs_cache.c

    36	
    37	static bool durable_scavenger_running;
    38	static DEFINE_MUTEX(durable_scavenger_lock);
  > 39	static struct task_struc *dh_task;
    40	static wait_queue_head_t dh_wq;
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
