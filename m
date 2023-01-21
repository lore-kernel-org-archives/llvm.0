Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE72109;
	Sat, 21 Jan 2023 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674305746; x=1705841746;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FgH8WHq5+Ci8taC81obAFS8CfeLS8uERSdeTPzHEZ2U=;
  b=LIyAKpJIpv/iwXN6qjkKi75pH/NHZl0jIpbAS0v8Qs0qdiLRxvgefahm
   vpeTUZLFZi0fudajzfAYB8a8d2MVVFiTjwC+Vf2DTAKh6XIsuRa4F/ZkR
   q7hEzY8JzGk0wSqnM7kenKERXClUEqqgYqr2Dc57s8i/5aJIX1Co7LDse
   RpQUXD0DQAIZTGG6RXGCPO3SMidBHvryJvwmBQOKGAlcghfvCqkxeIECY
   GY5QSmQ6J1+HqZmCpG+yi06/w58QznjbhrZewz5tpgU3pGx0OfqpEe12j
   1gt9c8c0WcMeYdtMRuk31AbNxyzBe1SvGxjsfITTpNkmn7c1WqozWz+qB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313672348"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="313672348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 04:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="769022379"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="769022379"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2023 04:55:44 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 04:55:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 04:55:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 21 Jan 2023 04:55:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 21 Jan 2023 04:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBUd67rJE5yZjTXb4KAs/HuIjPEU/JUtNigfys98DtK1dpQT+J3e5OCKt/C5ZQgKD9TnQpG1KTYfUT5Rvjb1imEu1EwTDuri0nf3ITW7HcqpVeGfsY1j1K78J+IHPVcDPIGlMvgVadHi+49EISJMU0FXxKau/a7YB2i1sPCMkuqwZu4aIXDIsMQoBTUc0Cxcnm/IGWaEC5yp2LoppqjLmzHFo5mJCH5NNvReb7tellt/oa7h5Tt2cJWxWsXZMfnVcQm7QCYuMzOzPAaMgv4SnXBtAVn4kF6KDOF2m/fGd1gZXTf1NpnZfpIKFg3MoPBW7W8NcUvfEDNKqWlq6g0ytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5/8YEhapqTxrQkPbTomygOwfN6+z0U+FdybOBV55ys=;
 b=Ox/F4jyYlm77nSOAn4va5udJw8TPDocXWapYSx9taXzNXrGa2roa/erEfy9dY9li0W5ZTZODcko+GXnrzHZxOSsxoDQd8qwN8/CMEn5hXqDUcLrQuo05UEbkioNPByLs9wmKwqL9diYy/FznoXSJtcCdCPk/nN/dLBmE7rjvDYXwbj7ZnbGakcFyS2wn32YADVV8UhJvAKJgeGyMQnu++Ai+Ag4ykuFpnf426LKFoQ3EKtZxdPysx4KzPIsULUnTXKBFWx76MjmPJNVSLyPBMwk62lggV4yuBw+43v1d1IfrCQNIOv8bT+Rp8BprhXQtMS7oGDVgX5oifTw9xkvNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 12:55:39 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::6f39:4156:9cd0:daad]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::6f39:4156:9cd0:daad%7]) with mapi id 15.20.6002.027; Sat, 21 Jan 2023
 12:55:39 +0000
Date: Sat, 21 Jan 2023 20:55:27 +0800
From: Philip Li <philip.li@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: kernel test robot <lkp@intel.com>, Yujie Liu <yujie.liu@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <llvm@lists.linux.dev>, Alex Gaynor
	<alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH 4/5] rust: types: implement `ForeignOwnable` for the unit
 type
