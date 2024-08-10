Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796C13210F;
	Sat, 10 Aug 2024 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723329771; cv=none; b=GQFZWd5JWTwAgJtgYLH8WlokyM0efzth+r/hYKuA/CBTFRsRDyhWELrt0UUYzqW855U2CjuVnvh030HhZFTg48iUpN/g84SAev9piR9T381kLP8BZ6XMeF7itPbrO/JI6mhf6FkvSOgbtlI0f9YXZ8L5vD8z5u0NOIiYVvLTPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723329771; c=relaxed/simple;
	bh=WvoACXYTQzqTv0X9RJGUEqqW9RkAmh7Mm2RIHMBDJTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxgY9Jk/mHVzHfXEPtyuEqnsvAPPHoA00ntBm4BCWBKjMV3FRw1SxKFFIHpWDp5vmqRtSRRNAKZDrFluCy0bsju6gqrwP5jX8U3eiiUN2eaUXvnTVceTpyRTXLz/QUWgHptq1rocd/apHXS+M6Vi9Qn9Xz+9+HsxfIqyZa59k4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj1lkrFo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj1lkrFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723329769; x=1754865769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvoACXYTQzqTv0X9RJGUEqqW9RkAmh7Mm2RIHMBDJTY=;
  b=Nj1lkrFo8/grKxc9GAiRh4eX4E+o/jpw6N3nFNZVXf6ZBnN+0S9UD4b5
   XA+ebKFPt8vDvvkxsZU5g8HK14CR35qlCx3ceLqGPMw463OX8ptvj4+ri
   rRvnaBdHhaHpSV4PduyMNVBLVqwm4RE11AWah4myOjo1suk6ffRFUd5JB
   +lv+0QkPISZ9pEHyKVFRp/HzJF1j5gL1bcDeBZgeSnlXNX9CUh9S+oP2R
   pYIvHrRtorSjmdm5BcOoXdAEC4aZg6s3T+6RjbCxd0Z6UWCH1k/cJ0zY5
   OXaS0OUEoMeozlmNM/Or1IKSp/SouEzQb70fGt18Y/2WMKSMOXtgxnK5O
   A==;
X-CSE-ConnectionGUID: PnVYtMy8RtGom6wf0YkBTA==
X-CSE-MsgGUID: bVQh0DcpQF6tHOEuc2xRFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38984410"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="38984410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 15:42:48 -0700
X-CSE-ConnectionGUID: mzvJ6+HxSRe2dVAT04z7zg==
X-CSE-MsgGUID: 8J75ZiIDTUqP2DStSQfEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57790793"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2024 15:42:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scunN-000AMn-0C;
	Sat, 10 Aug 2024 22:42:45 +0000
Date: Sun, 11 Aug 2024 06:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chunkuang-hu:mediatek-cmdq11 4/5]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:19: error:
 incompatible pointer types passing 'struct cmdq_client *[2]' to parameter of
 type 'struct cmdq_client *'
Message-ID: <202408110626.h9G9UIl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-cmdq11
head:   e9ea7ca7912d1950de8e4427d644379321a1dbcb
commit: 78f3bb6adec9e7b904db5fe6c74e12f9c2559e09 [4/5] media: platform: mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408110626.h9G9UIl5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110626.h9G9UIl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110626.h9G9UIl5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:19: error: incompatible pointer types passing 'struct cmdq_client *[2]' to parameter of type 'struct cmdq_client *' [-Werror,-Wincompatible-pointer-types]
     504 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                          ^~~~~~~~~~~~~
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: passing argument to parameter 'client' here
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                                           ^
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:544:20: error: incompatible pointer types passing 'struct cmdq_client *[2]' to parameter of type 'struct cmdq_client *' [-Werror,-Wincompatible-pointer-types]
     544 |                 cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                                  ^~~~~~~~~~~~~
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: passing argument to parameter 'client' here
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                                           ^
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:677:19: error: incompatible pointer types passing 'struct cmdq_client *[2]' to parameter of type 'struct cmdq_client *' [-Werror,-Wincompatible-pointer-types]
     677 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                          ^~~~~~~~~~~~~
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: passing argument to parameter 'client' here
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                                           ^
   3 errors generated.


vim +504 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c

   473	
   474	static void mdp_auto_release_work(struct work_struct *work)
   475	{
   476		struct mdp_cmdq_cmd *cmd;
   477		struct mdp_dev *mdp;
   478		struct mtk_mutex *mutex;
   479		enum mdp_pipe_id pipe_id;
   480	
   481		cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
   482		mdp = cmd->mdp;
   483	
   484		pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
   485		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
   486		mtk_mutex_unprepare(mutex);
   487		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
   488				    cmd->num_comps);
   489	
   490		if (refcount_dec_and_test(&mdp->job_count)) {
   491			if (cmd->mdp_ctx)
   492				mdp_m2m_job_finish(cmd->mdp_ctx);
   493	
   494			if (cmd->user_cmdq_cb) {
   495				struct cmdq_cb_data user_cb_data;
   496	
   497				user_cb_data.sta = cmd->data->sta;
   498				user_cb_data.pkt = cmd->data->pkt;
   499				cmd->user_cmdq_cb(user_cb_data);
   500			}
   501			wake_up(&mdp->callback_wq);
   502		}
   503	
 > 504		cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
   505		kfree(cmd->comps);
   506		cmd->comps = NULL;
   507		kfree(cmd);
   508		cmd = NULL;
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
