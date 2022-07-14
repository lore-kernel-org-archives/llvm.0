Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B15323E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657801459; x=1689337459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sAe1wCd/UYxw7PT5ONqv5nf508hnCMq35g3ketoUO+k=;
  b=EWY+lv2Yqe2iod2q86J2hZIRLrRuXvGcvCr3KvNAzq7Qof3d5eHVNRbq
   OcVuZBEM2yDlkjElqBnfH1U7NHzoYPDSeewS2k89AQgDoo5GGdCo7odg/
   UMah0wB6VaLZ4cjxLJ1kQoWJmX3hDpOP2CdRgIK/JSEdCGbrpfcK0sATC
   1kTY26NZURv0TLztxffasp9D2kVbPRFVq7afAZ3t7lGHXeC1EWaKZrjTo
   G7vT83h2ZSahGGb3kHl287DJ603taAO5KtJLmXcTr779Kog6WuSY8FQ03
   TgasEs0vEf53RhpOrgSRQMNupNeUgjtVzxQeSe7veRJmtTIWFPVJJ/cJe
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286635411"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="286635411"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 05:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="722705013"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jul 2022 05:24:15 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBxt8-0000bG-SE;
	Thu, 14 Jul 2022 12:24:14 +0000
Date: Thu, 14 Jul 2022 20:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [tglx-devel:depthtracking 23/38] arch/x86/kernel/callthunks.c:368:7:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202207142034.ALIoUjYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git depthtracking
head:   81d2c1b17a61bfeca4b92a5d6e1fb6f5ff464826
commit: 02b09aaafc9a439ca50cc049e98f7cc945e5b294 [23/38] x86/callthunks: Add call patching for call depth tracking
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220714/202207142034.ALIoUjYZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=02b09aaafc9a439ca50cc049e98f7cc945e5b294
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel depthtracking
        git checkout 02b09aaafc9a439ca50cc049e98f7cc945e5b294
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/callthunks.c:368:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!vbuf)
                       ^~~~~
   arch/x86/kernel/callthunks.c:428:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   arch/x86/kernel/callthunks.c:368:3: note: remove the 'if' if its condition is always false
                   if (!vbuf)
                   ^~~~~~~~~~
   arch/x86/kernel/callthunks.c:332:9: note: initialize the variable 'ret' to silence this warning
           int ret, text_size, size;
                  ^
                   = 0
   1 warning generated.


vim +368 arch/x86/kernel/callthunks.c

   324	
   325	static __init_or_module int callthunks_setup(struct callthunk_sites *cs,
   326						     struct module_layout *layout)
   327	{
   328		u8 *tp, *thunk, *buffer, *vbuf = NULL;
   329		struct paravirt_patch_site *pv;
   330		unsigned int nthunks, bitpos;
   331		struct thunk_mem_area *area;
   332		int ret, text_size, size;
   333		s32 *s;
   334	
   335		lockdep_assert_held(&text_mutex);
   336	
   337		prdbg("Setup %s\n", layout_getname(layout));
   338		/* Calculate the number of thunks required */
   339		nthunks = cs->syms_end - cs->syms_start;
   340		nthunks += cs->pv_end - cs->pv_start;
   341	
   342		/*
   343		 * thunk_size can be 0 when there are no intra module calls,
   344		 * but there might be still sites to patch.
   345		 */
   346		if (!nthunks)
   347			goto patch;
   348	
   349		area = callthunks_alloc(nthunks);
   350		if (!area)
   351			return -ENOMEM;
   352	
   353		bitpos = area->start;
   354		thunk = area->tmem->base + bitpos * callthunk_desc.thunk_size;
   355		tp = thunk;
   356	
   357		prdbg("Thunk %px\n", tp);
   358		/*
   359		 * If the memory area is already RX, use a temporary
   360		 * buffer. Otherwise just copy into the unused area
   361		 */
   362		if (!area->tmem->is_rx) {
   363			prdbg("Using thunk direct\n");
   364			buffer = thunk;
   365		} else {
   366			size = nthunks * callthunk_desc.thunk_size;
   367			vbuf = vmalloc(size);
 > 368			if (!vbuf)
   369				goto fail;
   370			memset(vbuf, INT3_INSN_OPCODE, size);
   371			buffer = vbuf;
   372			prdbg("Using thunk vbuf %px\n", vbuf);
   373		}
   374	
   375		for (s = cs->syms_start; s < cs->syms_end; s++, bitpos++) {
   376			void *dest = (void *)s + *s;
   377	
   378			ret = callthunk_setup_one(dest, tp, buffer, layout);
   379			if (ret)
   380				goto fail;
   381			buffer += callthunk_desc.thunk_size;
   382			tp += callthunk_desc.thunk_size;
   383			bitmap_set(area->tmem->map, bitpos, 1);
   384			area->nthunks++;
   385		}
   386	
   387		for (pv = cs->pv_start; pv < cs->pv_end; pv++, bitpos++) {
   388			ret = callthunk_setup_one(pv->instr, tp, buffer, layout);
   389			if (ret)
   390				goto fail;
   391			buffer += callthunk_desc.thunk_size;
   392			tp += callthunk_desc.thunk_size;
   393			bitmap_set(area->tmem->map, bitpos, 1);
   394			area->nthunks++;
   395		}
   396	
   397		text_size = tp - thunk;
   398		prdbg("Thunk %px .. %px 0x%x\n", thunk, tp, text_size);
   399	
   400		/*
   401		 * If thunk memory is already RX, poke the buffer into it.
   402		 * Otherwise make the memory RX.
   403		 */
   404		if (vbuf)
   405			text_poke_copy_locked(thunk, vbuf, text_size);
   406		else
   407			callthunk_area_set_rx(area);
   408		sync_core();
   409	
   410		layout->base = thunk;
   411		layout->size = text_size;
   412		layout->text_size = text_size;
   413		layout->arch_data = area;
   414	
   415		vfree(vbuf);
   416	
   417	patch:
   418		prdbg("Patching call sites %s\n", layout_getname(layout));
   419		patch_call_sites(cs->call_start, cs->call_end, layout);
   420		patch_paravirt_call_sites(cs->pv_start, cs->pv_end, layout);
   421		prdbg("Patching call sites done%s\n", layout_getname(layout));
   422		return 0;
   423	
   424	fail:
   425		WARN_ON_ONCE(ret);
   426		callthunk_free(area, false);
   427		vfree(vbuf);
   428		return ret;
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
