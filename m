Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876642EB866;
	Mon, 24 Nov 2025 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763986205; cv=fail; b=SqFIOCbzZ8Fe323cxN6BihvKkdte+c8o72Hey1gKO3QPSFkwolWsYULy+W1GcsNZ1/wyQbceD8dyXoIyixPwQzJgrfNR8jo6DTeiyEXrP6QJAYVhW07LBB02xQ28k3tYibCvpDLd7TqPlfNKOoIvXIpaCwpqbhmY6Pur2qlorI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763986205; c=relaxed/simple;
	bh=ohTMRhGxeMOC7Ds/Ad4tyk/Ev9W54VTR48BRxeK+CQU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Y183HwUR/jSUhXPLv1gjo5YMePZvMrnRI3IJ8UaozuRlYERUP707kAa8wKbbzQ0sJJo0SnKZ5ZgkI67u7aqjqvGmM4jmr4L2oMoL7GvL/+YLm/oORsQT65SKCbJW5He+6yEl8ze6kEZ8bezZ5agmPq5oB1FlrDY6r0ZWPGj6RVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YKajbNfJ; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKajbNfJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOeFA3Vp4BU2Vh+r6M/sPM2Wc7NZ/tZsuwLtxOOHsNXQocdyo2VTg5IVmVYLpkUhL58gsK3gniBo0A+MIfcZ6qYRHTJopncvbkcXpTNKWS7dmZDqmqnAoL6+7o4Qw+y46N2/gJXAFcJQs9pVXq7S03ejG9IbnDWrvV+Ghf1W+gSrw6U3wUwp/GCTo7nmNikPTWtZazAPoE4Vx544ry6Y8fpJuDzjH1w+2SfEB8uvbeZjcc2x+tgfCGE+i9MwBUQN51TENL78pWqe0uVfsc3iaDHc0eYyaouTTTXT9jcEF84vCq77kZMuHLzsoxSbIjrCZ3QAdblBcfDfgHqJk5tMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohTMRhGxeMOC7Ds/Ad4tyk/Ev9W54VTR48BRxeK+CQU=;
 b=PL/0CMRe/XgOJqdTO15RhJloyMisrJMYl0zM/AEma/W7zREpf8X5llv3MmSh5tob3f4oo0d3vg7IeS0jR8bkV3BJzb2M23NCAPrlDpQyFyAjQUmbF/ET4gQfF2jcUo6DoXB2gXbOVbwzSHYP0NvPVnxuX9//XN/FN6ROnAiDidCFoE+mZvhxi5JQdLwU78LijiZ8tdAGxygVebWVE+3wKIuAA1ebm2W9Fq5NIBuhm3zN2SOi8V+pVf6QPnZTdybJR/2m7t3m/IWOpLYMz6PH+Tdac873ImbWjUmyaLuPgGlnFw4SGxqLByV3Bk1edAmdGtF1QnMW2RD/hnHoSkrdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohTMRhGxeMOC7Ds/Ad4tyk/Ev9W54VTR48BRxeK+CQU=;
 b=YKajbNfJipSB8UPBAAqm/21C78cXh5l332zzD5DKPW28YZjGSnj6Pia+LxsD7wbcGfeu3lYiVzHUA7XkEdrXE62C7IO4Yh9DBKib2XqoV3ELX55RNGnvTzB53FpkEamz/h+dD93A7pSc1++mVM1bCbJhrYt7fyjnrBEAGAIkUZBptKbPITZMbbuWFN6QQJ3ElkWWMT+2yQNUi7yYe52zK9BgZEMtZWsIeMYR3rbKYD0z0Tznbivbs0fetdL9YS4QX4Xk29VLCbx+pCmVX5MhiL5cOmHvQvhRTOYKazBoomzLHZc/tAtOnRU5vomYVGNgT5QxQg0MsRAe4TzWp5PIwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 12:09:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:09:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 21:09:52 +0900
