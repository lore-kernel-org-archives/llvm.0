Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B972D0C9C;
	Fri, 21 Nov 2025 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763705605; cv=fail; b=cIDZ3dNJAgeiXJ4yGsxQRcxFMW/MQl9XYlv14TiCnwamca1RtodvREBjYYJc/1cDEAkRQaLJ5KwQVZiAVz8Nv4EHwKiD5c3GC57i6yBTuXd772TlkyACGXD5xnZzH5S0y1KHuhREbuYg+/73LDZYg4Y3j+6mtpgen7mAHCqQxNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763705605; c=relaxed/simple;
	bh=sEqTtxrsheN17aEUdEX864CfV702oabafkiG5EPdbio=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SWGs++NcpS3UGz92Qd7wk5yyskosrlluY0Opfv4NbwJsUDxk5kTJ/R0je/Jlb9SyiyM5eFRPm69H2Jk/sNfdUqfJP/08+8UEWj/EuDqhSeuL0BTBH07HG4vj6LjCgDW4Xhf2KikJj4k0UULyH9ub+yl+fobb5hApa8x4jTHrLLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BE5ojW5r; arc=fail smtp.client-ip=40.93.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BE5ojW5r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9jXJUXPVQpiR66PTJx+AVsa8jDoqVTvKcgw0k7wXncWbc0Euh76ELuURmqvXCjAWmEIzMrjoNl8wDZz0ZFS7Eq5Q1SY61wXBc1MQ7CiMfXs5XICjxJnBDNmGlA73bgOH2fvj6fAG7C0bHAde/2gmCM+eeExi+Nk/Hp7RNuMYDajUjI9mWSLBe5Ahjb4IYrWfpU9oRF4uX0MKLX2lbJ0rU09/+RebL9eoaNb78fY4ucH5o3DZyMA2IzdX+/LF9gEAamfSSXUhn8uSWMrt5zkH5VwyhXozuZr0ZTmstYstk3AC0rD4NNYjnADU/9AggdDLKp+PlT1ydSvC5mKXRaoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dFTzyUG3j1kyY8yHZBkcQ5EaTnHFI9PBwy6uH6Rixo=;
 b=sjUPW9PC+B4N8/s4aKGIZez8rwkGhjwo8YD8UnICqigY4ptKoh7a8aM37rbqFK3bqMZue0cLMVzQneWVebchljIuW5IZqPMxAo672NJI+v96RazZqiTYRF6PmmgCQAjHy38AU2DiSqpeKupcmYbRaIZFZ0gz7+EqNLe/uKJb+FD5ISFH1E5LSOF3bKu4PMdW/NbKEFGxpN1txLD0nQMcsqHorjm3Qa3SCy+DVfmK7/Law6M2MioePwip08r6ygoc/nd1T+k/dYf64tk2AZ6QZub7bl+Kz79rzbPVJIdPGTF2Dp7l6kp09Ott/pN92lO9MlLfBueMgFI46z2z0sf6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dFTzyUG3j1kyY8yHZBkcQ5EaTnHFI9PBwy6uH6Rixo=;
 b=BE5ojW5rNivYWW4PVxEVwTEYmevK+DLpP7GhsA1pcr6d0Cng9cxEj6rCeDvjB5mhT1b65STq/5Y4qTizj6wrMkbLbkzo8+cpQrdfS74nTxord5gy7mJrbaTXY9x3uUSUr/Dga8NRJoTZrgjJOg46p9K/oU17N17iVDVNUa7PGMl8+b5df5TvF3FNvr1Zk7cMrZoPCZ+ukrBT1ykj+3NJawwFe3znshQUzDJhSS0aTWAfJKPdkre9ERnJ1tI0Y9hJATbA3UZ1m4mOJOmUDriXjDB04ucMj4M9dqOfrZken/yd8SIHmMu6Axub9JJxCSwmsEIE265f+oAUGirqC2x3VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:13:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 06:13:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Nov 2025 15:13:16 +0900
