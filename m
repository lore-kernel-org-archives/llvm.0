Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A6C80C16;
	Fri, 31 May 2024 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717194064; cv=fail; b=rWGP1cKjzc8Rkvx/uc4hqTFgoo4VC65R0zvDQz6UfzF/UcBt8eBNurHWXKbGGvgU/PYvakFdnTnPwipPyK4T4AENmyIub86WVB6wTPAnPG7cK9YrtMRwhBoYeftaUcc9mlE1oaB0BoJFJhFXgeUoovARtt3ZcaXkY++oPah7k9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717194064; c=relaxed/simple;
	bh=P183JG0C1TA6hPq1M8dD4mii7RSzOjtmBkS0EBSiS40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LAmFbr/oT7367nSACoF58qruwX1flpjOBEqjskuBXCrlWlx0KMjWoBgiNRrsQK6qKJuQ+b0Tafr8kCc8qCU5mQ0K/qoVN/i55Pj5H+zEH61Sp0EQFWMD835NOQSJXsqa9RULLsI09VZrixq75ALcpkyPUyjnPq7ydJO9vPkMcQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXHDfYj6; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXHDfYj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717194063; x=1748730063;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P183JG0C1TA6hPq1M8dD4mii7RSzOjtmBkS0EBSiS40=;
  b=AXHDfYj6UDwNmQUyjZyoj2WbrApTCtmXLQij4Qs6Ms+6KJh5UHlNGlQP
   49/WmWXEWWj4oaFzZ2WF0bhist8A0jLtSGraWxSTdu/ZZLS2u4jClxdyT
   908KRxy923Fgp5ggazaN3rgR50ZQDtOpTj7wDAItANTBr0Oosn2ie1kkS
   dREhxByZs9E9lolBdXdzL2UFIujJccS8e68KtbZFf5iZkyTkfXtD/sQvm
   fyaPb/XghsNlIYeYwuRsqAWPhaNkH5bGJN1GEzeBR/94ylVLglebsnMzy
   qk2zOYJb4rXOdSePEfNc+hIl/BJlSVrec0QZ4DSpkorSBCxAflZMQiMEC
   g==;
X-CSE-ConnectionGUID: xvQWroA4T+GQvzq7CKV81g==
X-CSE-MsgGUID: A6rwduIJR4eg55UPoqkUCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17603025"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="17603025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 15:21:02 -0700
X-CSE-ConnectionGUID: gnmSJ7mRTrKKmiuZWSMfJw==
X-CSE-MsgGUID: xuNKa7j8T1uOxMiUUjrrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="67486181"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 May 2024 15:21:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:21:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:21:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 15:21:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 15:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtwXXFuMuZx3/KL0sbTO/+jeM8vPTnN0fl88H8GX+AXU7TRIJ+kZ+CK77ARlHdsXdo+GKtGfyFoRSFoTlZqKssgpBxxuZyn/IPiN/QnFMTOSgtSaHt1qLmHWu3E0OJusabUTRH8vgvdPFVJuZyza2j1r0frPM8EINOAk3SEeX77720SFQz42vlGDNEpGNVaTdyBkQo9GbHWeeTjpEDzQ2fvfqVyio8l4Z14wUpdUD74CNBL52NoKiG8wW/4zT6i7PkkZXLJT8jwkjsoCqe9wi16ugOqFhvBRgg2kvUI8/V4hRRsZyqqpi0SFt0rhBxXq0lqxJE2Lh+XfZu+5FGCyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P183JG0C1TA6hPq1M8dD4mii7RSzOjtmBkS0EBSiS40=;
 b=L+X5ViRET4tdOz0QATmLx8IVMZPo5d07mNJbZ9SGJofORXtPGzOP8TkAFlDFafDoEnA97bF8BNPpGMf902A/B8768zYPYJvGjHFGcFauw8m4F8OWjZBzpGRwGQElv22D2FuTrlgIj6oZRB6+kMFAHTsXqkRtNpEQzjlI2p9/oubVlDED2MMvD0EhB5ARcwr1hYGGb0C9j4iRBQum2ALBejaX1IFGDXMNMH0RC2tDux+eJzPjQennv5nOx1LSCOI9zHDisSVqYGwYYU99BJYizMrrIPc++mkegNjIUQPqe+irMX4JdjALIgPMvPFZ8fUYoiqjS0Y0UDgq5p+X8QfhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 22:20:59 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 22:20:59 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: lkp <lkp@intel.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function
 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support
 implicit function declarations
