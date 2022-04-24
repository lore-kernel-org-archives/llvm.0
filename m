Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51517C
	for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650802720; x=1682338720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Smja3cESWvlAl4n8R3rbzWm82fuaiRZnP25Mx/Zgedw=;
  b=ZpWYj1zCOah9rAl6VNZNRjS8asqGkzFJ6x2AvauzWg/RVVdL3nem6HcO
   V/MBkjoci+vudNCLSiQCJGwELYPmt81dWDdPEhiXGIOC2YzlMEyNc7Voi
   Vq1XDN9YfTBJCh+bkpnZnNUmX/k0PLD4eOtwf8FPTqkvQtLiMXdBiE35c
   PeerzJHFrXY4HEQojJqe+4LPxfBGBPVbJG3wcXle6GIr7enpuA1P6B6bo
   lDc26yUEyYpvxY4z+/1tRfAsF4NM4nKtIgvxCByifiekm+g5fi5BS2T67
   RtJiq9pH72o0xOfBkFq9XNY0VLEfvZhEUy2tEkbQUzE3x/SYR1thEkkjr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="244965914"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="244965914"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 05:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="729271614"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Apr 2022 05:18:38 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nibCH-0001QN-PL;
	Sun, 24 Apr 2022 12:18:37 +0000
Date: Sun, 24 Apr 2022 20:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v21 2/7] NFSD: add support for share reservation
 conflict to courteous server
Message-ID: <202204242040.x20oF5fR-lkp@intel.com>
References: <1650739455-26096-3-git-send-email-dai.ngo@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650739455-26096-3-git-send-email-dai.ngo@oracle.com>

Hi Dai,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dai-Ngo/NFSD-Initial-implementation-of-NFSv4-Courteous-Server/20220424-024653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 45ab9400e73f34103e73c18a73280c9aa1650e98
config: s390-randconfig-c005-20220424 (https://download.01.org/0day-ci/archive/20220424/202204242040.x20oF5fR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1d73d8e1a14e5e742fe00605d515a338af7af59b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dai-Ngo/NFSD-Initial-implementation-of-NFSv4-Courteous-Server/20220424-024653
        git checkout 1d73d8e1a14e5e742fe00605d515a338af7af59b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   In file included from fs/nfsd/nfs4state.c:42:
   In file included from include/linux/sunrpc/svcauth_gss.h:14:
   include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> fs/nfsd/nfs4state.c:5056:22: warning: variable 'clp' set but not used [-Wunused-but-set-variable]
           struct nfs4_client *clp;
                               ^
   16 warnings generated.


vim +/clp +5056 fs/nfsd/nfs4state.c

  5046	
  5047	static __be32 nfs4_get_vfs_file(struct svc_rqst *rqstp, struct nfs4_file *fp,
  5048			struct svc_fh *cur_fh, struct nfs4_ol_stateid *stp,
  5049			struct nfsd4_open *open, bool new_stp)
  5050	{
  5051		struct nfsd_file *nf = NULL;
  5052		__be32 status;
  5053		int oflag = nfs4_access_to_omode(open->op_share_access);
  5054		int access = nfs4_access_to_access(open->op_share_access);
  5055		unsigned char old_access_bmap, old_deny_bmap;
> 5056		struct nfs4_client *clp;
  5057	
  5058		spin_lock(&fp->fi_lock);
  5059	
  5060		/*
  5061		 * Are we trying to set a deny mode that would conflict with
  5062		 * current access?
  5063		 */
  5064		status = nfs4_file_check_deny(fp, open->op_share_deny);
  5065		if (status != nfs_ok) {
  5066			if (status != nfserr_share_denied) {
  5067				spin_unlock(&fp->fi_lock);
  5068				goto out;
  5069			}
  5070			clp = stp->st_stid.sc_client;
  5071			if (nfs4_resolve_deny_conflicts_locked(fp, new_stp,
  5072					stp, open->op_share_deny, false))
  5073				status = nfserr_jukebox;
  5074			spin_unlock(&fp->fi_lock);
  5075			goto out;
  5076		}
  5077	
  5078		/* set access to the file */
  5079		status = nfs4_file_get_access(fp, open->op_share_access);
  5080		if (status != nfs_ok) {
  5081			if (status != nfserr_share_denied) {
  5082				spin_unlock(&fp->fi_lock);
  5083				goto out;
  5084			}
  5085			clp = stp->st_stid.sc_client;
  5086			if (nfs4_resolve_deny_conflicts_locked(fp, new_stp,
  5087					stp, open->op_share_access, true))
  5088				status = nfserr_jukebox;
  5089			spin_unlock(&fp->fi_lock);
  5090			goto out;
  5091		}
  5092	
  5093		/* Set access bits in stateid */
  5094		old_access_bmap = stp->st_access_bmap;
  5095		set_access(open->op_share_access, stp);
  5096	
  5097		/* Set new deny mask */
  5098		old_deny_bmap = stp->st_deny_bmap;
  5099		set_deny(open->op_share_deny, stp);
  5100		fp->fi_share_deny |= (open->op_share_deny & NFS4_SHARE_DENY_BOTH);
  5101	
  5102		if (!fp->fi_fds[oflag]) {
  5103			spin_unlock(&fp->fi_lock);
  5104			status = nfsd_file_acquire(rqstp, cur_fh, access, &nf);
  5105			if (status)
  5106				goto out_put_access;
  5107			spin_lock(&fp->fi_lock);
  5108			if (!fp->fi_fds[oflag]) {
  5109				fp->fi_fds[oflag] = nf;
  5110				nf = NULL;
  5111			}
  5112		}
  5113		spin_unlock(&fp->fi_lock);
  5114		if (nf)
  5115			nfsd_file_put(nf);
  5116	
  5117		status = nfserrno(nfsd_open_break_lease(cur_fh->fh_dentry->d_inode,
  5118									access));
  5119		if (status)
  5120			goto out_put_access;
  5121	
  5122		status = nfsd4_truncate(rqstp, cur_fh, open);
  5123		if (status)
  5124			goto out_put_access;
  5125	out:
  5126		return status;
  5127	out_put_access:
  5128		stp->st_access_bmap = old_access_bmap;
  5129		nfs4_file_put_access(fp, open->op_share_access);
  5130		reset_union_bmap_deny(bmap_to_share_mode(old_deny_bmap), stp);
  5131		goto out;
  5132	}
  5133	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
