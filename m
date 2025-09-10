Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE679276051;
	Wed, 10 Sep 2025 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536747; cv=none; b=JLuZpEpPDzaEFjwKvqrKXVI0eZPLdVbgSSB7g81R9lWj3cj2YzLQoxmBqT2EoBGA74Y6euzcAjvhhqql19hhqrKnikoIYC9PHZr3hUrBn/pMQN0OJ0bvDRM/ptQsi6q4vO5tEHHTN8xkfss7NQP6r8Ue/Cgk9ZJJRFdvOK8DBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536747; c=relaxed/simple;
	bh=B6fkvpBK+Ee+0YOFckXyRfEu8C3ZmYjOmbvJLcYj7rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHdMcnh2VV+GoCnJ0/2BC9O5XjeB6RLlvkVGHMDduuDTBwfB7UbyulnhQhj5O3POB/PI7D2TB9yv7a2CKxcZr0SOZlK1wstKwvuHdLCH9rXcwtqW6Pn4khAF2dbKOWAbb+yoLn+nLCyuqnCDueuFKgRNmvyRxbdxjV5Kr6F6gTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EF3ia0m2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF3ia0m2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757536746; x=1789072746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B6fkvpBK+Ee+0YOFckXyRfEu8C3ZmYjOmbvJLcYj7rE=;
  b=EF3ia0m2CVyH6+95CotBl+oX2wu960ATK/tsFzRpRM7vf1h0RBfefm71
   /XcsuNusKaQLNVdAvIkSERh6j9wcqI0IIec4O3KOaWyjNfFDpI/PyTbrL
   h3Xg/7vXYlQab+0gIWasyO9/8idPMPZkr2gxIm8nwo5zZnj+VBoS3Ij3D
   dPQJv4ndGg9S2R2SFqf8UCpJrbhoEUXs51+2tdkYrq81DZMMQ0/twpc7b
   cuOL0giJqcOliwTCyjnpU4JEO9gY8l8ytRZsJPNK3msAwMzE5nodHk8PB
   cEuhwAq89qlqvqgqonwzC2mdYPM3lp5YDrYEqrFJecF4qjlHTT5YXbHMX
   A==;
X-CSE-ConnectionGUID: y7pB+KzPRC+hHuNOBORkFg==
X-CSE-MsgGUID: q9xPx6BsQvW/HTVyj7HrsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59083177"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="59083177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 13:39:05 -0700
X-CSE-ConnectionGUID: 0pc5aoHiT2OxenyLymEnVA==
X-CSE-MsgGUID: Sz8c7R3oQ0WyCVA7akPy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="210615967"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2025 13:39:00 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwRaj-0006GZ-2H;
	Wed, 10 Sep 2025 20:38:57 +0000
Date: Thu, 11 Sep 2025 04:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/8] of/irq: Introduce for_each_of_imap_item
Message-ID: <202509110402.OHHgtxRA-lkp@intel.com>
References: <20250909120041.154459-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909120041.154459-4-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tip/irq/core linus/master v6.17-rc5 next-20250910]
[cannot apply to geert-renesas-devel/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-Schneider-Electric/ARM-dts-r9a06g032-Add-GPIO-controllers/20250909-200642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250909120041.154459-4-herve.codina%40bootlin.com
patch subject: [PATCH v2 3/8] of/irq: Introduce for_each_of_imap_item
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250911/202509110402.OHHgtxRA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110402.OHHgtxRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110402.OHHgtxRA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/platform.c:15:
>> include/linux/of_irq.h:123:29: warning: no previous prototype for function 'of_imap_parser_one' [-Wmissing-prototypes]
     123 | extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
         |                             ^
   include/linux/of_irq.h:123:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     123 | extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
         |        ^
   1 warning generated.


vim +/of_imap_parser_one +123 include/linux/of_irq.h

    58	
    59	extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq);
    60	extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
    61	extern int of_irq_to_resource(struct device_node *dev, int index,
    62				      struct resource *r);
    63	
    64	#ifdef CONFIG_OF_IRQ
    65	extern void of_irq_init(const struct of_device_id *matches);
    66	extern int of_irq_parse_one(struct device_node *device, int index,
    67				  struct of_phandle_args *out_irq);
    68	extern int of_irq_count(struct device_node *dev);
    69	extern int of_irq_get(struct device_node *dev, int index);
    70	extern int of_irq_get_byname(struct device_node *dev, const char *name);
    71	extern int of_irq_to_resource_table(struct device_node *dev,
    72			struct resource *res, int nr_irqs);
    73	extern struct device_node *of_irq_find_parent(struct device_node *child);
    74	extern int of_imap_parser_init(struct of_imap_parser *parser,
    75				       struct device_node *node,
    76				       struct of_imap_item *item);
    77	extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
    78						       struct of_imap_item *item);
    79	extern struct irq_domain *of_msi_get_domain(struct device *dev,
    80						    const struct device_node *np,
    81						    enum irq_domain_bus_token token);
    82	extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
    83								u32 id,
    84								u32 bus_token);
    85	extern void of_msi_configure(struct device *dev, const struct device_node *np);
    86	extern u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in);
    87	#else
    88	static inline void of_irq_init(const struct of_device_id *matches)
    89	{
    90	}
    91	static inline int of_irq_parse_one(struct device_node *device, int index,
    92					   struct of_phandle_args *out_irq)
    93	{
    94		return -EINVAL;
    95	}
    96	static inline int of_irq_count(struct device_node *dev)
    97	{
    98		return 0;
    99	}
   100	static inline int of_irq_get(struct device_node *dev, int index)
   101	{
   102		return 0;
   103	}
   104	static inline int of_irq_get_byname(struct device_node *dev, const char *name)
   105	{
   106		return 0;
   107	}
   108	static inline int of_irq_to_resource_table(struct device_node *dev,
   109						   struct resource *res, int nr_irqs)
   110	{
   111		return 0;
   112	}
   113	static inline void *of_irq_find_parent(struct device_node *child)
   114	{
   115		return NULL;
   116	}
   117	static inline int of_imap_parser_init(struct of_imap_parser *parser,
   118					      struct device_node *node,
   119					      struct of_imap_item *item)
   120	{
   121		return -ENOSYS;
   122	}
 > 123	extern struct of_imap_item *of_imap_parser_one(struct of_imap_parser *parser,
   124						       struct of_imap_item *item)
   125	{
   126		return NULL;
   127	}
   128	static inline struct irq_domain *of_msi_get_domain(struct device *dev,
   129							   struct device_node *np,
   130							   enum irq_domain_bus_token token)
   131	{
   132		return NULL;
   133	}
   134	static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
   135							u32 id, u32 bus_token)
   136	{
   137		return NULL;
   138	}
   139	static inline void of_msi_configure(struct device *dev, struct device_node *np)
   140	{
   141	}
   142	static inline u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
   143	{
   144		return id_in;
   145	}
   146	#endif
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
