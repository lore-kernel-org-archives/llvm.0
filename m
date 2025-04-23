Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBA3A1B6;
	Wed, 23 Apr 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417659; cv=fail; b=S/CmibC/9xeJz4US2Ok77HvhFyOx36NnFudXoTySeBlEWU0kHHa7AYFoLv+Ahcix+hAbq2MBAjHctyzsmWOtynHzebfG3XgkT4rtq8GWncYUpYCbKSJgjwGmeJgESU7lnsv/sZikq71JncKJDWq5DYdHhL0tnUHMFAVn03OrcHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417659; c=relaxed/simple;
	bh=6TnWDwMN9KPsAUMdoMUCy+EdHLcRS6RogLdw1k6Vw9Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K0xTsdPs1K7LHsyYOL0iEtgs0gwtXHmlfpcbi+LhiPWcjZbXED0pRzDPcGcTiK3RRrAlmadx85Bv/Yc+tiLJZbbxprkKvC8MKGM3Ev23lqjFUe8fuG/4kxPGoduywwDVv/uMzJF0iasP+tfjBqa4CGi+ajxTh+Y8ggJ4nKWuOao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QGJo3j7k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GlxGWgKL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QGJo3j7k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GlxGWgKL"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N8fxT7020836;
	Wed, 23 Apr 2025 14:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qBURTaaREVrrYZOOr3He8yVwpDx7vp9kEKBX8/Txeg8=; b=
	QGJo3j7kWF0U/i/sTIWcQKeNBROipo8UZhK426zHpxquZssK40V+CtUFuCWVQO0U
	FOuRkmDvZkp4G7EEe8YhDHNygzAtJCA5mQng+rxqYqu+oO7doBHzvn5tdguwmHEn
	+cpPSLB/fCyPZJ6kbKbCBw8yFlR8du1V/D4JuWBnKSZU2wuCsR6Dj+OiVxef5wsS
	6a4orEs338GAvp/lb0v+ELpEoKOi9hC0nH4WMsQcoWYCIxCG+BHxMMNteuQkSuB6
	cgRDT7pmTocSBtWbzScYpDQDLXlG3cOmxIIscV9nK9mObQKvXCB3F2qU80USX8L9
	cNfv2HYVcqNAHjsoY7rpQA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhdhc3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:13:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53NDFFuN028399;
	Wed, 23 Apr 2025 14:13:56 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013059.outbound.protection.outlook.com [40.93.20.59])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jx65qp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 14:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsMPzkkFBLG23K+XMDWg4v00Sbo6sW4GsKw0tpnmJv6T9MUXfKct5jB7IO4Ck+g5wH2cj1bx1kWLsgSpvPi/uYm7++UtDHcjf4wBAAgxTr9ouqGMnO4s7Vt8NDohPjhoTph8ai8CusCW+Sd5olxBjXWNU2AAtDdigTFhR+MUwr6bzPwJ2qR42sfYHMAlt7t1wqQw0PKXu5Pz9rH6ySp4pHfRaYK0pQzcw6/w5CIuidDnqlNPUtSHREsBAhrSFCf6WGuMse3DBELcTXxi5ifpfjCV52BG7zFbFtKvv06ikyDeicuvtt2TUoBQEBYsIm7F2wm+gyoz+eLMrTM5rLlDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBURTaaREVrrYZOOr3He8yVwpDx7vp9kEKBX8/Txeg8=;
 b=HklAQ0l4GuBr2eIg4FyKybyOSWd8r3bTZyi9JufrxqlZtt+J9Y+xzGCT/V2afi3c4xVE65KdaBKGh0nTUjqn055CWq3B37o1hlVeD+NkJLayw64sF+RWv/YFKKuf5ftiF1FtgFAD+XEF9bQRZ2GxJ/uCIBapVInBi6SzjGrCo4YAFQYJpXbnWySIZ74oNcYKKFSUELbLd2C2uipJIISLIOnTcGD1qNxjhm+MobOK/EXpRmQP3pz99w79zvKh8bSzbJlc9TLUi2VXHOsqS/doubSnNiIgNJY1xWNpglhKjgNl9sdd5dSIFecEIhpU8MAS1i5L8MB4s9sOkBAi8Nh20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBURTaaREVrrYZOOr3He8yVwpDx7vp9kEKBX8/Txeg8=;
 b=GlxGWgKLpLjOf8IovzYzxRIsSAHrK2Dptv4nPh5fHdKy58W26s6pB4ElSjtIbNc8scGgtT9emDhTS7VGRMnwlxK6miJTXBtr0sIRW6NGEaGFEniED1963bHCfZyNZ+sRyAk4eek3BPz9K5t82RAmoqyGmnPdDspd6r3o8mzJuyI=
