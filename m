Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8F30CB40;
	Thu, 18 Sep 2025 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204395; cv=fail; b=TgK4x4vKC+ytgWqb56dCqHr8e6mOaPZObWEpG/f92XiWPbOw46eTlA7uOEJHaTuZ13oP3ZG4AEUrvSuNpJXGYUdLurxrs+CJdp9I/NRWMcJk8UFWbl2Ystr8Shwk8FjHVan4uGvBUD2W1WieNAF3O1VbjqFvrBT75zIfC3JBdLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204395; c=relaxed/simple;
	bh=L0Gdh/tFOextT6rPebM4CgnmBfyeNY03ZZDxmom+PJ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NfZiu2OUyhAToThzvQ27qULdfCmzyR105QuJMK8gRyv6CCrK/Z7RiIgaZ/zRsP0xetNAgYtlR6qJDOyutKM8/rAiu+C4tp0ez42+9ZxdelKw0aC80kkpA8HXvhaHw6ZLBzQItEVsyVpDNaW0+7DLcFLmGuTirE/whpQaYMxS3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nfhgoOGX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tZiTRgwP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nfhgoOGX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tZiTRgwP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7fxaL021303;
	Thu, 18 Sep 2025 14:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h8AizG08JAePPpriKyhYh0GsLxM2LdlHfUhA32Yv2WA=; b=
	nfhgoOGXUo3yJjBNp/K2xqBGy8dWvccyx7NHNUd8N2NVzbXhT7Su5sD4HxHQiC5Q
	/sxdBvyHppWnINZrLvlpHWrsM0V28sH21sv2UsdbdTjuBI+Xbfq4bPU8WXybnL8S
	LTRZgK9JX0Zz1Jf7NN8VCsGsOh9uEcq8Qu84Yqw5+j2xal21ec1IgoRQSrfpS/Si
	G1u8DcFLyrn7tYi6u+FvxJtXDXPI1DWDB2a/LP76bPVTer36TgzLo/ZAo21T1c8B
	2ZLvJtVBbPEMV67l8AkzRTWThue5iKBgAxxqYSa7A00zhwDIhqFCzPWUoL73xcxE
	Z+RI7M0PBoAZfGcvLqsezA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9ukkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 14:06:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58ID6Ma3027324;
	Thu, 18 Sep 2025 14:06:30 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010055.outbound.protection.outlook.com [52.101.193.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2nf8gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 14:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSA6gWqHQFslxTsF7qFHju/OwFWzqrdmjmN+XLy2OevOD3l4DDSy7CleajQHJjEWUVXSWPMYfyTe+VGo9i3PnLFl7wI4OPdmS/MBqiBUEBaNWu4txm+h9HYxezcsMqVo4S2R3vFs3t2nAfPwm3d3TpK96H9Nj3/zj1uv7JbcMV0rbvkfVsw3sbi8v2sJcTs2UFYStspu8jbsGgE7PCdp++6EdXnQat3RzzjhR1J1c6fzdUhmqJE/ndWvb6NEuYan+3hS0P4Utmyq4fX20gsXz7ghsapHePTNNNNu8rDAnpZ9t2iyuk/oZxm8qwWP26lv0HrvV0+8RazqK3HdKqUQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8AizG08JAePPpriKyhYh0GsLxM2LdlHfUhA32Yv2WA=;
 b=ymBTP0n87BNUcskxLN69F+vsQsw0IykWCshcZlWpmE/BHX1ohzWnSVm1woXqMM5YySg0stqwqvByJewYTSSR25sAfSuZuilNEoHrUbkuy/ofr8AgEhdYgYe9KIwwxd6EqPtbd2+GfT0AODfWpQz/3ddXvlYWha1Hn1bHZHrG1RU0vaUrQFS/2ab4uNMj3WwnqM6Es5O3Pb5YLnZdMME/zpIM6Uib4avMH9NaNAJE7JovncYCq0hvgExTKLEUjnjDhA9bIHcLHUuDx1siCctV7UxNKcjifNhgCvgAnFTSKwgVBzn6UibP0GDDPzZZxPUmVyRf8PyXGvfLeiWHDLWCjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8AizG08JAePPpriKyhYh0GsLxM2LdlHfUhA32Yv2WA=;
 b=tZiTRgwP58MrYQGg/8ej+p+qwEXFPBpGY/ElwknioNGPZBqEF7DCjFfTtZLqWfcIEvh5/Oi7qSkRgm8BJG99mN4hDQ3wqN4supa5S4JqwbNGMp7SrjCKdHbm2e1qJ1uORlToPjUk1AE95jN3ZsHSPBTPESmLj/IEKO3lMdCB8Dw=
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d) by PH0PR10MB4807.namprd10.prod.outlook.com
 (2603:10b6:510:3f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:06:27 +0000
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::211d:441:2594:6cca]) by DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::211d:441:2594:6cca%8]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 14:06:26 +0000
Message-ID: <ed3b1065-f4c6-40a5-9a83-f3ec8252553a@oracle.com>
Date: Thu, 18 Sep 2025 09:06:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [kleikamp-shaggy:jfs-next 1/5] fs/jfs/jfs_dtree.c:2906:31:
 warning: result of comparison of constant 128 with expression of type 's8'
 (aka 'signed char') is always false
