Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372322C6B1;
	Sun, 28 Jan 2024 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706462679; cv=none; b=ue6ACafxWjn0GqOhz4h7IRUm6T36iUxesSpqXDz4Dqtnk27goyNhgyya1l9+J/MeD1O4LRj17h9eds4SXMcFF8H7rSI7yKAOp+EqG5eeilAGSDw1ZT+CKz+lfzoaY1lLMSMasNsEBK5/UXchyj6BHxnaLFgF0CP208oaoB1rLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706462679; c=relaxed/simple;
	bh=E0d9uPJNzUPJ/geLJdGA8rqI3AL62tv6sCanoBAs08g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVuNHJmpWEV1kaAfJe4fOghTBgxiUnqhPyeO28QeucBSD6e2ueWE4GzgtCPNrfmeXwvim7l0J4eFL6WB3vSY+r4S8IYgEosXn9iOKuzHTHVomVnsRsdR0vdJNlLY9J6XIB5mQBcWT4NCIPCiaMBUW3xfDPNyzrwJO2YdSNiJwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq6sMAdT; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq6sMAdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706462677; x=1737998677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0d9uPJNzUPJ/geLJdGA8rqI3AL62tv6sCanoBAs08g=;
  b=Xq6sMAdTapgh0pdO6v9jzr8at8QFcc8xPxP9VSLMest+hd2N29jER0GP
   kRC4QJZKkyAy8V7dlqjZH+3JDvDx5PXKSliAaniPpLBuOo8anV5yXikdS
   mahlXmhCGFOQ9rHO15QyN/LSKP/vo+/Zh3RQoxuwIehufRIA1G98xH25o
   9s9yhW/CNOMAMvhVPUbe5ypQVvhyuRnVRTwZFVJxzljThmYp/w0xCOo0Q
   yx+3zWYNGS4iOjcS2qZnWOq/r6DLnTo2RDpVK38bU5G70BC+qfwtDzqJy
   BcfuE0fHkBnKeZYl444W5BYFNz16id/pByx7mz0BYMfyZpHrl9udnMbOM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="406515489"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="406515489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35917036"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2024 09:24:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU8tU-0003bW-2g;
	Sun, 28 Jan 2024 17:24:32 +0000
Date: Mon, 29 Jan 2024 01:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/enable-unsigned-sanitizer 30/100]
 drivers/media/dvb-frontends/tda10086.c:338:25: error: called object type
 'unsigned long long' is not a function or function pointer
Message-ID: <202401290102.2xIeoUU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/enable-unsigned-sanitizer
head:   a7e79409b1cc59a7f181e2b04e0cb4835b620b81
commit: b414edfafc072130d9b37c3587fce0182a7c4388 [30/100] [WIP] treewide: negative unsigned constant -1ULL: use U64_MAX
config: i386-buildonly-randconfig-006-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290102.2xIeoUU8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290102.2xIeoUU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290102.2xIeoUU8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/dvb-frontends/tda10086.c:338:25: error: called object type 'unsigned long long' is not a function or function pointer
     338 |         big += ((SACLK/1000ULL)U64_MAX);
         |                 ~~~~~~~~~~~~~~~^
   include/linux/limits.h:25:18: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                         ^
   1 error generated.


vim +338 drivers/media/dvb-frontends/tda10086.c

   282	
   283	static int tda10086_set_symbol_rate(struct tda10086_state *state,
   284					    struct dtv_frontend_properties *fe_params)
   285	{
   286		u8 dfn = 0;
   287		u8 afs = 0;
   288		u8 byp = 0;
   289		u8 reg37 = 0x43;
   290		u8 reg42 = 0x43;
   291		u64 big;
   292		u32 tmp;
   293		u32 bdr;
   294		u32 bdri;
   295		u32 symbol_rate = fe_params->symbol_rate;
   296	
   297		dprintk ("%s %i\n", __func__, symbol_rate);
   298	
   299		/* setup the decimation and anti-aliasing filters.. */
   300		if (symbol_rate < SACLK / 10000 * 137) {
   301			dfn=4;
   302			afs=1;
   303		} else if (symbol_rate < SACLK / 10000 * 208) {
   304			dfn=4;
   305			afs=0;
   306		} else if (symbol_rate < SACLK / 10000 * 270) {
   307			dfn=3;
   308			afs=1;
   309		} else if (symbol_rate < SACLK / 10000 * 416) {
   310			dfn=3;
   311			afs=0;
   312		} else if (symbol_rate < SACLK / 10000 * 550) {
   313			dfn=2;
   314			afs=1;
   315		} else if (symbol_rate < SACLK / 10000 * 833) {
   316			dfn=2;
   317			afs=0;
   318		} else if (symbol_rate < SACLK / 10000 * 1100) {
   319			dfn=1;
   320			afs=1;
   321		} else if (symbol_rate < SACLK / 10000 * 1666) {
   322			dfn=1;
   323			afs=0;
   324		} else if (symbol_rate < SACLK / 10000 * 2200) {
   325			dfn=0;
   326			afs=1;
   327		} else if (symbol_rate < SACLK / 10000 * 3333) {
   328			dfn=0;
   329			afs=0;
   330		} else {
   331			reg37 = 0x63;
   332			reg42 = 0x4f;
   333			byp=1;
   334		}
   335	
   336		/* calculate BDR */
   337		big = (1ULL<<21) * ((u64) symbol_rate/1000ULL) * (1ULL<<dfn);
 > 338		big += ((SACLK/1000ULL)U64_MAX);
   339		do_div(big, (SACLK/1000ULL));
   340		bdr = big & 0xfffff;
   341	
   342		/* calculate BDRI */
   343		tmp = (1<<dfn)*(symbol_rate/1000);
   344		bdri = ((32 * (SACLK/1000)) + (tmp-1)) / tmp;
   345	
   346		tda10086_write_byte(state, 0x21, (afs << 7) | dfn);
   347		tda10086_write_mask(state, 0x20, 0x08, byp << 3);
   348		tda10086_write_byte(state, 0x06, bdr);
   349		tda10086_write_byte(state, 0x07, bdr >> 8);
   350		tda10086_write_byte(state, 0x08, bdr >> 16);
   351		tda10086_write_byte(state, 0x09, bdri);
   352		tda10086_write_byte(state, 0x37, reg37);
   353		tda10086_write_byte(state, 0x42, reg42);
   354	
   355		return 0;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
