Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EE2853E0;
	Wed, 25 Mar 2026 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406270; cv=none; b=PaO3N5Z2zI+3QxFCw0kN0Mvyf9OTPrmD7t4IlpCdM0E817aOyVvDdhKXyhmVU1Jn6Ccj8d4DUhOE+u9acA5uhhMIxCcbTu/KOqu5zXq//FTXI+dsdR83PeRhUsQQf1W7RmHfGrJ9PuauTp5tubpQHQ5nfipuMvz/yE6YWxG5kqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406270; c=relaxed/simple;
	bh=Ee45DSi93KBXd3nuAzPsNotDwGG+yh9Y13Y77PGmTt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cSna3XcbkKX/0rFyWpnjGqeJOSUaYg1ZFA/hYwR0DPrXZylQjUD8fA3tQjZwGQteK7dykbIlgOokbJHoUSi8XPlHktvRfnz+W1Q3CThB54OPNOA6Eg7SU8Qy3kVmiYs/JsZvuRLUzkodb21wRXmS/9G6+AlUqS6OmFqHGoaf5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvBS4h8G; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvBS4h8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774406269; x=1805942269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ee45DSi93KBXd3nuAzPsNotDwGG+yh9Y13Y77PGmTt8=;
  b=GvBS4h8GJ/Z7cU2ZpXaBj7s9bYDF+uveEP0ly2f2WLEvdee9e/H6ds1O
   X3MSkIuCb2kw1Blk/jwSO+iwIlTFdztDq6mrhdzpd2QXRRgQxPzDJgrJN
   uTBsNH9xOkdYXsF1bb9m5LuR2aAfQfMDI84T3oxs9SOOVTqS92svoEHih
   NlIseVXbmovOeyp3I3l98h20pPaKEHINJWBTu0sXddTKG6ZOKa7uQGWdo
   rsfG4A8H8qT7pa47EQruLHRP24InfSm9ODP8cgGixXJAZcAW+yT3W73ZW
   8otJiVVGLragEDpcrc/Ocv3MiU0rli1/Znp4HVamyw2lV2NKi/Tyc48LS
   A==;
X-CSE-ConnectionGUID: cZTcyj4QSry6+aNqqX+V3Q==
X-CSE-MsgGUID: +ywzZQOWRt6cX23FjjhxYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93012429"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93012429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:37:46 -0700
X-CSE-ConnectionGUID: i6KklGeJSXKosTfIglUoKw==
X-CSE-MsgGUID: InJHzz6wTFez9cjKlGFq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223742259"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 19:37:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5E7o-000000005nB-0TvO;
	Wed, 25 Mar 2026 02:37:40 +0000
Date: Wed, 25 Mar 2026 10:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:bootconfig/for-next 16/16] init/main.c:437:20:
 warning: stack frame size (4192) exceeds limit (2048) in
 'bootconfig_apply_early_params'
Message-ID: <202603251010.5Ui0yrB2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace b=
ootconfig/for-next
head:   1a427f2a710583872b6176ea8378e0a1a8719fc4
commit: 1a427f2a710583872b6176ea8378e0a1a8719fc4 [16/16] bootconfig: Apply =
early options from embedded config
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/202=
60325/202603251010.5Ui0yrB2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603251010.5Ui0yrB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251010.5Ui0yrB2-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> init/main.c:437:20: warning: stack frame size (4192) exceeds limit (2048=
) in 'bootconfig_apply_early_params' [-Wframe-larger-than]
     437 | static void __init bootconfig_apply_early_params(void)
         |                    ^
   1 warning generated.


vim +/bootconfig_apply_early_params +437 init/main.c

   416=09
   417	/*
   418	 * do_early_param() is defined later in this file but called from
   419	 * bootconfig_apply_early_params() below, so we need a forward decla=
ration.
   420	 */
   421	static int __init do_early_param(char *param, char *val,
   422					 const char *unused, void *arg);
   423=09
   424	/*
   425	 * bootconfig_apply_early_params - dispatch kernel.* keys from the e=
mbedded
   426	 * bootconfig as early_param() calls.
   427	 *
   428	 * early_param() handlers must run before most of the kernel initial=
ises
   429	 * (e.g. before the GIC driver reads irqchip.gicv3_pseudo_nmi).  A b=
ootconfig
   430	 * attached to the initrd arrives too late for this because the init=
rd is not
   431	 * mapped yet when early params are processed.  The embedded bootcon=
fig lives
   432	 * in the kernel image itself (.init.data), so it is always reachabl=
e.
   433	 *
   434	 * This function is called from setup_boot_config() which runs in
   435	 * start_kernel() before parse_early_param(), making the timing corr=
ect.
   436	 */
 > 437	static void __init bootconfig_apply_early_params(void)
   438	{
   439		char val_buf[COMMAND_LINE_SIZE];
   440		struct xbc_node *knode, *root;
   441		const char *val;
   442=09
   443		root =3D xbc_find_node("kernel");
   444		if (!root)
   445			return;
   446=09
   447		/*
   448		 * Keys that do not match any early_param() handler are silently
   449		 * ignored =E2=80=94 do_early_param() always returns 0.
   450		 */
   451		xbc_node_for_each_key_value(root, knode, val) {
   452			if (xbc_node_compose_key_after(root, knode, xbc_namebuf, XBC_KEYLE=
N_MAX) < 0)
   453				continue;
   454=09
   455			if (!val) {
   456				do_early_param(xbc_namebuf, NULL, NULL, NULL);
   457				continue;
   458			}
   459=09
   460			/*
   461			 * We need to copy const char *val to a char pointer,
   462			 * which is what do_early_param() need, given it might
   463			 * call strsep(), strtok() later.
   464			 */
   465			strscpy(val_buf, val, sizeof(val_buf));
   466			do_early_param(xbc_namebuf, val_buf, NULL, NULL);
   467		}
   468	}
   469=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
