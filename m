Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FDD27B34E;
	Thu, 27 Nov 2025 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764284507; cv=none; b=EHJ/K0Qpn5Kzv7hyEpLy79Tud8NAzxuV8/slYgSyzoLuiaXUuA330i8Yh5ujsqMJmKLfx4DCaGCCJ3G/ggbAvCp6rMtp9uUpOPkm5HPQTNn3o3BxYQsHA108PiL8MHWSMhhjoEAcJx7kkZ85T3BQxFXObRJRLMsJBGL4OoINoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764284507; c=relaxed/simple;
	bh=c2j4bEB4sIjbWg4ks4HGdoAa7FErabBhxhSRuXPDFL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7efPp/dRxTMcQdduY7+xEKjkTryrnYM9Dw4fFJL8mV9yvE/irX/xQUm9fFKxj0kN1FBzRPPdvgkl0FTh8gLW7/di4aUkuUhzhldia65kCaWKVZWWhJQoB6BOwqmRJQ1jCrcgt7EuhFKzpwr8t7vSBnbplefDSe81ldUXKk1xKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJdgzJPS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJdgzJPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764284505; x=1795820505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2j4bEB4sIjbWg4ks4HGdoAa7FErabBhxhSRuXPDFL8=;
  b=TJdgzJPSESnB8KWVH8FtDbm4pAjzobCsl/i+W+WFZJ45YVUr3dRCDZHm
   1n+NDgfAyG5QAeG47gEtTl6hjyoG9GxajRdnCGfiiUuygyvG5mhm+mZXZ
   E3bDja0O2/21pnf29CehML3UqcRqpb4SR7sUNfswZJ/lFqwEv4lK4eqCT
   7Mj7PjiQNg+uikoUISF2tYaFr5G+2AkojG3stGSbbSPonujiBxkgnIP3G
   dYZPX8VCI1W0KjNCx1ZpTdlTRlLefY43m4ANmdxWmKBN6AP629yN6zk5+
   hgGyOZozQqu+upyGzG0rR1mEm6/XOCBT+hWPtNv9ByGH4/UK0P8yrS1TN
   w==;
X-CSE-ConnectionGUID: qNsVPUuXQKWzUyJixeeY9A==
X-CSE-MsgGUID: rfGeVQnlTMeGeXlfjBxn3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70185854"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="70185854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 15:01:45 -0800
X-CSE-ConnectionGUID: uR9+DpvhR6+L0zYQQNYICw==
X-CSE-MsgGUID: NDBQDO7DQTSBuIfuVoEy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193421937"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2025 15:01:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOkzd-000000005om-02xB;
	Thu, 27 Nov 2025 23:01:41 +0000
Date: Fri, 28 Nov 2025 07:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 60/75] fs/nfsd/nfs2acl.c:177:10: error: no member
 named 'access' in 'struct nfsd3_accessargs'
