Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944B17FB
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652345409; x=1683881409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BP5YD06y/O3Sw9t3ytaTO/BdhrPRV/VfhyJt+TilrsM=;
  b=Srw9LerPCatelqFatshSHKdQ7jw7pl49OUqAi8oRUVQyTkNPs9C6x00s
   lCiUhA8rjBje/8YGE6IELdDingtDVOCSw6fa0rOTAxqvosRU8CzVGd6Pu
   jVcCxafs4m13UYqOfW0GqCgVl95g0nms/FZGDEojUxr/UlcFZQXsXiOmh
   3R9eCvdP9m6AxQJ6pNxvBqlDmE9GJbfDX67tfpHqk4+3KsQryMOHOUwUC
   RKLuHi3P9s1gUjQ0ba8iHVuzBU+YaaQ80rnf+oG7f6acHSo2N4mxxHFPZ
   0D97arH7F1rwBT+g1BfDp9NIB2itQWPLTsCFNPmAvqy6WUTmHuSfVUYqp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269878672"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="269878672"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 01:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="739598351"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2022 01:50:06 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1np4WM-000KDc-6n;
	Thu, 12 May 2022 08:50:06 +0000
Date: Thu, 12 May 2022 16:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mszyprow:v5.18-next-20220511-dsi-rework 30/35]
 drivers/gpu/drm/drm_mipi_dsi.c:1233: warning: expecting prototype for
 mipi_dsi_init(). Prototype was for mipi_dsi_host_init() instead
Message-ID: <202205121652.A7CaHuUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mszyprow/linux.git v5.18-next-20220511-dsi-rework
head:   d29c9c083847e486080eaa98808c232b9937f85f
commit: b34dc79ad31fa0497197519a9060be3ef2e72484 [30/35] drm/mipi-dsi: add support for host initialize callbacks
config: x86_64-randconfig-a001-20220509 (https://download.01.org/0day-ci/archive/20220512/202205121652.A7CaHuUB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/mszyprow/linux/commit/b34dc79ad31fa0497197519a9060be3ef2e72484
        git remote add mszyprow https://github.com/mszyprow/linux.git
        git fetch --no-tags mszyprow v5.18-next-20220511-dsi-rework
        git checkout b34dc79ad31fa0497197519a9060be3ef2e72484
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mipi_dsi.c:1233: warning: expecting prototype for mipi_dsi_init(). Prototype was for mipi_dsi_host_init() instead


vim +1233 drivers/gpu/drm/drm_mipi_dsi.c

  1225	
  1226	/**
  1227	 * mipi_dsi_init() - initialize MIPI DSI host
  1228	 * @dsi: DSI peripheral device
  1229	 *
  1230	 * Return: 0 on success or a negative error code on failure.
  1231	 */
  1232	int mipi_dsi_host_init(struct mipi_dsi_device *dsi)
> 1233	{
  1234		const struct mipi_dsi_host_ops *ops = dsi->host->ops;
  1235	
  1236		if (!ops)
  1237			return -ENOSYS;
  1238		if (!ops->init)
  1239			return 0;
  1240	
  1241		return ops->init(dsi->host);
  1242	}
  1243	EXPORT_SYMBOL(mipi_dsi_host_init);
  1244	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
