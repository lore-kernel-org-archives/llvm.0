Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2D7C
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 03:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659668777; x=1691204777;
  h=message-id:date:subject:references:to:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m64Tg1lPP43QTkaNuv/NiTylu/hzOIjadKSgVe0zgl8=;
  b=WVgaifMBfJB29xteoJgPl6MsSJ+ZiT+vOF0jW2XkG6IpWfL5M7TCU9v6
   vuJ6vJc5XEjP9URHrtj2Jyn5E4jr8XZzEzjzc/R0Q1eQ/oFt90Eg0Etaz
   NvHje14QdU408law/U0CdNKXS5o0NiWX3UBeOfMIwHizYllxrl1LPm2lH
   Dpj74q3zkpvaU61UZnq2KyELYnAUaMowhOKWPcP4DzrY7fEv3Dg326h3n
   Qaactw5jI7qvomTHG8523TWIvKDagYLLgv78u+esHq/hlfKl0mETShw9i
   uxcRWOBwAVdUKs+js9xXZEV5uHv830UwwQkCYTBWvrgIoPnT/+DbGSg0w
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="270490941"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="270490941"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 20:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="600233570"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga007.jf.intel.com with ESMTP; 04 Aug 2022 20:06:16 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 20:06:16 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 20:06:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 20:06:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 20:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joG6Ml1amhCZPFPfkS0VeWiGi4QzWo452RtKzUsPDEyu3jm0DQjNl/5PwDMAcr5A9Hr302CmrO0iHECA9hgy2ytDV1dbeHgraVcU5P5Cks6ousHA0cpJpAAX5t7ClkoK5fMjuBTdTJufJVXqqc93lBCKs/ez6eHgVz5poFaxvj1q0ZcsfsT0ss1fbCoerAF3JfWqV3TZZavSmBpYalQKicLfit9Haol/kp4cMqmZ1FtMQuqozj7iQ8fjnkjmU1lEVbEY98HrsLnZ/kmQ62S3B+QpE1hDcBgDU+vsjhDhnqZFIpfY8fP8+43n7sCG63A1fPlP+ZF5jdAR3lGnCVoVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuFPkZIKtiVpMvRa5zqIo9Av16HciHD8TxrW1lb1ft0=;
 b=CB8LRjOPTj9lYyCnkjfRIEzQSIq5tzRES+PgekxFpvpsw/bQT13inQY0XROKG+koQ6zvN8VPM4fctf+zIAiolOeqRpgZ88+zZfNLQlArk4c5RRH94fm3LK4rCmKBDGDP+iVPhkY6RefSn69oZai6gxNPFm2YHl6xR/NxILmUZc1YYk+orf1wM+qWrNUWWDSE90RYkwyTLdvHRTh7vSAt5bGlor6TO9yQBQqaj2pSlMPmWs+0a7gAZ93HZsN3ny0chla2VB/WHJmN+3mofBDYS6JA7x/IA/p3DheAwH/XKi1/0pRPdz0ecejt+GYDVqjm0yKx5i8RQbWaj2EnfHSWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 03:06:13 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::5d19:fbdf:562:ac80]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::5d19:fbdf:562:ac80%5]) with mapi id 15.20.5482.016; Fri, 5 Aug 2022
 03:06:13 +0000
Message-ID: <a2ba8e2a-60f6-0c85-8df6-7881ff6a763e@intel.com>
Date: Fri, 5 Aug 2022 11:06:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: [linux-next:master 9724/13542] net/mac80211/mlme.c:1161:4: warning:
 Value stored to 'at_extension' is never read
 [clang-analyzer-deadcode.DeadStores]
