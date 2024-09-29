Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B7176AC5;
	Sun, 29 Sep 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727609973; cv=none; b=jMwHXxUtwtwMMPo2gnCngYwF/e+jcvHi0QHifnvs5cfVb8PGuDFv4yXJqJgQa5br9rng9Lqf3bTk9F8Ji+I079/mWnpuWGQBUfCSkVVKYkv+tv7AidKr9cnlXXvPinEyROEoAvo5JWBB+FtKmUq09u2Bgp7/5GSCAuiWiaUqvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727609973; c=relaxed/simple;
	bh=znwnUWD288OphyepBDdxWRv6PNjWTuLyFRM5NGqPWSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMvU3H4rQXji0KoxSu7rUWXqevcFG6hMqz0GM8l+36DhQiafT+gMCi5HMmEr6a2vuS2bNSi2Gh9OsSwrmPpOTt6CFCjWQHccCdszahw8Bsj28pjH7n/J1stcMtUOcZ5X+4JEe2twKNmFFjfkdGXNWQydhKqo+aGtHzOIPDLZ1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRNN1CSn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRNN1CSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727609971; x=1759145971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=znwnUWD288OphyepBDdxWRv6PNjWTuLyFRM5NGqPWSM=;
  b=iRNN1CSn2mnuhS4cxochI2eteWTKUdTTZzfqPve4EibMVHr9vJ3I0Q0u
   Zvq1+O1PRbSltF3ePBT7NI0VI7e2BxF4w82sNMXj3EnwFTSw5T3LiK7qK
   uD/KGrHCw+hUlIPTekUj1m9UvTOHHJTUy9swgIMLEq+CLzvQIzZeyvZar
   XQzxDQU+54pwF7FlP+Z5aGmQrzWrKEGM4SxM9wDj7Z+AuhQo2pgqbijox
   zw7R6iqa78u6NZ/i9ZWOl2bpU/tIuKeWmLsrNz7TIUrb5e7gCHoGBDgn0
   JBlu7drYu1h2JTCPDOJuFbEZdc565JVbCqNYFsyga+MaYS92a01yA+UK3
   Q==;
X-CSE-ConnectionGUID: 5k4iMupkRlK/qN2xDR1gow==
X-CSE-MsgGUID: xagaMtxXRxSy7KRXo2weHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30498522"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30498522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 04:39:30 -0700
X-CSE-ConnectionGUID: WPcroV4HQfyJrhqZs4+cOw==
X-CSE-MsgGUID: oVXNiRWST1iJwMv4E23Gzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="103806253"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 04:39:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1susGp-000OFP-2Y;
	Sun, 29 Sep 2024 11:39:23 +0000
Date: Sun, 29 Sep 2024 19:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>, sebaddel@cisco.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, arulponn@cisco.com,
	djhawar@cisco.com, gcboffa@cisco.com, mkai2@cisco.com,
	satishkh@cisco.com, aeasi@cisco.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karan Tilak Kumar <kartilak@cisco.com>
Subject: Re: [PATCH v3 07/14] scsi: fnic: Add and integrate support for FIP
Message-ID: <202409291955.FcMZfNSt-lkp@intel.com>
References: <20240927184613.52172-8-kartilak@cisco.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927184613.52172-8-kartilak@cisco.com>

Hi Karan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Replace-shost_printk-with-dev_info-dev_err/20240928-025906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240927184613.52172-8-kartilak%40cisco.com
patch subject: [PATCH v3 07/14] scsi: fnic: Add and integrate support for FIP
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240929/202409291955.FcMZfNSt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291955.FcMZfNSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291955.FcMZfNSt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/fnic/fnic_fcs.c:292:21: warning: variable 'fnic_stats' set but not used [-Wunused-but-set-variable]
     292 |         struct fnic_stats *fnic_stats;
         |                            ^
   1 warning generated.


vim +/fnic_stats +292 drivers/scsi/fnic/fnic_fcs.c

   289	
   290	void fnic_handle_fip_frame(struct work_struct *work)
   291	{
 > 292		struct fnic_stats *fnic_stats;
   293		struct fnic_frame_list *cur_frame, *next;
   294		struct fnic *fnic = container_of(work, struct fnic, fip_frame_work);
   295	
   296		fnic_stats = &fnic->fnic_stats;
   297		FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
   298					 "Processing FIP frame\n");
   299	
   300		spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
   301		list_for_each_entry_safe(cur_frame, next, &fnic->fip_frame_queue,
   302								 links) {
   303			if (fnic->stop_rx_link_events) {
   304				list_del(&cur_frame->links);
   305				spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
   306				kfree(cur_frame->fp);
   307				kfree(cur_frame);
   308				return;
   309			}
   310	
   311			/*
   312			 * If we're in a transitional state, just re-queue and return.
   313			 * The queue will be serviced when we get to a stable state.
   314			 */
   315			if (fnic->state != FNIC_IN_FC_MODE &&
   316				fnic->state != FNIC_IN_ETH_MODE) {
   317				spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
   318				return;
   319			}
   320	
   321			list_del(&cur_frame->links);
   322	
   323			if (fdls_fip_recv_frame(fnic, cur_frame->fp)) {
   324				kfree(cur_frame->fp);
   325				kfree(cur_frame);
   326			}
   327		}
   328		spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
