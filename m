Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7C4C64
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 13:39:37 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ID3oHN002811;
	Tue, 18 Oct 2022 13:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=4LmquaPNlqkatstGdpvkE0EIaF+dSDPgICPrcjmAllc=;
 b=P6yiSPtzsIpj1rwbWaOhDi94ljDEQbqx9gwpugDGPAY7qoOI/D4kmEbGx1vXJYId6cQ2
 KmFVpBVyFN7LvyIPEC2b1iiLQPLIFNLbxzcrQ81eN1g6J42iQ/0U+misdfvc54V3vWti
 Ri88K9fDgcLBt5w7jmgTpWFiYObvs8fVKurx/fgDw1ecvoVYqkBnfiEAx6VvJUzfXXrU
 h0JU2APAyJ+Q+qH6SuFl+zrMPubrqb5aiBLX97oQxkQd/jWY6cOKfm3KHI5BJwUf7Xmb
 BZ75YttraGtMC/ZMu0RwXN40E1l4dF3gwmhagMvJZf5WWeDQs3/WxzWQ880PrsdM3uUd cw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mw3ekhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Oct 2022 13:39:18 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29ICe1IP016644;
	Tue, 18 Oct 2022 13:39:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k8htg05p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Oct 2022 13:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDw3TSdV/gPIUzcOhAmzavyebemVNqDQqVB6GIhFuVwJZF3uXqyNhSk0HX6e7X0ozhb1jQSHbAP/pxFdLLbCOXpN49XaOY+xw2JS/mH9ehG4duTpeORJsJHwOll39F8GkQuFkHuvbpNphDtPyOle4zy5swEiX+31G2z7jaXM3RttR2IuQl/JyEbWuPbdCVIvypJ+k9SV2fNcTb5ZlBF0m+MrBgYs9Wq0FwkU/H2AsfdNEeif5PCwhCzih0JCSdqTSakyqZYOHrqCmew05cmxey9OgT9zKK/onC3k3jLRXQXzn4UlZSlZuQIkzNkCTLlWN0Sq5tbrB5BmKjG9+eaUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LmquaPNlqkatstGdpvkE0EIaF+dSDPgICPrcjmAllc=;
 b=Lt80kc9TRzSO1W5TGwHgpecxjaGkv2pXYvyfvqWsb3SD5UXZ2l9ms6OqVRa8s075sLLJs8Nc0KpA5bZLniRGxpgkYtbbcbPABSwTzWH339j6qH1e+8XfybG85qEQzqlsfStv2A4+EgEmjTjkUz9iXYFnjFXgB8qjiNLZ4p+22Auw5KmK9Tv6XyRq0t5sfORMwtLVvNvhoIlCb2Is+QxwULGA/gVMtCyfzlHKeqfdHKa+K44/nhGHoaAvAhmnUThq02f/oOmvwuNq1zkY64XWFZvy7slHR70aDbUtudZP6M3zdCsemsDTAaEYNDzU8KDP0cbW5AAa2N457f1x8SyPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LmquaPNlqkatstGdpvkE0EIaF+dSDPgICPrcjmAllc=;
 b=Y9xloMtyoU/H1P42px83hWJfrgHhdTlK/110Wa2RE1KQPm6MdCZ6P3qjwXM9GePXmgzHfBX1uLTfMai5ValVhm0W/BI0hk8CGxsXEdu16pa4SOJUeU13fBkgD995379w2P1FiXhmcHKBfAcL189CvpLWtEJkOxJ3xXtrZIA0XAM=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by DM6PR10MB4284.namprd10.prod.outlook.com (2603:10b6:5:21f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 18 Oct
 2022 13:39:15 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::56fd:b251:fc9e:aee4]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::56fd:b251:fc9e:aee4%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 13:39:15 +0000
Message-ID: <a3d141c0-0737-8653-03ef-95e09e122c51@oracle.com>
Date: Tue, 18 Oct 2022 08:39:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [linux-next:master 1304/1443] fs/jfs/jfs_dmap.c:196:23: warning:
 result of comparison of constant 8796093022201 with expression of type 'int'
 is always false