References: <202208030858.knIauqwf-lkp@intel.com>
Content-Language: en-US
To: Johannes Berg <johannes.berg@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202208030858.knIauqwf-lkp@intel.com>
X-Forwarded-Message-Id: <202208030858.knIauqwf-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c526ec9-6079-4140-6073-08da768f7477
X-MS-TrafficTypeDiagnostic: PH0PR11MB4918:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tWxFYCaVrxggHl6r6XVPBK+9ug93b84B5M18zQRgyutRSFJT519B5ANaC5W6MiWqSctUQSu7bKUmsaqR0kTnZDK/KZqWWPIVgL7SfK0kiBbj7FNKSPx8WPvw/KKQlJzezyQA3129cHOJmEHwV+SwX+BwLJ614SWCc9S9ixgDvItLASh40mX2pqmEpdlCk3Dvr3+E6osMszYNwzxeyZW2RprHVHpuH8bnvNOBXVA8XI2S4QsZqOUGtjeyGW8AY22Eh5J+3rZvmgdXqpu1fpnKO2ciWHZppTKrYGY5/JWbGAsqCcnzHo/mNmxOGKze/qqY1GmQX9A+yNPnGIN9Bn39RRcMqhLwskt8wCPKoElApOIMtOIU4dXxt3lk5dDByYkblN5mba2UfQ9T18yr8fYMZqX/gb5fkbWOQj4vH/ndzyQPB/hZmGXncZyZxVcrdv2JfUDJy7UIMUs23DN+b0atnkYmqORSJRdL47TRlM1jOq9qQQrVp751AXDggSVRp/HyRXdWv9GxUxzvqwbf6Uawur/kz3UKeUSpbKie42YiOrbMDJFopggI77h2WjFx1Ip9b25lYmCJMaf60FoS1aBLXCO//cBnud7yE5VYiYi0eyj1dMF7WdVKvTmu+zPzPcA/GuwL3rLb/u8slrH/YZZsQWD/mGEEKqL5Gyez2pKEHMVtXgz7F7Yn7BgwmYiZJJgjbT1UBktJR0/2olPAix85/03M0bi0HECLHW/J+oYab3IuLEtIJGI0W0bFOwbYDKdpW8S5I2/GS+JSTwW2RgMxvoT+EWz9tmsePzd3SR0AhV4HdFFnsciaM4s61KcTNuYar9sQfid8LGOjpNRxfC+jZpBIQk4wYozoUPOmADoeLMjaDfQqAbzHBM+HHajP7oknD+ifxukEGho6QsG6lzWSyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(39860400002)(136003)(346002)(66946007)(186003)(2616005)(6506007)(31686004)(966005)(6666004)(2906002)(478600001)(5660300002)(6486002)(36756003)(86362001)(66476007)(31696002)(8676002)(66556008)(8936002)(38100700002)(6862004)(41300700001)(4326008)(316002)(6636002)(83380400001)(26005)(6512007)(82960400001)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXUvMUVodkNoTURnMENRelo4WHFkQ01NTDFzOTNOam05R2FJWkpjbzFUTTBr?=
 =?utf-8?B?clZXblVUcENyZVVoVzRna3ArcVJxYXFWL0lOa2U1cFhsYmR2bWxGMHFZTmty?=
 =?utf-8?B?OHNRcVZKd2FBL09yOHZGcmVOYVlXWXlZbDJSZExXdUI3MWp1NmRSQW9pVzVK?=
 =?utf-8?B?ZytOUUh6MmVKdExkTjVadUg0cU1SRDRzL1BrcXltL013MVVCeXNEN2R1bXVK?=
 =?utf-8?B?SkdHd1FtUk12QmM5TE5mNzM4Wnd4TTY4aGwzN2xmQkZUS211VFNYVzNybmlz?=
 =?utf-8?B?elNYSUE4Slg4VDNaUHdrcGJ2bWJuQ0hJUU5NUVVFWHZBNVRLUUpGMXFzbFYy?=
 =?utf-8?B?Z1dwZ1hqY3NpQ0JpZmEwTmx3SXBpd0R1YitvZzdTMTBRL2hlZTh6ek00TER3?=
 =?utf-8?B?b1RNU294NG1Pbm9IWGRqWUxERlFlSUFTUno0cmZQSnVmV1pDMWxjdDhNdkJn?=
 =?utf-8?B?NWJyTmFYR2RDYWtQeW9UaVpCTjE2c2IyQWhUZS9FSHVNcC93NW9jaG5KT2la?=
 =?utf-8?B?eitnN2F0cGtmdE8zVkh2YnpLR0hQRmVHdHZqWk9vOUR5d1VhK3dFRHpNMHA4?=
 =?utf-8?B?NU1VS1ZTRU9MeG5QSzh0TkdFRWFyS3pWOHhNL055NTdCUDNOVXNIcGpKNUQx?=
 =?utf-8?B?cWxieWJnVk5HYUFpMFR2Wjk0bE1mbC9PazJmT0FjVG1ocHNwajN3NTBkb0o3?=
 =?utf-8?B?SmlDdGVVZ0l4Y1J6S2dHcnZ5ZGhOVEFGWW02dUxjZDNlUDJNeGtpUFZhdThq?=
 =?utf-8?B?QnYyU1BBTzFKQkVlZTgxcVFuUGFFMC9YN0ZDYWlKWTZLd0ZhQTMvT1lUeTk5?=
 =?utf-8?B?eFkxTEtQNkttRXdPOTJKUjJrMVVtL0xNOUI4QnNqUE1wMmlGdERBZEVCUnFC?=
 =?utf-8?B?UlJMcFNoREhPUTQ4UVNKQmhIT3VJRUIzVCsxZkQzSllwRFVmRzRIRE9tYU9a?=
 =?utf-8?B?c3dhd1Rud0xGcXNsVWpzTzJxMXFFdzR5a2FWMGVlM3NtRDI4TEthRUZ6aVpt?=
 =?utf-8?B?bnE2d05FK2d5S2dqaW03ZUtNZFNVOWp2VXJ0UjdXSWJlR0VSVS9xUm9DZElI?=
 =?utf-8?B?b2ZkYkQ0cUtWakRWODNUSnpTbitQZGROSGFkRW5sZmt1blN4dnR1ZCt2OGFE?=
 =?utf-8?B?eXFEWTVueElqQU5WaXlBZjdLMXpwNENKWGVhZFdCQ3N3cHlRTUc3UVNWRUgx?=
 =?utf-8?B?T2tsMktYMDBjaytrSk03Y1RLOG9La1F3ZDA2Zi9xeHFzZGVnN01UblFrN3RG?=
 =?utf-8?B?dTY4emdYWWEzNkx4N3lmNUdyMGNHVm5MT0FiUmlzWTY1a1c5Sm5wMy9zNE9x?=
 =?utf-8?B?cGxMZHozQVBVaS9yKzU1RlhqZlBuQlNpc0ZQRzEwU3BvT0JRT1YvT29Dbnh0?=
 =?utf-8?B?OEhDdytMWi9zUTVUZllZYU5ya2UxelIrT1BzQ1pJSTZjL2Q1eTV6RHNzc0NS?=
 =?utf-8?B?ajRHTnNqRmhEdUl4WjRDQy9SRHZnQkRnUW5YZzRoTW5nR1h6UlJreTJFWDJF?=
 =?utf-8?B?YmxQM3VXWDJjZjhoQWZIc3VrZ3RFVkFTOEJEaFhZU3hLTlpVR0VvcVRReFJO?=
 =?utf-8?B?R0lSdUZsT21NNzNXQnZuZldXekY2UUl4U3dESFlpYmZMSTdrVjMzSjlQamIw?=
 =?utf-8?B?WGZKaWFYZ3pRV0xPOGo5QzJYdXU5MkdIMHV1V1FUUEpza2kyaTdab3dVUEMx?=
 =?utf-8?B?M21KTVA1aURnNFZ0alFKREltTFpTUEJPVm1HZ1U3cjRpVzZZRXRwems4ZFNs?=
 =?utf-8?B?NGQyeEtqK2lnNXk3ZEc2Sm94M1dyOGt0U2Y3UW1qZ3RnQ2xpdDlIdFhRNnBO?=
 =?utf-8?B?eTMxeW5MOEwxUzZCNEJUQ1FXcGd4WlZaOTN1OTl6YXdYdkZPMnRRR2NjYXZk?=
 =?utf-8?B?SHZJeFB3c3NjVERoSkQrdnhvWlIwUDVWS1VSRG1BUDQvNWIzTEoyTzlEZXFD?=
 =?utf-8?B?YThQRjBHOVlLT2R1djlzejJUajJpMFdnTlV1TjlRLzc0MndmWGhnTDNSK054?=
 =?utf-8?B?aytmYlFLdmViT1JWVjNqVkUrYTVrK0R0Vk1IZlVZYy9lT3gzaXI4YmVpMGN6?=
 =?utf-8?B?ZmVCRHFWWFhITDRKM20wb29nNE11RmNkdjlqMkRQQmg3L1djTVFSWXJjeFFT?=
 =?utf-8?Q?VlL9DE/L/4FfYSV1SmcaTNJUO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c526ec9-6079-4140-6073-08da768f7477
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 03:06:13.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptnNuzd7Sq4b0yFXFwgtI9wTsz6H745s1WFuz35D05wO1EkmAt1E9pzDxt0avyaNSvCALqYLETM/MNqxDTJ8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: 81151ce462e533551f3284bfdb8e0f461c9220e6 [9724/13542] wifi: mac80211: support MLO authentication/association with one link
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220803/202208030858.knIauqwf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=81151ce462e533551f3284bfdb8e0f461c9220e6
         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
         git fetch --no-tags linux-next master
         git checkout 81151ce462e533551f3284bfdb8e0f461c9220e6
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)

 >> net/mac80211/mlme.c:1161:4: warning: Value stored to 'at_extension' is never read [clang-analyzer-deadcode.DeadStores]
                            at_extension = true;
                            ^              ~~~~

