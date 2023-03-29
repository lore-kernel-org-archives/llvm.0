Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9FAD30;
	Wed, 29 Mar 2023 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680129977; x=1711665977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jf77cf4zG48zuTGn7CMDjSXp5Q9zGuHWoUhPFdH5TSo=;
  b=DpEHnUEHcfgDy0/9hj9ujTI7F0ub78PobkXBgzOdHnX9vaIQj1GbUTbC
   QzANATRF3rr/EFeUi37fjJ0AMedpyPuKci9iUZNldCN2BikqmyycDFuyN
   FHK+MGc0DUz/8NvMF+IbtlMr5hlqkfEzdpiNK/1tohgRq4/XF/uBwCP2i
   YjfR3RInlF3nrSj1u3tdZe+c1Jyi9uNpxM3/E5F+s1qI7yEndMdqRXzyh
   sMzBYRWxm0G2vtiiCBGCBB9dkTHWZQRoYjRCx1hbr0wbC3sNrCs5EVPt8
   w09kunVk7r+XH+mguXTlbMVoVbstX9/K06OzQw8wWjSAySgOtQGg773np
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339739217"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339739217"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 15:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748940491"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="748940491"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 15:46:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pheYY-000K1N-39;
	Wed, 29 Mar 2023 22:46:14 +0000
Date: Thu, 30 Mar 2023 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v8 18/20]
 drivers/nvme/target/tcp.c:653:24: error: no member named 'tls_psk' in
 'struct nvmet_tcp_queue'
Message-ID: <202303300627.eP6f2RpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v8
head:   b160cccb84362674ac09fb349ab21bd2339eb28e
commit: 6f832c87e83768f104444dbfc3945a8ee2e24b65 [18/20] nvmet-tcp: rework sendpage for kTLS
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230330/202303300627.eP6f2RpR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=6f832c87e83768f104444dbfc3945a8ee2e24b65
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v8
        git checkout 6f832c87e83768f104444dbfc3945a8ee2e24b65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/ drivers/nvme/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300627.eP6f2RpR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/target/tcp.c:653:24: error: no member named 'tls_psk' in 'struct nvmet_tcp_queue'
           else if (!cmd->queue->tls_psk)
                     ~~~~~~~~~~  ^
   drivers/nvme/target/tcp.c:681:24: error: no member named 'tls_psk' in 'struct nvmet_tcp_queue'
           else if (!cmd->queue->tls_psk)
                     ~~~~~~~~~~  ^
   drivers/nvme/target/tcp.c:711:24: error: no member named 'tls_psk' in 'struct nvmet_tcp_queue'
           else if (!cmd->queue->tls_psk)
                     ~~~~~~~~~~  ^
   drivers/nvme/target/tcp.c:1801:1: warning: unused label 'out_free_queue' [-Wunused-label]
   out_free_queue:
   ^~~~~~~~~~~~~~~
   1 warning and 3 errors generated.


vim +653 drivers/nvme/target/tcp.c

   642	
   643	static int nvmet_try_send_response(struct nvmet_tcp_cmd *cmd,
   644			bool last_in_batch)
   645	{
   646		u8 hdgst = nvmet_tcp_hdgst_len(cmd->queue);
   647		int left = sizeof(*cmd->rsp_pdu) - cmd->offset + hdgst;
   648		int flags = MSG_DONTWAIT;
   649		int ret;
   650	
   651		if (!last_in_batch && cmd->queue->send_list_len)
   652			flags |= MSG_MORE | MSG_SENDPAGE_NOTLAST;
 > 653		else if (!cmd->queue->tls_psk)
   654			flags |= MSG_EOR;
   655	
   656		ret = kernel_sendpage(cmd->queue->sock, virt_to_page(cmd->rsp_pdu),
   657			offset_in_page(cmd->rsp_pdu) + cmd->offset, left, flags);
   658		if (ret <= 0)
   659			return ret;
   660		cmd->offset += ret;
   661		left -= ret;
   662	
   663		if (left)
   664			return -EAGAIN;
   665	
   666		nvmet_tcp_free_cmd_buffers(cmd);
   667		cmd->queue->snd_cmd = NULL;
   668		nvmet_tcp_put_cmd(cmd);
   669		return 1;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
