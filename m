Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6C3D54D;
	Sat, 10 Feb 2024 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707566114; cv=fail; b=aX6jr7MQzbevf0fNzOuImij7h+z5zkAxv82TgNumd+QcqvgYmuIKCSB8SaxpxPqdFSXoZBb3oOZYgBb24Ig0HolkdKYmSmXSxOVHyZ6Z6aimoSs4+TRxNO3rmGs8oYXw7JABFo+K0yW5wdvfWHZe3vDi2WlX0U4ONH2APXvR8Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707566114; c=relaxed/simple;
	bh=KUKx5l0PtxWrqdmTZDkVjBdhRyZbpWkHvmwpvgD5sgM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sa4+5OpRjHr8Cxw0FxdohO4T3sY5PS84/zGyRFOJG4E6A5p0txAotLtm2wy5fbQY1IC4dGXIbpAZRSeJzeZXDCh8lzsykOzTS2N1F2zVcAPlisLiXXtGEZpXfi79XCRRy8Cp8izzuJD9aLnA6KWy7/h8h/dDmVOEeQwa8WcdugI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXFs0bbA; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXFs0bbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707566113; x=1739102113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUKx5l0PtxWrqdmTZDkVjBdhRyZbpWkHvmwpvgD5sgM=;
  b=dXFs0bbA97TyU261HqGSf0A5hJHvD0ohmkWLchNIzpjyYH1NmgXKPpLt
   WIVYj8k+RUAOrhx81Sq1kJXARPVqNFEO+f9mvXEHeE+fbqc5VPbJ0mL1d
   KsI1nnTynrazQTQ2Hw4hFiVNSBG7eNFPVR5//tTB3MBaj4mCkHTLKctEL
   8i0Cl6WaT/q45tTT4g1+XRobfJJ7HIyDWVU1NX996dvJi6bavWeLbSYCV
   Xmu24rtrp1ticw+I0PWD/tTc7KJBA47qZ7N2YXfqvFFjOdS9vG1sjKRLX
   gkuA4/12wSjBdsy6oBQQ/idIq9nvsRG90+PG3ewlOKMc93LCD9KaQnQfk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5375560"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="5375560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="6908861"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2024 03:55:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 10 Feb 2024 03:55:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 10 Feb 2024 03:55:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 10 Feb 2024 03:55:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 10 Feb 2024 03:55:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrU5OFAnUH6paC2iT84Nv/6SmmluIsLDw3Zz2MvngBxRLjlFnZyoBbqqGEoonfm6PPTb37qMT1PIxbwWDytr4gr5csATxjRQizKrorsepk36ROc3HgsjWdhvriqJG/97PEvjqSlf/Ux2jlsQQVcvfaWYqkifQNinGIi2BVf0dgdmK1lrvgLUTpwp7riK+vM1LXOtY+D7pfQpmedO0huhWM46GE1XWlvT89eUV2uZNFejsTWP24HL7JUuHHF2QGbL8rwMO/mKU8a58INZXd1w15bUY5Wbh8qwvlqOp/OGF52qXTI93bR2dJrKFCXC1PIyAKvRXxeegpGTzwd64qgazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekcCbWYxRW+KPfbIsO/9crywAyE2e8Dmyy65BP1iqP0=;
 b=i2GFc6AOMmj66s41gMv6b81gv9bxvlrdDH0uumZrzuUBgZu7RpARWyxHuOeyueQWXYYp8tM9RMF0K2bXmhHGbEphwmLOsbVLZpQw9b3P6Rm9AQupJQAOsQhH5EWA+l/cpNhjkawhTlTvzXVoEX1gINLu3W1R69Q557ADnjFnVCxqxrNlpbdx+2FcXy2JCDtqhhZ8wWI9cqvcf0xIzNMOfsAV5mw/r1qgOn8pkSITS+2dwcq9aSaLlz92DiO/8LuD2bhK39wJpdzUkaMAANr3Tys+0Wbeav8So/o5kIi0dMWhuhBOx8eIseCuZWAR7CW1jV45F2roQVYm64YpKKVt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Sat, 10 Feb
 2024 11:55:10 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7270.033; Sat, 10 Feb 2024
 11:55:10 +0000