To: kernel test robot <lkp@intel.com>, Zheng Yu <zheng.yu@northwestern.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202509181832.frk03WjF-lkp@intel.com>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
Content-Language: en-US
In-Reply-To: <202509181832.frk03WjF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:610:b3::24) To DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF35CFB4DBF:EE_|PH0PR10MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: faf42787-5b83-4fed-0052-08ddf6bc8e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFBuZXJCdzVreWlEZkhUTXZKZUhQVERoSEdvY1FFMGRBemdCRUtNVGprTlUy?=
 =?utf-8?B?SUcwN3huR212TnhJUXF5MkRhOSsvNTJWaGtFWFdSS1R4RE5FWU5NVitnZEpM?=
 =?utf-8?B?SitMNmwxb1V4SG43d0hXcDQzNGNnZGozMFJaS3Jucm84MXdkdmhuY0RvWm00?=
 =?utf-8?B?cy92S3pkWlM0UDJYVGJjd2pmbnpXTStXZjg3cjByaUY4ek9GdzZLeGZ5NStl?=
 =?utf-8?B?d05BN3VDVW5mT3pmdXNxUTRIYnZXMVdnZ2tMV2NYODFqK0ljd1AxTjVxMk5h?=
 =?utf-8?B?K2ZOb1grcTN1blE5cmdnbHlxckFmclMzZjFaR29hQ3duZVdIUFIyUHplWU9E?=
 =?utf-8?B?MGlhcDhRcFc4KzQzWmpneGcyVVo1WWFJNUY1R0djc1BiSlgySCtocVZUY3M4?=
 =?utf-8?B?bjhmaU1UMVNnR09RUWtuUzhoK3FxV2psYmRJYjU0YTNoR3hzdktHSlE1NWhI?=
 =?utf-8?B?c3lJdkhzcGhDUU5ZSnk1SW5zMGRFbWU3eDJJNW1INHZoWGh1c21SM2FwTFFW?=
 =?utf-8?B?WTJscVV2ZThvZ2QvQVQ4aXJxTklWYXRIZHdQeFJYaHl6WVMvc0xBdGp3VUhu?=
 =?utf-8?B?T2xoT1FhbVZsd2RHRS9JQ0JMTXAwaVJvaUFBUXdZYi9WYnFhcmFEU1ZVakJi?=
 =?utf-8?B?WHI1b1d6cWVqVmZXVkhCYzMwWUhGUVdlU3RUb1BURWZFVEZUZWpoT3Bta2Vy?=
 =?utf-8?B?bVJkdlVTdk9BNmc4QlIzMVBSU0JuT3VLT3pZbUplc09vc0x4SXNKbzNHaFp5?=
 =?utf-8?B?UFJCQkhlcWE2a0NHd2RqcEt0TzhUUEUxTFhWSG56bWVpVERLT0tMK0VUR0Vr?=
 =?utf-8?B?bjlnSEl3eWNiUHJvWmV1ZlM3UG53SFUyc0ZPS1ZkSllTVU9VTnE4cTZuR09q?=
 =?utf-8?B?THpRL1N4ZEVET2pwRU8rMCtZdk1qSXJWcXBhLytOa2VpdzRrMjR5R3U4Y09u?=
 =?utf-8?B?VmhlK2Q5bjB0T1lMZWI2b2pmNkpJNS9CdW9ucGE3eDRhUGZWWERvWXBzcjBy?=
 =?utf-8?B?OStrQVQzRmFXTCtlQ09TVjVrNTVNd05BYThSNnhXQm85alBzQWk0RnFEa2p3?=
 =?utf-8?B?SVNjRE5TQjNVQ29Ub1I3c2dQVzBEd2dzOFJsOExDN0tTamswN1Z5NUVLSUpS?=
 =?utf-8?B?eDY3eld1Z1hIRlhYZE13UldWWTk3UitEZklMUHlUc3lzUDAzNi9jY1M2d2Nu?=
 =?utf-8?B?Q25PM0o4NmhZLzlUTU9nNTRWcDNUdDNjdWVGdXNSbVFWdlh6SWdhTjQ5T0JH?=
 =?utf-8?B?Z05INXFnUmNJUngwNUc2NERLS3Zpb2drY0VNak1TaHYyWTZzR1M0RlkvTHdt?=
 =?utf-8?B?bk1uUkZpeWFaVFNwM2swTzBRRlBIa0ZuWjM2QktmUEZOalNGQWZoVnFwMUVZ?=
 =?utf-8?B?VnRweVZxRW95R0ZYbll3NXF4RG1rRVFjKzBUYmxBUmxWOVNJZ3o5Z2FlcUlh?=
 =?utf-8?B?cjJ1YldrREhzWmhic1RFNFhPYjJoUEd6Y0V3YVN0Skx3dy9NSDJSZTJSN0Zi?=
 =?utf-8?B?dmVZM0w3Vi9jMzM4OXUrQXNNM1JTNlJjVWZyNkZydVJoczZIbW02N3ZjV1dO?=
 =?utf-8?B?Z3RjWldDa3dLYkhROGI0R0JqRjNFNzR5ZE1mcExDSThtVkFMK1R3bzJGeWhK?=
 =?utf-8?B?NzVsc1hodlJrWHIzTU10RTFOMkMvMGIyR2xnUmk0OE43cDl0dWpiUWhGUFYz?=
 =?utf-8?B?VnRCVm9haGdYb0h6b3NxRG9XeEloMFdhUWtSZ3pUS3dnZHpPSGV1V3VYcmlL?=
 =?utf-8?B?TmtpRWZOWFhxZG5GRVRwRzkzMWgwNEFKZCsyL1c4ZHRzcmtoZXZ0d3BESGw2?=
 =?utf-8?B?SllTYjJkbEZsek53czZMNk9ySVNBdStrRmhlSnFWUmNPK2NpTzRySHBacy9E?=
 =?utf-8?Q?uvEZt8qOxiI4R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF35CFB4DBF.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGF0NnRRbkdKVHMxNjhSZ0syM0NBNmMraktUT0kydjZCeU1Pb2Rob0FlRXp5?=
 =?utf-8?B?UU1MY0Z6ZFBIemx2cWxieFlRQ1NyUElPMWNGRjlqWlAveUdXY2lXMzJSYmdZ?=
 =?utf-8?B?NkIyNDJwUU5NdFZkVjZpR3YveEtVOTdrT3JLS2pELzNOWDFkWnlROTNvQVdQ?=
 =?utf-8?B?VFZ5NFp3ODI5d1BNRFdyVU1JTWI0ZWxTdGNGVUEwS1VPelhZTklzdmwva2NT?=
 =?utf-8?B?LzFTQnJlS1BrdnZzeFhpUWQxTHZteW90UlduN005aVBWOTVKQXd4YWpMK2h2?=
 =?utf-8?B?ekJXVkROdFJsTFRXcHZRUlhLcUpTTjhLTlF2NmJQWS8wSWxUQ2lVSDZVQU51?=
 =?utf-8?B?WU44VWloZElDVjZhTUZPUUFFZkZYMHdQeE4rZTdMdDNuUVB5ZkhsWmkybGEv?=
 =?utf-8?B?WFY5SUtlZVhlZEUvbkhVWUJKekNhM0x3SFg2clhtZVdTQlBaN0NSU1NILzIz?=
 =?utf-8?B?QnpIdG02MjV5bXFjTlc3aDNYMFBaUDdyMWpORFcxSTZIenFRdFpJV1FpTVlp?=
 =?utf-8?B?QVA0dWRGb3JkTTlTUFRCVk9oeEF4TWM5V0k4OVNhOEJMcWlOdmZHeFNnUEFF?=
 =?utf-8?B?anU5N1kxVDdhNUh3anpjZkpsYWlpNGNjbGlRRGNjbWlsTy8vbS9TbGFOTWRQ?=
 =?utf-8?B?TzVZSXhjbEIxTDYwclNBeG14Ym5PMDZhcHIxLzNCVHhwTGRIa3VzWEpxRVdZ?=
 =?utf-8?B?OU12TWw3ZE5yTCtMOTM4UWFFQi9Vd1VHWjNoUEZJbUtQOUZKY0pHTWFTNzFx?=
 =?utf-8?B?dDMyMXA4ckFXc1MxSGRlemIrRmpFQTFoNWxldHN2YWFDK3F4ZGNFZ1ZTVzdI?=
 =?utf-8?B?KzBrbFM2b1gxMXZXRGxGSFVENUduZzZTOWNXa3JNMHE2SzlIY1ZyaGg2dUpz?=
 =?utf-8?B?aWxHaVJPU2xXczlCNWptc3ExVFBFUWZXY214TzFJeURuNkVsQ0pCRG16TW1p?=
 =?utf-8?B?ZGo0d0Z0QU5jMXdWbFRUMDZDU2FDVFovSmJMeVd2MkhqdnVEMy9OUS93L1Yz?=
 =?utf-8?B?U2c4UngrbW83L1daejdRN2ZsdjdwOTRpVjdvVnpRRENJQ3VWNWRjRFc4TS9p?=
 =?utf-8?B?Um95SmREcW13dXBDRDNsbHBuaHFDekdCNndBSENQbGU4b0VvVDJseGx6Vmhh?=
 =?utf-8?B?ejBkakxTNVBCelJySFRDb3EzVnQ4NzI0NkY1UGxQMGJqVEttMXBtYTU4MXJY?=
 =?utf-8?B?QXg2WHhvR21IamdWOEVGcC9mbWhxRVlvblFLSUJVNjZIMlNKTUdXUlpNTVBT?=
 =?utf-8?B?cHFWVEZHeDJxcXJ0SHdOWDU3MmlJVVF0RVBpMjVJL0lDNElKYXU3ZW9EUWtS?=
 =?utf-8?B?VitVckxxalVmTUFzdWtCSFNMZ3Fsd1pKOFoyMXMrdERmMEprZHVscEN2cWRw?=
 =?utf-8?B?d0hUeGxZcysxWmNXMnB0TGtDZEdhdHUrZWMrNkZ2UEVMNzRmamJDTzhBVjg3?=
 =?utf-8?B?NFd5a1VYeW9meDBlbWpPZ1hCM0pFM0g1SkNiNG5OdnN4am8vY0wrRXQ4UmtJ?=
 =?utf-8?B?R3JteWlMNXRkSk5lZHlhdHY1d3pmamRqQ0hGWVF2WEZ2a0g3NHZ0cG14R0R6?=
 =?utf-8?B?ZE1Ra09HZCsvT1pmcUF1YzVmSHdDMmxHbFF6SnU5SkZtMzN6OVdqS05VZFRM?=
 =?utf-8?B?aUcwN3JPdW1WVXJXNWNyeUxCWG8xT3d0NnZhbXI5NzRDY2lwUFV1S1c2WmFC?=
 =?utf-8?B?T2s2cVY4MkI3bzV6S09QZ2p0dlNQNUtMN3o3MnVKU292ZFg5bHJ6TzRkYyta?=
 =?utf-8?B?TXo0dzR2K2FqamZ3d2xLMmZFNW1PL0hISlhta0pVQm1kT1NQc3JkbGJ5Wlox?=
 =?utf-8?B?R1NkN2JwREcxbTRQMWhhNjVhL1lGV25lUE8xUEE1UEhlalJ3aXpXUU1xdUNm?=
 =?utf-8?B?SWpMQU1wbHlBbUtXT2tSK1E3RUZYRWtHckl0NVlKdXQyZGJCQUpMcHEzSTRI?=
 =?utf-8?B?eFBRdXQxSFh3bURMR2hYZFBlbzlsUStqTThtS1VHemRXRjZhM29sYVNMcy8w?=
 =?utf-8?B?NjNGTm51UEhvdEp4NVk5UU1ZLzlvL1hYb2UxRXIxbCtTZjhhdVNyV3AvMzRU?=
 =?utf-8?B?MGZpYjVKdzkwZnI1cGRXMEt6T3NvRldrY3dTcUVLSFJCN2trc24zMjdKUjZw?=
 =?utf-8?B?UXFESFV5YXZjTFNQb0MyaFp6eGdNcVY2dHJIR1JKb1RFRkdyeFdCOXJPczdP?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IigI5RJjJabbfXS7jrx4KxiKEKbDqrelo+L3I4hN70YF/b7qugWWcQ2pxCHvrsUpMwcRqaLFm/Y0MXqn5F57jyKWy7cj6Ei1vT2+ywDSpm420YNB0S2joEZmniIpTlPFv9hgifWrOmqGvFkNvrXIBOOUxVzNwJWaztF5xTqzwyPwrZ8T3GsiFqiVFW5Cj6rhCjOoHrN6xduDKgeEpg7HAqbyFukM3DXyc5tlfL4zcrkok9wuNJnTG17rLnNphv+FYEoKQJsfC9PKAgjkM0TkRrwD5nzGY4fps+v5JWxka/Q6Mu9kshUo9gcFvBraUKRwgSHbODAgl+QrycX1DNDpGqtIlagZp5I/ZCZw5S+GlX+SCZ40PMD6831cqvfuNk8kDvf82YlGJA4//t2tgiS4lVrp7+M16L97GHHCqNJPCirBlLPXdF6yI4/lBPBgD+GqBEnThQt7wFXjmh7zjmrSqBDZcXZVEOjSvZksKd96zUuIBqn276aLYxo5kCNQw7e0pdrt70IvQzZGxqPLRrXLgmoS3SxbFhxTKpsw2YjwOBczOuFoLm+XdsR66xXu1vyR9azw8Gmw7PikSCXQVu26KW348esd+R9eGqE3TIAX6Bw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf42787-5b83-4fed-0052-08ddf6bc8e26
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF35CFB4DBF.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:06:26.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TIZYTFLA+gHg47VMuVS5+yjvECQKOPaH2pzBMTsdX7YI3lUBBxIYSGGXLvDbFyRXgogUgLiCoBfqekozwvH4FtbsNeIRur64Itazn9OSoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4807
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509180129
X-Proofpoint-ORIG-GUID: 5m9EVsLSVcTj5_ppcFAlrZQ312qyToTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0pdgNcBbjPZ4
 M8wPLooYlzcFsWjDZQjhvWc1TwR270+536bGtlppt2LLW2KdLwL4O6m26in71x28yuXKFS4U+4k
 iYDEyvC5n0utFP5KHbpYBIca8K8286p+63nFwTYgh+VlFIhtfzPQfGg1Tc/lDJ1zHolsQ0s+mXZ
 7Fq1yRJg00xmaHUQC3vj63c+GGD4W4eZsmSuc1jVMAC1gvlE0ydJktLIJ4EyS/X6THAOOGIMQFW
 Z/RQjrQ/mMkg/R5AJIehlTlIRtolIRygkPBaohKgGia1JZfaU5Zgq1V8SEeAYRoRg1XIDjTSiJN
 qrGgjtwUvhqCjTdVTinX3b2pXPtiOxe8rHscVNUGJjj4nSO/2dSccipBASxG45P9Kzol05VFTht
 5UwO1pjoQgGKnMdtP0mj0QE3UauShQ==
