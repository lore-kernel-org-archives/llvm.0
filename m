Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864E1C00
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 21:27:27 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LJ1TNB009747;
	Tue, 21 Jun 2022 21:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=L4BvkVFygq/hpsh4fngo6ZIxYOJInUGyvQrjMVrMu9U=;
 b=gKbLC2OdoK0wTAMPjPBNb3QkeZBy/u4hwR9NPAYtNwG2pEkTGifrCVeykzmsYR4gLFrq
 rgLhIFAWtDcwCcdiBTtmL0RPt7ZMrTID2DU1r2YP/hB43y71Aj1MqF6HjroZOeBDy0O+
 q2RHjoFO4v7/yRG2rhUKyeZgmwcAcYL0k0a2+YBDzl9Ju84JjPw9ZQFRjSzrsbCrNB6P
 fpSbGon3GNmvf0LpwCgNaF8HRuIaG83RgktGEroNFF2jRAtKwZ1wMq989jxnl7qPHlHq
 2p0DkhJYWzHgzQIwj3AuyOZ6XuTY3HMuGvKqC/jugy1LrHtAd7SXRVCs2hqsgoig/GZV YQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78txs21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 21:27:24 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LLKaK3039536;
	Tue, 21 Jun 2022 21:27:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtg3vmgcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 21:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2ZPTdvFKbAOAZazuBE7ZDlD/wfsyowaD5dQ0bVayFvtrzaXesZiDB/cKkp1Y6RiIXCJdCKgIfapZdo8IkPo54Dnvqu5WWDV+UVD6MYbQn5ZJzyVxGRQwWfYs5xUdM+AJn8gL/RPF9fccHQzQfBUB2iS18cFMR3HW3Pf7drbO940lNqWYEd/hMWfFzY2KqWegD7edxDXsgWGQG9sC93ACNvoQ4NoJoq5Z5MJH+NvFKdxnbriLV36spZOulyavqq3Km/kkHSBT4g7vJ3wmlEzaPJWMMXo0TY0uhZpO+qHGPd1EqzT9HIUSZAVZyf+oO/YqMDhw+OclABpzKlktM3qFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4BvkVFygq/hpsh4fngo6ZIxYOJInUGyvQrjMVrMu9U=;
 b=N42jyCSGyl9IB5DlLCI8V9eDOkS1KaelZXgztJjVU7Q00F+yaizti2uI9GOJX6SkfVZiaQyfvIZyl14L8gZ5QJURDsb1mIoqw9LNYfnI6tvVeYCpzHROfuFpt+ZKaios5A0RJvJWv4d37MbQLfcCCBlNDVLqhECEyLgH/h3wojh5WZd3SuYu/tQ8a1/nxV401gstqCJYKeBUcyU6c2XWbSdfItcrZ+XAW+s49uTOLUVwWe2wSsp+Gh4k07kKKgzexzI+4ZGXYVoeMhLKnqnecAjVfzi1IK7woP23pEI1yN+n6NkYcmszqu3Danu8zcv/eM8pyOpsPIoee+6WDkusTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4BvkVFygq/hpsh4fngo6ZIxYOJInUGyvQrjMVrMu9U=;
 b=Xbo5N/v1TzRcYlY/SD0hqY6tnxIJTUW6tIlXBaJHkZQPqrkM/oA7qLa6Dn5oyRdT2AcuWfdkm/QdmWzzc2JSZO2IwmFGAhs4hTsmDxdQwaWk/s7fnXHG8lZ/m5NOsHA4h8BKOyKIi2pDRn+qJbdT7SZTEVp4U5Bb2QETZlqttqo=
