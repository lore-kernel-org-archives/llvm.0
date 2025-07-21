Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7162C9D;
	Mon, 21 Jul 2025 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115783; cv=fail; b=mCP3/5aY2cr0yF48RzuyQ4znS4gNzIjkjgHRW5JOfSJFiLoFrj3N3X2JYgdZWSZJdvUMQYqUYqtytRZ5Z5aysAOiwaW11CILI6uqQgORp4bDEJ2O80BstSsr5FWUdN6E1dEVJLjrpuaCYU9dz4Dh7fELkYk4nV9nAtTjcJs9oqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115783; c=relaxed/simple;
	bh=2P/fanjioQmNiU9KntiIYcuIl012LrnE6xTPvTZfOlY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GlQ8WByyWSPd4Upt7k55o7RA3OlgbrgzoANAIJR9Ok81BZ0ISwcWGmuOikSGTTPnlPJ5WGFy4fdX1N4H3fXeL+U/vk0PrF5AE7jtZwhS5Z3xzEWRO6yeAYhK2O0E6hGEncoaAaw0acE43enO+h8QheE8nLhieTwppH6Ud/dspls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3xMeHRcR; arc=fail smtp.client-ip=40.107.101.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3xMeHRcR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrQkf1zj9Op30H2VVYLP7PtWPzjwb3VVzBGqhTc1FkpJvIk7KK3Ps0gtwr8Ta1udk8GNQYfC1x/lCfIVJivePoe7ZhZgvgYxR2UcUWaWiPEunX804oUl6X/5/+NE556SMQoFpDLvglz/gdwinv2VgOsCj5DOwGEmSwuSqK/O5GZlORPknHT3G5GzmBE2ZGsbyGHnfNoP/FLpb3uEzOYg7C3tM4ZYNq7ecMyRLNq12C0zoCcY+YL2zfkj2qK07IRBHGKiQgcZJ3FERHQCqYeBbmmcd6Ym/SfhtFbsiHvGLk2aBLmuK2JUtq/iECIcsgJwGPLr2p53I/AdSlwJc5X9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P/fanjioQmNiU9KntiIYcuIl012LrnE6xTPvTZfOlY=;
 b=CY+Hoj63cOCDPRFU39vxfSQfazuSevjnPqs+ENulYtD4eeIdus1Y7DEWkIfkLcYcRPEtLMeFgvbEpvkSzbaL6r1Uk6GWVq/CMRQi5ggGlJrGWvoGqAZbixtl+RDkhDaHinbuwYBswUmT9S39hq/11IPezSlOKIF8VROv+aNGd/3LeIrz+boBXzgWlCUmXY2lAZLCyVnf7dQBdKqYjMopxWfFkrXdq/DeaBZE+4mhhiukawP6vMZwS7XdUEfLwVRxCH3NjjLs0+2/ja17ieX8iPbpQ5ZpAGndH2D70j5OCiF/s5PUINHgvmfL2MejPzjppdUT1Od1MGsmsrPzEO3gRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P/fanjioQmNiU9KntiIYcuIl012LrnE6xTPvTZfOlY=;
 b=3xMeHRcR1DQfzbLDaGIBEeUXggvVG8uCRndlZfZbGzSfjuUsFShIBeI3rjKqQ2WJAqMnMQQWtQMxTL1D3Tlnog553ULTX4v3CrW9B9+QV+n/3R8f159oMZms8Kq/jyo3GouPZ4YB8POqujEUnSpN6UJmhkR6R6ztG6CmK9Y0yKM=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 21 Jul
 2025 16:36:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 16:36:17 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: kernel test robot <lkp@intel.com>, "Zhang, GuoQing (Sam)"
	<GuoQing.Zhang@amd.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>
Subject: Re: [linux-next:master 7967/11307] ld.lld: error: undefined symbol:
 pm_hibernate_is_recovering
Thread-Topic: [linux-next:master 7967/11307] ld.lld: error: undefined symbol:
 pm_hibernate_is_recovering