Thread-Topic: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function
 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support
 implicit function declarations
Thread-Index: AQHas4T7D/LGFwUKm0movPiw73TvOLGx6pUA
Date: Fri, 31 May 2024 22:20:59 +0000
Message-ID: <c51d84cab78bee2bfedcfdd1f4665c77c6e79a67.camel@intel.com>
References: <202406010133.Yu2O9Air-lkp@intel.com>
In-Reply-To: <202406010133.Yu2O9Air-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CYXPR11MB8664:EE_
x-ms-office365-filtering-correlation-id: c7604292-2c02-427b-5c6a-08dc81bff2b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?V2NDVjc2Mjk5bXEyVXV4N2Zia2RsdmFXZFkzamx2YlFIVm40VzZxOWtrT1Nz?=
 =?utf-8?B?WXNwR1NWSkIwSTJmMkN0ZDRJREkweVJhZG4rR3J0UllaTWJQZ3ZXWjVSbXQ2?=
 =?utf-8?B?WjVlellEWmpEcTRJSUt0cHdWOERKNTlsaWNWQ3NCVHN4bFFCMzBQK0l3ZGM4?=
 =?utf-8?B?UWtmdkVRK1o3NHlPSzhQTDVnZ1RpSmw4YmNFMUVLeXFmWUcrNGR1M1djZjl5?=
 =?utf-8?B?ZDZ1amxpZkNoRWFOZm11c1Q1Y2Rja0lSRnIwQWkvcE1sSlBWYURIYUtVTW1U?=
 =?utf-8?B?bzlvWm1CK3VtYjh2YWxBSG5CRitjTVI5VXhpaTl0OFo5T0FyWHNFUWV4YXl4?=
 =?utf-8?B?Wng5Ti8wdGE0MVptUVhBSm5kYTc0bmNmcExpOVRPcy9jMkNhbzlMQVNYK05j?=
 =?utf-8?B?ZC9IaGtocGNON0NCTWFTT3EvZUt4dit0ZGh2YkNFNHkxRFB6WElwME0vd0ht?=
 =?utf-8?B?ZXp5d1FVa1FXRzBuSkJBSHFXOXVZZTM0QmpGOFRrOG0vQTd1b0FxZ2dua05z?=
 =?utf-8?B?aVVWVUdwa2xobEtBMDBFWWVCUWl4QTVwaVAraFJ5alVUeWROeWwwS2tzL3VS?=
 =?utf-8?B?dHpvcTY3MWRORkhWMWx5NmR0M1dOMEsyYlJpaS9OcW04RGQ0WURQT04rMGM2?=
 =?utf-8?B?TWNJblJXdS83ZjlidnAvVDFrR2pyQ3BJZkhsWXgxYXk3dUc2UWhKcnVrZU1k?=
 =?utf-8?B?R2YrT1dGQUVtd1pTZFlDdkdDZTNnQ3NReWdsUTZkbXExNHJrQ2NHbVU0aFh6?=
 =?utf-8?B?OG5CTmN5ZEExQTl4WFJvTDB3bmk4cWx3VzlDaTBuR2s3UzhPdWNoblROMDE1?=
 =?utf-8?B?azF6dUtIN0VDazhuOU8xdzVhTFVVZkRTK1JydkVRUWJKaTNSY2J1TnFaaWht?=
 =?utf-8?B?RU5RNko1YWhxTjJPWTF0aVNOdG1IWm9WMmJ2UkRNYnBNSW5WUGdCQWlibm8w?=
 =?utf-8?B?LzZIclB4eG9wYXlFKzR1emo4N2pnSzd3RUhUZFU0Ry96RVZRcFg1OXdYVW5y?=
 =?utf-8?B?ODNYV2dPQUNIbk1MalA0NmNKR2FOUTN4M09SZjlOL1ltcTd0WHBlbUhTWnM0?=
 =?utf-8?B?Mzc0UlZ2enpBa3RRemQ4eEJYME1tcDF1dVZnWmJyZUM5TUkrRldpSnlYRDh4?=
 =?utf-8?B?WjdzVXFWandzRDE5akFZanAwR0pyMWNGYmt3VVU4aU45bTFLTnpubXdLWmU5?=
 =?utf-8?B?SC8zRjI2ak5hQkxJVCtTT2NJUnFoSEpNbzJIWEkrUmJ6akp2UFhGR1ZQTUlK?=
 =?utf-8?B?MnFUNXA0VjRWOU9OSkVZVjlNOU4vMklRT3pRYUM1aWxMazBaclBIU2JXWXdL?=
 =?utf-8?B?dXUxdjRXOEdvbXZmbVRBZ0lOaDQ1ZEExWWNCaXJWZ2Erenk5VThMREFIWnVK?=
 =?utf-8?B?MDcvcnFubkZoUHY3ZVZWSHpvU05BS1R3Sk5tZGh0dGlDNTRVa0E4b1VqWGRm?=
 =?utf-8?B?UWIzVDNJUzVwa0c1Y0hoNndOdXRtNzd1QlpUUHdUT0JFdXkwWEZwRTFLZ1lC?=
 =?utf-8?B?aDhrZE9UbERhNGtDcnVRc1JRQnJPc1hTVGZxWXVpT004bFI3TFg3b2NKVnJl?=
 =?utf-8?B?Q01RQWUyNHJtMk1ybTIzeEJuRjBzRVVmdUlpaW03a3ZJaVVNeEl5MHZXVllD?=
 =?utf-8?B?ck1SMTN3Wno5d1loTjI0Rk1BdVo2KzZJTUdXd3ZOd3lSQ080Q2Zic1Fwa0h4?=
 =?utf-8?B?aGdKS1lzbnpDOFN3cDRnNlBPbFNZMW5DZDZqbmR4b21heU40Z1hYdWpMOEVt?=
 =?utf-8?Q?T/aIhSK6MVhOj4HAoU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXh6MG82TlRyUFJISkVPeG9EVmRDMHNZWjlkaFRaNzVGOU5BL1lYYXVaL1Vn?=
 =?utf-8?B?bm41R0FjSGdtS2VtZjB2Zjl3c3FvMnNqMGxvNURwR0JXVGhTbHh4eGE3ejBH?=
 =?utf-8?B?Q0Q0Ynp2YWp2Qlg4NlUyQnNuekZSa2o2NDlGSGMvaGw0Qi9ycjNXamxMbkJC?=
 =?utf-8?B?RXBRZ2pWcEEwMm1JalhpaDB3OHVWNERNVGV0WnI4UUR0TENXVTVkUjdtUXFJ?=
 =?utf-8?B?Mlk2WmZ5MDBkNXhiNW03QmEzY0YzL1J3YS92TUtMOWxCNmJLRFc4c3hUbEh6?=
 =?utf-8?B?em5UVU55Q2tuNmxWb0hKM3plOE9KUVAzNXNRVGhUUGhldTluY3hsd1phdy9x?=
 =?utf-8?B?RHZoY2VYVmhyM2JML1JlTVlqaFhqeC9zY2s0R3pLaStzSGlVdEttcmhGOXFS?=
 =?utf-8?B?dWxVZ251aW5rWUdONmFOT2UyOEUrZEtTMzNIcUptMTBpZVkrYnI5cSsweEdO?=
 =?utf-8?B?YkVWcEVaamVRTXVDa24yREV0ak9QdURSVE5LMERia2YrbjFNT0habXpmdkZn?=
 =?utf-8?B?ZWVZMFdzak1LaTZsL2Y4T21XOFZId2cvWCsreVROR2pad0MrRHNUZWFjTVVi?=
 =?utf-8?B?VldtaFZYak1ObGp3cDd1WnExMXFMc2VHRXoySW5WcmpmQ0JhbWsrUHRmNVVX?=
 =?utf-8?B?RG5WUTcwYjRXNHVSalRyOGhjT2lWRlI3UTVNK3N1d1l6eFlYSWpxMWUweXJM?=
 =?utf-8?B?YVBGbnBrS3lTcEJiaUNKamhRSnlSZkdBRnNGQThyNnd2cW5QRlZnVkUrUG02?=
 =?utf-8?B?UzBGOXBhdlFjYTBMaEF0NytpTm1qbUxjbEtnY0lzSFFpQWJYcjhCZEpVaDlN?=
 =?utf-8?B?YXVKY2Zlb3BPcFZtYnRZTjVUdmtWYWVCTjc2dE5UU1pPQ2NIaktpNFcrazNm?=
 =?utf-8?B?R01mMFRJaGVjbkJtQ0FibXlhV21xbHp1L1dEMjdmaHBHRjV4NkRTMWkzZFJa?=
 =?utf-8?B?MXBxU1NxZDZ5K216djZJVnloYXI0VldJZ1RaT1RxS21yT204ZEJCMUs1MFAy?=
 =?utf-8?B?Vy85bjZqWC9iMFNScnlCY2JvMExDdllKRlFRODlTQm4xdWp1Vlo2NTlBRlpC?=
 =?utf-8?B?ZDNoL0VvVHRDTHdXYjVGRE5xTWxDNnB5Slg5Y3RCbHRRWmgxUktYL3ozZWZ2?=
 =?utf-8?B?em1XbHczVjZjbHFyVm40Y3JvQXB5cWpFNGZ2aW9CZFZSM2lxZytDVHNCV2NQ?=
 =?utf-8?B?SUM1TnJ2NUsyNkE2RHNMYnh1YUNCNVJjTnVxejdhekpxVnBzTHF3S0JwRll2?=
 =?utf-8?B?clI1eFZTdkxlODc2VmhFeXBiVTdkUmNabEpBd2NvTTYwZnMzTG9ZZGdIc3dh?=
 =?utf-8?B?bXhMQjFGTVJJalB0SE54MEt5bktjOVJyLzdXbkt2STQ0RUNuV2RTQmRaSTNy?=
 =?utf-8?B?OXN0ZkV1MnI0RUVPOTJ2R1lDUFV0dzE2aU9veE1uc0RhZXdxNFNNZ0FpOWV0?=
 =?utf-8?B?VG81UFBkUFVqT2NVT25RSmlMb3B5dVYzRUVsTkFTOXlaMC9kS0dtcTc1eXFL?=
 =?utf-8?B?MDNtM0t4U0FwdHVBVFphREJnYlpORGMwMXlLc0IvVUozMUkwc1lEZmo4Tnhx?=
 =?utf-8?B?TlVocWNLYythU3ZqcG1SdVBQL0xKY0RtVEd2eWZaT3ZnQWJRWDdmaEpjRitV?=
 =?utf-8?B?ZXZZUzNXWUIxTzhPN3pQUjBEK2JhanNaY04zdldYQ3BHcUdIN1d5eEkxMkNJ?=
 =?utf-8?B?aHByZmJwRnNSd3pWbWJrMGtTYTlFaVZvbUpmcUNPMzNXSDB6TEFRd2dsVUZz?=
 =?utf-8?B?VnFkSU1GeGVPNmszOUhCRlZocFY3VVBaNStZTy9RdTJ5T3dudCtVK3JrV2Fi?=
 =?utf-8?B?Q2VGUmRKODFOTzlBQURNNE96Zk9FNFpnWnlRYllnVGI5QVQwRnRmVVkzdk5N?=
 =?utf-8?B?K2xYNk5qTGE5emtZOFE0NFA3QlVXZ25mOUpJQ003ZVA2SGhCZml1ZUo3d0l3?=
 =?utf-8?B?WG5QL1llVC9CNjIvSWlBaUs5SXVGTVhlN3NQYlFzdnVOME5pMVEvSTE4MVUw?=
 =?utf-8?B?bUFIUm5EMjBkcGp1R3lOS04vc29CVHE1bmxVVG1GdUZaelJHWWpoUUZURnBH?=
 =?utf-8?B?THFHcVQzbEhUU1ovdHRGZkxuMHZXaDRaQWdXZlJla2lVVEdmVDVKTnpRR0Zw?=
 =?utf-8?B?ZlU4MW9OTElmakZyUmpNNHVkV3dnUm95RmlqdzdPK3FjYmdMR0p4WEpzcmJW?=
 =?utf-8?Q?L9cbJtx4/s2Lz+cGrtOfP2A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7418ACAD734AF040840F10886BC1069A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7604292-2c02-427b-5c6a-08dc81bff2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 22:20:59.0354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/whg4l6CK66brBgEdxn/3kexxwdukPEdtxu6iIP7YMIquSexGxxrhzXDA5W58OqFXTpk9l9dBac3xxovuHtpXvVufe+mUmvDfYI+Lbchs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