Received: from BYAPR10MB2646.namprd10.prod.outlook.com (2603:10b6:a02:aa::19)
 by SN6PR10MB2605.namprd10.prod.outlook.com (2603:10b6:805:3f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 21:27:21 +0000
Received: from BYAPR10MB2646.namprd10.prod.outlook.com
 ([fe80::4d80:f342:e679:c315]) by BYAPR10MB2646.namprd10.prod.outlook.com
 ([fe80::4d80:f342:e679:c315%3]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 21:27:21 +0000
Message-ID: <639f7737-fbbb-f0de-d465-d9770c794afb@oracle.com>
Date: Tue, 21 Jun 2022 15:27:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kernel ABI Monitoring and toolchain support
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>
Cc: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>,
        Giuliano Procida <gprocida@google.com>,
        Dodji Seketeli <dodji@seketeli.org>,
        clang-built-linux <llvm@lists.linux.dev>
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
 <87fsm7rbec.fsf@oracle.com>
 <CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
 <2651230.KlZ2vcFHjT@sali>
 <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
 <CAKwvOdmUXcapfojgcRK1OAZuCDCeQmD_cx9=y_iz6-L_uv0eHA@mail.gmail.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <CAKwvOdmUXcapfojgcRK1OAZuCDCeQmD_cx9=y_iz6-L_uv0eHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0401CA0013.namprd04.prod.outlook.com
 (2603:10b6:803:21::23) To BYAPR10MB2646.namprd10.prod.outlook.com
 (2603:10b6:a02:aa::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5acd8ae0-84e4-4321-bfd7-08da53ccd373
X-MS-TrafficTypeDiagnostic: SN6PR10MB2605:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR10MB260501D807758916A145B8819DB39@SN6PR10MB2605.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vdTiN7F/gURDnBs+VqSxb6NJ/RJjwFXbsqnzm3fcC7I/U2i3eyo17z6JFeR1MxWfSXXj5jq0FBdik6qiaD6FOkK11/xU4PQTsNw+2jJQPQzn1QlO0bugmaJrgOOoFLRrISUiGapNZhZek3ngwXlJkTgFLW+61PAaHPti4h5NykJtPZE5onSri7pQPhfAinGnSGS0l36Epv5rFsp4kWH12a7XZ9W5Mfarojx+BMUQGT9nXb0bvyBSZn5emEoMhMml6BeHMQamBSY+76L8/65u1NxoE3rjqzz3QyeePbtXNI12a6fvsSIwyL1GlH1o5oGtTj0iiVWM06NG9GgjGqoHIQUyWEgK0NqYSGc9gHgvuGxhL3oL5rlwijHGLAj9MVH7b+ysv0J9FPMI0o3cUPn72RIEOFcft6IZzg9dSuMocejUrCI8H7P5DdF9fsn+G81EtB+72KcWuK3iDKmVJ084UseIBhqjGuT0VqqgyEbJav85IGCmGABy7JTXexe08gDAFp/IYsskAvq08fMLsxQ2uTTwSg1Rt0tpP4NzAfsZUMOBxVBysRE2nwbglqrIFBBDW9NshOUUVf7mU+yehK2x3oGjS2yjNlfw82vSOj9+XaRwTC0QeKmS5batGOy10/rhORmw86U7ofHSYH/TJLjNZ8B/QuSUDdnAEHoURRtmKHtXGGd7LlUGmlyuU7f2ycPM43soDwWD0uvLUoJmGdzjpqvWOdJTn2LkEL9ZWi+vOgUpAgEsHhaicFCEzZoWdB+ibngGgcr19/lZSLhiiAUw7SSyn1vYdxYCHPafq2SwjSPcBZ2epHpWDoCj6LIyVg1tuZoRtFXhBGorT55p3Az5CTVrgvudcp2ibInvOi8UiY4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2646.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(66946007)(8676002)(966005)(66556008)(66476007)(4326008)(316002)(36756003)(31686004)(52116002)(6666004)(54906003)(2906002)(44832011)(5660300002)(478600001)(8936002)(6486002)(36916002)(6506007)(110136005)(2616005)(38100700002)(41300700001)(6512007)(31696002)(53546011)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0l3WUVuQ2cxRXZsR1VlOTBHQnQ5ODhBMDRKWTFkMy9zaFN1OUYxcFByTWZS?=
 =?utf-8?B?VVJtR3ZzU1U3a0JvVksza3NsTUhVN0YzbitWbWt1SWl0OGJNclhaVTBqY0V0?=
 =?utf-8?B?YVpLbFRvV2tOQ3BjbytYVVhIa2RINytIeVFJNU1LbjVBRHJ0Zm9iYVpmd0lW?=
 =?utf-8?B?VHlKTXI2RzJidVczWkxJaDJsYU1lN0k1QVMwbko0VFVnQUtWWHh3MlVUR25u?=
 =?utf-8?B?MFFnYmVFZFJPVU8zL01pV0xoYTF0bmFzTUViOThuZG1BaHFnUDJTb0JxL3R4?=
 =?utf-8?B?dC9JUjJ1TmI5QWhzMG0ydGdMN3Z3cERDait1dGJ0SEVXRFFvazV0cDh4eXhK?=
 =?utf-8?B?UnNSQlVzNC96dEI5VWRCK3RXeEFDUU1NQjk2V1ppam1OQXdPNGV6UUFCMWJr?=
 =?utf-8?B?cGw0TDNHZ29tclhyazVRUi9vNGo3UFNrQ1J4YWRJSVBzSGpXYkRVN0ZjN1VS?=
 =?utf-8?B?MVg3T2hBZXR2cWszNXlBVEpYMThGOXNVV0RJWUtvUkhqZDVvdGQveFNqTVJ3?=
 =?utf-8?B?NlplR0pnR3JyUVpKb2xKVXBSbStTdW9Xc2hXcDUrNWFGckZ2enBZcDhDYmQv?=
 =?utf-8?B?RkJIRTBPZi9sOFYxK2hJaEhyZm56bStYaHpOcW1FOEljZFA4dDI3alE5NmpL?=
 =?utf-8?B?Vk5oMFIvYkdkRTVsNXgyWFV4d0Z5LzFlL3NMRStiRTdlOUZwNTBIaXVVdmV4?=
 =?utf-8?B?dThnS1N3c01NSEt2OEhkdVB5M2ZVSEtpdVlVejBKK2lHTlFxd0FWVGVuUHRj?=
 =?utf-8?B?bXBwYlJ4cHVoMEU4cGxDbGkrZ0M5eHh1SDVWTXgzY3M4M2pYQS9UeTRaQ1hS?=
 =?utf-8?B?eGszRytLQ2FtRzlHaytqc1owZ1BJVUc1M1RRRjQxNnI5VWFLSk9oVWc4YjFt?=
 =?utf-8?B?d0JQeWFsam0wVE9Ob3Z2TU9FTXltcDVNS25EOG1FL3pIRDQ0bFdyai9JWFVK?=
 =?utf-8?B?clh3OGNsc0lZWGQyTmpaUGxpNGRYT0R0K29jeXV3emdLaUx4VkxtdEVHRkNZ?=
 =?utf-8?B?Qkx4TzU5S0lTdTdhWW1hUmFqLzlFRVR2a203MkZMWERJQmpOeG5ZdXNoSkhp?=
 =?utf-8?B?R3JMakR6UCtYUWJ0elg0V0xKU08vdGY3VEppaUlqTUFMQ0JTZ3BvdnR2TTQy?=
 =?utf-8?B?MTI0OG9qbDVWdURtbjBKZnpQbHJYb3VHWjZpMjRUbTZSODdPMVFYZy9DS2Qv?=
 =?utf-8?B?Yk1JbWh6N3BHNGUvWWZpQ2hER2NqT1FXaGgxUjl6Qi9QdGJwWW90VVNvZ1VR?=
 =?utf-8?B?NHRiVm9xRXNON3Y0cS95U1IxNUduWEJkd3lEbFovanh5T1ZrUlRPeEZtWVFX?=
 =?utf-8?B?VlI1aFFINjB5YXlYUGV6dEV6MmMweDVqazdMdWZrdGYvdHpZVjBrYkxKd21L?=
 =?utf-8?B?RkFYVU5vM2NlNllIc2pLWVhWZ0dTcWV0TTBHZ01Ea3BMMXViclBSYjQ5TnZi?=
 =?utf-8?B?amtwMEVrMlA1NlU1NTY0SXpvR0s4VnlXeEZaY2VKZ1JLNDhOWmMzKzljdUNR?=
 =?utf-8?B?ZzV3SXBVRVRZSGVxcnZaYWNIOFI3ek85VExDUURQVUJpNFAxSkU4ZlFKSDdo?=
 =?utf-8?B?Y0lZcENvTWpUMThvWlEzdTRlOUNIN2ticTltQVhTcmpETDdKUERBZVVJRTkr?=
 =?utf-8?B?MjZRM2pySUdLWVpSL0dnc0dTSTZtRlNJaDFsTTFmTTRFU0RacXNNbnRnMjNB?=
 =?utf-8?B?KzNvejlhMXhkTXRaek5hc3p5cWtNaEV4d2RLRFp4T1dkb1ByWFF4ZnYzOE50?=
 =?utf-8?B?Z3pZMzZoU1d1WGxGUUVyei90U08rK05mY2Npb1FaT0NIaWFQeVRwUlpreDFh?=
 =?utf-8?B?NnlqUmdXNVllQy9Gd1BYSGVBVUwweVNvMnphS3JwNUFSRnhJRlFBdjVpVVkz?=
 =?utf-8?B?a3hzbXVmUGw5UlJRbzdCSVhwVGZQcWRNRktiZjA3N09tSisvcmd3Uk5OS1FN?=
 =?utf-8?B?M2FmUTN3a3lxMC9sbFUxVDBRYzN6ZXlYVXY5UUl1bS9qSDBUcnJZNWEwRXdv?=
 =?utf-8?B?NVB4M1VQZ3gvbi9FRkdTTjVMeGhMZndjV1ZLbHFrQmlaV3JtTHJ0a1ptbThM?=
 =?utf-8?B?YlFWU3ZBcEwwV3J0dXlJWkdyZi94UGtMYlhseVZhejM0SmRGekpZQW80aURv?=
 =?utf-8?B?bWJiQUNvVDFSUnV1Z3VTUDc5ZC9wdWNPbjRoblBCK3dBSDFaODI0VFNscUtV?=
 =?utf-8?B?UmVsMzRVT1J1czlaVjFWNzBTTGFES2ZNL1cwdE1kczBvOFJadFZJUXlaVktW?=
 =?utf-8?B?UklhZGFUS3JWM0dUY2FxTUlCb3M0RGtIQm1HZGsvdnJIbUczMndvcDZUSm5u?=
 =?utf-8?B?RHVhN2F0ZDN4T2oxL2thVThxTVdKMWt6T0ovcjBKSVNRUnoyN2l3bEZCSXht?=
 =?utf-8?Q?8X9CTJGv97wGuN+01crYhRQ/kEWhBtziPGIPb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acd8ae0-84e4-4321-bfd7-08da53ccd373
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2646.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 21:27:21.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgwr63FwJR26PbdChbBWyfFwvBw8cwKK7IGGouq5VixZpDErrhLUjaWiGqgB9cVji3Ih4cDsnXyJdS7SFPxMVBQqJAmGUicRL+SNb539vAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2605
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_09:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210091
X-Proofpoint-GUID: l3UrrsUbDEbIzv4cIGIP0hty_k4vTbcT
X-Proofpoint-ORIG-GUID: l3UrrsUbDEbIzv4cIGIP0hty_k4vTbcT

On 6/21/22 15:19, Nick Desaulniers wrote:
> On Mon, Jun 20, 2022 at 6:42 AM Matthias Männich <maennich@google.com> wrote:
>> Hi!
>>
>> That is a very late response, sorry about that.
>>
>> In the Android MC we will have a talk about the latest news monitoring
>> Android Kernel ABIs already, but I definitely see value in a more
>> generic session in the Kernel+Toolchain MC. Is that schedule already
>> finalized or is there still a slot available and interest from your
>> side?
> We haven't finalized the schedule yet.  Matthias, Guillermo, Giuliano
> can one of you perhaps fill out a proposal then for the ideas
> discussed in this thread on https://lpc.events/event/16/abstracts/
> with the "Track" set to "Toolchains Track?"
>

Hi,

actually Guillermo was already working on that, will send something by the end of the day

elena

>> In particular, I would be interested in discussing ways to standardize
>> ABI and type information in a way that it can be embedded into
>> binaries in a less ambiguous way. In other words, what can we do to
>> not rely entirely on intermediate formats like CTF or DWARF to make
>> sense of an ABI? Maybe CTF is already a good starting point, yet some
>> additions are needed (e.g. other language features like for C++)?
>>
>> Cheers,
>> Matthias
>>
>>
>> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
>> <guillermo.e.martinez@oracle.com> wrote:
>>> Hello guys,
>>>
>>> On our side we are working on:
>>>
>>>   * Gives the support  to extract the ABI for Linux kernel image
>>>   and Linux  kernel modules using the CFT backed in with
>>>   libabigail tools.
>>>   * Add support to compare packages with CTF debug format by using
>>>   abipkgdiff and other related libabigail tools.
>>>
>>>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
>>>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
>>>
>>> If you think that it could be a point to talk as part of your MC,  I can for sure
>>> provides more details about it.
>>>
>>> Thanks for your comments,
>>> Guillermo
>>>
>>> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
>>>> Sorry for the late reply, I've been on leave and Mattias is still on leave.
>>>>
>>>> That sounds quite interesting.
>>>>
>>>> Matthias and I could certainly talk about what we've been busy with and
>>>> what are the main pain points for Android (not just the kernel).
>>>>
>>>> On what more would we like from the toolchain... it falls into at least two
>>>> buckets:
>>>>
>>>> 1. make the possible easier - stricter conformance to DWARF standards, full
>>>> DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
>>>> HWASAN) into things like elfutils at the same time as the compile-link
>>>> toolchain, more consistency between Clang and GCC debug info for the same
>>>> sources, the same for Clang and Clang with full LTO
>>>> 2. make the impossible possible - extending ABI monitoring coverage beyond
>>>> just architecture, symbols and types / dealing with header constants,
>>>> macros and more
>>>>
>>>> Giuliano.
>>>>
>>>>
>>>> On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle.com>
>>>> wrote:
>>>>
>>>>> [Adding Dodji Seketeli, libabigail maintainer,
>>>>>  and Guillermo Martinez, who works in the CTF support for libabigail
>>>>>  including kernel support.]
>>>>>
>>>>>> Hi Matthias and Giuliano,
>>>>>> Jose and I are currently in the planning process to put together a
>>>>>> Kernel+Toolchain microconference track at Linux Plumbers Conference
>>>>>> this year (Sept 12-14) in Dublin, Ireland.
>>>>>>
>>>>>> Would you all be interested in a leading session on Kernel ABI
>>>>>> Monitoring and perhaps what toolchain vendors can do to help, as part
>>>>>> of our MC (which itself is currently still in planning phase).
>>>
>>>
>>>
>
>

