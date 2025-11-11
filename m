Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC0824BD;
	Tue, 11 Nov 2025 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762885211; cv=none; b=Y2zjyl/1x4RoZMdJb7XDJ2FF9a5YJRh2p8KXG19zjgxeTg54iqmAqI/PTbcSsvtp/3cNfjFBrlJkUOW78VdaA+ULjukqKPUZrTSluTuQEYIrVj9YfUes4HMsJsQU3A0nR3wxiWWPa6sFesvqzUb5/CNnj29FikXDPudpbA8PUUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762885211; c=relaxed/simple;
	bh=L9y6l1JcRYytTYbCKWR9O8mq3E3LjZ2Y2tvMD19pTqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MbKCmJ/6FGY1nhWaZo081Tv4K2FEu2unCiGIfc/45D79RM+4JWpHCjEZxgqQPHaFg/h6b0e3+dy9Nv8EN8oPFP6s8rJtOwTW/0V+EPHRzNavkk5q8vpqN/r2IpAZHjb+we8SQC6JWUAsAiE2S9eJAGXiOR3CEDn1PnTh4tx8di4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GV52TY6j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GV52TY6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762885208; x=1794421208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9y6l1JcRYytTYbCKWR9O8mq3E3LjZ2Y2tvMD19pTqo=;
  b=GV52TY6jQm6cXCvbDM8xVh4zIyZpy9UvMxYK6RDRleR9kfidPvFYX8js
   mrRsxJGqcbdRDYObVgU84CSIX3UH4v+MWomD/cbXR5Hk9hSd8GpCacF6z
   az8Qh8pOlzUWUUtcd7KfgWanH3mE+rx4CDEElOV4COzBWmjNtUUER/K/a
   GYhbpok8XvqdME3iaD+dPt6q5jpqBf2vVGWGRWLmxd02Vk6ApklcLoNu9
   psZvBHJPeRXmY0qcLCJeIEn8NvAYOop7qyTjHdrVBZPgH83dZjin3pFqy
   G5mzaDKoxHNRtRoNwBVx07icJaiI89RABbLERLHRLQIbRMxzNe66/O0l3
   A==;
X-CSE-ConnectionGUID: k+rvqdB9TGWmVfHpCCIMQQ==
X-CSE-MsgGUID: ZYo7k3ZJT4qaqwPfdhv40A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64655390"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="64655390"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 10:20:08 -0800
X-CSE-ConnectionGUID: 6v7OhOXeQvGxYh2pdXXIsQ==
X-CSE-MsgGUID: kleDu1luSTud/hLpp0gURw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188286071"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2025 10:20:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIsyK-0003TP-1g;
	Tue, 11 Nov 2025 18:20:04 +0000
Date: Wed, 12 Nov 2025 02:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7210/7661] kernel/liveupdate/luo_file.c:571:3:
 error: call to undeclared function 'get_file'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511120222.vMZm9rD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2666975a8905776d306bee01c5d98a0395bda1c9
commit: 74602408d6248999ca8a567c46ce0f78204d6e89 [7210/7661] liveupdate: luo_file: implement file systems callbacks
config: x86_64-buildonly-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120222.vMZm9rD4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120222.vMZm9rD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120222.vMZm9rD4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/liveupdate/luo_file.c:571:3: error: call to undeclared function 'get_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     571 |                 get_file(luo_file->file);
         |                 ^
   kernel/liveupdate/luo_file.c:584:3: error: call to undeclared function 'get_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     584 |                 get_file(luo_file->file);
         |                 ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/get_file +571 kernel/liveupdate/luo_file.c

   519	
   520	/**
   521	 * luo_retrieve_file - Restores a preserved file from a session by its token.
   522	 * @session: The session from which to retrieve the file.
   523	 * @token:   The unique token identifying the file to be restored.
   524	 * @filep:   Output parameter; on success, this is populated with a pointer
   525	 *           to the newly retrieved 'struct file'.
   526	 *
   527	 * This function is the primary mechanism for recreating a file in the new
   528	 * kernel after a live update. It searches the session's list of deserialized
   529	 * files for an entry matching the provided @token.
   530	 *
   531	 * The operation is idempotent: if a file has already been successfully
   532	 * retrieved, this function will simply return a pointer to the existing
   533	 * 'struct file' and report success without re-executing the retrieve
   534	 * operation. This is handled by checking the 'retrieved' flag under a lock.
   535	 *
   536	 * File retrieval can happen in any order; it is not bound by the order of
   537	 * preservation.
   538	 *
   539	 * Context: Can be called from an ioctl or other in-kernel code in the new
   540	 *          kernel.
   541	 * Return: 0 on success. Returns a negative errno on failure:
   542	 *         -ENOENT if no file with the matching token is found.
   543	 *         Any error code returned by the handler's .retrieve() op.
   544	 */
   545	int luo_retrieve_file(struct luo_session *session, u64 token,
   546			      struct file **filep)
   547	{
   548		struct liveupdate_file_op_args args = {0};
   549		struct luo_file *luo_file;
   550		int err;
   551	
   552		lockdep_assert_held(&session->mutex);
   553	
   554		if (list_empty(&session->files_list))
   555			return -ENOENT;
   556	
   557		list_for_each_entry(luo_file, &session->files_list, list) {
   558			if (luo_file->token == token)
   559				break;
   560		}
   561	
   562		if (luo_file->token != token)
   563			return -ENOENT;
   564	
   565		guard(mutex)(&luo_file->mutex);
   566		if (luo_file->retrieved) {
   567			/*
   568			 * Someone is asking for this file again, so get a reference
   569			 * for them.
   570			 */
 > 571			get_file(luo_file->file);
   572			*filep = luo_file->file;
   573			return 0;
   574		}
   575	
   576		args.handler = luo_file->fh;
   577		args.session = (struct liveupdate_session *)session;
   578		args.serialized_data = luo_file->serialized_data;
   579		err = luo_file->fh->ops->retrieve(&args);
   580		if (!err) {
   581			luo_file->file = args.file;
   582	
   583			/* Get reference so we can keep this file in LUO until finish */
   584			get_file(luo_file->file);
   585			*filep = luo_file->file;
   586			luo_file->retrieved = true;
   587		}
   588	
   589		return err;
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
