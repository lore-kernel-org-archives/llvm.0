Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676302C08C0;
	Mon, 22 Dec 2025 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766444478; cv=none; b=HsTgMZ+jhbXXNcthpsJ2pXm2VGZNqnDC1doh+Z+ZXlUkV09/Ms0t1hpObXwxiaIEV6Rs4NtnBRXiU6e/D5mf2J/JyC0yn/1OkpxCXyIDRSCtUHBMf/XWzMRjAcWBKGFsMGQefagQA8Pnkl5TLVOAHUeVmhdrgt32QgfZgo9JLf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766444478; c=relaxed/simple;
	bh=TL3ty897Ns8CBpC44diXSa3juFtUrhZjEPtmICvrXI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g0aT9JHAjNBKmy4sQsPFx/ttcoOR6G29giyxMnhcmgPzdkG9UyLNomkNcZrrnm3jW2ayEh6OZeXC7T+ZttS1yRL2KdeyWU99WZWjg0HTZUCyVu9uzotgy/X3ElkoRxIXIyJAxdzykIgmwttFEMihcu177OjLatz1NL47fdyz4G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUnFF/x6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUnFF/x6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766444477; x=1797980477;
  h=date:from:to:cc:subject:message-id;
  bh=TL3ty897Ns8CBpC44diXSa3juFtUrhZjEPtmICvrXI4=;
  b=hUnFF/x6hL8x+5oKGhPkq4b8tQfTPTYJyb1EXxUUKnFxewKxh1N5af/S
   1TnnSlhZupKnQBBe7LHx8BtY0NX8t6Y1LqoolQ+kX0bgXtA5rtIkAq4Pc
   H3+m7s6FwDMVX7uShq0rYULL97cOn887gmzgJkqHOl0LUGTpCyKkP6lEK
   B7fbU9e5eGMtbqEvfLY1Fvy/Xv/oyoqQx+QX/94qhR/uKtHCc6/CVkD3H
   MTeWRvnEcyWPMIMIzdfVG1eAloNrB/kwUH9yvqNOTf3T0ZeUHaiKF1yr4
   8HzVTL9b842BOxmWsFlrWzLpi8pik5HaCNs3ZEomiD0fLtwOUKCAfeOXg
   g==;
X-CSE-ConnectionGUID: rH1RLVydS26E+G5f6egScw==
X-CSE-MsgGUID: oOjhkXYHSX+B5ykWKPHVMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68283544"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68283544"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:01:16 -0800
X-CSE-ConnectionGUID: 8bEwhKIuSRy7bJZCZ8gV5g==
X-CSE-MsgGUID: U/4MPSxrTOSl7C7CcIl80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199939774"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 15:01:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXotr-000000001CH-1zyv;
	Mon, 22 Dec 2025 23:01:11 +0000
Date: Tue, 23 Dec 2025 07:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 39/39] WARNING: modpost: EXPORT
 symbol "set_cpus_allowed_ptr" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202512230640.mQwZVRGW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: 77b4ebc9e43b02f3c50dab48963d969964ea83ef [39/39] sched: Enable context analysis for core.c and fair.c
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251223/202512230640.mQwZVRGW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230640.mQwZVRGW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230640.mQwZVRGW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "set_cpus_allowed_ptr" [vmlinux] version generation failed, symbol will not be versioned.
Is "set_cpus_allowed_ptr" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "single_task_running" [vmlinux] version generation failed, symbol will not be versioned.
Is "single_task_running" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "schedule" [vmlinux] version generation failed, symbol will not be versioned.
Is "schedule" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "crypto_larval_alloc" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_larval_alloc" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "crypto_alg_tested" [vmlinux] version generation failed, symbol will not be versioned.
Is "crypto_alg_tested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "schedule" [arch/s390/mm/cmm.ko] has no CRC!
>> WARNING: modpost: "schedule" [arch/s390/crypto/prng.ko] has no CRC!
>> WARNING: modpost: "schedule" [arch/s390/kvm/kvm.ko] has no CRC!
>> WARNING: modpost: "single_task_running" [arch/s390/kvm/kvm.ko] has no CRC!
>> WARNING: modpost: "schedule" [kernel/rcu/rcutorture.ko] has no CRC!
>> WARNING: modpost: "schedule" [kernel/rcu/refscale.ko] has no CRC!
>> WARNING: modpost: "set_cpus_allowed_ptr" [kernel/rcu/refscale.ko] has no CRC!
>> WARNING: modpost: "set_cpus_allowed_ptr" [kernel/torture.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/ecryptfs/ecryptfs.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/nfs/nfs.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/smb/client/cifs.ko] has no CRC!
>> WARNING: modpost: "schedule" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "schedule" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/dlmfs/ocfs2_dlmfs.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "schedule" [fs/ocfs2/dlm/ocfs2_dlm.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "schedule" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "schedule" [arch/s390/lib/test_unwind.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/virtio/virtio_balloon.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/virtio/virtio_mem.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/char/virtio_console.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/char/hw_random/s390-trng.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/block/nbd.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/misc/genwqe/genwqe_card.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/scsi/libiscsi.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/tun.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/tap.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/net/ppp/ppp_generic.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid1.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid10.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/raid456.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/md-cluster.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/bcache/bcache.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-crypt.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-delay.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-multipath.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-mirror.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-vdo/dm-vdo.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-clone.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/md/dm-writecache.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/vmlogrdr.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/tape.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/monreader.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/char/vmur.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/s390/scsi/zfcp.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vdpa/vdpa_user/vduse.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vfio/pci/mlx5/mlx5-vfio-pci.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/iw_cm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/ib_uverbs.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/core/rdma_ucm.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vhost/vhost_net.ko] has no CRC!
WARNING: modpost: "schedule" [drivers/vhost/vhost.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-modify.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-multi.ko] has no CRC!
WARNING: modpost: "schedule" [samples/ftrace/ftrace-direct-multi-modify.ko] has no CRC!
WARNING: modpost: "schedule" [net/core/pktgen.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
WARNING: modpost: "schedule" [net/netfilter/nf_conntrack.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
WARNING: modpost: "schedule" [net/netfilter/ipvs/ip_vs.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "set_cpus_allowed_ptr" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/auth_gss/auth_rpcgss.ko] has no CRC!
WARNING: modpost: "schedule" [net/sunrpc/xprtrdma/rpcrdma.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/sctp/sctp.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds_rdma.ko] has no CRC!
WARNING: modpost: "schedule" [net/rds/rds_tcp.ko] has no CRC!
WARNING: modpost: "schedule" [net/smc/smc.ko] has no CRC!
WARNING: modpost: "schedule" [net/ceph/libceph.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
