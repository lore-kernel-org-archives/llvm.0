Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EF183CCF;
	Tue, 17 Sep 2024 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726589065; cv=none; b=t+/p88J0XD8S0ZRgUckVIB//hGrdsk5RVco+A3e/Lp9eDLKpMG10Dw5NizdSENuX/TizHkcw/2MCtEpOXWuqWPxefba4qJB2ZPRi+3tHsjl5UgcQDSNdSpe9S4cqRe4rN9narhd6ykRCKqXrWveUx5k75Z4PhAGrLgOlqMqFXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726589065; c=relaxed/simple;
	bh=vHXL1y2VTsDag1h4Shtt9LA9YdhFaiBBoOfHKEBGdyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sorZjpuE89MXZhDjDv3QmCEOMw3o5Gooi/TNSeHgtLuSTvTPZKbQ1+fwcIv1c7P5GwNi2PbuKux5CSsxYcS8+BJtQJAoby0AOeXrbSgI0Y6d3784C70UiIVNz0r997BpslI3vOp+sjuRTxmFBpdvclfuQ47U7nvGSlqcE7k5OWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUQamcb/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUQamcb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726589063; x=1758125063;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vHXL1y2VTsDag1h4Shtt9LA9YdhFaiBBoOfHKEBGdyo=;
  b=BUQamcb/26kuJwV8OINWGz4iTrkiSeDJwd0dhYfJiAURnaMT/AUrxEWY
   X0dYIdLZooMStWMANyzUlu9+AMYhEVYDvssSaLRd3n4EV3DGIo5kfcT+w
   JFOAzpifqRiybVhtIQu/Xsy5eyYhqxGXxE6T5CsW94EQmLN4BSLaavFE/
   Gj1ymZYI+FE5qdQ0G21F8BotZLKtQy6VpLY4anqcrShPzILIg1fl2olxY
   ayrmbdC9ymftG9v/dUuX+16CnX8J9kVllWMqtqUHPq2PJkONwYvdr0lCT
   p4GfNKlG69NwOKkaFwuP8mAyB4JKDqxuWqzO4f+JuFwMnkcw6CXItscvv
   w==;
X-CSE-ConnectionGUID: GQPzJ2G8RaqNVR/2sZDU3g==
X-CSE-MsgGUID: qp8rYE9yT56pK9EogAxyMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="24988727"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="24988727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 09:04:22 -0700
X-CSE-ConnectionGUID: baH523dnQD2envc0NyBy7w==
X-CSE-MsgGUID: 7cfeQmCwQ3iXGa5YCfwhwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73804957"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2024 09:04:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqagd-000BHI-0J;
	Tue, 17 Sep 2024 16:04:19 +0000
Date: Wed, 18 Sep 2024 00:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 440/447]
 drivers/platform/x86/intel/intel_plr_tpmi.c:255:1: error: use of undeclared
 identifier 'plr_status_write_iter'; did you mean 'plr_status_write'?
Message-ID: <202409180017.Gzv254ce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   097956626f11860fdba8b8919604f57b4a69957d
commit: f3422615616703b0056097588146982e90e412a1 [440/447] seq_file: switch to using ->read_iter()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240918/202409180017.Gzv254ce-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409180017.Gzv254ce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180017.Gzv254ce-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/intel_plr_tpmi.c:255:1: error: use of undeclared identifier 'plr_status_write_iter'; did you mean 'plr_status_write'?
     255 | DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
         | ^
   include/linux/seq_file.h:230:16: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^
   <scratch space>:135:1: note: expanded from here
     135 | plr_status_write_iter
         | ^
   drivers/platform/x86/intel/intel_plr_tpmi.c:224:16: note: 'plr_status_write' declared here
     224 | static ssize_t plr_status_write(struct kiocb *iocb, struct iov_iter *from)
         |                ^
   1 error generated.


vim +255 drivers/platform/x86/intel/intel_plr_tpmi.c

811f67c51636d4 Tero Kristo 2024-05-27  223  
d81c9b5f82e85b Jens Axboe  2024-04-04  224  static ssize_t plr_status_write(struct kiocb *iocb, struct iov_iter *from)
811f67c51636d4 Tero Kristo 2024-05-27  225  {
d81c9b5f82e85b Jens Axboe  2024-04-04  226  	struct seq_file *s = iocb->ki_filp->private_data;
811f67c51636d4 Tero Kristo 2024-05-27  227  	struct tpmi_plr_die *plr_die = s->private;
d81c9b5f82e85b Jens Axboe  2024-04-04  228  	size_t count = iov_iter_count(from);
811f67c51636d4 Tero Kristo 2024-05-27  229  	bool val;
811f67c51636d4 Tero Kristo 2024-05-27  230  	int ret;
811f67c51636d4 Tero Kristo 2024-05-27  231  
d81c9b5f82e85b Jens Axboe  2024-04-04  232  	ret = kstrtobool_from_iter(from, count, &val);
811f67c51636d4 Tero Kristo 2024-05-27  233  	if (ret)
811f67c51636d4 Tero Kristo 2024-05-27  234  		return ret;
811f67c51636d4 Tero Kristo 2024-05-27  235  
811f67c51636d4 Tero Kristo 2024-05-27  236  	if (val != 0)
811f67c51636d4 Tero Kristo 2024-05-27  237  		return -EINVAL;
811f67c51636d4 Tero Kristo 2024-05-27  238  
811f67c51636d4 Tero Kristo 2024-05-27  239  	plr_write(0, plr_die, PLR_DIE_LEVEL);
811f67c51636d4 Tero Kristo 2024-05-27  240  
9e9397a41b7b1d Tero Kristo 2024-05-27  241  	guard(mutex)(&plr_die->lock);
9e9397a41b7b1d Tero Kristo 2024-05-27  242  
9e9397a41b7b1d Tero Kristo 2024-05-27  243  	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
9e9397a41b7b1d Tero Kristo 2024-05-27  244  		if (plr_die->die_id != tpmi_get_power_domain_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  245  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  246  
9e9397a41b7b1d Tero Kristo 2024-05-27  247  		if (plr_die->package_id != topology_physical_package_id(cpu))
9e9397a41b7b1d Tero Kristo 2024-05-27  248  			continue;
9e9397a41b7b1d Tero Kristo 2024-05-27  249  
9e9397a41b7b1d Tero Kristo 2024-05-27  250  		plr_clear_cpu_status(plr_die, cpu);
9e9397a41b7b1d Tero Kristo 2024-05-27  251  	}
9e9397a41b7b1d Tero Kristo 2024-05-27  252  
811f67c51636d4 Tero Kristo 2024-05-27  253  	return count;
811f67c51636d4 Tero Kristo 2024-05-27  254  }
811f67c51636d4 Tero Kristo 2024-05-27 @255  DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
811f67c51636d4 Tero Kristo 2024-05-27  256  

:::::: The code at line 255 was first introduced by commit
:::::: 811f67c51636d43791995bf483c5c1904900b531 platform/x86/intel/tpmi: Add new auxiliary driver for performance limits

:::::: TO: Tero Kristo <tero.kristo@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
