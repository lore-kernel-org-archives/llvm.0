Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CB29D0D;
	Fri,  8 Aug 2025 01:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754617575; cv=none; b=odPp6GHVvlnhW8iBl2dgSkOJyGlrBSolqq/ZgHEXL8TwFQ8/1Rezd3DtTWl8zPuJrV2Hv5etO1Cy8voQf05EGOJ5iDYqJVhwtvoPgpwTpulHasdJjUe4GaZsnwxxEXUuvGm0PNiG4pPo8dwMQGqBGqHKAzQFz/3zq9DbfXKmweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754617575; c=relaxed/simple;
	bh=ZWdgQlzDEkavg579k8aYdjCHuKro37kZAdXCBgywe4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DveYBHaPYJ2Zf/5zyZs4R6Ej7tMZmjKam0wJIukRDz4i1Hb7hqRA//jfk+kL+DKPEYK9R1sRtnP4GCYEyyyL88ZrWXTeMHjACExp6Um6BeeVU5MSz8cxlp+DCuD2537r1yjWRuzLKS14+OqvpT9hLc19T7fuxumEEZk2pZbLcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUtIuorV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUtIuorV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754617574; x=1786153574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWdgQlzDEkavg579k8aYdjCHuKro37kZAdXCBgywe4I=;
  b=gUtIuorVvBbDLjhHMjtvLlHY0yWgO/f3I5/ahIzupqSwilQyvxOahqxK
   aS7nSNHOxr7KH5ABACPwIDuMDoG1XtgeaoaG/P51tQqaTnhmjtYQQI2ji
   6xZolBFiLNBiWoFhcpnqdapk+NklmxzQep5kGe95mvhdzzX6GAyIJlU10
   KQbBj0TJpg0ceNtsYul7yXm+9Fs5m44hFmvqBthJM62qSBaQ0Qy07TH0+
   v1TZlSmnfd7neTDH3TYva66qTVBJEnR+iOwOMQO8CMskke5ynjiCnAzeL
   LXsiftdnmmWdfRSewXWEEGm2YFub/PZONYYXyJH6YDS7G56Bgc5eTPcnO
   w==;
X-CSE-ConnectionGUID: tFHZzwZDSvKrrOl7OfsAuQ==
X-CSE-MsgGUID: Ct6nw5tWQte3lhbztVDltQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68335579"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68335579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:46:11 -0700
X-CSE-ConnectionGUID: VS3/VirRSauQOaMVaJNwJQ==
X-CSE-MsgGUID: XhOGd2aoQq2c4emjaSuT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="166005413"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 18:46:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukCBM-0003R8-05;
	Fri, 08 Aug 2025 01:46:08 +0000
Date: Fri, 8 Aug 2025 09:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org
Subject: [ceph-client:tls-tracing-only 11/14] lib/rtlog/rtlog_test.c:199:6:
 warning: unused variable 'thread_id'
