Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1683207
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 19:37:27 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2471VoUK010450;
	Sat, 7 May 2022 02:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=7FswmICj4AwPXPogfuFGvVwOsFSasPgWqI1VXRf0XRM=;
 b=JyXA5W7xAqenoa0mKolJ074fdphsYJAMNcdimzUQqiUcM9rRPtC6WK0JKX3aNOnkL8mY
 4bxBfvTvQsmlfZjb+WnPHCuBB/J6eAnXW7GNc/dcnpSYGNi4nOOMoqJnXi99isjPkzU4
 TUsRxlKIziiMYs88ZL6rjuMuGX/JMDklktdpLeWaxOd4zQkjK6PAOmWSleWPcCaednEz
 ENqDIYJvi/A9SZM3IE8eUOB7olckbbPCa6kCps+1PmQag+6X2/BwrzhgSh9vp0xJhFQx
 /rn2tcfqFuxluidaHqlGJmeqYp6DXe6dTVxuaBjmnU9wo+tYV2AyPUpZAsOy15/bD65B lQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwf6c00yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 May 2022 02:15:50 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 2472B1uN033748;
	Sat, 7 May 2022 02:15:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fwf6y8pjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 May 2022 02:15:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0UB8xaZrn5OElKoLvlqRvcM+P7MfK4bW4tP8DhH61zU8m5ZT1Kc+1rNc+1bCewCZP7whD558gVdwYfn/GOiPHqSQMl/lazt947KAZqiT2RwRRPPeMFfkSnrl5BAK2W6O/PdGlGGW0R2d/wX8cstrEklgtTdzDP2RNi8gD7CgDkXLkA/6c3y/ubHnjALgTVygFjzK2844GaV3GEGKEnb3ygkQvG83Dpcd86zRtzuz3jONzzzU28IiSLxj2270UJBuqeKRN8vp5NTw6iGV5Q5fOheUiINfAQ7z5nZ+Tt/UWxqBtOn5iM2LH9+ZK9dZLb+YkD8vqDRp85OJZrr+unwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FswmICj4AwPXPogfuFGvVwOsFSasPgWqI1VXRf0XRM=;
 b=POsaTjZU6D8Nve/6bDJTZeyR91DwUqQDUy3RmcCZkTIgu1HUYXDztiRvUXHITiw2mV3Mmg1v1uVCDuKF5dgij+mbFPtoHTYHDjw2iyw6T737QgUYAmYATqixbT55taSqypkcj8iR40L0UR+/evmvksZSzuzuhdTYU0zROM/q7rYImc39Jqq8iqHMG8XnDW1Kx0TTxHDEKTQyA57+rJt9+5pxWUYv1CIrwXx93ccyKSPsVcJQa6zVcIDklBa6aGnOmF9a/UpD3OTX9TGJXkdhbh01ByHuXkozVTdX4RUVdk1ea/fSGYJwmWU4XJrcqfaYF5P+WAULcLJ8s5XMsQQLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FswmICj4AwPXPogfuFGvVwOsFSasPgWqI1VXRf0XRM=;
 b=mGkpXL5tz6XpdLrWY8+hh6mDta7YJh+RbeN+DGfsJ8JiNJ5qvA4VIVPW22LBt3DhKYHpuZRkmAOzEm1sufxNUoUiSF4gfEKtE+kut2FIRiHJqCTG5IRBwO1QPKJuiBsPA9gmpabs/YnX31OcVlRrXaFsjJK/1lSEGW1AQAD1FVA=
Received: from MWHPR10MB1407.namprd10.prod.outlook.com (2603:10b6:300:23::20)
 by DM6PR10MB3113.namprd10.prod.outlook.com (2603:10b6:5:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 7 May
 2022 02:15:46 +0000
Received: from MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::c88b:fab4:f199:fc1b]) by MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::c88b:fab4:f199:fc1b%4]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:15:45 +0000
From: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>
To: Giuliano Procida <gprocida@google.com>,
        Matthias =?ISO-8859-1?Q?M=E4nnich?= <maennich@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        Dodji Seketeli <dodji@seketeli.org>, elena.zannoni@oracle.com,
        clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Kernel ABI Monitoring and toolchain support