Date: Sat, 10 Feb 2024 19:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [avpatel:riscv_aia_v13 42/43]
 drivers/irqchip/irq-riscv-imsic-state.c:316:7: error: incompatible integer
 to pointer conversion assigning to 'struct imsic_vector *' from 'long'
Message-ID: <202402101719.jbDSWQ7z-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: d249baec-9ffb-49ec-72cb-08dc2a2f21b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95jx7xvrXVZxr/yTfNY6uGC9cd1Gbv+4BURYVIQcYhVwq9O0LTBWOPOKeSc2icegu4lCYGuTXpoiTAnLrcKwDC8kh21/U45lLi75bBpXGpuMUUdhLvpQDFacqWz3g9UDWkQAmO5byDNY92KwrCdjQ6ztlPbdu8jN2b92TjSCtKq1PGWtmU/DfCPm6gNmtk6ny+EEBIX0VB2L4jnltdwjc2Nj99hWvxejGHGGgxqJG0HuRDSVaSHmEqvJUF1NPKlykCigtE85HXTaAIui/xx1OLr71gOQzrBpWcdAnM5jlV5+kOR3r5N6CG3GqKqwo9+zjGLX5Ye6Mc4e3H1lFG1P1+LDsq4ZITDUHFL9wxE03g73kLyVWUwsPTcZYWtnNBUS/JlBWeFKOJ9yaBEvepAwpzMAJrI4XhBACZi84tW3j7NZNKwI9Al3sG7ildZupUQ9+GucOVcDfDUX28vCwie9AkI7jkjihnrnPwkfaa8rBPYCK2p5IY4r2Q/ebRB7h7qBo0OstUnOwgjMJKrnf6yBavT6vKNxoHyd+xmNDTpuKa6/3YJXQNYGIMFnax2Fhiwfr8YfwV4NIY7LQsM/3Bu+wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(966005)(6486002)(6512007)(1076003)(83380400001)(478600001)(41300700001)(2616005)(26005)(6506007)(4326008)(316002)(6666004)(66946007)(66476007)(66556008)(8936002)(8676002)(2906002)(6916009)(36756003)(5660300002)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E5D+b0wULWjk86VynNujsE1ex6Bput40tQZ2xLLyJO3Riy3faBS00zc08uhf?=
 =?us-ascii?Q?YnPbx9j1PE8wHoAXj1WwGaTmHLJQ8gUOxHCGDXVTpYjeM5n+cSZr9de34Nyi?=
 =?us-ascii?Q?teogo4n6zEg0XxacdOXsqfh/xaJ9LcagW6UEPwhpk3H3sFsjMtYiZIZzIqth?=
 =?us-ascii?Q?6HLEQwXacXoRUaxxaehnj6WJkEwANfgdacVgW3pAdAWyNaUIBRPISibsMSh5?=
 =?us-ascii?Q?VZsjOTa3BlqsNXo/thAiMnEaQI95WTY123z+0mLsAtLcXE++hcSuhVhLeO3E?=
 =?us-ascii?Q?My79uMZmRBs0hL/zrTVXagFtUibdiHSl/0UkscXbTHgGIz1dGIDTFlB4ZNWW?=
 =?us-ascii?Q?gL6sDBv4eDFLVQ4kYqtsMo/6vQfg/Z6Re+SmYOh8mokmbVHCM6rXgU+ubXqL?=
 =?us-ascii?Q?Z0VI5CNFmHVZum3ZP9Gm71Apc6lJNkTacPSvQO/5wQJrps3bjcQB8svVNuC/?=
 =?us-ascii?Q?mieitQ+Z9vpCAk36aU/RAV78NtwIaDCVxzYXDmRbBfiuJJwqe0kQmt8ST66v?=
 =?us-ascii?Q?3VLPHUCm0Liz/haSEXdORy5rJz8XzOWtzz36JECcfFPYSmPeLNSXYZGVrRit?=
 =?us-ascii?Q?A7XCevRaTxmrtOmXM0xNi/6kOvPPwIVdHI2pVHHNK7wDewIKczX6RPumd79z?=
 =?us-ascii?Q?cDGKEnd7h3Z+hArGUibrW9ZVyqqlvc65DiXh7jKYRPh8bGTeZv4BocNnZesm?=
 =?us-ascii?Q?yWEtxin0jqUOUVW/ByXXkKX3nfIAUbhtAiwGUoHSCynPi99ABOmHsJ+Zn9FK?=
 =?us-ascii?Q?sdOlOm7hmnHciM8Wm0SiB1OutX9vYRuNolQpThyqBEMn3iSsh3RiHbzZO6wD?=
 =?us-ascii?Q?9YMXACBNJsAyKeWnF4CPSEeJTit16BqJk+ituEKS7rUoGQP0IfQoB83hj3Xf?=
 =?us-ascii?Q?RZXFi9YtuW04JB3iou5jun2YZz4SL9lAg2vGqP2pOr8iWnKpASCduekR8aKG?=
 =?us-ascii?Q?JL0uFfO0l91GEoCY9k9t87KZSYMAnNwR2knWxzvSnYLgMtj+ZxJzzwiCQnIO?=
 =?us-ascii?Q?ET0BT7uP+XlbGM8n4W4/oKevziXS0VXQ6YHJqnqrtkQQNYEhczDcfIz5blq5?=
 =?us-ascii?Q?A9d+T6+lA8yqzdddZ30vbx/q1Xn+OOgazilz2RkK8k4c1gyWjjVSfhtsKx/X?=
 =?us-ascii?Q?xkTDtyQ5BCdnivhtQOgXOk+aYWCYIdhq5cZwjNHXmq0KRnafzdFRJm4XyScj?=
 =?us-ascii?Q?edHgmEiXeafuVAl04VmWxhtm0lZH3ipuxNU5E4iy2zg4q5qgQZe1Zy0c8PeR?=
 =?us-ascii?Q?wpYnUPEVOSNcniSR9opo7MEzkwNPYcJB7SL+kGpBxNos8nB88cHDv7/cFzTQ?=
 =?us-ascii?Q?eBt0SSkSN7SaGmYJQeOz0mPjzTygSxgiXV74oUrPdUC07YqlgqAOPD7E5lK6?=
 =?us-ascii?Q?PET+wpeVpUsHtdP5Kl7H6wducFM8+UXFC6JD7r1vfA7JRBmc4FUAjm3UVTzi?=
 =?us-ascii?Q?wSKPCNdbKlnvB/LBiskRiPxeACpFfquy0pm7vIoTlOnJyGKRjxSMUHErtQw/?=
 =?us-ascii?Q?JX3qZHd2ScB/SuILKOYDGojYZ65WiLkEuO1Vv2cKQkGe2q5+lpm+Q4ybTAXt?=
 =?us-ascii?Q?p4Gf7eaHuTHUpxgwOwcem4UsCg8Fwoj4MGAyomo0M9y+pjWWNIAvRt74TLrU?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d249baec-9ffb-49ec-72cb-08dc2a2f21b4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 11:55:09.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKPAQH+Qe8zn30Z4rJMt9IUuBFENV13Qh5c4jnf4MrO6Q0qNO+CTnaUttTxBrFrnP4UF8Y7ShyuhXUJPzf14GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
