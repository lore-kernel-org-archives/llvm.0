Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9C25A63A;
	Fri, 17 Jan 2025 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094438; cv=none; b=I+SI+sUFYqM83NbQ8KBnPK45NqPrr5mdaJsTDFAb1YiT/Y7722Ce7sq27FRHwPs50HNS7/k9P0OCPZNZQeE1M/XuA1zhdNi3awswiwsvbHCTWL1HJDcDnKFataV4gGUYmnL0r7nwciM7b0ZOvEYTeGr19tHYtcRvB/ay6L9Ts5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094438; c=relaxed/simple;
	bh=BiEyDaFX463Z0lzGRKp+wfcfAnK8tEANm6dcp2hGIeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFoTRxyA5ymiIwbkF/0Hi9ecYrpcK6gVWnx9SylGwPZvSlx/F1qJEtqTHMxFK2rqyEPAFNnMW8IRwg6uNgXemKc2K11mqotbrxCtIQRFZ5jFlL+8aQOvwQwQXN4CuVXlxK+SsCJZKexZjmSEvgCUHVbfWGQLSJJpqfP96KG4ef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW5utrLY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW5utrLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737094437; x=1768630437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiEyDaFX463Z0lzGRKp+wfcfAnK8tEANm6dcp2hGIeM=;
  b=NW5utrLY9rObzVjOFGTP72YK43hNVvG8JlfT/ePX/LY8QOXpr3Cr9pqZ
   COioLBuf3FCJdEuTLjSUkQtKkKmV/XT8AMhMpymuI5PxJDtneGWcFYm2w
   ko5nVmU5LnsJRoH0Oig2M4BAL2MsW+LNASc3sI3jpNJnQwBzxb0giQk/L
   H+piBstHhwJRa8qWqyEF62BxVJ+YtkjXYKkhF2InE8WewnMYeHnYB7vaU
   7D0C1WQLzcROQaX2vK00b6M+eqcMxQw/1a7Y9AO74Ddj+CK/cuEOL8iX2
   ocY2govq7oCoNd1mPJMpawqlnWH8TTqI9dzliQ1Fr/o6mH2+GaYDpWetA
   Q==;
X-CSE-ConnectionGUID: fzH+akprTtKN2N8etUOrVQ==
X-CSE-MsgGUID: CKMWcgRqT+SImM82zA9a9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48933779"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48933779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:13:56 -0800
X-CSE-ConnectionGUID: vs4eNFQ5Qu+3HgPHLwSz+A==
X-CSE-MsgGUID: undcwHGKS9SXKqH/EtU9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="106263523"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2025 22:13:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfc9-000Spt-1I;
	Fri, 17 Jan 2025 06:13:53 +0000
Date: Fri, 17 Jan 2025 14:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-01-16-2 7/23]
 sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this
 goto statement to its label
Message-ID: <202501171455.ZDrGYjE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-01-16-2
head:   e3977d58d39b9fd3d4f04615aa580d4fa702aa0e
commit: 08af04b193d94a1cbda7863d699552bd674dacd2 [7/23] ASoC: audio-graph-card2: use snd_soc_ret()
config: i386-randconfig-013-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171455.ZDrGYjE5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
    1013 |                         goto end;
         |                         ^
   sound/soc/generic/audio-graph-card2.c:1030:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1030 |         struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
         |                             ^
   sound/soc/generic/audio-graph-card2.c:1029:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1029 |         struct device_node *codec0_port __free(device_node) = of_graph_get_remote_port(ep0);
         |                             ^
   sound/soc/generic/audio-graph-card2.c:1027:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1027 |         struct device_node *ep1 __free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
         |                             ^
   sound/soc/generic/audio-graph-card2.c:1026:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1026 |         struct device_node *ep0 __free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
         |                             ^
   1 error generated.


vim +1013 sound/soc/generic/audio-graph-card2.c

   969	
   970	int audio_graph2_link_c2c(struct simple_util_priv *priv,
   971				  struct device_node *lnk,
   972				  struct link_info *li)
   973	{
   974		struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
   975		struct device_node *port0 = lnk;
   976		struct device_node *ports __free(device_node) = port_to_ports(port0);
   977		struct device_node *port1 __free(device_node) = of_graph_get_next_port(ports, port0);
   978		u32 val = 0;
   979		int ret = -ENOMEM;
   980	
   981		/*
   982		 * codec2codec {
   983		 *	ports {
   984		 *		rate = <48000>;
   985		 * =>	lnk:	port@0 { c2c0_ep: { ... = codec0_ep; }; };
   986		 *		port@1 { c2c1_ep: { ... = codec1_ep; }; };
   987		 *	};
   988		 * };
   989		 *
   990		 * Codec {
   991		 *	ports {
   992		 *		port@0 { codec0_ep: ... }; };
   993		 *		port@1 { codec1_ep: ... }; };
   994		 *	};
   995		 * };
   996		 */
   997	
   998		/*
   999		 * Card2 can use original Codec2Codec settings if DT has.
  1000		 * It will use default settings if no settings on DT.
  1001		 * see
  1002		 *	simple_util_init_for_codec2codec()
  1003		 *
  1004		 * Add more settings here if needed
  1005		 */
  1006		of_property_read_u32(ports, "rate", &val);
  1007		if (val) {
  1008			struct device *dev = simple_priv_to_dev(priv);
  1009			struct snd_soc_pcm_stream *c2c_conf;
  1010	
  1011			c2c_conf = devm_kzalloc(dev, sizeof(*c2c_conf), GFP_KERNEL);
  1012			if (!c2c_conf)
> 1013				goto end;
  1014	
  1015			c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
  1016			c2c_conf->rates		= SNDRV_PCM_RATE_8000_384000;
  1017			c2c_conf->rate_min	=
  1018			c2c_conf->rate_max	= val;
  1019			c2c_conf->channels_min	=
  1020			c2c_conf->channels_max	= 2; /* update ME */
  1021	
  1022			dai_link->c2c_params		= c2c_conf;
  1023			dai_link->num_c2c_params	= 1;
  1024		}
  1025	
  1026		struct device_node *ep0 __free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
  1027		struct device_node *ep1 __free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
  1028	
  1029		struct device_node *codec0_port __free(device_node) = of_graph_get_remote_port(ep0);
  1030		struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
  1031	
  1032		/*
  1033		 * call Codec first.
  1034		 * see
  1035		 *	__graph_parse_node() :: DAI Naming
  1036		 */
  1037		ret = graph_parse_node(priv, GRAPH_C2C, codec1_port, li, 0);
  1038		if (ret < 0)
  1039			goto end;
  1040	
  1041		/*
  1042		 * call CPU, and set DAI Name
  1043		 */
  1044		ret = graph_parse_node(priv, GRAPH_C2C, codec0_port, li, 1);
  1045		if (ret < 0)
  1046			goto end;
  1047	
  1048		graph_link_init(priv, lnk, codec0_port, codec1_port, li, 1);
  1049	end:
  1050		return graph_ret(priv, ret);
  1051	}
  1052	EXPORT_SYMBOL_GPL(audio_graph2_link_c2c);
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