Message-Id: <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "kernel test robot" <lkp@intel.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
In-Reply-To: <202511210055.RUsFNku1-lkp@intel.com>
X-ClientProxiedBy: OS7PR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: 420876be-4ef7-45c8-a582-08de28c5117d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnpLSzZGNUh1MnVGc0dYcVpkUnRZTGRVbmR4eEM2U3Y1czJMVlpCWHBXdk9o?=
 =?utf-8?B?NXVQL3lua2hOVTdaTDNiRDhOQzBGRmppL3E1UFpIS016d3RUZmdRMDRwYnMr?=
 =?utf-8?B?Ym5BWFRxaUdQY01zRmUvYisxV3ZhQVFyQlVGNlMzYjdRZzl6NWY2OUFqWGdx?=
 =?utf-8?B?KzF6Sm1ua3pWa2RQM1FjUDdPT3J5Y3NCa1lubEsvTlJNMXJjZHcvZFJYY254?=
 =?utf-8?B?bGhtUEhUVXdPbkR0U2M2MU8rVDcrT3k1K0hmQkh6M1NoZFZMS0VUak5oZFJP?=
 =?utf-8?B?dnBmNFZOcTc5aFU4T0FtaTBxZklqN2NnZlI3T2dLekxLdGZ2SXcxRUJEcUJG?=
 =?utf-8?B?cXFEeUFyM2d5MCtOKzFCQ0M3ZGwvMnd6aTJROW9Yb3dFS29ZcjBCT1YyL2l3?=
 =?utf-8?B?SlB0ZFFTSGtnclFjTE1BKzVHQXlSeXgwc1FuNmJaZFh5WGQwcGJKUWtubXBD?=
 =?utf-8?B?VUlLSC8wd1Vvb0JrY3BucVNoM2RzaXBZRTJEdW1ZOEJnSHFqRHFVNTRJRm5F?=
 =?utf-8?B?YUw0alQ3dWN5bVoycWpPYWJ3QVdsWHBMSEgyWHFYamxCTzZUQ3BLb25Gempz?=
 =?utf-8?B?TitvSWo3ZHh3c2sxVWNCRDQxOEtydlBsYjhYdHBUM1NtUUNiSEdQYnJLZzR1?=
 =?utf-8?B?cWY5N1V0MmQwRGJaNlJnNTBxQU9ZMHZVMEpEVWlJbEhkZUdsSUhLc2dBdWo3?=
 =?utf-8?B?VU1FREthVy9UQUUwL0lLemovTEl0cGF6anFGUEVIM0tTN1p3ZHcyY3B1bU80?=
 =?utf-8?B?dUlTRnlpeW5yOGtuSFVNd0YzUXU0bzlpUHNVVUJvWGxSeUM2RzBIRmI5SFFj?=
 =?utf-8?B?VVVoalBvZmY4Vk5iUmhHejFOb28vQlBicTdXUXpabG12TUNWVzRHVUtJTXdu?=
 =?utf-8?B?RUdFdVJXbjl0S0VkYXBmMHBkUzdKQXdNT1UxVE01bTBGNWl1N2E1MzhzNTVx?=
 =?utf-8?B?U0tBRWwrNUsrY21rUWFQb2pGWWtmenM2NHI0cUJ6T3hXd0N0Z0JPSHRqRUVy?=
 =?utf-8?B?am9JY0hnTld3YWJ0VkZVTnF0ZU8rWmJlbWtoc0gzV2FYUXFIR0tJR1Z3aysx?=
 =?utf-8?B?K2VrUnNiSys3b0s4KzlQL1djS1BROTl4TTAwZTNmbHE5Z0Y4V05jUHZsbXRN?=
 =?utf-8?B?aXZEYmJYR2MzdDR2bEcrc1BNV3cwRHN4R0U4YzJBSHdhcmVZVDhXOTRSMXVD?=
 =?utf-8?B?NEh4SGM4V2d1VG9GU3pGNExGSmVTdjBxYVdkcUwvWFFJdkRGbStZTnEyQlc4?=
 =?utf-8?B?Zm5yZlhDMXFHVXV6cXhQUGNLY2NZa2ZsY1BWQTJMaGVpSVVNRUp6UDV2YnA5?=
 =?utf-8?B?L292WFRmTmMwKzhzY1F5QzhyTG0vaTJvQklaSy9mdnIwTGVLZ2tBM25RVjF6?=
 =?utf-8?B?WC9Nd1h3SWVqRHB0cWk1YVFDVmpMSDJ3R1MrVmMxeldKNU5vYStXWFNXT1A5?=
 =?utf-8?B?MFlyT3ROWUppTGJJT0tNMWpWb2Jlc005MmhuWUU0akE5eno5cVNmb0Vyb1Nl?=
 =?utf-8?B?U0VFN3dTeldZd3V4VnRjYmFIYXJXWVBTa0NPa1dVK1JYRHB4dDFubjJVV3pJ?=
 =?utf-8?B?czBkeE8wcGNvMHppakVpanpsYnM5Z0dCK0FDUXlFKzJLMVgrQWVuK2loT2Qz?=
 =?utf-8?B?bko3MnJOZ1E1SEtRY1dGZ0N6RUJUMERiZTVDclFjZlI2L2VSaWN0eU5Wdjdo?=
 =?utf-8?B?T1pMVEtMVTBOV0Q5b2M2OE84Z1NMQ010bmdwdUpUbklsRmNOZ2U2c2JsbFc5?=
 =?utf-8?B?MnU1NFRKaXQwUHA5Yk8wblFjZWdtRlZWaVFDM2RRVjJCTU42WkR2eFhXemlX?=
 =?utf-8?B?UG5HMGJiSVBWYm1MR1dSVm9nRkN1OWtXOE0wWDZhZ0F5cFVPbjlPSEFHanZ0?=
 =?utf-8?B?bXNqbUtIbFk4bnVXQ1ZKNjhEcG1Ndjd5RVlGeFhkajBqeGRTR2NaUVIyS09S?=
 =?utf-8?B?RmpMa1Z1R0VPTHA2TFVod3g2OGJkQ1JxcnNURVQ4Mk4rdHZJY3I4dGkyL1Fp?=
 =?utf-8?B?UGYvNldhZ1Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlJSGpBcnZERzkvTFk0ZWNjZ1hCZ1BKS2dZMjFMSndaRm0yUjhCNmVwWFNN?=
 =?utf-8?B?aHZkRStSWmVST3ZyS0gwa3o4ZEp3bVlqbmM5bitJbGlPZUpWNmhDK3A4TDkw?=
 =?utf-8?B?YlRYdmJmQ0V4czNTUkFGWTBGSkZaNlo3ZmEwemMzMjhTd2VHU1FvT3p4bVlV?=
 =?utf-8?B?Y1NRLzhDNHhtcm1HanZHY0lSaHJ1blJRSW9zL3NFbkdxd05hSEp3ZFFrak0z?=
 =?utf-8?B?aTVzWk05NmlnMkRyaHVMa0FuaHRDNHZ1MkpTVEp3dkcxRmtveEo3RUEvZzcv?=
 =?utf-8?B?emp1OTRZUzJFRUlXOWdYWFFFbXhPSjZnQ2lxYzMvVU90Y2VzL1NVV2x2dy9Q?=
 =?utf-8?B?c0NNWWl1VW5iTnJVck5tVERwQjhoMGt4MTJGVzFyYTNhS1RUc0hqOEo1aXF1?=
 =?utf-8?B?Umg0S3VQbjVSb1RBcFo5WE1vbFVLVjBSenRlY0lEdXZSS0hTem10Mk9Yaktl?=
 =?utf-8?B?OS9LWlNwTWZVRlNZRGk3b1NPa2xQYmZ3TmRFcFJ0RERSeU16L1Bob3E4cHI3?=
 =?utf-8?B?dmp4QXYxQmpNS2VETnZjUVhrZ2RXNGRpZzNVN25lYTFmQURBclhmbmpyNjl3?=
 =?utf-8?B?T3p0NVo2aUxBejVncHo0dm1NemltZWt4VVh2Qk12RWhkUCt1Qk9PSG9Fa2Yv?=
 =?utf-8?B?ZWdVM0xjam9zMFlBOTZsUC9uNWh4SWZtenNBSTVFaDkrQndUSFRVd296Ky9Z?=
 =?utf-8?B?cXdQSUNxaURxYzQ1U2NPbHZMQm5la1Nyem9Id2g2Ym91dXlmZDNBUmJtNGpK?=
 =?utf-8?B?ZnhGcTdETzN2cjFZMllYMU1qbExMZEp2Q3pJTEpuZHhSSmMybzhSSW16UTlY?=
 =?utf-8?B?VXIrT1IzdEVId3Z3RDF4UVBJYmRsSGtnY1hhYStQRjNmK1JCMHBKaGY5cDdk?=
 =?utf-8?B?a3liWi92MTl0ZXRmMXBtWk11L0RBZTVBemNDR053cmVBSFhWMjUwZ2JXMEcr?=
 =?utf-8?B?V3cwMjVsSnQwLys5TXFDVDU0ZUhIZFk0cis3TjFlOGJQdUJxV2JLN2EydGEw?=
 =?utf-8?B?NjVvM2JTNmdQb1VEaFRwajNObTFWc2s5THNUWHZsV2JIZXhFT2VpRFYvSjJh?=
 =?utf-8?B?ODBjcEtTSG9qQk1oazdudUZMSU9PNzl6c3BVL2hTbkw4YnpEZ0V6VCtSakVB?=
 =?utf-8?B?ZTFNWVRqcDUzNVMxSmNMOVQ2bHAxbGp1cXhwN0plZHY4Ym5lWklrZlBVbkR4?=
 =?utf-8?B?dnUxYzRVNjVnMXZibTNHdGtZU2FDSWF6ZEV3SWU0Z0ZxdWFGTEdCVFBpWlFk?=
 =?utf-8?B?MnZ3YWErSi9zOWkzN21kdkg3aUVBV05yUnJKd0NMTlFqcGdpTXI4VDVCQ0xC?=
 =?utf-8?B?dGRjTXB3VUs1ZWpvdkhzSFR5Q3FIUjk4TS8vZm4ybEpsVklvSUltM1RSWmhn?=
 =?utf-8?B?emJuQzA3ZURTU0dlYTFtMGluT0JBZWxhTm96Z2ZnT3VJQXF3RTZUSTZTazBh?=
 =?utf-8?B?RGw2OVFicUxRdGpobFlaNzUxdnpTME95QlpRaktaVkFWZnVna2oxb2V3YWNE?=
 =?utf-8?B?b042WVI5ejkwOExoUWNTLzk3NXFBbUZIdG1iejNLMmlXTWRBQ1l0UXJHM0hP?=
 =?utf-8?B?bm9wUzFqRGdkQmRkUTlMUGRPZlJsMEFNMWdNSG5aNWhpVEo0dFd3cS9FMFdw?=
 =?utf-8?B?SEJpY1plNzEzUkZHRUMxVk9yR2xmQjRwUFQxYXNQZjRpWGZ1VmR2R1Q4LzB1?=
 =?utf-8?B?L3AzRkM1UWJ0WjU4VTBDZTVxNzBvTkZ4R2dCa3AyeGgweXBrR1V1QkJPdWV3?=
 =?utf-8?B?OVByakdZMERzU2dFNGpBWTRUcUVBeUkvYzcwRDM5MjJybTVXMmhvVmlkWUlR?=
 =?utf-8?B?OGtwb0E4SERSeEx2ZEI3UXdlSG5aOXVFNXVQVXErM3ZTSDBTYldMT2RnRDFY?=
 =?utf-8?B?TlBweG9vZzZYbVFqQ2JBT2ZvSmlkNEVseDZFYmZLNVJSL3VxWWV1RHZiaXA4?=
 =?utf-8?B?R3BlWXJwaWFpcHJrbDZ4dGpkTUMreVZGbWVzbS9HRWlKVjFyMVRmcDNKY0tl?=
 =?utf-8?B?bkdjbFlHSExJUzF4LzZEelFPcWJja08xczU3TlNPOVpVOU51QkdkMjQzaFJU?=
 =?utf-8?B?cDJEMWEyTTdGOUpSQTZXclZNL25rSEFpZ05LZ0o3ejE5WTVmY04rMTgwRzZh?=
 =?utf-8?B?YnRCQnJQbVlEaWloamxCRG9qVGRoVStrczJwUGd3VFh4MXVnQlBQNWY5dTNJ?=
 =?utf-8?Q?jWnyGRl1DDYBYQM+L0QhCVw+WBtc7ZB86C0pYvTo+NgJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420876be-4ef7-45c8-a582-08de28c5117d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:13:20.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+xVj7FTBV+ul2SMYeEHC8p5d+ybtT9uYoiBYxqH15GEIl8xfvlSywecP7JkiczK3bG/ZL6sPmkTIXmrYXMQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404

On Fri Nov 21, 2025 at 1:41 AM JST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> commit: 01e345e82ec3a5a7edeb9fa0dcb7fd4b0e5c534e [9676/10599] rust: num: =
add Bounded integer wrapping type
> config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-=
ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251121/202511210055.RUsFNku1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: rust_build_error
>    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
>    >>>               rust/doctests_kernel_generated.o:(<kernel::num::boun=
ded::Bounded<u8, 1>>::from_expr) in archive vmlinux.a
>    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
>    >>>               rust/doctests_kernel_generated.o:(<kernel::num::boun=
ded::Bounded<u32, 4>>::from_expr) in archive vmlinux.a
>    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
>    >>>               rust/doctests_kernel_generated.o:(<kernel::num::boun=
ded::Bounded<u16, 8>>::from_expr) in archive vmlinux.a

Mmm, I don't like this. The expressions that are failing are extremely
simple, for instance:

    Bounded::<u8, 1>::from_expr(1)

So if the compiler is unable to assess that this won't fail, this might
be a deal-breaker for `from_expr` and we might need to remove it. :(

This would also mean a lot more runtime checks when working with
bitfields and registers. Or can we assume that this is a compiler
problem on this particular architecture?
