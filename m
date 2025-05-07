Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B4F1CAA76;
	Wed,  7 May 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616293; cv=none; b=M9shX1gAHj/S8GsISNZranAqMvCzVvZThonc9Mgi9ElQDmVRXiMpaXEWRvG931eyiZyyY+3cDc7hu0h6zSDBRftMFk5pvBQHkGsObEsWmFhXtNUEgSydObIg1HxRjbd+bht6EjhRV/Z7edvevKyzXYBA3XTK0S5JAHACXfhyOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616293; c=relaxed/simple;
	bh=Q5M7hZXRq3X7j3qCQZ27aJo32vbii0Su4V78VNG9z1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQkZsSosxW7qvgGCVMZ0O+Vvip2IEg4nGf7XY8JbWbBc1PknURzwzhaDmMT3U+CXtFauBQVA/XmT0sdvIECuTcnNPPtoc7pFc9tzIYSo96bSWjM/O0lLBNF62v305sPzTVH5hzZS5JXeHlNd5i31EULgCo7u8+Cxfz2ga9ENE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNGzMF/K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNGzMF/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746616291; x=1778152291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5M7hZXRq3X7j3qCQZ27aJo32vbii0Su4V78VNG9z1U=;
  b=jNGzMF/KB/ZMckWCgy3p2vBSGZHuHGYRVHShGopZNt9bBLObJg/xh1mi
   wbIDWhTm6LgUPqu0NHx0Ds8Mq40Jn9flJ+f4n4khEs7se8fsVdxKGOYKT
   q4jXE5+IRd3pWChY9GacX4HPDGFizi+I0Nd7JyGE+D8MJG/jvq7IPMcVW
   pnPNULxJJ+oEnc3NrcaLOvjv1PQzhG/sJCjubN/f8u0kOJ3QOgZDkKZ/V
   BjBqdoaVU+EgeArznnjYHtc4fM2MhHT0WVCPq0oMiryvNjnILcv1oYXTp
   WVApBit3EDnIgUKW/OPXiCPVQq6K2hAIqtr09mEjZ54d/SOdYZzOZedXF
   g==;
X-CSE-ConnectionGUID: 7Vq2UT0eRziS1c0NO5vIcw==
X-CSE-MsgGUID: PrRb47T3TbS99fszhtVp3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48475444"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48475444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:11:28 -0700
X-CSE-ConnectionGUID: U2hyLcjMQOuHxUwdX7jaKw==
X-CSE-MsgGUID: aBfLSs2IQK23u4ClWGdiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140671942"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 04:11:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcgN-0007et-2q;
	Wed, 07 May 2025 11:11:23 +0000
Date: Wed, 7 May 2025 19:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 07/10] ref_tracker: add a way to create a symlink to
 the ref_tracker_dir debugfs file
Message-ID: <202505071837.2I9QYesc-lkp@intel.com>
References: <20250505-reftrack-dbgfs-v7-7-f78c5d97bcca@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-reftrack-dbgfs-v7-7-f78c5d97bcca@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc1018675ec28a8a60d83b378d8c3991faa5a27]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/ref_tracker-don-t-use-pK-in-pr_ostream-output/20250506-013822
base:   5bc1018675ec28a8a60d83b378d8c3991faa5a27
patch link:    https://lore.kernel.org/r/20250505-reftrack-dbgfs-v7-7-f78c5d97bcca%40kernel.org
patch subject: [PATCH v7 07/10] ref_tracker: add a way to create a symlink to the ref_tracker_dir debugfs file
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250507/202505071837.2I9QYesc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071837.2I9QYesc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071837.2I9QYesc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfs/client.c:19:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:19:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   In file included from fs/nfs/client.c:20:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:803:46: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     803 |         if (U32_MAX >= SIZE_MAX / sizeof(*p) && len > SIZE_MAX / sizeof(*p))
         |                                                 ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from fs/nfs/file.c:26:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   1 warning and 1 error generated.
--
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from fs/nfs/pagelist.c:16:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
--
   In file included from fs/nfs/nfs4proc.c:45:
   In file included from include/linux/sunrpc/clnt.h:19:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   In file included from fs/nfs/nfs4proc.c:45:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:803:46: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     803 |         if (U32_MAX >= SIZE_MAX / sizeof(*p) && len > SIZE_MAX / sizeof(*p))
         |                                                 ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4proc.c:9505:12: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9505 |         unsigned *ptr;
         |                   ^
   3 warnings and 1 error generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   fs/nfs/flexfilelayout/flexfilelayout.c:1264:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1264 |         int err;
         |             ^
   2 warnings and 1 error generated.
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:10:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^
   2 warnings and 1 error generated.