Message-ID: <Y8vgv0araerhc1e9@rli9-mobl>
References: <202301201612.50oSpQHu-lkp@intel.com>
 <CANiq72=UD2Wnx4WgJSeKyL6WGytadG9p0Dt8YHL2cD-0zhsc4Q@mail.gmail.com>
 <Y8tRMZAwcl6rb6Jd@rli9-mobl>
 <CANiq72nqsSiF2sTOZK-hC2BU8pMHJWHYHVyz=r3qxp2tPEAvww@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANiq72nqsSiF2sTOZK-hC2BU8pMHJWHYHVyz=r3qxp2tPEAvww@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 7647cb33-2405-4176-8765-08dafbaecbe5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuwRybIh9YwaA0sAwIFPXoZu7rTyVW6sL8iTaNAoYZP1qcAD9pjG3MBRkRSeSOpNo/TceE0WHY0MVlslPaD/hHtVZi1disq7tgJx9q12HzACCFVFUXpUY+5JGLYrRJ/tm2WM+XqBML/BC6e3Um5JIarZyJibVGjmGWka4ZjdkS70RWpw+PCHbwDvYmGoydpNLDJl5Uxb3iNr1PIfw+BwCYFxDrEA8BpYzxRlpj9oqyl3YrnFNPZymxzD1xQkf/WN3u1AXlDDx7uRmLAI0CI6RAWrSr3l2DpPQsFEhInu3S1xjnL6xnhDP8bdq9FGL61D31ZvGTI2HkpodwOQD/ZF3A4K/0Loyu9VoO3sw93PJfs88UBUzPJGxqB77ck1Gcjweb5mDy4IDO++l1Yz5NC6gEJ9cC4xR5OFsqbM730tLFll5qbD+N/aEdVt1q7IjswAo+ptAV6rbmbtKzWSnWvPNDVX+l0B1ECBsnMuPbPH3O3Fp7OLw7RXudMcd3N+PdkrnKhIzSC2ZYDhilYolA8keY5w4FDm2duul3CUStpBMacADVrnfZpkL4BL3pYnPYShWatA6kUvMKBDo54mizfSLXyIZ0vtmoO2k/r0og256ER3etDa3TgK+yZU5oQZTj24E1bzPcnrAl4grch6TF3TBvCVWrsqbURRpMwACvenzSF8mPji95Cqk22XHgWj4hsW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199015)(44832011)(86362001)(2906002)(4744005)(66946007)(9686003)(186003)(26005)(6512007)(66476007)(41300700001)(4326008)(6916009)(8676002)(66556008)(478600001)(6486002)(6506007)(53546011)(54906003)(6666004)(316002)(5660300002)(38100700002)(8936002)(82960400001)(83380400001)(66899015)(33716001)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+dewU/UdVFS7wKyIvwfzY5MRftVBi+pLJZsK7UVHmCn2DKWco8lKhhn1WzE?=
 =?us-ascii?Q?gZkH3Jfv7/9ZsB7rgR6cnFN2vy0+0MQU1FJbdFwF6YsoEUilxovG3MV9MYnx?=
 =?us-ascii?Q?ssBrj3nmuayyg4ywlA73qKtBcI86q803cKs/awpOQ3GvWEoDg+5mKj60K3I0?=
 =?us-ascii?Q?Mipyfuse72JYtdHI5M1ASen/PLMJmyU4RiVw7ENAXAOSCzZcBsB/nsI9EMdV?=
 =?us-ascii?Q?aaJRNm/WG5GF1uTkFg12yvm4MPqLjwXdLgukjkJDiVujpEDXpeVuABhD22Eg?=
 =?us-ascii?Q?SMyF18iVQrTfRT61pfv5cfqjyVssAcWJHSe3Mdlg6Tj7EVxXBB6hr7JP2u/O?=
 =?us-ascii?Q?deM79u9cmPsvnaG72pesL/sreUB3hV0r9DlrtHDbchbNq5VyO0O+Bvb0aes8?=
 =?us-ascii?Q?TYUpCveN+PzU6gg2IJK+v7S/m7wbQJrXnYuo0cDNFNgEQvfRyJijt6UFpoBz?=
 =?us-ascii?Q?WihOREX6Dd13a79oOVkBxabVSR8Yic72UNhcj3YrY0pwMFPGAbF4lFy6KDWP?=
 =?us-ascii?Q?Wu8zLBiVrmLShm/hUUQCspD8xxTtXcDSmydVGaGkGf+wjEj98gGWvrApXa3V?=
 =?us-ascii?Q?W4BtCvD9wyIQk48dL+9mO41e+jjYQCC+IaLL1dDaZj139FTWzt/hrY2EYnRF?=
 =?us-ascii?Q?R6nFnfuQwXeUne+Xs3DNkBiO8R0AuUjBUSAPWDRKRZTsRkVQtYaQ3oi6xL6g?=
 =?us-ascii?Q?jm9o+2zgkJme0S+53U/XFLJIAcTxPLaSGuLDOlWhMa/7qZeCDMUD/JZ4Qk1I?=
 =?us-ascii?Q?GTxrVRqvcQV/RS211skuRCrgZTH/cd3/qevnh6K3jYvgC1E+O74tPN+ofYGD?=
 =?us-ascii?Q?6LTLG/SA9bBjOFqc1/k565KOTY5WlpLM7+qzgRQx7rtSNHSX3l0c1MO2lu9l?=
 =?us-ascii?Q?wvVo24mBCWBd5NhBULNcQWJs7Eca4jfOfnhEWj6Zi7sq7NoctVHmvTgfG/BL?=
 =?us-ascii?Q?xi7AcAYi8JGiYFDedKEprb9jT8XfeD1hKJgm9+ySN24FEFCBh7onyn72jDl7?=
 =?us-ascii?Q?3MULpBxEVGX5pjNnf6h5kQw0K3MarT7O9dL5zB7SgsGdaoowYo3Di7mEdzqL?=
 =?us-ascii?Q?fatdtVZ3aCkDDW8HLMH0gceozDGcWzOXdPWZyZIDqzyNpn83hvmV6Kvfu49w?=
 =?us-ascii?Q?iK58yR0RTpD5rbufmWDFWnjF7XYztQp5Frp4fsgNIqyiFFMwdKF70YijksET?=
 =?us-ascii?Q?09EsEDp9fHJeeS/1GQ8M7TRPkc21jFmHb7C8JDI4kBvNmhPZ5Oc7wSS2FRbp?=
 =?us-ascii?Q?AqntMbnGE5+PPnKWqL+HrPREOGAFRL/m5+9y9NcsVmrOcjAqy614YpMrL8/y?=
 =?us-ascii?Q?g5eLpbZt980zk8wjZ/wOhj0dO9Bxy8fqHF2f38pYs2oYNCUevk7/1CHJKtPZ?=
 =?us-ascii?Q?bqsH63nPtjXyJu3q4YR5idA+1ypVUpkQqIlG/a561XO7E2oBz/Nqjn9ANgtY?=
 =?us-ascii?Q?ba9AnMFwVH5cSwAmotWyxgeRNch+qZw/nxJt+O2InoI/9ZcdqvowkcCByGvN?=
 =?us-ascii?Q?/dR3kDM5WOK+Tz46gP+wbGCXMEKEs+IzSWxbMS5iEecv9dItz0bPf8tDzYpD?=
 =?us-ascii?Q?g6H4DH6+mHrLSxi8ECnuZDyki0g+soyfu+MrWmyy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7647cb33-2405-4176-8765-08dafbaecbe5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 12:55:39.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ErUZN9irar5hssuYq6yZqfkfFmXxaWlJ9sZCgdzcQqxjn8CtJkomM52n3Hrf9Np2CFyN7QHyG/fINjWTDBY6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
X-OriginatorOrg: intel.com

On Sat, Jan 21, 2023 at 12:15:58PM +0100, Miguel Ojeda wrote:
> On Sat, Jan 21, 2023 at 3:43 AM Philip Li <philip.li@intel.com> wrote:
> >
> > Got it Miguel, we will disable them for rust related configs.
> >
> > thanks, we will do it asap.
> 
> Thanks Philip for the quick reply! (and sorry, I should have Cc'd you too!)

You are welcome, and thanks for the input that we are not aware of.

BTW: It's ok not to Cc me explicitly, as lkp@intel.com account is the mail for
0-day ci team and the whole team is monitoring this to address the feedbacks.

> 
> Cheers,
> Miguel