Thread-Index: AQHb+gA4t2T6RMFjh0aod3J7esRiGbQ8xycA
Date: Mon, 21 Jul 2025 16:36:17 +0000
Message-ID: <73de7716-4854-485c-9579-3d5020ca4d7c@amd.com>
References: <202507210727.vGfGoii4-lkp@intel.com>
In-Reply-To: <202507210727.vGfGoii4-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|IA1PR12MB6308:EE_
x-ms-office365-filtering-correlation-id: f056d404-542a-478a-0117-08ddc874b726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkFUVmRZZ0kvalQzUUV5VEJiUWZtWVNGUVlrcVhhNlhBM3NDYisxVUNTVDNT?=
 =?utf-8?B?R0Fqa0duOEJlSGUrd3BUOEhmMDFzT0pLMnZtYmpzK08vMG9GRlJFWmJjbDJq?=
 =?utf-8?B?bkJtcUoyQmdSR3h4ZWtJVk81T1UrSjNrVTRkay9FODJlblBoUEJxT2NtbVFB?=
 =?utf-8?B?N2gyR2kvWWhBZTJYWEJNS25ESTM0MTVGbnVaelRMUGZtY215UXVSOVdKNHdR?=
 =?utf-8?B?NnFCMHNQVFpkcmFMM01Pa251dVc5SDBxTFBHRnpWQjF0dnYwRzNWdTB1ZWdE?=
 =?utf-8?B?YmxmVkwxUWFjc1RoeGZUQVRhRjlHak5tZ2x3aDZIcmFUVXN3WTY2aHl0U0Yx?=
 =?utf-8?B?OWJZKzlic2kyVVYwUUZOWVRreFRuOVRxNzA1a0JpQSt4ZFJTRlpOUmNYdDFl?=
 =?utf-8?B?Y1ZjamN1SFV0QnRndU54WEt0ZDJlU1V6bTRrdzdWS0ZRYUw5a0g4ZW54TWRj?=
 =?utf-8?B?ZTMwbyswTW8rb0twVXFMenhWUk9rMTdneW8wVElkOXl4WXczWXFwczE3WVRN?=
 =?utf-8?B?TTZaazlOOW10VXhhUFFlVG1FNlA5cFpyZUlLWWp6LzBrNkV2MXFSTmJudXVW?=
 =?utf-8?B?MGk2SzhNS1RGNlM5c1QyYXFXTHdJMlEyaHhiWUJzbWVKbWtSS3dVUFdOa0FR?=
 =?utf-8?B?MzdMbE5IdW5BcjlBNFJ3M2VHeG9uZHNvYkoxQVh1aG5hUzl2Q0RFemt0WTJR?=
 =?utf-8?B?M1JOWjBZRWlNSDVxYlRBNTJ1VU41VmxYTlpSUXBTcmVRRVJMMWl5ZTlMY1Bi?=
 =?utf-8?B?aTN4dVpGMDBpMHhRcXFySXlRbW5hbHhJSzI1VzB4NWpLU083eFNObmM4ZTU2?=
 =?utf-8?B?ZmNYd08wZ2VBNU85Q05QT05kaHVxWEpmYzBkZ3J6V3AybHNZclB4V2FrODB0?=
 =?utf-8?B?RlhtdlU0bnBCVGFhRVdiYlA4QmpwQThFSkFkVGJwYXZuRy84eVFqdUllaEo1?=
 =?utf-8?B?aHBLaXZsRWc4aDYvMVJya2pjekRkbzlBQlRCa3ZnOVJHTjlacUg3NWtWR0Fz?=
 =?utf-8?B?UTNYVENYMkF3VjFaakg0OUtjL0YzWnZ6cnovSUVpYlpjZGJNQjJhd1BzN3U4?=
 =?utf-8?B?OGpOL1NEQ2FRWkwwZ2JVZW5XWTUwdzM1bndOQ0hid3daSXVkWTRIQ2pvTWRG?=
 =?utf-8?B?MmpNRmZzOE5YU0NnL2VURFhYTUZJREM1dVVhQ2RaTGYwck4wUkxkZ2hzclFJ?=
 =?utf-8?B?c1VCblJUeVV1bFNnRko5Um9FbGQrOEI5bFFHTTVSY0dpVEp1b0JvaC9mQTAr?=
 =?utf-8?B?Tm4xb1ovOTJQVlRzZW9JYm9GOTVOdFJQV2R5bEJoK3RON0R0akJ5NG5zMDMw?=
 =?utf-8?B?VHFtaGlUS25ROXJ2MlFNMmNFalhmc2R2VzdiSFQrRCtNZUZMUGRxTVVQeS96?=
 =?utf-8?B?U1A5TTJXM3R1SjF6SUpQSGFPcWpBQnJKNys0OThXdmlpbHh5UG5QYnZ5Yndt?=
 =?utf-8?B?dkFrR2txZzQ3ZGJNTnZqMi9YYno5ZGhPbzdFWTNpMnNWRnhScTljQTNQZWxM?=
 =?utf-8?B?bGN5V0xwdWZBaUFkN0IxclZxSzFIQzRDZ0NxTml0cllDT3RJZmVnMSs0cXRI?=
 =?utf-8?B?RjhJRWhKLzhTTzZiN0szZU5ML2xNL2RtMkY0Z0NGVXBqQkxNSVNUUnJCT2tX?=
 =?utf-8?B?MGQvVzU3NVh5SjFnWDdnN0dyd0VlSlNxcDdDNUIzOEhFOTFoV2dkOEtPT25E?=
 =?utf-8?B?OWZaSlBFWStzR1lKeWZtZ2kvcC9kdU8xUTlsdys0aEdLUE9KMFVmMkhvTGd4?=
 =?utf-8?B?VjJlZ0c5NGZaaU1UR2twbzduSFc1MlNmWm1ZeFF1d3JZUzZYcUJ5cVNtQllk?=
 =?utf-8?B?Um9mV0gyR3N2MDVnQkVpZWM1MTMreVhKK1k5SXcrNEl2aVdTUFpCdTFrWVNX?=
 =?utf-8?B?c1BSbXBvK0F1anYyckU0U2l6R1htQlFUWGwraXZrYzI0YUgzZUVia01VZVlS?=
 =?utf-8?Q?XYb7bFySVU0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEtxYWoxZmdLSmFjT2VXUkV1bW0xNXp1c004Y21LcmlvMDR0QlAwamNkTGlF?=
 =?utf-8?B?ZUttZUFMVHprKzIwUmdPV0c3TW9qeWtmMjBwY0NiMkVIVzNReG9aVzlHUlNC?=
 =?utf-8?B?Q3AwZzBLYWg3U2Zwa0pvU2FBVWlhMTkrUmF5UEEvd21vblJzbjVFVVE3ZUgw?=
 =?utf-8?B?L0dOWDd5ek05MFdMeTg1OFRCWnd4aDJqNSt1VFFNYW1ZWDA0YWNMOGwyTkZC?=
 =?utf-8?B?SHpud3JMWjJFdlZRT1dRaUxqTjBEaER5blMzc01DOXh3REt4VTVWRE9pakFk?=
 =?utf-8?B?emN0OUg2WkZVVnpKUjY1ZVNrNWFYcUtDM25CdHN3RGNRdmtDalY1bUp0dWE2?=
 =?utf-8?B?OS9FeHFGd2Q4U1owWDZwRlFHSGNTa2w4ZEhhTjdsWjdHOFBkQ0xhdVZrYndI?=
 =?utf-8?B?TVRtcFNLMnhNWWtQWXJHNWtuM2RRd3c4V1p1NjdDMEh1RjZMMVRURUJ5OXBu?=
 =?utf-8?B?SkF1V0NsbG5Dd0d0a2s5RlZyTlJUSzhhbTNCQ29sRXNNVEJLMHNwM0xOUTdD?=
 =?utf-8?B?VExaeS9NVkZXL0wxYXlmZDhweFg4cU55Y2Z2V21KNEFmaDBSOGNYQ2NiMDF2?=
 =?utf-8?B?dzFqT3FjYWhSZDV3bzQzL3BMU1NUZDI2MHkzUVo1RHlBQzJtYUJmditzQkRn?=
 =?utf-8?B?L0RaQm41TWhmcWMzR3lZRTM2K01kaVhWbGdpOVZtUWMxdmJuMlM4V3E3RHRI?=
 =?utf-8?B?V1FsQnFKVnNPS3g0Zlh2SWJwKzNTSDhxSzdzdlJpTHNJd1FlQ0RCd3ArN2ts?=
 =?utf-8?B?U0ViUnFZQ1dlV0NMYVVPMW4xcmR3Z2dZb05TM2xMNnk4L09CL1QvbGkzNERj?=
 =?utf-8?B?emVBcEVSQlozbGNxdjRxbDVPeXJwdHNzbnhONlhQalRCcnNtWGdSbWc4UEdh?=
 =?utf-8?B?U1BLYWJzaDZMSmNEVHdNSEZtVThVUjVUMGFJcjI0bHpMSURiSDllbTNQVytL?=
 =?utf-8?B?VERMUkx3WVZsQ0svc0UzMS9BN0lrdzUxVkkyTldrVHNwemd5Z25sdjFjbCtG?=
 =?utf-8?B?dTJydWdFOVlFSUEyM0c5M1NjQllpcFE1SjVzYzY0dXlwRzBJT0dwVzJqTCtB?=
 =?utf-8?B?eEg5UHVqN0JINUUrTFRGbm9HbEd0REJoQmJXajk2bGpnYlIzdzhWQ05tMnpI?=
 =?utf-8?B?UEFxMFQzM3ZTODAreXFmWDVaZVB6V1RiNXlTVHhjbUw4bnlYZFZadjRnOExW?=
 =?utf-8?B?c3F0NEdmcVZiZkFTZEN0SU5Ia3l6Q1JyY1BiOVA4YW5RTHBWK0Z6dWFCajBt?=
 =?utf-8?B?bXJFQ3VxR1YzM05KbUw4N3dqYXgxM1RWbkVFVXI3eWQ5ank4ZE9VbzFoUjMw?=
 =?utf-8?B?YlBjbEtXbTBjS0g1NG1FNmdlbG54a0ZkenFlTU0wVDR4VTRNcW43RXVQSDhk?=
 =?utf-8?B?RUNIb1VIMUNkcDZubVZVVmp4ZVN6ck5NcGhzOVFVRXVGNnlobndZM2ZTSUMv?=
 =?utf-8?B?ZTIxMkNkeWtCMWZ5WjEyNGV2UEttREg4c1Y2b09ISDBKNVFoelE2TUhoTmN6?=
 =?utf-8?B?bExiZmtTU2xtL2NpVjlTY2hjZkVaNUlNd2w2OVVXdWhaKzEvNGhiTlBOc3ZP?=
 =?utf-8?B?SWZPc0VaZVh4NVVTYUdMZ0lKdXgzUi9Lb3A1QWNWWUtUUDIyZ1ZGc2g0aHNs?=
 =?utf-8?B?QWhHajJTK3RFZGszWU9BM1VaclVEbHB6MjB3ZnlFb3pXWVE0b0xrdE1HYnlN?=
 =?utf-8?B?cFFwTDhsZ1EyUEpjb3JpeWhZQWw4WmRjNzhUNW9Xa21kUDJTQnZuQnBxT215?=
 =?utf-8?B?L0R1djZiT21hQnNmdC9iUVhxWTdEbzZtZDRQMDY0TG1tN2R6VTdSOVdrRU82?=
 =?utf-8?B?eVd3cm9UcWZ2Unp1MXVsd2M4K2NJM1hVdkg5WnAxODhFb2pydzcrVm1saE9Q?=
 =?utf-8?B?ZHViZTRJSitqeVhSQWFVdFpLeXBQc0Z4b2J3d0h0WVJwQytJNW1USGpCT3gy?=
 =?utf-8?B?M1VSelpOQXV0SFRPZVVhYW82c3pBaEhsbUVDMU5qc0JlOWNza3daeGdQU3lr?=
 =?utf-8?B?M3Z3YnpNd1hzenBSZ0VqQTFWQTN6djhTOU9Kb3MzNDFKVG5WN1RKTXFaRWQ4?=
 =?utf-8?B?Qk5yUjFteUlkd1BaSVRrUFBINm9LQ3oveFVoZVRHYkRYOW9zeUpTTUZ5QjB5?=
 =?utf-8?Q?Fe7U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A3A752813EBF64F8BF741B46EF3EE6F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f056d404-542a-478a-0117-08ddc874b726
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 16:36:17.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KI+n1RSjnUu7H4TN0mAa6sw7osBCcNRqWpqW591hNSOYsWhhD+vfLfIpo9U/c8tBnIdmnMQvCKO8vkKzqcqpSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

