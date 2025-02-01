Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BAF4A3E;
	Sat,  1 Feb 2025 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738396295; cv=none; b=LQGL0NaCz5XEBzd/uEnMpCVwdHbZcKXCTadA+RfPvC46aBaHtwDD0J4uRWVI+QwWFdYQVGQ5OBPaEObcxVZGSCLRV/zV4HNSVo5vrIzpBo4JbBL+7lDmzaK3Zt3ZtMunsejmtafba0KxfYiARUnLNa9UDKaivLa8kQadKlFbsN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738396295; c=relaxed/simple;
	bh=vheTujnty9+fZN3gXPWOlavbQ2FFb6Qr8t3A7dwbdts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pA0fZXXKfDEU3jqmPAcVkU/rJM+TQVtV1T+790T/kaTR/8hsYel8mVxVC4koEsEms6wNMR73bUW2GmORKDUlpDYJ5fQ3ZRnG1eT7jNbg8NHXCSBW4W+a19ZhYlGbSgVYsmvY2zkibOw426M2psaZK0hsDcBcGraRnzHkhjVnm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9Sb3N3X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9Sb3N3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738396293; x=1769932293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vheTujnty9+fZN3gXPWOlavbQ2FFb6Qr8t3A7dwbdts=;
  b=C9Sb3N3XVuLweG2EADgXSvDHtSdGmE8YG0I+q80Wfz/zhfrhe4iZdxbT
   UIwgw9AlujpcHyu+1QI2QmJBVwzIfiQbLqSCjF2V2RNazgI0KSFz3YbQp
   3sC6qBBeAJaUaHZxcFTPjHUhQ0wa3rXURm65y8DioSD8L5fpXDpSqDXqv
   godez859RttCHnZ14HGl3vYJUxQpZFf+194qThW+8kW0+Hx3LhUgg3wXh
   21rdrcN29ej7OkJS9IE39O9ETIJ7OdqRKPYc6lErFu7Nx40UzNIrqP3kc
   E7M8AAdsRg0fVygazGjA5AdSL8vXrdbrx4QTcY6XSvVHPbh5VtKcwsNhP
   g==;
X-CSE-ConnectionGUID: qMTCpjxnRBOYYwtviFECZg==
X-CSE-MsgGUID: KXfOT9CoQEKJL8YDgQ2ceA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38987773"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38987773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 23:51:33 -0800
X-CSE-ConnectionGUID: gUCW7Aq4T8OPFonzciEBOQ==
X-CSE-MsgGUID: FyUxr9eeRcmArLfd3Oz4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110699423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2025 23:51:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te8Ho-000nsm-32;
	Sat, 01 Feb 2025 07:51:28 +0000
Date: Sat, 1 Feb 2025 15:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 27/28] kernel/trace/trace_printk.c:302:10:
 error: use of undeclared identifier 'btrace_mutex'
Message-ID: <202502011533.SFzSsMBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   edb8f58988e23eb5e665bf55625f2461a878483b
commit: 764be7505819829512a767795ea7063f2fd2e132 [27/28] treewide: Annotate all struct mutex users
config: i386-buildonly-randconfig-001-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011533.SFzSsMBw-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011533.SFzSsMBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011533.SFzSsMBw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_printk.c:302:10: error: use of undeclared identifier 'btrace_mutex'
     302 |         ACQUIRE(btrace_mutex)
         |                 ^
   kernel/trace/trace_printk.c:352:10: error: use of undeclared identifier 'btrace_mutex'
     352 |         RELEASE(btrace_mutex)
         |                 ^
   2 errors generated.


vim +/btrace_mutex +302 kernel/trace/trace_printk.c

   299	
   300	static void *
   301	t_start(struct seq_file *m, loff_t *pos)
 > 302		ACQUIRE(btrace_mutex)
   303	{
   304		format_mod_start();
   305		return find_next(NULL, pos);
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
