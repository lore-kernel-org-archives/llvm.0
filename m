Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F833D1
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646226665; x=1677762665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYOrgzlN6n/mT3toec7HXRWdghg+WF25tI0TOlVE5yM=;
  b=TdfbuBhP9LGNxJa+N5wyqXEJ9Fm/xqyvdn36/TdLCK2BbmV0dQQgwinH
   fplnrnb6CBHgz9qSdAGJaXIoG7HRzsCGDHbcMfUn+adVCjf/W1gLgWAX0
   8FI3lTvG5nbYPy3Fj0r0i6h+yaZeYPHJjoVDKhdtCbR0LWdS33bJx48cN
   9cqKLm8FrAW0BjWTb3iGqxd9cqmK5V3XRaah7sj4JrIOQ3qFcU1IBd2fC
   2RqKqxqFbX/R9uUH5f+/BreUivtOshJL3/+CJhV4MJqYR6fq5TTJLuVRQ
   6yXaZtuIfpNFjsTEO/lK1bDn9TvQXw5TJl7bsQPy2lJA+8LVvnXA6SA5c
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="234011293"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="234011293"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 05:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="493533189"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Mar 2022 05:11:02 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPOkw-0001Qo-0q; Wed, 02 Mar 2022 13:11:02 +0000
Date: Wed, 2 Mar 2022 21:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Liu Yi L <yi.l.liu@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc4 25/31]
 drivers/vfio/vfio.c:1160:17: warning: incompatible integer to pointer
 conversion assigning to 'void *' from 'int'
Message-ID: <202203022116.URNbYC7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc4
head:   008e1a440da8ca4e1dae3dc1c210b46cb77ce01f
commit: 6a340611dcaacc984fb82a265f0a53a28aed80e0 [25/31] vfio: Add iommufd VFIO compat support to group_fd
config: hexagon-randconfig-r045-20220302 (https://download.01.org/0day-ci/archive/20220302/202203022116.URNbYC7D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/luxis1999/iommufd/commit/6a340611dcaacc984fb82a265f0a53a28aed80e0
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommufd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.17-rc4
        git checkout 6a340611dcaacc984fb82a265f0a53a28aed80e0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio.c:1160:17: warning: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           group->iommufd = vfio_group_set_iommufd(container_fd,
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1160 drivers/vfio/vfio.c

  1146	
  1147	static int vfio_group_set_container(struct vfio_group *group, int container_fd)
  1148	{
  1149		struct fd f;
  1150		struct vfio_container *container;
  1151		struct vfio_iommu_driver *driver;
  1152		int ret = 0;
  1153	
  1154		if (atomic_read(&group->container_users))
  1155			return -EINVAL;
  1156	
  1157		if (group->type == VFIO_NO_IOMMU && !capable(CAP_SYS_RAWIO))
  1158			return -EPERM;
  1159	
> 1160		group->iommufd = vfio_group_set_iommufd(container_fd,
  1161							&group->device_list);
  1162		if (group->iommufd) {
  1163			atomic_inc(&group->container_users);
  1164			return ret;
  1165		}
  1166	
  1167		f = fdget(container_fd);
  1168		if (!f.file)
  1169			return -EBADF;
  1170	
  1171		/* Sanity check, is this really our fd? */
  1172		if (f.file->f_op != &vfio_fops) {
  1173			fdput(f);
  1174			return -EINVAL;
  1175		}
  1176	
  1177		container = f.file->private_data;
  1178		WARN_ON(!container); /* fget ensures we don't race vfio_release */
  1179	
  1180		down_write(&container->group_lock);
  1181	
  1182		/* Real groups and fake groups cannot mix */
  1183		if (!list_empty(&container->group_list) &&
  1184		    container->noiommu != (group->type == VFIO_NO_IOMMU)) {
  1185			ret = -EPERM;
  1186			goto unlock_out;
  1187		}
  1188	
  1189		ret = iommu_group_claim_dma_owner(group->iommu_group, f.file);
  1190		if (ret)
  1191			goto unlock_out;
  1192	
  1193		driver = container->iommu_driver;
  1194		if (driver) {
  1195			ret = driver->ops->attach_group(container->iommu_data,
  1196							group->iommu_group,
  1197							group->type);
  1198			if (ret) {
  1199				iommu_group_release_dma_owner(group->iommu_group);
  1200				goto unlock_out;
  1201			}
  1202		}
  1203	
  1204		group->container = container;
  1205		container->noiommu = (group->type == VFIO_NO_IOMMU);
  1206		list_add(&group->container_next, &container->group_list);
  1207	
  1208		/* Get a reference on the container and mark a user within the group */
  1209		vfio_container_get(container);
  1210		atomic_inc(&group->container_users);
  1211	
  1212	unlock_out:
  1213		up_write(&container->group_lock);
  1214		fdput(f);
  1215		return ret;
  1216	}
  1217	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
