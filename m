Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C71FD4;
	Mon, 20 Jul 2026 00:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784507873; cv=none; b=kTYY1EBmj7xJ7wmhLtyiuR1kQ5Z5tz/DqTNCGGmLQirAdy0pG/WBwMCyRouSk3do7l9/IRDsVk3N8fDQXijmS7/WwaWHEiels3+equoFexMKbT93HDVNwDaTDAasOkXFBYZSIgamYJyKaaRvwaRYdO2GW+ah1+UrU/mu+Co+T7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784507873; c=relaxed/simple;
	bh=WkHfQv2j0aAo1Hm77QSesw+rZSFCVjuiG1v0U5XHDA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4X0ZBB38r1bU/wV9x8iJV88a9FzJ8YO2/sCLTBc5EVxEFDGykAPRqZnnVYkNMnr8+HI5omWcG5kp3DYBN4B9An+3Mdcuo0oDpuA6ZXkcAh1h92WnJibdz9o7XxYX5WIXtg0PPaRCOw+BVVKqZLQQ0+GzE3LEIGo1iAbo1z1omo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpNk7wAP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpNk7wAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784507871; x=1816043871;
  h=date:from:to:cc:subject:message-id;
  bh=WkHfQv2j0aAo1Hm77QSesw+rZSFCVjuiG1v0U5XHDA8=;
  b=HpNk7wAPnifhX3C49Aty4tugwfXHUAdJgrGPt0UZuXjux5DMt38Zd2gR
   8bY6jad7/d4V5utbaD58WCIEP0XxyZWPSMiLhiYOujse/71tSEKO18Rif
   qpBMzeAr1nuue66zroxxyHNGjNLh8CuruKkuOaT+GYLhlgUPfDLiZMGXs
   +u7c/mnYbqSKM8/4pPGHObYWktBTCYCJgUoHyeT1VmcGNgoUn+BoOB/7R
   f1mqVAUXTserM/SWD+MhbF+UJjP43eZ1WK2Vk8cqYDkiq/W6R58enF+RL
   ErSm9VSFWFM9MVdmpXQg3vaQphJdbwrNnJtGB1hk0RjZha0VL9fm2jjsy
   w==;
X-CSE-ConnectionGUID: ZJJMrnsKRx6QWKlDsGVA0w==
X-CSE-MsgGUID: 7tf9lLw1SHK5P6Ngt3wxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88912323"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="88912323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 17:37:50 -0700
X-CSE-ConnectionGUID: FDqf0aSrQL+0U/euEJR6YA==
X-CSE-MsgGUID: sr7xCukJT4ukGhwanViUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="254691927"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jul 2026 17:37:48 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlc0w-0000000066n-2Iqb;
	Mon, 20 Jul 2026 00:37:46 +0000