Message-ID: <202508080949.tdXoQhQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls-tracing-only
head:   ffad14ce035a047cbfda2d38f7ae37b0767de136
commit: e362128c76ee58396cd3e9e0d3dc74727d5dcb36 [11/14] ceph integration
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250808/202508080949.tdXoQhQa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080949.tdXoQhQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080949.tdXoQhQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/rtlog/rtlog_test.c:54:65: error: too few arguments to function call, expected 3, have 2
      54 |         ret = rtlog_register_client(RTLOG_TEST_CLIENT_ID, "test_client");
         |               ~~~~~~~~~~~~~~~~~~~~~                                    ^
   include/linux/rtlog/rtlog.h:149:5: note: 'rtlog_register_client' declared here
     149 | u32 rtlog_register_client(const char *subsystem, const char *identifier, u64 instance_id);
         |     ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rtlog/rtlog_test.c:58:14: error: assigning to 'struct rtlog_client_info *' from 'const struct rtlog_client_info *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      58 |         client_info = rtlog_get_client_info(RTLOG_TEST_CLIENT_ID);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rtlog/rtlog_test.c:61:41: error: no member named 'name' in 'struct rtlog_client_info'
      61 |                 RTLOG_TEST_ASSERT(strcmp(client_info->name, "test_client") == 0, 
         |                                          ~~~~~~~~~~~  ^
   lib/rtlog/rtlog_test.c:66:63: error: too few arguments to function call, expected 4, have 3
      66 |         ret = rtlog_get_source_id("test_function", __FILE__, __LINE__);
         |               ~~~~~~~~~~~~~~~~~~~                                    ^
   include/linux/rtlog/rtlog.h:157:5: note: 'rtlog_get_source_id' declared here
     157 | u32 rtlog_get_source_id(const char *file, const char *func, unsigned int line, const char *fmt);
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rtlog/rtlog_test.c:73:42: error: no member named 'function' in 'struct rtlog_source_info'
      73 |                         RTLOG_TEST_ASSERT(strcmp(source_info->function, "test_function") == 0,
         |                                                  ~~~~~~~~~~~  ^
   lib/rtlog/rtlog_test.c:96:65: error: too few arguments to function call, expected 3, have 2
      96 |         ret = rtlog_register_client(RTLOG_TEST_CLIENT_ID, "test_client");
         |               ~~~~~~~~~~~~~~~~~~~~~                                    ^
   include/linux/rtlog/rtlog.h:149:5: note: 'rtlog_register_client' declared here
     149 | u32 rtlog_register_client(const char *subsystem, const char *identifier, u64 instance_id);
         |     ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rtlog/rtlog_test.c:100:62: error: too few arguments to function call, expected 4, have 3
     100 |         source_id = rtlog_get_source_id(__func__, __FILE__, __LINE__);
         |                     ~~~~~~~~~~~~~~~~~~~                             ^
   include/linux/rtlog/rtlog.h:157:5: note: 'rtlog_get_source_id' declared here
     157 | u32 rtlog_get_source_id(const char *file, const char *func, unsigned int line, const char *fmt);
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rtlog/rtlog_test.c:122:23: error: variable has incomplete type 'struct rtlog_ser_ctx'
     122 |         struct rtlog_ser_ctx ser_ctx;
         |                              ^
   lib/rtlog/rtlog_test.c:122:9: note: forward declaration of 'struct rtlog_ser_ctx'
     122 |         struct rtlog_ser_ctx ser_ctx;
         |                ^
   lib/rtlog/rtlog_test.c:132:8: error: call to undeclared function 'rtlog_ser_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         ret = rtlog_ser_init(&ser_ctx, buffer, sizeof(buffer));
         |               ^
   lib/rtlog/rtlog_test.c:132:8: note: did you mean 'rtlog_init'?
   include/linux/rtlog/rtlog.h:175:5: note: 'rtlog_init' declared here
     175 | int rtlog_init(void);
         |     ^
   lib/rtlog/rtlog_test.c:136:8: error: call to undeclared function 'rtlog_ser_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 |         ret = rtlog_ser_u32(&ser_ctx, test_u32);
         |               ^
   lib/rtlog/rtlog_test.c:140:8: error: call to undeclared function 'rtlog_ser_u64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |         ret = rtlog_ser_u64(&ser_ctx, test_u64);
         |               ^
   lib/rtlog/rtlog_test.c:144:8: error: call to undeclared function 'rtlog_ser_string'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         ret = rtlog_ser_string(&ser_ctx, test_string, strlen(test_string));
         |               ^
   lib/rtlog/rtlog_test.c:148:16: error: call to undeclared function 'rtlog_ser_get_used'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         size_t used = rtlog_ser_get_used(&ser_ctx);
         |                       ^
   lib/rtlog/rtlog_test.c:168:65: error: too few arguments to function call, expected 3, have 2
     168 |         ret = rtlog_register_client(RTLOG_TEST_CLIENT_ID, "stress_test");
         |               ~~~~~~~~~~~~~~~~~~~~~                                    ^
   include/linux/rtlog/rtlog.h:149:5: note: 'rtlog_register_client' declared here
     149 | u32 rtlog_register_client(const char *subsystem, const char *identifier, u64 instance_id);
         |     ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/rtlog/rtlog_test.c:199:6: warning: unused variable 'thread_id' [-Wunused-variable]
     199 |         int thread_id = (long)data;
         |             ^~~~~~~~~
   1 warning and 14 errors generated.


vim +/thread_id +199 lib/rtlog/rtlog_test.c

   196	
   197	static int test_thread_func(void *data)
   198	{
 > 199		int thread_id = (long)data;
   200		int i;
   201		
   202		for (i = 0; i < 100; i++) {
   203			RTLOG_LOG("Thread %d iteration %d", thread_id, i);
   204			atomic_inc(&thread_counter);
   205			
   206			if (kthread_should_stop())
   207				break;
   208				
   209			msleep(1); /* Small delay */
   210		}
   211		
   212		return 0;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
