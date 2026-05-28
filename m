Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED93438AE;
	Thu, 28 May 2026 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779938891; cv=none; b=R4z7enPyUMfuhB39+yiWx8tfWaVcF4YhpQ3KU478dNyV6L18fMnh7xp4Q64P+k3mLEepPCzK7PS32m8u7YVQ6+6TrxTpj8Od0JUAA003vUKdnBVpcbPChKm5LZAQd3EP6iWW6/Y4t/H75FmFfVxd87RMWR0WeCTcirsvmHbPcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779938891; c=relaxed/simple;
	bh=isMXh4FP+liop4eWFyqSMihu2WxoTZ2kiy684dmZVBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BZcZ551xyUbanJHINDgfE5KhFrLHzQ0PtCeo8gQ/w9i4HacVeZ8Dziu873H6TIxq+WJJPRWDa/IqWlq2VHJi0s5u9h4p22730KzgYv7XmFTKqP24AB//eodrxErqWvOqUvtSzQek8/5hdrx8Z9X1CYvTpYrgqEnwhlRIuUqNhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgiwssPz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgiwssPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779938889; x=1811474889;
  h=date:from:to:cc:subject:message-id;
  bh=isMXh4FP+liop4eWFyqSMihu2WxoTZ2kiy684dmZVBc=;
  b=MgiwssPzQX0d+Bb1/XXUcf7iGZb5HIm1nbL3cQJzL9Kh5nf/Ne8iXFfu
   ZPso843pmGi8iM3TC5y2igumfTqWOkJEmf7TFyp3Co2caKm9SdBF/GGRx
   hu1hbkrlaZmgkLtVIUXxKBfv5rO3N1Aag9VO2skppZtxw5b3IxysoOXGB
   rvvHCyo+nn7JgpcsUaHrrLQdmUzKCSZDF89I5N+ggB9HliodkMiywTtAs
   NCcjf/re/g4GNz+G3ojRhjHDO9h3v3s0nhaLMCwxwixxNVY8Bxrk6Hfir
   ZwijN/e5lTri0UWlUfzdLl6igSpxfptNx3IRVg/4CGDHJy5X/6Cj0JFsw
   g==;
X-CSE-ConnectionGUID: sDn64jY9RB2qovgQghgp1w==
X-CSE-MsgGUID: +/VREaoUTDio+JA7O9lfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80892217"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80892217"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:28:09 -0700
X-CSE-ConnectionGUID: emZm4orfSuekcRYFlKCVbQ==
X-CSE-MsgGUID: eURekJ76Qa2NwM/hD8tGLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="236070605"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2026 20:28:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSRPg-000000000Gr-1vQ5;
	Thu, 28 May 2026 03:28:04 +0000
Date: Thu, 28 May 2026 05:27:23 +0200
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Sesidhar Baddela <sebaddel@cisco.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Hannes Reinecke <hare@kernel.org>, Lee Duncan <lduncan@suse.com>
Subject: drivers/scsi/fnic/fnic_nvme.c:1733:26: warning: variable
 'term_stats' set but not used
Message-ID: <202605280519.Jd4fmgAZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Make-debug-logging-protocol-independent/20260528-040540
head:   36a4121c6d75bc8b76d0f8211fb04fb4957393e1
commit: 7a1a304d3f0ac057d97edec693901b4afc6ef997 scsi: fnic: Track NVMe transport statistics
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605280519.Jd4fmgAZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280519.Jd4fmgAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280519.Jd4fmgAZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/fnic/fnic_nvme.c:455:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     455 |         struct fnic_tport_s *tport;
         |                              ^
   drivers/scsi/fnic/fnic_nvme.c:596:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     596 |         struct fnic_tport_s *tport;
         |                              ^
   drivers/scsi/fnic/fnic_nvme.c:760:16: warning: variable 'start_time' set but not used [-Wunused-but-set-variable]
     760 |         unsigned long start_time;
         |                       ^
   drivers/scsi/fnic/fnic_nvme.c:762:23: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     762 |         struct fnic_tport_s *tport;
         |                              ^
>> drivers/scsi/fnic/fnic_nvme.c:1733:26: warning: variable 'term_stats' set but not used [-Wunused-but-set-variable]
    1733 |         struct terminate_stats *term_stats;
         |                                 ^
   5 warnings generated.


