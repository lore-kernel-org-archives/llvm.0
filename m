Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616C3E2768;
	Fri, 29 May 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063261; cv=fail; b=mR4gl7/i0WQ6QhE6wzbdFY+9kvfZNnnDUFX0HMuE4JC/IY/cqk8+AeoAZs1dQLApANQj3IUOOXKVyls9HEedmjw2mdNauhqPg/WQCr+ECjegvF7PNKku89GT3JwGDIER4qEe1FLZo3lo+ooJzwv6WAvJ27m/SlR0znRGe/DZPOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063261; c=relaxed/simple;
	bh=2bDAzQRqt47JS52QrifyaSezpqKSvaZyXLAL0QAwupA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=XOgVjglTL9RsRBK25+7B6m7bI0sEnambXu3ykkDHPiLiyTbc3YaTWU68N4vEIysxqR9LDBDBM3qX7D3z/LrjePrFLBA+Xn3AaVn9b8out+gJn0YTuGFUBQbPmnxCfn4rh8XS+26c9m9HkMsEYyLIxOhpQY2Zy6/pbwQqrte/Uxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nVaEUd0/; arc=fail smtp.client-ip=40.107.209.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nVaEUd0/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxnxkZyW74IuX3Jm8lDQp/Fox0cZlCrs1S0wH0Pzvsk652zFvx07iT1OLO5HvOtRgLejSk6bhCKBaV5rmPjAqIyKzD9k/4riSi6O0hnJoGtlkg6MIebOTrqHYG40wxuU6cwzTCLbux5HPJxm7e+DDHsioo48uaep+sH1iQlU/pFAwHw5axrgTINMNQIsvTXQIT5ANaM5vjG1q5wUp/Mc9+hHYRUE9fJxyJhNB0IWJqxnL2NYRXavBD/IjPAPqm2aKZ9IXVvJOOn30EsgVDxYWb2xH2FpsEstvHk7Rd5O1GvhZWnGjOLPgHKeqLqGFzFhk8wJVs/CwjX7sThAk7LgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYFtNoROSaILWdK1mO3aOYR4YldoEaeWJD9tj2roWG8=;
 b=WX55Uv5LtIWmYl4nkTVsk6g9OQ7dkfrfNQadtkPjYqM4dadPuJL2RtiDIWN8oyh8qimZjdg6fAVKOZ7Nz2/5juF0nqW5Ei/Abh7xlrHhY0aN/CgRDELlDsqlrbLxJOYJ9gqxmkzmhZoeRy8cV/bL+GmZ32rKF2hj/GzJEbWBxWwTykOnx0dqR9w5qtyiEr5aqHjWNtcyp/V5RKU9RdREyvTQ2TBr+ZIVl6Xad/evw1HGm1dYPVryXgV7XNE9qzcGzB4+RWj//wGLJtFOpsDxndgBCyWXHyu9Oswo5M/tTIZcVcYyNJ1EI38g6WctgvjRR23LIpggGCn5f4AskbLMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYFtNoROSaILWdK1mO3aOYR4YldoEaeWJD9tj2roWG8=;
 b=nVaEUd0/vx6cIsA3uRMvlU0hoyjUL5YnPJBY9ItKUan/Cdv4knfvhtjzEqjWpYichFqcN33ddmeWGq1ngSDGza0MaLvPPg95c9EQtR6F4k4yH/6BgHd2bCtmDFg4R+UE8vwbHSmZVUdoR6147kulF2GCcUCvmRORkvD8B7oKf5AC7gMwXzA+zKTxlFUuOEWs6sRIYjWJoByta43fUWSxMQaPjxf7V/RymA4rbQDg+8vm4mtwE0NL/RdwpZ/6zBbOfNK61GpuJzSXlNgwy0t7cOLHNMxq7aBX7xOFbjfpMOxLqOOfFOvFObWPOMBD7NWTN34QJ8Xo9oCunnTA5Qx5Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPFD91879A44.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 14:00:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 14:00:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 23:00:38 +0900
