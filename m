Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CAC2E0;
	Wed, 26 Apr 2023 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682492923; x=1714028923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=now8KsnWoa2Jc2GJn0vcsUknyuSvaNig3XN8wu45wj0=;
  b=lmdS55m6B397SzbQsxyj2UHBMEwWJjiXiSGmCPe59q7fnVnArKNyDKEH
   NzaAcIdSYXi3cxEzsZ6QVwyfr793mDyGOlxbtjBwKK+yYSANGXmxJm8nt
   RyzJ6JK+6UJ4FvuAZmEVqKtmoLoTKkxhuLy8xGYM5pXcUfXwsdGmvvDOZ
   O8CiSdpuZJ4Yr9c0uN0hdE8anfHWPFvpfO+iyMsF6tF3ToMMj8S+ECesp
   zmmKGeEwRo2TlaDvHCvZaF9FFrri/pfmXkZzh86QKX03DnvGDihg/Zsl7
   alas9aiT6k0Tq0AeQEBvQZtx3iFHI+q5R6XwsJB34xmxquB9tIdK5wAqO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374975774"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="374975774"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 00:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="940086953"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="940086953"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2023 00:08:42 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prZGX-0000FO-0b;
	Wed, 26 Apr 2023 07:08:37 +0000
Date: Wed, 26 Apr 2023 15:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:fix_ring_expansion 2/2]
 drivers/usb/host/xhci-ring.c:300:11: warning: variable 'free' is
 uninitialized when used here
Message-ID: <202304261531.wNaJdrf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_ring_expansion
head:   5d43e1a13408572e6bf8f7d91c9b26825f0287a9
commit: 5d43e1a13408572e6bf8f7d91c9b26825f0287a9 [2/2] xhci: Stop unnecessary and incorrect tracking of free trbs in a ring
config: x86_64-randconfig-a003-20230424 (https://download.01.org/0day-ci/archive/20230426/202304261531.wNaJdrf8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=5d43e1a13408572e6bf8f7d91c9b26825f0287a9
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci fix_ring_expansion
        git checkout 5d43e1a13408572e6bf8f7d91c9b26825f0287a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261531.wNaJdrf8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-ring.c:300:11: warning: variable 'free' is uninitialized when used here [-Wuninitialized]
                           return free + (ring->dequeue - enq);
                                  ^~~~
   drivers/usb/host/xhci-ring.c:285:19: note: initialize the variable 'free' to silence this warning
           unsigned int free;
                            ^
                             = 0
>> drivers/usb/host/xhci-ring.c:305:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
           } while (i++ <= ring->num_segs);
                    ^
   drivers/usb/host/xhci-ring.c:286:7: note: initialize the variable 'i' to silence this warning
           int i;
                ^
                 = 0
   2 warnings generated.


vim +/free +300 drivers/usb/host/xhci-ring.c

   273	
   274	/*
   275	 * Return number of free normal TRBs from enqueue to dequeue pointer on ring.
   276	 * Not counting an assumed link TRB at end of each TRBS_PER_SEGMENT sized segment.
   277	 * Only for transfer and command rings where driver is the producer, not for
   278	 * event rings.
   279	 */
   280	static unsigned int xhci_num_trbs_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
   281	{
   282		struct xhci_segment *enq_seg = ring->enq_seg;
   283		union xhci_trb *enq = ring->enqueue;
   284		union xhci_trb *last_on_seg;
   285		unsigned int free;
   286		int i;
   287	
   288		/* Ring might be empty even if enq != deq if enq is left on a link trb */
   289		if (trb_is_link(enq)) {
   290			enq_seg = enq_seg->next;
   291			enq = enq_seg->trbs;
   292		}
   293	
   294		/* Empty ring, common case, don't walk the segments */
   295		if (enq == ring->dequeue)
   296			return ring->num_segs * (TRBS_PER_SEGMENT - 1);
   297	
   298		do {
   299			if (ring->deq_seg == enq_seg && ring->dequeue >= enq)
 > 300				return free + (ring->dequeue - enq);
   301			last_on_seg = &enq_seg->trbs[TRBS_PER_SEGMENT - 1];
   302			free += last_on_seg - enq;
   303			enq_seg = enq_seg->next;
   304			enq = enq_seg->trbs;
 > 305		} while (i++ <= ring->num_segs);
   306	
   307		return free;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
