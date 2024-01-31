Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D63F8ED;
	Wed, 31 Jan 2024 20:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706731936; cv=none; b=j44oclO4MyQl0ipUPWTiaF4jdRQeIttpiMaRLe+RlqefcG12O3lOyo7sOKbkS+TUqd11Gzj58vY1CNUw1ruelu00qoQvgbBQTxXBcHxIc6e1021hQ+r5gF6hoHI5/Y4onbWv6xT6DWEM2aaE1/unchp2XNAk0j6w1OM8Hl9zJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706731936; c=relaxed/simple;
	bh=bN4LkZcF1y2okwhB3POx5zZ2IlT9co7VD74r3Icbq40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqKQS49mWhQGvtuteSrKVpISxXhFDPbZG+FJ4oSOkrb/qDLJq9McDaeQjzlI/5gZvhZ5HV3rxeVD6TN3u7z5gPfAD1dLYNN+n3n+VnM3ahfeWfYUR+lvdiLfM8ISU4x1EVJ7xEdqIE0Nb64g1y44tWViYv2RC4CVgsalp7a0aFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1xmwKK/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1xmwKK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706731934; x=1738267934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bN4LkZcF1y2okwhB3POx5zZ2IlT9co7VD74r3Icbq40=;
  b=b1xmwKK/jVS0t+W2dBnwflMsz9jRg+gbS/dJ/g+VTm04zrUodwacLl+X
   bk3+XVuwwd1CrC9dqHkVGXGs4VPkAME7VGyc2lZ8CsZabE6X/7T9Aq+Q/
   erHjSP6cqyPUuzKgpt6QJBNbTvnx6Hx/ckYOPr9J636YC8jpRrqasGmww
   tjdpqrOkh/7ty2MELkgsuVG4MoImONoXGL1+7Dg3kDSlMZd4Fg12Blo8o
   pjXdJB+mn+lZ8aEVPEKyLEjh8mWfxrDoCET7f0Z+amIakt5AzFynC9R2J
   f8VBdFGvIgB+Y4AV6el1bxeL2t7JQBVtYKYdxuXfjlouC6yljkqHFvXpM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11082231"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="11082231"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 12:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931965592"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="931965592"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2024 12:12:11 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVGwI-0001yM-2U;
	Wed, 31 Jan 2024 20:12:07 +0000
Date: Thu, 1 Feb 2024 04:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Justin Stitt <justinstitt@google.com>
Subject: [kees:devel/hardening/v6.8/2-arg-strscpy 1/2]
 include/linux/suspend.h:81:2: error: call to undeclared function
 'COUNT_ARGS'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202402010432.vVJfVbUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/hardening/v6.8/2-arg-strscpy