Content-Language: en-US
To: Dongliang Mu <mudongliangabcd@gmail.com>,
        kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202210181318.WUNV3QRv-lkp@intel.com>
 <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <CAD-N9QX8tHSePqzQ8QZEYmAy6XTV5DN1Q3C-s7YYeu304hi=YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:610:32::15) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|DM6PR10MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea3daec-178f-4444-6531-08dab10e25d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NkiBcHSdBKQgqU31cOpcJkbcVjTZB4LTw9C0t9wyL8AzGjlh4qXbvVzZst6sYxV6okNjMDdSft6n6GdVmproTAVb4OAFn3bHVWct1Hniafl+s2NveK4Kw3UlocrylCx3wl1F2rPrYwaar9Hx6EP+gCHZj4ztdBN69hJcOyVGxzm5BXVBlridSUweLc+6cLgzufdWUlzq2J4TvwCwbJ4UTzMoIL8ucUIyJX/Jjppeqc63a3hZRmNV3PEsuUJTIBBd87OZFI/w5IkkIp2T6Bitd1YKzeDP0O+pekHIIzs8vvw1GPhUfgWDFGBUytGEHNSS13EjCoZmkqK2LynwkuhpW7rfTDkD4U2rPXruEESjA2FpYWv1chvdBWFwt34gtbKpxB1sAGH8G6sxQKBDdckdcCGBOiMmcf57dQO2ghp93+eH60NIRPsZkZmtBlqct8/ezNn45S506a0BRPssA8zL3j0NZUuE0EuO7wPlgGYmdK1/lzq6FNarn5Mwp6EFEk6gRLu+3xcxl4RcgfhmJsIbuqIOuPDApaCliO4qUUkW+BdNafrut3qnQ8Q7OhkAYvicWGBc/AToF8/uRdDkNuNqt7A67hm0Z/N/+4W0o9+z3Ry2/rvUskgntXCCkKMqHxqa3frfDVh/dp1vuqrWXVCcEAn5exzTxdBjwl+7ETTn1O06kVlIBvKdJcZ9Vmz78eEA0asfHIKdbl55eETVseopQOofU9GpAu0fsBdGVzMt0DFJ95zAQJpIZFQqiXhDD5GEKNmwr/8fjUFCC9Rlpkq7uBIonugmpKniv18iRJhIGrB5A6sAilXxlGgAVKOMrGkYfGIU29fo6QcKKLFGGdWD+iDcxqYHwhdK37naNhy6Iz4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5738.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(86362001)(316002)(110136005)(44832011)(8676002)(66476007)(66556008)(66946007)(4326008)(5660300002)(38100700002)(31696002)(6666004)(6486002)(478600001)(966005)(31686004)(6512007)(53546011)(6506007)(26005)(41300700001)(8936002)(2906002)(186003)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU40eDlDamJWNUwvTWFQUVJYcnQxc1lmanR3aFo0em5QbDdQZ01TYXJhdCt5?=
 =?utf-8?B?MDhRc3E2T05GNTVmYUQzd1liZmxmS2FkYW9Za0JJZ1hDQVREN3d0WXMzaHBW?=
 =?utf-8?B?VnQrRjBTYndZK0FsNmg4SHpXQUFpMzQ3Ri9sNGphdlUyNEVNUnM3K2ZSNDlv?=
 =?utf-8?B?ZDJidGR0dmsxa28wd3RtVWRjcGt6Z1RZTDRCcUM1NFVFYjJkSGZ5NFphSTJV?=
 =?utf-8?B?RVQzb0hOVlF5L1h4Zjc1YVBJYXliakNvVlVlZ3FFZWtjcDRuU1RtOVpzMG1k?=
 =?utf-8?B?RnRpdEtOdW9PTExyc1JFckdXcUFoSnptNW56QUZrcHIxVlFVZk9uWjNzRVUz?=
 =?utf-8?B?WVpxUnVqTkgyR0txemRYeVlJemRGQldrMlh5eFVCVEV6cm5vR2V5c1A0RUF2?=
 =?utf-8?B?NjRGQ0htZzdNUFlPdS9mcEJYK2FIV3daVVFaNWpjQm5UT1BCSjU2MjNuQVpk?=
 =?utf-8?B?aExLM05vMUZORWsySGhmRk1BMEM0NjhZRFBmOUxwWGM1QmhTdXJTVkN3cWpQ?=
 =?utf-8?B?OTZOMnhaZ096dGlxQ1dzc1JOZThvQkZ4dzVEQysvYysyNmc2dWlnZWc1cVNR?=
 =?utf-8?B?SjFsWEtVdW12a2RJZE1rZExvMkVjNWRlM0lBYTlXWVlMejNuVW1Nc1B4VFJp?=
 =?utf-8?B?SFRMeVdxVEJvQ1BxV0tlNHZ2dDIxc05YbnMzMklkQWE0aFg3SVZrOWloMytz?=
 =?utf-8?B?dEdDSTBzZG9uUzM0NW5MdUF5SUUrYVgyYVRWRVM0QmEvczNBZVhRUGlNVVVF?=
 =?utf-8?B?RnZuR2dWTGhVWkpwNU9haUxZL29xMjRqME53dFZhTzZDNDBVSE9KdGlXR2l6?=
 =?utf-8?B?UWxESnkwQ1ZYejBmTmhadGFsUVprb2wzdG81OFk2aXpwK0JxbWRXOFMyMUVu?=
 =?utf-8?B?aVRiYXlPYjF2Qno5d2p0SXhoMEdwL3RYVEtlQnBQOUdMek54WWdVL1N0WDRv?=
 =?utf-8?B?K1JhbDE3UWpZRmtJYm55N0dIeVB4Vk5peExnMzRlRE5PbDAwNEQ5Tno1amxw?=
 =?utf-8?B?cUwvNDdXcExDT0MzWUh3RXJCQUxkSXpVV2dhdkx4ZlVZT1RFUlVVajNWV0p3?=
 =?utf-8?B?QlVreWszaUt5RkJVR2tiT3Fpc3JZZk5zN01vS2ZKN3hNK0tMZzFNVkdQSE0v?=
 =?utf-8?B?KzNTWUlVRWdCMWFDaDN2dXVvUHp2dm9CdkVKMFJjZjRhTjM0eVIzN0RqdmhJ?=
 =?utf-8?B?ODlpK2tkOGliaTRveW82T1hVbnIzRnVEL0pyL3VSamVSMUV2OFpIbEVEaCtG?=
 =?utf-8?B?K0Mxby81c2RUY3VsQUZJRTB6OUJUc0Q5bEdWa1daTEhvU1FOYmNVZWlOQTdp?=
 =?utf-8?B?cTh2Uk5vbkMwdEdwR0V2M2pHRG01WnE1WHY2Tkw3ZmdhS21oSFRRdW92Wmk2?=
 =?utf-8?B?OWNIT3dFYWRrSUZOL3NWUldocUEvU0lJcXlnbWVKTjBnbGhVUU9pZ0toT0F1?=
 =?utf-8?B?aEs0Wlg1WTQvOEN1c1dFa1NVTXNzTHZIMm4yckR4cTZUTWtjS2hFOENiN1pS?=
 =?utf-8?B?Mm5zZ0poL1p1bW9KWjRMdVBhNUdhZlpoMkZxbHQ3Mmx4VmQya0lJbGo1VzNy?=
 =?utf-8?B?WmpXdExUU0oxcWdGVHB2bm9oUFcwTDk4U1pUK0w0bllUQzJORE1PTGNlUjkw?=
 =?utf-8?B?TERBNXUzd2wreXNGTWo4ZEtNWmlQeEVzQ2hzYnB6ZWJiNkxyV252UjZLUjFN?=
 =?utf-8?B?MzBBcW9OeWd5eWQ5SjZtTnk0WjNpY0N0QkZwTU1Ub0kwcEhzaXRESXJWS2p4?=
 =?utf-8?B?SjFPdVhoNUN2MU9FeTdZc2xVcmtvSHU1dkZKdlZqT2hWWnFwRHpiYytqUXJq?=
 =?utf-8?B?S0ExK1RiK2NyQm1DNUdyVGo0dlJPelY1N2JPcnJXdUhZRzVWRmRRYlprTVht?=
 =?utf-8?B?ekZtU3hPcmh2akRKdlAvbUd3V2hObWd0azA5bGh5Vm9KYjRUeTBhQTF4Yng1?=
 =?utf-8?B?bVh5THpBS0d4dVk4bmZRMnpjdXNFUDVSRkRBMkFGdHVZbndKS1ByWW16Um95?=
 =?utf-8?B?aDhnUXFzV05lR2VaTUtObEdLTmVzWUdoR2JKUWhUY2w3enl6M2RVa1RFRE1m?=
 =?utf-8?B?dVluRjdoQ3NoNUE3MDlsT2lrb2VxSnZhT1ZCYzZuVXQ0cVIrZkdheUxNODVE?=
 =?utf-8?B?Wk9vWHpuRGRvQVJRTy9OMElnS2h4OFZsVlc4andyUUZjVEp1dW9Faml5NG1T?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea3daec-178f-4444-6531-08dab10e25d3
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 13:39:15.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cz0JIgLwZjmC/dfSfdfiX1at8xHfY6obFbulg5r1zDFRJ7FA35M+TMOA1gdbpt219IGd2F2f3BbDg87ISIpA6aVG/Xvg4B/jL+iDbEX+4yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4284
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_04,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180078
X-Proofpoint-ORIG-GUID: AuSIn-jshTVsMSFO8oJjTdQhnVOL8Yyl
X-Proofpoint-GUID: AuSIn-jshTVsMSFO8oJjTdQhnVOL8Yyl

