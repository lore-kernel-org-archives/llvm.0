Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2831690A;
	Mon, 17 Nov 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365057; cv=fail; b=rXDKD6ULnv3spk9+Tc+Z7Ny6k3vMiWGKf9pHNv32dsvR8OepnyFtklSjFJy/0DZy421f3+twoWsipONbJZsNamepZmFCDbf1myBLL5sUoSGNtnzZpuC+TrQ4ZpHGRW80ezB3V+o3qF9Jcpnv+ApcqgChZHkQjjipcGZoe2bp004=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365057; c=relaxed/simple;
	bh=Avnj/cInWJKgYbOgxGJNRwZ6I5zI4SNeF886C0vgj1k=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KE7Hk09pEI/JCa+HyXvSghNHMs4eBmQBw8FdBsjcWvI8BLoGMPZkWrZl0u2GkaoJWgaqyujawLUTsudAQgbObYW6lPJsZl4B29qPLuCy2HSoj4eWhJUynEuzUmcWvGIprOoA0WWGYteR0Ssw+dJ3INZlqZytk7vFOTfqs4Ln5Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pnRl7Jh0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fykq3EWV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pnRl7Jh0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fykq3EWV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH1wKrf011622;
	Mon, 17 Nov 2025 07:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LpSp3b9jh0rgC6pv8xWgGzup222pD80EHqL03ZOrlJE=; b=
	pnRl7Jh0Wu0FtUIkWM6Bc0OKp96dJjRO4Q3Qeb9YrTHFrlxPsWGMNVzMD/v0ckke
	ovUdCmVuleGkxse/jqHHXYdmYSHgLThFDdK9/B+6Q/N1KRaP/bFCXbQKgLOUoDQO
	1TDO92fNk9mSgQIyONKm4guYrEGpk3MbGvfxSt2kzPg6PG793dgAvLf1QRCxHujk
	jPcaCUmW0GnaMf9zoA7oJsnYSNzeoxVy/7Fk5zeZ2pIVe9LtjWWKupDswZW9u5Lz
	6XHWdwMYYj5zq9nTA8bCOmLZTCt+VfqY17y68qCjQCznZzldANLlzjl4F8x+r+Lf
	BVxEBHui3CSQ0VbFEz0tXw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbb9xk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 07:37:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH6U7cK004512;
	Mon, 17 Nov 2025 07:37:19 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy72bnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 07:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv/YQgIyU6310uR0wVWDp8SQmsFAgR5rvS3eaGCqmK2aXIxcWAaPZ4RXcwtNyTiIzSJfzzg/EQvgdHCdZrHYw5k5N802Z3AQHiFegYKmvumaIWIezJtmAzu424tX9sXKXfYghcOHMI+nSisYespCXPMmwl5FCfnxZ7CWJ1tBK9uEL3kipjYlnemAepMgJTf57wLwCwBqI+3XaQK11LotcmWfVVnCBIhhAIRrw1RM+uCnbH1WVcNNMSbLW52SOs/ngE0lYt9qmu/aNEdfGGFmgkt9GchUzzU0aTWV0oYYr4uoC0ZhIE3eduWP8LJpDxjV1aDlXeA1KWgxiq8Nxvhc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpSp3b9jh0rgC6pv8xWgGzup222pD80EHqL03ZOrlJE=;
 b=W6zuCIb143Cm+osEmAzVyw6aPiYnH3pOdtYaWdPz4qOkn2a+naVM6GbJt+IUpUy2atSHpjX2oRzxAXfpcQoiqZoXHZxBsn77VyoWB1rFuUgeoDKnrHtZQwAYOTQWF4vMZJOwPXFgQU2IABqCcvfoOdNwqEi+WTDKIsfwwcOpvlyJ5Q0qezCVOeGIpZhABiMylmx3uwl4J5OQmMr5RdMX8PyVknopWqBDNIHX2nTzQI3JzxH3IZtOLYX/tp7xDVPXneadR9H1HJuglt2gI+OTki4GFWOJ9wLCDzwunpt6P23/4mYrpjVW2eUuG2KSQcC7LZB4gq4Bi6xr4UW95H9Jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpSp3b9jh0rgC6pv8xWgGzup222pD80EHqL03ZOrlJE=;
 b=fykq3EWVdUUGF3ERN5oZYSGIdb+TXBaKEtB8YBO1rkA9gRL3zSy5kUwnb5RcUfAdSwlnakynPRXEfs6PtlKQr8MbXTIMowq+P082L2gGme4px3/oifk4+sPG6VGhKu9kddz1iR2LKYQL3uBD/ZVV+AdSk/LZU6A4wRWZrPIzU3o=
