Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74453386;
	Sat, 21 Jan 2023 02:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674268991; x=1705804991;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aGPiyCWlJjiKpLDmJv1+FSGVCL0IX8RyVZa4nh60bFU=;
  b=MZ4PGVCmnTm7ry32GpWo/vkZM01edmeRAtkjn0nx1eFyN/Vfd+Mt99/K
   Rzg7NFm5COd+l4xdy4Wg67gmVH/uXh+OfoMX5tsLoJ1MqwLdr9rcGWPWR
   mCATX58HqkbcRLjohW2mO1z7O+CTCFt0mEcnB4VRtYnKDsWooxY9161SX
   0F4Wws+Ow7HW5e8ltdiA1vldG3kc+fMbTYQuo4u2g0ZYq6oAb0dupfXPr
   v4UnyXdPWHnY1Jq8v69Nbmfrv1Wxr26hrfq155TduT+243bS+oNCZlyG8
   YkLGluIN4yvYM+MazfSvvIvqmvSoboyxqTHja/g7SOPQoJwFUJI10X9Qd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305420893"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="305420893"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 18:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610677382"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="610677382"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 18:43:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 18:43:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 18:43:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 18:43:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghFHoVw/En365ZJQjRiHvwsJEmEBEj5EpvC5+u5rWMSz4TGu3+rSyeocuawjDSzXXHbS7mZy3bPnNnh+epT1mxAo2i1acmsMnRpF/SrBvp0SSFXOU5mb7pkcgjUc/IVZGjKM/e9ytKH3zrDzwau3hQ57N7K0vL78KF5rK9acoshMwgKb9ajVCe7dZMsy2dN07Ibg9yIxw8+gtUPFMYCFb5J0ZACmefR21wIxgn82YrZK+P8Ul8Mx6V1Mnhb4kCeh1tOHMY4zVqg4zLxO8Q3OakTmtTOO/0UZ7wUNwI5Mu183B3gmdSQ9na8tDtQTzWg1Aw1UF6EjUnO7HU8m1BjT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgN4pTq9u+jKdx8YnU5ktDqZzJXkatth3nTjwBlsGdg=;
 b=DE9rSpKV1o9Px4Iuzgz9WCAaIEFa6jqXmGoQEOW3rpLtdlGt/51Fke0XmoK7M2o08WP8Npl1S6OtuFy5s0aGTtlgT6JlETpQvEEhYvUEXpa9B4rWvSMRODyGVNHVXzb2uk1iZ1H3HyyROt0QjRWTKtB7JLjNaQRauR6WNModjgQEfQWNAtIODWvxgvaodrPoyLXfXOD+zeAiPIf7gtfVStX4L/2Jbps1TfOR58e8rHMyhoqgi2kDUVuQcvn1+/TEm7BiuWzLA1+3pob2DFHvQxO/lYmFSg/8nvJFanRY2+bxQ2Qb7YwD794saLK5Z1+QOjmBnXqWBZ1ZFsDUjtsueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.28; Sat, 21 Jan 2023 02:43:08 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::6f39:4156:9cd0:daad]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::6f39:4156:9cd0:daad%7]) with mapi id 15.20.6002.027; Sat, 21 Jan 2023
 02:43:07 +0000
Date: Sat, 21 Jan 2023 10:42:57 +0800
From: Philip Li <philip.li@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: kernel test robot <lkp@intel.com>, Yujie Liu <yujie.liu@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>, Alex Gaynor
	<alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH 4/5] rust: types: implement `ForeignOwnable` for the unit
 type