On 10/18/22 3:11AM, Dongliang Mu wrote:
> On Tue, Oct 18, 2022 at 1:50 PM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   4ca786ae6681b90b0ec3f4c55c89d12f835f8944
>> commit: 920f4b7e923b35fd9d117fd3cb616b310cd41010 [1304/1443] fs: jfs: fix shift-out-of-bounds in dbAllocAG
>> config: mips-randconfig-r005-20221017
>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install mips cross compiling tool for clang build
>>          # apt-get install binutils-mipsel-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=920f4b7e923b35fd9d117fd3cb616b310cd41010
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 920f4b7e923b35fd9d117fd3cb616b310cd41010
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/jfs/
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> fs/jfs/jfs_dmap.c:196:23: warning: result of comparison of constant 8796093022201 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
>>             if (bmp->db_agl2size > MAXMAPSIZE - L2MAXAG) {
>>                 ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
>>     1 warning generated.
> 
> Hi Dave,
> 
> I did not double check the upper bound of db_agl2size. It seems the
> upper bound should be L2MAXL2SIZE - L2MAXAG, other than MAXMAPSIZE -
> L2MAXAG.
> 
> And L2MAXL2SIZE = L2BPERDMAP + 3 * L2LPERCTL = 13+3*10 = 43.
> 
> I will send a fixes commit.

Thanks for fixing that correctly. This was my mistake, since that's the 
value I asked you to use.

I'll use your new patch.

Shaggy