X-OriginatorOrg: intel.com

T24gU2F0LCAyMDI0LTA2LTAxIGF0IDAyOjAzICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gdHJlZTrCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC90ZHguZ2l0wqB0ZHhfa3Zt
X2Rldi0yMDI0LTA1LTMwDQo+IGhlYWQ6wqDCoCA1MzhkMjVhNGQwOGEzZGM0ODdmYzliZTc4YmVm
MDkxMDVlZjU0ZTI3DQo+IGNvbW1pdDogYTNjMzZlZmQ0NDhiZDNiMjVlZTBjZjI2NzJmMTc3ZmY2
MDNhNmJlNiBbNTkvMTE1XSBLVk06IFREWDogVERQIE1NVQ0KPiBURFggc3VwcG9ydA0KPiBjb25m
aWc6IHg4Nl82NC1yaGVsLTguMy1ydXN0DQo+IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5
LWNpL2FyY2hpdmUvMjAyNDA2MDEvMjAyNDA2MDEwMTMzLll1Mk85QWlyLWxrcEBpbg0KPiB0ZWwu
Y29tL2NvbmZpZykNCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTguMS41DQo+IChodHRwczov
L2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3TCoDYxN2ExNWE5ZWFjOTYwODhhZTVlOTEzNDI0
OGQ4MjM2ZTM0YjkxYjENCj4gKQ0KPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOg0K
PiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwNjAxLzIwMjQw
NjAxMDEzMy5ZdTJPOUFpci1sa3BAaW4NCj4gdGVsLmNvbS9yZXByb2R1Y2UpDQo+IA0KPiBJZiB5
b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVz
dCBhIG5ldyB2ZXJzaW9uDQo+IG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+ID4gQ2xvc2VzOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29l
LWtidWlsZC1hbGwvMjAyNDA2MDEwMTMzLll1Mk85QWlyLWxrcEBpbnRlbC5jb20vDQo+IA0KPiBB
bGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+ID4gYXJjaC94ODYv
a3ZtL3ZteC9tYWluLmM6MjI0OjEwOiBlcnJvcjogY2FsbCB0byB1bmRlY2xhcmVkIGZ1bmN0aW9u
DQo+ID4gPiAndGR4X2dtZW1fcHJpdmF0ZV9tYXhfbWFwcGluZ19sZXZlbCc7IElTTyBDOTkgYW5k
IGxhdGVyIGRvIG5vdCBzdXBwb3J0DQo+ID4gPiBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlv
bnMgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+IMKgwqDCoMKgIDIyNCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRkeF9nbWVtX3ByaXZhdGVfbWF4
X21hcHBpbmdfbGV2ZWwoa3ZtLA0KPiBwZm4pOw0KPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4NCj4gwqDCoCBhcmNoL3g4
Ni9rdm0vdm14L21haW4uYzoyMjQ6MTA6IG5vdGU6IGRpZCB5b3UgbWVhbg0KPiAndnRfZ21lbV9w
cml2YXRlX21heF9tYXBwaW5nX2xldmVsJz8NCj4gwqDCoCBhcmNoL3g4Ni9rdm0vdm14L21haW4u
YzoyMjE6MTI6IG5vdGU6ICd2dF9nbWVtX3ByaXZhdGVfbWF4X21hcHBpbmdfbGV2ZWwnDQo+IGRl
Y2xhcmVkIGhlcmUNCj4gwqDCoMKgwqAgMjIxIHwgc3RhdGljIGludCB2dF9nbWVtX3ByaXZhdGVf
bWF4X21hcHBpbmdfbGV2ZWwoc3RydWN0IGt2bSAqa3ZtLA0KPiBrdm1fcGZuX3QgcGZuKQ0KPiDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4NCj4gwqDCoMKgwqAgMjIy
IHwgew0KPiDCoMKgwqDCoCAyMjMgfMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlzX3RkKGt2bSkpDQo+
IMKgwqDCoMKgIDIyNCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRk
eF9nbWVtX3ByaXZhdGVfbWF4X21hcHBpbmdfbGV2ZWwoa3ZtLA0KPiBwZm4pOw0KPiDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2dF9nbWVtX3By
aXZhdGVfbWF4X21hcHBpbmdfbGV2ZWwNCj4gwqDCoCAxIGVycm9yIGdlbmVyYXRlZC4NCg0KSXNh
a3UsDQoNCldlIGFyZSBqdXN0IG1pc3NpbmcgYSBkZWZpbml0aW9uIGZvciAhQ09ORklHX0lOVEVM
X1REWF9IT1NULiBJJ2xsIGp1c3QgYWRkIG9uZQ0KaW4uDQo=