T24gNy8yMS8yNSAxMjoyNiBBTSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6DQo+IHRyZWU6ICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51
eC1uZXh0LmdpdCBtYXN0ZXINCj4gaGVhZDogICBkMDg2Yzg4NmNlYjlmNTlkZWE2YzNhOWRhZTdl
Yjg5ZTc4MGEyMGM5DQo+IGNvbW1pdDogNTMwNjk0ZjU0ZGQ1ZTA5Nzg2Njk5OWJiYWViYzVjMTMz
ZTU1MDdiNiBbNzk2Ny8xMTMwN10gZHJtL2FtZGdwdTogZG8gbm90IHJlc3VtZSBkZXZpY2UgaW4g
dGhhdyBmb3Igbm9ybWFsIGhpYmVybmF0aW9uDQo+IGNvbmZpZzogcG93ZXJwYzY0LXJhbmRjb25m
aWctMjAwNi0yMDI1MDcyMSAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZl
LzIwMjUwNzIxLzIwMjUwNzIxMDcyNy52R2ZHb2lpNC1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4g
Y29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMjEuMC4wZ2l0IChodHRwczovL2dpdGh1Yi5jb20vbGx2
bS9sbHZtLXByb2plY3QgNjE1MjlkOWUzNmZhODY3ODJhMjQ1OGU2YmRlZWRmN2YzNzZlZjRiNSkN
Cj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEu
b3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI1MDcyMS8yMDI1MDcyMTA3MjcudkdmR29paTQtbGtwQGlu
dGVsLmNvbS9yZXByb2R1Y2UpDQo+IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFy
YXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBz
YW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gfCBSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwNzIxMDcyNy52R2ZHb2lpNC1s
a3BAaW50ZWwuY29tLw0KPiANCj4gTm90ZTogdGhlIGxpbnV4LW5leHQvbWFzdGVyIEhFQUQgZDA4
NmM4ODZjZWI5ZjU5ZGVhNmMzYTlkYWU3ZWI4OWU3ODBhMjBjOSBidWlsZHMgZmluZS4NCj4gICAg
ICAgIEl0IG1heSBoYXZlIGJlZW4gZml4ZWQgc29tZXdoZXJlLg0KPiANCj4gQWxsIGVycm9ycyAo
bmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiANCj4+PiBsZC5sbGQ6IGVycm9yOiB1bmRlZmlu
ZWQgc3ltYm9sOiBwbV9oaWJlcm5hdGVfaXNfcmVjb3ZlcmluZw0KPiAgICAgPj4+IHJlZmVyZW5j
ZWQgYnkgYW1kZ3B1X2Rydi5jDQo+ICAgICA+Pj4gICAgICAgICAgICAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2Lm86KGFtZGdwdV9wbW9wc190aGF3KSBpbiBhcmNoaXZl
IHZtbGludXguYQ0KPiANCg0KSSBjYW4ndCByZXByb2R1Y2UgdGhpcyBhcyBvZiBjb21taXQgOTc5
ODc1MjAwMjU2NSAoIkFkZCBsaW51eC1uZXh0IA0Kc3BlY2lmaWMgZmlsZXMgZm9yIDIwMjUwNzIx
IikuDQoNCkknbSBiZWxpZXZpbmcgdGhpcyBpcyBmaXhlZCBjb21taXQgYTZjZmE0Yzg4MzM5NCAo
IlBNOiBoaWJlcm5hdGU6IEFkZCANCnN0dWIgZm9yIHBtX2hpYmVybmF0ZV9pc19yZWNvdmVyaW5n
KCkiKS4NCg==
