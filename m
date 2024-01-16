Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C046A4;
	Tue, 16 Jan 2024 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKZVFCYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705366257; x=1736902257;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R+mBseFBShSrgzuu0oZgFGPeAa8c8q63rWHU4qE7KcM=;
  b=FKZVFCYOG62BcTNkwGh03uPBNhqSxx2GsBROEaCTt2OJaNmDwCLvjHWo
   jISHhdzR3FYko6M5jPNVatg61WoyGvm9ZBMipTodxgWHTMpg/M5RdlGIK
   poYUPi0pkVj0fIwAwDo/+PiQ/nesvMNxS+e6LYaCsPxbg0xuSXbRL/dCe
   Jko8KNSNDlNrhRVQ8h1oFttbrSQO232vU0/jURrezRE11CsdR5RVGb/Y6
   fkpqMJ4EXJiK7Q6fPAnw5fIamVwzSmsoDCRK58E8bMZy2ODrlVTdAYqu2
   ZdpNR8DIRcPV2rdVjzkhtfAXprcuO+3CXONZRnYBU/wZnetwTV7KY4OEw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="13077955"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="13077955"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 16:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="733423050"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="733423050"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 16:50:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 16:50:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 16:50:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 16:50:55 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 16:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTUImOn/9K4NZUMos9CYe0y+C1ixaqhgtd9ng99FTQJ7DIUiX9kzXhfy1RcBBiabVehQKbNIQzF3UifIyye1abrvbSZujRVARZLCDVvWnqrwtzLX/UJdXy4voUtAhdrYLe7awp7op5kogz20AzkSVsBMJQLKIbxKLMgDOehYdjLzZtjFZIx+JIWq65k6Lufzm7UAVuuwPK6k62I6bKddOZv5IAS9SjmNaTt0iah4bkfDlzv+DhGnT5Pqa0Pi23JhqO9MTQNw7RIXnsvXDX6KYnRfr9blLXLDO8v7FVk5xWW0j4qqmTIAAd0fNHGRTDajscnpuJzKxD/O+R2XwnhhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STOS3cZSsj5L5rjVLCjchFIQOZ4NT8WOdd2Mamd7mU4=;
 b=MpRX4bePwLsCrwpfiLmTYgQfO84S7I+AShQzzl4O9Z3Wib/GpUebDBDYIRciHfUgy7VYxz3heYBiiUg/iuRdkcgkQAQj1mHoTgXUL2B/S0ZOl4u/e+9ql4DitP2TGQ7DKwNx3IcncLsj4IbnQZskX2WEL/OJ2huYhWfBd4OrrrSuWmdN41e4MSYbbQZ//z7sgT8iieo/DUgp3451JJGluyZ+fq5pdED6qmRlgP2jj2pmEquDbdsD9Zj/1UUPOa9rKwUb7tgEmk2w55ohY52MaNLrSGqwqF/DMRh8A3z4AivgJLIVwwhnySdSndMiOwBJKPDmYoTL3p+G564NuGa00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 00:50:48 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7181.018; Tue, 16 Jan 2024
 00:50:48 +0000
Date: Tue, 16 Jan 2024 08:50:40 +0800
From: Philip Li <philip.li@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Steev Klimaszewski <steev@kali.org>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
Subject: Re: [steev:c630-linux-6.7.y 160/172]
 sound/soc/codecs/wsa884x.c:1782:33: error: no member named 'dev' in 'struct
 sdw_stream_runtime'
