Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013040D569;
	Fri, 19 Jun 2026 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781911115; cv=none; b=ctwlauXx+AzXQfIFCYM4myfSSPL4YqSiRiiBXBA4NiRidB74O3xX9oWPT3y1Jx6GTdrXMoE197nhPpahLoX3Y7BcJf9CyI+QdqniOd3L51Q9GtZ9Uw9L3aA0WvWzt31tsQbZe+EMSWcRz/Q9/KS8UL+LudOGi7hv0ABVa4PRz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781911115; c=relaxed/simple;
	bh=oOmVnK/58d3gl4qRP4JqDBuMF10hajl0Z9w5g5WqeBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SP+SeGUKeWbv0NpFBNGvuGsE/LxoNhbnx4cP9e4EcCrJXzmmOpQKwAoQpQbFfxoVufikT2A4J2JAza/kAYArTmJwHsTSKx9nSQ3R3bpHMrXQkXM+9S4GPZ86e6pK0oX1R1XVuVA3vIn97GvVxgOUZ0p9lYlF/T49l+zkcqGTSho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYSfI4Lf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYSfI4Lf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781911113; x=1813447113;
  h=date:from:to:cc:subject:message-id;
  bh=oOmVnK/58d3gl4qRP4JqDBuMF10hajl0Z9w5g5WqeBA=;
  b=DYSfI4Lfjx6RUau+uLmVq6KWvmiBjpopG6UjG/8dsys6iyPOuaNj42D9
   iZzk8TnNXfwyZzIT6UJZjiVb1qHTLj5QsAYWcrsqSdX6tAyaUjwVCW3KD
   IGlCiaQ+XsigCHrAp7Wlhjc3grJfS62iC934pdSFw/vxsM8N5c1NZcJj1
   oTbqJOiqnXqyow5dFzQw6NadbPv0ZN6pn/y4/WpXF4gVPLISnnpSP/w46
   CTFN96YekBJVpR3rUQS86N5ogyha32XNxrGSgsC0e0961ihze5szg3HMO
   JFrtLPFIjv3K8Vsa4GAkRCSZWGSj7xVLCiHAtrt8Lw9bcPNH8qo72Aoz3
   Q==;
X-CSE-ConnectionGUID: GrkSdDX/QtuOcMRv3G7Yrw==
X-CSE-MsgGUID: M1ol5O12R5yK/k2P5Zq+JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82844004"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="82844004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 16:18:33 -0700
X-CSE-ConnectionGUID: XHR5mHTFSq+3J8qByPFeEQ==
X-CSE-MsgGUID: thun6/RGRx+8xo0MSHal7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="253716754"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 19 Jun 2026 16:18:32 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waiTl-000000005hF-2NTG;
	Fri, 19 Jun 2026 23:18:29 +0000
Date: Sat, 20 Jun 2026 01:17:43 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 16/17]
 drivers/nvme/target/loop.c:542:36: error: incomplete definition of type
 'struct nsproxy'
Message-ID: <202606200127.TpjgremQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: 5ee9c143b806000467a489e080f5d0f7db3af48e [16/17] nvmet-loop: skip ports from wrong namespaces
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260620/202606200127.TpjgremQ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606200127.TpjgremQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606200127.TpjgremQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/target/loop.c:542:36: error: incomplete definition of type 'struct nsproxy'
     542 |                 if (p->net_ns != current->nsproxy->net_ns)
         |                                  ~~~~~~~~~~~~~~~~^
   include/linux/sched.h:72:8: note: forward declaration of 'struct nsproxy'
      72 | struct nsproxy;
         |        ^
   1 error generated.


vim +542 drivers/nvme/target/loop.c

   534	
   535	static struct nvmet_port *nvme_loop_find_port(struct nvme_ctrl *ctrl)
   536	{
   537		struct nvmet_port *p, *found = NULL;
   538	
   539		mutex_lock(&nvme_loop_ports_mutex);
   540		list_for_each_entry(p, &nvme_loop_ports, entry) {
   541			/* Skip ports from non-matching namespaces */
 > 542			if (p->net_ns != current->nsproxy->net_ns)
   543				continue;
   544			/* if no transport address is specified use the first port */
   545			if ((ctrl->opts->mask & NVMF_OPT_TRADDR) &&
   546			    strcmp(ctrl->opts->traddr, p->disc_addr.traddr))
   547				continue;
   548			found = p;
   549			break;
   550		}
   551		mutex_unlock(&nvme_loop_ports_mutex);
   552		return found;
   553	}
   554	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
