Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0303630AE;
	Fri, 29 May 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063737; cv=fail; b=nvJofbD7FibEUM3nsd+C1mZuCzGGHA0LNhrN8uZ1pvfkNl8AqnpAnrNK8exTr9wGuAyafu5SnWSTx488EvM5oemh6sgNqoHcLlQe8lbjr9XmJgywhpWfa3upp/HqzO/U3AatFnz7Py1h3QmITlr2temubtWTJx9w60U5BtP44OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063737; c=relaxed/simple;
	bh=SHcKtZxM3vHL4sFSU3y+6MBiXqdQRT+2CjvbNGruK2k=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=WBCrJ2Qm4NPyZJdZFbHw42RvLS1bekcDaB/7fPX9IHut784O6t11Uert9kHBMurHDCA8K+ubGtUsVQJttAn8sqxotZeAJMYGxRA+FLTIKXF8PlVTAjrBG9tPu6p0B8Om5ZaUkyMCdU34HZ4d+Q1ZbYol4NVPyGaHG9Q5altP74Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M9aLnKIm; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M9aLnKIm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnK/XQ9ehnTr0vOapBYfs/eUX/oSbfM4WWjCSn07VGh2iYoE01tmKw132i7t9wtk5dEHkejDXZzGF3eEkVpuYBRnUa/hGFM5Pf9rTfhgUqi8Y427p2/v96739EtRTPPaDRLuYpVTUnwvkSaRamxUQ4M8BkzurtwS93xFKc+JS0qirE7mGGiQVJCjk+LbJOMEUV1tme0Bn/+DCESFSe2Y+XO+dOo+xqvjfHYNc9swTMxPLHAn+rZS+/QY7gv3wpVNNiQD0eUD7k9PLyVGLTqtEHEYx0rjucdT0MvieOXdNaYKWPVfhqwxl70Me3X+ING/5fzeCQKV09TRQ1SOuuMolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUPUmXIidGYk+9mCHHV4UlYlvrUq62jbfK0VDe1BwDU=;
 b=XDXHdvm3O6xLN9GWJa+fg7qcLyg6cEl1a4s25gzW8rC4yCL3Sj0KcXCXyviKH33q07BaGjrfgtriBrhfyiC8w3NJ8SFZfGrslJS8trYsEADpM0PWirDlEcSgbhbZc4/wZmlMir0tne/R1PU24s/D02rVT9GAaGMo2nsB2fbr6lb8uTe0c7LP+JlFc0Nw7Fctk4ZmCwbYoSu1AN0ckABBbDWgNiLWTdJ6kHTqvtmNKHhffa9VHe+UfaX+0PU9nDeqWT2DOLYzq7irOKcVO4kNNxdytgzzm+3wAWZwfB2F6hlQLE+nn2uaJmzAEmoHd/pbralbzDg0gNC4flq+ls4Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUPUmXIidGYk+9mCHHV4UlYlvrUq62jbfK0VDe1BwDU=;
 b=M9aLnKImrEBcu/rZcW8YZcRr6wyEC86zxbdqXclidnPMN7qEfDw9GFwCOXM3eOWIou/S+qh+ncrJvinHZsrnch125qo9lJBtkQy+OewFAFSC59Kfj7DQyxHbS4B78+aXK22q4Rdn3QXgSj2wfYd8ENDPCLYdJxgvpIPFByIdcrv5/3/WDZKNGfI/2kgXzN2fWwWsT2UakLYEzqm80lVZEwYfce0OTCfnmYKW92dLSkLLvBly+DFwb4atJJmJ0EnWMW7CQs/aXHUHoNe6COMxbQJbTScQ5YdJPtZWJSWexzK9V070MnUvqJ3b+Td1HxAwzME0oeSIxFlQfUuiz5tG0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:08:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 14:08:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 23:08:47 +0900
Message-Id: <DIV7XF0O2B5A.QMQBUMXB3EJP@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "kernel test robot"
 <lkp@intel.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
 <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
