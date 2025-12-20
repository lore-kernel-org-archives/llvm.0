Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B552BEC27;
	Sat, 20 Dec 2025 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241316; cv=none; b=ezvj0rzVYSPest3cCGs25Vw58WeeleU4x0S/iQGYv/BtWiBbEtTqHHKwd1B6CONZxNFEqjMQMHC8ahJE9V6mIKthlwXDmYZue6SParljvBFXeTEiHo+1eKpip+eupbjJBafPHMhgi9gY/2AGjvGQa9WqKseyBhXdcZkOY4jKcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241316; c=relaxed/simple;
	bh=wu8+gZqmV/Q3cWvG2M+eBTaZALLGCI+Ay02j/Vys4Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5D+XDZ9vo6bjxG8TeogxOYrsLcrBfC0jb0DVgkLvAI5DKZ/muJwWLYUw7vak1PEOLmsS9ml94k7HM8oaIBzrhb2Vmm5hTtTI2A29dA+AAiIV8bWpyNgX68yr4VRcAGi9UcJNIB/9ldwncyKmvN0lPZyAQZJ35B5DXy4lnEjhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtEfGSWp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtEfGSWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241314; x=1797777314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wu8+gZqmV/Q3cWvG2M+eBTaZALLGCI+Ay02j/Vys4Ac=;
  b=GtEfGSWpAAyX4sJw/oPTsnGbu8/O5jhbhnJXPisF8FvG6pN18rarPgeN
   Cd4rfGMDtoHpuM1uBzXyCnH8kxtH+lzMa9Q0ETG1c3tkyC19Y867+3sPp
   JNNCvd85qifrmt1NEmkgYl4J9ZSLf5Lsr8oHHfKeGuoviw2peRSvZ2Gr0
   KnueV2X/VQC9TjoE84JbBiXNqz1+gKthXsHnjGW+yZmyJu1fiek2LNqyJ
   n1SmO/a7FSjBZRDy+gxQ2ePzgPaIBXPnfpqFHkGPvBCAdVlhhMcfbvd2u
   zbhRt6qP0sOWuKGNeUC4WeTd0fPyDinwZAOBd7aWsh2QtEwQ9K9e/2PgG
   A==;
X-CSE-ConnectionGUID: cJeHEGMwQbGqULdNByG0ug==
X-CSE-MsgGUID: a7USTkw0QsKzmCTKr9ZkWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93650034"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93650034"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:11 -0800
X-CSE-ConnectionGUID: iqGqRvucS4OQca/iF3aKKQ==
X-CSE-MsgGUID: fBSaOj+4Tw+rSqPEqPjy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023546"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eS-12Ne;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, tobias@waldekranz.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: Fix error handling in dsa_port_parse_of
Message-ID: <202512202210.PkOvVaCv-lkp@intel.com>
References: <20251214131204.4684-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214131204.4684-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/net-dsa-Fix-error-handling-in-dsa_port_parse_of/20251214-211443
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251214131204.4684-1-make24%40iscas.ac.cn
patch subject: [PATCH v2] net: dsa: Fix error handling in dsa_port_parse_of
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202210.PkOvVaCv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202210.PkOvVaCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202210.PkOvVaCv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/dsa/dsa.c:1266:15: error: incompatible pointer types passing 'struct net_device *' to parameter of type 'struct device *' [-Werror,-Wincompatible-pointer-types]
    1266 |                         put_device(conduit);
         |                                    ^~~~~~~
   include/linux/device.h:1181:32: note: passing argument to parameter 'dev' here
    1181 | void put_device(struct device *dev);
         |                                ^
   1 error generated.


vim +1266 net/dsa/dsa.c

  1244	
  1245	static int dsa_port_parse_of(struct dsa_port *dp, struct device_node *dn)
  1246	{
  1247		struct device_node *ethernet = of_parse_phandle(dn, "ethernet", 0);
  1248		const char *name = of_get_property(dn, "label", NULL);
  1249		bool link = of_property_read_bool(dn, "link");
  1250		int err = 0;
  1251	
  1252		dp->dn = dn;
  1253	
  1254		if (ethernet) {
  1255			struct net_device *conduit;
  1256			const char *user_protocol;
  1257	
  1258			conduit = of_find_net_device_by_node(ethernet);
  1259			of_node_put(ethernet);
  1260			if (!conduit)
  1261				return -EPROBE_DEFER;
  1262	
  1263			user_protocol = of_get_property(dn, "dsa-tag-protocol", NULL);
  1264			err = dsa_port_parse_cpu(dp, conduit, user_protocol);
  1265			if (err)
> 1266				put_device(conduit);
  1267	
  1268			return err;
  1269		}
  1270	
  1271		if (link)
  1272			return dsa_port_parse_dsa(dp);
  1273	
  1274		return dsa_port_parse_user(dp, name);
  1275	}
  1276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
