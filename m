Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F4157E61;
	Thu, 16 May 2024 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715892648; cv=fail; b=ApUzjnUSOejwSnzAw0V44aeOP8sI5hGwGTZZMQnHOhXEIpoaITK2f5T4KsvFnFRslXFA5f0K6EDr070us06YxkvzCAb6+dNedPa4Lfyd+3fO+I6BFpHV+5Nkpe1w+CAOivLTMt6QfD6iorsAND77q7kwd3lOHkiG04DR7Z/tZJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715892648; c=relaxed/simple;
	bh=SzMWkYuhraBDAvkhD1zQ980JVI/ZFgbitr4566LmWJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=ccukACLjxxjcM0UfXdC3Xpy1gZ6sRJLrRh0NPC1mAMSM/LZsKZ6bnSUebud4aV0PnE56rGYv6D09RdlBYN7IgJxHDDh9pV6VmRxmD8nOsQi3JcBoZ/LC2iFHon21GejHXUsKLVxL90/yoL3AmXBfFScaDkjS17OqBunmee/Q6ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JMk8LvrH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ekHWov/c; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JMk8LvrH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ekHWov/c"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GKeMBB002832;
	Thu, 16 May 2024 20:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=4moF2x8bpGWeOnjESSX+mx5EUNSfHFKvIRAxTSDMWNM=;
 b=JMk8LvrHmvR4QnSAEmPyYF5Ho9wONvS8gre6r3N539d+KNPhuqjV+Tcu2O1bn5sVetcu
 ACQ4D6uC+WijNMbX+eoetYCsEQYwFE/H7vz5Z9IkBdKo0pA4hI+RCWBhOIX8H3flFgwy
 ptqhVnhlKKE1kuTM3Dlb0hSx7DHOq2ukuF1KqKIAMgRIkV8Jj4/UGWBx115eUZXN9cWk
 19Bnq7PF2tHQXTuuO2hpT+5tANxJJycCtIPLn6d6+6RWp8hie2q9SNcenga6TONlgHiA
 JMFT50aAL/wDx5Kqac8/+fDFyQi+oHV9sbuMpJda7Uwyqy0EuV75LL71SROPsVE+RGrL wA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx8p9kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 20:50:36 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44GJVvpP018058;
	Thu, 16 May 2024 20:50:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y4h0ek9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 20:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGkxeNGSYky0RKI7W19dC8FiPJ2XSkOV9Ogma8Vl0+I2hhiFI3kjkWUFnvhyWRhomEnX4w8MBwgCYX2zkZr9kodzQdHhUY5qIUaw6pTbtSOKqxcjlhDD7qgytro7wHmseZ5lwqVlTbFLUf9sRJ0Qz+5bwVGiPHZcXe1a4Q4RfRWsM2iXn6RuOBEE+JKtJ0AKSoBZZOdCGuZlxs0w4EapYponsnjkMwD3BBL9bxnxIQ5UzOWCEBhKQaRfou/xdrDUxPj6F7bp2HmD9/0FyNlWiec05wrvVlTO+vs1RPeOSDpkGENCOxK6zcP1YA4VRiFZ+8yU8STRbnsAxU6X0ff3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4moF2x8bpGWeOnjESSX+mx5EUNSfHFKvIRAxTSDMWNM=;
 b=cc0jBYglp9ePWmBVGL2OfYuajzpFveFx9ZX8lXVNQxMdfPxmXS0pET6mJgmgVAq1PW090X9Zqab/C9iK0o8g63+IdSohNlthQwq3jvHMiKZPozQwxZRj8njMIzaAxYbE3AuNaXzciSbqfIjA+/9xPd02YKo9o8N2q7dPoRQdyQOhnI1f4BDIDYDwtrbEnHT68m2h6N72OuESZ3zirR2IxpdvwVvf/FjR/94UAFSwMpvHl9UzCIO3Np8RVqRVT9tgq75KsDbdmmxeLi3hwJFaO05KcwTRDNGd1xMwvw2UrM6mdd8x3sU6C25Svk6VuS7PeLHH8bHlEKQkt/zek6vnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4moF2x8bpGWeOnjESSX+mx5EUNSfHFKvIRAxTSDMWNM=;
 b=ekHWov/cwCjHE7fikKpbJCC0aFhGcqCMZesefWIrWIoSlyBB2EXrh5U/OqkyZsPomFgFDXb2hWU2QlpKRhCJiSl0fypKRBJ5QhReSoAFbCjPaOZNeztgA05m1uAWfcb5uJNeUOoFfURCNVLgo5KQ8fTE2BQe8700/jPz3Sr4si4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB7829.namprd10.prod.outlook.com (2603:10b6:806:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.58; Thu, 16 May
 2024 20:50:33 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 20:50:33 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        "Masami Hiramatsu
 (Google)" <mhiramat@kernel.org>,
        "Steven Rostedt (Google)"
 <rostedt@goodmis.org>
Subject: Re: [trace:probes/for-next 17/17] kernel/kprobes.c:1141:24: error:
 a function declaration without a prototype is deprecated in all versions
 of C
In-Reply-To: <202405170340.eyEMhYvc-lkp@intel.com>
References: <202405170340.eyEMhYvc-lkp@intel.com>
Date: Thu, 16 May 2024 13:50:31 -0700
Message-ID: <87eda1pjl4.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 525bedf2-d1d3-4252-8026-08dc75e9d437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UkRORlJVampTUXRJUjZDaU9QSXh5L1h0MC80VEpzNzZSeHp5TlhsTW1EUUg2?=
 =?utf-8?B?ZnU0aUh1M0NLQWNDTngraWFWUUYycjNrU1dDb3FLWHVQYVM5dXYrLzRlcGJa?=
 =?utf-8?B?eGpVS0U5aUs0cXdqa0FTZjIrdC9IbHRpaXdaWWk4UGpEbG1jbE9MWWJxazRT?=
 =?utf-8?B?K0h5Y1gvUmcxalpuaFd2NmNVVEFBVzZXQU9mUm4yV0FPNHBVcVZLUlFGT0ky?=
 =?utf-8?B?RzQ4RHFFOFBHVVpGVnl0OHEvWS9vbDFiakk4YWVWbHplekczN0JyOHJvZHBH?=
 =?utf-8?B?dThZWmdXSGlsdkpnNkZnalVZc1dsaGRjUktibCtnTDZJOGFXYzRTdkJhVDlu?=
 =?utf-8?B?QzAwVGM0YVRNN2FORFFFcVFlU3JTMFZoSEhrN0t0R3FYMU9uR0thZXBVbEZL?=
 =?utf-8?B?Y1ZjTjFLSjdoUWVwTFBwZ2JBWklkU3ZZMDgvMnM0bGtic2N0eHprR3pNQnRp?=
 =?utf-8?B?SzFLMUVvbHhQSG1vQ1NTRFNXL3pyNEJYRnZ6dktNbnBhZmRhMDlQYXNMWEhC?=
 =?utf-8?B?VnlsTm1rWmxlSlRXaW1xUDIyOGgzVG0yeEloaDJHRGhoelJ3NXYwaklDN3Bw?=
 =?utf-8?B?TUNrVEhwcW9YS1BGQ01EVGFtWENkYy9IRk9iaDEzbkRKL1dwUHZmMlNhZCtQ?=
 =?utf-8?B?SUFIcm5XRFlUb215TVRSNmFlV0pyeCtEa2g2ZmFNK2I1aVlpR0VLTTg1YUJu?=
 =?utf-8?B?T1ppbVRXZ0x5Y291RXRiMTRISHFGTXYycytEdnFBbXhUVHpJT0VXNUsrZ3V1?=
 =?utf-8?B?QyszbExPbXFXdFBQcTJqNEROZzF1MzBrSFozbEJ5aHRxdWZNeHI0TkI5V2h2?=
 =?utf-8?B?V3F3QmdmcEVSZmpUZjNpQnBySUdFYS95S24ya1VLN09weVNCWjVVcFYvZmdr?=
 =?utf-8?B?bzBacUJieEtRWE12OHNxNzZ5OU5aQmpQRExMY3h4VTdRNUVPbldaVThvRTY3?=
 =?utf-8?B?YTY3WkMyOTBYTXhBZThZVUEwdU1YV09UaXExbU0vVGV2cVhOVFVzdStpV0JU?=
 =?utf-8?B?enY3Z0pFZUluWTFnazZZdjk3YlQ3TnZRdFdDL2hvdEcvMldoamlKY2NXZW5T?=
 =?utf-8?B?OVRIYjQ0MTRBK1F1WUhlZDVMMWl5Rjgvc2g0SUVBdE9MWWRqWXFiNmZ6a1Yx?=
 =?utf-8?B?K0xYTCtKRFV5MThaeFFXZGdCMDg5YjJPc3J2dWdNZGd1Ri9FNlNZMm1tTFB1?=
 =?utf-8?B?MDNpNmkxQng5UTRTa1R5VjBNZCtzdXl1RDcxSmswVktYVEsyREdrVUNFanpX?=
 =?utf-8?B?KzlCbytocm5XSjJBSDJRN1ZjOHFIcEtvNktSWVFycHNGeXJtUnl2b0x4TEFJ?=
 =?utf-8?B?b3ZndHM5RVJhVDdwSm50amoyRUVFUlhhZzh0TmdRU1VCTVNFMURsWnM0TGFm?=
 =?utf-8?B?RmxFaWxuKzlnOWVqWXV5NGZnNVVoVkNsUGcyQWNRWlYvaWRjcncxWEpBYm1S?=
 =?utf-8?B?d3hkVjZXNU9qNzB2YllMWkpVeXlWSGp2VVc4QkM4OUhTeE9reWp2K0JlRzh4?=
 =?utf-8?B?cTQzTVI2RHdUS3NucmtpTG9YVHlPaUlhOWZSWkdpMCs5dFZ5TnhEbFVJRU9k?=
 =?utf-8?B?VytRRVE0eWZpUUUxZklvQWpsdldXSGRndG9YYzFzd25rMnZENEVoZ2wwV28w?=
 =?utf-8?Q?DZ5dfUNfyZw2xeIbs1B4k6cUwj2NzyvPS4B6AKqwDtCc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1g3WFY0dGJuamU1L2xYdnBDZGlhSCtVaDFwVXFRME9UV1h1RzJxd0FCUWhu?=
 =?utf-8?B?WGNhM2lheGZXcHNUSkJSa2J4eEpkMVpqNk5qQmZFcENXTnBpSW4zdHVyeWlo?=
 =?utf-8?B?WVVQY3NqbTFwZXhoeGxqVDlKVnpqNXlWK3NYaDFMdFR3NkhubVI1L0w2a3Rq?=
 =?utf-8?B?UW93Y2F3YmJHdVFPZjErR3VsVnpPdG5veTZOVlF2ajZsd010bUV3U2NTTHJh?=
 =?utf-8?B?b0F1QjBBTUxjWEpHekJMV2RTN3NGWW52dVZ1T2s0R2ZvdnZOcUdkLzIzN2gx?=
 =?utf-8?B?M1l2YzYyVzVlNWlvdHl3VzFwRWdVMmhHcEZuaER0alpOWE1VelJWQW51cDRM?=
 =?utf-8?B?ck1XYWJkTnVuSEJzNmVLaGNKMkJmT1dSTjBsZCtod09GZmNyRCtxQ21peHNp?=
 =?utf-8?B?UHhmK0xWWnd2d1VYTkV5VlRIRGdMR1BRYS9sSktpRXVkWm9wZGU0NDN6ZWc3?=
 =?utf-8?B?Qm5aM25DSFYvYWdYZXR2b0Y2NEJMSWpNL0VaZTZxRnJaUkJLSCtkbVFjRkRR?=
 =?utf-8?B?UnAzTDNSVm5neHZnNkJpb2h0UG1CTG1mTUpQRkdZQUkzNkVmMkVaZWZKb2F5?=
 =?utf-8?B?N0c5OHlXWjRpemtkamZIazlrZytaWUt6TjN6ZCt1Q0RaNXU1UTRjcXV2Y1JP?=
 =?utf-8?B?S2V3MkU0a1RkRWFmRVZhdkZGaThEeDF4T2hzOXhpVy9KS1lzakZVWTQyQ2Jj?=
 =?utf-8?B?Yzl3ZUswcVBWY2J4dnVqTVQwanc2c2wxVENMZVdaYXFXYXBCL0xiOTZlL1FF?=
 =?utf-8?B?Tkx4aVRDcEJhUHBwK2t0TDhSUFM1SEdrYWk3Snl3N3c0dGgxNDlSOG5ETTRH?=
 =?utf-8?B?ZzRaemQ5bW5yVktVNU02dWdrcFp6QVoxdXNQWE5TVzFPNHVmSU1PeU9IS052?=
 =?utf-8?B?WGlFa0E3TWpMczdrR0xBSjlhN2JRaEs1TGxoaWpNT1lnYkF4cCtLK2NIbnZu?=
 =?utf-8?B?b3ZReHBrVitBNXhuellTQTkvR1NraC9mbjlGM3Zpd2REUXo4MWR2T05pOWtT?=
 =?utf-8?B?Z0F3c1AySllIT2JiTG1Ocm5jZFZ4ZDRKRlJyY0daWFlMY2FnZndyQkY3Njh6?=
 =?utf-8?B?eHYyM2E2M0FaSlVMbytkaERYT0t1d2ZhUTFhZ3hWTTJRYXlvdW5zWlZSNDhH?=
 =?utf-8?B?cWt1SUdZM0g5OURmQlR2QjFYcDZ1NUxLQTJXM0FQWWJCL3QxZEYzbndVdDE1?=
 =?utf-8?B?ZzBmTGdiMWdhOWpUekRoMC9IaUMveDA1REk4NjlNQUVZOCtiaTg3Y3MxVkFN?=
 =?utf-8?B?eTRGUUVocHBweVhHMERudVlNNFY5dGtaRk9icHhyWXNhYzVRL0g0ZUsvSUhy?=
 =?utf-8?B?azhpcjUvK0VGSXZ3eWRaanpnNmp4U2J5UFlsQ2pDUGE1dEhVR3JPdFh4T3lp?=
 =?utf-8?B?blUvd0E5d3BqdGxxbEJ3bVZIOGxtVWwrOHFZOHdmSlBXMDVJL1pXTkFTQ3Ji?=
 =?utf-8?B?VEJHWWRZRE4zcllSSmg3Y1J1RTFBTkRPeWowdWNvOC8yT0hXVWhCSTZNY3pY?=
 =?utf-8?B?Z2NwZ3gxN1ZiSEpiQkR5WHE0YjVZNGZjUVdoclFxdldFZ2dLQ2tBdnlYZmo2?=
 =?utf-8?B?NE9wZitudDJlTDZnUFBXMk1ueFQyZmhJU0JrcmwrN2ZMbmRJT3MwV3JnWTZk?=
 =?utf-8?B?M2J6UHNTd3ZLdzNYR3hMdmlQVlVQZlI1TlRPSjd2eUwvM1VsTlMza3JwaS9D?=
 =?utf-8?B?d21ZS1crUjRCRW5IaHAzSXdzRUpiYVhSR0xrNVJ1cXM2RVROQjVVN0Y0clZ2?=
 =?utf-8?B?ck1DV3dnSElQbFFOdExuNjI2dHAvYmVpaUJuYThCRTFReTBKWXY2R2Z3T1FH?=
 =?utf-8?B?UEZ5a0ZoQi8xM1J0V3l2VG82TEtWLzJSVFpNTkxmS0Y4OVl6dTlJWVBJdTl5?=
 =?utf-8?B?S3l2WEV1UjYrT1hkM2dPdjgxTzBTM0NmamJBQ1psU2wzMzI4ZXFyLzZSRkVN?=
 =?utf-8?B?SFdpNHJYTjFwS1VpaFlHUjMxVHlNdEw4NDlHK0k3YjFHOVlpNGdmK1NFQ2Jm?=
 =?utf-8?B?OE9EZHF1MkhrNWRabFNpeVJyMWVZOW1DOVVhVjBvR1RDVS91anFyQWFxTExx?=
 =?utf-8?B?eUZWdTRMbENyOW0zQWZOQXBtY0wvcnNhTm13TitybHZvSFZTckJTaDZ2end3?=
 =?utf-8?B?VVRWN1RIK3NWUk1hWlhsa1FoM2Z3WFJoZllVaEdyejNKalRUVFRSY3h3M3hG?=
 =?utf-8?Q?aO7k/c5xNbr0SX7XLpU3hDsVqgw/7rc5R/Xv5Ru3jo2B?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HQQo8UP/kgIkgh5/AkxNkbV3zvtYKVzy1CaF1Q3mYlcSyE6qyIPgBIxZX+rXEulg0WVV+c65wLy922th3y4n3gVv+6IpNzWGKmX++q2rLH2q23uV6m/n4zh4GYCcyerWNQcYjRNTtwoAgvxn3kqTfIly05kDLa0TCD38cLHDTe7vDYKX/BQ+ciNASSqHbWDUK7OPeco4JoZ4nmKwsPqnmHalM8h7mjInyQFgpgBWGU5wl2FbOdWENhOyGHRggAG7ftkhqd1SyINeeeD9LZ0w7gbvYkdw6KK0qynbtGQ8mRBegM/0oW6Ba4hlkSRsCElSuGr0oZN4VhguSaKWzsWisakJeyT1q78ceTRkuJqVDc9iMLOrKXma9Ozu4WmrF/zPEqgtaSHp361Mtx0uk8brauAXwc6Dwfjk1xryVhcONClLdIrxjIjnjcd7Esnspmb1mT3Pd49rQUVBzw9mBSUCTp2/Okbr25G3Nkr+IqBXdRkndQUED71TRcsPWdUViGMGKdS4r5XRQ+kvOwh8j7COwCThNqisb0UL1rYbgGx+hSrlnKxfxvjWHtr/F3llzDh2FWKQVOCXkWIdwdD6UVoQ9cZ9IGTZEAAPoQ28mjob13E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525bedf2-d1d3-4252-8026-08dc75e9d437
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 20:50:32.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN/nO8tRW7lePX/TGsEsnpAbVKKtQcZeRkXS8MLWKGBcsy86EoaH5ffvj1N0lMt8tCH5gnVnk7qVxm4L8bQE6kgi/wgtfverUOEUiEIyGYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7829
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160152
X-Proofpoint-GUID: 2Jz5c_n-eXvirfC6cTrKLrHTVFfck94P
X-Proofpoint-ORIG-GUID: 2Jz5c_n-eXvirfC6cTrKLrHTVFfck94P

kernel test robot <lkp@intel.com> writes:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace p=
robes/for-next
> head:   1a7d0890dd4a502a202aaec792a6c04e6e049547
> commit: 1a7d0890dd4a502a202aaec792a6c04e6e049547 [17/17] kprobe/ftrace: b=
ail out if ftrace was killed
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20240517/=
202405170340.eyEMhYvc-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d=
3455f4ddd16811401fa153298fadd2f59f6914e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240517/202405170340.eyEMhYvc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405170340.eyEMhYvc-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/kprobes.c:23:
>    In file included from include/linux/kprobes.h:28:
>    In file included from include/linux/ftrace.h:13:
>    In file included from include/linux/kallsyms.h:13:
>    In file included from include/linux/mm.h:2210:
>    include/linux/vmstat.h:508:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      509 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:515:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      516 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:522:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:527:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      528 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:536:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      537 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>>> kernel/kprobes.c:1141:24: error: a function declaration without a proto=
type is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>     1141 | void kprobe_ftrace_kill()
>          |                        ^
>          |                         void
>    5 warnings and 1 error generated.

This certainly reads as an error in my patch. I tried to carefully
include three declarations:

1. CONFIG_KPROBES && CONFIG_KPROBES_ON_FTRACE (the extern decl)
2. CONFIG_KPROBES && !CONFIG_KPROBES_ON_FTRACE (a static inline)
3. !CONFIG_KPROBES (a static inline)

To double check, I actually used an ifdef visualizer[1] (written by a
coworker) and as far as I can see, I did this correctly...

When I pull probes/for-next and the 0day compiler configuration, I do
reproduce the build error.

However, I'm not 100% confident that this is a real error. I ran the
build with make V=3D1, and found the clang build command to build the
kernel/kprobes.c command. I replaced the "-c -o kernel/kprobes.o" with
"-E", so that I could simply browse the preprocessed source code. I cd
into the build directory and do:

$extremely_long_clang_command ... -E $srcdir/kernel/kprobes.o \
    | grep kprobe_ftrace_kill
extern void kprobe_ftrace_kill(void);
void kprobe_ftrace_kill()

---

When I do a GCC cross compile (s390x-linux-gnu-gcc) using the same
configuration file, with "W=3D1 V=3D1" I do see:

/home/stepbren/repos/linux-upstream/kernel/kprobes.c: In function =E2=80=98=
kprobe_ftrace_kill=E2=80=99:
/home/stepbren/repos/linux-upstream/kernel/kprobes.c:1141:6: warning: old-s=
tyle function definition [-Wold-style-definition]
 1141 | void kprobe_ftrace_kill()
      |      ^~~~~~~~~~~~~~~~~~

I'm guessing that what's happening here is that Clang is categorizing
the old-style declaration as a different function for which there was no
prior declaration. When I add the "void" here, the clang error goes
away.

In any case, the warning is right, and I should have used the correct
declaration here. The below patch will shut this up. If there's any
possibility of improving the error message clang gives us here, it would
be appreciated though.

Masami, would you like me to send this to the list, or do you just want
to fix up the commit? My apologies for this, I should have run the "make
W=3D1" prior to submission.

Thanks,
Stephen

From 324849fd366b8d2d4367ed2cd6f74621099439e1 Mon Sep 17 00:00:00 2001
From: Stephen Brennan <stephen.s.brennan@oracle.com>
Date: Thu, 16 May 2024 13:48:32 -0700
Subject: [PATCH] kprobes/ftrace: fix old-style function declaration

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 kernel/kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 166ebf81dc450..4f917bdad1e11 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1138,7 +1138,7 @@ static int disarm_kprobe_ftrace(struct kprobe *p)
                ipmodify ? &kprobe_ipmodify_enabled : &kprobe_ftrace_enable=
d);
 }

-void kprobe_ftrace_kill()
+void kprobe_ftrace_kill(void)
 {
        kprobe_ftrace_disabled =3D true;
 }
--
2.43.0