In-Reply-To: <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
X-ClientProxiedBy: TYCP286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV5PR12MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8aab61-0623-46f5-b59f-08debd8bcef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|13003099007|4133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZtUvexgOHLFygnxKgqt1xqR42pZqwElGv1UVRsTxqP6Uy9wWLi8I1KG+QBCoMIYoYCO3cVYnbBgtSWawFGRvUb4SodUtNGPxRD+po8je6w1Uv+4tOXzqUX/nX7CtPibr0Gaw/tgqEfrQ/+5MOqOKVu/r+jGCIPb79lXfVqBMbJYGbBSrI+IkH7YQpdxDkvtV660zQbuqh9wj7RDFz2v2Mr+CTgKJaSLYaAp9FfXliT6KK/jtMloeLXfyVtfBQEqLFowzsGDitzoZk9oARmmxpC6joUCisthUBx92M2FP2wares08aqvyvRJNABw4i3fyUn0hiQfeWEo8n9MmkeGTbh55ItBbd5moNr7BaBQhy8M1FqtTWfyEbt3b0VO152cEcpi8V99ye0y1krtlrnkDHn4QfxsVA6ip+u75ObhOB43R4X3PXh24DH/0viJxT3W7/PdOr8b+pv55SMfhBZG7qojl+kvfR7c4QDDaQDOqV4JZ1kFY7Us+DddWP62PKrRvwFfk2YnFPM31DMOojQzeRIkTpSTJlKghA3xs0AxQbHV8InHXE5D4BDtejtsARFWDl7TOUECUwvLXjrhxtNpSZ+39zbw+0r877VXasjJNqxpywjxktKvrIW8gCTvhgXU+R7NX2/QjM6fABGXG8NbV5Qlf95QAzlLBFWtZy+H2Apq+40GY87wFAKsyK2VmIXuu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(13003099007)(4133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1BjYVpEMTNuTk9ZL1pkR3dCUDJyWW1WRVVMZHZlallBTjJyZEZuQk1pYnVV?=
 =?utf-8?B?K0ZLaGdISXhnSUpGRkRmdHYva3V1bEtsSlpsMTlkbXhoanpMUmJJaFRlQVlu?=
 =?utf-8?B?NlF0MFJQQUliYVZSMVYwQVVWZ2tyRUxzNElNckdPL2JUVldZK0cxRGxibC9U?=
 =?utf-8?B?Q1F0UjRFZU1VOUJZQXlCWGJjZlBZRU1zbHBDYm4za1Nsa2h2aFlTRlFHSXZK?=
 =?utf-8?B?Vk5qR1dCSUJDbTJCUStlcUNnVSttZ1VRUS8rdUt6QXZoa2hOdHB0TXhqc2ti?=
 =?utf-8?B?VmhqeGxZTkxTd2dNeE93WFV6Zzhib0NRSDB3cEJaOWJZQytzQW43TFJDd2pN?=
 =?utf-8?B?L1RqQ3lwU2VyNEd2K2QwNk00NWYzZUdDR000SDY5OCtna3VucVBLTVJNeWhW?=
 =?utf-8?B?VHovZ1daVEVpYWRJN011RlI0YXpuL1UxY1F0OHpkU3F6QmM2SlRwTWVNNkto?=
 =?utf-8?B?UU1veHY1cEEwaEF2TWFnUUV5STlOLzVPcnRRN2V2US9TanhTaXorTlN6cy9l?=
 =?utf-8?B?eFlkZjZNTHBBOFdNdGQrNHZGcmF6eERmVEhBYlFRRndBMURIWHdFdGt0aFNN?=
 =?utf-8?B?cFdrdGpqeUs1L0pDd0RRTEJOYXdud01QOUZvZHVmMW5KZzVwTjJveUJPWW9q?=
 =?utf-8?B?VlBEOEc5dCtXVGJOZUpneklzd3JOeEFOd3BqWnNZZVpCV2pSdVBlUk0xL1Ji?=
 =?utf-8?B?QStITHRCY2RsT0RqekR2ZzNEMFNyVVo5MnZLN3dkb09ZbDFiQmM4YlB3R1hI?=
 =?utf-8?B?WVhzcFhwcFBQVTd5MHEvZ2k1SXIwcE40bFZ5SGh5dDZoWElmZEMrdk9kNFdu?=
 =?utf-8?B?Zm9mWmtnQ3IxUGJoSlpZd0R1NG10QVR2U0VNNlBya3FHTUxONTdUbm1jWDht?=
 =?utf-8?B?NmNMcjIxWFAwM25MU0dQSWdRSjRnQkxyUExLNS9hYWpGOC90UEloT00zZEhB?=
 =?utf-8?B?b3NWcE9FYnU3bXo0Q2owUmEvaVBEV2tsQng1Qi9FTjg4WnprQVN2RndxR1VU?=
 =?utf-8?B?VzhkN2d5NnJramZRdklaOFFPQmJaZnpiUlRGOEViMStiVTN4NTRMR2RCOG1j?=
 =?utf-8?B?akpxWmxMN1lmYXNnR2ZkNllNMGlCV2tlc1NVbTBPc1N1RVo5T2JBZCtvRXZW?=
 =?utf-8?B?NzlUYnlzei9Kbm5wWlVFNm9ZWWVCV2dtUXZUaW5weHRDK0xudDUxNlgxdVNF?=
 =?utf-8?B?TFpTVnhPc2hhY1ZJVmQrNmxyK3VycHBuLzNTRDJiZ1RlL0JzQ0FQY0xiYTNn?=
 =?utf-8?B?TkYxdDhydHNnSzJBRXVBbW03VWV6RzVpTHZsSnZuY0ltZFNWTzNUeFA5ak5T?=
 =?utf-8?B?YnNKV01mZFJORzY1RVFsWTJZeEF4cVd5VndzeDJCS2dqRFZmMmRaN0UrYUxV?=
 =?utf-8?B?QndWZVBzazBmVjNWUzRtMmlxZStYU2duaERJNzlHb3lUWTg1YTVBT3ZxSTE1?=
 =?utf-8?B?cFIrWXozNDZPYUJhRFBZbXN0U3A5WC9uTlRseW9lOGRpdkVTUTM3UlorWmpJ?=
 =?utf-8?B?U01xUGdZaUJMZmNrUnRZT2hZelZ2c3ZVYmpkZ1A1Zlh6cEh4L1pGVDdNUGx3?=
 =?utf-8?B?NUFuWjMrNXJLeWVSblIvRDRldEV4dnZzYmt1cUVRcFZyeDRMcnJGM0tDRHRJ?=
 =?utf-8?B?VlNLNCsyNEtieG1WUDVsVjRZa2pFeUJNZklIWHNHdmZxZG84OHp1bi9BOFUz?=
 =?utf-8?B?eDdsTlBXdHkzZ3hUc1F0NnZMMHRTdUV5NU8wdk54Z3RlRVN6RWtCVmdVZjVs?=
 =?utf-8?B?djZKV2ZBUlMzeHNVV25IMDkrQXhpTUZFQ05oUlNFR1JyV0J1VmhIV2VTSHBr?=
 =?utf-8?B?TStCMDhUaXNMbW5rZGFtcUNSZmcvZ0poM0IxRnBJQ2pBUVBVclRWK0t4Mlky?=
 =?utf-8?B?Y1hCNjc5ekljTjVWbllhVzZaMWd4Uk5UcWVMZHNzMG9HcysxUzVTcU1qVlZX?=
 =?utf-8?B?S3RiZUZIMzRrNUptbWdkczV2eEc0cTlYcXRzd0wxWTBqN1BjYXgvRk9UYXps?=
 =?utf-8?B?UkJwd0pyS1dqR1hKMHZSVUdNOFRvT2JkVzNlNTQxellPNHJnRlllU0trMjEv?=
 =?utf-8?B?MDZtcmRYa1ZyZFYvenBYZkplTFFvVjBwQlVEcE9MSTI5SnNSYm9VOWJqbktn?=
 =?utf-8?B?cnNOWnJIbm5wY0NzMnpweVBEbjVyRjVSVWFoVzhJOW1ockJ4Z3pyNGRwdDFo?=
 =?utf-8?B?eXhvbGk5YjdmVFVpSTc4akhsbkFyYjYxV3BRMXNISXdjRmJMd1pmbVVJK2NF?=
 =?utf-8?B?UkFIVnhuaGFNaUJMbDdORHVHMDNRMTY0eTFWeVZGVjdlVE1zVjZHWm55Q1o0?=
 =?utf-8?B?S3h3bHgzUDdsa1Aya3ZBWkQ3STVLRmdKU3BnZ2pBdTBMdGZMbzM4cjB2aXd1?=
 =?utf-8?Q?CakKTvsWjZPK+DA8oddz+sqm8rfoOFh8aV1kZ6dLKXTxB?=
X-MS-Exchange-AntiSpam-MessageData-1: WTO017xGV2zDpA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8aab61-0623-46f5-b59f-08debd8bcef8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:08:50.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhtW7TdP7vNQrtVsKCyDsUK+lOGoE/jBNDcczF2FectViASzWHUYG3TFo0V19FharXjoWcGSGnzEbToLeaF3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9803

On Fri May 29, 2026 at 9:13 PM JST, Gary Guo wrote:
> On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
>> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
>>>>
>>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
>>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: =
auxiliary: add registration data to auxiliary devices
>>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0da=
y-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>
> Ah, OPTIMIZE_FOR_SIZE build, it's always this...
>
>>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-projec=
t 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>>> >>
>>>> >> If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
>>>> >> the same patch/commit), kindly add following tags
>>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWv=
LQ-lkp@intel.com/
>>>> >>
>>>> >> All warnings (new ones prefixed by >>):
>>>> >>
>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_ctor+0xd: call without frame pointer save/setup
>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_dtor+0x1: call without frame pointer save/setup
>>>> >
>>>> > This one looks like this bug:
>>>> > https://github.com/rust-lang/rust/pull/156980
>>>>
>>>> Does [1] work around the problem by any chance?
>>>>
>>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d5=
5@nvidia.com/
>>>
>>> The asan.module_ctor error? I don't see how it would work around that.
>>
>> I was referring to this error on the report:
>>
>> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabP=
lh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDat=
aNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEIN=
tCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5Er=
rorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InP=
laceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newN=
tNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name to=
o long, can't create __pfx_ symbol
>>
>> As this patch might help shorten the symbol.
>
> https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e20335=
ed2501@garyguo.net/
> would also help a bit with this, although I'm not sure if is sufficient.
>
> Also, regarding your patch; do you need `#[inline(always)]` or is `#[inli=
ne]`
> sufficient? Inlining shouldn't be forced unless there's a good justificat=
ion.

