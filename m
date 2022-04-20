Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B89185B
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 16:02:51 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KEiXtD019340;
	Wed, 20 Apr 2022 16:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QmI+cPFUgsw/uuGbp+vSW3wphZNeIcJrP1KfEnr+I4U=;
 b=dSYFGplC5AhQTwTS6p2eDDHLcmGilVuXaR19APGf/q6Da9xUIuKPimxCv/392/Ktc9y1
 UZXHW1Q/x3MVebbU7DRz4A3js6RLXGVC5IfNnE+kT/zB+C67GHNbEI7UzszbJuaDx9rc
 icqOlr8bqhNVEXpCdC4dpK3pmUJ4bnzIXLjzVBbVwWV4GfIs/6Wu+wPdn2/nuz1+qzPo
 9UAQNvsmhs004dE7fddS9ryDEePTqS1O06rG+UInLgibwNYMCLqLcZoDOwOgP26tF0dl
 vbdhEt9J5nyCvvj06z17C0zFD61UGEVOEqs47YsUxFxlIS0TdkyPN9Srhgok7dxvw5Wl PQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ffm7cscfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Apr 2022 16:02:33 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23KFueZK025802;
	Wed, 20 Apr 2022 16:02:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3ffm87cru6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Apr 2022 16:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyaLhcuyKFpUQXC3RE3kIQ7w8a4rq9rYLjhche8mM4wTnol3WRG9h/U+1JI0Y14M2czRKzkdCE/UvkRlF/9wfwyxiiDQ8ha9PnJSh2r9lo4TgZ4nmy6ORijSfIgMjovqyMvZUErUgIW1j5ftMcGpD7fzxzJUAMDAAYUeAZYdVcctfbYIeZqHIAM1u0g2pvCtvr4woIn1aAxwDvYiRUvGMulfJQpHBtZGMjD7rBf6MsrRVcTN6PgZfl8KTOBPUvur4YLcoQiPAFSEeRQBqFggs+W+ZIwhxopt2q/uwojLwvXSZ6qz0zj8KOubslVGV78S9/yNaQRzYnZRxbSd62F9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmI+cPFUgsw/uuGbp+vSW3wphZNeIcJrP1KfEnr+I4U=;
 b=PESwhccOAVFu4KXTr0WzMTgu75jpqilpibRy8wmZMNAWM5uwwtjerJ72ehlMUtFtA4NL2iO7OQzSmJK/xBpKvJqvZt5lzAy/+Aa5b2b+Hux2oJnzqL6dkEU2O2fHszhDcvAiNTavN4M6hy8nEz/sz5B7TCVV4eroKhhCJVwN/er7V5Z6QL+t/0JDoD0toVQkIs7IhOw8/rfo5pM+jZ7iDg0ymds9I2TBmPOsgxoC2J74jNvbSzL2t5nS1ATgNiehFKD/2YoD0h5ZwZee7nQfEotFH9sGscvI78ffeFoXF7ARMVSv1UlurQW55I8fGz34/uaz2i6Iso+A102ndgHD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmI+cPFUgsw/uuGbp+vSW3wphZNeIcJrP1KfEnr+I4U=;
 b=q0o04QKz90S6shpXBp4vkRu2jxWGRH49PNnYZvVWqUWHWRwqQiW+xT22uG10Pf0BQw3aIu3lIl2M2pZHHG32jKnKLxMj6vah0mLc5tkmLXsU4KVTPM6ySl2cylz48NCqQWPlWRnBheZvbH89psxWWnKCTDRtM1nLoXIkjNN9J9A=
