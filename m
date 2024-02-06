Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC41367;
	Tue,  6 Feb 2024 01:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707182394; cv=none; b=Awa7invsq/uVn5wX3UzC8O3mJh2uEYKsGieBdykmU0PGupwlBVHyuG+M40KEZgrJdKqv0NMGKUJX70nEUmuqIZdoAlvLJWzfZejsEIZrk3QimFEjGpRmXr11BMAA+6sk8S7v1cfn+meYoHoW+FLRCaZKmjnefN9dYafDJb+JuVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707182394; c=relaxed/simple;
	bh=sIg62DTJVASmhKoIlJz2JGWAqXSfrfvoEQG5rM28HCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEBW2A9mhAMJS7PL7yqBgAYiStOFgHOcg4JJg4IH4/qgh7LqGISw6NeihdM1y3SgCd5YA2vHWnJvtZBB7YX9zsYZu1zWcaL2/IT7ArK4X9dTPl93HiA44XzGdi6f37UmVAzAxiFv9fn/QCVS8pd1Yc53e63wdTeR0sKvEDY/CTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwAAKior; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwAAKior"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707182392; x=1738718392;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sIg62DTJVASmhKoIlJz2JGWAqXSfrfvoEQG5rM28HCw=;
  b=WwAAKiorBSFs8K8sE7p3yot2KU8aZvQLhjn9iNZY88+KAzOfpFdIvGqh
   MQd9y+Jml47IgiBZhNF+DoOat6PQNyrb9P5HsMT8sCIVE7bHLmmNXb84U
   Ws+qQkpT64QWC7NkArzWcAKU8YhInxNYZwLo9Lkg9UP8Qt6IrE9QwYYKa
   fcBwZxW8ivBwTT5ricprn9+KfVFKtL1b/e7k6tFWxkQksRhV99ccku8BS
   F3JvFy2lbNWWeWag8o1QhhZAMnE63f6GqwJcLtgayFQh/QQbgaE25N2SK
   7ok1irNkaCFPXObMQeqUiNoW5zVsGDeLm0bOrvDsJcpwroUw0gJ64kWof
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26086314"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="26086314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 17:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="31942293"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2024 17:19:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXA7k-0000xY-1c;
	Tue, 06 Feb 2024 01:19:44 +0000
Date: Tue, 6 Feb 2024 09:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Justin Stitt <justinstitt@google.com>
Subject: [kees:devel/2-arg-strscpy 2/4] drivers/gpu/drm/drm_property.c:131:2:
 error: implicit declaration of function 'COUNT_ARGS' is invalid in C99
