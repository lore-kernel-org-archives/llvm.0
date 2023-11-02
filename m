Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE3E441D;
	Thu,  2 Nov 2023 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQb0mdCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698903684; x=1730439684;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=cDvd4S7Yuk/ooAT2dhYWVNXxdOuhFv+mZfQmJumOJ+s=;
  b=fQb0mdCGs5ydgIQ5URxeQG+uEMZq3Z4pcuDGk721S/7igaW1Y9/S2Rp+
   D/bV8J/vsyp3QBtzumjTa6IEqWWixBTTdBxYeBPxSOK5u+dVeF3uqF8U6
   QqR9FNy2kv4/Z64zGZyPjlp/EskSbflWPnme3XtcYyytLMxCYGUWjwa1y
   xY3rqo+VB+879nsBKcodv/MSZH297Xd9wRS8cr95JyDuJ6V3doh5B0x0R
   CoB5pLgMQSNDp32YgHOB/eZeyAS+dHO5mvpMENEDpwHsovm03bndhJrRQ
   eXgAwHwUXe+9IU2qXT/zipymmmSeBdvZSBEbr1npHlmRXZDIWzw5REOZt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="392526837"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="392526837"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008352654"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="1008352654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Nov 2023 22:41:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 22:41:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 22:41:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 22:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prij1lmMlYOc1usTRI6czXUfY4V8+IHpSkaP2TKqzOBUf7vAMNyoMWkyN7tEMdSXNl5f7G7o6VBSjZ+2C644wNtjdeHid51N779p1rHv1vp/wQ6EWUnf4c83yFKpJOEJuIPp8Fss4F3MdLYb/a3A1vgoML0VOQd8r/M0vzekbDG8nz9EFnRYrIXoNWhhG1hCq+Ydp6Z5SL1GSs+hN5Vl9jVvkWG3EVnDC56zp58gMX4W0IM0CnohKvO9M+5JwbyMEAClD1kNkz3Tra5/t9MX/pJna9cveYXn+8QV+HxWa+9v3lf+BKQ/sENieUVCO5PWQqzRQYGTA/TmcZ1ULpGpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKiMvdeGMkEANYm3KlndSkso6rfFe4I4YOCmRAbSBwI=;
 b=ZkwHcj9pqnOoSv4VLIMM3v/sHhX7o8UAnVcQFM1N2ixK+RYoa34XuXHApZkbaZK5bywFmsYYVNOvOOpvOCHgZZQQkgz0EOmIVXzU9WWH+7bfxj+pVAcNMgsuaUOSsJL4b7usdqej5cpAaS6Y/GMNfXVBOZ6rafTKEE6oHmY9blL8X6FZkQ0xXz42fucYV6LKa7rGqQExCUvnYc1b4HisfPXUef9GX5wAijjJtZ8DDx4kfkd+l2nHvNGE3iGn/rwDFTE1i5KHLop82CbaNKARo/q7mFhhAB5mDoH1RDXF6vKUhXr9xpMEBOiuaYbFwf4JESLj6Sa+s128+A3lyBfTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 05:41:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Thu, 2 Nov 2023
 05:41:14 +0000
