Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A431D690
	for <llvm@lists.linux.dev>; Thu,  4 Jan 2024 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht20rcuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704347509; x=1735883509;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6WfzbZsU9uEctQfUAsJyULgDtSFlpCWx7UtLfTPPLKo=;
  b=Ht20rcuhnnoF2WQTLSOTjb2ERSxxw8UBxNUy48d3ACk0lsfmBYSuX3pC
   rxAwGGa6wefnZ3NIXPls0SIlKDGjpp5HgJs4HNIIm17uIjPcM5TKgULcx
   +PmhoC7JttjiAUm+3PDdfBPGkk16/2fcpFRW3+vBzAmJaDngvE3QWCqLk
   8TO6pmpViNMPJxPNB4aVtKFtPPG2S2Cw6yOEvGEJWax89iKbEmGRUt184
   TUUC3X1trDNughIS5DLf8VwE+QIwkqySzke5FmmxN/MSLPQJXaolIt0/G
   /40tpESKLCCIAYPdJvnXg/p+RZ4F3OApFZ1lJPROh3jdVeR68kf5ZJpSi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="387593187"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="387593187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 21:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="730025742"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="730025742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2024 21:51:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 21:51:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 21:51:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 21:51:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPyAHo+eZQkiiQYOqqKe5f2BJJUGnO2DwAR2UuOwftPprCgySILFj8OL/nVYiVwUE0hLU4oONRNJqkycqLYfRTmLNbf8bL2R2D59J+eVSM58Kw8WsGpzLY2ufjRs/499uJUcvyK/5o4rZGzJRPEwYZw9PjPOIjMbDAOBF0dkjic3sj6cYsb5jkEEWP0VE1JEdYedTGhi9uO3EJ9yOCs3OQiLa3cYn9e9om/Pemm2mkufEG76HGdPQ1thZEuoLmsvpCmmK0IXHMkSXVCtB0uWxlh4pTr7SQplRZNhVArvOeKyG9386PKyASCRcVWWGGZnRZf4ghVvEhstk5DX+J7OiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jASZzfiDts+LvUGlWwSCuYjyRQaoEP+uyqIyEcQAS0=;
 b=NyE48piIpnhx0wDtC7ZzQxCFbC9EHM2yEefp05RusDCUS9KurDGdLuAyB3zGGwTPA184jK9QnSvjzp46fWWsNfV5WxcMjkHkM/zf9sUg5P7hYOL0MibHK3DuaYGUcRIHEzN4rlTOXcUprfP9uZA1XvxhzMKCQXbrRIc0mq3f0HeA0HvATF/tNSARnr0z9hA0xJL8/GSCaTLrqCTqx+pTRTE76MAYQ1QTuYlu2wA1PiwLJDU5hkHjBxBW+tyi3fN4axyZB4iE4RVbsUNLrlnxDcukkZM+v6QygUfzvP+UoBAcna4C2JKUJ0xw2hv0WYx7TlGRd8g200gK8DG0H6LoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 05:51:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 05:51:45 +0000
Date: Wed, 3 Jan 2024 23:51:43 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <llvm@lists.linux.dev>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
	<rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix warning on impossible condition