Message-ID: <ZaXS4Ca5hTXeJgMH@rli9-mobl>
References: <202401152241.JjKK4P38-lkp@intel.com>
 <404c0524-f245-49fe-954e-136351e35e19@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <404c0524-f245-49fe-954e-136351e35e19@kernel.org>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: dac63d2b-9d20-4d60-57ed-08dc162d2e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pV+k06LGFOPhE0KkVas+C+ofaf8UzH+LxlAQbN5iKMYcJrQ8PQ7v4BP5EVcA0ckNyC54Y+SCUxRYOhHabJY3od5i7CTzRNrN2dbiHdba3W99GZYCYBvW8Q5xGzQjsAVQGfHkLg7N6KXfaWAN/ksqUwkg803w+/TR+2aF0PtVWa4eAkJgpCdluHs9QrVaoeiAw32xaAO/xT+7HrGJwSdAt0dc/vBdHBhC2YBcUzGbHjgpAuW/W7j57D9p7EpjcykNBHvUSUC73uPLV9E4MszTZz+dXWae6dpZLvtFkAuDCy42eHqDojjVnfgH/fc5AOCcsIJDLh4qij8cEv6b/g9QIfAX+zNcEjQPuBE919y3AEz2yftWvh4dkxivmttVc7XoNviZEUXIxYw5Inx+kl1BAVUZBc3pvqGQuZdJknZL3r0S3CQTSStcevWH9li+K5GzRpA4w2RRHO+qNpnkb9Bf2MtgWOSdyz1qvZ+UHAdotKKKJBF7AWuRIurqYmm4VcYoayFeWrFoBSjzBr6lQSYuhIXbIM5xMTNk7DPIDYjtW2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(39860400002)(346002)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(4744005)(2906002)(44832011)(478600001)(8936002)(8676002)(4326008)(5660300002)(6666004)(6512007)(6506007)(9686003)(53546011)(6916009)(316002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(41300700001)(33716001)(82960400001)(86362001)(38100700002)(26005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8CxJ/RZdykmgALnohU4Z7LgxnWUiPkX4SK2fyqZg2DTf13D+93dT6eB0TAU3?=
 =?us-ascii?Q?tEJ89n81Vwm7psCfN8OT+zh5UKYdzKvfczXSCUVP0rstZIdsvl0RQfyrp+BK?=
 =?us-ascii?Q?UhDYAcgnqvxh1xIwBlwX3VrmQCpTJotHTJZasB8RqBrkUvkDX56xk5hnPCbn?=
 =?us-ascii?Q?VRg1/maorGydJ7PYGqtH7G5y7gtzRQpPVt/spV7GzNZiwsOP5qigPSB/HIOb?=
 =?us-ascii?Q?HlmEQ9lbFdtquu0pinM0AFhIZRcuuaZvhY/UhPucNfZYo2eO8AOVTY/wzgYa?=
 =?us-ascii?Q?VRNpB1nBc1HdLqYPSA1JNLGqzkD27b+wLWc54kqPLizpiIwC6kTKs8CMeof4?=
 =?us-ascii?Q?rerVJzLx3ze5Qh+GjLRbNtI+vqUZd/IKyts0P2euOF/H/Dcbzal2lA+HaBbe?=
 =?us-ascii?Q?UE+DOtGRl9QHavk/XPz7pM7cIzm73aIWRZzsbk4ROvQzAwulh7AOd0averyM?=
 =?us-ascii?Q?i+9bQo7kMa6qXmWmOXHqbAfjV9qy6Dl70ZtFYmcXQfdzawsKKx4WZf5XBl4P?=
 =?us-ascii?Q?LhRgB31Ol1lgIMlyJqC9nhk9yMHWnua7X3/yy/wAYyv4eoVCp1zoLu68YC3r?=
 =?us-ascii?Q?sO3NwzM7j7Sav+PTsb4Gaov5MCuu6gkYuZwMwt/06O/Bwdr6VLgAWDIwrI7X?=
 =?us-ascii?Q?zLIS1wQObup6/FRRJhOLM0uQZ8xCRHURm1mXS+wX0xh7iY3nm83g2YOypIW8?=
 =?us-ascii?Q?pmVb/EyaDPoNvvkoPSPnc3NWkmkuWWvAflTrzqsL5oC38u2P6K/jAZfUmFvw?=
 =?us-ascii?Q?Sy7CD0GGOfwk+80VDP5fL8nq8F1/P2ixgesFyu7NV928xK3AHPzIyen9UHEg?=
 =?us-ascii?Q?NPysaGxtFD6eXpgtHSjosOvzqFlWgw+gCGVq0cT5qXecWteTv7TeHOnzSQQr?=
 =?us-ascii?Q?/73y5s4Swy/3ARFDq9yORIUKrd2zyuuhfUZpjF5dWz1DJEhCCXhH8XmxfLV2?=
 =?us-ascii?Q?p7PZCK5b0Dj+009EEjdrquWAW29zLvivw4yLsi4i8cEDtmTBqOW1d3YPmfLt?=
 =?us-ascii?Q?t7EUL6jUG4jWYNmb7lI/BX8ChE4eOrCn10EDkPN2X58GGkcFSX6/ENyGpgSK?=
 =?us-ascii?Q?LMriuZAZRnoKCyIIbRGZnUb6PLk/Doykooj+sTB3hntPYa0cF1XHn3dHT19L?=
 =?us-ascii?Q?AZKeJA6FpgGdtarbD5g3a/vRhmBZ/JYikrO9Fn7MCpS5ecv/KakN9hsBN5J/?=
 =?us-ascii?Q?4exE3AP5vFvR5xHIwc8JyU9sB+Xbe2k7aDPSkB2rdFNrrMAjCuJZTkq+QZk9?=
 =?us-ascii?Q?FcTXCoTFubSldjaaDGwmXc8fX8cfyF2p8Vwvjee1uY0O3gpVNhUqva3VVFr3?=
 =?us-ascii?Q?RRMkkEuW7b7vbJtQjVUYdRXEkrh5L3NWsaUBovQF1w4VHXFT4WTi13BX93Qn?=
 =?us-ascii?Q?kZEYxyIUoA5O0WtzuAaTdRI3d5pd3QBtSDeTZShAc4jFSXqkkedofTi/jpDX?=
 =?us-ascii?Q?J6UHUcIw/j74gUUow+mmHhm2hln9+GyCsquzco9wjWcz1tKx7Gj0kKWyE6iM?=
 =?us-ascii?Q?TvZhFRxwGqqnGZHSZROFOMmstrnKVJMwoLwSwfoUzh3cpniTfGD/YNrqLY2d?=
 =?us-ascii?Q?9DR7HH81aAqeYAfKCC8FVJ5zUoCl8pfdHreIn88G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dac63d2b-9d20-4d60-57ed-08dc162d2e08
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 00:50:48.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjG4a9RmuaJSHocBhSyXipUmsSrjAn/bSfMrKk23KpcwoFThSmfAbNdeFEd07OgB4KT8mU89N7Z2PIup4nUDmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com

On Mon, Jan 15, 2024 at 03:55:11PM +0100, Krzysztof Kozlowski wrote:
> On 15/01/2024 15:40, kernel test robot wrote:
> > tree:   https://github.com/steev/linux c630-linux-6.7.y
> 
> Steev, please limit the testing of your tree, so we won't get notified
> on such cases (it's third or fourth email).

Sorry, the repo was added by bot, we have configured the repo as private reporting
to avoid sending report to wide audience.

> 
> Best regards,
> Krzysztof
> 
> 