Date: Thu, 2 Nov 2023 13:36:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 14/21] irqchip: riscv-imsic: Add ACPI support
Message-ID: <202311012045.ic3WPGcE-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025202344.581132-15-sunilvl@ventanamicro.com>
X-ClientProxiedBy: KL1P15301CA0062.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 038676fc-11c9-49c0-4e04-08dbdb6653d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCZvgrQ0I2lumwJXWFmeoVLFfjlJJieYXY7EpdWkGDBjKcCH7YP4PlXh+Owa2i/3qIf9U2O8JAKqjj211Le3f7gkWxkaLhSHljf40vrhxFewwdbYZFYOFxhWk240+1xeDxwJEoYUBRbwZV9fyhbxXkyuWoRzILXtntxcgEKV1a6gNdPA5xSy03ehd15uEqrIOi1xZ4Xmj16DZkA1rulbajn2ZAsIPRqVx/wnxJEAz60+IlcPsUN8Yy7FfxMDwy/5UBX09KG0V3iyE2JVmY3iXBRr4ICyeFblqUBLYfro6b2ALA9UCU7F/dp98ua6N6nL86Nm1eYU5wENCjfaJkRfAK306hCORyHfinGnJKM2ZYYstgKzxXBBuhXLnXcK3P/HeoRm7neg29fym+fClZDG19x9WrII0ltlN9K2NDDUV5+7TRZcIsjZCgx5MCn/7dNs80adMC2bqpoqhg70WoA3Df9uV6V6tedL5OErLDri13ljMWUPpX0dTwXliH7XPPubnFw+tbiv2+GJdYka0J69hBHIO+dl5U88BM1hm3KqR/dD2/TbL/NhMvCRoYkoDg+Gfr5NBaXJNf5Od5FfnE6/jOvMgIBGrifX5nBrhA0aW8WjvHF4BVnrr92F27MDQGrn8D13YXCvxNvlVefmjo5qWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(346002)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799009)(451199024)(316002)(6512007)(26005)(1076003)(6916009)(8676002)(6506007)(478600001)(2906002)(66556008)(41300700001)(6666004)(5660300002)(966005)(4326008)(6486002)(66476007)(8936002)(66946007)(83380400001)(38100700002)(4001150100001)(36756003)(86362001)(2616005)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXCNWLNyCz3LSloT2Pr7a5IhRVHN8I7MZdJ+tPhnr5YkjhBxRTnFdQW6qC/b?=
 =?us-ascii?Q?jJEHa2yb9kkcbQ6w/HXMUoGo90WSntvh8/jSDACE69rOjMDr7Xst3+azopuy?=
 =?us-ascii?Q?Tgx/VE1er9JXoYBoODoPoQfw+DlIf9Mk4nsNQICz8TAdAmewfypsX09I/QGY?=
 =?us-ascii?Q?N8ZoaTmI0Y2hbspzMRWdSx+shVabnf5vq4T2tTcSQiSbS4lYwX9BW3LOmtgG?=
 =?us-ascii?Q?kRC5SQsqbRUl9N1+79Z68ihqP96qgJ19EDk+E6LfDWIvuZbxN+F9dWiEx/fp?=
 =?us-ascii?Q?rbQXWwg/ooE84Fy7JgwCJH5XBnR9RhmJ06L5wPCSkxQEdQKPVY4G4QTPBMi8?=
 =?us-ascii?Q?/rU4N2qPHieLkakA6Xhxj5jvkS+4Q/wydPrYEOlYhPQBPFQFl2DQTUERVYId?=
 =?us-ascii?Q?Korm94NjpFI85Ja4kxC4Gq6aCyozOqTXvPHwgXXXdhGR9t8QCNYEGV4jNLMN?=
 =?us-ascii?Q?qxwbW3C1SGk9DGiZPV9BY/g80aCz/KulobshqB8ks+CxQZrQDXUb2EoW8mw7?=
 =?us-ascii?Q?I1eE2SjhF2tI4aP33HjQJScUNYIqIZSSu5YbkE8bEE9l7j4rBRyI9TXuRrHI?=
 =?us-ascii?Q?Twp2axttj7aAu1tuSh1RobCBoylI7G9qUZfZ2lsx2EhbnH/vtxbwp9oYOhIp?=
 =?us-ascii?Q?Xc8EL6Wibf8qyL6PHui/Sf4T+YDKT7Bt6UW9cSaDdN6PDJLqwodAf/NMZLSE?=
 =?us-ascii?Q?L2VHAMB6OHyRNYIsQsH8D/ZDdUU6lNqgxCLzbI87vmnF4fNMsTXJmdaJRS9H?=
 =?us-ascii?Q?bwJTIYL780H8PA14m3aQeZoghewyT0RVk0i9xlljo2abuwsDtcCO1cbmwz+T?=
 =?us-ascii?Q?d79wLKCh2Hl+H+MEeClNIjncx93OwKNU2fU/hx3ieWXslkCqXUivDJvjig+G?=
 =?us-ascii?Q?qr9kfKTz2ybs8tcwWhX4ySwc9pqQBh3DiBRt8Bq6G/KiwKysDQcZMg7m2OhV?=
 =?us-ascii?Q?1nnvSycFbDYrS3PNuAoZof3xE1OoYnri5lqACaggB7qdxIZurRkLNxCd9f9v?=
 =?us-ascii?Q?hHwCPSdP255oOz+df3lkV4n7+5eWaz9OjBe62HpKsAORPXjqtQROWffYycFq?=
 =?us-ascii?Q?QLleOJy4Bd9hlg2NN7uJRzLpe1oRazGRQNeORK0uRFGj2hMO1GCcY2wYt96U?=
 =?us-ascii?Q?iTvvRv9470JUT00L8P9i9g52h0GWNGLhnAEa9qo7IFh83ZwiLRwNXBJH5Kl1?=
 =?us-ascii?Q?LtkdNAMR4KZHyTPBLdtC350F/W8Ne6fRMkhoCFn+b/qDn6PfoyKqtS3HWumk?=
 =?us-ascii?Q?xGc7akF1of82xHsLAc2t8Cq+Wc8h0snvnspb1Y3VoEzHFluyeO6tSgck5ZWB?=
 =?us-ascii?Q?vsI6Oje4jZ5zgR56Q219Qc9KhHu4KLCeSigdwOoeWvi2sZwlyaCOSxMnTg+7?=
 =?us-ascii?Q?pidONsuY8oQZzYdtMozidatJLv7zJLFqhxL/uJJbcdHoTabMzTp8Vvmb9y/a?=
 =?us-ascii?Q?Hy2UqJBGce7088xpyRU512vXT3TH/06l40CvOFGpfsWAeNlKcO+kpcka0H1z?=
 =?us-ascii?Q?9coKX7/ErnyWeECr8LnAVhksXJXND0gu9cISF4Hrtkyue5sSiv+efp//KNYK?=
 =?us-ascii?Q?ZSN8doWUb6r88HO3hMcu8Jl7EDSCVNrTiWbAIPjK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 038676fc-11c9-49c0-4e04-08dbdb6653d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 05:41:14.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxKGsRKR4i6St7Dz45vZOpAuxm9Lrkl/WzIIeAmCbxN+T6tQeWGvpIADrZRxyFQS0q3wyV32qsS9t3ALrXsykA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-OriginatorOrg: intel.com

