Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9D22C80
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 09:28:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="297223380"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="297223380"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 01:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="576206503"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2021 01:28:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 01:28:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 01:28:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 1 Dec 2021 01:28:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 1 Dec 2021 01:28:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7OE2by55B3CqvghWENO0fZF0A50P3UkXp8vdN9Nmbsyf4NO1WKLk/yXhOxWAwhoS+r+huOKAoh3dVWbks2ib9fYiJcJrKWd9eA364UDWw0OlBUA0wgsndThMXmXX3z1J8FgPlOjXFuILl/vX2MGTSiXRka46DTUBdFVNfP4YOpy5BRBszSwLNygdLOjSs8k59Zm45OoguV7TBO6O86YU5wJCQWCzA0Ji5tFgvIbX6V9zLQ8PAVVQqQlzw4HN2JGJVrSjplbrhy69lzmWpyKO6ckQ2NKUpc1EezKw3/2GAeBedOfKhZzQ2vUESZx0gZS9KrdDqXLqukBysnnQF9FSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Sqrh5Iyr/mFyvJzYOKmFuCOOq+qrVHMp5aL+HwbnH4=;
 b=Lr5W7QudY4xoHgQGDDM9647vE/lGifdpl/OSuucRe6Ck15Hk910oQ9nMjL36kAFloo8yjjmcVGnOyR7uQyqBtcNALdNV7fPXe81BuCGX1TfblD2ZKoJt3bvoRftoNRXH6OsHu4tWjLCtkcUQCEL3c4QpJpXNfoJwmBAvKCUDGdphg+GkCa9b7e8DtV/DNybV3wAfFfGRv0+KGAZB6NH9MKxihaDXMJKJY0I3fg4rMPOzG7zauqbRxDYimFxUnXx8evYIpN3FritcaIHfwyONfF1nYwdvNOXo+dAM/sEc3cxG+buXF5Abi48VlSe3ktafYef44zVRSKGOSMHvY08lBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Sqrh5Iyr/mFyvJzYOKmFuCOOq+qrVHMp5aL+HwbnH4=;
 b=uehb6FWmI1Wv6f3Nx+5HKb+U/xYHijEwgWzt7CXlgtnHN6k6GpCv9H4eOFRy6QjU7QSCOXIeMvH9DaDzZTNR0VmFYktnFOXwnAfezlS5CbVqBqFVagZeUWrw4yXq9F4TKcQwNoaPIhLZAjVaxLKi0NHoDzJx79jDgiygQJmN2Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Wed, 1 Dec
 2021 09:28:10 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723%2]) with mapi id 15.20.4690.019; Wed, 1 Dec 2021
 09:28:10 +0000
Message-ID: <e1c23faf-6326-79e1-39d8-2b3837d7a14c@intel.com>
Date: Wed, 1 Dec 2021 17:28:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: [linux-next:master 2016/3897] drivers/net/usb/lan78xx.c:3794:2:
 warning: Value stored to 'state' is never read
 [clang-analyzer-deadcode.DeadStores]
