Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287E8340D92;
	Mon, 17 Nov 2025 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411063; cv=none; b=A3qK5Dqe+MNaIbrQKce4Ny8+uS/6h6wSifBE8gsPxqwJxcdbep1p7fPSHpITYSrZqpBctKIGCaig7pU80jIeQjlHl5t1pD5tksD1zKn7EMNfMW6vUBnQUOHWH/yUPlERVFa7SSI01imwZ8aWKJaqny0mKhLGboNqFCXlEiHvPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411063; c=relaxed/simple;
	bh=1zQ2H1MGp4w50r0dA7zrZiUGyt90auXNX8iVKac8xwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hnk2dIYkzGwzuosmCJIqW3xpULDLy6WMl5zW6jBh6c6qnCc0AUSjADyUVIcV5BzGSPlyc6NnGeb5UiPDi4x3qYi+J8A7RwgacrRZDecrCDxysRlrOaMExA2nWKC+otAlr3/bqE5KHbC3UcjxqCgAGMq0gOnro7VW0k6oILJXmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyUsBAin; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyUsBAin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763411050; x=1794947050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zQ2H1MGp4w50r0dA7zrZiUGyt90auXNX8iVKac8xwQ=;
  b=jyUsBAinS/fMOoydlnkuMY1w3VI1c+R/6cEXWKAmjdcGIrUjZ7KxEF8b
   GGauzIewgyiOeTsTOhnPt8TxJNkm+bxHB+O/RMeRnDFSvleaRsu3BKOh9
   MbxXnvKPjnWJoK0rpPKTbLUx0CfzL67oCLpD5RGEBvkbjQLW7qaOjG3G2
   lB1+6nsAMM99dHD7I8PvHi8y4FUuwr9ZW/QYPT87Sg2qijHlYqRVGn3rA
   BxOJvTmr5dkySOJ4B1b1btsZHU56kpoGeGfOHCvOLX5BeqbUO3Bn7A6Aq
   Xac/F40b9HEMHbVrfsfLCjh+iJLPWVT9RfcZGOzoGEL+jEVhWKS9A4tIZ
   g==;
X-CSE-ConnectionGUID: icLCn+hnTCGY7hFt4Ki1WA==
X-CSE-MsgGUID: Z40SyeHBTmq2ok4jMKhLfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76775666"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76775666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:23:48 -0800
X-CSE-ConnectionGUID: bVDCZ3uqQ36NKn3sDWsISQ==
X-CSE-MsgGUID: LS1CUWuiTC+SsU/HCqwAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195479490"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 12:23:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5lI-00011r-1n;
	Mon, 17 Nov 2025 20:23:44 +0000
Date: Tue, 18 Nov 2025 04:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 43/55] include/linux/sunrpc/xdrgen/nfs3.h:12:8:
 error: expected identifier
