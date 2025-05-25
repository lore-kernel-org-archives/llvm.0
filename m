Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA54C6D;
	Sun, 25 May 2025 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748135817; cv=none; b=oytbK8fuZ58Tat5TwyRQpZPujA1D2MlVUfH1u6jnnOqDJtqOAEEYxGX2GWOIqu9shtodZu2cXKCuqZh7LgbswuIQXIoOmnSngpScjqNHLB5rcnXc7nNyncuD52zm/JCxtH0b0/CINTnILBCgIInM1+eRT72hcCuSjPhjvt+5PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748135817; c=relaxed/simple;
	bh=kLF44fNoY1Up8ATz6BFbOYUlwvZFgTBE27MImIwFWHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdxnWTtmRQwM6naoN3UshgWA3SCe5O7ZJpUXsehhg3z7fN98E640BSIzFv00BZQo2A6+jJtoQ04eJoJ23ZhPe5TimHCXa8Z2E95OPtMVD4jf5Y20FIbwIJNZgGSOo61/iCw7/GCgW4noCniy1FIGOaWetlYObFlRadtC7NIEWfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LadvMZeD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LadvMZeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748135815; x=1779671815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLF44fNoY1Up8ATz6BFbOYUlwvZFgTBE27MImIwFWHE=;
  b=LadvMZeDIoRIHOrJUKFeMESVVCU1X9XeMxmableGJ4WWeGw98wO/cmz8
   UK9v+QfmmVBrt/vITzklNKY5+1S19x5X0EYebVrkA1EEscqksK552VC+X
   JUID27JpmbAjNwymuzS7gqt7cCOxqkPs/2zFyvW+3LF3EmwnXQeE29Lkl
   sUJibIEfnqh0Bu/KmlEaI+lFIz2QpnncnxB/jPZ2WJTCZ3LI9eMkRMcDF
   wUoP0pvDEztZHJuKTqvvce/2j9X9WUwPaDav9eZdgYUjzwbU3n4rMQ881
   FkWmsArLuIOSOMwwa9++Vu7qXmqGJVrYEzczajCdTA8vTsI7HghLZMI4B
   Q==;
X-CSE-ConnectionGUID: WGWq3tu2S5ifqzg2NDSfBA==
X-CSE-MsgGUID: VQ8TsF+DT0+p7u+9hVrFSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="49851886"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="49851886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 18:16:55 -0700
X-CSE-ConnectionGUID: UtSDnrU/Tom1JHIfTpI4GQ==
X-CSE-MsgGUID: QT0xuTSwRdWJ+czEIyGgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="146745472"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2025 18:16:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIzyt-000RY8-02;
	Sun, 25 May 2025 01:16:51 +0000
Date: Sun, 25 May 2025 09:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 287/288]
 fs/bcachefs/error.c:498:5: error: cannot jump from this goto statement to
 its label