Message-ID: <202402060925.RBuhPVBO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/2-arg-strscpy
head:   ec83dccab8c18d8482dc1934e7079916508b8eea
commit: db19daefe72fd816f386afed91ae83633382e489 [2/4] string: Allow 2-argument strscpy()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240206/202402060925.RBuhPVBO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060925.RBuhPVBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060925.RBuhPVBO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_property.c:131:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> drivers/gpu/drm/drm_property.c:131:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   drivers/gpu/drm/drm_property.c:131:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   drivers/gpu/drm/drm_property.c:424:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(prop_enum->name, name, DRM_PROP_NAME_LEN);
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   drivers/gpu/drm/drm_property.c:424:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   drivers/gpu/drm/drm_property.c:424:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   drivers/gpu/drm/drm_property.c:477:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   drivers/gpu/drm/drm_property.c:477:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   drivers/gpu/drm/drm_property.c:477:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   9 errors generated.
--
>> drivers/rpmsg/rpmsg_ns.c:53:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(chinfo.name, msg->name, sizeof(chinfo.name));
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> drivers/rpmsg/rpmsg_ns.c:53:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   drivers/rpmsg/rpmsg_ns.c:53:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   3 errors generated.
--
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> include/trace/events/writeback.h:68:3: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   strscpy_pad(__entry->name,
                   ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> include/trace/events/writeback.h:68:3: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:68:3: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:113:3: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   strscpy_pad(__entry->name, bdi_dev_name(bdi), 32);
                   ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:113:3: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:113:3: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:318:3: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   strscpy_pad(__entry->name,
                   ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:318:3: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:318:3: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   In file included from fs/fs-writeback.c:81:
   In file included from include/trace/events/writeback.h:861:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/writeback.h:362:3: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   strscpy_pad(__entry->name, bdi_dev_name(wb->bdi), 32);
                   ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
--
>> fs/exec.c:1234:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(buf, tsk->comm, buf_size);
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
>> fs/exec.c:1234:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   fs/exec.c:1234:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   fs/exec.c:1249:2: error: implicit declaration of function 'CONCATENATE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           strscpy_pad(tsk->comm, buf, sizeof(tsk->comm));
           ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
           ^
   fs/exec.c:1249:2: error: implicit declaration of function 'COUNT_ARGS' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                  ^
   fs/exec.c:1249:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
           __wrote = strscpy(__dst, __src, __count);                       \
                     ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                       ^
   6 errors generated.


vim +/COUNT_ARGS +131 drivers/gpu/drm/drm_property.c

59e71ee746a37f Daniel Vetter    2016-08-29   81  
59e71ee746a37f Daniel Vetter    2016-08-29   82  /**
59e71ee746a37f Daniel Vetter    2016-08-29   83   * drm_property_create - create a new property type
59e71ee746a37f Daniel Vetter    2016-08-29   84   * @dev: drm device
59e71ee746a37f Daniel Vetter    2016-08-29   85   * @flags: flags specifying the property type
59e71ee746a37f Daniel Vetter    2016-08-29   86   * @name: name of the property
59e71ee746a37f Daniel Vetter    2016-08-29   87   * @num_values: number of pre-defined values
59e71ee746a37f Daniel Vetter    2016-08-29   88   *
59e71ee746a37f Daniel Vetter    2016-08-29   89   * This creates a new generic drm property which can then be attached to a drm
6a8a66eda17ea6 Daniel Vetter    2016-11-23   90   * object with drm_object_attach_property(). The returned property object must
6a8a66eda17ea6 Daniel Vetter    2016-11-23   91   * be freed with drm_property_destroy(), which is done automatically when
6a8a66eda17ea6 Daniel Vetter    2016-11-23   92   * calling drm_mode_config_cleanup().
59e71ee746a37f Daniel Vetter    2016-08-29   93   *
59e71ee746a37f Daniel Vetter    2016-08-29   94   * Returns:
59e71ee746a37f Daniel Vetter    2016-08-29   95   * A pointer to the newly created property on success, NULL on failure.
59e71ee746a37f Daniel Vetter    2016-08-29   96   */
51abc97658b954 Ville Syrjälä    2018-03-06   97  struct drm_property *drm_property_create(struct drm_device *dev,
51abc97658b954 Ville Syrjälä    2018-03-06   98  					 u32 flags, const char *name,
51abc97658b954 Ville Syrjälä    2018-03-06   99  					 int num_values)
59e71ee746a37f Daniel Vetter    2016-08-29  100  {
59e71ee746a37f Daniel Vetter    2016-08-29  101  	struct drm_property *property = NULL;
59e71ee746a37f Daniel Vetter    2016-08-29  102  	int ret;
59e71ee746a37f Daniel Vetter    2016-08-29  103  
100bc0d9963b50 Ville Syrjälä    2018-03-06  104  	if (WARN_ON(!drm_property_flags_valid(flags)))
100bc0d9963b50 Ville Syrjälä    2018-03-06  105  		return NULL;
100bc0d9963b50 Ville Syrjälä    2018-03-06  106  
5ebbb5b4d424e0 Ville Syrjälä    2018-03-02  107  	if (WARN_ON(strlen(name) >= DRM_PROP_NAME_LEN))
5ebbb5b4d424e0 Ville Syrjälä    2018-03-02  108  		return NULL;
5ebbb5b4d424e0 Ville Syrjälä    2018-03-02  109  
59e71ee746a37f Daniel Vetter    2016-08-29  110  	property = kzalloc(sizeof(struct drm_property), GFP_KERNEL);
59e71ee746a37f Daniel Vetter    2016-08-29  111  	if (!property)
59e71ee746a37f Daniel Vetter    2016-08-29  112  		return NULL;
59e71ee746a37f Daniel Vetter    2016-08-29  113  
59e71ee746a37f Daniel Vetter    2016-08-29  114  	property->dev = dev;
59e71ee746a37f Daniel Vetter    2016-08-29  115  
59e71ee746a37f Daniel Vetter    2016-08-29  116  	if (num_values) {
59e71ee746a37f Daniel Vetter    2016-08-29  117  		property->values = kcalloc(num_values, sizeof(uint64_t),
59e71ee746a37f Daniel Vetter    2016-08-29  118  					   GFP_KERNEL);
59e71ee746a37f Daniel Vetter    2016-08-29  119  		if (!property->values)
59e71ee746a37f Daniel Vetter    2016-08-29  120  			goto fail;
59e71ee746a37f Daniel Vetter    2016-08-29  121  	}
59e71ee746a37f Daniel Vetter    2016-08-29  122  
2135ea7aafa26b Thierry Reding   2017-02-28  123  	ret = drm_mode_object_add(dev, &property->base, DRM_MODE_OBJECT_PROPERTY);
59e71ee746a37f Daniel Vetter    2016-08-29  124  	if (ret)
59e71ee746a37f Daniel Vetter    2016-08-29  125  		goto fail;
59e71ee746a37f Daniel Vetter    2016-08-29  126  
59e71ee746a37f Daniel Vetter    2016-08-29  127  	property->flags = flags;
59e71ee746a37f Daniel Vetter    2016-08-29  128  	property->num_values = num_values;
59e71ee746a37f Daniel Vetter    2016-08-29  129  	INIT_LIST_HEAD(&property->enum_list);
59e71ee746a37f Daniel Vetter    2016-08-29  130  
753f2674ad8db2 Laurent Pinchart 2021-07-31 @131  	strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
59e71ee746a37f Daniel Vetter    2016-08-29  132  
59e71ee746a37f Daniel Vetter    2016-08-29  133  	list_add_tail(&property->head, &dev->mode_config.property_list);
59e71ee746a37f Daniel Vetter    2016-08-29  134  
59e71ee746a37f Daniel Vetter    2016-08-29  135  	return property;
59e71ee746a37f Daniel Vetter    2016-08-29  136  fail:
59e71ee746a37f Daniel Vetter    2016-08-29  137  	kfree(property->values);
59e71ee746a37f Daniel Vetter    2016-08-29  138  	kfree(property);
59e71ee746a37f Daniel Vetter    2016-08-29  139  	return NULL;
59e71ee746a37f Daniel Vetter    2016-08-29  140  }
59e71ee746a37f Daniel Vetter    2016-08-29  141  EXPORT_SYMBOL(drm_property_create);
59e71ee746a37f Daniel Vetter    2016-08-29  142  

:::::: The code at line 131 was first introduced by commit
:::::: 753f2674ad8db265986869ca07863758015deebf drm: property: Replace strncpy() with strscpy_pad()

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
