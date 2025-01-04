Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666FE45016;
	Sat,  4 Jan 2025 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014334; cv=none; b=j4TjQ6unKAxLTCMoxOXML4igh0gCsSTu1WEloZH2f+6CZGf12E61IyJQ7+WPbTIPN/4RncqGrsHpPh712pb/EN6bCtyFWdcs25RCzhzMPwev1lqqATjR4zbSusQexFzvuEHPjT5kFoB8oDVuEI1wsVNz2TUvgVCCAfLd7fQJFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014334; c=relaxed/simple;
	bh=bEdEZDsKvjKvYISSsqUWqDonU9gW1hZc1LD8ZT7VxKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UotqXaXUk9gS3gsbmK1zDKG8mYmZsaxXCTUCQBfAJcubpJdp7lxEiCNmOK2LgSaMIfOcb/C+vCiVnrzziJF9gWjo/nL8vxP1FbczzuhMtEVUKAM16CbFgqvAe3T/TU4EyCgfdMCgd25EFsgaaSmgeNMG/vLOWOlHdwJvud20Bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7ZS7Zv5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7ZS7Zv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736014331; x=1767550331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bEdEZDsKvjKvYISSsqUWqDonU9gW1hZc1LD8ZT7VxKw=;
  b=B7ZS7Zv5OqseHSgslFT39iLKOyW5461C49xhftvNsIayokY3tNr+VogU
   5EARw8VHaQoUb1GZLeSJPnSsP/pDQvGZgiZuutu9oxUJUvcIcNUfSPqHd
   YCyG34HK1whC9DwsLhLrOxUpW+XvowJH/M1jeTORZIswIKy2tzC0jNcgp
   OcsmdDd0MDOD+8FYc4SNsYpTLuYRGd1xTcWvdNdQGaDLIGpI9bkn8yVef
   hALDwibscyrwvkBHUMLVbfp1osEzklZjNq3qTreDNs56M4phKVBy89Wq0
   Uwg/xITmys9n5SL1Nii7Pk1faq9cEh9IEK4gtFDUEJn2qS6rAsNniG+RU
   Q==;
X-CSE-ConnectionGUID: miODIY/fTmiem7iVnK9vjg==
X-CSE-MsgGUID: drRh/XoHQGqA0tR6VP4Vhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="53765793"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="53765793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 10:12:11 -0800
X-CSE-ConnectionGUID: PWYoHdEfS5yRDNe49Nrr8Q==
X-CSE-MsgGUID: dbnoRSxiQbWPWUzn2BL7tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="106907870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 10:12:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU8d4-000B7X-2c;
	Sat, 04 Jan 2025 18:12:06 +0000
Date: Sun, 5 Jan 2025 02:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sstabellini@kernel.org, jgross@suse.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: update pvcalls_front_accept prototype
Message-ID: <202501050103.LVGxLcNl-lkp@intel.com>
References: <alpine.DEB.2.22.394.2501031501420.16425@ubuntu-linux-20-04-desktop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2501031501420.16425@ubuntu-linux-20-04-desktop>

