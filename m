Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39D17E7
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 01:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652403640; x=1683939640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+CBhS+9r9aX0w6K7C1Kn4GMveFRn/hT6QJ+Y2T1zfM=;
  b=dIkhWu62QWRFNapAydn6UkrW8MXyfZe2BzGSwycVVcpTlGKRWrmk0Ph5
   oBOyDfs4KHNi+B7ZmX/rwk2ND5clUgrGdrTKZXVzVXEQToSSGKiyLLVGC
   lMAvi9+Gl5eC1peIKn9PJFyAbe4zIr40iPY5azdeuysrVnm+Q+r2ZPO0J
   cJbvm9OHZOH+HOxok5i/kIS5n3sW+l2Vgctukzg6HdbrSB6+Rl1Q0gw+U
   K9fYXO+Zj/OsPVDINuV9wL3Op/1pPvdJapKjNzxCLhTcNueM5yJM+Nsrf
   uaaaD6CO171wSQGS8q5gOsb35WMJxFEPSNztPhxA67DBM0weYBnAVxSx6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270311949"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="270311949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 18:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="554015968"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2022 18:00:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npJfH-000L7k-5D;
	Fri, 13 May 2022 01:00:19 +0000
Date: Fri, 13 May 2022 09:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless 35/35]
 net/rxrpc/recvmsg.c:297:9: warning: variable 'j' is uninitialized when used
 here
Message-ID: <202205130800.78D0sAwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-ringless
head:   36075641f704b02b4bcaee01d904a06676b32199
commit: 36075641f704b02b4bcaee01d904a06676b32199 [35/35] rxrpc: Don't split up received jumbo packets
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220513/202205130800.78D0sAwZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/36075641f704b02b4bcaee01d904a06676b32199
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-ringless
        git checkout 36075641f704b02b4bcaee01d904a06676b32199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iommu/ kernel/trace/ net/rxrpc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/rxrpc/recvmsg.c:297:9: warning: variable 'j' is uninitialized when used here [-Wuninitialized]
           for (; j < nr_subs; j++, seq++) {
                  ^
   net/rxrpc/recvmsg.c:289:47: note: initialize the variable 'j' to silence this warning
           int nr_subs = sp->nr_subpackets - 1, i = 0, j;
                                                        ^
                                                         = 0
   1 warning generated.


vim +/j +297 net/rxrpc/recvmsg.c

   275	
   276	/*
   277	 * Set up a data location table for a jumbo DATA packet then verify
   278	 * and decrypt all the subpackets and locate the data for each.  We
   279	 * also need to skip over any duplicate subpackets.
   280	 */
   281	static int rxrpc_verify_data(struct rxrpc_call *call, struct sk_buff *skb)
   282	{
   283		struct rxrpc_jumbo_header jhdr;
   284		struct rxrpc_skb_subpacket *subs;
   285		struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
   286		unsigned int offset = sizeof(struct rxrpc_wire_header);
   287		unsigned int len = skb->len - sizeof(struct rxrpc_wire_header);
   288		rxrpc_seq_t seq = sp->hdr.seq;
   289		int nr_subs = sp->nr_subpackets - 1, i = 0, j;
   290		u16 cksum = sp->hdr.cksum;
   291	
   292		subs = kcalloc(sp->nr_subpackets, sizeof(*sp->subs), GFP_KERNEL);
   293		if (!subs)
   294			return -ENOMEM;
   295		sp->subs = subs;
   296	
 > 297		for (; j < nr_subs; j++, seq++) {
   298			if (after(seq, call->rx_consumed)) {
   299				subs[i].offset	= offset;
   300				subs[i].len	= RXRPC_JUMBO_DATALEN;
   301				subs[i].cksum	= cksum;
   302				i++;
   303			} else {
   304				sp->hdr.seq++;
   305				sp->nr_subpackets--;
   306			}
   307			offset += RXRPC_JUMBO_DATALEN;
   308			if (skb_copy_bits(skb, offset, &jhdr.cksum, 2) < 0)
   309				return -EPROTO;
   310			offset += sizeof(jhdr);
   311			cksum = htons(jhdr.cksum);
   312			len -= RXRPC_JUMBO_SUBPKTLEN;
   313		}
   314	
   315		subs[i].offset	= offset;
   316		subs[i].len	= len;
   317		subs[i].cksum	= cksum;
   318		return call->security->verify_packet(call, skb);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