Message-ID: <202505250930.YdB8S34n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   8d1f7c458d82ff70eff7b2bcf24d93fb9babe73b
commit: 42e60caee7636d5aacc7d759ce69c8869371a7ac [287/288] bcachefs: Replace mutex_lock() with guards
config: arm-randconfig-001-20250525 (https://download.01.org/0day-ci/archive/20250525/202505250930.YdB8S34n-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250930.YdB8S34n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250930.YdB8S34n-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/bcachefs/error.c:498:5: error: cannot jump from this goto statement to its label
     498 |                                 goto err;
         |                                 ^
   fs/bcachefs/error.c:503:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     503 |         guard(mutex)(&c->fsck_error_msgs_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:50:1: note: expanded from here
      50 | __UNIQUE_ID_guard709
         | ^
   1 error generated.
--
>> fs/bcachefs/xattr.c:539:4: error: cannot jump from this goto statement to its label
     539 |                         goto err;
         |                         ^
   fs/bcachefs/xattr.c:565:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     565 |         guard(mutex)(&inode->ei_update_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:143:1: note: expanded from here
     143 | __UNIQUE_ID_guard727
         | ^
   fs/bcachefs/xattr.c:535:4: error: cannot jump from this goto statement to its label
     535 |                         goto err;
         |                         ^
   fs/bcachefs/xattr.c:565:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     565 |         guard(mutex)(&inode->ei_update_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:143:1: note: expanded from here
     143 | __UNIQUE_ID_guard727
         | ^
   2 errors generated.
--
>> fs/bcachefs/super.c:1120:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1120 |                 guard(mutex)(&c->sb_lock);
         |                 ^
   include/linux/cleanup.h:319:2: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:138:1: note: expanded from here
     138 | class_mutex_t
         | ^
   1 warning generated.
--
>> fs/bcachefs/buckets.c:1234:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1234 |         guard(mutex)(&c->sectors_available_lock);
         |         ^
   include/linux/cleanup.h:319:2: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:122:1: note: expanded from here
     122 | class_mutex_t
         | ^
   1 warning generated.


vim +498 fs/bcachefs/error.c

1ece53237e83ed Kent Overstreet 2025-03-26  485  
9c5d38bba03425 Kent Overstreet 2023-02-16  486  	va_start(args, fmt);
9c5d38bba03425 Kent Overstreet 2023-02-16  487  	prt_vprintf(out, fmt, args);
9c5d38bba03425 Kent Overstreet 2023-02-16  488  	va_end(args);
9c5d38bba03425 Kent Overstreet 2023-02-16  489  
19391b92947c75 Kent Overstreet 2024-03-28  490  	/* Custom fix/continue/recreate/etc.? */
19391b92947c75 Kent Overstreet 2024-03-28  491  	if (out->buf[out->pos - 1] == '?') {
19391b92947c75 Kent Overstreet 2024-03-28  492  		const char *p = strrchr(out->buf, ',');
19391b92947c75 Kent Overstreet 2024-03-28  493  		if (p) {
19391b92947c75 Kent Overstreet 2024-03-28  494  			out->pos = p - out->buf;
19391b92947c75 Kent Overstreet 2024-03-28  495  			action = kstrdup(p + 2, GFP_KERNEL);
19391b92947c75 Kent Overstreet 2024-03-28  496  			if (!action) {
19391b92947c75 Kent Overstreet 2024-03-28  497  				ret = -ENOMEM;
19391b92947c75 Kent Overstreet 2024-03-28 @498  				goto err;
19391b92947c75 Kent Overstreet 2024-03-28  499  			}
19391b92947c75 Kent Overstreet 2024-03-28  500  		}
19391b92947c75 Kent Overstreet 2024-03-28  501  	}
19391b92947c75 Kent Overstreet 2024-03-28  502  
42e60caee7636d Kent Overstreet 2025-05-24  503  	guard(mutex)(&c->fsck_error_msgs_lock);
7337f9f14e0e2d Kent Overstreet 2025-03-28  504  	bool repeat = false, print = true, suppress = false;
7337f9f14e0e2d Kent Overstreet 2025-03-28  505  	bool inconsistent = false, exiting = false;
7337f9f14e0e2d Kent Overstreet 2025-03-28  506  	struct fsck_err_state *s =
7337f9f14e0e2d Kent Overstreet 2025-03-28  507  		count_fsck_err_locked(c, err, buf.buf, &repeat, &print, &suppress);
7337f9f14e0e2d Kent Overstreet 2025-03-28  508  	if (repeat) {
9c5d38bba03425 Kent Overstreet 2023-02-16  509  		ret = s->ret;
42e60caee7636d Kent Overstreet 2025-05-24  510  		goto err;
9c5d38bba03425 Kent Overstreet 2023-02-16  511  	}
9c5d38bba03425 Kent Overstreet 2023-02-16  512  
052210c3fa1f8a Kent Overstreet 2024-11-28  513  	if ((flags & FSCK_AUTOFIX) &&
33dfafa90285c0 Kent Overstreet 2024-06-19  514  	    (c->opts.errors == BCH_ON_ERROR_continue ||
33dfafa90285c0 Kent Overstreet 2024-06-19  515  	     c->opts.errors == BCH_ON_ERROR_fix_safe)) {
33dfafa90285c0 Kent Overstreet 2024-06-19  516  		prt_str(out, ", ");
052210c3fa1f8a Kent Overstreet 2024-11-28  517  		if (flags & FSCK_CAN_FIX) {
33dfafa90285c0 Kent Overstreet 2024-06-19  518  			prt_actioning(out, action);
33dfafa90285c0 Kent Overstreet 2024-06-19  519  			ret = -BCH_ERR_fsck_fix;
052210c3fa1f8a Kent Overstreet 2024-11-28  520  		} else {
052210c3fa1f8a Kent Overstreet 2024-11-28  521  			prt_str(out, ", continuing");
052210c3fa1f8a Kent Overstreet 2024-11-28  522  			ret = -BCH_ERR_fsck_ignore;
052210c3fa1f8a Kent Overstreet 2024-11-28  523  		}
052210c3fa1f8a Kent Overstreet 2024-11-28  524  
052210c3fa1f8a Kent Overstreet 2024-11-28  525  		goto print;
367cad09664aaf Kent Overstreet 2025-05-10  526  	} else if (!test_bit(BCH_FS_in_fsck, &c->flags)) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  527  		if (c->opts.errors != BCH_ON_ERROR_continue ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  528  		    !(flags & (FSCK_CAN_FIX|FSCK_CAN_IGNORE))) {
e5a3b8cf3330a7 Kent Overstreet 2025-04-28  529  			prt_str_indented(out, ", shutting down\n"
e5a3b8cf3330a7 Kent Overstreet 2025-04-28  530  					 "error not marked as autofix and not in fsck\n"
e5a3b8cf3330a7 Kent Overstreet 2025-04-28  531  					 "run fsck, and forward to devs so error can be marked for self-healing");
22f51621335837 Kent Overstreet 2022-10-09  532  			inconsistent = true;
b00750c2e5f09b Kent Overstreet 2025-03-28  533  			print = true;
dbb9936b0dc905 Kent Overstreet 2022-09-25  534  			ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  535  		} else if (flags & FSCK_CAN_FIX) {
19391b92947c75 Kent Overstreet 2024-03-28  536  			prt_str(out, ", ");
19391b92947c75 Kent Overstreet 2024-03-28  537  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  538  			ret = -BCH_ERR_fsck_fix;
dbb9936b0dc905 Kent Overstreet 2022-09-25  539  		} else {
dbb9936b0dc905 Kent Overstreet 2022-09-25  540  			prt_str(out, ", continuing");
dbb9936b0dc905 Kent Overstreet 2022-09-25  541  			ret = -BCH_ERR_fsck_ignore;
dbb9936b0dc905 Kent Overstreet 2022-09-25  542  		}
a0f8faea5f47d6 Kent Overstreet 2023-07-11  543  	} else if (c->opts.fix_errors == FSCK_FIX_exit) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  544  		prt_str(out, ", exiting");
dbb9936b0dc905 Kent Overstreet 2022-09-25  545  		ret = -BCH_ERR_fsck_errors_not_fixed;
0bc166ff564f9e Kent Overstreet 2019-03-28  546  	} else if (flags & FSCK_CAN_FIX) {
853b7393c20d5e Kent Overstreet 2023-04-15  547  		int fix = s && s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  548  			? s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  549  			: c->opts.fix_errors;
853b7393c20d5e Kent Overstreet 2023-04-15  550  
a0f8faea5f47d6 Kent Overstreet 2023-07-11  551  		if (fix == FSCK_FIX_ask) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  552  			print = false;
853b7393c20d5e Kent Overstreet 2023-04-15  553  
8b105909182fed Kent Overstreet 2024-11-28  554  			ret = do_fsck_ask_yn(c, trans, out, action);
8b105909182fed Kent Overstreet 2024-11-28  555  			if (ret < 0)
42e60caee7636d Kent Overstreet 2025-05-24  556  				goto err;
853b7393c20d5e Kent Overstreet 2023-04-15  557  
8b105909182fed Kent Overstreet 2024-11-28  558  			if (ret >= YN_ALLNO && s)
8b105909182fed Kent Overstreet 2024-11-28  559  				s->fix = ret == YN_ALLNO
a0f8faea5f47d6 Kent Overstreet 2023-07-11  560  					? FSCK_FIX_no
a0f8faea5f47d6 Kent Overstreet 2023-07-11  561  					: FSCK_FIX_yes;
853b7393c20d5e Kent Overstreet 2023-04-15  562  
8b105909182fed Kent Overstreet 2024-11-28  563  			ret = ret & 1
dbb9936b0dc905 Kent Overstreet 2022-09-25  564  				? -BCH_ERR_fsck_fix
dbb9936b0dc905 Kent Overstreet 2022-09-25  565  				: -BCH_ERR_fsck_ignore;
a0f8faea5f47d6 Kent Overstreet 2023-07-11  566  		} else if (fix == FSCK_FIX_yes ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  567  			   (c->opts.nochanges &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  568  			    !(flags & FSCK_CAN_IGNORE))) {
19391b92947c75 Kent Overstreet 2024-03-28  569  			prt_str(out, ", ");
19391b92947c75 Kent Overstreet 2024-03-28  570  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  571  			ret = -BCH_ERR_fsck_fix;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  572  		} else {
19391b92947c75 Kent Overstreet 2024-03-28  573  			prt_str(out, ", not ");
19391b92947c75 Kent Overstreet 2024-03-28  574  			prt_actioning(out, action);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  575  		}
eb73e7773fd665 Kent Overstreet 2024-10-28  576  	} else if (!(flags & FSCK_CAN_IGNORE)) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  577  		prt_str(out, " (repair unimplemented)");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  578  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  579  
dbb9936b0dc905 Kent Overstreet 2022-09-25  580  	if (ret == -BCH_ERR_fsck_ignore &&
a0f8faea5f47d6 Kent Overstreet 2023-07-11  581  	    (c->opts.fix_errors == FSCK_FIX_exit ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  582  	     !(flags & FSCK_CAN_IGNORE)))
dbb9936b0dc905 Kent Overstreet 2022-09-25  583  		ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  584  
367cad09664aaf Kent Overstreet 2025-05-10  585  	if (test_bit(BCH_FS_in_fsck, &c->flags) &&
492e24d7604a1b Kent Overstreet 2024-10-01  586  	    (ret != -BCH_ERR_fsck_fix &&
052210c3fa1f8a Kent Overstreet 2024-11-28  587  	     ret != -BCH_ERR_fsck_ignore)) {
052210c3fa1f8a Kent Overstreet 2024-11-28  588  		exiting = true;
492e24d7604a1b Kent Overstreet 2024-10-01  589  		print = true;
052210c3fa1f8a Kent Overstreet 2024-11-28  590  	}
052210c3fa1f8a Kent Overstreet 2024-11-28  591  print:
1ece53237e83ed Kent Overstreet 2025-03-26  592  	prt_newline(out);
1ece53237e83ed Kent Overstreet 2025-03-26  593  
1ece53237e83ed Kent Overstreet 2025-03-26  594  	if (inconsistent)
b00750c2e5f09b Kent Overstreet 2025-03-28  595  		__bch2_inconsistent_error(c, out);
1ece53237e83ed Kent Overstreet 2025-03-26  596  	else if (exiting)
1ece53237e83ed Kent Overstreet 2025-03-26  597  		prt_printf(out, "Unable to continue, halting\n");
7337f9f14e0e2d Kent Overstreet 2025-03-28  598  	else if (suppress)
1ece53237e83ed Kent Overstreet 2025-03-26  599  		prt_printf(out, "Ratelimiting new instances of previous error\n");
1ece53237e83ed Kent Overstreet 2025-03-26  600  
96f37eabe7a5cb Kent Overstreet 2023-12-31  601  	if (print) {
b00750c2e5f09b Kent Overstreet 2025-03-28  602  		/* possibly strip an empty line, from printbuf_indent_add */
b00750c2e5f09b Kent Overstreet 2025-03-28  603  		while (out->pos && out->buf[out->pos - 1] == ' ')
b00750c2e5f09b Kent Overstreet 2025-03-28  604  			--out->pos;
b00750c2e5f09b Kent Overstreet 2025-03-28  605  		printbuf_nul_terminate(out);
b00750c2e5f09b Kent Overstreet 2025-03-28  606  
96f37eabe7a5cb Kent Overstreet 2023-12-31  607  		if (bch2_fs_stdio_redirect(c))
b00750c2e5f09b Kent Overstreet 2025-03-28  608  			bch2_print(c, "%s", out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  609  		else
ebf561b2083d79 Kent Overstreet 2025-04-15  610  			bch2_print_str(c, KERN_ERR, out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  611  	}
dbb9936b0dc905 Kent Overstreet 2022-09-25  612  
9c5d38bba03425 Kent Overstreet 2023-02-16  613  	if (s)
9c5d38bba03425 Kent Overstreet 2023-02-16  614  		s->ret = ret;
9c5d38bba03425 Kent Overstreet 2023-02-16  615  
eb73e7773fd665 Kent Overstreet 2024-10-28  616  	/*
eb73e7773fd665 Kent Overstreet 2024-10-28  617  	 * We don't yet track whether the filesystem currently has errors, for
eb73e7773fd665 Kent Overstreet 2024-10-28  618  	 * log_fsck_err()s: that would require us to track for every error type
eb73e7773fd665 Kent Overstreet 2024-10-28  619  	 * which recovery pass corrects it, to get the fsck exit status correct:
eb73e7773fd665 Kent Overstreet 2024-10-28  620  	 */
eb73e7773fd665 Kent Overstreet 2024-10-28  621  	if (flags & FSCK_CAN_FIX) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  622  		if (ret == -BCH_ERR_fsck_fix) {
3c471b65889aa2 Kent Overstreet 2023-11-26  623  			set_bit(BCH_FS_errors_fixed, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  624  		} else {
3c471b65889aa2 Kent Overstreet 2023-11-26  625  			set_bit(BCH_FS_errors_not_fixed, &c->flags);
3c471b65889aa2 Kent Overstreet 2023-11-26  626  			set_bit(BCH_FS_error, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  627  		}
eb73e7773fd665 Kent Overstreet 2024-10-28  628  	}
19391b92947c75 Kent Overstreet 2024-03-28  629  err:
19391b92947c75 Kent Overstreet 2024-03-28  630  	if (action != action_orig)
19391b92947c75 Kent Overstreet 2024-03-28  631  		kfree(action);
19391b92947c75 Kent Overstreet 2024-03-28  632  	printbuf_exit(&buf);
dbb9936b0dc905 Kent Overstreet 2022-09-25  633  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  634  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  635  

:::::: The code at line 498 was first introduced by commit
:::::: 19391b92947c75267cdacb1acefe8ad0d278a9dd bcachefs: allow for custom action in fsck error messages

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