Message-Id: <DEGWX1PZUZ2L.1Z4HKXBDV2BGE@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Trevor Gross" <tmgross@umich.edu>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "kernel
 test robot" <lkp@intel.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
 <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <aSB623GKVDR2TBc3@google.com>
 <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
 <aSQ1VNuGHhFXYE2e@google.com>
In-Reply-To: <aSQ1VNuGHhFXYE2e@google.com>
X-ClientProxiedBy: OS0PR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:604:98::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df9f9a6-1d88-4d4b-cae8-08de2b52630c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THJYWHppNS9veE04aFNDZGlqcG5zMU9mTEtlWmF4L1BLUTNHSGlHdFh0NTFn?=
 =?utf-8?B?dU1IY3NWclhNN2xvc0JPNVZ0TGJuRzBuc0QvSjRXL2w3ZXMwdVBMQ0tUNTl2?=
 =?utf-8?B?Z0VaZ0pzU0FkZ05DdEpJbzN0VlZRRjJzeVB2bldwZnRLRGM3WUNDaHJma00v?=
 =?utf-8?B?SkpxNzV1SmxVZDR2cXNwRXJWaFlRcE9MVlFmVHRLQXlGbzdDRCtveVIyNzhL?=
 =?utf-8?B?QjFyZWc2aSs5UlNYanBFODhXMktGeHg3a1JkSTRhRG9iWGc0VXRLbzJYckNm?=
 =?utf-8?B?VldUZWdKVkJML284YlNHcGprQXptSFpkWkRHSWd2SHR0ZlN2U2hiMEpzSHhr?=
 =?utf-8?B?YWFNMzRVM3hOR0RlVkY0Z3VrYitNYzNuaFhJaW1CbHhGaDNhOHlLSXNwKzJV?=
 =?utf-8?B?T3A4Ym5Tb2FDYXZodWdBMkNLWmVpSm45OEJtMUYzdVZqWVczWkRjaGNFU0E3?=
 =?utf-8?B?Z3dYT1M3RzlycnBvckhuWm00TVdqbS9nOXFPTDc0aVlqV0lzT2ZOcXZKWWhu?=
 =?utf-8?B?cHJzQ0tCdUpoSnh0OFlvUVhjNWpJd21mZ0tXaUxGcktJOHBHVWloSThOcGYx?=
 =?utf-8?B?M1EvdE9jYUdHbk5LcVhzVzdrUzNjd2piYnZ1K1pOb2tNTDVJWmJxbjdyVHE1?=
 =?utf-8?B?SmQwdE85aEpJTWRlTmRtK0NtNE42LytSWTRHMnlpMW8xOUgrUFVpSlNQWnJ6?=
 =?utf-8?B?bnNQUzlLeGY3ZkFmTnMyWnhRZXdnTHNaUmx0SnMyZitFdFQzQlEzb0lUUWpl?=
 =?utf-8?B?VU5hWHhEcjQ0OEIvT3EvNG1QeUV1ekxUTm9aN2trOFoybDc4cVRYN0xVNGx2?=
 =?utf-8?B?UWFsTkdMT3E5dnJCZHM1bVZldTJ3WFQrQTNzc2hMNFZFWWxSb0VOODZ3N1NS?=
 =?utf-8?B?cjFNeUIxT1lXTmhKeE5uWWw3eHF2ZzNsSUhiZ2N1NHlHK0xWSXlvNUNOcnpN?=
 =?utf-8?B?R2Jmalk5WFVPTkFsMnhOdFBOeU9VTDBPSk9OR2x0THdhSDFmSFh6a3pkWlFq?=
 =?utf-8?B?R0gybzRmSDNWSzg1VkxmTWFCbUxtMXc5Z3NhNmZweEVScGJvcE4vQ0hpNU9r?=
 =?utf-8?B?UjBqWVErMmhzYzhxdXdzWCs5Q0NEWHJEMzlDbXVlZjJQc2xOdkpxa2QvUUdW?=
 =?utf-8?B?U3I1NW5YM3o1MGZFaEYzUitGTDhkKzVyek52bndILzFKZGVXdFUxaTZQQ1o1?=
 =?utf-8?B?akpsQmNBNHQ5cjI3WENnOUtiVkFjSzMzTjJ3bytWb1I5cElhOG9abnVnMmkv?=
 =?utf-8?B?MHJyNmlvVGlXc2JMcWxGM0VrZHlGcWlHUEphRUlzeVJhc2tCVmRwdy9yL0hH?=
 =?utf-8?B?Sm5YWDI3aVhBa05FM3hhemZ0b1UycFN0MGFScHRIdzZVaXRSUDJMcDl5Q2tG?=
 =?utf-8?B?K3ZRL2NteGNMSGphQWZlZXNsVlc1blJVV1RDdCt4dUp0QWRaUjdvZjVabzBY?=
 =?utf-8?B?Wm1HNVBZdzhDSnBDVjhJTldkcGZ4K0NIMGtkZTVQQ1JoOVdNRWUzaXJWNE1D?=
 =?utf-8?B?K1FwcWFUZzRXVTIxdmtteWNlUDlpallXTGFNSGtRQXdjdS9DUVZud1g1TFdo?=
 =?utf-8?B?MU1sQSszbWM1NDhyTU9nVC9aSU9vMUZNYVVvMVhGWkU2NzNtZU1yVDBJSjRT?=
 =?utf-8?B?am1BYTBwVXRYeTkvY0RoMmNzV2RJeEoxRXpFb1lBWW9tQ2dYTXA2VGlWMnly?=
 =?utf-8?B?ZmhONk56clpMTzlyT3pQOGtFRFNaM2NWQXlXbStSVHkrY2VpWSt3UXd2cndZ?=
 =?utf-8?B?bWNvSlBERS9kZEE5T2pxcnMzSGJkMFc2SDBSbXJJVXlFWjVtWVo0RE9LazEx?=
 =?utf-8?B?a2d4aXNzNVhMck5kdkg3bWllTFdZaXUwRFdYV0ZQWmV1V0UyQkl0SmZxTWgw?=
 =?utf-8?B?V240VVI0NDhRVUtLcmYxUmVEWjhjaHFrUml3dXU5RFdZYUtZa08rNjdLeHc2?=
 =?utf-8?Q?6WcIVFAFKsZHTPZqA+ejh31DNDTEjF1W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3czSXkwdE11THJoNHl2NjhIWm44aGdVUnd5cVlCUTJxdmJ5dkFqVUlzVFRJ?=
 =?utf-8?B?S3FUWHRkTWdJTGljSlA4elZRRUQ4czhIcUFySWVMRERDY3dQbjU0TXcxbVpB?=
 =?utf-8?B?cGRpWEVKS21YWUwwV3c5VUFuVGdvVnMxL0Qrdk9USHovWGtaZ21EeXR4R2JX?=
 =?utf-8?B?L0N0OEsvOXY1cmorUkhpb0xFNlBxdDFaWEJrSldsd0hMZU91cm4vMGtxSDRU?=
 =?utf-8?B?ZFkvRExrY2djMVoyY1E1ZmlJU29nbzhSME0yODMzZHNuS0NpZ3JSTEJyOSs0?=
 =?utf-8?B?UkFKelE0SGFkaE95YzgwbGdKYWRGTjNha2xiaHNJaU5LUy9ySTNHd3M2S2hn?=
 =?utf-8?B?UG41MkZwZ3NvUnNkZ0lxR1FOM2RCU2pwT1pNNHVEY2JZeVlIS0RWZmhHWTln?=
 =?utf-8?B?OXZwc3JTL0FMSXI0djJjYW9BaStkRUh2UWNOL3gwSjVhRW5IY0RuNDF5Y0I3?=
 =?utf-8?B?OWR4dzZubWE2UmpORmpLU1B2dHFaMGMvRDk4N29jcEphRmREV2RUQWE2SE8z?=
 =?utf-8?B?NGJCYzY4MnA0OFVmQ1Qrblk5TzFZL1Y5SWxWTmhUblFadXhNNnZaZlFPU2Rp?=
 =?utf-8?B?OEg3M21QcTY2aXdyRTl6dkt0aXkvOXAweW9jeFF5MFdKOUNiMHpZTzZMVTlS?=
 =?utf-8?B?b3ZETVR6UEcwUjRDNVZoTFpPcUVTZ3MzNGNpeW96NGRBTS9yVHVFQjVsa0lH?=
 =?utf-8?B?QlR2SzNEcEJiZTFxMnBvaFF6cjU3dWRVY0dvcExGbVRMWmZFdGNlcjQ3Q0xS?=
 =?utf-8?B?WnFUZmlBbklrQmIyU2dsQUlWNURuRDdsZTR1bTRpREd3aXFiamVsQ251Vzdl?=
 =?utf-8?B?TGsrTW0xQXdFUjVyRm5SV3hCTnBqSzVHNGVNbHVGOHZWTjdHTW5iY1lxQjQ5?=
 =?utf-8?B?U2NCYjZhbGw3VHZMWE54K0g0UHZqQ05WRTVYSXZmL045aGpwYW4vZ1BmQVo3?=
 =?utf-8?B?c1RGZmNqeWZDVHZMTXF6cWRMVDVVTEFqQ2xFWTJFWnBPK3lIN2ZYTFJPZTNw?=
 =?utf-8?B?Sk53NEFFS0hGNGpPVUp1cTF0bklHeGc1dklrV3ZHOGUyUmxvR2pEdVhUSWg2?=
 =?utf-8?B?ajZOR1RWQWZKQW4vL05tK0F1bHF4TU45NCt3RmdCeVhzSDB0OXJIeDJMYTJB?=
 =?utf-8?B?MW9XTjgwNTNqUFJHejZialdRYVVBcnRJRmlUS3RuRTNnSVdYdHBoUkhtbjhF?=
 =?utf-8?B?Qm1tUEp5ajMzQlFwTWkvb1diQ0FDemw3aXJQQUltN3p4amcveVN2Uk45NWRs?=
 =?utf-8?B?TE9aUnpBR3ZwVnBWTTdOcTJvOFJiK1BOOW1vMUlmd1ZzWThLS0RiQW5Xc3J0?=
 =?utf-8?B?Nm9sNTBVT05TQlNmRWhwRTg2a2J4clJYYzVSNWg2YlJQSmNGZWd0VW8yM2Fs?=
 =?utf-8?B?S0hjV1J1L1A2QmRwVUZjRXA4QlZzQlVQRW5hK0N5TkhHb3E3UnFSRjF5UVBG?=
 =?utf-8?B?QjFjcmFjV1ZnQ3ByT1Y4eXZzT1pOOHpIeXQ0c0p4cVZNU3Iya1ArM2JWdTJk?=
 =?utf-8?B?S0RNRzJhTGcvSld1SXFXb3g4c29FTTJGd0lRMXRCbGQ1UEo0bW9vN2hnZGVl?=
 =?utf-8?B?NFYvRFltV1RTNXhORUJGWU0xTTFrcWRJZDQyMVhreFNLMlAvclJFS3Btc1BV?=
 =?utf-8?B?Y2tyK3N3aXhqOGV6bXRzWXNEK29IUkpiYjFyeGo0VDdZKzRGenVteFRRT01m?=
 =?utf-8?B?eTdkQ3kwZHJzVGdKZGRRbVF2Y2o3b1dkNFpyaHNTL0g5RWhLVTA5Z2lPQWkx?=
 =?utf-8?B?d05BVmhYb2dyOHBjcEJXVUZKRUExMmM4bUMzUjkyVnRZbWVjeFJTUEg2SDA2?=
 =?utf-8?B?bVdFVDY2Y0VqSFZIcHV3elhZL2xGYjlmWVFLajhyMGEvRGxuTnhzY1pVaUl2?=
 =?utf-8?B?Qmdub1ZYcmhhUjRxaW1Pb0E1NFJ6UzlXNWhGelBzcEtGaFFPR1dtSUdPME1K?=
 =?utf-8?B?RGQwTEZXbDlDRVA3cGVGUGtOcDhVTTJ3SEUvdUltK0Y2NER4WmpiNWZqRHpG?=
 =?utf-8?B?NUFXeWs4TTBJNEtucUxNKzhsanBvNTd3ODhBZis5TGRFUUs0Q21uTVhQekkw?=
 =?utf-8?B?YlJSTHZCckZXZmJqWHV0WmJLUklCVmNZelNhSTVZY0UyWXEwK0wwT1dqemEv?=
 =?utf-8?B?cWhlM0RNV20xMXlBbnhtd1pYbTVGQUtqbDBoS3NiQ0xUdnhXSENoVmFQRjdk?=
 =?utf-8?Q?DU6YWnmoIHngZ0HRkh+wN8K2o5JGufecpGmQwj9SpVt+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9f9a6-1d88-4d4b-cae8-08de2b52630c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:09:58.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyQHIn1dg97Ld3x5l1+CO3X8MLeQnop5wl/s/HHwW0/suuxoTpFs75/1+CmaGj/WVziILV8OUwAM+H3a0057Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892

