Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BD32C9A;
	Sun, 17 Dec 2023 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4zCncs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702813212; x=1734349212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTCGG5QBoQRT+9JdRzpeZx2uFfEWno2twBRjyfFkOwI=;
  b=I4zCncs/sHs3svRqx3yUM/C8Q8QBjeaqBy21MVrBv8+J5DuCHWMkH7xx
   2APl2iAJjtNKZXLOHmYqDaidEFRcEgwYZqJZ8y2PWjwRwJmmbyK/qf0vd
   rDE1uG0LrsH6xdGyZYhE5n5PS8gsK5tu+nGGx5G0Wb50AGAdsPcoPd1Nl
   1ZLIHoDgD5+1LwbBioG3naaFgV3fRm7QsjMqLq8/cWS0xvhr6KeaDGBId
   JsxeEkC8Zw+wOQN835T+iaR84wzPWDAFyvt9dylHwOPYqXuTlNWtobAgj
   esQN5Drh0CubNGQErariz+D8bTV6Vk0OWLpcvNA8FWjPT4IdAABTY9O3t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="375562670"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="375562670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 03:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="724976149"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="724976149"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Dec 2023 03:40:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEpV6-0002zC-3D;
	Sun, 17 Dec 2023 11:40:05 +0000
Date: Sun, 17 Dec 2023 19:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Can Guo <quic_cang@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Peter Wang <peter.wang@mediatek.com>
Subject: [linux-next:master 7609/8213] scripts/kernel-doc:
 drivers/ufs/host/ufshcd-pltfrm.c:289: warning: bad line:
                                 both the controller and the device
Message-ID: <202312171915.YhlTLvLL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Can,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: fa3dca8251c4fff88da9f64ba931942638ab0c00 [7609/8213] scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
config: arm-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231217/202312171915.YhlTLvLL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171915.YhlTLvLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171915.YhlTLvLL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/ufs/host/ufshcd-pltfrm.c:289: warning: bad line:                                 both the controller and the device

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
