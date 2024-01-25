Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FCCECC;
	Thu, 25 Jan 2024 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706145203; cv=none; b=G8HcSGmKZFpbEm8VUteVazEO08AjS9cdJ6EtrUWWvZr+poFlUS5x6lo/9TCKTstewLr0z35p5njytTpe273p6uvTcCtXAHAM0xh+KIN97VetQGdcCVQyNA94lGIDePBuZPWSdU9o6O0TmSP6dHlHEMYWkLPwOf7rq7ydVo9ioIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706145203; c=relaxed/simple;
	bh=zFGpFzGROf1eBDujT5y7BjC7zcBpG/FZJBdgHEYWdRI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HraXpBlfRDgwAH72hMTXip33wi1/l1oZYm2hiSy2orKFT88TNYYsCJWq6M6Vj0eyntz0REI/5KPyjpeSmwp2igsXROrZn31qtBtevHUH1qMtVesiESyoBe1HMSt6GGKhMklUS3C2OQYl6dLo2utzCYcc8guRtNteLdaOKWrsGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/7ArNbx; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/7ArNbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706145201; x=1737681201;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zFGpFzGROf1eBDujT5y7BjC7zcBpG/FZJBdgHEYWdRI=;
  b=W/7ArNbxBDLVD8JuVA0kxIbGf13XSiGktKL3k5Ky8aVlbfMXHUoG/Sa7
   SAc5IZ/k/IbJ1wKrTS7mnAUfdYPXJiY34sbCGqmXrb1Nd/YzCUNJHONxx
   FsmP9hCbzur5p2NVi7Dr/bzrKRrodZhNX6bZMHE0/Ey1QAU+jg8x471y7
   arvmsJniX98+g0SgLaC1BuqKLPh0fKf1+GiY+mr2lde5uhUCw56R2oOrP
   XppYNCNu8qPPJQzwoAfxKzd1vgI1Vqz+pjOBTODxtDoMAoT4/ycIdrTdi
   dlmFe7bWtNL0op6sVAnA0WDQpZMkRy2KPE8HBELTdGK8BrXCotEv6EAtn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401672653"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401672653"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 17:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786593560"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786593560"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2024 17:13:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSoIv-0008YP-0k;
	Thu, 25 Jan 2024 01:13:17 +0000
Date: Thu, 25 Jan 2024 09:12:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/bluetooth/hci_vhci.o: warning: objtool: .text: unexpected
 end of section
Message-ID: <202401250927.1poZERd6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Manish Mandlik <mmandlik@google.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   443b349019f2d9461b23213a4308f9cf72e41c5e
commit: ab4e4380d4e158486e595013a2635190e07e28ce Bluetooth: Add vhci devcoredump support
date:   9 months ago
config: x86_64-randconfig-015-20240124 (https://download.01.org/0day-ci/archive/20240125/202401250927.1poZERd6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250927.1poZERd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250927.1poZERd6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_vhci.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
