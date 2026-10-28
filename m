Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227031;
	b=pJ4g54T8Lohfo91mqDtEVbPcuHDf/uTEv8FWP43taKu7qPNNOEOujffSs6+1cWkOYBzg
	 QQl9rPU3/Lx+Bb1/cfuu3QVZrlbkBGoCD5ifj6z0MxAeveELq1JBnKlLLwWEI/pKXwrsx
	 tcBZs0gwHSDPpg2SrvYDQmDKaRP0QEmoNJB80Vr8lYysIt07y7y00TKgQlV1ioeW6IJPo
	 kfP+2uCAg7b+t1F+t1IiNgSBVARdFxR5Q4PMjKeDXFORxqP5Vwx0+9SGuFD87yIEvFPma
	 8esbvGyAbCXcZtNPlydsfVvLdNB/nXOhGv3ZadLLNE3bEn12+s7AY/GNLlMeFZe74sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227031;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=jm0bOBlvJtf+c9cbCm5uoFNtSxOKCVNvIERBo9B/4SQ=;
	b=ZSc4loSEM2koPNTc6J//cDo0hrYTTl77tJxhuKlAu02ay3s477YHH+gSUS+F++AAmK9w
	 L0AHKlLTTwaOad8yeyQQGIN+mieXq/ycta4o4yhdJ/52te9L5kAUVy1aNejdsXXqaUS23
	 00UT2Ct7m9ZwYgN99qdhdq/QwOwubM4VtlrXmzTmp+gl/ll6/XTbcnfWGvtEEMX6t2VHD
	 H4erdMvAaPRuP/UYj4oomHZzkQQoCiWdCD4Vy/mf+/K308L06AZX50DJ2C2QORGYLwC7b
	 9V/eepqWXBneWWEfDaznKBTqIjDE7IIkYvx/JYV0iK4vikx7VaudITPzPEyHBttoXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h3220zwt;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA94606A31A;
	Wed, 28 Oct 2026 22:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA94606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h3220zwt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793227029; x=1824763029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAFL3xR5HoY7fL7rQF+os/jWINYhG5Z304bdPN+0Buc=;
  b=h3220zwtjOIQA0IN+JYPDQFK0CI5cdTwzSLRKXIH/287wxWj8JOvPxCu
   258O/yAr9CojmZuw78hV92kD5c6UCwkd96JxVtyj5tU1+SxXgs7evkWIs
   1Tubxk3d+tOAPgale+CPe2mA1uf+i+wrfJw1xmeaTsq7FmDbKzRnCH3Jg
   113MG6f/3nw4/0sBLsrqvviV9sfDwhFkAAoP6bercklmO/yEr4lq2CJBH
   r+12lp+e6xlRa4uKbPVWoUHRLtVzdaFGA4DbFBTMTapank+xzTmlXtpOR
   IzVlGzY2OnKzWRkCt551sGpsvT7eLWFKWP84b3Ny7mnzOznQN287pXG4V
   g==;
X-CSE-ConnectionGUID: F3gbwWsoSXC4KNVDVK248A==
X-CSE-MsgGUID: jwky0FRETpSWckJYVY87ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1861449"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1861449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 15:37:08 -0700
X-CSE-ConnectionGUID: P+RacY5GQGOrqg1ZCWl6Bw==
X-CSE-MsgGUID: xFdtIE9aQA2az64fdblalA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5360428"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2026 15:37:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMCGX-000000004zQ-0nLh;
	Wed, 28 Oct 2026 22:37:05 +0000
Date: Wed, 28 Oct 2026 23:36:41 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 35/41]
 kernel/time/timer_list.c:117:57: error: no member named 'disabled_bases' in
 'struct hrtimer_cpu_base'
Message-ID: <202610282341.X4ssVNgi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   b07585bb535605fb7baff6811b5b778c83af0805
commit: e135d1b5014d752a74322230ad9e2708ea093ebf [35/41] timer_list: Add auxiliary clock support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261028/202610282341.X4ssVNgi-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282341.X4ssVNgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282341.X4ssVNgi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer_list.c:117:57: error: no member named 'disabled_bases' in 'struct hrtimer_cpu_base'
     117 |                 bool enabled = ((1U << base->index) & base->cpu_base->disabled_bases);
         |                                                       ~~~~~~~~~~~~~~  ^
   1 error generated.


vim +117 kernel/time/timer_list.c

   107	
   108	static void
   109	print_base(struct seq_file *m, struct hrtimer_clock_base *base, ktime_t now)
   110	{
   111		SEQ_printf(m, "  .base:       %p\n", base);
   112		SEQ_printf(m, "  .index:      %d\n", base->index);
   113	
   114		SEQ_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
   115	#ifdef CONFIG_HIGH_RES_TIMERS
   116		if (clockid_is_aux_clock(base->clockid)) {
 > 117			bool enabled = ((1U << base->index) & base->cpu_base->disabled_bases);
   118			const struct tk_aux_mono_conv *conv = base->aux_mono_conv;
   119	
   120			SEQ_printf(m, ".enabled:      %d\n", enabled);
   121			if (enabled) {
   122				SEQ_printf(m, "  .mono_base:  %lld nsecs\n", (long long)conv->mono_base);
   123				SEQ_printf(m, "  .aux_base:   %lld nsecs\n", (long long)conv->aux_base);
   124				SEQ_printf(m, "  .mono_mult:  %u\n", conv->mono_mult);
   125				SEQ_printf(m, "  .aux_mult:   %u\n", conv->aux_mult);
   126			}
   127		} else {
   128			SEQ_printf(m, "  .offset:     %lld nsecs\n", (long long)*base->offset);
   129		}
   130	#endif
   131		SEQ_printf(m,   "active timers:\n");
   132		print_active_timers(m, base, base_now(base, now));
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
