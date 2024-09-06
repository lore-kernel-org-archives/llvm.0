Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C52F855;
	Fri,  6 Sep 2024 03:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594967; cv=none; b=du7K2aGmZ38y5wH9x6Oeh5mOJrOIOzV4etLz5HqmJOlDMXukLsgyeGLxUt4NjKhn23USc68PglEEbuciJT1JqP8GnO/6aUH2cr6E+NNN7JTSjIV5CUu7hBbYSywJWpinrBRroyCiGs4nwIxfqQiOKB5T90Rwye+PInWkbc9nuEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594967; c=relaxed/simple;
	bh=nmZ4pS8yU5IUmH5chtGorIYivQHHPDiMwQwGAsYtDQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lIXsHTpG8VsMk484I4r3/a5nhrDV4uOwLxGm5ysrkuAWd4gJzd2YoVzGa1HFMhbyittAeG7camO8A45xemDGUh70FiP9XYPvfDxq3mf2DsuuWeB2W4CGkvnlA230hMp6FGn4B6hW6wS5bqw/K9qqM5D3ElBrh7347o41xBwJ7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgvjMery; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgvjMery"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725594966; x=1757130966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmZ4pS8yU5IUmH5chtGorIYivQHHPDiMwQwGAsYtDQc=;
  b=lgvjMeryIkJekjPyhrmSShkC/dAzPgbqh1ZfpwOLDHQVxh3lbgvvJFVn
   6JVi7oCNgXjCwrA43/z+YTXOKobfRWBZYlWXtwkuwNXNyXxwUh74oVvBv
   Raz/R225GFZvIVew/OaSwkYJ8EsDaUuLvFOj3zn0A6mrgt47Bs6+8/NAs
   28y8Zv1K6dnmwdJFdaNOZIcvUHcYcpHMLdshFrFFtW/9Ovvq8Dy0hFaOm
   ndiQskd3YIwutT2wiJP2FlzWuhHFFRBpsAX8l/iLF/0CBHeWP/QBvFu82
   WMiIuT1PGLiGMlP4TAwDZHYUctmLa2acQCeksIHoL+8z8YjOvZI1On5Hy
   A==;
X-CSE-ConnectionGUID: tveVXPIpQKWs/2wqDaRXLg==
X-CSE-MsgGUID: FoENY3+YQvatf1LiPDTiDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23849515"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="23849515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:56:03 -0700
X-CSE-ConnectionGUID: jEpw3xpSSr68K6mVXDxtdw==
X-CSE-MsgGUID: 775FaP0KT8G66U/mrt2s1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="96548775"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2024 20:56:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQ4l-000AaU-20;
	Fri, 06 Sep 2024 03:55:59 +0000
Date: Fri, 6 Sep 2024 11:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-TDM-spit-2024-09-05 13/15]
 sound/soc/generic/simple-card-utils.c:1090:2: error: expected expression
Message-ID: <202409061149.8R3krElg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-TDM-spit-2024-09-05
head:   f2dc6deeba0553cf79ecb30e76e88ea593f3124b
commit: 8c7603aac45dda53bd582adf8e220cc959fc391b [13/15] ASoC: simple-card-utils: cleanup graph_get_dai_id()
config: arm64-randconfig-002-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061149.8R3krElg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061149.8R3krElg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061149.8R3krElg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/simple-card-utils.c:1090:2: error: expected expression
    1090 |         struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
         |         ^
>> sound/soc/generic/simple-card-utils.c:1093:25: error: use of undeclared identifier 'node'
    1093 |         for_each_of_graph_port(node, port) {
         |                                ^
>> sound/soc/generic/simple-card-utils.c:1093:25: error: use of undeclared identifier 'node'
   3 errors generated.


vim +1090 sound/soc/generic/simple-card-utils.c

  1027	
  1028	static int graph_get_dai_id(struct device_node *ep)
  1029	{
  1030		int i, id;
  1031		int ret;
  1032	
  1033		/*
  1034		 * For example HDMI case, it has video/sound ports,
  1035		 * thus ALSA SoC need to adjust for it.
  1036		 *
  1037		 * HDMI-Sound driver should support .of_xlate_dai_id callback,
  1038		 * and indicate specified DAI ID
  1039		 */
  1040		ret = snd_soc_get_dai_id(ep);
  1041		if (ret != -ENOTSUPP)
  1042			return ret;
  1043	
  1044		/*
  1045		 * [snd_soc_dai_driver] and [Of-Graph port] relationship
  1046		 *
  1047		 * static struct snd_soc_dai_driver xxx_dais[] = {
  1048		 *	{
  1049		 *		this DAI is handled as "port@0"
  1050		 *	},
  1051		 *	{
  1052		 *		this DAI is handled as "port@1"
  1053		 *	},
  1054		 *	...
  1055		 * };
  1056		 *
  1057		 * driver {
  1058		 *	ports {
  1059		 *		port@0 {
  1060		 *			reg = <0>;
  1061		 *			...
  1062		 *		};
  1063		 *		port@1 {
  1064		 *			reg = <1>;
  1065		 *			...
  1066		 *		};
  1067		 *		...
  1068		 *	};
  1069		 * };
  1070		 */
  1071	
  1072		/*
  1073		 * Because having "reg" was not so strict requested before on DT, some DT might not have it.
  1074		 * Let's check and use it if exist, otherwise it will count "port".
  1075		 */
  1076		struct device_node *port __free(device_node) = of_get_parent(ep);
  1077	
  1078		ret = of_property_present(port, "reg");
  1079		if (!ret)
  1080			goto count_port;
  1081	
  1082		of_property_read_u32(port, "reg", &id);
  1083	
  1084		return id;
  1085	
  1086	count_port:
  1087		/*
  1088		 * Non HDMI sound case, counting port on its DT is enough. Let's count it.
  1089		 */
> 1090		struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
  1091		i = 0;
  1092		id = -ENODEV;
> 1093		for_each_of_graph_port(node, port) {
  1094			for_each_of_graph_port_endpoint(port, endpoint) {
  1095				if (endpoint == ep) {
  1096					id = i;
  1097					goto end_of_loop;
  1098				}
  1099			}
  1100			i++;
  1101		}
  1102	end_of_loop:
  1103	
  1104		return id;
  1105	}
  1106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
