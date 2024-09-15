Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F04145B22;
	Sun, 15 Sep 2024 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726396305; cv=none; b=uzIwId/RYFNpFwvNw/B1HxwsED83h8PVSR+4PXRI5WgW292ijShaKZMIY9tnFFUIoZ8RMQMjldtuChGkJHZDOTc/1uIs3l4F7U2LeO8L/FiDK2E2Sf4GyrqRlJODun4GeGqoG7qF64kBCBaBkhX3K+hZhN8Lkvim01+L94pPR/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726396305; c=relaxed/simple;
	bh=RgLSR+lE+5V1ZHmLGZ0IHgySIoQuTP9Aj0h1ORCNQ60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eM10UmgRsVfRaaFb6XSSTZKhrF4FUhmOWCXSrOAhvizxDwJ5OhMLuN4XoYdhCnKC087zSridcrOxOFjJrwh3Rq3KUMKX6/hTsJhMqPkMgHjl5dCcMZ+70eFKrTpqeLmoYRTE2B3x4qVSOgki4NA60gOMRCBnGV4iA+V2hZLIIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7WRfH5u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7WRfH5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726396304; x=1757932304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgLSR+lE+5V1ZHmLGZ0IHgySIoQuTP9Aj0h1ORCNQ60=;
  b=M7WRfH5uieEO5ryPplkY64ct3cKqja7fCjwCcePh3ly1iG8GVEfOceGZ
   cQJNe7yyJR3qbEqeTC7tR2OXxAaTs/ZYo4oClS7+phg7MKuJx0tRXPHfZ
   gpq8jEntKwHUQdP2Y94nqbx44Igzo69usGAStdbvr5NJh7A6rDfRWbj08
   5G1FPbLYOtEtJnO8XKiu7rgsB57VDfFwiVImZ8+xv+JYTq6V0jD3qScHm
   wmELT12r1DjEVi2fewGhCoDqaO7SbDHTOF/wdsrvbsB27bQIRyGCqsStD
   AhZYVtihKIvBA7qgnNHSQSUOTQZAdB1tcNFcRJMivW1+BsUsqvpMbjCWk
   w==;
X-CSE-ConnectionGUID: nmG0voRvQ9uV4zcJSpOnMQ==
X-CSE-MsgGUID: sqe8KR9/Q7qbYuf+ZSVEJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35822330"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35822330"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 03:31:43 -0700
X-CSE-ConnectionGUID: 55j9sAERRomcruI7+3WP5w==
X-CSE-MsgGUID: fWS69y4ZSMWJtrX3ggHURQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="68554966"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2024 03:31:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spmXZ-0008cA-2t;
	Sun, 15 Sep 2024 10:31:37 +0000
