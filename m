Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C62A35977;
	Wed,  1 Oct 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311347; cv=none; b=f6NHJuWS0+qlAC2OWVM2Oul/WpQpoUBpZWM3tIZ8CtdZE3Li7V8xRIKJfgxnnxNDLnznLZsM/DBtiCKsEKf0PUBrPDSzzN676A4NuShxGNhxvRStGKeEPV7rYrnD+YQfUUjkaZFZCcTR+m8W36BrsoWG9zhlAlEFbvxWuNJFdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311347; c=relaxed/simple;
	bh=0Cm9BtFz3hGv542uyhD/dUaWxOasSWCZ6bIwzvIGJLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPmyhx1Z5scdqzhLf1qcXwjPCBICjH0auBoD2ph2roE9hRbsZaV4mW75PFmesf4sFtx1w1h1aB/dYRQvir9ydeMAPJQDgWWayS2g4wp46j2xB7OkNxkjmHp1/Pb9wB36vihCksh2fsFUpMNdT/gb8JPu47DMjl962eDZxk+oQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxQJ8f5M; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxQJ8f5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759311345; x=1790847345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Cm9BtFz3hGv542uyhD/dUaWxOasSWCZ6bIwzvIGJLY=;
  b=YxQJ8f5MFQlEXWfgT9p3HJKXHNHQWm3hBhz1a3WEF88YJTX3P0U+z6Y1
   pBHD1/34mcF+EQEx7XnAYZwT9UauMYE7fjjtvycyyiokCXReYVRhBwjCL
   YiaY7nxVlboiXDd5UZCVjHFgCyRCdLcnHx+1l58ZA+mpYkzpQ77ZiVpPf
   0AQubJMZAmCpnqKtHr+VF3dWz8kmkN8qWCBfDmmPPsP0qv1rATZwkR5E5
   L8i39WuEiJhwCrXkGTUrZbZ6Qpg1jKAyc6l82OdqKma8fFLqAo3d7COW0
   aoaMH/NVar5TjnxzSlrVM4irzibfj4N+XbihFdfoAVGogrsRWDFW4hdVy
   Q==;
X-CSE-ConnectionGUID: pV5Bp754TuuQV3hV9e7xvw==
X-CSE-MsgGUID: YdV5BJBWQBeSJQQla1I+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79231688"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="79231688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 02:35:44 -0700
X-CSE-ConnectionGUID: PNukmB5bQJCjXF2Y4R7GXQ==
X-CSE-MsgGUID: bfCaMSbJTFyMfSJ+W52kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="178795122"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Oct 2025 02:35:42 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3tFL-0002sN-1f;
	Wed, 01 Oct 2025 09:35:39 +0000
Date: Wed, 1 Oct 2025 17:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:vfio_get_region_info_op 23/28]
 drivers/gpu/drm/i915/gvt/kvmgt.c:1235:34: error: incompatible pointer types
 passing 'struct vfio_info_cap **' to parameter of type 'struct vfio_info_cap
 *'; remove &
Message-ID: <202510011720.Gy8hWYxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux vfio_get_region_info_op
head:   efea69dc6e5be19ed7b37490c863b00b304a3cb0
commit: da16ef5849c0c3eff92ead1c944776a7af4ddf3b [23/28] vfio/gvt: Convert to get_region_info_caps
config: x86_64-buildonly-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251001/202510011720.Gy8hWYxq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011720.Gy8hWYxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011720.Gy8hWYxq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gvt/kvmgt.c:54:
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:37:
   include/linux/vfio.h:139:13: warning: declaration of 'struct vfio_info_cap' will not be visible outside of this function [-Wvisibility]
     139 |                                         struct vfio_info_cap *caps);
         |                                                ^