Hi Stefano,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefano-Stabellini/xen-update-pvcalls_front_accept-prototype/20250104-070503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/alpine.DEB.2.22.394.2501031501420.16425%40ubuntu-linux-20-04-desktop
patch subject: [PATCH] xen: update pvcalls_front_accept prototype
config: x86_64-buildonly-randconfig-005-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050103.LVGxLcNl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050103.LVGxLcNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050103.LVGxLcNl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/pvcalls-front.c:7:
   In file included from include/linux/net.h:24:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/xen/pvcalls-front.c:772:5: error: conflicting types for 'pvcalls_front_accept'
     772 | int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
         |     ^
   drivers/xen/pvcalls-front.h:13:5: note: previous declaration is here
      13 | int pvcalls_front_accept(struct socket *sock,
         |     ^
   1 warning and 1 error generated.


vim +/pvcalls_front_accept +772 drivers/xen/pvcalls-front.c

1853f11d72ed46 Stefano Stabellini 2017-10-30  771  
9774c6cca26610 Stefano Stabellini 2017-10-30 @772  int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
9774c6cca26610 Stefano Stabellini 2017-10-30  773  {
9774c6cca26610 Stefano Stabellini 2017-10-30  774  	struct pvcalls_bedata *bedata;
9774c6cca26610 Stefano Stabellini 2017-10-30  775  	struct sock_mapping *map;
9774c6cca26610 Stefano Stabellini 2017-10-30  776  	struct sock_mapping *map2 = NULL;
9774c6cca26610 Stefano Stabellini 2017-10-30  777  	struct xen_pvcalls_request *req;
0102e4efda76d0 Yan Yankovskyi     2020-03-23  778  	int notify, req_id, ret, nonblock;
0102e4efda76d0 Yan Yankovskyi     2020-03-23  779  	evtchn_port_t evtchn;
9774c6cca26610 Stefano Stabellini 2017-10-30  780  
64d6871827b1e2 Stefano Stabellini 2018-02-14  781  	map = pvcalls_enter_sock(sock);
64d6871827b1e2 Stefano Stabellini 2018-02-14  782  	if (IS_ERR(map))
64d6871827b1e2 Stefano Stabellini 2018-02-14  783  		return PTR_ERR(map);
9774c6cca26610 Stefano Stabellini 2017-10-30  784  	bedata = dev_get_drvdata(&pvcalls_front_dev->dev);
9774c6cca26610 Stefano Stabellini 2017-10-30  785  
9774c6cca26610 Stefano Stabellini 2017-10-30  786  	if (map->passive.status != PVCALLS_STATUS_LISTEN) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  787  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  788  		return -EINVAL;
9774c6cca26610 Stefano Stabellini 2017-10-30  789  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  790  
9774c6cca26610 Stefano Stabellini 2017-10-30  791  	nonblock = flags & SOCK_NONBLOCK;
9774c6cca26610 Stefano Stabellini 2017-10-30  792  	/*
9774c6cca26610 Stefano Stabellini 2017-10-30  793  	 * Backend only supports 1 inflight accept request, will return
9774c6cca26610 Stefano Stabellini 2017-10-30  794  	 * errors for the others
9774c6cca26610 Stefano Stabellini 2017-10-30  795  	 */
9774c6cca26610 Stefano Stabellini 2017-10-30  796  	if (test_and_set_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  797  			     (void *)&map->passive.flags)) {
9774c6cca26610 Stefano Stabellini 2017-10-30  798  		req_id = READ_ONCE(map->passive.inflight_req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  799  		if (req_id != PVCALLS_INVALID_ID &&
9774c6cca26610 Stefano Stabellini 2017-10-30  800  		    READ_ONCE(bedata->rsp[req_id].req_id) == req_id) {
9774c6cca26610 Stefano Stabellini 2017-10-30  801  			map2 = map->passive.accept_map;
9774c6cca26610 Stefano Stabellini 2017-10-30  802  			goto received;
9774c6cca26610 Stefano Stabellini 2017-10-30  803  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  804  		if (nonblock) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  805  			pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  806  			return -EAGAIN;
9774c6cca26610 Stefano Stabellini 2017-10-30  807  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  808  		if (wait_event_interruptible(map->passive.inflight_accept_req,
9774c6cca26610 Stefano Stabellini 2017-10-30  809  			!test_and_set_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  810  					  (void *)&map->passive.flags))) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  811  			pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  812  			return -EINTR;
9774c6cca26610 Stefano Stabellini 2017-10-30  813  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  814  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  815  
9f51c05dc41a6d Wen Yang           2018-12-05  816  	map2 = kzalloc(sizeof(*map2), GFP_KERNEL);
9f51c05dc41a6d Wen Yang           2018-12-05  817  	if (map2 == NULL) {
9f51c05dc41a6d Wen Yang           2018-12-05  818  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9f51c05dc41a6d Wen Yang           2018-12-05  819  			  (void *)&map->passive.flags);
9f51c05dc41a6d Wen Yang           2018-12-05  820  		pvcalls_exit_sock(sock);
9f51c05dc41a6d Wen Yang           2018-12-05  821  		return -ENOMEM;
9f51c05dc41a6d Wen Yang           2018-12-05  822  	}
9f51c05dc41a6d Wen Yang           2018-12-05  823  	ret = alloc_active_ring(map2);
9774c6cca26610 Stefano Stabellini 2017-10-30  824  	if (ret < 0) {
9774c6cca26610 Stefano Stabellini 2017-10-30  825  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  826  				(void *)&map->passive.flags);
9f51c05dc41a6d Wen Yang           2018-12-05  827  		kfree(map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  828  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  829  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  830  	}
c66bb48edd58c3 Juergen Gross      2023-04-03  831  	ret = create_active(map2, &evtchn);
9f51c05dc41a6d Wen Yang           2018-12-05  832  	if (ret < 0) {
9f51c05dc41a6d Wen Yang           2018-12-05  833  		free_active_ring(map2);
9f51c05dc41a6d Wen Yang           2018-12-05  834  		kfree(map2);
c66bb48edd58c3 Juergen Gross      2023-04-03  835  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
c66bb48edd58c3 Juergen Gross      2023-04-03  836  			  (void *)&map->passive.flags);
64d6871827b1e2 Stefano Stabellini 2018-02-14  837  		pvcalls_exit_sock(sock);
9f51c05dc41a6d Wen Yang           2018-12-05  838  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  839  	}
9f51c05dc41a6d Wen Yang           2018-12-05  840  
c66bb48edd58c3 Juergen Gross      2023-04-03  841  	spin_lock(&bedata->socket_lock);
c66bb48edd58c3 Juergen Gross      2023-04-03  842  	ret = get_request(bedata, &req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  843  	if (ret < 0) {
9774c6cca26610 Stefano Stabellini 2017-10-30  844  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  845  			  (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  846  		spin_unlock(&bedata->socket_lock);
c66bb48edd58c3 Juergen Gross      2023-04-03  847  		pvcalls_front_free_map(bedata, map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  848  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  849  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  850  	}
c66bb48edd58c3 Juergen Gross      2023-04-03  851  
9774c6cca26610 Stefano Stabellini 2017-10-30  852  	list_add_tail(&map2->list, &bedata->socket_mappings);
9774c6cca26610 Stefano Stabellini 2017-10-30  853  
9774c6cca26610 Stefano Stabellini 2017-10-30  854  	req = RING_GET_REQUEST(&bedata->ring, req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  855  	req->req_id = req_id;
9774c6cca26610 Stefano Stabellini 2017-10-30  856  	req->cmd = PVCALLS_ACCEPT;
9774c6cca26610 Stefano Stabellini 2017-10-30  857  	req->u.accept.id = (uintptr_t) map;
9774c6cca26610 Stefano Stabellini 2017-10-30  858  	req->u.accept.ref = map2->active.ref;
9774c6cca26610 Stefano Stabellini 2017-10-30  859  	req->u.accept.id_new = (uintptr_t) map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  860  	req->u.accept.evtchn = evtchn;
9774c6cca26610 Stefano Stabellini 2017-10-30  861  	map->passive.accept_map = map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  862  
9774c6cca26610 Stefano Stabellini 2017-10-30  863  	bedata->ring.req_prod_pvt++;
9774c6cca26610 Stefano Stabellini 2017-10-30  864  	RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(&bedata->ring, notify);
9774c6cca26610 Stefano Stabellini 2017-10-30  865  	spin_unlock(&bedata->socket_lock);
9774c6cca26610 Stefano Stabellini 2017-10-30  866  	if (notify)
9774c6cca26610 Stefano Stabellini 2017-10-30  867  		notify_remote_via_irq(bedata->irq);
9774c6cca26610 Stefano Stabellini 2017-10-30  868  	/* We could check if we have received a response before returning. */
9774c6cca26610 Stefano Stabellini 2017-10-30  869  	if (nonblock) {
9774c6cca26610 Stefano Stabellini 2017-10-30  870  		WRITE_ONCE(map->passive.inflight_req_id, req_id);
64d6871827b1e2 Stefano Stabellini 2018-02-14  871  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  872  		return -EAGAIN;
9774c6cca26610 Stefano Stabellini 2017-10-30  873  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  874  
9774c6cca26610 Stefano Stabellini 2017-10-30  875  	if (wait_event_interruptible(bedata->inflight_req,
9774c6cca26610 Stefano Stabellini 2017-10-30  876  		READ_ONCE(bedata->rsp[req_id].req_id) == req_id)) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  877  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  878  		return -EINTR;
9774c6cca26610 Stefano Stabellini 2017-10-30  879  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  880  	/* read req_id, then the content */
9774c6cca26610 Stefano Stabellini 2017-10-30  881  	smp_rmb();
9774c6cca26610 Stefano Stabellini 2017-10-30  882  
9774c6cca26610 Stefano Stabellini 2017-10-30  883  received:
9774c6cca26610 Stefano Stabellini 2017-10-30  884  	map2->sock = newsock;
beee1fbe8f7d57 Stefano Stabellini 2018-12-21  885  	newsock->sk = sk_alloc(sock_net(sock->sk), PF_INET, GFP_KERNEL, &pvcalls_proto, false);
9774c6cca26610 Stefano Stabellini 2017-10-30  886  	if (!newsock->sk) {
9774c6cca26610 Stefano Stabellini 2017-10-30  887  		bedata->rsp[req_id].req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  888  		map->passive.inflight_req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  889  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  890  			  (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  891  		pvcalls_front_free_map(bedata, map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  892  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  893  		return -ENOMEM;
9774c6cca26610 Stefano Stabellini 2017-10-30  894  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  895  	newsock->sk->sk_send_head = (void *)map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  896  
9774c6cca26610 Stefano Stabellini 2017-10-30  897  	ret = bedata->rsp[req_id].ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  898  	bedata->rsp[req_id].req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  899  	map->passive.inflight_req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  900  
9774c6cca26610 Stefano Stabellini 2017-10-30  901  	clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT, (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  902  	wake_up(&map->passive.inflight_accept_req);
9774c6cca26610 Stefano Stabellini 2017-10-30  903  
64d6871827b1e2 Stefano Stabellini 2018-02-14  904  	pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  905  	return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  906  }
9774c6cca26610 Stefano Stabellini 2017-10-30  907  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