Date: Sun, 15 Sep 2024 18:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [ath:ath12k-mlo 38/63] drivers/net/wireless/ath/ath12k/mac.c:3981:8:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202409151853.OfodBWj3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
commit: 0b9b7a1eece8952bde6e7f3c764e20a5ee11d3f7 [38/63] wifi: ath12k: modify link arvif creation and removal for MLO
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151853.OfodBWj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151853.OfodBWj3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/mac.c:3981:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    3981 |                         if (ret)
         |                             ^~~
   drivers/net/wireless/ath/ath12k/mac.c:3931:9: note: initialize the variable 'ret' to silence this warning
    3931 |         int ret;
         |                ^
         |                 = 0
   drivers/net/wireless/ath/ath12k/mac.c:4434:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4434 |                         if (WARN_ON(!arvif))
         |                             ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     123 |         int __ret_warn_on = !!(condition);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |         if (unlikely(__ret_warn_on))                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |                 __WARN();                                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 |         unlikely(__ret_warn_on);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     127 | })
         | ~~
   drivers/net/wireless/ath/ath12k/mac.c:4467:9: note: uninitialized use occurs here
    4467 |         return ret;
         |                ^~~
   drivers/net/wireless/ath/ath12k/mac.c:4434:4: note: remove the 'if' if its condition is always false
    4434 |                         if (WARN_ON(!arvif))
         |                         ^~~~~~~~~~~~~~~~~~~~
    4435 |                                 goto out;
         |                                 ~~~~~~~~
   drivers/net/wireless/ath/ath12k/mac.c:4390:9: note: initialize the variable 'ret' to silence this warning
    4390 |         int ret;
         |                ^
         |                 = 0
   drivers/net/wireless/ath/ath12k/mac.c:9114:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    9114 |                         if (ret) {
         |                             ^~~
   drivers/net/wireless/ath/ath12k/mac.c:9068:9: note: initialize the variable 'ret' to silence this warning
    9068 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


vim +/ret +3981 drivers/net/wireless/ath/ath12k/mac.c

0b9b7a1eece8952 Sriram R               2024-08-10  3919  
d889913205cf7eb Kalle Valo             2022-11-28  3920  static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
d889913205cf7eb Kalle Valo             2022-11-28  3921  				 struct ieee80211_vif *vif,
d889913205cf7eb Kalle Valo             2022-11-28  3922  				 struct ieee80211_scan_request *hw_req)
d889913205cf7eb Kalle Valo             2022-11-28  3923  {
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  3924  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
0d6e6736ed9f3ff Sriram R               2024-04-09  3925  	struct ath12k *ar, *prev_ar;
6c7887c8b9235b5 Sriram R               2024-01-27  3926  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
6c7887c8b9235b5 Sriram R               2024-01-27  3927  	struct ath12k_link_vif *arvif;
d889913205cf7eb Kalle Valo             2022-11-28  3928  	struct cfg80211_scan_request *req = &hw_req->req;
d889913205cf7eb Kalle Valo             2022-11-28  3929  	struct ath12k_wmi_scan_req_arg arg = {};
0b9b7a1eece8952 Sriram R               2024-08-10  3930  	u8 link_id;
d889913205cf7eb Kalle Valo             2022-11-28  3931  	int ret;
d889913205cf7eb Kalle Valo             2022-11-28  3932  	int i;
0d6e6736ed9f3ff Sriram R               2024-04-09  3933  	bool create = true;
d889913205cf7eb Kalle Valo             2022-11-28  3934  
6c7887c8b9235b5 Sriram R               2024-01-27  3935  	mutex_lock(&ah->conf_mutex);
6c7887c8b9235b5 Sriram R               2024-01-27  3936  	arvif = &ahvif->deflink;
6c7887c8b9235b5 Sriram R               2024-01-27  3937  
0d6e6736ed9f3ff Sriram R               2024-04-09  3938  	/* Since the targeted scan device could depend on the frequency
0d6e6736ed9f3ff Sriram R               2024-04-09  3939  	 * requested in the hw_req, select the corresponding radio
0d6e6736ed9f3ff Sriram R               2024-04-09  3940  	 */
4938ba733ee2147 Rameshkumar Sundaram   2024-06-11  3941  	ar = ath12k_mac_select_scan_device(hw, vif, hw_req->req.channels[0]->center_freq);
6c7887c8b9235b5 Sriram R               2024-01-27  3942  	if (!ar) {
6c7887c8b9235b5 Sriram R               2024-01-27  3943  		mutex_unlock(&ah->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09  3944  		return -EINVAL;
6c7887c8b9235b5 Sriram R               2024-01-27  3945  	}
0b9b7a1eece8952 Sriram R               2024-08-10  3946  	/* check if any of the links of ML VIF is already started on
0b9b7a1eece8952 Sriram R               2024-08-10  3947  	 * radio(ar) correpsondig to given scan frequency and use it,
0b9b7a1eece8952 Sriram R               2024-08-10  3948  	 * if not use deflink(link 0) for scan purpose.
0b9b7a1eece8952 Sriram R               2024-08-10  3949  	 */
0b9b7a1eece8952 Sriram R               2024-08-10  3950  	link_id = ath12k_mac_find_link_id_by_ar(ahvif, ar);
0b9b7a1eece8952 Sriram R               2024-08-10  3951  	arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
0d6e6736ed9f3ff Sriram R               2024-04-09  3952  	/* If the vif is already assigned to a specific vdev of an ar,
0d6e6736ed9f3ff Sriram R               2024-04-09  3953  	 * check whether its already started, vdev which is started
0d6e6736ed9f3ff Sriram R               2024-04-09  3954  	 * are not allowed to switch to a new radio.
0d6e6736ed9f3ff Sriram R               2024-04-09  3955  	 * If the vdev is not started, but was earlier created on a
0d6e6736ed9f3ff Sriram R               2024-04-09  3956  	 * different ar, delete that vdev and create a new one. We don't
0d6e6736ed9f3ff Sriram R               2024-04-09  3957  	 * delete at the scan stop as an optimization to avoid redundant
0d6e6736ed9f3ff Sriram R               2024-04-09  3958  	 * delete-create vdev's for the same ar, in case the request is
0d6e6736ed9f3ff Sriram R               2024-04-09  3959  	 * always on the same band for the vif
0d6e6736ed9f3ff Sriram R               2024-04-09  3960  	 */
0d6e6736ed9f3ff Sriram R               2024-04-09  3961  	if (arvif->is_created) {
6c7887c8b9235b5 Sriram R               2024-01-27  3962  		if (WARN_ON(!arvif->ar)) {
6c7887c8b9235b5 Sriram R               2024-01-27  3963  			mutex_unlock(&ah->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09  3964  			return -EINVAL;
6c7887c8b9235b5 Sriram R               2024-01-27  3965  		}
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  3966  
6c7887c8b9235b5 Sriram R               2024-01-27  3967  		if (ar != arvif->ar && arvif->is_started) {
6c7887c8b9235b5 Sriram R               2024-01-27  3968  			mutex_unlock(&ah->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09  3969  			return -EINVAL;
6c7887c8b9235b5 Sriram R               2024-01-27  3970  		}
0d6e6736ed9f3ff Sriram R               2024-04-09  3971  
0d6e6736ed9f3ff Sriram R               2024-04-09  3972  		if (ar != arvif->ar) {
0d6e6736ed9f3ff Sriram R               2024-04-09  3973  			/* backup the previously used ar ptr, since the vdev delete
0d6e6736ed9f3ff Sriram R               2024-04-09  3974  			 * would assign the arvif->ar to NULL after the call
0d6e6736ed9f3ff Sriram R               2024-04-09  3975  			 */
0d6e6736ed9f3ff Sriram R               2024-04-09  3976  			prev_ar = arvif->ar;
0d6e6736ed9f3ff Sriram R               2024-04-09  3977  			mutex_lock(&prev_ar->conf_mutex);
0b9b7a1eece8952 Sriram R               2024-08-10  3978  			ath12k_mac_remove_link_interface(hw, arvif);
0b9b7a1eece8952 Sriram R               2024-08-10  3979  			ath12k_mac_unassign_link_vif(arvif);
0d6e6736ed9f3ff Sriram R               2024-04-09  3980  			mutex_unlock(&prev_ar->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09 @3981  			if (ret)
0d6e6736ed9f3ff Sriram R               2024-04-09  3982  				ath12k_warn(prev_ar->ab,
0d6e6736ed9f3ff Sriram R               2024-04-09  3983  					    "unable to delete scan vdev %d\n", ret);
0d6e6736ed9f3ff Sriram R               2024-04-09  3984  		} else {
0d6e6736ed9f3ff Sriram R               2024-04-09  3985  			create = false;
0d6e6736ed9f3ff Sriram R               2024-04-09  3986  		}
0d6e6736ed9f3ff Sriram R               2024-04-09  3987  	}
0d6e6736ed9f3ff Sriram R               2024-04-09  3988  	if (create) {
0b9b7a1eece8952 Sriram R               2024-08-10  3989  		/* Previous arvif would've been cleared in radio switch block
0b9b7a1eece8952 Sriram R               2024-08-10  3990  		 * above, assign arvif again for create.
0b9b7a1eece8952 Sriram R               2024-08-10  3991  		 */
0b9b7a1eece8952 Sriram R               2024-08-10  3992  		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
0d6e6736ed9f3ff Sriram R               2024-04-09  3993  		mutex_lock(&ar->conf_mutex);
d8bd091dcd388d0 Sriram R               2024-04-17  3994  		ret = ath12k_mac_vdev_create(ar, arvif);
0d6e6736ed9f3ff Sriram R               2024-04-09  3995  		mutex_unlock(&ar->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09  3996  		if (ret) {
6c7887c8b9235b5 Sriram R               2024-01-27  3997  			mutex_unlock(&ah->conf_mutex);
0d6e6736ed9f3ff Sriram R               2024-04-09  3998  			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
0d6e6736ed9f3ff Sriram R               2024-04-09  3999  			return -EINVAL;
0d6e6736ed9f3ff Sriram R               2024-04-09  4000  		}
0d6e6736ed9f3ff Sriram R               2024-04-09  4001  	}
d889913205cf7eb Kalle Valo             2022-11-28  4002  
0b9b7a1eece8952 Sriram R               2024-08-10  4003  	mutex_lock(&ar->conf_mutex);
d889913205cf7eb Kalle Valo             2022-11-28  4004  	spin_lock_bh(&ar->data_lock);
d889913205cf7eb Kalle Valo             2022-11-28  4005  	switch (ar->scan.state) {
d889913205cf7eb Kalle Valo             2022-11-28  4006  	case ATH12K_SCAN_IDLE:
d889913205cf7eb Kalle Valo             2022-11-28  4007  		reinit_completion(&ar->scan.started);
d889913205cf7eb Kalle Valo             2022-11-28  4008  		reinit_completion(&ar->scan.completed);
d889913205cf7eb Kalle Valo             2022-11-28  4009  		ar->scan.state = ATH12K_SCAN_STARTING;
d889913205cf7eb Kalle Valo             2022-11-28  4010  		ar->scan.is_roc = false;
d889913205cf7eb Kalle Valo             2022-11-28  4011  		ar->scan.vdev_id = arvif->vdev_id;
d889913205cf7eb Kalle Valo             2022-11-28  4012  		ret = 0;
d889913205cf7eb Kalle Valo             2022-11-28  4013  		break;
d889913205cf7eb Kalle Valo             2022-11-28  4014  	case ATH12K_SCAN_STARTING:
d889913205cf7eb Kalle Valo             2022-11-28  4015  	case ATH12K_SCAN_RUNNING:
d889913205cf7eb Kalle Valo             2022-11-28  4016  	case ATH12K_SCAN_ABORTING:
d889913205cf7eb Kalle Valo             2022-11-28  4017  		ret = -EBUSY;
d889913205cf7eb Kalle Valo             2022-11-28  4018  		break;
d889913205cf7eb Kalle Valo             2022-11-28  4019  	}
d889913205cf7eb Kalle Valo             2022-11-28  4020  	spin_unlock_bh(&ar->data_lock);
d889913205cf7eb Kalle Valo             2022-11-28  4021  
d889913205cf7eb Kalle Valo             2022-11-28  4022  	if (ret)
d889913205cf7eb Kalle Valo             2022-11-28  4023  		goto exit;
d889913205cf7eb Kalle Valo             2022-11-28  4024  
d889913205cf7eb Kalle Valo             2022-11-28  4025  	ath12k_wmi_start_scan_init(ar, &arg);
d889913205cf7eb Kalle Valo             2022-11-28  4026  	arg.vdev_id = arvif->vdev_id;
d889913205cf7eb Kalle Valo             2022-11-28  4027  	arg.scan_id = ATH12K_SCAN_ID;
d889913205cf7eb Kalle Valo             2022-11-28  4028  
d889913205cf7eb Kalle Valo             2022-11-28  4029  	if (req->ie_len) {
8ad314da54c6dd2 Wen Gong               2023-07-26  4030  		arg.extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
8ad314da54c6dd2 Wen Gong               2023-07-26  4031  		if (!arg.extraie.ptr) {
8ad314da54c6dd2 Wen Gong               2023-07-26  4032  			ret = -ENOMEM;
8ad314da54c6dd2 Wen Gong               2023-07-26  4033  			goto exit;
8ad314da54c6dd2 Wen Gong               2023-07-26  4034  		}
d889913205cf7eb Kalle Valo             2022-11-28  4035  		arg.extraie.len = req->ie_len;
d889913205cf7eb Kalle Valo             2022-11-28  4036  	}
d889913205cf7eb Kalle Valo             2022-11-28  4037  
d889913205cf7eb Kalle Valo             2022-11-28  4038  	if (req->n_ssids) {
d889913205cf7eb Kalle Valo             2022-11-28  4039  		arg.num_ssids = req->n_ssids;
d889913205cf7eb Kalle Valo             2022-11-28  4040  		for (i = 0; i < arg.num_ssids; i++)
d889913205cf7eb Kalle Valo             2022-11-28  4041  			arg.ssid[i] = req->ssids[i];
d889913205cf7eb Kalle Valo             2022-11-28  4042  	} else {
bcdb44f30be92b7 Nicolas Escande        2024-02-11  4043  		arg.scan_f_passive = 1;
d889913205cf7eb Kalle Valo             2022-11-28  4044  	}
d889913205cf7eb Kalle Valo             2022-11-28  4045  
d889913205cf7eb Kalle Valo             2022-11-28  4046  	if (req->n_channels) {
d889913205cf7eb Kalle Valo             2022-11-28  4047  		arg.num_chan = req->n_channels;
3742928a52d6859 Wen Gong               2023-07-16  4048  		arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
3742928a52d6859 Wen Gong               2023-07-16  4049  					GFP_KERNEL);
3742928a52d6859 Wen Gong               2023-07-16  4050  
3742928a52d6859 Wen Gong               2023-07-16  4051  		if (!arg.chan_list) {
3742928a52d6859 Wen Gong               2023-07-16  4052  			ret = -ENOMEM;
3742928a52d6859 Wen Gong               2023-07-16  4053  			goto exit;
3742928a52d6859 Wen Gong               2023-07-16  4054  		}
3742928a52d6859 Wen Gong               2023-07-16  4055  
d889913205cf7eb Kalle Valo             2022-11-28  4056  		for (i = 0; i < arg.num_chan; i++)
d889913205cf7eb Kalle Valo             2022-11-28  4057  			arg.chan_list[i] = req->channels[i]->center_freq;
d889913205cf7eb Kalle Valo             2022-11-28  4058  	}
d889913205cf7eb Kalle Valo             2022-11-28  4059  
d889913205cf7eb Kalle Valo             2022-11-28  4060  	ret = ath12k_start_scan(ar, &arg);
d889913205cf7eb Kalle Valo             2022-11-28  4061  	if (ret) {
d889913205cf7eb Kalle Valo             2022-11-28  4062  		ath12k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
d889913205cf7eb Kalle Valo             2022-11-28  4063  		spin_lock_bh(&ar->data_lock);
d889913205cf7eb Kalle Valo             2022-11-28  4064  		ar->scan.state = ATH12K_SCAN_IDLE;
d889913205cf7eb Kalle Valo             2022-11-28  4065  		spin_unlock_bh(&ar->data_lock);
d889913205cf7eb Kalle Valo             2022-11-28  4066  	}
d889913205cf7eb Kalle Valo             2022-11-28  4067  
d889913205cf7eb Kalle Valo             2022-11-28  4068  	/* Add a margin to account for event/command processing */
b856f023b40fa77 Karthikeyan Periyasamy 2024-01-18  4069  	ieee80211_queue_delayed_work(ath12k_ar_to_hw(ar), &ar->scan.timeout,
d889913205cf7eb Kalle Valo             2022-11-28  4070  				     msecs_to_jiffies(arg.max_scan_time +
d889913205cf7eb Kalle Valo             2022-11-28  4071  						      ATH12K_MAC_SCAN_TIMEOUT_MSECS));
d889913205cf7eb Kalle Valo             2022-11-28  4072  
d889913205cf7eb Kalle Valo             2022-11-28  4073  exit:
3742928a52d6859 Wen Gong               2023-07-16  4074  	kfree(arg.chan_list);
3742928a52d6859 Wen Gong               2023-07-16  4075  
d889913205cf7eb Kalle Valo             2022-11-28  4076  	if (req->ie_len)
d889913205cf7eb Kalle Valo             2022-11-28  4077  		kfree(arg.extraie.ptr);
d889913205cf7eb Kalle Valo             2022-11-28  4078  
d889913205cf7eb Kalle Valo             2022-11-28  4079  	mutex_unlock(&ar->conf_mutex);
6c7887c8b9235b5 Sriram R               2024-01-27  4080  	mutex_unlock(&ah->conf_mutex);
d889913205cf7eb Kalle Valo             2022-11-28  4081  	return ret;
d889913205cf7eb Kalle Valo             2022-11-28  4082  }
d889913205cf7eb Kalle Valo             2022-11-28  4083  

:::::: The code at line 3981 was first introduced by commit
:::::: 0d6e6736ed9f3ffb3a7f6ab6240bbb31a8fb3187 wifi: ath12k: scan statemachine changes for single wiphy

:::::: TO: Sriram R <quic_srirrama@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