Message-Id: <DIV7R6HPKMXT.17E4JYZIVADLX@nvidia.com>
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
 <DIV6O6TSXRU9.2RAEFRRAGX4EM@nvidia.com>
 <DIV7510GLW8P.1KP88LYA360IC@garyguo.net>
In-Reply-To: <DIV7510GLW8P.1KP88LYA360IC@garyguo.net>
X-ClientProxiedBy: OS0PR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:604:1c5::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: b9677805-996d-43f6-2f7e-08debd8aabe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	OxLQDZ6OXTNwDkJth12Jh6oXev1qpJqkVTZptk9ntXIeyDQnAifUxjlThqAON0vPjrKSW1Ib/2MyBr5MJCbIKjPzQzdHvT1QvYg/BuR6SoCJVsmk/Jr85mttt0HNcypP1dJER7ufTvb2obsu/YJzQCnzB+tR7JtURf29XCo0NBswHjo/CVRAqAyDTU30HvtehavQoyOnL64Cs8epSG95Kqb+lsaAGFmT/Q6uH1y2iehEmUkKuhJ/duBUndy6PtWiE+P7nDX3OI80+i0rloxlFOyGLYGd0/PgPvGEeT1ejYpC1R/g7dUl4CbCfDsF6fE5Rm/9U6J3cP3YnMoODxn6Vo075B/LATynCgVnE/G9o7ldQnU0sCiMp1ynaGz2qTRZ05ap7NmJUkOJvn14mVGuyTpXKOjVnVqY1/bkhQ2yCclWm0Q8xbKiDGkPsY4/B1dusU/ujLXp7P8+9eCvraJVXdu3rab1F1oJuvVF95lQ7GxQpW8hg8ciTtrIzE043TdNNsO5n4Ss0o2rWkYv4vUYecgVPjLyr7clVuM70YKNu51r/0czAT6wieOyY4I8dK+IadTqzJnwM8IBXyh22qCiw/uYPEdXzC8EH6W6+3P+Lgb+dd60oEp4G0fCYbrRRuc1mlvnSg2HtcMmSl426C6c4ycp/ej+kZeI5pQjSiIazG5ur3AEFVpxGPsqHJsefgMhNH52tDK2ip8Enl06X9FRkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFNOc3VnYVV4UTF3THRHaUMrMkpGdVBkdnhMc2pYTk0rSzh5TDExeGljWVFl?=
 =?utf-8?B?T3lxUVZ1TzRYTDRYNk43ZXFxKzdIbEowTlg2R1dBb2luTFJIZ1ZhaE1CQXVT?=
 =?utf-8?B?dm1VTmlZMC92ZzBKcnNzdjUzdzdLSTZVbXN6Ri9wUjhBOFZvRnc3eFBFZUQz?=
 =?utf-8?B?VG1nQnZ1V29MNURVOU54VmsxMWJQRkN3dmU4eWxGUUhraDhvQVhrNTM5c2Q4?=
 =?utf-8?B?TGtCMHFSTjlxdlJ1d0RiNENuMWNybHpFQk9xUmhIbHFoZSttbDM5OFpUWkN3?=
 =?utf-8?B?MXpsL2xsdlltL09JMk1aTWVHMSt2Vzg2QkRLL1p6alNoS214TmZXSVFpdjlh?=
 =?utf-8?B?L1NOSnpXUWFNc2RzdmJ3N0J4QXlDc1dhWUFnWlkwK2VEWGk0Um1OUWNaSWRw?=
 =?utf-8?B?NUY3TTlkaEczYy80cVNReHR6MkxHellPdFBSR2RwWFNnNHIrVWlzN29iN2Iy?=
 =?utf-8?B?NVNhbWR2Q3h5SXphQWJ2eFRENll4aGsvSUZxQVdxUFp2TE9icWF3Qnp0bUQ3?=
 =?utf-8?B?ZVNQb014UFNXMXhvbFVRZWVvTXlKbitzRURVaUlhU3dLamF2c2dxcC9BZ3JF?=
 =?utf-8?B?Wk9qVHdVQnZUYUlUZjdQOHBQUnZOaXVDVGZ5RkhEWVZzZzB2QzV0aGFPUk5S?=
 =?utf-8?B?aHRqUEFVcnh4NzA4Rm1kRVQ0eEVqNXdNM0FGNS9pVWRoemZqa2lSTUppc1cy?=
 =?utf-8?B?Mzd2V0g4OVdFWjNrYmk0d0h4UlB3Tng4c0RxY2VtN2E1aHVWbXVqZDhQckor?=
 =?utf-8?B?NEh6LzVBMzVUbWF2QjNLcE51Z2hYNGs5dVU4eHpUZ3Y1Y2toWTFkb2ZYZmhK?=
 =?utf-8?B?aUdjODVRSjRWL05uZ0JOZGkvUXRkTERZT3Vhd3luTHlYb0lNUU9sTW94VVJD?=
 =?utf-8?B?eDJSTFM2eTF3bk9ybTFPTkJ4MFJFbWJRa0o2a2VEdkZQZVpLTUhDYnZMSTdu?=
 =?utf-8?B?RThXQnhoVXpvaGJxOG5MSW92Z0JNOFpoNGlaK3IxL29pZmd0NjNsY2RpNjk5?=
 =?utf-8?B?c0txYWRRSGVobjBNVWxrZ2ZnSlo0OWlXTHMyUTAyNXZOWjQrMFBFcnVSZzZk?=
 =?utf-8?B?VFdQdDhKVE5haDI3T3F0Q2dIVkhFdWVoOXp5R3pOdkRIZFkwOHArM3kyQ1N6?=
 =?utf-8?B?QnIwbmQ3cm1XUjJuZ05teU1odGdhQmYwWnQzWDFuVEhaWGR4VWZDcVFHSjJp?=
 =?utf-8?B?TnNsYjFIQ2lBQ2hoT1lMY1FCb01SaktESks2RVJFcC9iT3R6WHFIWmRKdHhV?=
 =?utf-8?B?bUo5NTFCaFRVMHZ2ME54dlFENEJEaU9ENkVhN2w1SlFRMkV1akxGZjNvOVhU?=
 =?utf-8?B?NHN0MWtkMGsyNEZBMm52ZUZPVFpOaHBNanlyT1Bjb2czRXBVZlRWZnpCaGY1?=
 =?utf-8?B?NzVjN0ZRSXdIcDNsVHVXbU12dnNVbW00Qk02clI0U1Y0eWFjWmQ3eS8vRlhx?=
 =?utf-8?B?ZUMxdlo4Qk1DUmFuZk5VSjROaHBhWkJhQkFEYVlsS1RTZE1SRDJ4NFdQQXhy?=
 =?utf-8?B?RWUrWHVmRnRwM3FXcTFmU2w2Mjh3YXlQSTMvSWczWE5Rc1lhc3VlQk55S3Bh?=
 =?utf-8?B?Q1VNNGl4MG9nUGRKQ3QrVlRkRFUvTHBKMUc4Z2JBcGFEYVo4bFhxb2JyY0dX?=
 =?utf-8?B?WUMvZ1NuREdRWWNTNXJzT2FLd0FjbXM0TGtQcGJlYysraWZSNzNHT2grSUkw?=
 =?utf-8?B?SWJDZkdxams0SllUUGpHN1YyMW0zTWNycmNQUWVzZEt6TEZwZVFWYzQyeGlm?=
 =?utf-8?B?SkphTk8yQ0dPOWZ6alBBMnVsbFgrOTNsNGwxWG92QUlIYTBVa2F3T3NTK3No?=
 =?utf-8?B?dFpXYWtuZ1RJZDdWNXNGVVRJSTdXNHFWaGh4RFFrSUlzV04zWGR2SkZJTDI2?=
 =?utf-8?B?WE8rSTMyQSsvRnVlUklNcUoxTndFK1JtMXFTZk8zSTRTQXh5ZmVEWm1Melp2?=
 =?utf-8?B?WmhzRGNNV2RVMHBSWWJCTDRhZk16QWtGL1RuaHNsS25xMy9nRHE5cHdSbWtN?=
 =?utf-8?B?YUlpT2NVUGhGakdqQlBlMzNzWlFLOVdlL1Zza3U0SHhvM2p5SkdMWFdwV1Ju?=
 =?utf-8?B?YjUrMzFYWEdLQm9aV1J2dmZsMGVweDdTa3ZOOE9PRytPYmNkTVhiWnFjdzR4?=
 =?utf-8?B?NXlDU3loZit0NDF4dTh2UG9yVDA5bzNNdW1KeFQ1ZUQ2V0pQV3pQQXRGNTFH?=
 =?utf-8?B?YjhMblZCaWpJMmM2dW1YaytxeEh6a3N3Z1VKMVpaNXhtZVBGd0VpMnBzQ3NF?=
 =?utf-8?B?UDBCelRYQ2NxUHgrR0Uyd0UzRWtveGN1Z3ZFUXNtV3FKMmRBQzk2YmhhVC9Q?=
 =?utf-8?B?TFhUZ09XU3hjR3dXdDE4N0hiK1U3TmJ4TkFQUVorTFg4cXI5T2ZWb2l2T0tP?=
 =?utf-8?Q?vOISB07Ej4YZcSR01G6yQJt4M8eDiv0dlZfUgLaMasehg?=