Received: from SJ0PR10MB5630.namprd10.prod.outlook.com (2603:10b6:a03:3d2::18)
 by MW5PR10MB5715.namprd10.prod.outlook.com (2603:10b6:303:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:37:16 +0000
Received: from SJ0PR10MB5630.namprd10.prod.outlook.com
 ([fe80::5d5d:b4cd:59c5:196]) by SJ0PR10MB5630.namprd10.prod.outlook.com
 ([fe80::5d5d:b4cd:59c5:196%7]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 07:37:16 +0000
Message-ID: <1b3ddd16-51b8-4b59-84ec-4740c50f3533@oracle.com>
Date: Mon, 17 Nov 2025 08:37:12 +0100
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops
 call
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        mingo@kernel.org, jpoimboe@kernel.org, peterz@infradead.org
References: <aRfYicXA4R3Gb04i@rli9-mobl>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <aRfYicXA4R3Gb04i@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0535.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::26) To SJ0PR10MB5630.namprd10.prod.outlook.com
 (2603:10b6:a03:3d2::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5630:EE_|MW5PR10MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: e5558b57-6623-4636-bf74-08de25ac21b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REMvdFJYOVRXM21hVXE4UnJGZFRjOHJmT1RvM3RZczM3L0JZWExiaTV4Vitk?=
 =?utf-8?B?WWp1M2ZFYUszQWNNOEU1MHlGTDhDSjMxMGwxRTJ3bjN6SWJVcGQyQ3lmUVAv?=
 =?utf-8?B?cnl1RHora1VGVGFLc3ZaU2lpTWh5VGxmNnVhRCtpZWFoelkxQk5rVDZPM0FP?=
 =?utf-8?B?ZVNOSmNsZ1hvWWxsYTIzanFNVjcwVG4yNUN1UGt5cGVtdC8xOVBoWFp0anR1?=
 =?utf-8?B?eUQweS9ob0JRemV5NUtTK0N2QXc0TnJpYm9sRGI3NG1GKzF4SjNMMWZhcDBm?=
 =?utf-8?B?KzlETStrcndkQ2hzVnpTRFF6cDdVdXNDcUticlNxMlBSbmUvd1E4cU9Zc3dX?=
 =?utf-8?B?QU0wZHVpd2N4RFhIb2Nsd3prK3NVSElNaHZybmpkaGF4QWgzMm41OEFLaE8z?=
 =?utf-8?B?Ump4akxrU3paaHdsMUtzZXZTeHRhUE9yb0hnSGRnelNSdzdaTzRMVmxvYjM5?=
 =?utf-8?B?U2syQWFhdldWQnFBOE5UcjVjdzdJazdocjdhdmRCdmY0c21EMW9KTjYvMkU0?=
 =?utf-8?B?SlJXYUhkM1lGQk1TZ3hDbUQ1VEtOMzZPZXB0Vk9FS0g0eHgvT05KWnQ0NEVq?=
 =?utf-8?B?SmN2L0NXbVNoenV5aW1uZ1VwOWhTSWQyOHl2NFMwV2VGWXBxdGNhR1EydWpS?=
 =?utf-8?B?S2Q4ckJsS1B5REptT1NpQllRYzRSLzc0RkdMOXFOV1owR21FL2dLYzZGZk5a?=
 =?utf-8?B?K00yMGlQTC9iWnNOTEk0SWM5elNseTFuTldraXErd3NXT09BNUZWdkp5bzJF?=
 =?utf-8?B?YjJiODFQbHRuci9pSGRaaTBLU1l1YjZnVXJIZWtTVjFmRmZTZFNablJOZVJP?=
 =?utf-8?B?Q0c3RjhqejhUbFZCYlczSWtnWldQekpGN1lCMUVGOTNQdk0zS25UcVBoSW5J?=
 =?utf-8?B?UEFLM0tVWjdkVDB0V0pSL3VMWGpqYUM5RENJTVJld0V6blg2c3M5RUFlc21j?=
 =?utf-8?B?aW9BQloreTRwNEFjQ1pUWXRyUi8yd0lFQnkrZERFTjg4QWl0UUdlekZBanFN?=
 =?utf-8?B?S3huWnRWRmp2TVpITXNIUFJBVkhUNGNrdFNWanlTcjExTkZEaVRlUE1QSWU3?=
 =?utf-8?B?K3dBNkJhTGQwUmJIcE8rRzlnNjNnQ2tUcDM3YmVOb09oUFNuZUtla3VYNEhQ?=
 =?utf-8?B?R2lLcXlMZ29sTDR0UTRWVWtJUjJweFNVY0dLOThMVW1zZGF2b0hLM0RPZ0dO?=
 =?utf-8?B?RDh2K2s1WDRnS0pXUUdKRnM4OXg2c3FhSmJvWDkzejRrSlZ5WTZ2SWwzOC9M?=
 =?utf-8?B?Q213Rm5ZYVJZejZOenloelo3S3g2eFg0OXRMditGUDZoRW5vd0dYN0FlbVI0?=
 =?utf-8?B?VmRWOFZJN2ZNeHNtYmlPczJjaWt1UHpxd21zc2h6VWlpWUpOb2JTU3Y0ZHdJ?=
 =?utf-8?B?ZDRUQ1l3SWlIRHZwbTFua2Z2eXYwN0dxYU1QTFdOZVJwK2R1ZkRGMTUxVDlX?=
 =?utf-8?B?cmhjZ0JVVVV1Q3VTRDFVcFAyRjVUdGkrbEVkMVh6UEM1ZFFRdHk5NmZuQUdy?=
 =?utf-8?B?cmR1aWhkYzhNV1BPd3B3RjN3V3A2N0VaU2lzQ0pEQUJVU1BjNDZGNGdJNTR4?=
 =?utf-8?B?bnE4VHpwejFVZWJvcFhaeUpvRzF0YnVvS2xVZktFdmN4SEdOU3RuaEtiazNs?=
 =?utf-8?B?RkJ6NW9wcEJQYUkrbCtjbVRNL21aa24wcVNYS0ZVWnA1WWhMUDMzWFVhU2lK?=
 =?utf-8?B?OUFpZHNBc1Rpd0NKazR2ZC9qbExINyticUFreW9xT0g1K29MdFJaRjRGbGdm?=
 =?utf-8?B?NmpPMVd5T0NqWTVqVlFqNlA3ejRSQ3Y3b1ZVdUwrNENUcmxFZkJNNEd4VVZJ?=
 =?utf-8?B?T2puajZzb0tTSTFnTThRN2RnN2pTZjhMYXBEZnZKRnhYbitwK0QwdU5YY2Zo?=
 =?utf-8?B?S1VGUlFuNlJwWHlhLy8xbTN1RDFNYmRWR3lkcjRCbFptbld3RVZwNHFnWHBw?=
 =?utf-8?B?S2ZJaWlzZnBsYnJRbHByK0Q5WXBFdkRyTWtVQUVYTUgzc3hSOUwwdElTcm0y?=
 =?utf-8?B?YVMvdkIzNFFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5630.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTZXRS9md1RubkIwRW8xOSt1dUJmT3ZGNlVDRlFJQUtXMmZHUkkyTGg4QTQ0?=
 =?utf-8?B?OENhalZwUlR6YmcveWRJLzlEdXhtMzM2QW1RV2wzWkVTa0E4N0JRb2xwQW5L?=
 =?utf-8?B?cjlkYkJ6c09Db01ObitGLyt5ZWFuWENMZW1EbVAxRDZLS2lPcG00ZmNTS0s4?=
 =?utf-8?B?SGNjQkl0WC83YmtlU041ejJIcE1DRHQ4OGo0VlR0NW1MZm1kSDZjd0tEYlF5?=
 =?utf-8?B?cldtbFpPUkhWaFp5T0hmNndVNHYrV1ZCTU1WUFU3QWNBYmN0ME56T2ZpUG5q?=
 =?utf-8?B?T0RPRWplcTNoZ1h6RFFDTHErK0tabWN4Qjg3aXV0UERDaEtoSWs0dzZ5SG5D?=
 =?utf-8?B?N2ppSHRHNnI1UnZDRVE5c1VVdmtCSHdvL1Y1YWttQWNaamxnekdoRlpnd3FX?=
 =?utf-8?B?ZlhkdmNCY3JnWUQ0UVd3SGpHNy92TnRWZjZzb1VVU0FqK29hWXhNaWV6Q3pV?=
 =?utf-8?B?Z3FtSmszUExnWmlKRUlyOThETFV4SFhUcm9JRFFjcXA4Vko3YXJHSkZhcElI?=
 =?utf-8?B?R2FwTVdhSTY0VlkyWGJ5ZGdCOHZveDJ5MXpSaS9OUGVPKzY3RDk5VTgvYjQy?=
 =?utf-8?B?WFdYTnRKdS8xYmFObVRzVFhDS1FnTE8rWTJnREI1cjloc3ZMQmFDeHVNeEVi?=
 =?utf-8?B?Zk1Fc1RZYzlJdXV3R2VRZXU2YWhwVDhycGUzbjVoaEN6VmtFaGRoL3oxZ1BE?=
 =?utf-8?B?SmJCT1lSZEdmUkZXdjRnUUdoRG80VWVVSVdUNkZEeU5oWmE4a3dlUmpEci84?=
 =?utf-8?B?aEhTU25NYjFTUmx2cXFoMjI0aFdlMWRkYWFybHhVdU9CdDFhc2c3MnByOUtE?=
 =?utf-8?B?RFViMmF5VUdxZkJybWtsSWFtYWg1T1V4cDRuYm5Fc3JKblk2Z2FZVEJLSnJK?=
 =?utf-8?B?N1M2bXdta0R3YnFhUXg2SnlvcktqbDhqMzVBbmtCT2tVTlhGNUhCOVdIL0VI?=
 =?utf-8?B?dmIrRDEyckFpZWtwSUFXM05PZTZha0ZvN1JvNXJQL25TTDg0MktqdjROcW9S?=
 =?utf-8?B?NS9BZTlRVDhVeklob1FjT2tmdjBpMERSellaQjc4c2NNMzhub214S2pVYURK?=
 =?utf-8?B?SWIweEtTbFlnL3hqMlk4aU9aTnhHUVh6Q3pWdEJzdHJHZkxlQU83bXc4b1Np?=
 =?utf-8?B?U3k0ZUFMekZjbFJiaFRHa0VDNmk3U2piQ3VxY1ZzM2d0blBLMXpFYTE2TDMz?=
 =?utf-8?B?eE4zcm9UQW9UemsycGpGT2FCL0Q0MUlYSzM4VUxnUncrZDgvTjE3SGhubzlI?=
 =?utf-8?B?V05WWE5lMlVlaWY1OW4yN1dlZGF2aTl0YmEyb1FKNDY1WEVWUHV1YmhqQjlV?=
 =?utf-8?B?ZGxCYnJSbUlFMTI3RVU2aUZZT0tMZXdBa2hXa21DbXZ6RDFuRHNTQnpaY25F?=
 =?utf-8?B?ME4reHlYSGVPS3NtRVhzZ055bFZRRkMyeGpkVlBpbVdXZFNvY2FUT2dTSlVx?=
 =?utf-8?B?aDM1K2lPMWo1UUIrSjNVRmlqSzVxTi9jNS9tMnlQNUVMZG16eUNEVFcrVXJN?=
 =?utf-8?B?ajZyVlhPMFZsanRZYjNhR2Zxdk90VXZaNzNIaGVJWmVSVTJLWHlNcnd3bDYv?=
 =?utf-8?B?NndINUNHMmJiZXVqQmRnMUg0UjVzOVRYSDZCa1Y1SFh6N01vWnZiVE5iQVpW?=
 =?utf-8?B?TFlCNTBCdzFuS292b01VUzZabUpuM0RaR1c5MXJ3UGFCaDdFZUtEZVJ6WDBS?=
 =?utf-8?B?OU5ua3pEa3AvQUZRYVpvenkzNk52cWRkSlRFNW1NZEVQM0hSVWt3azhMbWls?=
 =?utf-8?B?THVMZDBRRExGcW1mc1RUL0RQQnJNNVZENUZ0YVA1QmV5dU1Sdkp0WDN0dXdu?=
 =?utf-8?B?dkM4S09kT3RoUGJtQWNTbHB5U3daYU03aGptdkVBSmpac3VDTkJGVkwxWEdZ?=
 =?utf-8?B?cW5YWVpHTG9wUkFXRkFzZGVrL1FKSDlyMHVWSTF6MmZuQUxXNGltZUtLSFpO?=
 =?utf-8?B?Nm5KOXJVTG1IWjNab0RBc1hvd0JJaVlITXhON3FYWERUWm13MjlhdlFHSzB0?=
 =?utf-8?B?M3RTU1RCZnBoUTQwNXpJMjBEQjlSUGs2SjI3R2ZXUGJ3Uzh1WEtINUluU3ht?=
 =?utf-8?B?OWdhQzBCN1lhb1FxYzh6MUphL0VSdHBtenpmZ05MQUh0RDIzQlBONzlaUTFt?=
 =?utf-8?B?WEhiL2FCdjRNcjlnWG1YU2w2VFVnV0xyZDBWcVI2V2w4KzZQdVBsNzVHSDNv?=
 =?utf-8?B?NFU3V1RoZ1ZycjdVOUtGc1V3Rjd4aXlQWVYybmVYek1wcXZ3WTE4bUxZSmFV?=
 =?utf-8?Q?BPI7JqtmvQ6ZSW9ezbXE/TKH9no9Kw8uc8fY1OXOWo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1XgtYvPUYUiYcg0RGInAdJTN52s9LnC/jzxvDBJ79363Bm8IpirJP7laJzfF9XwmesShyKiKjEBS8tdQny6Jsji5jzMU2vecPQZzRY9bs1HhbibpDFsGt/oPlTZqKoccx8oasP9Fr5OcuxsEeSySY/rJeUOY1nRXP4kOJFJpLxzuElvR5XZ3Zxl1HT5AVJDTk/kg3HOypeInZly6hCu1yrSbjvUfzEgARfwGaLkys19Y3hXAJMfUvzVI5p6+e6H50ADik0IAJ2lHsEpYOSVuJE016xpVg+V5vB4hd4hhEtmfqso/NFVR8Ik5qfck4qojwqBKQSA7hLC0TTgRG+KIxE3Z385L3bs5AMuMx+4z4ERDOGr2/K8dAAw7RAgSkvkYYbZaQPLjG7LlXWiF5WKIpftifdAEEF/u1vq6Czd8pLEoK182rVz6qY5vzGkLiRkpuW3lYNg4dzeQ+jCjeolOIxhMcsWwRojepQ3ci+/kLWqAk3g/mPCX5bioBCyOelYGa263ov5qMbIgS70tKdf4rTg1NFiZHQmTngWD7/CCvTlqRybuWgcsFZlcbummn628sYwuHfukcfP+lSTbGUB9Ynf4hmqZslHhsc6g3BBdjlk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5558b57-6623-4636-bf74-08de25ac21b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5630.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:37:16.4671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y8RVV07g/HgfHin3C6r6mARlmxQHm7gFQG5rWuItDszGR+Xp/H6C7onG3efLfx/BXWFStw8y2nC6dGy7m/r9oi/0W4N3SUzopZufMMktkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511170062
X-Authority-Analysis: v=2.4 cv=BoqQAIX5 c=1 sm=1 tr=0 ts=691ad0b0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=zmVB-EzjIQnr3VbMeHEA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: HHcUJIt1hhPX6NFezSsuEyqlegEUonQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXw7hASMclr3ea
 J5Fqw2cfCD9NfzN5J7QIJO8a2Y9fcCqjMjXMzLFiJLA6T9uQcj2T3z/H0f0c8wWqzAgZAHFAMZg
 F66KnM/lRO1AZobJXsEUPZzAYdc23WpOBUK9i1PTANipbaM8ZEkeD6kUjhXK7u2lGHE83S/IMzk
 3rxtt/QFVj2acVebrnGlBg1BVpQtbTHU+YLIkh3ypupopvL3FfhZPy0lc2m83xZP25/5mrWtDqi
 iG9KHd3Q7I21ukVsUulyAh9LHYy0CTSaQSrFl4mWTbLPmP6HR1NJFj7U6jeAqNrJzweMMvUo6cd
 WkymxRJWtMpdSHG3//WvbeRuhHKpD2rXjvdiSzpmf5pjvYy/GpoX3YhSX9coAujceRkDySUx1OS
 72lkDndk1NXvYmY1JMvAxLD8j6kStg==
X-Proofpoint-GUID: HHcUJIt1hhPX6NFezSsuEyqlegEUonQa


On 11/15/25 02:34, kernel test robot wrote:
> Hi Alexandre,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.18-rc5]
> [cannot apply to next-20251114]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20251114-020940
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251113164917.2563486-28-alexandre.chartre%40oracle.com
> patch subject: [PATCH v4 27/28] objtool: Improve the disassembly of the pv_ops call
> :::::: branch date: 30 hours ago
> :::::: commit date: 30 hours ago
> config: loongarch-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150854.iDlHBWI5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202511150854.iDlHBWI5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> disas.c:15:10: fatal error: 'asm/cpufeatures.h' file not found
>        15 | #include <asm/cpufeatures.h>
>           |          ^~~~~~~~~~~~~~~~~~~
>     1 error generated.
>     make[5]: *** [tools/build/Makefile.build:85: tools/objtool/disas.o] Error 1 shuffle=3303159566
>     make[5]: Target '__build' not remade because of errors.
>     make[4]: *** [Makefile:87: tools/objtool/objtool-in.o] Error 2 shuffle=3303159566
>     make[4]: Target 'all' not remade because of errors.
>     make[3]: *** [Makefile:73: objtool] Error 2 shuffle=3303159566
>     make[2]: *** [Makefile:1449: tools/objtool] Error 2 shuffle=3303159566
>     make[2]: Target 'prepare' not remade because of errors.
>     make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:248: __sub-make] Error 2 shuffle=3303159566
>     make: Target 'prepare' not remade because of errors.
> 

The problem is that I am referring to some cpu features (i.e. X86_FEATURE_XENPV)
to identify pv_ops. I need to abstract this per architecture. Will fix it.

alex.