Date: Mon, 20 Jul 2026 02:37:27 +0200
From: kernel test robot <lkp@intel.com>
To: Taehee Yoo <ap420073@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/knod/knod_core.c:1046:8: warning: variable 'i' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202607200206.9xzMv73K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/net-knod-add-uapi-and-core-headers/20260720-021105
head:   d65f8a646efeabb7098a8c9a5b586ad3580fe13e
commit: 326530f9cd40b4a123881f1dcc8832b2691c58e4 net: knod: add offload device core and control plane
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260720/202607200206.9xzMv73K-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200206.9xzMv73K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200206.9xzMv73K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/knod/knod_core.c:1046:8: warning: variable 'i' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1046 |                         if (!base_pool) {
         |                             ^~~~~~~~~~
   net/knod/knod_core.c:1088:7: note: uninitialized use occurs here
    1088 |         for (i--; i >= 0; i--)
         |              ^
   net/knod/knod_core.c:1046:4: note: remove the 'if' if its condition is always false
    1046 |                         if (!base_pool) {
         |                         ^~~~~~~~~~~~~~~~~
    1047 |                                 err = -ENOMEM;
         |                                 ~~~~~~~~~~~~~~
    1048 |                                 pr_err("%s: alloc_mem failed\n", __func__);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1049 |                                 goto free_spsc;
         |                                 ~~~~~~~~~~~~~~~
    1050 |                         }
         |                         ~
   net/knod/knod_core.c:958:22: note: initialize the variable 'i' to silence this warning
     958 |         int err = -EINVAL, i;
         |                             ^
         |                              = 0
   1 warning generated.


vim +1046 net/knod/knod_core.c

   954	
   955	int knod_dev_attach(struct knod_netdev *knetdev, struct knod_accel *accel)
   956	{
   957		struct knod_dev *knodev;
   958		int err = -EINVAL, i;
   959	
   960		if (knetdev->status == KNOD_STATUS_USED ||
   961		    accel->status == KNOD_STATUS_USED) {
   962			pr_err("knod: %s already attached\n",
   963			       netdev_name(knetdev->dev));
   964			return -EINVAL;
   965		}
   966	
   967		knodev = kzalloc(sizeof(struct knod_dev), GFP_KERNEL);
   968		if (!knodev)
   969			return -ENOMEM;
   970	
   971		if (!try_module_get(knetdev->owner)) {
   972			pr_err("knod: NIC driver for %s is unloading\n",
   973			       netdev_name(knetdev->dev));
   974			kfree(knodev);
   975			return -ENODEV;
   976		}
   977		if (!try_module_get(accel->owner)) {
   978			pr_err("knod: accelerator driver is unloading\n");
   979			module_put(knetdev->owner);
   980			kfree(knodev);
   981			return -ENODEV;
   982		}
   983	
   984		knetdev->accel = accel;
   985		knetdev->knodev = knodev;
   986		accel->knetdev = knetdev;
   987		accel->knodev = knodev;
   988		knodev->knetdev = knetdev;
   989		knodev->accel = accel;
   990		knodev->netdev = knetdev->dev;
   991		knodev->accel_ops = accel->accel_ops;
   992		knodev->nic_ops = knetdev->nic_ops;
   993		mutex_init(&knodev->lock);
   994	
   995		knodev->stats = netdev_alloc_pcpu_stats(struct knod_dev_stats);
   996		if (!knodev->stats) {
   997			err = -ENOMEM;
   998			pr_err("knod: failed to allocate stats for %s\n",
   999			       netdev_name(knetdev->dev));
  1000			goto free_xdev;
  1001		}
  1002	
  1003		knodev->wpriv = kmalloc_array(KNOD_SPSC_MAX,
  1004					    sizeof(struct knod_work_priv),
  1005					    GFP_KERNEL | __GFP_ZERO);
  1006		if (!knodev->wpriv) {
  1007			pr_err("knod: failed to allocate work priv for %s\n",
  1008			       netdev_name(knetdev->dev));
  1009			err = -ENOMEM;
  1010			goto free_percpu;
  1011		}
  1012	
  1013		netdev_lock(knodev->netdev);
  1014		err = knodev->nic_ops->attach(knodev);
  1015		if (err) {
  1016			err = -ENOMEM;
  1017			pr_err("knod: NIC attach failed on %s\n",
  1018			       netdev_name(knetdev->dev));
  1019			goto unlock;
  1020		}
  1021	
  1022		err = knodev->accel_ops->attach(knodev);
  1023		if (err) {
  1024			err = -ENOMEM;
  1025			pr_err("knod: accelerator attach failed on %s\n",
  1026			       netdev_name(knetdev->dev));
  1027			goto nic_detach;
  1028		}
  1029	
  1030		{
  1031			unsigned int nqueues = min(knodev->netdev->num_rx_queues,
  1032						  KNOD_SPSC_MAX);
  1033			unsigned int stride = ALIGN(sizeof(struct spsc_bd),
  1034						    SMP_CACHE_BYTES);
  1035			unsigned int cap = roundup_pow_of_two(KNOD_SPSC_ELEMS_MAX);
  1036			size_t pool_size = (size_t)stride * cap;
  1037	
  1038			if (knodev->accel_ops->alloc_mem) {
  1039				size_t total = pool_size * nqueues;
  1040				u64 base_gaddr;
  1041				void *base_pool;
  1042				void *pool_priv;
  1043	
  1044				base_pool = knodev->accel_ops->alloc_mem(knodev, total,
  1045						&base_gaddr, NULL, &pool_priv);
> 1046				if (!base_pool) {
  1047					err = -ENOMEM;
  1048					pr_err("%s: alloc_mem failed\n", __func__);
  1049					goto free_spsc;
  1050				}
  1051				memset(base_pool, 0, total);
  1052	
  1053				/* First queue owns the BO, others reference it */
  1054				knodev->wpriv[0].spsc_pool_priv = pool_priv;
  1055				for (i = 0; i < nqueues; i++) {
  1056					void *pool = base_pool +
  1057						     (unsigned long)i * pool_size;
  1058	
  1059					knodev->wpriv[i].spsc_pool_gaddr =
  1060						base_gaddr + (u64)i * pool_size;
  1061					err = __spsc_init(&knodev->wpriv[i].spsc_bds,
  1062							  sizeof(struct spsc_bd),
  1063							  KNOD_SPSC_ELEMS_MAX, pool,
  1064							  GFP_KERNEL);
  1065					if (err) {
  1066						pr_err("%s: spsc_init failed q%d\n",
  1067						       __func__, i);
  1068						goto free_spsc;
  1069					}
  1070				}
  1071			} else {
  1072				for (i = 0; i < nqueues; i++) {
  1073					err = spsc_init(&knodev->wpriv[i].spsc_bds,
  1074							sizeof(struct spsc_bd),
  1075							KNOD_SPSC_ELEMS_MAX,
  1076							GFP_KERNEL);
  1077					if (err) {
  1078						pr_err("%s: spsc_init failed q%d\n",
  1079						       __func__, i);
  1080						goto free_spsc;
  1081					}
  1082				}
  1083			}
  1084		}
  1085		goto spsc_done;
  1086	
  1087	free_spsc:
  1088		for (i--; i >= 0; i--)
  1089			spsc_destroy(&knodev->wpriv[i].spsc_bds);
  1090		if (knodev->wpriv[0].spsc_pool_priv)
  1091			knodev->accel_ops->free_mem(knodev,
  1092					knodev->wpriv[0].spsc_pool_priv);
  1093		knodev->accel_ops->detach(knodev);
  1094		goto nic_detach;
  1095	spsc_done:
  1096	
  1097		err = knod_pass_attach(knodev);
  1098		if (err) {
  1099			pr_err("%s: knod_pass_attach failed (%d)\n", __func__, err);
  1100			goto accel_detach;
  1101		}
  1102	
  1103		err = knod_dmabuf_attach(knodev);
  1104		if (err) {
  1105			err = -ENOMEM;
  1106			pr_err("knod: dmabuf attach failed on %s\n",
  1107			       netdev_name(knetdev->dev));
  1108			goto accel_detach;
  1109		}
  1110	
  1111		pr_info("knod: %s attached to accel %d\n",
  1112			netdev_name(knodev->netdev), accel->id);
  1113		list_add(&knodev->list, &knod_dev_list);
  1114		knetdev->status = KNOD_STATUS_USED;
  1115		accel->status = KNOD_STATUS_USED;
  1116	
  1117		if (knodev->accel_ops->xdp_ops && knodev->accel_ops->xdp_ops->init) {
  1118			err = knodev->accel_ops->xdp_ops->init(knodev);
  1119			if (err) {
  1120				pr_err("knod: XDP init failed on %s\n",
  1121				       netdev_name(knetdev->dev));
  1122				goto xdp_err;
  1123			}
  1124		}
  1125	
  1126		/*
  1127		 * Feature offloads (BPF, IPsec) allocate their GPU resources and
  1128		 * advertise their netdev capabilities only when the feature is
  1129		 * selected via knod_accel_feature_set(), not at attach.
  1130		 */
  1131		netdev_unlock(knodev->netdev);
  1132	
  1133		if (knodev->accel_ops->mp_map) {
  1134			err = knodev->accel_ops->mp_map(knodev);
  1135			if (err) {
  1136				pr_err("knod: mp_map failed (%d)\n", err);
  1137				goto dmabuf_detach;
  1138			}
  1139		}
  1140	
  1141		return err;
  1142	
  1143	dmabuf_detach:
  1144		netdev_lock(knodev->netdev);
  1145	xdp_err:
  1146		list_del(&knodev->list);
  1147		knetdev->status = KNOD_STATUS_FREE;
  1148		accel->status = KNOD_STATUS_FREE;
  1149		knod_dmabuf_detach(knodev);
  1150	accel_detach:
  1151		knod_pass_detach(knodev);
  1152		for (i = 0; i < KNOD_SPSC_MAX; i++)
  1153			spsc_destroy(&knodev->wpriv[i].spsc_bds);
  1154		if (knodev->wpriv[0].spsc_pool_priv)
  1155			knodev->accel_ops->free_mem(knodev,
  1156					knodev->wpriv[0].spsc_pool_priv);
  1157		knodev->accel_ops->detach(knodev);
  1158	nic_detach:
  1159		knodev->nic_ops->detach(knodev);
  1160	unlock:
  1161		netdev_unlock(knodev->netdev);
  1162		kfree(knodev->wpriv);
  1163	free_percpu:
  1164		free_percpu(knodev->stats);
  1165	free_xdev:
  1166		/* Drop the accel<->knetdev<->knodev links set above before freeing
  1167		 * knodev, or a reader (e.g. knod_default_worker via accel->knodev)
  1168		 * dereferences a dangling pointer after a failed attach.
  1169		 */
  1170		accel->knodev = NULL;
  1171		accel->knetdev = NULL;
  1172		knetdev->knodev = NULL;
  1173		knetdev->accel = NULL;
  1174		module_put(accel->owner);
  1175		module_put(knetdev->owner);
  1176		kfree(knodev);
  1177		return err;
  1178	}
  1179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