Hi Sunil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus pci/next pci/for-linus v6.6]
[cannot apply to tip/irq/core linus/master next-20231101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/arm64-PCI-Migrate-ACPI-related-functions-to-pci-acpi-c/20231026-042858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025202344.581132-15-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 14/21] irqchip: riscv-imsic: Add ACPI support
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231101/202311012045.ic3WPGcE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311012045.ic3WPGcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311012045.ic3WPGcE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic-state.c:598:10: error: call to undeclared function 'acpi_get_intc_index_hartid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     598 |                 return acpi_get_intc_index_hartid(index, hartid);
         |                        ^
>> drivers/irqchip/irq-riscv-imsic-state.c:618:10: error: call to undeclared function 'acpi_get_imsic_mmio_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     618 |                 return acpi_get_imsic_mmio_info(index, res);
         |                        ^
   drivers/irqchip/irq-riscv-imsic-state.c:618:10: note: did you mean 'acpi_get_system_info'?
   include/acpi/acpixf.h:426:8: note: 'acpi_get_system_info' declared here
     426 |                             acpi_get_system_info(struct acpi_buffer
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   2 errors generated.


vim +/acpi_get_intc_index_hartid +598 drivers/irqchip/irq-riscv-imsic-state.c

33443eaa37d8aa Anup Patel 2023-10-23  590  
33443eaa37d8aa Anup Patel 2023-10-23  591  static int __init imsic_get_parent_hartid(struct fwnode_handle *fwnode,
33443eaa37d8aa Anup Patel 2023-10-23  592  					  u32 index, unsigned long *hartid)
33443eaa37d8aa Anup Patel 2023-10-23  593  {
33443eaa37d8aa Anup Patel 2023-10-23  594  	int rc;
33443eaa37d8aa Anup Patel 2023-10-23  595  	struct of_phandle_args parent;
33443eaa37d8aa Anup Patel 2023-10-23  596  
33443eaa37d8aa Anup Patel 2023-10-23  597  	if (!is_of_node(fwnode))
526591d2c1f700 Sunil V L  2023-10-26 @598  		return acpi_get_intc_index_hartid(index, hartid);
33443eaa37d8aa Anup Patel 2023-10-23  599  
33443eaa37d8aa Anup Patel 2023-10-23  600  	rc = of_irq_parse_one(to_of_node(fwnode), index, &parent);
33443eaa37d8aa Anup Patel 2023-10-23  601  	if (rc)
33443eaa37d8aa Anup Patel 2023-10-23  602  		return rc;
33443eaa37d8aa Anup Patel 2023-10-23  603  
33443eaa37d8aa Anup Patel 2023-10-23  604  	/*
33443eaa37d8aa Anup Patel 2023-10-23  605  	 * Skip interrupts other than external interrupts for
33443eaa37d8aa Anup Patel 2023-10-23  606  	 * current privilege level.
33443eaa37d8aa Anup Patel 2023-10-23  607  	 */
33443eaa37d8aa Anup Patel 2023-10-23  608  	if (parent.args[0] != RV_IRQ_EXT)
33443eaa37d8aa Anup Patel 2023-10-23  609  		return -EINVAL;
33443eaa37d8aa Anup Patel 2023-10-23  610  
33443eaa37d8aa Anup Patel 2023-10-23  611  	return riscv_of_parent_hartid(parent.np, hartid);
33443eaa37d8aa Anup Patel 2023-10-23  612  }
33443eaa37d8aa Anup Patel 2023-10-23  613  
33443eaa37d8aa Anup Patel 2023-10-23  614  static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
33443eaa37d8aa Anup Patel 2023-10-23  615  					  u32 index, struct resource *res)
33443eaa37d8aa Anup Patel 2023-10-23  616  {
33443eaa37d8aa Anup Patel 2023-10-23  617  	if (!is_of_node(fwnode))
526591d2c1f700 Sunil V L  2023-10-26 @618  		return acpi_get_imsic_mmio_info(index, res);
33443eaa37d8aa Anup Patel 2023-10-23  619  
33443eaa37d8aa Anup Patel 2023-10-23  620  	return of_address_to_resource(to_of_node(fwnode), index, res);
33443eaa37d8aa Anup Patel 2023-10-23  621  }
33443eaa37d8aa Anup Patel 2023-10-23  622  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

