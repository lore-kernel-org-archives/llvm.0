Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D989FBF1;
	Thu, 29 Jun 2023 22:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688076367; x=1719612367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KroM8puHGKZ2GhPTHV5bkuvKmw/g83hXo9qNzMJhDzg=;
  b=lJEPpqyRxXmOIPwxREO3jiGck4my3Y6k2v4DLw2EIziLcMv3abf2HomI
   Iuy2VOeWwIHMAoP3MAbDP9UlP5ufQbx1tJcvUi7XA29IoOdpRdZI7Q3m2
   cQhojeJ99yGFkjhr0ikWvt44j2oPa4aoyv7ugpXWVTaI1XQo7qo9unmdl
   PcgJY2U4t3Z2WNSycCqy4CiYJJmLqoA1VGSqe1bbgee9Sdh/bcWwY6G7k
   py9+VzpUXve/eyseimHYhLmhMNaR9hxrWMbh1I90mMOeSm24bFEyT4qRJ
   MxU4cFO5yEKvEOCuU1oIU4e3dSIt85gIQiqNi7cUjP3FUhMP0sbyVuuyN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364819239"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364819239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 15:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711605553"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="711605553"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 15:06:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEzm3-000ERR-3B;
	Thu, 29 Jun 2023 22:05:59 +0000
Date: Fri, 30 Jun 2023 06:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] ld.lld: error: undefined
 symbol: snd_ump_transmit
Message-ID: <202306300550.yyh6cWzj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd
commit: ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd [56/56] usb: gadget: add support for USB MIDI 2.0 function driver (WIP)
config: i386-randconfig-r023-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300550.yyh6cWzj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300550.yyh6cWzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300550.yyh6cWzj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snd_ump_transmit
   >>> referenced by f_midi2.c:644 (drivers/usb/gadget/function/f_midi2.c:644)
   >>>               drivers/usb/gadget/function/f_midi2.o:(process_ump_transmit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_endpoint_new
   >>> referenced by f_midi2.c:946 (drivers/usb/gadget/function/f_midi2.c:946)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_block_new
   >>> referenced by f_midi2.c:957 (drivers/usb/gadget/function/f_midi2.c:957)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_bind) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_receive
   >>> referenced by f_midi2.c:623 (drivers/usb/gadget/function/f_midi2.c:623)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_ep_out_complete) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_ump_receive_ump_val
   >>> referenced by f_midi2.c:599 (drivers/usb/gadget/function/f_midi2.c:599)
   >>>               drivers/usb/gadget/function/f_midi2.o:(f_midi2_ep_out_complete) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