So using the config file and base commit from the report, I get these 4 sym=
bols:

samples/rust/rust_driver_auxiliary.o: warning: objtool: _RINvXs5_NtNtCs1EKt=
woKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe_u=
ninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCsfAKt1AHk10R_21rus=
t_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_in=
it12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3y_10___inter=
nal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPlaceInitB1L_E8pin_init=
B4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNtNtBX_7convert10Infall=
ibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too long, can't create _=
_pfx_ symbol
samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvMs0_NvNtNtCs1EKt=
woKEMO2_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecI=
NtNtCs1peUGmbrgHn_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCs=
gkhUnUyOK5q_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB=
3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCsfx=
cgfq7FLKi_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6Op=
aqueNtNtCsge5g75tgsAU_8bindings12bindings_raw5mutexE8ffi_initNCNCINvMs0_B8_=
INtB8_4LockB15_B3Z_E3newB15_E00E0B6b_B4x_EEB2G_: symbol name too long, can'=
t create __pfx_ symbol
samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvXs5_NtNtCs1EKtwo=
KEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe_uni=
nit11MaybeUninitINtNtBa_7debugfs5ScopeNtCsgkhUnUyOK5q_19rust_debugfs_scoped=
10DeviceDataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPlace=
WriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitCl=
osureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7con=
vert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O=
_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_=
B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create _=
_pfx_ symbol
samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvXs5_NtNtCs1EKtwo=
KEMO2_6kernel5alloc4kboxINtB6_3BoxINtNtNtCs1peUGmbrgHn_4core3mem12maybe_uni=
nit11MaybeUninitINtNtBa_7debugfs5ScopeNtCsgkhUnUyOK5q_19rust_debugfs_scoped=
10ModuleDataEENtNtB8_9allocator7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPlace=
WriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitCl=
osureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7con=
vert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O=
_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B=
27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name t=
oo long, can't create __pfx_ symbol

With [1], we are down to 1:

samples/rust/rust_debugfs_scoped.o: warning: objtool: _RINvMs0_NvNtNtCs1EKt=
woKEMO2_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecI=
NtNtCs1peUGmbrgHn_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCs=
gkhUnUyOK5q_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB=
3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCsfx=
cgfq7FLKi_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6Op=
aqueNtNtCsge5g75tgsAU_8bindings12bindings_raw5mutexE8ffi_initNCNCINvMs0_B8_=
INtB8_4LockB15_B3Z_E3newB15_E00E0B6b_B4x_EEB2G_: symbol name too long, can'=
t create __pfx_ symbol

I also tried to apply the patch you listed, but it didn't apply on that
commit.

Now as you mentioned in [2], it is true that if we prevent the creation
of types beyond a certain complexity we are dooming ourselves to an
eternal game of whack-a-mole. Which leaves [1] somewhat in limbo as
that's the approach we were adopting to solve the same problem of
symbols that are too long for modpost.

[1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@nvi=
dia.com/
[2] https://lore.kernel.org/all/DIV7510GLW8P.1KP88LYA360IC@garyguo.net/