X-MS-Exchange-AntiSpam-MessageData-1: SFNL1pD87JbOzA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9677805-996d-43f6-2f7e-08debd8aabe8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:00:42.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ip2fit/a6Oztw4WBJ79NUA7mhkBADJFn3EztPmtCQG5CML6ZwvZP5honmghJZXyV7gmFmWtl2DioTeZYFBAnXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44

On Fri May 29, 2026 at 10:31 PM JST, Gary Guo wrote:
> On Fri May 29, 2026 at 2:09 PM BST, Alexandre Courbot wrote:
>> On Fri May 29, 2026 at 9:13 PM JST, Gary Guo wrote:
>>> On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
>>>> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>>>>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@n=
vidia.com> wrote:
>>>>>>
>>>>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>>>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>>>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git master
>>>>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>>>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust=
: auxiliary: add registration data to auxiliary devices
>>>>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0=
day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>>>
>>> Ah, OPTIMIZE_FOR_SIZE build, it's always this...
>>>
>>>>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-proj=
ect 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>>>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>>>>> >>
>>>>>> >> If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
>>>>>> >> the same patch/commit), kindly add following tags
>>>>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNE=
WvLQ-lkp@intel.com/
>>>>>> >>
>>>>>> >> All warnings (new ones prefixed by >>):
>>>>>> >>
>>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.m=
odule_ctor+0xd: call without frame pointer save/setup
>>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.m=
odule_dtor+0x1: call without frame pointer save/setup
>>>>>> >
>>>>>> > This one looks like this bug:
>>>>>> > https://github.com/rust-lang/rust/pull/156980
>>>>>>
>>>>>> Does [1] work around the problem by any chance?
>>>>>>
>>>>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556=
d55@nvidia.com/
>>>>>
>>>>> The asan.module_ctor error? I don't see how it would work around that=
.
>>>>
>>>> I was referring to this error on the report:
>>>>
>>>> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRia=
bPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationD=
ataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocE=
INtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5=
ErrorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11I=
nPlaceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3ne=
wNtNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name =
too long, can't create __pfx_ symbol
>>>>
>>>> As this patch might help shorten the symbol.
>>>
>>> https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e203=
35ed2501@garyguo.net/
>>> would also help a bit with this, although I'm not sure if is sufficient=
.
>>>
>>> Also, regarding your patch; do you need `#[inline(always)]` or is `#[in=
line]`
>>> sufficient? Inlining shouldn't be forced unless there's a good justific=
ation.
>>
>> If the code is not inlined, we risk a build failure - pretty similarly
>> to the link errors of `build_assert!`. I'd say that justifies using
>> `#[inline(always)]` here, but maybe we should also add a comment
>> explaining why we do so.
>
> I think for long symbol names it's a very difference argument. There're m=
any ways to
> create complex types that can lead to those. With this logic every generi=
c code
> needs to be `#[inline(always)]`, which obviously is not what we want.

In that case, should we just increase the maximum allowed length of symbols=
?