>> drivers/gpu/drm/i915/gvt/kvmgt.c:1235:34: error: incompatible pointer types passing 'struct vfio_info_cap **' to parameter of type 'struct vfio_info_cap *'; remove & [-Werror,-Wincompatible-pointer-types]
    1235 |                 ret = vfio_info_add_capability(&caps, &cap_type.header,
         |                                                ^~~~~
   include/linux/vfio.h:363:52: note: passing argument to parameter 'caps' here
     363 | int vfio_info_add_capability(struct vfio_info_cap *caps,
         |                                                    ^
   drivers/gpu/drm/i915/gvt/kvmgt.c:1447:26: error: incompatible function pointer types initializing 'int (*)(struct vfio_device *, struct vfio_region_info *, struct vfio_info_cap *)' with an expression of type 'int (struct vfio_device *, struct vfio_region_info *, struct vfio_info_cap *)' [-Wincompatible-function-pointer-types]
    1447 |         .get_region_info_caps = intel_vgpu_get_region_info,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +1235 drivers/gpu/drm/i915/gvt/kvmgt.c

659643f7d81432 Jike Song           2016-12-08  1142  
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1143  static int intel_vgpu_get_region_info(struct vfio_device *vfio_dev,
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1144  				      struct vfio_region_info *info,
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1145  				      struct vfio_info_cap *caps)
659643f7d81432 Jike Song           2016-12-08  1146  {
659643f7d81432 Jike Song           2016-12-08  1147  	struct vfio_region_info_cap_sparse_mmap *sparse = NULL;
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1148  	struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
659643f7d81432 Jike Song           2016-12-08  1149  	int nr_areas = 1;
659643f7d81432 Jike Song           2016-12-08  1150  	int cap_type_id;
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1151  	unsigned int i;
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1152  	int ret;
659643f7d81432 Jike Song           2016-12-08  1153  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1154  	switch (info->index) {
659643f7d81432 Jike Song           2016-12-08  1155  	case VFIO_PCI_CONFIG_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1156  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1157  		info->size = vgpu->gvt->device_info.cfg_space_size;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1158  		info->flags = VFIO_REGION_INFO_FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1159  			      VFIO_REGION_INFO_FLAG_WRITE;
659643f7d81432 Jike Song           2016-12-08  1160  		break;
659643f7d81432 Jike Song           2016-12-08  1161  	case VFIO_PCI_BAR0_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1162  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1163  		info->size = vgpu->cfg_space.bar[info->index].size;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1164  		if (!info->size) {
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1165  			info->flags = 0;
659643f7d81432 Jike Song           2016-12-08  1166  			break;
659643f7d81432 Jike Song           2016-12-08  1167  		}
659643f7d81432 Jike Song           2016-12-08  1168  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1169  		info->flags = VFIO_REGION_INFO_FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1170  			      VFIO_REGION_INFO_FLAG_WRITE;
659643f7d81432 Jike Song           2016-12-08  1171  		break;
659643f7d81432 Jike Song           2016-12-08  1172  	case VFIO_PCI_BAR1_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1173  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1174  		info->size = 0;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1175  		info->flags = 0;
659643f7d81432 Jike Song           2016-12-08  1176  		break;
659643f7d81432 Jike Song           2016-12-08  1177  	case VFIO_PCI_BAR2_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1178  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1179  		info->flags = VFIO_REGION_INFO_FLAG_CAPS |
659643f7d81432 Jike Song           2016-12-08  1180  			      VFIO_REGION_INFO_FLAG_MMAP |
659643f7d81432 Jike Song           2016-12-08  1181  			      VFIO_REGION_INFO_FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1182  			      VFIO_REGION_INFO_FLAG_WRITE;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1183  		info->size = gvt_aperture_sz(vgpu->gvt);
659643f7d81432 Jike Song           2016-12-08  1184  
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1185  		sparse = kzalloc(struct_size(sparse, areas, nr_areas),
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1186  				 GFP_KERNEL);
659643f7d81432 Jike Song           2016-12-08  1187  		if (!sparse)
659643f7d81432 Jike Song           2016-12-08  1188  			return -ENOMEM;
659643f7d81432 Jike Song           2016-12-08  1189  
dda01f787df9f9 Alex Williamson     2017-12-12  1190  		sparse->header.id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
dda01f787df9f9 Alex Williamson     2017-12-12  1191  		sparse->header.version = 1;
659643f7d81432 Jike Song           2016-12-08  1192  		sparse->nr_areas = nr_areas;
659643f7d81432 Jike Song           2016-12-08  1193  		cap_type_id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
659643f7d81432 Jike Song           2016-12-08  1194  		sparse->areas[0].offset =
659643f7d81432 Jike Song           2016-12-08  1195  			PAGE_ALIGN(vgpu_aperture_offset(vgpu));
659643f7d81432 Jike Song           2016-12-08  1196  		sparse->areas[0].size = vgpu_aperture_sz(vgpu);
659643f7d81432 Jike Song           2016-12-08  1197  		break;
659643f7d81432 Jike Song           2016-12-08  1198  
659643f7d81432 Jike Song           2016-12-08  1199  	case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1200  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1201  		info->size = 0;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1202  		info->flags = 0;
072ec93d50fd4c Pei Zhang           2017-12-08  1203  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1204  		gvt_dbg_core("get region info bar:%d\n", info->index);
659643f7d81432 Jike Song           2016-12-08  1205  		break;
659643f7d81432 Jike Song           2016-12-08  1206  
659643f7d81432 Jike Song           2016-12-08  1207  	case VFIO_PCI_ROM_REGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1208  	case VFIO_PCI_VGA_REGION_INDEX:
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1209  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1210  		info->size = 0;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1211  		info->flags = 0;
072ec93d50fd4c Pei Zhang           2017-12-08  1212  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1213  		gvt_dbg_core("get region info index:%d\n", info->index);
659643f7d81432 Jike Song           2016-12-08  1214  		break;
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1215  	default: {
dda01f787df9f9 Alex Williamson     2017-12-12  1216  		struct vfio_region_info_cap_type cap_type = {
dda01f787df9f9 Alex Williamson     2017-12-12  1217  			.header.id = VFIO_REGION_INFO_CAP_TYPE,
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1218  			.header.version = 1
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1219  		};
659643f7d81432 Jike Song           2016-12-08  1220  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1221  		if (info->index >= VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
659643f7d81432 Jike Song           2016-12-08  1222  			return -EINVAL;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1223  		info->index = array_index_nospec(
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1224  			info->index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
659643f7d81432 Jike Song           2016-12-08  1225  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1226  		i = info->index - VFIO_PCI_NUM_REGIONS;
659643f7d81432 Jike Song           2016-12-08  1227  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1228  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1229  		info->size = vgpu->region[i].size;
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1230  		info->flags = vgpu->region[i].flags;
659643f7d81432 Jike Song           2016-12-08  1231  
62980cacc37f58 Christoph Hellwig   2022-04-11  1232  		cap_type.type = vgpu->region[i].type;
62980cacc37f58 Christoph Hellwig   2022-04-11  1233  		cap_type.subtype = vgpu->region[i].subtype;
659643f7d81432 Jike Song           2016-12-08  1234  
dccd2c351c3792 Jason Gunthorpe     2025-09-30 @1235  		ret = vfio_info_add_capability(&caps, &cap_type.header,
dda01f787df9f9 Alex Williamson     2017-12-12  1236  					       sizeof(cap_type));
659643f7d81432 Jike Song           2016-12-08  1237  		if (ret)
659643f7d81432 Jike Song           2016-12-08  1238  			return ret;
659643f7d81432 Jike Song           2016-12-08  1239  	}
659643f7d81432 Jike Song           2016-12-08  1240  	}
659643f7d81432 Jike Song           2016-12-08  1241  
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1242  	if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
659643f7d81432 Jike Song           2016-12-08  1243  		switch (cap_type_id) {
659643f7d81432 Jike Song           2016-12-08  1244  		case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1245  			ret = vfio_info_add_capability(
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1246  				caps, &sparse->header,
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1247  				struct_size(sparse, areas, sparse->nr_areas));
7590ebb8b45646 Yi Wang             2018-08-08  1248  			if (ret) {
659643f7d81432 Jike Song           2016-12-08  1249  				kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1250  				return ret;
7590ebb8b45646 Yi Wang             2018-08-08  1251  			}
659643f7d81432 Jike Song           2016-12-08  1252  			break;
659643f7d81432 Jike Song           2016-12-08  1253  		default:
7590ebb8b45646 Yi Wang             2018-08-08  1254  			kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1255  			return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1256  		}
659643f7d81432 Jike Song           2016-12-08  1257  	}
659643f7d81432 Jike Song           2016-12-08  1258  
7590ebb8b45646 Yi Wang             2018-08-08  1259  	kfree(sparse);
da16ef5849c0c3 Jason Gunthorpe     2025-09-30  1260  	return 0;
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1261  }
dccd2c351c3792 Jason Gunthorpe     2025-09-30  1262  

:::::: The code at line 1235 was first introduced by commit
:::::: dccd2c351c379223261e8d9626214590dfa42c61 vfio/gvt: Provide a get_region_info op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
