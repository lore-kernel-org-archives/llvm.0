Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA762C96
	for <llvm@lists.linux.dev>; Sat,  6 Nov 2021 22:26:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10160"; a="219271286"
X-IronPort-AV: E=Sophos;i="5.87,215,1631602800"; 
   d="gz'50?scan'50,208,50";a="219271286"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2021 15:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,215,1631602800"; 
   d="gz'50?scan'50,208,50";a="490729252"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2021 15:26:26 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mjU8n-0009km-6H; Sat, 06 Nov 2021 22:26:25 +0000
Date: Sun, 7 Nov 2021 06:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Lemon <jonathan.lemon@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 15/18] ptp: ocp: Enable 4th timestamper / PPS
 generator
Message-ID: <202111070619.WB99CFaU-lkp@intel.com>
References: <20210915021636.153754-16-jonathan.lemon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20210915021636.153754-16-jonathan.lemon@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net/master]
[also build test WARNING on horms-ipvs/master v5.15]
[cannot apply to net-next/master linus/master next-20211106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Lemon/timecard-updates-for-v13-firmware/20210929-111346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 4ccb9f03fee7b20484187ba7e25a7b9b79fe63d5
config: i386-randconfig-a001-20210928 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e0ae415a29dcf1eaa46cf3ffde625d87339216b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Lemon/timecard-updates-for-v13-firmware/20210929-111346
        git checkout e0ae415a29dcf1eaa46cf3ffde625d87339216b7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_ocp.c:2000:16: warning: operator '?:' has lower precedence than '&'; '&' will be evaluated first [-Wbitwise-conditional-parentheses]
                              on & map ? " ON" : "OFF", src);
                              ~~~~~~~~ ^
   drivers/ptp/ptp_ocp.c:2000:16: note: place parentheses around the '&' expression to silence this warning
                              on & map ? " ON" : "OFF", src);
                                       ^
                              (       )
   drivers/ptp/ptp_ocp.c:2000:16: note: place parentheses around the '?:' expression to evaluate it first
                              on & map ? " ON" : "OFF", src);
                                       ^
                                   (                  )
   drivers/ptp/ptp_ocp.c:2004:16: warning: operator '?:' has lower precedence than '&'; '&' will be evaluated first [-Wbitwise-conditional-parentheses]
                              on & map ? " ON" : "OFF", src);
                              ~~~~~~~~ ^
   drivers/ptp/ptp_ocp.c:2004:16: note: place parentheses around the '&' expression to silence this warning
                              on & map ? " ON" : "OFF", src);
                                       ^
                              (       )
   drivers/ptp/ptp_ocp.c:2004:16: note: place parentheses around the '?:' expression to evaluate it first
                              on & map ? " ON" : "OFF", src);
                                       ^
                                   (                  )
   2 warnings generated.