vim +/at_extension +1161 net/mac80211/mlme.c

978420c2105ca9 Johannes Berg 2022-07-12  1137
81151ce462e533 Johannes Berg 2022-06-01  1138  static void ieee80211_add_non_inheritance_elem(struct sk_buff *skb,
81151ce462e533 Johannes Berg 2022-06-01  1139  					       const u16 *outer,
81151ce462e533 Johannes Berg 2022-06-01  1140  					       const u16 *inner)
81151ce462e533 Johannes Berg 2022-06-01  1141  {
81151ce462e533 Johannes Berg 2022-06-01  1142  	unsigned int skb_len = skb->len;
81151ce462e533 Johannes Berg 2022-06-01  1143  	bool added = false;
81151ce462e533 Johannes Berg 2022-06-01  1144  	int i, j;
81151ce462e533 Johannes Berg 2022-06-01  1145  	u8 *len, *list_len = NULL;
81151ce462e533 Johannes Berg 2022-06-01  1146
81151ce462e533 Johannes Berg 2022-06-01  1147  	skb_put_u8(skb, WLAN_EID_EXTENSION);
81151ce462e533 Johannes Berg 2022-06-01  1148  	len = skb_put(skb, 1);
81151ce462e533 Johannes Berg 2022-06-01  1149  	skb_put_u8(skb, WLAN_EID_EXT_NON_INHERITANCE);
81151ce462e533 Johannes Berg 2022-06-01  1150
81151ce462e533 Johannes Berg 2022-06-01  1151  	for (i = 0; i < PRESENT_ELEMS_MAX && outer[i]; i++) {
81151ce462e533 Johannes Berg 2022-06-01  1152  		u16 elem = outer[i];
81151ce462e533 Johannes Berg 2022-06-01  1153  		bool have_inner = false;
81151ce462e533 Johannes Berg 2022-06-01 @1154  		bool at_extension = false;
81151ce462e533 Johannes Berg 2022-06-01  1155
81151ce462e533 Johannes Berg 2022-06-01  1156  		/* should at least be sorted in the sense of normal -> ext */
81151ce462e533 Johannes Berg 2022-06-01  1157  		WARN_ON(at_extension && elem < PRESENT_ELEM_EXT_OFFS);
81151ce462e533 Johannes Berg 2022-06-01  1158
81151ce462e533 Johannes Berg 2022-06-01  1159  		/* switch to extension list */
81151ce462e533 Johannes Berg 2022-06-01  1160  		if (!at_extension && elem >= PRESENT_ELEM_EXT_OFFS) {
81151ce462e533 Johannes Berg 2022-06-01 @1161  			at_extension = true;
81151ce462e533 Johannes Berg 2022-06-01  1162  			if (!list_len)
81151ce462e533 Johannes Berg 2022-06-01  1163  				skb_put_u8(skb, 0);
81151ce462e533 Johannes Berg 2022-06-01  1164  			list_len = NULL;
81151ce462e533 Johannes Berg 2022-06-01  1165  		}
81151ce462e533 Johannes Berg 2022-06-01  1166
81151ce462e533 Johannes Berg 2022-06-01  1167  		for (j = 0; j < PRESENT_ELEMS_MAX && inner[j]; j++) {
81151ce462e533 Johannes Berg 2022-06-01  1168  			if (elem == inner[j]) {
81151ce462e533 Johannes Berg 2022-06-01  1169  				have_inner = true;
81151ce462e533 Johannes Berg 2022-06-01  1170  				break;
81151ce462e533 Johannes Berg 2022-06-01  1171  			}
81151ce462e533 Johannes Berg 2022-06-01  1172  		}
81151ce462e533 Johannes Berg 2022-06-01  1173
81151ce462e533 Johannes Berg 2022-06-01  1174  		if (have_inner)
81151ce462e533 Johannes Berg 2022-06-01  1175  			continue;
81151ce462e533 Johannes Berg 2022-06-01  1176
81151ce462e533 Johannes Berg 2022-06-01  1177  		if (!list_len) {
81151ce462e533 Johannes Berg 2022-06-01  1178  			list_len = skb_put(skb, 1);
81151ce462e533 Johannes Berg 2022-06-01  1179  			*list_len = 0;
81151ce462e533 Johannes Berg 2022-06-01  1180  		}
81151ce462e533 Johannes Berg 2022-06-01  1181  		*list_len += 1;
81151ce462e533 Johannes Berg 2022-06-01  1182  		skb_put_u8(skb, (u8)elem);
81151ce462e533 Johannes Berg 2022-06-01  1183  	}
81151ce462e533 Johannes Berg 2022-06-01  1184
81151ce462e533 Johannes Berg 2022-06-01  1185  	if (!added)
81151ce462e533 Johannes Berg 2022-06-01  1186  		skb_trim(skb, skb_len);
81151ce462e533 Johannes Berg 2022-06-01  1187  	else
81151ce462e533 Johannes Berg 2022-06-01  1188  		*len = skb->len - skb_len - 2;
81151ce462e533 Johannes Berg 2022-06-01  1189  }
81151ce462e533 Johannes Berg 2022-06-01  1190

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
