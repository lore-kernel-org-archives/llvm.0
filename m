Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855E156F0;
	Thu,  4 May 2023 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683235195; x=1714771195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X92Z7gdtM+WgD4qIa4/IpgYUx5rqz7jZXGPqKofXNuE=;
  b=jHKq7RvJ1AKOXtjIxoGurh3bWAlaUbiu1/wpDifGVULWZf+B6fjYZKh+
   boDtUMMcpSRPxx9f3ZhLfBzwhPfr8lDq4hRdnGccPWPorUqLCMqKBDPkJ
   r2k0LumzC5adhXzOlqo92MFRZs+ktubuDZwJwzuL5uFSwB2UzWk+9xgWs
   v23ONe54Oe5/ss3S8SyY3uYcWDVYZKUgZ1jomaSDj2hxHiPGvGl39oCNi
   luLP/PhsVMLYv6hiViI50IAQgeFXFElNQjz2wBspZfvUU7oUwZpUiaO/G
   kfM7gTPGsxLZ2Byi0Y9yItdFpEjxoTfvdhbRrk8n4N/mUIU5PXOS2zVMc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="351186039"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="351186039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 14:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808913277"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="808913277"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 14:19:52 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pugMh-000092-3D;
	Thu, 04 May 2023 21:19:51 +0000
Date: Fri, 5 May 2023 05:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 21/28] drivers/cxl/core/port.c:1954:6: warning: no
 previous prototype for function 'combine_coordinates'
Message-ID: <202305050500.L5ewigqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: 46b815fc52e80858ee81a840739850c6bd9bc78d [21/28] cxl: Add helper function that calculate performance data for downstream ports
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230505/202305050500.L5ewigqr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=46b815fc52e80858ee81a840739850c6bd9bc78d
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 46b815fc52e80858ee81a840739850c6bd9bc78d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050500.L5ewigqr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/port.c:1954:6: warning: no previous prototype for function 'combine_coordinates' [-Wmissing-prototypes]
   void combine_coordinates(struct access_coordinate *c1, struct access_coordinate *c2)
        ^
   drivers/cxl/core/port.c:1954:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void combine_coordinates(struct access_coordinate *c1, struct access_coordinate *c2)
   ^
   static 
   1 warning generated.
--
>> drivers/cxl/core/port.c:1979: warning: expecting prototype for cxl_port_get_perf_coordinates(). Prototype was for cxl_endpoint_get_perf_coordinates() instead


vim +/combine_coordinates +1954 drivers/cxl/core/port.c

  1953	
> 1954	void combine_coordinates(struct access_coordinate *c1, struct access_coordinate *c2)
  1955	{
  1956			if (c2->write_bandwidth)
  1957				c1->write_bandwidth = min_t(unsigned int,
  1958							    c1->write_bandwidth,
  1959							    c2->write_bandwidth);
  1960			c1->write_latency += c2->write_latency;
  1961	
  1962			if (c2->read_bandwidth)
  1963				c1->read_bandwidth = min_t(unsigned int,
  1964							   c1->read_bandwidth,
  1965							   c2->read_bandwidth);
  1966			c1->read_latency += c2->read_latency;
  1967	}
  1968	
  1969	/**
  1970	 * cxl_port_get_perf_coordinates - Retrieve performance numbers stored in dports
  1971	 *				   of CXL path
  1972	 * @port: endpoint cxl_port
  1973	 * @coord: output performance data
  1974	 *
  1975	 * Return: errno on failure, 0 on success.
  1976	 */
  1977	int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
  1978					      struct access_coordinate *coord)
> 1979	{
  1980		struct access_coordinate c = {
  1981			.read_bandwidth = UINT_MAX,
  1982			.write_bandwidth = UINT_MAX,
  1983		};
  1984		struct cxl_port *iter = port;
  1985		struct cxl_dport *dport;
  1986		struct pci_dev *pdev;
  1987		unsigned int bw;
  1988	
  1989		if (!is_cxl_endpoint(port))
  1990			return -EINVAL;
  1991	
  1992		dport = iter->parent_dport;
  1993		while (iter && !is_cxl_root(iter)) {
  1994			combine_coordinates(&c, &dport->coord);
  1995			c.write_latency += dport->link_latency;
  1996			c.read_latency += dport->link_latency;
  1997	
  1998			if (dport->genport_coord)
  1999				combine_coordinates(&c, dport->genport_coord);
  2000	
  2001			iter = to_cxl_port(iter->dev.parent);
  2002			dport = iter->parent_dport;
  2003		}
  2004	
  2005		/* Get the calculated PCI paths bandwidth */
  2006		pdev = to_pci_dev(port->uport->parent);
  2007		bw = pcie_bandwidth_available(pdev, NULL, NULL, NULL);
  2008		if (bw == 0)
  2009			return -ENXIO;
  2010		bw /= BITS_PER_BYTE;
  2011	
  2012		c.write_bandwidth = min_t(unsigned int, c.write_bandwidth, bw);
  2013		c.read_bandwidth = min_t(unsigned int, c.read_bandwidth, bw);
  2014	
  2015		*coord = c;
  2016	
  2017		return 0;
  2018	}
  2019	EXPORT_SYMBOL_NS_GPL(cxl_endpoint_get_perf_coordinates, CXL);
  2020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
