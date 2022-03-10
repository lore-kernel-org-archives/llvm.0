Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A157A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646896419; x=1678432419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ernpgFyeVBaec0j6i1p29XPpb2BWKA2H3QhtbjZW8c=;
  b=US/WuWJYNvD36MuEPxUOBSsPkqCHTwFbH5EFF53gc2V9gn8PSG/QeSN1
   PJ55s9AHy1GvH4sIokDy44UyxJLsH8eBKe2B0PmfjK2Ui0fqrYEKKjx84
   sX6+7jBZPZGSqQ0EnsIuf9wDpmdPSDbpfjk8rvl19zZHLfBw7MVvxM2mW
   ynh9XaLJ4Ewdb9shbQBq21F7QoOc8ZGqUMx2vbBGRWBtahxM64buyz+nA
   TGUrUJplW1k07YnBJ7DdSHxGtz0mEAX19yRyeDy7txLWX06RDJ+i3J4vp
   syoQJyhLx7QGfY2XKWP66gy4DuBGbe2jH8Mce+kzPTcG7IxthkwfjQD8H
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341607073"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="341607073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 23:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="712252760"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 23:13:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSCzP-0004WM-LZ; Thu, 10 Mar 2022 07:13:35 +0000
Date: Thu, 10 Mar 2022 15:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-courteous-server 39/39] fs/nfsd/nfs4state.c:2460:60:
 warning: format specifies type 'long' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <202203101509.pWJbkMAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-courteous-server
head:   25cf03b50a8a38217a4e1a9b178af4d9afa2b9ea
commit: 25cf03b50a8a38217a4e1a9b178af4d9afa2b9ea [39/39] NFSD: Show state of courtesy clients in client info
config: arm-colibri_pxa270_defconfig (https://download.01.org/0day-ci/archive/20220310/202203101509.pWJbkMAO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=25cf03b50a8a38217a4e1a9b178af4d9afa2b9ea
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel nfsd-courteous-server
        git checkout 25cf03b50a8a38217a4e1a9b178af4d9afa2b9ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/nfsd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:2460:60: warning: format specifies type 'long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
           seq_printf(m, "time since last renew: %02ld:%02d:%02d\n", hrs, mins, secs);
                                                 ~~~~~               ^~~
                                                 %02llu
   1 warning generated.


vim +2460 fs/nfsd/nfs4state.c

  2437	
  2438	static int client_info_show(struct seq_file *m, void *v)
  2439	{
  2440		struct inode *inode = m->private;
  2441		struct nfs4_client *clp;
  2442		u64 clid, hrs;
  2443		u32 mins, secs;
  2444	
  2445		clp = get_nfsdfs_clp(inode);
  2446		if (!clp)
  2447			return -ENXIO;
  2448		memcpy(&clid, &clp->cl_clientid, sizeof(clid));
  2449		seq_printf(m, "clientid: 0x%llx\n", clid);
  2450		seq_printf(m, "address: \"%pISpc\"\n", (struct sockaddr *)&clp->cl_addr);
  2451		if (test_bit(NFSD4_CLIENT_CONFIRMED, &clp->cl_flags))
  2452			seq_puts(m, "status: confirmed\n");
  2453		else
  2454			seq_puts(m, "status: unconfirmed\n");
  2455		seq_printf(m, "courtesy client: %s\n",
  2456			test_bit(NFSD4_CLIENT_COURTESY, &clp->cl_flags) ? "yes" : "no");
  2457		hrs = div_u64_rem(ktime_get_boottime_seconds() - clp->cl_time,
  2458					3600, &secs);
  2459		mins = div_u64_rem((u64)secs, 60, &secs);
> 2460		seq_printf(m, "time since last renew: %02ld:%02d:%02d\n", hrs, mins, secs);
  2461		seq_printf(m, "name: ");
  2462		seq_quote_mem(m, clp->cl_name.data, clp->cl_name.len);
  2463		seq_printf(m, "\nminor version: %d\n", clp->cl_minorversion);
  2464		if (clp->cl_nii_domain.data) {
  2465			seq_printf(m, "Implementation domain: ");
  2466			seq_quote_mem(m, clp->cl_nii_domain.data,
  2467						clp->cl_nii_domain.len);
  2468			seq_printf(m, "\nImplementation name: ");
  2469			seq_quote_mem(m, clp->cl_nii_name.data, clp->cl_nii_name.len);
  2470			seq_printf(m, "\nImplementation time: [%lld, %ld]\n",
  2471				clp->cl_nii_time.tv_sec, clp->cl_nii_time.tv_nsec);
  2472		}
  2473		seq_printf(m, "callback state: %s\n", cb_state2str(clp->cl_cb_state));
  2474		seq_printf(m, "callback address: %pISpc\n", &clp->cl_cb_conn.cb_addr);
  2475		drop_client(clp);
  2476	
  2477		return 0;
  2478	}
  2479	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