vim +/term_stats +1733 drivers/scsi/fnic/fnic_nvme.c

  1721	
  1722	void nvfnic_fcpio_abort(struct nvme_fc_local_port *lport,
  1723				struct nvme_fc_remote_port *rport,
  1724				void *hw_queue_handle, struct nvmefc_fcp_req *fcp_req)
  1725	{
  1726		struct fnic_iport_s *iport = lport->private;
  1727		struct fnic *fnic = iport->fnic;
  1728		struct nvme_fc_cmd_iu *cmd_iu = fcp_req->cmdaddr;
  1729		struct fnic_io_req *io_req = (struct fnic_io_req *)fcp_req->private;
  1730		unsigned int tag = io_req->tag;
  1731		struct fnic_stats *fnic_stats = &fnic->fnic_stats;
  1732		struct abort_stats *abts_stats;
> 1733		struct terminate_stats *term_stats;
  1734		unsigned long flags = 0;
  1735		unsigned long abt_issued_time;
  1736		unsigned int task_req;
  1737		enum fnic_ioreq_state old_ioreq_state;
  1738		unsigned long num_ios_waitq, waitq_2sec, waitq_max_time;
  1739	
  1740		spin_lock_irqsave(&fnic->fnic_lock, flags);
  1741	
  1742		if (io_req->tag == FNIC_NVME_NO_FREE_TAG) {
  1743			FNIC_NVME_DBG(KERN_ERR, fnic,
  1744				      "tag: (0x%x) tport_fcid: 0x%x\n",
  1745				      io_req->tag, io_req->tport->fcid);
  1746			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1747			return;
  1748		}
  1749	
  1750		if (io_req != nvfnic_find_io_req_by_tag(fnic, io_req->tag)) {
  1751			FNIC_NVME_DBG(KERN_INFO, fnic,
  1752				      "cmd tag freed or not issued:0x%x sn:0x%08x\n",
  1753				      io_req->tag, be32_to_cpu(cmd_iu->csn));
  1754			num_ios_waitq =
  1755			    atomic64_read(&fnic_stats->io_stats.nvme_num_ios_in_waitq);
  1756			waitq_2sec =
  1757			    atomic64_read(&fnic_stats->io_stats.nvme_ios_in_waitq_3000_msec);
  1758			waitq_max_time =
  1759			    atomic64_read(&fnic_stats->io_stats.nvme_ios_in_waitq_max_time);
  1760			FNIC_NVME_DBG(KERN_INFO, fnic,
  1761				      "waitq:%ld waitq_2sec:%ld max_wait:%ld\n",
  1762				      num_ios_waitq, waitq_2sec, waitq_max_time);
  1763			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1764			return;
  1765		}
  1766	
  1767		if (io_req->cmd_state == FNIC_IOREQ_CMD_COMPLETE) {
  1768			FNIC_NVME_DBG(KERN_INFO, fnic,
  1769				      "IO already completed before abort: 0x%x\n", tag);
  1770			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1771			return;
  1772		}
  1773	
  1774		if ((io_req->cmd_state == FNIC_IOREQ_ABTS_PENDING) ||
  1775		    (io_req->cmd_state == FNIC_DEV_RST_TERM_ISSUED)) {
  1776			FNIC_NVME_DBG(KERN_INFO, fnic, "abort already pending %d\n",
  1777				      tag);
  1778			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1779			return;
  1780		}
  1781	
  1782		if (io_req->cmd_state != FNIC_IOREQ_CMD_PENDING) {
  1783			FNIC_NVME_DBG(KERN_INFO, fnic,
  1784				      "io_req completed or aborted for tag:0x%x\n",
  1785				      tag);
  1786			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1787			return;
  1788		}
  1789	
  1790		FNIC_NVME_DBG(KERN_INFO, fnic, "in abort cmd_sn:%08x %llx tag: 0x%x\n",
  1791			      be32_to_cpu(cmd_iu->csn),
  1792			      le64_to_cpu(cmd_iu->sqe.rw.slba), io_req->tag);
  1793	
  1794		if (unlikely(fnic_chk_state_flags_locked(fnic, FNIC_FLAGS_IO_BLOCKED))) {
  1795			FNIC_NVME_DBG(KERN_INFO, fnic,
  1796				      "abort tag:0x%x returned during fw reset\n",
  1797				      io_req->tag);
  1798			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1799			return;
  1800		}
  1801		atomic_inc(&fnic->in_flight);
  1802	
  1803		if (fdls_tport_is_offline(io_req->tport) ||
  1804		    (io_req->cmd_state == FNIC_IOREQ_RESET_TERM)) {
  1805			task_req = FCPIO_ITMF_ABT_TASK_TERM;
  1806		} else {
  1807			task_req = FCPIO_ITMF_ABT_TASK;
  1808		}
  1809	
  1810		abts_stats = &fnic->fnic_stats.abts_stats;
  1811		term_stats = &fnic->fnic_stats.term_stats;
  1812		atomic64_inc(&abts_stats->aborts);
  1813	
  1814		abt_issued_time = jiffies_to_msecs(jiffies) -
  1815				jiffies_to_msecs(io_req->start_time);
  1816		if (abt_issued_time <= 6000)
  1817			atomic64_inc(&abts_stats->abort_issued_btw_0_to_6_sec);
  1818		else if (abt_issued_time > 6000 && abt_issued_time <= 20000)
  1819			atomic64_inc(&abts_stats->abort_issued_btw_6_to_20_sec);
  1820		else if (abt_issued_time > 20000 && abt_issued_time <= 30000)
  1821			atomic64_inc(&abts_stats->abort_issued_btw_20_to_30_sec);
  1822		else if (abt_issued_time > 30000 && abt_issued_time <= 40000)
  1823			atomic64_inc(&abts_stats->abort_issued_btw_30_to_40_sec);
  1824		else if (abt_issued_time > 40000 && abt_issued_time <= 50000)
  1825			atomic64_inc(&abts_stats->abort_issued_btw_40_to_50_sec);
  1826		else if (abt_issued_time > 50000 && abt_issued_time <= 60000)
  1827			atomic64_inc(&abts_stats->abort_issued_btw_50_to_60_sec);
  1828		else
  1829			atomic64_inc(&abts_stats->abort_issued_greater_than_60_sec);
  1830	
  1831		old_ioreq_state = io_req->cmd_state;
  1832		io_req->cmd_state = FNIC_IOREQ_ABTS_PENDING;
  1833		io_req->abts_state = FCPIO_INVALID_CODE;
  1834	
  1835		spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1836	
  1837		if (!nvfnic_queue_abort_io_req(fnic, io_req->tag, task_req, io_req)) {
  1838			FNIC_NVME_DBG(KERN_INFO, fnic,
  1839				      "Abort io req queue failed\n");
  1840			spin_lock_irqsave(&fnic->fnic_lock, flags);
  1841			io_req->cmd_state = old_ioreq_state;
  1842			spin_unlock_irqrestore(&fnic->fnic_lock, flags);
  1843		}
  1844		atomic_dec(&fnic->in_flight);
  1845	}
  1846	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