Message-ID: <202511180421.r0lWoMQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   cd854fd564f91ff95890468a15e9f4418d8a2a1b
commit: ed8ca4fd1c9467f1ad1069cc0f0d9620a95ab900 [43/55] NFSD: Replace nfs3.h with nfs3xdr_gen.h
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251118/202511180421.r0lWoMQD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180421.r0lWoMQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180421.r0lWoMQD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:12:8: error: expected identifier
      12 | enum { NFS3_FHSIZE = 64 };
         |        ^
   include/uapi/linux/nfs3.h:13:22: note: expanded from macro 'NFS3_FHSIZE'
      13 | #define NFS3_FHSIZE             64
         |                                 ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:14:8: error: expected identifier
      14 | enum { NFS3_COOKIEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:16:29: note: expanded from macro 'NFS3_COOKIEVERFSIZE'
      16 | #define NFS3_COOKIEVERFSIZE     8
         |                                 ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:16:8: error: expected identifier
      16 | enum { NFS3_CREATEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:15:29: note: expanded from macro 'NFS3_CREATEVERFSIZE'
      15 | #define NFS3_CREATEVERFSIZE     8
         |                                 ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:18:8: error: expected identifier
      18 | enum { NFS3_WRITEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:17:28: note: expanded from macro 'NFS3_WRITEVERFSIZE'
      17 | #define NFS3_WRITEVERFSIZE      8
         |                                 ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:88:2: error: redefinition of enumerator 'NF3REG'
      88 |         NF3REG = 1,
         |         ^
   include/uapi/linux/nfs3.h:56:2: note: previous definition is here
      56 |         NF3REG  = 1,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:89:2: error: redefinition of enumerator 'NF3DIR'
      89 |         NF3DIR = 2,
         |         ^
   include/uapi/linux/nfs3.h:57:2: note: previous definition is here
      57 |         NF3DIR  = 2,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:90:2: error: redefinition of enumerator 'NF3BLK'
      90 |         NF3BLK = 3,
         |         ^
   include/uapi/linux/nfs3.h:58:2: note: previous definition is here
      58 |         NF3BLK  = 3,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:91:2: error: redefinition of enumerator 'NF3CHR'
      91 |         NF3CHR = 4,
         |         ^
   include/uapi/linux/nfs3.h:59:2: note: previous definition is here
      59 |         NF3CHR  = 4,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:92:2: error: redefinition of enumerator 'NF3LNK'
      92 |         NF3LNK = 5,
         |         ^
   include/uapi/linux/nfs3.h:60:2: note: previous definition is here
      60 |         NF3LNK  = 5,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:93:2: error: redefinition of enumerator 'NF3SOCK'
      93 |         NF3SOCK = 6,
         |         ^
   include/uapi/linux/nfs3.h:61:2: note: previous definition is here
      61 |         NF3SOCK = 6,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:94:2: error: redefinition of enumerator 'NF3FIFO'
      94 |         NF3FIFO = 7,
         |         ^
   include/uapi/linux/nfs3.h:62:2: note: previous definition is here
      62 |         NF3FIFO = 7,    /* changed from NFSv2 (was 8) */
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:161:2: error: redefinition of enumerator 'DONT_CHANGE'
     161 |         DONT_CHANGE = 0,
         |         ^
   include/uapi/linux/nfs3.h:67:2: note: previous definition is here
      67 |         DONT_CHANGE             = 0,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:162:2: error: redefinition of enumerator 'SET_TO_SERVER_TIME'
     162 |         SET_TO_SERVER_TIME = 1,
         |         ^
   include/uapi/linux/nfs3.h:68:2: note: previous definition is here
      68 |         SET_TO_SERVER_TIME      = 1,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   In file included from fs/nfsd/nfsd.h:23:
   In file included from fs/nfsd/nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:163:2: error: redefinition of enumerator 'SET_TO_CLIENT_TIME'
     163 |         SET_TO_CLIENT_TIME = 2,
         |         ^
   include/uapi/linux/nfs3.h:69:2: note: previous definition is here
      69 |         SET_TO_CLIENT_TIME      = 2,
         |         ^
   In file included from fs/nfsd/localio.c:21:
   fs/nfsd/nfsd.h:55:9: warning: 'NFS3_FSF_DEFAULT' macro redefined [-Wmacro-redefined]
      55 | #define NFS3_FSF_DEFAULT                0x001f
         |         ^
   include/uapi/linux/nfs3.h:50:9: note: previous definition is here
      50 | #define NFS3_FSF_DEFAULT        0x001B
         |         ^
   1 warning and 14 errors generated.
--
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:12:8: error: expected identifier
      12 | enum { NFS3_FHSIZE = 64 };
         |        ^
   include/uapi/linux/nfs3.h:13:22: note: expanded from macro 'NFS3_FHSIZE'
      13 | #define NFS3_FHSIZE             64
         |                                 ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:14:8: error: expected identifier
      14 | enum { NFS3_COOKIEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:16:29: note: expanded from macro 'NFS3_COOKIEVERFSIZE'
      16 | #define NFS3_COOKIEVERFSIZE     8
         |                                 ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:16:8: error: expected identifier
      16 | enum { NFS3_CREATEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:15:29: note: expanded from macro 'NFS3_CREATEVERFSIZE'
      15 | #define NFS3_CREATEVERFSIZE     8
         |                                 ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
   include/linux/sunrpc/xdrgen/nfs3.h:18:8: error: expected identifier
      18 | enum { NFS3_WRITEVERFSIZE = 8 };
         |        ^
   include/uapi/linux/nfs3.h:17:28: note: expanded from macro 'NFS3_WRITEVERFSIZE'
      17 | #define NFS3_WRITEVERFSIZE      8
         |                                 ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:88:2: error: redefinition of enumerator 'NF3REG'
      88 |         NF3REG = 1,
         |         ^
   include/uapi/linux/nfs3.h:56:2: note: previous definition is here
      56 |         NF3REG  = 1,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:89:2: error: redefinition of enumerator 'NF3DIR'
      89 |         NF3DIR = 2,
         |         ^
   include/uapi/linux/nfs3.h:57:2: note: previous definition is here
      57 |         NF3DIR  = 2,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:90:2: error: redefinition of enumerator 'NF3BLK'
      90 |         NF3BLK = 3,
         |         ^
   include/uapi/linux/nfs3.h:58:2: note: previous definition is here
      58 |         NF3BLK  = 3,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:91:2: error: redefinition of enumerator 'NF3CHR'
      91 |         NF3CHR = 4,
         |         ^
   include/uapi/linux/nfs3.h:59:2: note: previous definition is here
      59 |         NF3CHR  = 4,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:92:2: error: redefinition of enumerator 'NF3LNK'
      92 |         NF3LNK = 5,
         |         ^
   include/uapi/linux/nfs3.h:60:2: note: previous definition is here
      60 |         NF3LNK  = 5,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:93:2: error: redefinition of enumerator 'NF3SOCK'
      93 |         NF3SOCK = 6,
         |         ^
   include/uapi/linux/nfs3.h:61:2: note: previous definition is here
      61 |         NF3SOCK = 6,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:94:2: error: redefinition of enumerator 'NF3FIFO'
      94 |         NF3FIFO = 7,
         |         ^
   include/uapi/linux/nfs3.h:62:2: note: previous definition is here
      62 |         NF3FIFO = 7,    /* changed from NFSv2 (was 8) */
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:161:2: error: redefinition of enumerator 'DONT_CHANGE'
     161 |         DONT_CHANGE = 0,
         |         ^
   include/uapi/linux/nfs3.h:67:2: note: previous definition is here
      67 |         DONT_CHANGE             = 0,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:162:2: error: redefinition of enumerator 'SET_TO_SERVER_TIME'
     162 |         SET_TO_SERVER_TIME = 1,
         |         ^
   include/uapi/linux/nfs3.h:68:2: note: previous definition is here
      68 |         SET_TO_SERVER_TIME      = 1,
         |         ^
   In file included from localio.c:21:
   In file included from ./nfsd.h:23:
   In file included from ./nfs3xdr_gen.h:14:
>> include/linux/sunrpc/xdrgen/nfs3.h:163:2: error: redefinition of enumerator 'SET_TO_CLIENT_TIME'
     163 |         SET_TO_CLIENT_TIME = 2,
         |         ^
   include/uapi/linux/nfs3.h:69:2: note: previous definition is here
      69 |         SET_TO_CLIENT_TIME      = 2,
         |         ^
   In file included from localio.c:21:
   ./nfsd.h:55:9: warning: 'NFS3_FSF_DEFAULT' macro redefined [-Wmacro-redefined]
      55 | #define NFS3_FSF_DEFAULT                0x001f
         |         ^
   include/uapi/linux/nfs3.h:50:9: note: previous definition is here
      50 | #define NFS3_FSF_DEFAULT        0x001B
         |         ^
   1 warning and 14 errors generated.


vim +12 include/linux/sunrpc/xdrgen/nfs3.h

2b5b97ec0f7a48 Chuck Lever 2025-10-22   11  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @12  enum { NFS3_FHSIZE = 64 };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   13  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   14  enum { NFS3_COOKIEVERFSIZE = 8 };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   15  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   16  enum { NFS3_CREATEVERFSIZE = 8 };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   17  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @18  enum { NFS3_WRITEVERFSIZE = 8 };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   19  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   20  typedef u64 uint64;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   21  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   22  typedef s64 int64;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   23  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   24  typedef u32 uint32;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   25  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   26  typedef s32 int32;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   27  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   28  typedef string filename3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   29  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   30  typedef string nfspath3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   31  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   32  typedef uint64 fileid3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   33  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   34  typedef uint64 cookie3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   35  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   36  typedef u8 cookieverf3[NFS3_COOKIEVERFSIZE];
2b5b97ec0f7a48 Chuck Lever 2025-10-22   37  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   38  typedef u8 createverf3[NFS3_CREATEVERFSIZE];
2b5b97ec0f7a48 Chuck Lever 2025-10-22   39  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   40  typedef u8 writeverf3[NFS3_WRITEVERFSIZE];
2b5b97ec0f7a48 Chuck Lever 2025-10-22   41  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   42  typedef uint32 uid3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   43  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   44  typedef uint32 gid3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   45  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   46  typedef uint64 size3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   47  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   48  typedef uint64 offset3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   49  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   50  typedef uint32 mode3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   51  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   52  typedef uint32 count3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   53  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   54  enum nfsstat3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22   55  	NFS3_OK = 0,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   56  	NFS3ERR_PERM = 1,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   57  	NFS3ERR_NOENT = 2,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   58  	NFS3ERR_IO = 5,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   59  	NFS3ERR_NXIO = 6,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   60  	NFS3ERR_ACCES = 13,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   61  	NFS3ERR_EXIST = 17,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   62  	NFS3ERR_XDEV = 18,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   63  	NFS3ERR_NODEV = 19,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   64  	NFS3ERR_NOTDIR = 20,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   65  	NFS3ERR_ISDIR = 21,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   66  	NFS3ERR_INVAL = 22,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   67  	NFS3ERR_FBIG = 27,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   68  	NFS3ERR_NOSPC = 28,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   69  	NFS3ERR_ROFS = 30,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   70  	NFS3ERR_MLINK = 31,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   71  	NFS3ERR_NAMETOOLONG = 63,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   72  	NFS3ERR_NOTEMPTY = 66,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   73  	NFS3ERR_DQUOT = 69,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   74  	NFS3ERR_STALE = 70,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   75  	NFS3ERR_REMOTE = 71,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   76  	NFS3ERR_BADHANDLE = 10001,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   77  	NFS3ERR_NOT_SYNC = 10002,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   78  	NFS3ERR_BAD_COOKIE = 10003,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   79  	NFS3ERR_NOTSUPP = 10004,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   80  	NFS3ERR_TOOSMALL = 10005,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   81  	NFS3ERR_SERVERFAULT = 10006,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   82  	NFS3ERR_BADTYPE = 10007,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   83  	NFS3ERR_JUKEBOX = 10008,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   84  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   85  typedef __be32 nfsstat3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   86  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   87  enum ftype3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @88  	NF3REG = 1,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @89  	NF3DIR = 2,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @90  	NF3BLK = 3,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @91  	NF3CHR = 4,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @92  	NF3LNK = 5,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @93  	NF3SOCK = 6,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  @94  	NF3FIFO = 7,
2b5b97ec0f7a48 Chuck Lever 2025-10-22   95  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22   96  typedef enum ftype3 ftype3;
2b5b97ec0f7a48 Chuck Lever 2025-10-22   97  
2b5b97ec0f7a48 Chuck Lever 2025-10-22   98  struct specdata3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22   99  	uint32 specdata1;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  100  	uint32 specdata2;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  101  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  102  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  103  struct nfs_fh3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  104  	opaque data;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  105  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  106  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  107  struct nfstime3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  108  	uint32 seconds;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  109  	uint32 nseconds;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  110  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  111  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  112  struct fattr3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  113  	ftype3 type;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  114  	mode3 mode;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  115  	uint32 nlink;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  116  	uid3 uid;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  117  	gid3 gid;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  118  	size3 size;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  119  	size3 used;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  120  	struct specdata3 rdev;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  121  	uint64 fsid;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  122  	fileid3 fileid;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  123  	struct nfstime3 atime;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  124  	struct nfstime3 mtime;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  125  	struct nfstime3 ctime;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  126  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  127  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  128  struct post_op_attr {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  129  	bool attributes_follow;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  130  	union {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  131  		struct fattr3 attributes;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  132  	} u;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  133  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  134  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  135  struct wcc_attr {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  136  	size3 size;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  137  	struct nfstime3 mtime;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  138  	struct nfstime3 ctime;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  139  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  140  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  141  struct pre_op_attr {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  142  	bool attributes_follow;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  143  	union {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  144  		struct wcc_attr attributes;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  145  	} u;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  146  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  147  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  148  struct wcc_data {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  149  	struct pre_op_attr before;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  150  	struct post_op_attr after;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  151  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  152  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  153  struct post_op_fh3 {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  154  	bool handle_follows;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  155  	union {
2b5b97ec0f7a48 Chuck Lever 2025-10-22  156  		struct nfs_fh3 handle;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  157  	} u;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  158  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  159  
2b5b97ec0f7a48 Chuck Lever 2025-10-22  160  enum time_how {
2b5b97ec0f7a48 Chuck Lever 2025-10-22 @161  	DONT_CHANGE = 0,
2b5b97ec0f7a48 Chuck Lever 2025-10-22 @162  	SET_TO_SERVER_TIME = 1,
2b5b97ec0f7a48 Chuck Lever 2025-10-22 @163  	SET_TO_CLIENT_TIME = 2,
2b5b97ec0f7a48 Chuck Lever 2025-10-22  164  };
2b5b97ec0f7a48 Chuck Lever 2025-10-22  165  typedef enum time_how time_how;
2b5b97ec0f7a48 Chuck Lever 2025-10-22  166  

:::::: The code at line 12 was first introduced by commit
:::::: 2b5b97ec0f7a484e81bedf71e223f38b0feb98ca Documentation: Add the RPC language description of NFSv3

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
