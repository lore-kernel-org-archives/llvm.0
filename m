Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923277F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651598001; x=1683134001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0JwcxO0zaVyH18shuvSLqShqxkvH1HqCbEnrfVa/To=;
  b=Jgf11mOnQo15djaaa5w+VVZR+F8wauc9id0T6Bs2YTzwkuxu7jkql3T1
   nRIT1WrxLETtNQkuoeI+KmJ9FE7LAWZmHpJ6fRmD0269QuVh02A0PjDQY
   3zfMrn6qM8R9azc2t5sdRHM2+X06vjLDFckuP6d01U14E8rNaWX2/gnUj
   gLMDh0t6MXcTpOT6ngRlLwG14lOSePorqoSe4TN/PXe9Ua9i2lMNw+i7O
   31TWXa4Npx79GamDU2aWOmYbyHVCVmdQVC1yNkGJlxmg+yoKnb1VsBltB
   8KAW9UbfR6Kb2QvrVdMj6iLZ9cctkV3UoPIpri/cf3syaYeF8i+uNHNOs
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="353973897"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="353973897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 10:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="536422757"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2022 10:13:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlw5O-000AeN-Lk;
	Tue, 03 May 2022 17:13:18 +0000
Date: Wed, 4 May 2022 01:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 11/24] fnic: use dedicated device reset command
Message-ID: <202205040107.yOpQQQnY-lkp@intel.com>
References: <20220502213820.3187-12-hare@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502213820.3187-12-hare@suse.de>

Hi Hannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next powerpc/next linus/master v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/scsi-EH-rework-prep-patches-part-1/20220503-054317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220504/202205040107.yOpQQQnY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8691055a002b89e1dac5e431f039c5f3c6e8be1f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hannes-Reinecke/scsi-EH-rework-prep-patches-part-1/20220503-054317
        git checkout 8691055a002b89e1dac5e431f039c5f3c6e8be1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/fnic/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/fnic/fnic_scsi.c:2310:5: warning: variable 'tag' is uninitialized when used here [-Wuninitialized]
                                   tag | FNIC_TAG_DEV_RST,
                                   ^~~
   drivers/scsi/fnic/fnic_scsi.c:2194:9: note: initialize the variable 'tag' to silence this warning
           int tag;
                  ^
                   = 0
   1 warning generated.