Received: from BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 by CH0PR10MB4939.namprd10.prod.outlook.com (2603:10b6:610:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 16:02:30 +0000
Received: from BYAPR10MB2888.namprd10.prod.outlook.com
 ([fe80::2d3d:9993:9ca3:b9e9]) by BYAPR10MB2888.namprd10.prod.outlook.com
 ([fe80::2d3d:9993:9ca3:b9e9%6]) with mapi id 15.20.5164.026; Wed, 20 Apr 2022
 16:02:30 +0000
From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthias =?utf-8?Q?M=C3=A4nnich?= <maennich@google.com>,
        Giuliano
 Procida
 <gprocida@google.com>,
        "Jose E. Marchesi" <jemarch@gnu.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Dodji Seketeli
 <dodji@seketeli.org>, guillermo.e.martinez@oracle.com
Subject: Re: Kernel ABI Monitoring and toolchain support
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
Date: Wed, 20 Apr 2022 18:02:19 +0200
In-Reply-To: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
	(Nick Desaulniers's message of "Thu, 14 Apr 2022 14:33:17 -0700")
Message-ID: <87fsm7rbec.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To BYAPR10MB2888.namprd10.prod.outlook.com
 (2603:10b6:a03:88::32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8a92f4d-6d83-4372-6fe3-08da22e72c17
X-MS-TrafficTypeDiagnostic: CH0PR10MB4939:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR10MB4939DFF155EAFB18B77C3E2294F59@CH0PR10MB4939.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ugk3wuiLYzrEdTZPCjaJnwO3YK6R7ismNTvsQzxRv1qyWUrKuOdxn6amoEigf2YesjXGEbd2KsGx4ibf4wVSUVPU/Ls8pu7MqRyiyWRMZkbOp3oy1A3v2hS2ese6VAvAnIodHLy5t7ccXlATyq8ryUyyRIk7GUXoeVq3G8W7AwgXB4WgUesslsFf5QaAJnqd+uIiGFA5wq2JpxW7Uj59hz6vnxoAoTrkYpTjOBwE6YLtjwFpODdF/g5p6oYwLoMOjCQvRrdiGQwZoPzPvS2ZMcfHYC59EOywC9+mnrp3RHkzz8M9QQrGLc5NkrwNzm3CTk3rKYTKOKe2PGMFbm02pZYChekqlDfqomT35Z0+vnebbLkBrn1lmAqGEGQIZavjnRn+wmgSfZ/l7TSv1U9gajeuFKJ982hdfAIFjq3HXwO9/9e+DUvSKppN81jSrOV3JBGfj2J8UhXdxV4LKx/AgKfqF2EnrqVvZV8LNZfaRN3pNJ89UmnKZWXJyUVoCvuvsD1EC2POEEzREF1gtq96pgOMtnBobahU/QamVRfGkXu2sU4/wQlUyRSf1UZVgKUx12VCsQrTUJlcaiUzXybOeQ31uG4pwssJbk7lp1BgsGm7pgqldBo3uTPF7cl0mo0SMcaaB05/ArU8ez/8rMi9EKPV/IdS836IdvnWoMnpgARNeazyDDyHx+HCA6LLZX6pvKc0bZp269BPDfKDrpfjNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2888.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(6486002)(5660300002)(508600001)(2906002)(8936002)(38100700002)(38350700002)(6916009)(54906003)(316002)(86362001)(4326008)(8676002)(66476007)(66556008)(66946007)(6506007)(107886003)(186003)(2616005)(6512007)(26005)(6666004)(52116002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uA0MnRT6ZzKf/0L5xifUQU6yzWS3mXp77WKx0ERU9AeVGHqzh/lQXkct5gZu?=
 =?us-ascii?Q?+2bmTLrPnX+2I8qyJRYZ1lRVu5eq2DkRmt12Ha3TuqLqZXqBtTzvxyBgppPF?=
 =?us-ascii?Q?LlIEhykVRwf1a0Usnv1gUZHD9GhP5NsE4AyhlSueOZaJkVtwJ/9EWodolMAZ?=
 =?us-ascii?Q?c4EFb4q6pA9VfN2z1Khrclw2br2cXPN+ONb6wRPnMOI7zB5czuIzxy4hylfZ?=
 =?us-ascii?Q?uAPp4UFCj/Kl9sKCs8sQF4hWSZ4KUviTEukKRhLhGWGfA0tE4qiqWuUYY5SP?=
 =?us-ascii?Q?/1u32eJ+8zBiKy8/n1W84wmd5qUMtsdj8havkOFPwbdCd+0pZey0baLWKw1L?=
 =?us-ascii?Q?suW6kv4NUStjCnXr2ustPQbSg12HCXVaONU3HXy6e4KeIU/1L+hGC9Nu2q3U?=
 =?us-ascii?Q?QIVYC6J6JoHszC2FwdTQ2NR+Q+E0Jjy20NkhU8I3kQg3XMTg5X+joyKFxT9x?=
 =?us-ascii?Q?rGVmxWctHyglwj/4MnX6vCSXiut2cEXfHzPVazCX0bUz9b/UzSr64bB5Op2t?=
 =?us-ascii?Q?g5ml9EgpjxkGTMynLovzT6ztid7uUrDmXgJXJLLaYW/whbNQ02YmiclC/fjY?=
 =?us-ascii?Q?97x5xB0S2dd1ex9ZDnU/LjPDpscuj0UZaqUXnxKlL/6HZWRcCDPgeHTqovix?=
 =?us-ascii?Q?KZBSx2j4WmjaVrTwBonBeOcsj4HJfX2gbNYj5Udelw0mtxEbWYvyExg2ysSJ?=
 =?us-ascii?Q?sMviy1vKEqTDW80PHjGHhfrCEeCJ7QbFiOgicDHj+Hful+yIMCv0Ykhnu7hA?=
 =?us-ascii?Q?Ain3jtPfUotIyiu3+dwvpFNHdPPmFmvUXo1F54W7dQZ494lcPHTO9XbqsvmT?=
 =?us-ascii?Q?PS+mpwwALx5nIy3HHSpKqaBBfvxUJzKgTJ2uIEwxg5RZFLALxjSWCSth0+tP?=
 =?us-ascii?Q?8k8wj2ocd7jB6Bu57Z7IxnSvteBbwsD5p5U8eAb2dMsrIDRGGVwdHNc4Bkr0?=
 =?us-ascii?Q?EddUtKyRbTLVCIYCPOr6lNDTaBNs0y4xjzavh6M3/tZtPkyLHYkT2r8xUhaL?=
 =?us-ascii?Q?snyY6SStRRiGDRYyrgPmZ6koPP1FA4jeSOqNCbgVl26ZhacfSkGEC6ZQeJyJ?=
 =?us-ascii?Q?t83wVcjsOslJYq146baGHb7RqvfHnJDuBMmY3aRJvF5i9B4rI2/U/J/ZxuT6?=
 =?us-ascii?Q?1oypT6Z5VEYxRzM1xf+TtKF35LljLQnq0ZnFgU8JKR2j8dOwa9DWV5Y3eyeh?=
 =?us-ascii?Q?6anewRn6Gh4OEJH+j5JfQqAemG/MF3D57KutdLSlFXuyiVOyxcGIw5KoI1BA?=
 =?us-ascii?Q?Rzj7B+lCxR8SgzC1bWpQWn2I6FTtJeTjthERbw4J5WvT69H+5VHLe+u3e4FW?=
 =?us-ascii?Q?uhHWdDWxGOQszeSXWSgiFEAVBdsP+svjAjclrMzHsF/SiLdb2Q9U7eGopOs3?=
 =?us-ascii?Q?VPBGqKlJaZf245idzy78QBBevgD5x6PTLBM26kJJ0e1w/O7mMCAuuBFHv4FK?=
 =?us-ascii?Q?k/I6ommfGOHFGkeF4gIUkQm+TBmrxIczumkroLXLEaYnHtMSBCfQq4GE3VZO?=
 =?us-ascii?Q?pOmQXmjoDKcC2pNa1WcAjhqx0JOCC0iFT1ovUt/gvMJl4bm5iSWgoY3KQkOw?=
 =?us-ascii?Q?eTP/TFgeKsTO+aprD5Arh268JRHde9pO0TfKylUCFIGgK7hFJ/rCsDR2kj+D?=
 =?us-ascii?Q?nxt1JoS3o9PBeySj9nJK5IHVi+W0uNZurYP/aYZXRyqBt1T3DC4kR1K4kXSR?=
 =?us-ascii?Q?UyBWjWoD3RN7drRVESeElgbPtXUN1D76HaJ2dkl+3HhdZ6x0hbnjRhTe6PXW?=
 =?us-ascii?Q?WcDMZAxtCDsmf3tBuqwNscCnpoIBP8Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a92f4d-6d83-4372-6fe3-08da22e72c17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2888.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 16:02:30.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHb9Ox+zgzkzPTA/tOPnHM7pf4b9zJLIsuCfTtXvp3FPlXvfog2HJ6zHMSG6tPgLH/NqiKFyFXeEIZDoZfur/qWoficwC1YWvNDwe5kgwts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4939
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-20_04:2022-04-20,2022-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=518 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200095
X-Proofpoint-GUID: Jc1MLBj76_DNc2JB1bRQoUd7AZ-SGU66
X-Proofpoint-ORIG-GUID: Jc1MLBj76_DNc2JB1bRQoUd7AZ-SGU66


[Adding Dodji Seketeli, libabigail maintainer,
 and Guillermo Martinez, who works in the CTF support for libabigail
 including kernel support.]

> Hi Matthias and Giuliano,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
>
> Would you all be interested in a leading session on Kernel ABI
> Monitoring and perhaps what toolchain vendors can do to help, as part
> of our MC (which itself is currently still in planning phase).
