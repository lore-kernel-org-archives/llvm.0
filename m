Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04244362
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 00:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654819989; x=1686355989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muShz80N5WXbIaJ1H26l8GvCgTypGQ83+6ajKlOUXWg=;
  b=c3gVUkWOWR8U4LZj9mjWNpzcRa7kB86WM++xmYBKd3Dr0T4Ta1sLgllH
   G3M0FCFA/0INhsOjteWplebPByalhlwGgbIcIUkX4rBA2R6Q8eZwxStH5
   hnsNbJYeJai7wFbubE16XPHf6Yc96cGTvBe/JENp4IBdlqDG0ZdRXqYlN
   p+hBPUcgJgUNpZXuXpXKnLOo8wmP1eG62wl3RDT1sEPQ+dZKpGEZ37oKF
   AP1nfqFwhurZ4T7wn8W/v1jqWeqiUUKsHYIkbSLh+vrA7cEtxohzmZGZA
   CPCagKuimgGiLLDLNWvDqJKU/1pW3PYOupAVPD6MBJ8MCUxUJeEHmsYXf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="341530753"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="341530753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 17:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="684247958"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 17:12:53 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzSGj-000GW6-7U;
	Fri, 10 Jun 2022 00:12:53 +0000
Date: Fri, 10 Jun 2022 08:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>
Subject: [agd5f:drm-next 156/174]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1542:11: warning:
 variable 'i' set but not used
Message-ID: <202206100824.0OO7jTU5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   64f6516e60b0bbe6abfc9f1d9f1999012e0f11a6
commit: 0f28cca87e9afc22280c44d378d2a6e249933977 [156/174] drm/amdkfd: Extend KFD device topology to surface peer-to-peer links
config: arm64-randconfig-r023-20220609 (https://download.01.org/0day-ci/archive/20220610/202206100824.0OO7jTU5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 971e13d69e3e7b687213fef22952be6a328c426c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 0f28cca87e9afc22280c44d378d2a6e249933977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1542:11: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           uint32_t i, k;
                    ^
   1 warning generated.


vim +/i +1542 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

  1537	
  1538	static int kfd_dev_create_p2p_links(void)
  1539	{
  1540		struct kfd_topology_device *dev;
  1541		struct kfd_topology_device *new_dev;
> 1542		uint32_t i, k;
  1543		int ret = 0;
  1544	
  1545		k = 0;
  1546		list_for_each_entry(dev, &topology_device_list, list)
  1547			k++;
  1548		if (k < 2)
  1549			return 0;
  1550	
  1551		new_dev = list_last_entry(&topology_device_list, struct kfd_topology_device, list);
  1552		if (WARN_ON(!new_dev->gpu))
  1553			return 0;
  1554	
  1555		k--;
  1556		i = 0;
  1557	
  1558		/* create in-direct links */
  1559		ret = kfd_create_indirect_link_prop(new_dev, k);
  1560		if (ret < 0)
  1561			goto out;
  1562	
  1563		/* create p2p links */
  1564	#if defined(CONFIG_HSA_AMD_P2P)
  1565		list_for_each_entry(dev, &topology_device_list, list) {
  1566			if (dev == new_dev)
  1567				break;
  1568			if (!dev->gpu || !dev->gpu->adev ||
  1569			    (dev->gpu->hive_id &&
  1570			     dev->gpu->hive_id == new_dev->gpu->hive_id))
  1571				goto next;
  1572	
  1573			/* check if node(s) is/are peer accessible in one direction or bi-direction */
  1574			ret = kfd_add_peer_prop(new_dev, dev, i, k);
  1575			if (ret < 0)
  1576				goto out;
  1577	
  1578			ret = kfd_add_peer_prop(dev, new_dev, k, i);
  1579			if (ret < 0)
  1580				goto out;
  1581	next:
  1582			i++;
  1583		}
  1584	#endif
  1585	
  1586	out:
  1587		return ret;
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