Message-ID: <Y8tRMZAwcl6rb6Jd@rli9-mobl>
References: <202301201612.50oSpQHu-lkp@intel.com>
 <CANiq72=UD2Wnx4WgJSeKyL6WGytadG9p0Dt8YHL2cD-0zhsc4Q@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANiq72=UD2Wnx4WgJSeKyL6WGytadG9p0Dt8YHL2cD-0zhsc4Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef480fc-8747-408c-837f-08dafb593a34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7n/8oDWdqMrGnMzrvjC72zY4y7HnNHHnNz1vNMGdSzpegw8ywJ4K79yT4FmNGtq+gtqk+oHNbxchhbIK06GxlTeGF9Ux6MT9vluNzSgwrD0XplXx1QFr+NcnEthoT6e8TOAmi+qTBbU1+/98zeulBj0FFPImYyZo3SfbWE4GV+NQyLC1WyBgR8n5RHurYpr10Y4kMgrPdEX49gPnicHFCXv4AYDdS7mjz+t3ocZBEgl2l7E0iNM8X+Vvw+7rNoxAhjpk+3CCSTN0i1e3cYPevfyg5QXba46/yaw3PByQyLrVaMMLS+o2r/7lVIyVXr/xn14DgYc3z3uMcuPyWOxxugyPhFzJzTBTA/Jq0mgdpb30pH8VUcdg/WMwnPKGB7AApfIgZh7v3hceXlN2fTYVrIbXDyGk8CDwpeEjZYzwtMsJNHK0yljsRHJCqKunt0droH41M4j3mz30ktL6lgedbLmZP3M/1xhk+ISple1rvpTVPVhcaQswRv23eAR2ySgDWrKzL3Ta3G5pLCloVoxeEe55RP1CmKWNB5fulv/QJFizoscJFc9ireinulUBvl+mo2ijRiHU59hI6FFOe6aETtKYszgELlNXZNxxVlhX5+RWdHqmtPTXSS7LoD00Hghy7h/U8V5FRSafeSoTi4KzMBebM0c3LcynEVHqAkRpKWSY2qLPIIFNtBN1MNzySYmLPDFuxYVZe308TxzUjp6nhYH3FsP7zuIhshQEu2Uc9hl0KTT+kKZB6+m7+1SjB1/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199015)(33716001)(4744005)(4326008)(6916009)(66556008)(8676002)(478600001)(66946007)(41300700001)(9686003)(66476007)(26005)(6512007)(186003)(2906002)(86362001)(44832011)(83380400001)(53546011)(6506007)(82960400001)(54906003)(6666004)(6486002)(966005)(316002)(5660300002)(8936002)(38100700002)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vQEEhLb15WGykUEYiSYm4iwMLe5IEYMmYUHl06tdT95o8r5Lox8ERVmzcTJ?=
 =?us-ascii?Q?ySMpnPsYHVFV30weuOUswwRedFNssQ0vC7S6xy9gYEL0aI/2D4grQx6Du67J?=
 =?us-ascii?Q?sc52ApCFMNXHdhsnj0yYB6wcyM0f3j5k23scV7Hu5hBNK+jcOuDQS18/VP6F?=
 =?us-ascii?Q?OAfUmjbuxU2DBncta0F5cyKYy3l2TVMp5mLXHiKusHU7Q6Mbs0p2nkgUtZua?=
 =?us-ascii?Q?MaSXJHMplrSO7Skbdl0gu/OM1gOkuYRVAcb6K/6Wb+JHSg6IqbxIyO4z0Hgr?=
 =?us-ascii?Q?xUfZd+cOP5NmHhhNs67jv2LeHV+4HSjIqbYSBVvFhl1DRXqjZjwmqLSbZhqQ?=
 =?us-ascii?Q?RlKzh1I0afpmXmk+EplQRzkp6BanXYPjTRjQre0cH9lWHh2MeY+Ycz6VZuft?=
 =?us-ascii?Q?zAJc2dRsKQtJJguR0qs528778HOLQHd2V0H0NQlB1cUCwOFxl9L17H0vxkfs?=
 =?us-ascii?Q?ZHxxL0wMef+shoEc37I69yAeJpp9zXL6ptQlFCCVk6KK2q+15/bkhvKzmYHa?=
 =?us-ascii?Q?QPhweQOdWy8u5pWNd3yNiyBzy0TqAIcoiASvgo441ajUG4Y1XR+MP5razQU5?=
 =?us-ascii?Q?ZNvwq9AqhlDyxchN0qAPfPCB8CwUr8V/MIvuAJe3sePH2dt9neYFGNNP4xyT?=
 =?us-ascii?Q?oY56qL1ath5eID8bMQhwc5AEdzlF5vALq6NSjTZKYi4Qd93U1BrbovdZt655?=
 =?us-ascii?Q?krM+spbaAixRY1Iop8HEkbHJ0oj4ONBIg7rQa5i+M2bDVX7RMIfcni3PaSxb?=
 =?us-ascii?Q?VG7Im6jnYEq4Gk/bSScKzV3TjrYfKdxKgcsIEBn+AJBuSVM/r1k3IpFpggYC?=
 =?us-ascii?Q?kryCOCbTTezunEGLV/TewKSTkF5u5t+OlPTfc2vmlIS49QgdH0EInJbZ7te4?=
 =?us-ascii?Q?27+Sp96hts9uZXSksaSRAM5sU7V4p9zt8W2293C1RiJN7BmZy8lY6WNX7yLT?=
 =?us-ascii?Q?jnMqMZr+/29NnGfqHTXTx3fpp+ygjCw4mlzBATkJDS9qYE4YO4U5if6HzwX5?=
 =?us-ascii?Q?I/dgLM4D2bj94N6MZC0E4cFta20Xu0l3e7jo/Eifjl9g+1zn5Bsam7T1sbct?=
 =?us-ascii?Q?GglAuHI4MEEpbx47l4ZtrjfvMZGnkIVxOCfr0udQB4wmWfH8blfll5LnknQ8?=
 =?us-ascii?Q?QnhPFPPWI84Yputhk84oCAOZEjV9GhxdB3pSxP4SISVdFt0C8LDc75Oc+4fb?=
 =?us-ascii?Q?tKBgLGjSX768Nwaf/t2+84lUf8NeNUVMoxjNo2oS+0YQXJGGMUd4ToMjjcx3?=
 =?us-ascii?Q?9LHyosD19O47Qx4IngxofGyOAbcMi8P/L4iT/7vUwAkjvPhg3hVjj+0ak4Le?=
 =?us-ascii?Q?r5xIr6k7uafxay+Yvp9KMnoB1OM7hLGxckL0M8MaDmr4p3+K8l+XPnOz34tY?=
 =?us-ascii?Q?rDRj2EhI7AOoqi0dWEYK0RUEBEEyW2sb9oYQKmqwYZMh+UIcjOuBH8Q2D1eU?=
 =?us-ascii?Q?vSEtaSY/ntX7YnOxpB+Sr77US2qjygtO66XpHWXfnqLuVDNthsL/TMmlB36e?=
 =?us-ascii?Q?xnDV2gVt6z17HLhBZq6Piq0dtDZc01Dmq2qMBnGxCVSgO5cqNjzOB6EAcPLR?=
 =?us-ascii?Q?GxjP6Apff3dvf3c/RrZb/ubd09GMQ0vqcGYdqU3N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef480fc-8747-408c-837f-08dafb593a34
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 02:43:07.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPQC8SktK7h0ADnVdBZ6l3LIx520bpCP0rpc0pfXsZcccXN8K/W6N+Hd01Fi8gdPIJSQq87ptwQaMbWS37h88Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
X-OriginatorOrg: intel.com

On Fri, Jan 20, 2023 at 10:41:39PM +0100, Miguel Ojeda wrote:
> Hi kernel test robot, Yujie,
> 
> On Fri, Jan 20, 2023 at 9:15 AM kernel test robot <lkp@intel.com> wrote:
> >
> > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230120/202301201612.50oSpQHu-lkp@intel.com/config)
> 
> Could you please disable `CONFIG_RETPOLINE` and
> `CONFIG_X86_KERNEL_IBT` for the Rust config? (e.g. like in KernelCI

Got it Miguel, we will disable them for rust related configs.

> https://github.com/kernelci/kernelci-core/blob/main/config/core/build-configs.yaml#L410)
> 
> We are discussing whether to add a `depends on !` or other approaches
> on the kernel side, which may make that redundant, but meanwhile it
> would be great if you could update the config.

thanks, we will do it asap.

> 
> Thanks!
> 
> Cheers,
> Miguel
> 