--
   In file included from fs/nfs/blocklayout/blocklayout.c:41:
   In file included from fs/nfs/blocklayout/../pnfs.h:34:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:14:
   In file included from include/linux/sunrpc/msg_prot.h:205:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:40:
   In file included from include/net/net_trackers.h:4:
   include/linux/ref_tracker.h:124:15: warning: attribute declaration must precede definition [-Wignored-attributes]
     124 | static inline __ostream_printf
         |               ^
   include/linux/ref_tracker.h:9:26: note: expanded from macro '__ostream_printf'
       9 | #define __ostream_printf __printf(2, 3)
         |                          ^
   include/linux/compiler_attributes.h:158:56: note: expanded from macro '__printf'
     158 | #define __printf(a, b)                  __attribute__((__format__(printf, a, b)))
         |                                                        ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
>> include/linux/ref_tracker.h:125:6: error: redefinition of 'ref_tracker_dir_symlink'
     125 | void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |      ^
   include/linux/ref_tracker.h:87:20: note: previous definition is here
      87 | static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
         |                    ^
   fs/nfs/blocklayout/blocklayout.c:384:9: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     384 |         size_t count = header->args.count;
         |                ^
   2 warnings and 1 error generated.
..


vim +/ref_tracker_dir_symlink +125 include/linux/ref_tracker.h

     8	
   > 9	#define __ostream_printf __printf(2, 3)
    10	
    11	struct ref_tracker;
    12	
    13	struct ref_tracker_dir {
    14	#ifdef CONFIG_REF_TRACKER
    15		spinlock_t		lock;
    16		unsigned int		quarantine_avail;
    17		refcount_t		untracked;
    18		refcount_t		no_tracker;
    19		bool			dead;
    20		struct list_head	list; /* List of active trackers */
    21		struct list_head	quarantine; /* List of dead trackers */
    22		const char		*class; /* object classname */
    23	#ifdef CONFIG_DEBUG_FS
    24		struct dentry		*dentry;
    25		struct dentry		*symlink;
    26	#endif
    27		char			name[32];
    28	#endif
    29	};
    30	
    31	#ifdef CONFIG_REF_TRACKER
    32	
    33	void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir);
    34	void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...);
    35	
    36	static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
    37						unsigned int quarantine_count,
    38						const char *class,
    39						const char *name)
    40	{
    41		INIT_LIST_HEAD(&dir->list);
    42		INIT_LIST_HEAD(&dir->quarantine);
    43		spin_lock_init(&dir->lock);
    44		dir->quarantine_avail = quarantine_count;
    45		dir->dead = false;
    46		refcount_set(&dir->untracked, 1);
    47		refcount_set(&dir->no_tracker, 1);
    48		dir->class = class;
    49	#ifdef CONFIG_DEBUG_FS
    50		dir->dentry = NULL;
    51		dir->symlink = NULL;
    52	#endif
    53		strscpy(dir->name, name, sizeof(dir->name));
    54		ref_tracker_dir_debugfs(dir);
    55		stack_depot_init();
    56	}
    57	
    58	void ref_tracker_dir_exit(struct ref_tracker_dir *dir);
    59	
    60	void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
    61					  unsigned int display_limit);
    62	
    63	void ref_tracker_dir_print(struct ref_tracker_dir *dir,
    64				   unsigned int display_limit);
    65	
    66	int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size);
    67	
    68	int ref_tracker_alloc(struct ref_tracker_dir *dir,
    69			      struct ref_tracker **trackerp, gfp_t gfp);
    70	
    71	int ref_tracker_free(struct ref_tracker_dir *dir,
    72			     struct ref_tracker **trackerp);
    73	
    74	#else /* CONFIG_REF_TRACKER */
    75	
    76	static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
    77						unsigned int quarantine_count,
    78						const char *class,
    79						const char *name)
    80	{
    81	}
    82	
    83	static inline void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
    84	{
    85	}
    86	
    87	static inline void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
    88	{
    89	}
    90	
    91	static inline void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
    92	{
    93	}
    94	
    95	static inline void ref_tracker_dir_print_locked(struct ref_tracker_dir *dir,
    96							unsigned int display_limit)
    97	{
    98	}
    99	
   100	static inline void ref_tracker_dir_print(struct ref_tracker_dir *dir,
   101						 unsigned int display_limit)
   102	{
   103	}
   104	
   105	static inline int ref_tracker_dir_snprint(struct ref_tracker_dir *dir,
   106						  char *buf, size_t size)
   107	{
   108		return 0;
   109	}
   110	
   111	static inline int ref_tracker_alloc(struct ref_tracker_dir *dir,
   112					    struct ref_tracker **trackerp,
   113					    gfp_t gfp)
   114	{
   115		return 0;
   116	}
   117	
   118	static inline int ref_tracker_free(struct ref_tracker_dir *dir,
   119					   struct ref_tracker **trackerp)
   120	{
   121		return 0;
   122	}
   123	
   124	static inline __ostream_printf
 > 125	void ref_tracker_dir_symlink(struct ref_tracker_dir *dir, const char *fmt, ...)
   126	{
   127	}
   128	#endif
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
