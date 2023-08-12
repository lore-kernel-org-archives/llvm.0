Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8E38C16;
	Sat, 12 Aug 2023 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691832851; x=1723368851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SjvN5CC5MQjTjWmHSREYybADaNgdxiMN/4iNH/pd900=;
  b=aicPP28kbMJrtKyqbXEu6MVH2vaKJScNCiKojzHBInz0LF39RMnf0Lct
   6P0nLsEjnqtQs9QoF3bS+ztafvCeOjqBAQ/RHVY/gflnsVFVbVVbFC/aM
   t5CBl6Uy4QE3AcqWJjpVTtFeQJjlvcZQCGbP9BAPEZJw/G0fIc+4omSpd
   nyo0BS/uyks9IdLrUCNhyitCHkZsYeXjnUgjwC2ZdY+iMOZ9qKiws/bJv
   gfa/+Dc4SBmSve2npeGVQd1SP+3GZm0FrgZ5b8L49DVkIn7mXl9X9D3NL
   GwKrvIWaHbnsDbVKqJaUX8CP8+fKUvFFXrKEwtkUpAzrtJ7vxb7ZtiXHu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356775432"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="356775432"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 02:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="802921281"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="802921281"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Aug 2023 02:34:09 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUl0a-0008Rs-17;
	Sat, 12 Aug 2023 09:34:08 +0000
Date: Sat, 12 Aug 2023 17:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v12 18/19] drivers/nvme/target/tcp.c:1850:1: warning:
 unused label 'out_destroy_sq'
Message-ID: <202308121722.UTm9wQud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v12
head:   c623bc8e57d23dde503188eacbf2d11e7dfe0564
commit: 2a255c0e370975ef7a7b22e4fce2d77080280761 [18/19] nvmet-tcp: enable TLS handshake upcall
config: i386-randconfig-i015-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121722.UTm9wQud-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121722.UTm9wQud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121722.UTm9wQud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/tcp.c:1850:1: warning: unused label 'out_destroy_sq' [-Wunused-label]
   out_destroy_sq:
   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/out_destroy_sq +1850 drivers/nvme/target/tcp.c

  1845	
  1846		ret = nvmet_tcp_set_queue_sock(queue);
  1847		if (!ret)
  1848			return;
  1849	
> 1850	out_destroy_sq:
  1851		queue->state = NVMET_TCP_Q_DISCONNECTING;
  1852		mutex_lock(&nvmet_tcp_queue_mutex);
  1853		list_del_init(&queue->queue_list);
  1854		mutex_unlock(&nvmet_tcp_queue_mutex);
  1855		nvmet_tcp_put_queue(queue);
  1856		return;
  1857	out_free_connect:
  1858		nvmet_tcp_free_cmd(&queue->connect);
  1859	out_ida_remove:
  1860		ida_free(&nvmet_tcp_queue_ida, queue->idx);
  1861	out_sock:
  1862		fput(queue->sock->file);
  1863	out_free_queue:
  1864		kfree(queue);
  1865	out_release:
  1866		pr_err("failed to allocate queue, error %d\n", ret);
  1867		if (!sock_file)
  1868			sock_release(newsock);
  1869	}
  1870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