Message-ID: <z6l2smdzqxs2i674f3dieznmw6qiv6a33gkbcxhuun5hqksh24@ytp5tgy4evqv>
References: <20231218163301.3453285-1-lucas.demarchi@intel.com>
 <20240103160736.GA3837497@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240103160736.GA3837497@dev-arch.thelio-3990X>
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 258cb3a5-5a02-4c76-2ded-08dc0ce93c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fsnwQh45dpsiGKgjwrl2IrsAGBRKJ1ndF6yTAb+tI+b1nJbd1woPB38GcR2FsFnx/C9L053sIiaCO6CqpKEWcEix0iP1GBJLeya0MiYJTuLEXpiD5rsB64URz0GMhn2O939J4ypaw0f9Fa95RD3hr9G35gYh/KKh6ZD/GGHwx16BFNQAUm3MYum816RhZcX3sm1gPuca+1PFMB52xfB+1KUf4ibfzKZP0Uynk6O/UNGoUa8x8fLwbtpWhgfAWBABFsejjDFdJo7LZpbog/PNSoEobPHXBpnoT+fimzFTMJeP5WQNU+E9h/uzbxu+hqtbT69uvI/qqOjNMNVfst5LSB7EX3yjq5MCu6MkCiZPpdwhG8HmEHpSQXgxgVpWie/9WtlA7+HIoR5G37lSY2YGe/a8Xpw4C5wkc+0lhaYz5Pg6OwYItW4B3MpJx09SJ6kiCilQ42b/BdS2kiqV5e9pZJVuwpCNsCx3qIxw0NUBbpUkbjxheRBxVBr9tvtucTLcRP2maPFxrQASDqKf7n6R+TOZ1JmjGO9uO1pD00lY+odi/Za1Kc+0wTS0nGIDsuNtaYPJt5BnH8iqD4WF9++Zd12oCUY9hsoFyghDTw1hXtlJMBUTd3lsAaJfMZGW6Prvjlq6nFYtfBn3yi58QOd67EkBFhuzJEQrblmW/ae8p6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(376002)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(41300700001)(66946007)(66556008)(316002)(86362001)(82960400001)(9686003)(6506007)(38100700002)(26005)(33716001)(107886003)(6512007)(966005)(6486002)(2906002)(5660300002)(66476007)(478600001)(6916009)(8676002)(4326008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O+CsXIlJ0nXnjlbqtNuM0O2tljRblC5F1AoqiXNkJ0kTJQYd2VvS6T0ZWlyO?=
 =?us-ascii?Q?qj+iET+isk+uXMcjM9h3RBZhJ+yFirR/H3W9MUpsARj21MdV3o+YSmOMTBuI?=
 =?us-ascii?Q?0mfVQPzpt8mr29T9elPdApZgQ47yXoFxPdK5sT4mrnbTDYrTc9TaVjxZ37S7?=
 =?us-ascii?Q?VX6ZcYlLBdrUmWW0SFl2LLva84iDkUtu6KD3ksW/ctSVZFiPGxR0CCq73CWl?=
 =?us-ascii?Q?4+qDMR8YhxmPrUCqArTB61I6mUeEI6fcOP8pywp9H2gF43o6HGJBlMMbh6PK?=
 =?us-ascii?Q?WQdDd5KApDKMV5Gx1CPRsWZ7QXLxD6qR2SSQRrxyYa+3dPorNT8J0mLDamqk?=
 =?us-ascii?Q?WfFWG5BkfVoCNq5ZSnlLzcf2CaBCzoJsG8FOvjS4VXDVazvGy+JMkrYv0Rvt?=
 =?us-ascii?Q?1+OkYex3Acw6yBt7hErn7CNiCdMTCPTH2XnS89hz/L8O9LFpQQ9jkbjKzxT6?=
 =?us-ascii?Q?sNfNeY3gJdZjrAtHVAN6/eFCCHzWxFTDVPx+a4M3oXGDeKfkuhzyPyre3rEF?=
 =?us-ascii?Q?gCzgRsY0YYsi97W5qgWye1NLVPpE5hjuWjoAt/eCRdMoUybRVIct8mcnVEq+?=
 =?us-ascii?Q?oZA4EkBLD/oxlY2uxZ5ik3JH2LQd3jJd0U1LSTLpziN9VHMZ7uXJCihPeVnz?=
 =?us-ascii?Q?79lp8Koxj09Z7TfRilNhhMBfealLsCSpvYf5b1L8a2z3N4uR4nvaB4flsFc3?=
 =?us-ascii?Q?DTa0OA1Tpbg95itoXhbXvPilLztBhAL/S7n/cttopI7uegND9bGRooKKgrzO?=
 =?us-ascii?Q?Y7pLkBImynMg1L99IXiVcA1o2SiSBPsl1MHvcvu/IIp7+2s9wBYYRo2DVUUY?=
 =?us-ascii?Q?hM9GtNuRYTd0RyrMmOjCW3PYPB8ZPLsw5Q6BZr5L2DXyUwr2XznQA/VZt0l2?=
 =?us-ascii?Q?L9UTlWiyd1D8Ald7Vffw9D0yvjV345q1Bc9YSN2z2CNTAqlZX12r666mMCYG?=
 =?us-ascii?Q?mMJ1eb9MW4O/zZR4+raP2B5Ebo7rlVzN4GU9vLBFu/Jq/3SHo6pKbOPRnrgB?=
 =?us-ascii?Q?UFcqtdEWbv/dGjZASgtM6dzf6YZZYAgBVE80ptZ2+yqqv91sKI9zV+XX9+eZ?=
 =?us-ascii?Q?sgzKM5pzVRgndCk4sJLZRJhJ7tOQXRnK/O4g5yDRWmLS0a+rYB+kzvJg0kLk?=
 =?us-ascii?Q?fPGFW4MUQuKjYAoenyZx74k3/EfIMjIpBO1bXnwa2MQVTyfpRPi75jITBTKU?=
 =?us-ascii?Q?bnEjWMhDxYB7uivF+5Y9+Kzo9MF9EC5csfYcCxh2k+qmUQIEHwKUbKXcH5kS?=
 =?us-ascii?Q?36EG5TG9C4Yk2Im4G4poRmIEp+VJ0BREaC5jtXrqpH2EF+xug8Y+ajN/FqwV?=
 =?us-ascii?Q?oayjysOmmsW+nMh6Dft8QgZdTCTQg3+H59QmNGAsSvYt2iR0q5U4T30r0SSl?=
 =?us-ascii?Q?kDOjFnTYJl0/9ZXCj0XvKvf3Fpfz9LV5ZI6+b7VVscgCmxuzwd3aIERN6HEQ?=
 =?us-ascii?Q?A98JOTr5r0roqqZdSyMy4eaIV0QU1k8+CID7LM0K8OwhBbQW2fWtMHhGregx?=
 =?us-ascii?Q?YreEh+145k/Ng6o8tXzCZ+yC46fyMd8kwGk53JQGKUYsjUsBZIK/cWC/1oA0?=
 =?us-ascii?Q?ud+nuxSjXKpwZqodq5lbSmSSjD5uwomT6cuD1SgHMKkXHudfdedFQ8U1Xgvk?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 258cb3a5-5a02-4c76-2ded-08dc0ce93c0e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 05:51:45.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSJmObDEFlq3CKMTGZSW0v5usY8wb6BZv+ba1XhAPdQJoaczHq6dgYwdNAavLr8KuOHf8qyHei1QF7vnARNhK+QVT70rieWGderzrH/7tWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com

On Wed, Jan 03, 2024 at 09:07:36AM -0700, Nathan Chancellor wrote:
>On Mon, Dec 18, 2023 at 08:33:01AM -0800, Lucas De Marchi wrote:
>> Having a different value for op is not possible: this is already kept
>> out of user-visible warning by the check in xe_wait_user_fence_ioctl()
>> if op > MAX_OP. The warning is useful as if this switch() is not update
>> when a new op is added, it should be triggered.
>>
>> Fix warning as reported by 0-DAY CI Kernel:
>>
>> 	drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
>I am now seeing this warning in -next, can this be applied as a fix so
>that our builds are not broken?

pull request including this fix was created last week:
https://lore.kernel.org/all/ZYsbDPBLUiqDevLt@intel.com/

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index b0a7896f7fcb..a75eeba7bfe5 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -46,6 +46,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>>  		break;
>>  	default:
>>  		XE_WARN_ON("Not possible");
>> +		return -EINVAL;
>>  	}
>>
>>  	return passed ? 0 : 1;
>> --
>> 2.40.1
>>