References: <202111281304.IyMicb1U-lkp@intel.com>
Content-Language: en-US
To: John Efstathiades <john.efstathiades@pebblebay.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202111281304.IyMicb1U-lkp@intel.com>
X-Forwarded-Message-Id: <202111281304.IyMicb1U-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from [10.238.2.77] (192.198.142.18) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.7 via Frontend Transport; Wed, 1 Dec 2021 09:28:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e8265b-5411-4e36-caec-08d9b4ace402
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5663:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5663CE569A3182E80EFEF610FB689@SJ0PR11MB5663.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfxjrNFWBuORXAxDD2FiGPjmk3LDFH57nfsYyQe3sv19odesZ7yjihd8YRWv5KN8zp0pTs4E67xaIpimjNxgTdxypn9hDd1OM1KPNawn12uO4XzUxf4Id9P63vjs9IVyhGBMUXqZPUlvOZm8xsdP4LgFXnT/F8gFiWSQXVWmfZRvGmYFTxfJa6i6dFtqHCQ8Zjihfwo55hFbSuzpJMno8o93Y48OVm8UaMHpdNRCU5buG8tsD8HLF/JkJfXP4B91GZpZACXrcrDPZN7CFv0I4ilYY/3IZLp1ZsCQ5c9vtt8b4wYXU9K8q7/YekUx3B/Wm8CVhBEXMejGVbY/mH5yUY2srvn7AmaQsl2KgY81U98t202pNi4cy4VpdCqQS8hOOmTO5Cpik9GcIKRUpVqWFYP7amFzEnsinVCp3t5jRzIghDgUHKVtezpPF24ZyNWqjle0B3bgW4TIZQ30EEHM7zHI8AzJAgoQ2eSwmAls5sVMPW1lv/K6UJZRUY0kh4Tmxf+7keaaz4CzZov0YP+9t6Yvk1QVsnb6Qr6jHzDxj+4TuD/M7f8R305E8wHTK1HnwjOXXGs7ap38w3BT0BDqdG9ZKolsddYKH35uRrngrgXHH9Hu+NZDbG8B434YOYGIlCs+c95c+2ksc20Z4w7vzxRsFTs6Sy2HRQ/UovRDOJcuKCX3QLCs3aw1X6wJq4w6CcwtSI1YqTb0dR2XHGVIqyp7c2za6AMoXDfLd1W2XQbs6qxsS0IuPsyVwvJrtOMep5nZPP6giSAoHFxgnDr7H4t/lbDlI1YYAlCNh2DzUWEEGs1oklsC42ikyZUoz7q53+4FpQvW3JkUMegYiF222RFtc3MufxNQ2qdCCiv1j+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(4326008)(6916009)(31686004)(82960400001)(966005)(38100700002)(5660300002)(66476007)(86362001)(66556008)(2906002)(31696002)(36756003)(8936002)(2616005)(8676002)(316002)(16576012)(4001150100001)(508600001)(956004)(6486002)(186003)(26005)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekY5Nyt5ei9Nb0NCLzZxRFBHbnEyVjFraGYxSDltR3VCSmhHQmp2b05MWTlr?=
 =?utf-8?B?eTAva2FjZlZ0UGRsSFdjOG0zQmNmaFdGL3ZDc1B4VjM5NExqWTI5MHJUdE45?=
 =?utf-8?B?aWVmUFJnRm5PRC80L0VKV3RwUHVzdFkvclJSbXFSdlZsTi91NGtEbkg1VGRL?=
 =?utf-8?B?dmRsZndGVkJ4NFBxVDVYZkdzeTBHVzdpaW9rN056WExaYy9jb0h2bi9qQ2dm?=
 =?utf-8?B?cVhpVDVVSlQ0Q044cFY0MElWRFhGWHQ3bytVTnhvRDJzUlltc0ZLQk8wVldv?=
 =?utf-8?B?RGM5bG0yM1U5Q3NFZSszUldVczcxRUV5OGNoMjh1Qkk5VS94SmNSbkYwZjVR?=
 =?utf-8?B?eHdMclZYdm9yTTgxOXNBeEV6Q1p3dGxZZjJ6ZlhNV3I3NHBpUUxOd3BlSHhK?=
 =?utf-8?B?UnRTQVVvVDNCdGNaMnF5VFFBVFoyZmlobVJLblV5Y0ppOFBYK1VwaEtNT0dj?=
 =?utf-8?B?ekRNdU1jTDFtNDVUd2hvTHIwM09OUUp3b1JNd2JPVE9sNk9GLzU3bUt4ako2?=
 =?utf-8?B?bXJRVThiY2ZVNXdMckJzNkhtdTRGaEx6Rmt0d2w5N2h6b1dkM3VSamtjOVBE?=
 =?utf-8?B?T3NLY0JtT0RTQXJxRDhCdE9TRjhlcTE0T0RGdDMvWFI3b3hLbFhIdU9xSkhW?=
 =?utf-8?B?MnhRMFpGa3h2RjM5NXQyT095OVpuNkpVckJ2blJzZXowV0pMM1hpNFlab1RX?=
 =?utf-8?B?OXVjVkpjejlpQUg3elEwK2ltSDdDZi8vRW1lVW9hVnk2b3Q1VGFvVjgyNGlm?=
 =?utf-8?B?TnVVdE9WNzFlNjBzYmNsT05SckcwZlZTWW5uNGY3bGUrKzM4Tk56VHV3UlFJ?=
 =?utf-8?B?OGVmZnF5NlUxemJCdnlHNjZScWFrbjlNOVllcy9FNThya0VIam9ScDVLdWdN?=
 =?utf-8?B?OFFIT095Z1NDSWJUZUpEZ0d6UjFMVTdYa0dhTDFCMjBQVlQzZWphZmR3NDlI?=
 =?utf-8?B?STRMY2FWcFBWZDZXeVg4QmFjcEJkQ2NTRkwzVlhsdi9CUVJVSHhxWUoyMEpU?=
 =?utf-8?B?R1RzMTBsZ2dhSG02bkZZUFBFcFNvS20rYkpKNXJlbURuK0Iya0ZSK1lZT0pR?=
 =?utf-8?B?LzdKaU50L3B6S0hkTUFPNFRQNFZDbUpwZldYZXYrZjFuL01ZZFN0Tjd0ajZR?=
 =?utf-8?B?TXcwMWV5QjJmR1FzTHlMbjRDN3BQUDFieXZiS2xNa1Z1Q0pyQmRDWWg5ajNH?=
 =?utf-8?B?R1ZHOXhxSkQ0ZVRpanRKalhkUjI5bktkYVRJYllwc3Q3eFRvRTNHQmJlclhR?=
 =?utf-8?B?L3hFOGgvM0UyRDZsWFBXNkxUQURqOWxIYjkrWHlXNjhWcGhTRjNiTnJRWFZ3?=
 =?utf-8?B?aG1pT2ljM3hMaHJvODlWZXVLb2xuOHpzTlJpSEtKNHA3eUxnZS9MYkczYU9P?=
 =?utf-8?B?dHVQZzF3Zmo0ZFN1V2VNZkVjeTV0V0Z0djZweXNoRDR3TXd6YmpDZGNkTTRt?=
 =?utf-8?B?dVc5SE44MjhibnRaNDBiT3Fkb3hSM0d6Z1V2RkFJRE9nMUlxVVJFRVlxelVh?=
 =?utf-8?B?bXZWazRKZXpmczJMNWlUNExmWXBNNEo1QkVkcU1CclQ4aXpYMzE0M2ROSEgv?=
 =?utf-8?B?TjJKVDlZSzZRZ3M5V3RvMFZNTlhJR3ZsenpVOUhhYWYyczlMeEwvNktWcGFX?=
 =?utf-8?B?cmxJNCtmeCtSTC90aGhUS09GQndLQnZmNk8yR3YrVnQ0QlhieVFvNk8xd0VZ?=
 =?utf-8?B?ZmF1U0g2QmNZTi95NHNkZmpBeWlPUDh6clVKS3cxTVV2bTNnaUpsYUZRZkVY?=
 =?utf-8?B?ZStnR3l3YXNYbjRCL01IQ2pVR0cvR2lhdnZlSk5oK1hPckhlWDNQbGJ6YVZx?=
 =?utf-8?B?cTczNUMxRXI0RXdoVlBLTW4rYWEzdm5jTkZvYUt5WkRjTXhLT0xWVFh4WVMx?=
 =?utf-8?B?RGRQdTVaZmpJWjNDL0ZHVkI3cG9jNTNydnF5YlJ2S05uVnpSRmV6SU1PK3RT?=
 =?utf-8?B?KzZMYzdZR3E1d3MzQUI2a2FjNXBqL09pYUwrMUR1WnhkWlFRT0R1UGZWUjRU?=
 =?utf-8?B?RUdhVFovajN2TUp3VWQ5TTVzT3owRm5kZkxNY25MclJjR0UwZldzU0szSWQw?=
 =?utf-8?B?ek9EMzFHT0dhMkhvTGY2N1RHcy9oWEhiRzVkS1hLby9EU3NhL1pEaGN5a1pM?=
 =?utf-8?B?TU96MXhGTU8ydHR1Sit2S1h1bUoyMTFxa25VMGxVT1F3a2VWbEhHTlEzNlV1?=
 =?utf-8?Q?Sjh8BRkxayldqj0EB9Gm/u8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e8265b-5411-4e36-caec-08d9b4ace402
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:28:10.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6MaStHdC68ftaE6gS6vc+6QYPkzY1Vqe7iLkmvWlr1Pb+FE3p8U0EeTwaQgFV9GDymHR6tB1TDnvLuGeTOfMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5663
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: c450a8eb187a4d7ebe92e0afec54ac31ce403e79 [2016/3897] lan78xx: Introduce Rx URB processing improvements
config: riscv-randconfig-c006-20211122 (https://download.01.org/0day-ci/archive/20211128/202111281304.IyMicb1U-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c450a8eb187a4d7ebe92e0afec54ac31ce403e79
         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
         git fetch --no-tags linux-next master
         git checkout c450a8eb187a4d7ebe92e0afec54ac31ce403e79
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/net/usb/lan78xx.c:3794:2: warning: Value stored to 'state' is never read [clang-analyzer-deadcode.DeadStores]
            state = defer_bh(dev, skb, &dev->rxq, state);
            ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/state +3794 drivers/net/usb/lan78xx.c

55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3736
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3737  static void rx_complete(struct urb *urb)
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3738  {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3739  	struct sk_buff	*skb = (struct sk_buff *)urb->context;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3740  	struct skb_data	*entry = (struct skb_data *)skb->cb;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3741  	struct lan78xx_net *dev = entry->dev;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3742  	int urb_status = urb->status;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3743  	enum skb_state state;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3744
c450a8eb187a4d John Efstathiades         2021-11-18  3745  	netif_dbg(dev, rx_status, dev->net,
c450a8eb187a4d John Efstathiades         2021-11-18  3746  		  "rx done: status %d", urb->status);
c450a8eb187a4d John Efstathiades         2021-11-18  3747
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3748  	skb_put(skb, urb->actual_length);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3749  	state = rx_done;
c450a8eb187a4d John Efstathiades         2021-11-18  3750
c450a8eb187a4d John Efstathiades         2021-11-18  3751  	if (urb != entry->urb)
c450a8eb187a4d John Efstathiades         2021-11-18  3752  		netif_warn(dev, rx_err, dev->net, "URB pointer mismatch");
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3753
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3754  	switch (urb_status) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3755  	case 0:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3756  		if (skb->len < dev->net->hard_header_len) {
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3757  			state = rx_cleanup;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3758  			dev->net->stats.rx_errors++;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3759  			dev->net->stats.rx_length_errors++;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3760  			netif_dbg(dev, rx_err, dev->net,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3761  				  "rx length %d\n", skb->len);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3762  		}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3763  		usb_mark_last_busy(dev->udev);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3764  		break;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3765  	case -EPIPE:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3766  		dev->net->stats.rx_errors++;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3767  		lan78xx_defer_kevent(dev, EVENT_RX_HALT);
df561f6688fef7 Gustavo A. R. Silva       2020-08-23  3768  		fallthrough;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3769  	case -ECONNRESET:				/* async unlink */
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3770  	case -ESHUTDOWN:				/* hardware gone */
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3771  		netif_dbg(dev, ifdown, dev->net,
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3772  			  "rx shutdown, code %d\n", urb_status);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3773  		state = rx_cleanup;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3774  		break;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3775  	case -EPROTO:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3776  	case -ETIME:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3777  	case -EILSEQ:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3778  		dev->net->stats.rx_errors++;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3779  		state = rx_cleanup;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3780  		break;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3781
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3782  	/* data overrun ... flush fifo? */
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3783  	case -EOVERFLOW:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3784  		dev->net->stats.rx_over_errors++;
df561f6688fef7 Gustavo A. R. Silva       2020-08-23  3785  		fallthrough;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3786
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3787  	default:
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3788  		state = rx_cleanup;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3789  		dev->net->stats.rx_errors++;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3790  		netif_dbg(dev, rx_err, dev->net, "rx status %d\n", urb_status);
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3791  		break;
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3792  	}
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3793
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30 @3794  	state = defer_bh(dev, skb, &dev->rxq, state);
c450a8eb187a4d John Efstathiades         2021-11-18  3795  }
55d7de9de6c30a Woojung.Huh@microchip.com 2015-07-30  3796

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