Received: from DM4PR10MB7476.namprd10.prod.outlook.com (2603:10b6:8:17d::6) by
 DS7PR10MB5088.namprd10.prod.outlook.com (2603:10b6:5:3a2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.22; Wed, 23 Apr 2025 14:13:53 +0000
Received: from DM4PR10MB7476.namprd10.prod.outlook.com
 ([fe80::f32a:f82b:f6ac:e036]) by DM4PR10MB7476.namprd10.prod.outlook.com
 ([fe80::f32a:f82b:f6ac:e036%6]) with mapi id 15.20.8655.021; Wed, 23 Apr 2025
 14:13:53 +0000
Message-ID: <6923843e-081f-427c-88db-90ee098ca8c3@oracle.com>
Date: Wed, 23 Apr 2025 09:13:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [akpm-mm:mm-nonmm-unstable 66/67]
 fs/ocfs2/aops.c:1133:17: warning: variable 'i' is uninitialized when used
 here
To: Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        kernel test robot <lkp@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>
References: <202504190950.rq1NDlDz-lkp@intel.com>
 <20250422201241.GA3761951@ax162>
 <20250422175508.cbb4875faacbda05e6c68cfd@linux-foundation.org>
Content-Language: en-US
From: Mark Tinguely <mark.tinguely@oracle.com>
In-Reply-To: <20250422175508.cbb4875faacbda05e6c68cfd@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0567.namprd03.prod.outlook.com
 (2603:10b6:408:138::32) To DM4PR10MB7476.namprd10.prod.outlook.com
 (2603:10b6:8:17d::6)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB7476:EE_|DS7PR10MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe90cef-2303-4c87-c4b7-08dd827113b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWo3OTNOczVSTk5ZWTRvRUJ6djlCZVdhNjJpczN1S3plUUNFK29BMDJhWXRq?=
 =?utf-8?B?TWYyeXU3UE90eHIvaGxTcmh5VUtUVmlYSUlrb1AvNlJLWHlCT2ppWmN2b2Fh?=
 =?utf-8?B?OUpsbEdFL3lKZmZFdHNCQldZSVhFQll5aVB1djg2SzRSSlcxV3p3TWE3SW5P?=
 =?utf-8?B?VTlyaFRBSytuVDVLSmhjK0FhaVg3RmdrOC9NQWZ0OGtwakdZVVBzN05leTZq?=
 =?utf-8?B?cVcvMExBb2F1eXgrdUV3N3pWcFVudko3dndOeUFPcDZOSVliTHZrYWthNmRG?=
 =?utf-8?B?MlBJTjVvYjN4dXNhWWUwQ2xaQU1kU0thcXdwUlRlTEcvZjNaemJIeGFwTlFz?=
 =?utf-8?B?cmRIekI0aC9qSE9zeXZSQW1vT2ZNQ05jRVNJUURyWUNLRjhXcTB1UWRPU2tu?=
 =?utf-8?B?Z3RiVENNdVZMVk5CMUZpdnBMUkpWV3B2ZldlR1V1c0pBWlpmQngwSk50bFI0?=
 =?utf-8?B?OENxL2I2OFBWRFpqdmZxdVM0YkFCN0MydFpQQ2ZJRStKM1VkTFFOaXlRT2or?=
 =?utf-8?B?VE9CTU9KSVBKNjl6b2hLVUgrMlJpWTlaQWhGdElpTVY5K1ZONnloM2FPdTdw?=
 =?utf-8?B?ZXFlVlNEcGRyb2VBMXIzb0gyQ29TWUNvY3QzeWVYY01ITHBpUDZMczI2eTVJ?=
 =?utf-8?B?c3E1L1p2djlRNzdlOXQ5emxhQ1gyNDJUajNCTGhTTzhlSnRBQkpWZ0pkMHdU?=
 =?utf-8?B?UWcycmQ3VGF6UUFJa3RJRWlHWk1uNTg1dVl2TU9wL0habGdGbnpoZ0U5VUVr?=
 =?utf-8?B?R0lvWGhScXV1ekhTZU1UY1lhU2pwMmdOL1pYcDRtU05iS0pZbllSSFY1MlNr?=
 =?utf-8?B?VXI1RDJEL1kzVUNOMW95dDd5VjRDdlhaM3drcVFUV2ZIeFgyYllzaGxxRjRP?=
 =?utf-8?B?NUdpeWZVM2hFWGNOdTJLZ2ZMeEoxNHhsOVAvR3RESmQ4TEt6TjZwTnFLOXlG?=
 =?utf-8?B?RlUvWTFjQ2EvU3dCRTlsbnBGb3dBZUlCbHRabFlrRko0cVA2cTFBb2JNdEpq?=
 =?utf-8?B?OFB4ZjhrRm9iTnRyb3pNTkN4ODhiaExIZnN1M2p3dmN0U3A4R21EVmZZeW1x?=
 =?utf-8?B?eDZ4MDdQY1lpdzEvd0NhMnB0U3ZGTU9EQVp3MCtpZUVRT1lRR29ZMXhLYmxM?=
 =?utf-8?B?b2hSSk1ZLzdFUVpSejl0SHRJdkRCbkJITzIwMWROTUp0NHNsa1RPZDNOSExU?=
 =?utf-8?B?Y2dLb1hjK3lQUWhjYS9tVEduRHNpdUJmQmJqOG9pMkpzUzE1UzNLWXZHUU1l?=
 =?utf-8?B?Wkp2enFjRlR4clZicnVIaW9JbXNRTmtPYTRvcGErREsvb1lOWlg3bjZDT3Y5?=
 =?utf-8?B?YzVGU3Zvc0NhSXYzUUhpRStKZ2dweXZDMTlaWnhnVE10VEVNRlRJL3BGTHFp?=
 =?utf-8?B?VVV1eWxOSzllVmRQUklaUUUydEdCWGFHdWNjdElvaDRxeXN2bDg2cGRsTUxP?=
 =?utf-8?B?b3BWUTYyUUZKMkEwckZwVDdlU1JZNDU2cFArSWJ1a1RjWDZPSFBWTmZRbDAw?=
 =?utf-8?B?ZW12S0VpUS8zVDB4eTJVTTJlY0pKUW8ya3JyZXdsU1ZVRjNuUHJrS1M5d3BT?=
 =?utf-8?B?SWIvNEY0Qkw2a3JROTVMVGlMcjlXNUFTNi9vL3E5K1FGQ2VOdVZUa3pieVlY?=
 =?utf-8?B?VXVIVFZFNlZEMGJucnBGVkd3aUJBWDV4MldsNHJxWXhYcmU4LytxTFlBcThw?=
 =?utf-8?B?RmVBUmtiRWU3dkVmdkRkeFVjY1VtR0hzdGs2R1FHcG54WXV1Z0Jkd05KejM0?=
 =?utf-8?B?TDVSRDU2a1RJRkZuYmt2amJLM0FXbWorWlIwa1NDekNVV0xGUktsRGdxTVZj?=
 =?utf-8?B?bFVIakR5cHlaU1FrampzeW9lRld3UWRwQU0xOFFFbTNLdUVaZktZdSt5TkVr?=
 =?utf-8?Q?kgr8Hmbp7/WQJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB7476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUN0TTBsV0t0MjMyZzBaUHd1anpSUHk3K0FCUzlYQ2c3Y0R2cmhIWWJiVUJ2?=
 =?utf-8?B?NUJLYmdJK0RyYnJPdFlrMitkTXlvYytTL0hUZFJkRloybFBoQkg2Ymt2L1NN?=
 =?utf-8?B?b1dmM1UrODYvUU5SbU5RZVFaMFgyYU13UTJOckExeGpSQndTdGpUaVYwMGI2?=
 =?utf-8?B?eldRMlBEdTVKSzlYQmZFMUhlZHdFbmdwSmlmbG0xN3VQSzh2U2swYm8xSkx3?=
 =?utf-8?B?VHU4dUJuRjI4dGZMVjBvZ1NGMWhRNW1qQTBsQ2l4andtSFUxVFlETjZKL3Zw?=
 =?utf-8?B?OTNHb2ZTQlI3TWJQUStpUFh2a1lQc1I4MXhQL3VwSXJpQ0lwUE1EdWEwN1lN?=
 =?utf-8?B?Q2w0S0ppL1c4cjBjbGErTFdrelFBN1N3WGZNU0c4NzhORS9rUGd6REVYcnFq?=
 =?utf-8?B?eDZYUkFtaitESUFuNnZnTFlKUWF6a2JPQ2pxU0dMdzZRZENNeldJQlRJTWky?=
 =?utf-8?B?V3B1ZWU5MzRiYkZIeFQ5Z1JhVVE5K1lCTEFMclBxU2h6YTZoRVBxK1plUkE4?=
 =?utf-8?B?SitMSUJ0bks5dVNUZmhWUXlNZXBjZXUzWFVVUS9QRWNZcjQrcnRzTUQrdzlZ?=
 =?utf-8?B?V09uRlg4UmxLWm1ScjhWSE11SExtU0dJTkFDajFCNU9hcDVZSkJ2L2UwS1ZI?=
 =?utf-8?B?TUdTTFdGa3pwcEVSOEpzSVh0RG9yYmM4LzA4WkNLaFlTSHI3RDVSWGk2N2ps?=
 =?utf-8?B?c0JsRW5lanYwaityeFZJalMvc01pTThJWThLaWxiajFyNTQ0RG9NWUxqVXdM?=
 =?utf-8?B?ekJHOWFxbkM2N0dSTlJkUzN2V0R1UEdtWHo3MnpOS09JV0NsQU9aTEY0aE5M?=
 =?utf-8?B?RURQejdkWVU2TG1HRDlxaXI1VTlwRmlLTFhORVRpQlJkVllibE0zakxjeW01?=
 =?utf-8?B?N0oyb1hhWGNvRjcxNERvOUdHQytWVG80M0E3anhUMm1ma1lMMHVIdFpqUDFQ?=
 =?utf-8?B?aWw0aHFISHJ3eVQ0UmNzcE9SVndyd0xHTTQxU2tkK2MxR010NUlUSXhWeGV4?=
 =?utf-8?B?QmkvNXcyZ2oxeHZFb1FYakFrYlZwdHhKcisvTnYrMEZ0Ri9tOHY3dXJUaXh3?=
 =?utf-8?B?NjByWkpwSXA4MmpBL1JMNWU1QUlzaHI1UW8vdlEzK0hKeUJ0ZHNadnp6Y0ZN?=
 =?utf-8?B?SjFYbDVsZHBIejZOdE1tQTYwdWEvREtEQkg3bE1TWVdnaFB3eG9xNmNENEY1?=
 =?utf-8?B?QVRJQ2JyYXBNU2xENWhCZHUvTFVFd1ZwdXFpWlQwNWZ6TVFCdjkreUhEa0Vu?=
 =?utf-8?B?Um5rYUt6am9nMDVnZkphcTlwMUVFVmVCUXVHQXZ2UXZ5THkvZVhuaC9jdzlL?=
 =?utf-8?B?ODEvSlk0Y21NbHNZZG5iRndqd0t0c1lsTjd0V3RvT3ZONVEwTHo0THB4aUNL?=
 =?utf-8?B?UkR1MmxIaVQzUm4wSEZaR3BtN01kVmpJRk5KaVc0VFBpbDJkV0hoQUl0ZU0z?=
 =?utf-8?B?c3BTd0Zud2pYNjBNYk1qQ1BZYU5vQkVoZ0NmQk11aFpydmRYdlVrVUZxQ0p3?=
 =?utf-8?B?eTN2R1MvVCtjMmx4cDllMGpFbTlxNjhCdkJyMHdpa3BUc2MzVUR5ei9EaEUz?=
 =?utf-8?B?YUx4eUx2eWlWVHpEcUJJWk1hZ2tMUDJEVUUzUSt6YzByYTE3amk1UDFEbEJS?=
 =?utf-8?B?cnptVkQydXphdGVWOFVXZVcrdEROcEFXYVltaCtNRHpTS3Q0ZldBejU3OExT?=
 =?utf-8?B?Lzl5TlNEOHlFZEF3b0VDdG1sazREbzZtaEY0aU1FZzE0V3Q0bE5mdi9ZRW9H?=
 =?utf-8?B?a1ZFWWtpZmVQSGVNVWh1NkJ6TUZWR011b0JWbDMrMEZ4cWVONkdLdGtqQUto?=
 =?utf-8?B?REZUVWxmMVZlUzgyYkwzNDFvQ0pxNFVLWjZDQStRQWNxdnNxc2xwaG9kbGJx?=
 =?utf-8?B?ZVpwa0tuT3cxY3Q1UlNzejZHK3QvWDEzQm5VMDZxZDd0UjMybVdQZnhhUFJh?=
 =?utf-8?B?a1EzWUxNU1Ztb3d6NGhvNTRiWnVMbW8wUTJtRmpZemcvT3lESnpnUWhXSThV?=
 =?utf-8?B?Q1g0Q3pQSEV3aS9CUWNuV3VITVNTdER3S2VqTmVaYjhkRXA0UndIVXFySUxr?=
 =?utf-8?B?K2UzOUtUZGxxQnBSZVNVVE1TbXM3VUNxaitWdGdFbFd0eGVqS2JIZXdST0hx?=
 =?utf-8?B?QklvV1ozbGVscmlzZXQxaUJxZkhuZXk3QVVYYU0wejcwUVpDQWVUK1l1dW8w?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TwN3/pK411ibze96rC254/CiQ5dP1eb60Ado21kyil4ao9gK2kScWl3R/zNkFdHpBEi9e8zqZMizrdVcO7ZAyITLls0t1NxyISFR9CaYyAfF1C7FGuKJE87nfwyY1AupVuiBk6druf8wgJVWhnBGnMDe95Kq4OooWEl2yv/AxgzNjzzgZ9YxKD/6ad93mHP/bRCknK6yS10nb+sJyyW8QUfo5yc3nmsNF2XIPPPfpmIsq7mlXKoDz+GOTWoD9ydYj7uJSPakljOhrU6jP6skk3EicTs0W37fOzA/lo9ogT5D58/kHz1gRVxv+sPmMn51bmAe5XIKMJg2lp1bpjP2WnJhj8+uduD63tsLDB39qOqCIoMnDJRd2yBRVGeLPHbmDku2dPHyom6YlCX6VYwOBx0XEp8ZkAdvprAOIoL9Rc59fuwVyU/4TGOTopszK6czkAyTcR9ySUWU3HVVAGaOeiK7N+anzq5okqYbxbpcKTODpVkM+/JZvapfckl9GRSbRmE1bz+4g+VQH/t8okcaMM3NeFzhCwyOIssyocSXXpzrrS8wSZ7Z0uJwUkQKQsfE2hNOhKEc9f2k54e1YB75m9ry9flp6P4gA8WtKh7qR60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe90cef-2303-4c87-c4b7-08dd827113b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB7476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:13:53.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eXWhgiXLuM3hPE/UHnHiEGIYf/ldhEouWNhQJ3jKkCoRXMPXfcbAHiKZJyohYcX8gu+ALbx9zZBSTcYnr0ZjpL3D+4Oaaa3LW7BEB8BPAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5088
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230100
X-Proofpoint-ORIG-GUID: RFzPKW7lwbuxo5Cg_ESCcucNUVD_U3nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OSBTYWx0ZWRfXxphd126Q344f nsRTiOIOSr4oDdcn5/WAzJRAMFTKvGCxy+XVvzT4+OaUYdWMe1GLIWepOvXxJUFtBTf/Z8XcIy2 glE63pN3Mm24oTm2J/2WEyBDNMVl5DE/TsUTGJ5x4ZsB5OebMgbrqYYCnGQ5ANMu61Npiu5NTkz
 4Y8yywQ8Q1g1+cuR09TWXQ8AsOTNqOLWjOP20TpruOaZCr3f9L3YB5LL8OXsbYiNd+deoRKqUcS uXHZRvPdQZhMkCnCchGn8OsQ75GOf8dK8mlmIUckLn0sfdSgUSw6Hr95/PuksIskXVZBd9nL0vr 8YEFS/EOJNMdhXmPSCqbQtweOo7T521H0rYmKMaQa6/+r8Vid3S5DWgAtXzpsmrbY2zBjsCzQsI 1w6EQM+r
X-Proofpoint-GUID: RFzPKW7lwbuxo5Cg_ESCcucNUVD_U3nx

On 4/22/25 7:55 PM, Andrew Morton wrote:
> On Tue, 22 Apr 2025 13:12:41 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> 
>> Hi Andrew,
>>
>> On Sat, Apr 19, 2025 at 09:21:13AM +0800, kernel test robot wrote:
>>> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTnhBAaPs$  mm-nonmm-unstable
>>> head:   d1a9b961293d30be9a865d8685590635db282957
>>> commit: 89e3e963129e945e0333e474709bde627b6a9cee [66/67] ocfs2: fix panic in failed foilio allocation
>>> config: s390-randconfig-001-20250419 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/config__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTvSadMWN$ )
>>> compiler: clang version 21.0.0git (https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTvn1221-$  f819f46284f2a79790038e1f6649172789734ae8)
>>> reproduce (this is a W=1 build): (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20250419/202504190950.rq1NDlDz-lkp@intel.com/reproduce__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTuWmwFGg$ )
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202504190950.rq1NDlDz-lkp@intel.com/__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTgKlYSkL$
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> fs/ocfs2/aops.c:1133:17: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
>>>      1133 |                         wc->w_folios[i] = NULL;
>>>           |                                      ^
>>>     fs/ocfs2/aops.c:1101:12: note: initialize the variable 'i' to silence this warning
>>>      1101 |         int ret, i;
>>>           |                   ^
>>>           |                    = 0
>>
>> There appears to be something funky going on with "ocfs2: fix panic in
>> failed foilio allocation" in your tree, perhaps as a result of applying
>> v2 to mm-nonmm-unstable and v1 to mm-hotfixes-unstable? If you compare
>> https://urldefense.com/v3/__https://git.kernel.org/akpm/mm/c/392a664f6d2740eeae23df0d29b56f444f558a7c__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTnnwerZK$
>> to https://urldefense.com/v3/__https://lore.kernel.org/c879a52b-835c-4fa0-902b-8b2e9196dcbd@oracle.com/__;!!ACWV5N9M2RV99hQ!NYsFjZmx0oSNmGPOQ57M8FqiwN9x_0uNHOsZ0H_bxMZw11U8F1-i2FIS7wctmB4sSockZwPpufGxuROeTnn7W1rC$ ,
>> the second hunks do not match, which is what this is warning about. I
>> see this same warning in next-20250422.
> 
> Thanks.  Confirms that the universe is a plot to confuse akpm.
> 
> I dropped everything and remerged the v2 patch.
> 

Thank-you for remerging the patch.
I did see the automaic tool complaint and I visually verified the 
indexes and discredited the complaint.

--Mark Tinguely