On Mon Nov 24, 2025 at 7:37 PM JST, Alice Ryhl wrote:
>> Compilers can of course change behavior and have bugs and so on, and
>> thus avoiding to rely on it as much as possible is a good idea, but I
>> think it is a good idea to get build asserts reliably working as much
>> as possible for certain use cases. In particular, I don't see why
>> simple (local-enough) bounds checks cannot be one of those (it may not
>> be today, but it could).
>>=20
>> Of course, the best would be to get the language to a point where it
>> supports this sort of thing natively. But that is a longer road.
>>=20
>> And, in some situations, there may be no good alternative (i.e. const
>> eval / generics / macros may be too painful to apply), and thus people
>> may end up adding `unsafe` instead, which isn't great.
>
> The difference is that someone adding unsafe to avoid a bounds check
> screams to the reviewers that something sketchy is going on. In
> comparison, drivers calling `Bounded::from_expr(_)` with a non-trivial
> expression looks like entirely normal code even though it might be
> relying on the precise and definitely subject-to-change details of when
> LLVM is choosing to inline various functions.
>
> If const eval / generics / macros are too painful, then perform a
> runtime bounds check just like everyone who uses Rust outside of the
> kernel is doing.

I think that what would be happening is more likely to be another
behavior we see in Rust outside of the kernel (and inside as well, tbf):
the proliferation of calls to unsafe `_unchecked` variants.

That's the direction I was looking at when I thought `from_expr`
couldn't be salvaged - I even converted the whole Nova code to use it.

In some cases, it doesn't look too bad: for instance, when creating a
`Bounded` from a bitfield, we have the mask and shift right above and
it's easy to write a convincing safety statement.

For others, I was pondering whether I should make the containing method
fallible because things could change in more subtle ways, and I wasn't
too sure that one would think about revisiting the call to
`new_unchecked` if that happened. The benefit of `from_expr` in these
cases is that it throws an error if the code changes in a breaking way,
giving you more confidence when making assumptions about values than
you can with an `unsafe` statement. This results in simpler call
overall.

Now I fully agree that its use should be limited to very simple
expressions. I tried to stress that in the documentation, but I'm fine
with hammering it more.

And apart from the little oopsie with the missing inline directive, this
has worked well enough so far that we have no need for a
`Bounded::new_unchecked` yet, which I find nice as it reduces the number
of unsafe blocks in the code.