vim +2000 drivers/ptp/ptp_ocp.c

  1934	
  1935	static int
  1936	ptp_ocp_summary_show(struct seq_file *s, void *data)
  1937	{
  1938		struct device *dev = s->private;
  1939		struct ptp_system_timestamp sts;
  1940		u32 sma_in, sma_out, ctrl, val;
  1941		struct ts_reg __iomem *ts_reg;
  1942		struct timespec64 ts;
  1943		struct ptp_ocp *bp;
  1944		const char *src;
  1945		bool on, map;
  1946		char *buf;
  1947	
  1948		buf = (char *)__get_free_page(GFP_KERNEL);
  1949		if (!buf)
  1950			return -ENOMEM;
  1951	
  1952		bp = dev_get_drvdata(dev);
  1953		sma_in = ioread32(&bp->sma->gpio1);
  1954		sma_out = ioread32(&bp->sma->gpio2);
  1955	
  1956		seq_printf(s, "%7s: /dev/ptp%d\n", "PTP", ptp_clock_index(bp->ptp));
  1957	
  1958		sma1_show(dev, NULL, buf);
  1959		seq_printf(s, "   sma1: %s", buf);
  1960	
  1961		sma2_show(dev, NULL, buf);
  1962		seq_printf(s, "   sma2: %s", buf);
  1963	
  1964		sma3_show(dev, NULL, buf);
  1965		seq_printf(s, "   sma3: %s", buf);
  1966	
  1967		sma4_show(dev, NULL, buf);
  1968		seq_printf(s, "   sma4: %s", buf);
  1969	
  1970		if (bp->ts0) {
  1971			ts_reg = bp->ts0->mem;
  1972			on = ioread32(&ts_reg->enable);
  1973			src = "GNSS";
  1974			seq_printf(s, "%7s: %s, src: %s\n", "TS0",
  1975				   on ? " ON" : "OFF", src);
  1976		}
  1977	
  1978		if (bp->ts1) {
  1979			ts_reg = bp->ts1->mem;
  1980			on = ioread32(&ts_reg->enable);
  1981			src = gpio_map(sma_in, 2, "sma1", "sma2", "----");
  1982			seq_printf(s, "%7s: %s, src: %s\n", "TS1",
  1983				   on ? " ON" : "OFF", src);
  1984		}
  1985	
  1986		if (bp->ts2) {
  1987			ts_reg = bp->ts2->mem;
  1988			on = ioread32(&ts_reg->enable);
  1989			src = gpio_map(sma_in, 3, "sma1", "sma2", "----");
  1990			seq_printf(s, "%7s: %s, src: %s\n", "TS2",
  1991				   on ? " ON" : "OFF", src);
  1992		}
  1993	
  1994		if (bp->pps) {
  1995			ts_reg = bp->pps->mem;
  1996			src = "PHC";
  1997			on = ioread32(&ts_reg->enable);
  1998			map = !!(bp->pps_req_map & OCP_REQ_TIMESTAMP);
  1999			seq_printf(s, "%7s: %s, src: %s\n", "TS3",
> 2000				   on & map ? " ON" : "OFF", src);
  2001	
  2002			map = !!(bp->pps_req_map & OCP_REQ_PPS);
  2003			seq_printf(s, "%7s: %s, src: %s\n", "PPS",
  2004				   on & map ? " ON" : "OFF", src);
  2005		}
  2006	
  2007		if (bp->irig_out) {
  2008			ctrl = ioread32(&bp->irig_out->ctrl);
  2009			on = ctrl & IRIG_M_CTRL_ENABLE;
  2010			val = ioread32(&bp->irig_out->status);
  2011			gpio_multi_map(buf, sma_out, 4, "sma3", "sma4", "----");
  2012			seq_printf(s, "%7s: %s, error: %d, mode %d, out: %s\n", "IRIG",
  2013				   on ? " ON" : "OFF", val, (ctrl >> 16), buf);
  2014		}
  2015	
  2016		if (bp->irig_in) {
  2017			on = ioread32(&bp->irig_in->ctrl) & IRIG_S_CTRL_ENABLE;
  2018			val = ioread32(&bp->irig_in->status);
  2019			src = gpio_map(sma_in, 4, "sma1", "sma2", "----");
  2020			seq_printf(s, "%7s: %s, error: %d, src: %s\n", "IRIG in",
  2021				   on ? " ON" : "OFF", val, src);
  2022		}
  2023	
  2024		if (bp->dcf_out) {
  2025			on = ioread32(&bp->dcf_out->ctrl) & DCF_M_CTRL_ENABLE;
  2026			val = ioread32(&bp->dcf_out->status);
  2027			gpio_multi_map(buf, sma_out, 5, "sma3", "sma4", "----");
  2028			seq_printf(s, "%7s: %s, error: %d, out: %s\n", "DCF",
  2029				   on ? " ON" : "OFF", val, buf);
  2030		}
  2031	
  2032		if (bp->dcf_in) {
  2033			on = ioread32(&bp->dcf_in->ctrl) & DCF_S_CTRL_ENABLE;
  2034			val = ioread32(&bp->dcf_in->status);
  2035			src = gpio_map(sma_in, 5, "sma1", "sma2", "----");
  2036			seq_printf(s, "%7s: %s, error: %d, src: %s\n", "DCF in",
  2037				   on ? " ON" : "OFF", val, src);
  2038		}
  2039	
  2040		if (bp->nmea_out) {
  2041			on = ioread32(&bp->nmea_out->ctrl) & 1;
  2042			val = ioread32(&bp->nmea_out->status);
  2043			seq_printf(s, "%7s: %s, error: %d\n", "NMEA",
  2044				   on ? " ON" : "OFF", val);
  2045		}
  2046	
  2047		/* compute src for PPS1, used below. */
  2048		if (bp->pps_select) {
  2049			val = ioread32(&bp->pps_select->gpio1);
  2050			if (val & 0x01)
  2051				src = gpio_map(sma_in, 0, "sma1", "sma2", "----");
  2052			else if (val & 0x02)
  2053				src = "MAC";
  2054			else if (val & 0x04)
  2055				src = "GNSS";
  2056			else
  2057				src = "----";
  2058		} else {
  2059			src = "?";
  2060		}
  2061	
  2062		/* assumes automatic switchover/selection */
  2063		val = ioread32(&bp->reg->select);
  2064		switch (val >> 16) {
  2065		case 0:
  2066			sprintf(buf, "----");
  2067			break;
  2068		case 2:
  2069			sprintf(buf, "IRIG");
  2070			break;
  2071		case 3:
  2072			sprintf(buf, "%s via PPS1", src);
  2073			break;
  2074		case 6:
  2075			sprintf(buf, "DCF");
  2076			break;
  2077		default:
  2078			strcpy(buf, "unknown");
  2079			break;
  2080		}
  2081		val = ioread32(&bp->reg->status);
  2082		seq_printf(s, "%7s: %s, state: %s\n", "PHC src", buf,
  2083			   val & OCP_STATUS_IN_SYNC ? "sync" : "unsynced");
  2084	
  2085		/* reuses PPS1 src from earlier */
  2086		seq_printf(s, "MAC PPS1 src: %s\n", src);
  2087	
  2088		src = gpio_map(sma_in, 1, "sma1", "sma2", "GNSS2");
  2089		seq_printf(s, "MAC PPS2 src: %s\n", src);
  2090	
  2091		if (!ptp_ocp_gettimex(&bp->ptp_info, &ts, &sts)) {
  2092			struct timespec64 sys_ts;
  2093			s64 pre_ns, post_ns, ns;
  2094	
  2095			pre_ns = timespec64_to_ns(&sts.pre_ts);
  2096			post_ns = timespec64_to_ns(&sts.post_ts);
  2097			ns = (pre_ns + post_ns) / 2;
  2098			ns += (s64)bp->utc_tai_offset * NSEC_PER_SEC;
  2099			sys_ts = ns_to_timespec64(ns);
  2100	
  2101			seq_printf(s, "%7s: %lld.%ld == %ptT TAI\n", "PHC",
  2102				   ts.tv_sec, ts.tv_nsec, &ts);
  2103			seq_printf(s, "%7s: %lld.%ld == %ptT UTC offset %d\n", "SYS",
  2104				   sys_ts.tv_sec, sys_ts.tv_nsec, &sys_ts,
  2105				   bp->utc_tai_offset);
  2106			seq_printf(s, "%7s: PHC:SYS offset: %lld  window: %lld\n", "",
  2107				   timespec64_to_ns(&ts) - ns,
  2108				   post_ns - pre_ns);
  2109		}
  2110	
  2111		free_page((unsigned long)buf);
  2112		return 0;
  2113	}
  2114	DEFINE_SHOW_ATTRIBUTE(ptp_ocp_summary);
  2115	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ew6BAiZeqk4r7MaW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ew6BAiZeqk4r7MaW--