X-OriginatorOrg: intel.com

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://github.com/avpatel/linux.git riscv_aia_v13
head:   7c827f929b596c9423d47904baf55ca77f9f53f5
commit: 3b3830894afc5d53b08fa0a5fbc8209b98db04c5 [42/43] RISC-V: Select APLIC and IMSIC drivers
:::::: branch date: 21 hours ago
:::::: commit date: 28 hours ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402101719.jbDSWQ7z-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ac0577177f053ba7e7016e1b7e44cf5932d00b03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101719.jbDSWQ7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402101719.jbDSWQ7z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-riscv-imsic-state.c:316:7: error: incompatible integer to pointer conversion assigning to 'struct imsic_vector *' from 'long' [-Wint-conversion]
     316 |         mvec = atomic_long_read(&vec->move);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +316 drivers/irqchip/irq-riscv-imsic-state.c

eb49bac5b097db Anup Patel 2023-08-02  300  
eb49bac5b097db Anup Patel 2023-08-02  301  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
eb49bac5b097db Anup Patel 2023-08-02  302  void imsic_vector_debug_show(struct seq_file *m,
eb49bac5b097db Anup Patel 2023-08-02  303  			     struct imsic_vector *vec, int ind)
eb49bac5b097db Anup Patel 2023-08-02  304  {
eb49bac5b097db Anup Patel 2023-08-02  305  	unsigned int mcpu = 0, mlocal_id = 0;
eb49bac5b097db Anup Patel 2023-08-02  306  	struct imsic_local_priv *lpriv;
eb49bac5b097db Anup Patel 2023-08-02  307  	bool move_in_progress = false;
eb49bac5b097db Anup Patel 2023-08-02  308  	struct imsic_vector *mvec;
eb49bac5b097db Anup Patel 2023-08-02  309  	bool is_enabled;
eb49bac5b097db Anup Patel 2023-08-02  310  
eb49bac5b097db Anup Patel 2023-08-02  311  	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
eb49bac5b097db Anup Patel 2023-08-02  312  	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
eb49bac5b097db Anup Patel 2023-08-02  313  		return;
eb49bac5b097db Anup Patel 2023-08-02  314  
eb49bac5b097db Anup Patel 2023-08-02  315  	is_enabled = atomic_long_read(&vec->enable) ? true : false;
eb49bac5b097db Anup Patel 2023-08-02 @316  	mvec = atomic_long_read(&vec->move);
eb49bac5b097db Anup Patel 2023-08-02  317  	if (mvec) {
eb49bac5b097db Anup Patel 2023-08-02  318  		move_in_progress = true;
eb49bac5b097db Anup Patel 2023-08-02  319  		mcpu = mvec->cpu;
eb49bac5b097db Anup Patel 2023-08-02  320  		mlocal_id = mvec->local_id;
eb49bac5b097db Anup Patel 2023-08-02  321  	}
eb49bac5b097db Anup Patel 2023-08-02  322  
eb49bac5b097db Anup Patel 2023-08-02  323  	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
eb49bac5b097db Anup Patel 2023-08-02  324  	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
eb49bac5b097db Anup Patel 2023-08-02  325  	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  326  		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  327  	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  328  		   (is_enabled) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  329  	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "",
eb49bac5b097db Anup Patel 2023-08-02  330  		   (move_in_progress) ? 1 : 0);
eb49bac5b097db Anup Patel 2023-08-02  331  	if (move_in_progress) {
eb49bac5b097db Anup Patel 2023-08-02  332  		seq_printf(m, "%*smove_cpu        : %5u\n", ind, "", mcpu);
eb49bac5b097db Anup Patel 2023-08-02  333  		seq_printf(m, "%*smove_local_id   : %5u\n", ind, "", mlocal_id);
eb49bac5b097db Anup Patel 2023-08-02  334  	}
eb49bac5b097db Anup Patel 2023-08-02  335  }
eb49bac5b097db Anup Patel 2023-08-02  336  

:::::: The code at line 316 was first introduced by commit
:::::: eb49bac5b097dbda8f0660076a9e109fa4498917 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

