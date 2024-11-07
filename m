Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51B196455;
	Thu,  7 Nov 2024 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964066; cv=none; b=NxFiq4Uitf8LrfCxYMdofSO8JNowv43ijUelfPSbqXS9SE3k5v+DYFEEvCqBGr7P7wIKptuVd4BaGBAG8cwmps38WScsLdR9hj0uIl4ts50Lz/v/Ge6F9Uw+j0CuaHvvOstRlyzuY74dNbQIatI4uZ22UeiKoLGX4NXuuzdiWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964066; c=relaxed/simple;
	bh=BR9HErxU59vcteu7kCBNUzLlpaxY29fFA17QslJgXXQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bP7/DNQnmhSo6l34mPopnK3Xud51TGTdfTzGU3WYtoW2q6WB1SBvLWxs6Mxmttc08IENdPqv5+SQFeNd3fOajKaKeLeF8fcIVaClaeVZwPZvfiWW1n/lEAzMudLQxaGTVVkKnsokVPOuqTXsFORCqLwR2qhNcJYoAVbbVl2Tusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2yXzP2c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2yXzP2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730964064; x=1762500064;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BR9HErxU59vcteu7kCBNUzLlpaxY29fFA17QslJgXXQ=;
  b=e2yXzP2cAG/TvcxW0TcQ/ARvX09XhnHmd8X/xBdRUY/7Rqe2XTMUkXk4
   WZ2RH571cvRFREqQ+YqY42fQieCAt6ndPAD2uUAqlod70EsWAZHPhoL0R
   KhPLjML/ubUx8a+cBlX1VvLR5CMJm0QQG2MiUqhR7IECvjKUVf4h7DgjC
   1GMnAtcQ4IQX5ypNIrCaTAPlyf7LuZOdmdDaYgLrVTVZbC44aK8a5FYZp
   mNFUR3IhPcD4jPYhjxIOhUDMPE2KjKWN2XDS57cLN3Ovl6NhL8BgE4vnO
   KP1POM0G6fqbz6nWYljDN+W5OxjgTI0lsylH3bKHQ78sTRKs6rgkA1tLT
   A==;
X-CSE-ConnectionGUID: N3wuKY1qRyyfT/5mtRhGvQ==
X-CSE-MsgGUID: fyvM086SRD24TPbbgjIkqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42170503"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="42170503"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:21:01 -0800
X-CSE-ConnectionGUID: WBddsoiqTM2h+F6Ig8/ALA==
X-CSE-MsgGUID: DaF22EDXQbicBRHKqu+GNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="88915916"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 23:21:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8wp8-000pwM-0g;
	Thu, 07 Nov 2024 07:20:58 +0000
Date: Thu, 7 Nov 2024 15:20:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 4/11] fs/nfs/nfsv4.o: warning: objtool:
 __tracepoint_nfs4_setclientid+0x20: data relocation to !ENDBR:
 __SCT__tp_func_nfs4_setclientid+0x0
Message-ID: <202411071522.DSr5ffZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   dc414cd768dce496fe3a5dd19255b78fe54d3eb7
commit: 2ee42da6246414db75627834fd9160edae09f86a [4/11] objtool: Convert instrumentation_{begin,end}() to ANNOTATE
config: x86_64-randconfig-075-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071522.DSr5ffZB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071522.DSr5ffZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071522.DSr5ffZB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_setclientid+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_setclientid+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_setclientid_confirm+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_setclientid_confirm+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_renew+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_renew+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_renew_async+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_renew_async+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_setup_sequence+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_setup_sequence+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_state_mgr+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_state_mgr+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_state_mgr_failed+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_state_mgr_failed+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_xdr_bad_operation+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_xdr_bad_operation+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_xdr_status+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_xdr_status+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_xdr_bad_filehandle+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_xdr_bad_filehandle+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs_cb_no_clp+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs_cb_no_clp+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs_cb_badprinc+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs_cb_badprinc+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_reclaim+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_open_reclaim+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_expired+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_open_expired+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_file+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_open_file+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cached_open+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_cached_open+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_close+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_close+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_lock+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_get_lock+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_unlock+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_unlock+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_lock+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_set_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_state_lock_reclaim+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_state_lock_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_delegation+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_set_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_reclaim_delegation+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_reclaim_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_delegreturn_exit+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_delegreturn_exit+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookup+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_lookup+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_symlink+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_symlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_mkdir+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_mkdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_mknod+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_mknod+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_remove+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_remove+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_fs_locations+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_get_fs_locations+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_secinfo+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_secinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookupp+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_lookupp+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_rename+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_rename+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_access+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_access+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_readlink+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_readlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_readdir+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_readdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_acl+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_get_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_acl+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_set_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_setattr+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_setattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_delegreturn+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_delegreturn+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_stateid_update+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_open_stateid_update+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_stateid_update_wait+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_open_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_close_stateid_update_wait+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_close_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_getattr+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookup_root+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_lookup_root+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_fsinfo+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_fsinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_getattr+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_cb_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_recall+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_cb_recall+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_layoutrecall_file+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_cb_layoutrecall_file+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_name_to_uid+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_map_name_to_uid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_group_to_gid+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_map_group_to_gid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_uid_to_name+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_map_uid_to_name+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_gid_to_group+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_map_gid_to_group+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_read+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_read+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_write+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_write+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_commit+0x20: data relocation to !ENDBR: __SCT__tp_func_nfs4_commit+0x0
--
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_aer_uncorrectable_error+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_aer_uncorrectable_error+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_aer_correctable_error+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_aer_correctable_error+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_overflow+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_overflow+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_generic_event+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_generic_event+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_general_media+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_general_media+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_dram+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_dram+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_memory_module+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_memory_module+0x0
>> drivers/cxl/core/cxl_core.o: warning: objtool: __tracepoint_cxl_poison+0x20: data relocation to !ENDBR: __SCT__tp_func_cxl_poison+0x0
--
>> drivers/iio/imu/bno055/bno055_ser.o: warning: objtool: __tracepoint_send_chunk+0x20: data relocation to !ENDBR: __SCT__tp_func_send_chunk+0x0
>> drivers/iio/imu/bno055/bno055_ser.o: warning: objtool: __tracepoint_cmd_retry+0x20: data relocation to !ENDBR: __SCT__tp_func_cmd_retry+0x0
>> drivers/iio/imu/bno055/bno055_ser.o: warning: objtool: __tracepoint_write_reg+0x20: data relocation to !ENDBR: __SCT__tp_func_write_reg+0x0
>> drivers/iio/imu/bno055/bno055_ser.o: warning: objtool: __tracepoint_read_reg+0x20: data relocation to !ENDBR: __SCT__tp_func_read_reg+0x0
>> drivers/iio/imu/bno055/bno055_ser.o: warning: objtool: __tracepoint_recv+0x20: data relocation to !ENDBR: __SCT__tp_func_recv+0x0
--
>> drivers/thunderbolt/thunderbolt.o: warning: objtool: __tracepoint_tb_tx+0x20: data relocation to !ENDBR: __SCT__tp_func_tb_tx+0x0
>> drivers/thunderbolt/thunderbolt.o: warning: objtool: __tracepoint_tb_event+0x20: data relocation to !ENDBR: __SCT__tp_func_tb_event+0x0
>> drivers/thunderbolt/thunderbolt.o: warning: objtool: __tracepoint_tb_rx+0x20: data relocation to !ENDBR: __SCT__tp_func_tb_rx+0x0

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