vim +/tag +2310 drivers/scsi/fnic/fnic_scsi.c

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2173  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2174  /*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2175   * SCSI Eh thread issues a Lun Reset when one or more commands on a LUN
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2176   * fail to get aborted. It calls driver's eh_device_reset with a SCSI command
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2177   * on the LUN.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2178   */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2179  int fnic_device_reset(struct scsi_cmnd *sc)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2180  {
8691055a002b89 Hannes Reinecke   2022-05-02  2181  	struct scsi_device *sdev = sc->device;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2182  	struct fc_lport *lp;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2183  	struct fnic *fnic;
4d7007b49d523d Hiral Patel       2013-02-12  2184  	struct fnic_io_req *io_req = NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2185  	struct fc_rport *rport;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2186  	int status;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2187  	int ret = FAILED;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2188  	spinlock_t *io_lock;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2189  	unsigned long flags;
14eb5d905d16ec Hiral Patel       2013-02-12  2190  	unsigned long start_time = 0;
03298552cba38f Hiral Patel       2013-02-12  2191  	struct scsi_lun fc_lun;
67125b0287a9e6 Hiral Patel       2013-09-12  2192  	struct fnic_stats *fnic_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2193  	struct reset_stats *reset_stats;
8691055a002b89 Hannes Reinecke   2022-05-02  2194  	int tag;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2195  	DECLARE_COMPLETION_ONSTACK(tm_done);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2196  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2197  	/* Wait for rport to unblock */
8691055a002b89 Hannes Reinecke   2022-05-02  2198  	rport = starget_to_rport(scsi_target(sdev));
8691055a002b89 Hannes Reinecke   2022-05-02  2199  	ret = fc_block_rport(rport);
8691055a002b89 Hannes Reinecke   2022-05-02  2200  	if (ret)
8691055a002b89 Hannes Reinecke   2022-05-02  2201  		return ret;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2202  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2203  	/* Get local-port, check ready and link up */
8691055a002b89 Hannes Reinecke   2022-05-02  2204  	lp = shost_priv(sdev->host);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2205  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2206  	fnic = lport_priv(lp);
67125b0287a9e6 Hiral Patel       2013-09-12  2207  	fnic_stats = &fnic->fnic_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2208  	reset_stats = &fnic->fnic_stats.reset_stats;
67125b0287a9e6 Hiral Patel       2013-09-12  2209  
67125b0287a9e6 Hiral Patel       2013-09-12  2210  	atomic64_inc(&reset_stats->device_resets);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2211  
0db6f4353d68c0 Roel Kluin        2010-06-11  2212  	FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
8691055a002b89 Hannes Reinecke   2022-05-02  2213  		      "Device reset called FCID 0x%x, LUN 0x%llx\n",
8691055a002b89 Hannes Reinecke   2022-05-02  2214  		      rport->port_id, sdev->lun);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2215  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2216  	if (lp->state != LPORT_ST_READY || !(lp->link_up))
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2217  		goto fnic_device_reset_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2218  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2219  	/* Check if remote port up */
67125b0287a9e6 Hiral Patel       2013-09-12  2220  	if (fc_remote_port_chkready(rport)) {
67125b0287a9e6 Hiral Patel       2013-09-12  2221  		atomic64_inc(&fnic_stats->misc_stats.rport_not_ready);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2222  		goto fnic_device_reset_end;
67125b0287a9e6 Hiral Patel       2013-09-12  2223  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2224  
8691055a002b89 Hannes Reinecke   2022-05-02  2225  	/* The last tag is reserved for device reset */
8691055a002b89 Hannes Reinecke   2022-05-02  2226  	sc = scsi_host_find_tag(sdev->host, fnic->fnic_max_tag_id - 1);
8691055a002b89 Hannes Reinecke   2022-05-02  2227  	if (unlikely(!sc))
03298552cba38f Hiral Patel       2013-02-12  2228  		goto fnic_device_reset_end;
8691055a002b89 Hannes Reinecke   2022-05-02  2229  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2230  	io_lock = fnic_io_lock_hash(fnic, sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2231  	spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2232  	io_req = fnic_priv(sc)->io_req;
8691055a002b89 Hannes Reinecke   2022-05-02  2233  	if (io_req)
8691055a002b89 Hannes Reinecke   2022-05-02  2234  		goto fnic_device_reset_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2235  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2236  	io_req = mempool_alloc(fnic->io_req_pool, GFP_ATOMIC);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2237  	if (!io_req) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2238  		spin_unlock_irqrestore(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2239  		goto fnic_device_reset_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2240  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2241  	memset(io_req, 0, sizeof(*io_req));
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2242  	io_req->port_id = rport->port_id;
924cb24df4fc4d Bart Van Assche   2022-02-18  2243  	fnic_priv(sc)->io_req = io_req;
8691055a002b89 Hannes Reinecke   2022-05-02  2244  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2245  	io_req->dr_done = &tm_done;
8691055a002b89 Hannes Reinecke   2022-05-02  2246  	fnic_priv(sc)->flags = FNIC_DEVICE_RESET;
924cb24df4fc4d Bart Van Assche   2022-02-18  2247  	fnic_priv(sc)->state = FNIC_IOREQ_CMD_PENDING;
924cb24df4fc4d Bart Van Assche   2022-02-18  2248  	fnic_priv(sc)->lr_status = FCPIO_INVALID_CODE;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2249  	spin_unlock_irqrestore(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2250  
03298552cba38f Hiral Patel       2013-02-12  2251  	FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host, "TAG %x\n", tag);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2252  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2253  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2254  	 * issue the device reset, if enqueue failed, clean up the ioreq
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2255  	 * and break assoc with scsi cmd
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2256  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2257  	if (fnic_queue_dr_io_req(fnic, sc, io_req)) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2258  		spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2259  		io_req = fnic_priv(sc)->io_req;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2260  		if (io_req)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2261  			io_req->dr_done = NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2262  		goto fnic_device_reset_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2263  	}
03298552cba38f Hiral Patel       2013-02-12  2264  	spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2265  	fnic_priv(sc)->flags |= FNIC_DEV_RST_ISSUED;
03298552cba38f Hiral Patel       2013-02-12  2266  	spin_unlock_irqrestore(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2267  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2268  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2269  	 * Wait on the local completion for LUN reset.  The io_req may be
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2270  	 * freed while we wait since we hold no lock.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2271  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2272  	wait_for_completion_timeout(&tm_done,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2273  				    msecs_to_jiffies(FNIC_LUN_RESET_TIMEOUT));
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2274  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2275  	spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2276  	io_req = fnic_priv(sc)->io_req;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2277  	if (!io_req) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2278  		spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2279  		FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
8691055a002b89 Hannes Reinecke   2022-05-02  2280  				"io_req is null tag 0x%x\n", tag);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2281  		goto fnic_device_reset_end;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2282  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2283  	io_req->dr_done = NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2284  
924cb24df4fc4d Bart Van Assche   2022-02-18  2285  	status = fnic_priv(sc)->lr_status;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2286  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2287  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2288  	 * If lun reset not completed, bail out with failed. io_req
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2289  	 * gets cleaned up during higher levels of EH
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2290  	 */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2291  	if (status == FCPIO_INVALID_CODE) {
67125b0287a9e6 Hiral Patel       2013-09-12  2292  		atomic64_inc(&reset_stats->device_reset_timeouts);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2293  		FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2294  			      "Device reset timed out\n");
924cb24df4fc4d Bart Van Assche   2022-02-18  2295  		fnic_priv(sc)->flags |= FNIC_DEV_RST_TIMED_OUT;
03298552cba38f Hiral Patel       2013-02-12  2296  		spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2297  		int_to_scsilun(sc->device->lun, &fc_lun);
03298552cba38f Hiral Patel       2013-02-12  2298  		/*
1259c5dc752474 Sesidhar Beddel   2013-09-09  2299  		 * Issue abort and terminate on device reset request.
1259c5dc752474 Sesidhar Beddel   2013-09-09  2300  		 * If q'ing of terminate fails, retry it after a delay.
03298552cba38f Hiral Patel       2013-02-12  2301  		 */
03298552cba38f Hiral Patel       2013-02-12  2302  		while (1) {
03298552cba38f Hiral Patel       2013-02-12  2303  			spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2304  			if (fnic_priv(sc)->flags & FNIC_DEV_RST_TERM_ISSUED) {
03298552cba38f Hiral Patel       2013-02-12  2305  				spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2306  				break;
03298552cba38f Hiral Patel       2013-02-12  2307  			}
03298552cba38f Hiral Patel       2013-02-12  2308  			spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2309  			if (fnic_queue_abort_io_req(fnic,
03298552cba38f Hiral Patel       2013-02-12 @2310  				tag | FNIC_TAG_DEV_RST,
03298552cba38f Hiral Patel       2013-02-12  2311  				FCPIO_ITMF_ABT_TASK_TERM,
03298552cba38f Hiral Patel       2013-02-12  2312  				fc_lun.scsi_lun, io_req)) {
03298552cba38f Hiral Patel       2013-02-12  2313  				wait_for_completion_timeout(&tm_done,
03298552cba38f Hiral Patel       2013-02-12  2314  				msecs_to_jiffies(FNIC_ABT_TERM_DELAY_TIMEOUT));
03298552cba38f Hiral Patel       2013-02-12  2315  			} else {
03298552cba38f Hiral Patel       2013-02-12  2316  				spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2317  				fnic_priv(sc)->flags |= FNIC_DEV_RST_TERM_ISSUED;
924cb24df4fc4d Bart Van Assche   2022-02-18  2318  				fnic_priv(sc)->state = FNIC_IOREQ_ABTS_PENDING;
03298552cba38f Hiral Patel       2013-02-12  2319  				io_req->abts_done = &tm_done;
03298552cba38f Hiral Patel       2013-02-12  2320  				spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2321  				FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
03298552cba38f Hiral Patel       2013-02-12  2322  				"Abort and terminate issued on Device reset "
8691055a002b89 Hannes Reinecke   2022-05-02  2323  				"tag 0x%x\n", tag);
03298552cba38f Hiral Patel       2013-02-12  2324  				break;
03298552cba38f Hiral Patel       2013-02-12  2325  			}
03298552cba38f Hiral Patel       2013-02-12  2326  		}
03298552cba38f Hiral Patel       2013-02-12  2327  		while (1) {
03298552cba38f Hiral Patel       2013-02-12  2328  			spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2329  			if (!(fnic_priv(sc)->flags & FNIC_DEV_RST_DONE)) {
03298552cba38f Hiral Patel       2013-02-12  2330  				spin_unlock_irqrestore(io_lock, flags);
03298552cba38f Hiral Patel       2013-02-12  2331  				wait_for_completion_timeout(&tm_done,
03298552cba38f Hiral Patel       2013-02-12  2332  				msecs_to_jiffies(FNIC_LUN_RESET_TIMEOUT));
03298552cba38f Hiral Patel       2013-02-12  2333  				break;
03298552cba38f Hiral Patel       2013-02-12  2334  			} else {
924cb24df4fc4d Bart Van Assche   2022-02-18  2335  				io_req = fnic_priv(sc)->io_req;
03298552cba38f Hiral Patel       2013-02-12  2336  				io_req->abts_done = NULL;
03298552cba38f Hiral Patel       2013-02-12  2337  				goto fnic_device_reset_clean;
03298552cba38f Hiral Patel       2013-02-12  2338  			}
03298552cba38f Hiral Patel       2013-02-12  2339  		}
03298552cba38f Hiral Patel       2013-02-12  2340  	} else {
03298552cba38f Hiral Patel       2013-02-12  2341  		spin_unlock_irqrestore(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2342  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2343  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2344  	/* Completed, but not successful, clean up the io_req, return fail */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2345  	if (status != FCPIO_SUCCESS) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2346  		spin_lock_irqsave(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2347  		FNIC_SCSI_DBG(KERN_DEBUG,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2348  			      fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2349  			      "Device reset completed - failed\n");
924cb24df4fc4d Bart Van Assche   2022-02-18  2350  		io_req = fnic_priv(sc)->io_req;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2351  		goto fnic_device_reset_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2352  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2353  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2354  	/*
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2355  	 * Clean up any aborts on this lun that have still not
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2356  	 * completed. If any of these fail, then LUN reset fails.
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2357  	 * clean_pending_aborts cleans all cmds on this lun except
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2358  	 * the lun reset cmd. If all cmds get cleaned, the lun reset
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2359  	 * succeeds
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2360  	 */
8691055a002b89 Hannes Reinecke   2022-05-02  2361  	if (fnic_clean_pending_aborts(fnic, sc)) {
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2362  		spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2363  		io_req = fnic_priv(sc)->io_req;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2364  		FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2365  			      "Device reset failed"
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2366  			      " since could not abort all IOs\n");
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2367  		goto fnic_device_reset_clean;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2368  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2369  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2370  	/* Clean lun reset command */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2371  	spin_lock_irqsave(io_lock, flags);
924cb24df4fc4d Bart Van Assche   2022-02-18  2372  	io_req = fnic_priv(sc)->io_req;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2373  	if (io_req)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2374  		/* Completed, and successful */
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2375  		ret = SUCCESS;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2376  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2377  fnic_device_reset_clean:
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2378  	if (io_req)
924cb24df4fc4d Bart Van Assche   2022-02-18  2379  		fnic_priv(sc)->io_req = NULL;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2380  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2381  	spin_unlock_irqrestore(io_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2382  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2383  	if (io_req) {
14eb5d905d16ec Hiral Patel       2013-02-12  2384  		start_time = io_req->start_time;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2385  		fnic_release_ioreq_buf(fnic, io_req, sc);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2386  		mempool_free(io_req, fnic->io_req_pool);
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2387  	}
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2388  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2389  fnic_device_reset_end:
8691055a002b89 Hannes Reinecke   2022-05-02  2390  	FNIC_TRACE(fnic_device_reset, sc->device->host->host_no,
8691055a002b89 Hannes Reinecke   2022-05-02  2391  		  scsi_cmd_to_rq(sc)->tag, sc,
4d7007b49d523d Hiral Patel       2013-02-12  2392  		  jiffies_to_msecs(jiffies - start_time),
4d7007b49d523d Hiral Patel       2013-02-12  2393  		  0, ((u64)sc->cmnd[0] << 32 |
4d7007b49d523d Hiral Patel       2013-02-12  2394  		  (u64)sc->cmnd[2] << 24 | (u64)sc->cmnd[3] << 16 |
4d7007b49d523d Hiral Patel       2013-02-12  2395  		  (u64)sc->cmnd[4] << 8 | sc->cmnd[5]),
924cb24df4fc4d Bart Van Assche   2022-02-18  2396  		  fnic_flags_and_state(sc));
4d7007b49d523d Hiral Patel       2013-02-12  2397  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2398  	FNIC_SCSI_DBG(KERN_DEBUG, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2399  		      "Returning from device reset %s\n",
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2400  		      (ret == SUCCESS) ?
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2401  		      "SUCCESS" : "FAILED");
67125b0287a9e6 Hiral Patel       2013-09-12  2402  
67125b0287a9e6 Hiral Patel       2013-09-12  2403  	if (ret == FAILED)
67125b0287a9e6 Hiral Patel       2013-09-12  2404  		atomic64_inc(&reset_stats->device_reset_failures);
67125b0287a9e6 Hiral Patel       2013-09-12  2405  
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2406  	return ret;
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2407  }
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  2408  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