Message-ID: <202511280658.xSZMMz2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   d6deccd7892291215036a5d70a688a2ccf230b15
commit: 2d303c4ac8b0e06b053ef4258525fa113324c050 [60/75] NFSD: Use xdrgen XDR functions for NFSv3 ACCESS procedure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251128/202511280658.xSZMMz2E-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280658.xSZMMz2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280658.xSZMMz2E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs2acl.c:177:10: error: no member named 'access' in 'struct nfsd3_accessargs'
     177 |                         argp->access);
         |                         ~~~~  ^
   include/linux/sunrpc/debug.h:25:28: note: expanded from macro 'dprintk'
      25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:42:26: note: expanded from macro 'dfprintk'
      42 |                 __sunrpc_printk(fmt, ##__VA_ARGS__);                    \
         |                                        ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:34:57: note: expanded from macro '__sunrpc_printk'
      34 | #  define __sunrpc_printk(fmt, ...)     trace_printk(fmt, ##__VA_ARGS__)
         |                                                             ^~~~~~~~~~~
   include/linux/kernel.h:276:26: note: expanded from macro 'trace_printk'
     276 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                                        ^~~~~~~~~~~
   include/linux/kernel.h:287:37: note: expanded from macro 'do_trace_printk'
     287 |         __trace_printk_check_format(fmt, ##args);                       \
         |                                            ^~~~
   include/linux/kernel.h:239:40: note: expanded from macro '__trace_printk_check_format'
     239 |                 ____trace_printk_check_format(fmt, ##args);             \
         |                                                      ^~~~
>> fs/nfsd/nfs2acl.c:177:10: error: no member named 'access' in 'struct nfsd3_accessargs'
     177 |                         argp->access);
         |                         ~~~~  ^
   include/linux/sunrpc/debug.h:25:28: note: expanded from macro 'dprintk'
      25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:42:26: note: expanded from macro 'dfprintk'
      42 |                 __sunrpc_printk(fmt, ##__VA_ARGS__);                    \
         |                                        ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:34:57: note: expanded from macro '__sunrpc_printk'
      34 | #  define __sunrpc_printk(fmt, ...)     trace_printk(fmt, ##__VA_ARGS__)
         |                                                             ^~~~~~~~~~~
   include/linux/kernel.h:276:26: note: expanded from macro 'trace_printk'
     276 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                                        ^~~~~~~~~~~
   include/linux/kernel.h:290:50: note: expanded from macro 'do_trace_printk'
     290 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                                                ^~~~
>> fs/nfsd/nfs2acl.c:177:10: error: no member named 'access' in 'struct nfsd3_accessargs'
     177 |                         argp->access);
         |                         ~~~~  ^
   include/linux/sunrpc/debug.h:25:28: note: expanded from macro 'dprintk'
      25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:42:26: note: expanded from macro 'dfprintk'
      42 |                 __sunrpc_printk(fmt, ##__VA_ARGS__);                    \
         |                                        ^~~~~~~~~~~
   include/linux/sunrpc/debug.h:34:57: note: expanded from macro '__sunrpc_printk'
      34 | #  define __sunrpc_printk(fmt, ...)     trace_printk(fmt, ##__VA_ARGS__)
         |                                                             ^~~~~~~~~~~
   include/linux/kernel.h:276:26: note: expanded from macro 'trace_printk'
     276 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                                        ^~~~~~~~~~~
   include/linux/kernel.h:292:36: note: expanded from macro 'do_trace_printk'
     292 |                 __trace_printk(_THIS_IP_, fmt, ##args);                 \
         |                                                  ^~~~
>> fs/nfsd/nfs2acl.c:180:8: error: no member named 'access' in 'struct nfsd3_accessres'
     180 |         resp->access = argp->access;
         |         ~~~~  ^
   fs/nfsd/nfs2acl.c:180:23: error: no member named 'access' in 'struct nfsd3_accessargs'
     180 |         resp->access = argp->access;
         |                        ~~~~  ^
>> fs/nfsd/nfs2acl.c:181:8: error: no member named 'status' in 'struct nfsd3_accessres'
     181 |         resp->status = nfsd_access(rqstp, &resp->fh, &resp->access, NULL);
         |         ~~~~  ^
   fs/nfsd/nfs2acl.c:181:54: error: no member named 'access' in 'struct nfsd3_accessres'
     181 |         resp->status = nfsd_access(rqstp, &resp->fh, &resp->access, NULL);
         |                                                       ~~~~  ^
   fs/nfsd/nfs2acl.c:182:12: error: no member named 'status' in 'struct nfsd3_accessres'
     182 |         if (resp->status != nfs_ok)
         |             ~~~~  ^
   fs/nfsd/nfs2acl.c:184:8: error: no member named 'status' in 'struct nfsd3_accessres'
     184 |         resp->status = fh_getattr(&resp->fh, &resp->stat);
         |         ~~~~  ^
>> fs/nfsd/nfs2acl.c:184:46: error: no member named 'stat' in 'struct nfsd3_accessres'
     184 |         resp->status = fh_getattr(&resp->fh, &resp->stat);
         |                                               ~~~~  ^
   fs/nfsd/nfs2acl.c:234:40: error: no member named 'access' in 'struct nfsd3_accessargs'
     234 |         if (xdr_stream_decode_u32(xdr, &args->access) < 0)
         |                                         ~~~~  ^
   fs/nfsd/nfs2acl.c:280:37: error: no member named 'status' in 'struct nfsd3_accessres'
     280 |         if (!svcxdr_encode_stat(xdr, resp->status))
         |                                      ~~~~  ^
   fs/nfsd/nfs2acl.c:282:16: error: no member named 'status' in 'struct nfsd3_accessres'
     282 |         switch (resp->status) {
         |                 ~~~~  ^
   fs/nfsd/nfs2acl.c:284:58: error: no member named 'stat' in 'struct nfsd3_accessres'
     284 |                 if (!svcxdr_encode_fattr(rqstp, xdr, &resp->fh, &resp->stat))
         |                                                                  ~~~~  ^
   fs/nfsd/nfs2acl.c:286:40: error: no member named 'access' in 'struct nfsd3_accessres'
     286 |                 if (xdr_stream_encode_u32(xdr, resp->access) < 0)
         |                                                ~~~~  ^
   15 errors generated.


vim +177 fs/nfsd/nfs2acl.c

a257cdd0e21796 Andreas Gruenbacher 2005-06-22  166  
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  167  /*
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  168   * Check file access
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  169   */
a6beb73272b4c0 Christoph Hellwig   2017-05-08  170  static __be32 nfsacld_proc_access(struct svc_rqst *rqstp)
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  171  {
a6beb73272b4c0 Christoph Hellwig   2017-05-08  172  	struct nfsd3_accessargs *argp = rqstp->rq_argp;
a6beb73272b4c0 Christoph Hellwig   2017-05-08  173  	struct nfsd3_accessres *resp = rqstp->rq_resp;
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  174  
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  175  	dprintk("nfsd: ACCESS(2acl)   %s 0x%x\n",
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  176  			SVCFH_fmt(&argp->fh),
a257cdd0e21796 Andreas Gruenbacher 2005-06-22 @177  			argp->access);
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  178  
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  179  	fh_copy(&resp->fh, &argp->fh);
a257cdd0e21796 Andreas Gruenbacher 2005-06-22 @180  	resp->access = argp->access;
f0af22101d9072 Chuck Lever         2020-10-01 @181  	resp->status = nfsd_access(rqstp, &resp->fh, &resp->access, NULL);
f0af22101d9072 Chuck Lever         2020-10-01  182  	if (resp->status != nfs_ok)
f0af22101d9072 Chuck Lever         2020-10-01  183  		goto out;
f0af22101d9072 Chuck Lever         2020-10-01 @184  	resp->status = fh_getattr(&resp->fh, &resp->stat);
f0af22101d9072 Chuck Lever         2020-10-01  185  out:
cc028a10a48c3c Chuck Lever         2020-10-02  186  	return rpc_success;
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  187  }
a257cdd0e21796 Andreas Gruenbacher 2005-06-22  188  

:::::: The code at line 177 was first introduced by commit
:::::: a257cdd0e2179630d3201c32ba14d7fcb3c3a055 [PATCH] NFSD: Add server support for NFSv3 ACLs.

:::::: TO: Andreas Gruenbacher <agruen@suse.de>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