Date: Fri, 06 May 2022 21:15:41 -0500
Message-ID: <2651230.KlZ2vcFHjT@sali>
Organization: Oracle Corp
In-Reply-To: <CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com> <87fsm7rbec.fsf@oracle.com> <CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To MWHPR10MB1407.namprd10.prod.outlook.com
 (2603:10b6:300:23::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a373cb1e-bd7c-4d47-bf33-08da2fcf7e92
X-MS-TrafficTypeDiagnostic: DM6PR10MB3113:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB3113BA5A0CA8A5F554E0B14BBAC49@DM6PR10MB3113.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XxSE1sUJw45kj4DT3eeb7QanksuL8SsNyabqWte2M5Z3YeXI72L2/5leDvtXNfMCpykh0jIXSN+MM1a1BFF4gXQliP8eAbPZ2NwcaSH8eRDE+ge+XlLcNDh8hxcKP417BUA955HOarvoG2lSJ3aQbn4kxi3syvIwCBKqm+/sdydYXwQBWKkNNyJxI6loW/Gx60t3XH9tukHa5NynLH1QUEEVTLfMFb79382ekpbElB2MR6+OMSspN1urwI04hDhrn0K6SdihKdw9aZZYiPohzX1v+S7CyzB6NPE+ZUrmzGENaOzHVLKs06kFOb8XPvHYn40BXY7Hyq2RfDGOYLlZ5ElLCv7sqsX30ws3fx1cE1vJJK1nxRFHws62i4hGINKUJBDqBkHYN38aaJeXB0kRyHTQnx3hMs41U93p8VnILHxdh5WGtVzCNZ4uGP7Vw1k+bJ3wNDrlspi2Ksy/fsj+KvHj0EvS4KeEqMBZHZxzVcOHlRK8UbXlLvakkRYD84ZrnQYgzVilh4npoe1tWHK+Bnu8niHDVCO/5vJCA3Im7T2vsSZwQ4lg+kmwzDDx3sX2NpVTpyb0Um/IlyYT9hxuPyntAB8J00wkIdYo6w8bVajO1oqm+p+052ficlWEeeawq+nObNWthAsrsTHa4EU4Jl67f+sW3VMjk8z7phrZVvVGZ37GOGxNuwe9gTYEAH53WJ+BcmNf4XdBfJfxp813IvTsSRR+7f1F7fAsxjDkMCjeJ3CC7///+Ar0Bw6evt75aRfLAfXo0Qe5MbANHEVzV5oh/fku/ZfmNkdZhAlXJq7bGJULrUKhXz9LkRd3i0jm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR10MB1407.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6512007)(6506007)(33716001)(9686003)(53546011)(8936002)(5660300002)(2906002)(6486002)(508600001)(110136005)(316002)(54906003)(8676002)(4326008)(86362001)(38100700002)(966005)(52116002)(6666004)(36916002)(186003)(66946007)(66556008)(66476007)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ASHiafsxpgVmDnMuqRgp0r23Yreujue9sHQZmEuLYKpuETFwrkHAi4P0W3FL?=
 =?us-ascii?Q?heio5X/jSoWG1DjWvALEjEM8HWbZ50VjoovVqUh6WzAEI95Qiz+oTJJBXtEA?=
 =?us-ascii?Q?jZ1oeohVmtS14jT2mn/yNEMkLYbyO1GT9xuPLBsPBU/ddZ03N9zgzbBWPKjK?=
 =?us-ascii?Q?Qx27BTDW6NDz3QlTgo3IcO5AJNcZbK4ZNa+CiyOwsmfUyq5Boo0fZ3FGmQYm?=
 =?us-ascii?Q?SyyJG7CXqZ3V54WXJff2Dd6yQfnsHgz6B7t5mxF27KOLAWifaZlL899lRPXj?=
 =?us-ascii?Q?mrBqk+fuduPRY9pmrzhO5v/Y/leU1PX+9Vt1jDurrykPHcqHEUTkxCSt+vDI?=
 =?us-ascii?Q?9PVil86voqs2ZecOHFNYKC5uqTFr+eCGpbARi2Z/Ilbxui1zkEfJkgC/a+3i?=
 =?us-ascii?Q?eQAvRjJnSUo7J40YlOJQfGR3s31xPqfT6+HKwUEqHkvp1+NxcVH1gYdK6rdG?=
 =?us-ascii?Q?pN658s3yEVbHsH5HeYYpZH4Il6gCa/570XJ1ysSno01zL/rh0DJnF/fz1Sn5?=
 =?us-ascii?Q?2GZNyFgKOUYW2Ql/gNtegKA2ZA7u4GwPTkAVxx034M0O7FZS04IJKnHDgj2n?=
 =?us-ascii?Q?IS/xPrd8YkDtrAK2w+y305/P/2MQVEfmnlFk0CcS/YO3yyAooVPsBxQnfV6/?=
 =?us-ascii?Q?1kbbXCiGuK0Ejtd9Xtld4VW34yQ7jx2NxV5BJTZbFgPEJxqmMpZFQ+N1z0Ic?=
 =?us-ascii?Q?Lo6OZSy38wWl7PWv4m4kK3kSyFN0jPyy6O5N9763xsg37I86tud0XfmqJip3?=
 =?us-ascii?Q?OnB0CICMZlJpZhK3ZJd7H6BtJdbnP40h9ja4BX0zVcJ5GKSUmtVRA4itjPIP?=
 =?us-ascii?Q?ZgDO9i1wk4R5/BjNFvh/YQnw1LxP3zZT3K7FglG3q/wyUwYrihQSLQ035xRX?=
 =?us-ascii?Q?DM/xv/Oio7y3Lbft5ly9KoonISzyo8MYvAsTJElHVVeiaw0PpdhpQYXYt4KW?=
 =?us-ascii?Q?S9kphLOSbLM8umyCQkzwaSf6fzY11VA1rJ21aIZVTdU7YAJyC6iFdFq5Zi7E?=
 =?us-ascii?Q?ubZV8ymFW8L97//LTcaFkHuRHwrzQ1+NfEIeDx6efegEhzt37oJdYZ1ZBHhj?=
 =?us-ascii?Q?iQgpJS3s3FQj2PZYdTU0Dzas5yG2nOsLH28rb48wKclSgJPScDOv6YajZHYe?=
 =?us-ascii?Q?HgMEfUXpwLnUHeWY7boUY5YmHiHrIROyuNESB+fkhOq3uPECx+DB72oHddj+?=
 =?us-ascii?Q?ADHOTlKfYL0UF19r5/Nt/MMhfQ36tT2K+8bundIj1RzNsOrH6CkAPbFZhRGy?=
 =?us-ascii?Q?VGQSiYPk+MQyqyigKtqMdUV731+vdXPrKrzCrr1ujNnFemDlEIBnoCUCfi6m?=
 =?us-ascii?Q?/Imn8Y3jVQXGQJN/HMSojQpyy6QkTiElM5YE8mhfpkib5qTqSr/hgs2TMr/I?=
 =?us-ascii?Q?a1hZVOzvhvaHT5o7RXXhmlHVyeFuFKYuv9rlo+nhmix53N9mbkCOO2NSiFey?=
 =?us-ascii?Q?WbM3ShKPybF7X0zvr+li03ty1HUVyWwA8ygAjC93UDfmDJt1L+JOs6QS6e0g?=
 =?us-ascii?Q?FMgFRKbF908tDy/S5ew/YT//9Dj5g/AUTYB3U2O/7k150BIACzxLMcUHB96A?=
 =?us-ascii?Q?eW++MPW019wdYsmYe2sLNtSDBVwat9nbJg99cW3FHvQxWrzEQrmMzSzl3n5w?=
 =?us-ascii?Q?2HpB/RB8ODWLf6hXXhDJItMpSxWg5He6mulXPYJWG3L2AyCiT0QIxcir+wZh?=
 =?us-ascii?Q?H0BwAYwLmTYbIC7aCsyKx4FkFr34xO0ObQ6TxupWaZl8j5K9yEI6BIdUirzV?=
 =?us-ascii?Q?kDJf944s2eWdodNufqVZRyAdTRMvoCrXpzSY+kZIXmWwcNWPoiqxHVQZpx4Q?=
X-MS-Exchange-AntiSpam-MessageData-1: cBdiVf/uSUigsg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a373cb1e-bd7c-4d47-bf33-08da2fcf7e92
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1407.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:15:45.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX/ERnAw7r5Pe0fwkz0bZjcvqxU34/SNrs1tqSYsONIFDjgsbxBuzCVgtMrD1IylxJGCQmbWuZ9tDCsoD5wGBhe9WzPyzdGOHcRqdfHJ0+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3113
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-06_07:2022-05-05,2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: Gbo3dksHbkQP0eGLtxw6GwQ-JC_nekig
X-Proofpoint-GUID: Gbo3dksHbkQP0eGLtxw6GwQ-JC_nekig

Hello guys,

On our side we are working on:

  * Gives the support  to extract the ABI for Linux kernel image 
  and Linux  kernel modules using the CFT backed in with
  libabigail tools.
  * Add support to compare packages with CTF debug format by using
  abipkgdiff and other related libabigail tools.

   * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
   * https://sourceware.org/pipermail/libabigail/2022q2/004345.html

If you think that it could be a point to talk as part of your MC,  I can for sure
provides more details about it.

Thanks for your comments,
Guillermo

On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
> Sorry for the late reply, I've been on leave and Mattias is still on leave.
> 
> That sounds quite interesting.
> 
> Matthias and I could certainly talk about what we've been busy with and
> what are the main pain points for Android (not just the kernel).
> 
> On what more would we like from the toolchain... it falls into at least two
> buckets:
> 
> 1. make the possible easier - stricter conformance to DWARF standards, full
> DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
> HWASAN) into things like elfutils at the same time as the compile-link
> toolchain, more consistency between Clang and GCC debug info for the same
> sources, the same for Clang and Clang with full LTO
> 2. make the impossible possible - extending ABI monitoring coverage beyond
> just architecture, symbols and types / dealing with header constants,
> macros and more
> 
> Giuliano.
> 
> 
> On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle.com>
> wrote:
> 
> >
> > [Adding Dodji Seketeli, libabigail maintainer,
> >  and Guillermo Martinez, who works in the CTF support for libabigail
> >  including kernel support.]
> >
> > > Hi Matthias and Giuliano,
> > > Jose and I are currently in the planning process to put together a
> > > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > > this year (Sept 12-14) in Dublin, Ireland.
> > >
> > > Would you all be interested in a leading session on Kernel ABI
> > > Monitoring and perhaps what toolchain vendors can do to help, as part
> > > of our MC (which itself is currently still in planning phase).
> >
> 




