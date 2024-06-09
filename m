Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A51CAAF;
	Sun,  9 Jun 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717925708; cv=none; b=m9v0zMkLdQzTMEBGD0ZyMO1UxHIu4DhViaiWhaWfoA9fLkUkw7K+Wv7qKXaf2knCOEaYy1+EH8igGiBYIxVNDXBUrjiFOUsZ/bhB44Uc96U9jElYwD42XtvNU53iOxwISfaBc46u7i52BllIiHiPGgz0el7s1DlQcVVAstCqHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717925708; c=relaxed/simple;
	bh=35HB9QseAABPQZZ1Ei04agmTzxCxTEexIjzwe6OuI9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeSXqCRYLMEcevwyiL4jk8ui5kUe5VhNKrfGh6SMdydfc8yCr95MISS4RA63yOkt/Yv6t9ilOCECBWVMDEfYgZ7CIvirQ9M02i5/ffBDemlkC8a7fQ5o4NOYujkrXn3RXFmGjmflJ1o2/jzVwq5othczktEp/oQO1YvzrWZxSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3++ka2N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3++ka2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717925705; x=1749461705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=35HB9QseAABPQZZ1Ei04agmTzxCxTEexIjzwe6OuI9I=;
  b=l3++ka2NbMB8OfW6dsgwImk/4ef4vBqzjSTxh1ia0ZkaOW4PIfo2YypM
   jLpRxgQadt7/SOL3T87fQATZORFfOxNw3LuFsA1KBvjpYFH9xBg5UaOad
   H5Q35szuu8UXb5lVO3BTiudJQqZb0ubHLWvrrWhsThDmMWaYFgS0URCxh
   c+bQWbAgJTJazUfg3j1ARvxlfs4l+8OcNmE1wS5VwYyj653VfX3qmIVg2
   tOrJ48qd3YEE9XO8pTK7mJP0i+iGCC9qjacut97bueZwbdCAehBO/4o+p
   uf95EHbyDpLYkkpLuxuetbjZgcPZLOQj/YywJSHRpSj97DC7HudwIi2TH
   g==;
X-CSE-ConnectionGUID: BG1jPH0aT/6YldOzhZQSjQ==
X-CSE-MsgGUID: Xu7ZIQYsSta2AAcXF1Jm+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14430818"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14430818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 02:35:05 -0700
X-CSE-ConnectionGUID: dulLMCoETJOP13ON8moxgw==
X-CSE-MsgGUID: lQoiCW+fQ+KU4iTrkFyWDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38695818"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2024 02:35:02 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGEx1-00013q-2H;
	Sun, 09 Jun 2024 09:34:59 +0000
Date: Sun, 9 Jun 2024 17:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Handrigan <paulha@opensource.cirrus.com>, broonie@kernel.org,
	lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Handrigan <paulha@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <202406091719.QkkX833g-lkp@intel.com>
References: <20240607202708.335752-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607202708.335752-3-paulha@opensource.cirrus.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Handrigan/ASoC-dt-bindings-cirrus-cs530x-Add-initial-DT-binding/20240608-042903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240607202708.335752-3-paulha%40opensource.cirrus.com
patch subject: [PATCH 2/2] ASoC: cs530x: Support for cs530x ADCs
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240609/202406091719.QkkX833g-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091719.QkkX833g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091719.QkkX833g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs530x-i2c.c:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/codecs/cs530x-i2c.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/codecs/cs530x-i2c.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/codecs/cs530x-i2c.c:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/codecs/cs530x-i2c.c:64:21: warning: cast to smaller integer type 'enum cs530x_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
      64 |                 cs530x->devtype = (enum cs530x_type)match->data;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +64 sound/soc/codecs/cs530x-i2c.c

    37	
    38	static int cs530x_i2c_probe(struct i2c_client *client)
    39	{
    40		struct cs530x_priv *cs530x;
    41		int ret;
    42	
    43		cs530x = devm_kzalloc(&client->dev, sizeof(struct cs530x_priv),
    44				       GFP_KERNEL);
    45		if (!cs530x)
    46			return -ENOMEM;
    47	
    48		i2c_set_clientdata(client, cs530x);
    49	
    50		cs530x->regmap = devm_regmap_init_i2c(client, &cs530x_regmap);
    51		if (IS_ERR(cs530x->regmap)) {
    52			ret = PTR_ERR(cs530x->regmap);
    53			dev_err(&client->dev, "Failed to allocate register map: %d\n",
    54				ret);
    55			return ret;
    56		}
    57	
    58		if (client->dev.of_node) {
    59			const struct of_device_id *match;
    60	
    61			match = of_match_node(cs530x_of_match, client->dev.of_node);
    62			if (match == NULL)
    63				return -EINVAL;
  > 64			cs530x->devtype = (enum cs530x_type)match->data;
    65		} else {
    66			const struct i2c_device_id *id =
    67				i2c_match_id(cs530x_i2c_id, client);
    68	
    69			cs530x->devtype = id->driver_data;
    70		}
    71	
    72		cs530x->dev = &client->dev;
    73	
    74		return cs530x_probe(cs530x);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