head:   52fcd0404512a41ebc6f406977ac04ffd86349fc
commit: 8f94a332197dea2f8461b136697955624250671b [1/2] string: Allow 2-argument strscpy()
config: arm-mmp2_defconfig (https://download.01.org/0day-ci/archive/20240201/202402010432.vVJfVbUz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010432.vVJfVbUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010432.vVJfVbUz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/do_mounts.c:7:
>> include/linux/suspend.h:81:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(suspend_stats.failed_devs[suspend_stats.last_failed_dev],
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   In file included from init/do_mounts.c:7:
>> include/linux/suspend.h:81:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   In file included from init/do_mounts.c:7:
   include/linux/suspend.h:81:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
>> init/do_mounts.c:65:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(saved_root_name, line, sizeof(saved_root_name));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> init/do_mounts.c:65:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   init/do_mounts.c:65:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   init/do_mounts.c:137:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(p, root_fs_names, size);
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   init/do_mounts.c:137:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   init/do_mounts.c:137:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   9 errors generated.
--
>> init/version.c:26:11: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           arglen = strscpy(init_uts_ns.name.nodename, arg, bufsize);
                    ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> init/version.c:26:11: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   init/version.c:26:11: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
   In file included from kernel/sys.c:30:
>> include/linux/suspend.h:81:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(suspend_stats.failed_devs[suspend_stats.last_failed_dev],
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   In file included from kernel/sys.c:30:
>> include/linux/suspend.h:81:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   In file included from kernel/sys.c:30:
   include/linux/suspend.h:81:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
>> kernel/params.c:854:4: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           strscpy(modname, kp->name, name_len);
                           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> kernel/params.c:854:4: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   kernel/params.c:854:4: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
>> kernel/kallsyms.c:664:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(iter->module_name, "bpf", MODULE_NAME_LEN);
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> kernel/kallsyms.c:664:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   kernel/kallsyms.c:664:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   kernel/kallsyms.c:684:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(iter->module_name, "__builtin__kprobes", MODULE_NAME_LEN);
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   kernel/kallsyms.c:684:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   kernel/kallsyms.c:684:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   6 errors generated.
--
>> kernel/seccomp.c:2285:10: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           ret = strscpy(names, sep, size);
                                 ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> kernel/seccomp.c:2285:10: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   kernel/seccomp.c:2285:10: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   kernel/seccomp.c:2294:9: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   ret = strscpy(names, cur->name, size);
                         ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   kernel/seccomp.c:2294:9: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   kernel/seccomp.c:2294:9: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   6 errors generated.
--
>> mm/dmapool.c:258:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(retval->name, name, sizeof(retval->name));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> mm/dmapool.c:258:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   mm/dmapool.c:258:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
>> fs/super.c:770:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(s->s_id, s->s_type->name, sizeof(s->s_id));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> fs/super.c:770:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   fs/super.c:770:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   fs/super.c:858:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(s->s_id, type->name, sizeof(s->s_id));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   fs/super.c:858:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   fs/super.c:858:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   6 errors generated.
--
>> fs/char_dev.c:153:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(cd->name, name, sizeof(cd->name));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> fs/char_dev.c:153:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   fs/char_dev.c:153:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
>> crypto/api.c:119:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(larval->alg.cra_name, name, CRYPTO_MAX_ALG_NAME);
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> crypto/api.c:119:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   crypto/api.c:119:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
>> crypto/aead.c:186:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(raead.type, "aead", sizeof(raead.type));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> crypto/aead.c:186:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   crypto/aead.c:186:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   crypto/aead.c:187:2: error: use of undeclared identifier '__strscpy'
           strscpy(raead.geniv, "<none>", sizeof(raead.geniv));
           ^
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   crypto/aead.c:227:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strscpy(raead.type, "aead", sizeof(raead.type));
           ^
   include/linux/string.h:105:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   crypto/aead.c:227:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:105:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   crypto/aead.c:227:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:105:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   7 errors generated.
..


vim +/COUNT_ARGS +81 include/linux/suspend.h

2a77c46de1e3da ShuoX Liu    2011-08-10  78  
2a77c46de1e3da ShuoX Liu    2011-08-10  79  static inline void dpm_save_failed_dev(const char *name)
2a77c46de1e3da ShuoX Liu    2011-08-10  80  {
bd8092def983f5 Wolfram Sang 2022-08-18 @81  	strscpy(suspend_stats.failed_devs[suspend_stats.last_failed_dev],
2a77c46de1e3da ShuoX Liu    2011-08-10  82  		name,
2a77c46de1e3da ShuoX Liu    2011-08-10  83  		sizeof(suspend_stats.failed_devs[0]));
2a77c46de1e3da ShuoX Liu    2011-08-10  84  	suspend_stats.last_failed_dev++;
2a77c46de1e3da ShuoX Liu    2011-08-10  85  	suspend_stats.last_failed_dev %= REC_FAILED_NUM;
2a77c46de1e3da ShuoX Liu    2011-08-10  86  }
2a77c46de1e3da ShuoX Liu    2011-08-10  87  

:::::: The code at line 81 was first introduced by commit
:::::: bd8092def983f567800f764a5d23b2dca98f078c PM: suspend: move from strlcpy() with unused retval to strscpy()

:::::: TO: Wolfram Sang <wsa+renesas@sang-engineering.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
