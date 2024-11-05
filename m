Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC31D415B;
	Tue,  5 Nov 2024 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849155; cv=none; b=rcCSnJeqZnWgvErPUE+npVDpPxPXBaciMAtquBPwEMFDGWW0sOzlKUMOHsgTT/Cy6XVY8ezgWB8x0w1quxm9/Wb0622k8XBnEB7pAZiUw8ryHssx57jz+FEYx09mcGniq4AqIoX/L4Cz4NZxagzlpniuxL2XDIgzlp+5xxEgR0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849155; c=relaxed/simple;
	bh=YubvtG54Wa4uZD2YNtC2ydUQUC4Ujnw2yV1a9OlQLvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZJkaek+/lliPeodjV1hifUa9DZsduRK26+uzAOYI7HG92M9WHRIFCDq+A3YkT4ATbEz3xcfIgwZad0O8xmW0OUIjzwSJ2YutPPw9Co7yxr8qCZeTEl8RIphC5XOvH+Ajq2AsEp46vG7L7SFSyPRgQ0dl73BymGUMMzlOEhuEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIAohEVv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIAohEVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730849154; x=1762385154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YubvtG54Wa4uZD2YNtC2ydUQUC4Ujnw2yV1a9OlQLvs=;
  b=IIAohEVvHS2OaH9RKX68QRExIaV9RfQ0BfhmY9JtUyBtpGT31z2ugn7V
   bmNoi45+ilNcQwnxDOc2Dezsd+n4F70uNfU59WtJfMLIl63PnoWLDa/yM
   3CGYKuwRhsUM/WAz7brl9TJ/gxH/4+7Nk376rso+f7uveh5j4lMHWA+za
   XtujLmLpP65f35EmsVH0kFd3QshsWq7w1xtfQFeVq+ez+IR0YXtEKjCrR
   MSQQQlsqdzaZjajJmqoK5MBNCEXo03QFHlHp2t8tQkr4hgSakSrBBJaN0
   Q7Kbr6VP5QjcAnYsRNeZ02Sz8j0oLZWG0iG+j+XVVqOP8u577mB4Ohk92
   A==;
X-CSE-ConnectionGUID: 0uhe5mwiQ0uqS9sOXGbjEQ==
X-CSE-MsgGUID: OH5rUOeVQq+hV/C49bjLKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42024828"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="42024828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:25:54 -0800
X-CSE-ConnectionGUID: OjvNvm+QSU6qy2FtB8lFgA==
X-CSE-MsgGUID: mbhb8W6eQTKSH7+yzWweNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="83745435"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 15:25:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Svm-000man-0R;
	Tue, 05 Nov 2024 23:25:50 +0000
Date: Wed, 6 Nov 2024 07:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 38/39] ld.lld: error: undefined symbol:
 nfsd_handle_dir_event
Message-ID: <202411060742.JJPRvkhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   fcdfaef0f912fdab052bdc87ed835684f2427070
commit: be6d179c2e0ca9158a505aae689e92e02cfa84c5 [38/39] nfsd: add notification handlers for dir events
config: arm-randconfig-002-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060742.JJPRvkhA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060742.JJPRvkhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060742.JJPRvkhA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfsd_handle_dir_event
   >>> referenced by filecache.c:722 (fs/nfsd/filecache.c:722)
   >>>               fs/nfsd/filecache.o:(nfsd_file_fsnotify_handle_event) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