X-Proofpoint-GUID: 5m9EVsLSVcTj5_ppcFAlrZQ312qyToTt
X-Authority-Analysis: v=2.4 cv=C7vpyRP+ c=1 sm=1 tr=0 ts=68cc11e7 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=piRyk3YmtN996NnmDkEA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:12083

On 9/18/25 5:25AM, kernel test robot wrote:
> tree:   https://github.com/kleikamp/linux-shaggy jfs-next
> head:   c87ed72ff7cfd52843fef97be14567e2d377f584
> commit: 79e48b88ffd89a4446f407680ab4e7e5679a04e8 [1/5] jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant
> config: arm-randconfig-001-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181832.frk03WjF-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181832.frk03WjF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509181832.frk03WjF-lkp@intel.com/

Zheng,

This is my bad. I had trouble applying your patch, so I made the changes 
manually and used > instead of >=. I'll fix the patch and re-push it.

Shaggy

> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/jfs/jfs_dtree.c:2906:31: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
>      2906 |                         if (stbl[i] < 0 || stbl[i] > DTPAGEMAXSLOT) {
>           |                                            ~~~~~~~ ^ ~~~~~~~~~~~~~
>     fs/jfs/jfs_dtree.c:3111:30: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
>      3111 |                 if (stbl[0] < 0 || stbl[0] > DTPAGEMAXSLOT) {
>           |                                    ~~~~~~~ ^ ~~~~~~~~~~~~~
>     2 warnings generated.
> 
> 
> vim +2906 fs/jfs/jfs_dtree.c
> 
>    2702	
>    2703	/*
>    2704	 *	jfs_readdir()
>    2705	 *
>    2706	 * function: read directory entries sequentially
>    2707	 *	from the specified entry offset
>    2708	 *
>    2709	 * parameter:
>    2710	 *
>    2711	 * return: offset = (pn, index) of start entry
>    2712	 *	of next jfs_readdir()/dtRead()
>    2713	 */
>    2714	int jfs_readdir(struct file *file, struct dir_context *ctx)
>    2715	{
>    2716		struct inode *ip = file_inode(file);
>    2717		struct nls_table *codepage = JFS_SBI(ip->i_sb)->nls_tab;
>    2718		int rc = 0;
>    2719		loff_t dtpos;	/* legacy OS/2 style position */
>    2720		struct dtoffset {
>    2721			s16 pn;
>    2722			s16 index;
>    2723			s32 unused;
>    2724		} *dtoffset = (struct dtoffset *) &dtpos;
>    2725		s64 bn;
>    2726		struct metapage *mp;
>    2727		dtpage_t *p;
>    2728		int index;
>    2729		s8 *stbl;
>    2730		struct btstack btstack;
>    2731		int i, next;
>    2732		struct ldtentry *d;
>    2733		struct dtslot *t;
>    2734		int d_namleft, len, outlen;
>    2735		unsigned long dirent_buf;
>    2736		char *name_ptr;
>    2737		u32 dir_index;
>    2738		int do_index = 0;
>    2739		uint loop_count = 0;
>    2740		struct jfs_dirent *jfs_dirent;
>    2741		int jfs_dirents;
>    2742		int overflow, fix_page, page_fixed = 0;
>    2743		static int unique_pos = 2;	/* If we can't fix broken index */
>    2744	
>    2745		if (ctx->pos == DIREND)
>    2746			return 0;
>    2747	
>    2748		if (DO_INDEX(ip)) {
>    2749			/*
>    2750			 * persistent index is stored in directory entries.
>    2751			 * Special cases:	 0 = .
>    2752			 *			 1 = ..
>    2753			 *			-1 = End of directory
>    2754			 */
>    2755			do_index = 1;
>    2756	
>    2757			dir_index = (u32) ctx->pos;
>    2758	
>    2759			/*
>    2760			 * NFSv4 reserves cookies 1 and 2 for . and .. so the value
>    2761			 * we return to the vfs is one greater than the one we use
>    2762			 * internally.
>    2763			 */
>    2764			if (dir_index)
>    2765				dir_index--;
>    2766	
>    2767			if (dir_index > 1) {
>    2768				struct dir_table_slot dirtab_slot;
>    2769	
>    2770				if (dtEmpty(ip) ||
>    2771				    (dir_index >= JFS_IP(ip)->next_index)) {
>    2772					/* Stale position.  Directory has shrunk */
>    2773					ctx->pos = DIREND;
>    2774					return 0;
>    2775				}
>    2776			      repeat:
>    2777				rc = read_index(ip, dir_index, &dirtab_slot);
>    2778				if (rc) {
>    2779					ctx->pos = DIREND;
>    2780					return rc;
>    2781				}
>    2782				if (dirtab_slot.flag == DIR_INDEX_FREE) {
>    2783					if (loop_count++ > JFS_IP(ip)->next_index) {
>    2784						jfs_err("jfs_readdir detected infinite loop!");
>    2785						ctx->pos = DIREND;
>    2786						return 0;
>    2787					}
>    2788					dir_index = le32_to_cpu(dirtab_slot.addr2);
>    2789					if (dir_index == -1) {
>    2790						ctx->pos = DIREND;
>    2791						return 0;
>    2792					}
>    2793					goto repeat;
>    2794				}
>    2795				bn = addressDTS(&dirtab_slot);
>    2796				index = dirtab_slot.slot;
>    2797				DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>    2798				if (rc) {
>    2799					ctx->pos = DIREND;
>    2800					return 0;
>    2801				}
>    2802				if (p->header.flag & BT_INTERNAL) {
>    2803					jfs_err("jfs_readdir: bad index table");
>    2804					DT_PUTPAGE(mp);
>    2805					ctx->pos = DIREND;
>    2806					return 0;
>    2807				}
>    2808			} else {
>    2809				if (dir_index == 0) {
>    2810					/*
>    2811					 * self "."
>    2812					 */
>    2813					ctx->pos = 1;
>    2814					if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
>    2815						return 0;
>    2816				}
>    2817				/*
>    2818				 * parent ".."
>    2819				 */
>    2820				ctx->pos = 2;
>    2821				if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
>    2822					return 0;
>    2823	
>    2824				/*
>    2825				 * Find first entry of left-most leaf
>    2826				 */
>    2827				if (dtEmpty(ip)) {
>    2828					ctx->pos = DIREND;
>    2829					return 0;
>    2830				}
>    2831	
>    2832				if ((rc = dtReadFirst(ip, &btstack)))
>    2833					return rc;
>    2834	
>    2835				DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
>    2836			}
>    2837		} else {
>    2838			/*
>    2839			 * Legacy filesystem - OS/2 & Linux JFS < 0.3.6
>    2840			 *
>    2841			 * pn = 0; index = 1:	First entry "."
>    2842			 * pn = 0; index = 2:	Second entry ".."
>    2843			 * pn > 0:		Real entries, pn=1 -> leftmost page
>    2844			 * pn = index = -1:	No more entries
>    2845			 */
>    2846			dtpos = ctx->pos;
>    2847			if (dtpos < 2) {
>    2848				/* build "." entry */
>    2849				ctx->pos = 1;
>    2850				if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
>    2851					return 0;
>    2852				dtoffset->index = 2;
>    2853				ctx->pos = dtpos;
>    2854			}
>    2855	
>    2856			if (dtoffset->pn == 0) {
>    2857				if (dtoffset->index == 2) {
>    2858					/* build ".." entry */
>    2859					if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
>    2860						return 0;
>    2861				} else {
>    2862					jfs_err("jfs_readdir called with invalid offset!");
>    2863				}
>    2864				dtoffset->pn = 1;
>    2865				dtoffset->index = 0;
>    2866				ctx->pos = dtpos;
>    2867			}
>    2868	
>    2869			if (dtEmpty(ip)) {
>    2870				ctx->pos = DIREND;
>    2871				return 0;
>    2872			}
>    2873	
>    2874			if ((rc = dtReadNext(ip, &ctx->pos, &btstack))) {
>    2875				jfs_err("jfs_readdir: unexpected rc = %d from dtReadNext",
>    2876					rc);
>    2877				ctx->pos = DIREND;
>    2878				return 0;
>    2879			}
>    2880			/* get start leaf page and index */
>    2881			DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
>    2882	
>    2883			/* offset beyond directory eof ? */
>    2884			if (bn < 0) {
>    2885				ctx->pos = DIREND;
>    2886				return 0;
>    2887			}
>    2888		}
>    2889	
>    2890		dirent_buf = __get_free_page(GFP_KERNEL);
>    2891		if (dirent_buf == 0) {
>    2892			DT_PUTPAGE(mp);
>    2893			jfs_warn("jfs_readdir: __get_free_page failed!");
>    2894			ctx->pos = DIREND;
>    2895			return -ENOMEM;
>    2896		}
>    2897	
>    2898		while (1) {
>    2899			jfs_dirent = (struct jfs_dirent *) dirent_buf;
>    2900			jfs_dirents = 0;
>    2901			overflow = fix_page = 0;
>    2902	
>    2903			stbl = DT_GETSTBL(p);
>    2904	
>    2905			for (i = index; i < p->header.nextindex; i++) {
>> 2906				if (stbl[i] < 0 || stbl[i] > DTPAGEMAXSLOT) {
>    2907					jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
>    2908						i, stbl[i], (long)ip->i_ino, (long long)bn);
>    2909					free_page(dirent_buf);
>    2910					DT_PUTPAGE(mp);
>    2911					return -EIO;
>    2912				}
>    2913	
>    2914				d = (struct ldtentry *) & p->slot[stbl[i]];
>    2915	
>    2916				if (((long) jfs_dirent + d->namlen + 1) >
>    2917				    (dirent_buf + PAGE_SIZE)) {
>    2918					/* DBCS codepages could overrun dirent_buf */
>    2919					index = i;
>    2920					overflow = 1;
>    2921					break;
>    2922				}
>    2923	
>    2924				d_namleft = d->namlen;
>    2925				name_ptr = jfs_dirent->name;
>    2926				jfs_dirent->ino = le32_to_cpu(d->inumber);
>    2927	
>    2928				if (do_index) {
>    2929					len = min(d_namleft, DTLHDRDATALEN);
>    2930					jfs_dirent->position = le32_to_cpu(d->index);
>    2931					/*
>    2932					 * d->index should always be valid, but it
>    2933					 * isn't.  fsck.jfs doesn't create the
>    2934					 * directory index for the lost+found
>    2935					 * directory.  Rather than let it go,
>    2936					 * we can try to fix it.
>    2937					 */
>    2938					if ((jfs_dirent->position < 2) ||
>    2939					    (jfs_dirent->position >=
>    2940					     JFS_IP(ip)->next_index)) {
>    2941						if (!page_fixed && !isReadOnly(ip)) {
>    2942							fix_page = 1;
>    2943							/*
>    2944							 * setting overflow and setting
>    2945							 * index to i will cause the
>    2946							 * same page to be processed
>    2947							 * again starting here
>    2948							 */
>    2949							overflow = 1;
>    2950							index = i;
>    2951							break;
>    2952						}
>    2953						jfs_dirent->position = unique_pos++;
>    2954					}
>    2955					/*
>    2956					 * We add 1 to the index because we may
>    2957					 * use a value of 2 internally, and NFSv4
>    2958					 * doesn't like that.
>    2959					 */
>    2960					jfs_dirent->position++;
>    2961				} else {
>    2962					jfs_dirent->position = dtpos;
>    2963					len = min(d_namleft, DTLHDRDATALEN_LEGACY);
>    2964				}
>    2965	
>    2966				/* copy the name of head/only segment */
>    2967				outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
>    2968							   codepage);
>    2969				jfs_dirent->name_len = outlen;
>    2970	
>    2971				/* copy name in the additional segment(s) */
>    2972				next = d->next;
>    2973				while (next >= 0) {
>    2974					t = (struct dtslot *) & p->slot[next];
>    2975					name_ptr += outlen;
>    2976					d_namleft -= len;
>    2977					/* Sanity Check */
>    2978					if (d_namleft == 0) {
>    2979						jfs_error(ip->i_sb,
>    2980							  "JFS:Dtree error: ino = %ld, bn=%lld, index = %d\n",
>    2981							  (long)ip->i_ino,
>    2982							  (long long)bn,
>    2983							  i);
>    2984						goto skip_one;
>    2985					}
>    2986					len = min(d_namleft, DTSLOTDATALEN);
>    2987					outlen = jfs_strfromUCS_le(name_ptr, t->name,
>    2988								   len, codepage);
>    2989					jfs_dirent->name_len += outlen;
>    2990	
>    2991					next = t->next;
>    2992				}
>    2993	
>    2994				jfs_dirents++;
>    2995				jfs_dirent = next_jfs_dirent(jfs_dirent);
>    2996	skip_one:
>    2997				if (!do_index)
>    2998					dtoffset->index++;
>    2999			}
>    3000	
>    3001			if (!overflow) {
>    3002				/* Point to next leaf page */
>    3003				if (p->header.flag & BT_ROOT)
>    3004					bn = 0;
>    3005				else {
>    3006					bn = le64_to_cpu(p->header.next);
>    3007					index = 0;
>    3008					/* update offset (pn:index) for new page */
>    3009					if (!do_index) {
>    3010						dtoffset->pn++;
>    3011						dtoffset->index = 0;
>    3012					}
>    3013				}
>    3014				page_fixed = 0;
>    3015			}
>    3016	
>    3017			/* unpin previous leaf page */
>    3018			DT_PUTPAGE(mp);
>    3019	
>    3020			jfs_dirent = (struct jfs_dirent *) dirent_buf;
>    3021			while (jfs_dirents--) {
>    3022				ctx->pos = jfs_dirent->position;
>    3023				if (!dir_emit(ctx, jfs_dirent->name,
>    3024					    jfs_dirent->name_len,
>    3025					    jfs_dirent->ino, DT_UNKNOWN))
>    3026					goto out;
>    3027				jfs_dirent = next_jfs_dirent(jfs_dirent);
>    3028			}
>    3029	
>    3030			if (fix_page) {
>    3031				if ((rc = add_missing_indices(ip, bn)))
>    3032					goto out;
>    3033				page_fixed = 1;
>    3034			}
>    3035	
>    3036			if (!overflow && (bn == 0)) {
>    3037				ctx->pos = DIREND;
>    3038				break;
>    3039			}
>    3040	
>    3041			DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
>    3042			if (rc) {
>    3043				free_page(dirent_buf);
>    3044				return rc;
>    3045			}
>    3046		}
>    3047	
>    3048	      out:
>    3049		free_page(dirent_buf);
>    3050	
>    3051		return rc;
>    3052	}
>    3053	
> 

