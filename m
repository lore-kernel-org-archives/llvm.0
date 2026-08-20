Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020142.outbound.protection.outlook.com [52.101.196.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB046AF31;
	Thu, 20 Aug 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232655; cv=fail; b=iwN1M8rZESjiayu1zXG/jyr4fiDlXipqdIhRhhLb33HEvIiDRuzmvZPZSvzXI/prCfaV5xN8zpiZo3mvLbVi8jxVF7aSqBhY3J998ijgL4zU10ImRLZo8YpJ0daZf+O2I6BuBjS/iMJPGhM7tIcCUjEX1mikkKAYY0NaoKjEL54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232655; c=relaxed/simple;
	bh=Hh7voN4rRzAhBQm/aqoOiM1CE8ZMJX93GV9f+GYXz4Q=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=tseT//MUpMJzkayWMP0HJYRDpoTX9qwbvNp7wEBthj9S1uOmGVmDDuZo1DGH8WnUX+3nZyPeW4c3SdzVY8yQt7iCoHpKw2QNenK/jcobqXymZPcfF5O9ByQsxhPhJHCfj0KwHeAFkRXen6dlcDsTcbB43yTQiCuRs1hS38c27II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ey98SfjJ; arc=fail smtp.client-ip=52.101.196.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ey98SfjJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isYQjXgw0zh747yLcGOV9WnAibjPPvcu/7eLYpG+4lo2jLg5dDvPX2Lm92pFa4RUoa+kAv93EupZN5JaL8fME15vdd5OExvebB6sn6w7bKDMNZrToIBoaTmWF/ijVm/ba+CYR51VXViV6WGtgGmm7XfST8bWtECq85Tgmcl8KPwm/ygGyBRkdHb4eifoNCHiEHPmskmWoB1HB8cPLcFiDYy/nFlAiQ4a55wdi66AThJC46AECkDle1AOQtoVJnSK7iayx9jMmTNy6EFUFU4/3P/ynWhhbJB9skE/zXGHZlK+7jMd0yltCgDY0habaqPfbBJKeGbNIdownSdtPYw/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c6Uu2wOoceVT+Am5HItLLJbirojQOL8C99/blBI2Z0=;
 b=jtX2JkrjC9mu1VFV9drDCQ4BLha5P3BJ6IfXgoXEdYTkLvqIM9lFgulz0hJip0PXGV4Pb0y05NX7FC4KNj2l3a+E8AZmMvmT54f16TnlfDoU6W2chf/74raiEYzrehlpLaLP3xQctevA5bdjNBEVz+XIZF4IUkOerBnXs/+dxP16XIHM026NGAE9LPMlF9zBq59DJgv95xUpt6pUKPibXX6FO21FjBMmoHT8Dgg8gcqi6vCHrbqdMM0eT61qG5hv2lyHm57vWqSfKSlrh7lyzBUj4skeBMo7m8I2xfv3u6KEPWb7FcJFx/15IdJeG9uQry4c1x+/ThORbue6fDanKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c6Uu2wOoceVT+Am5HItLLJbirojQOL8C99/blBI2Z0=;
 b=Ey98SfjJygBOm9M8NgZlQzw+zUoDbhYxS/o1vKV+Mxh9CJ16s6IGd8AIQPwsZcRo0bY0rhMkj7To+ZSni9dTa1meEEy0mgEDvIHNL2z4u2LL2XVmaFB1NYeiHZoSYZq9+s7xce089G+rV5ASZjG70XoFriZTlEgqfSKc3KHp7TA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7785.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 13:30:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 13:30:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 14:30:37 +0100
Message-Id: <DKTT3F0QOW47.3PVSDZX88VFM0@garyguo.net>
To: "kernel test robot" <yi1.lai@intel.com>, "Nathan Chancellor"
 <nathan@kernel.org>
Cc: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Yury
 Norov" <ynorov@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>
Subject: Re: [linus:master] [rust]  b7b8b4ccda:
 CFI_failure_at_do_one_initcall
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <202608201017.100a4511-lkp@intel.com>
In-Reply-To: <202608201017.100a4511-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d504e54-cafe-4719-086a-08defebf38e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|10070799003|1800799024|366016|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uvXeePhAukbjHiHpxgoWix6cdwizkx1ykpS+KFnXwkvPlDIRgB5u2wRL/bSWGYkE5Pj8JhdqCwMX/j+CW4jWqUjrFrmM8dpK8eh0/Q8mv0HoW6wr6TxGe0H+96mlrDJAnRmZ4Qgt24AHRfPjgWLzoQu0myqQt2E9EcN+w6JhJvhWoEyV7IR6UQ0eTGNT8iloB9Dc3kctanj8oTQbXViUV5Gp227ivtiU4SI/+4bMTYkmO/0ueENlukEJ6d5zO+hLe/b6HqcHvlmwcpFIWEs/o+9OWSPgr0kAzEBQjwoag9MOz1/DnCqdX0lLc06xJSBLQpxCJ+rQZQmvzy3hPg29A+b/rkQSJv7Q3BYTCepkw73W6lQkMI6oaW9Ld0N9KpfoEX3HAd+QY1zxvFkkimXOWiJNlStP7tuU8vd8EofYSQd5ZGyQrMmCYl9xOc7yCnDoy2r2AV0ihmqHI5cwwYU78dYIBg2Fi5Trh3gS7O2OBtyJpY2i2kVQzTG+A2MFVR46gWWCBmC/bpt21YWpeP2SER/462LvtyLxfWTaBnrSpQLSO8hKMn2hQ4+iF2snPciQmtM9/ZZ1x8NpeL3CyhZk9vnpQ8QpYmbBk6hL3MevGps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(10070799003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXg3bVZ1MjZuZE04a0gvcGh4ZGZ5UmJoQWpmNUxRM1IzZVIvMEp3c01MdE1l?=
 =?utf-8?B?cmV2YXM0UUhVeVVDUkZ6dXpyclBLNGEreEppTmtwOGxDeDZXNHlzTEF0cnhl?=
 =?utf-8?B?eC9JVmRNSlplK3dzK3FibVNJc2ZWNlhNeFljeUlncjJrK1cwMnhvSWM3L0xz?=
 =?utf-8?B?Ujg1ZE1qNEhZUDNLWTZtbExXNHlpd2V2S1lCbVdXTGdWUkZ4R0ZNMjJ2eCts?=
 =?utf-8?B?NmhTcmhUZVdjNkZxM21yWHVKMnJXbzhKcHFyQzZLbVl4RU5kUlZUWSt6SU5T?=
 =?utf-8?B?TkpzUU5zSGdOak5zZ2hWdk1idUFsQlk1RDRaeWlrek9QS3NIcU5jMGpGUDVN?=
 =?utf-8?B?U0h6cURYZlFnTmRRTHJHd2cwRVNKUGZXTTZ3SExJbS80alVBU0NkaGZuUkRF?=
 =?utf-8?B?V3doUStIT0dwK3owZ2F2RjRYeDNmYVpBMWNEaCsrbGdaMnR3MnBiYkNsQkhX?=
 =?utf-8?B?d3lodVZSZDIwZDZQNlB3UU53UTRHLzlvNlRpWExIdVZWUTU5RUhLUDhzcS9o?=
 =?utf-8?B?TDNCR0tFMHRlSVRHazR5RDZpWkI5QkdLdllIU2N5ak1KS2xuY0tMTWVhZ2Rz?=
 =?utf-8?B?aFJDTDB4ZlN2azcvNWdUVndDU000bG9LVGlNS3R3ZVRZNUthcGNZZnArSE5k?=
 =?utf-8?B?YlBsbTZEblI2enR1SlNFV3hOUVFKZTdKWkl1M0o4MHlnVEw0MHVNMmNpRDBX?=
 =?utf-8?B?YlVyOStkMnIvUm9GZlVtZUxyRUVnYWtCaHl0VGtuMnhjK0ZNY2VZaWpSUVZS?=
 =?utf-8?B?YVJBTmwzUEhNMy92ajJRdVY4MDhiZDI5RWRBMFdUSUhqem1yYkZsU0RKaE9x?=
 =?utf-8?B?bkNsdU9mSDg2Nkdqa3NpVURzQUJZWi9Fam1SR3hDalRRMnZsWHprcG9FZUVq?=
 =?utf-8?B?VUo2aHJ0UGNKWisrU0tnWktFcVMzV1RlQitHYjJ1VkhqUEE2RitrNHhGcnFP?=
 =?utf-8?B?VDVCME96NVNTa2xweEJqZ2ZOeU5vWERiM2RaM1F6TmpDdWJtendIUVNtMWJF?=
 =?utf-8?B?cHp4V2Nqa2NNUi9STkVUdXFwSWd5TS93eVpibVBnSkNFaytNSXUvOFptOE50?=
 =?utf-8?B?ZDgvMGh1MGlWcTkvVUVxcWpoR3k2bVdaQUp6SW5LQm1rYU4zNU9makN6NE1T?=
 =?utf-8?B?VTFXMm1DaDZ3Zm42cm1tUE8xSU02eTNOSE1nTXNOZDMvSHh6WGJjZUJqUXJI?=
 =?utf-8?B?aFVORWJCZTRhb1I1MEpoN2JwMTF0aS92d2IxRjVuRm0wYTlsSXNKb0dveEk5?=
 =?utf-8?B?NFhJQUxCdk1zbGFHd0pEN2Mva2lTQlhhMlBSRS8vVW9ld0dDU2hnYnpuUzBk?=
 =?utf-8?B?ZzhQNWRwa0ZZK2E0ell4RDJ1ZWt4M3MxU1ByNjZYeDZxcUt2czFIbmtrcFhz?=
 =?utf-8?B?VWVxRmdoZ3padktWQWhXNityaS8wWFhYTjFUWU5OZ2IrQWhLemNwMVVNdFFm?=
 =?utf-8?B?dG1SQ2VpVzBKQzFheXc0MklHZ2V4anhMQ25NWk1ab2FIeDJzV2hVL0RzSXBF?=
 =?utf-8?B?U1FxVHU3TFBOK3VzM0FUckJXdHh6VmxzZWVKcWZXYkZ1U3hhY1Z1bVExRzB6?=
 =?utf-8?B?TGRJQkh1SmlaRTVZWFR6ckFkUEIvQ1IwZ3ZZSlk3dzUrcFBpOFpwWHBGOHZu?=
 =?utf-8?B?aWNqT1NQelEzV1BCSHI3aWJ0c1JNYjU4Y2t1RHJvd2NtcXk2NlIxa0kxNnpE?=
 =?utf-8?B?WXhJVTRoWWVsUDRER0Y5NFhYUUZNUHdBRXlrczMzZVZmdDFqK2dHZWVhQ3dj?=
 =?utf-8?B?a0ZMRTBBeWsyeXNxSno1U2JSaVgxZG9NMGNuRlJJbHpIcVNPUU1lOGY1NFo2?=
 =?utf-8?B?ZmRrTzJrWHZJZG5hR0kvNnkxODR5ZHJ3L1ZsajdiQVA0ZStOVGkzeFNpVlFU?=
 =?utf-8?B?YXcxQVB5ZGRYV2ZJV0JncTNjK0tuekoxRHBNN3FaS2tYWnJDUGg3bkN0MFUx?=
 =?utf-8?B?SWVWRHZnR3pteXQvSmJBT3drRWI4ZGk3RmtDVW50WHd0MTdZSkJSNnVDNFhk?=
 =?utf-8?B?N2pXYUJzdS9BODhUT2lLbUJNSG81WnNpOUdsT1crNkYwUUV5WUt6OEVMbjFU?=
 =?utf-8?B?Y2I5cVRBKzNLVHNqVnlGSjFNUXRMM25kL1pkeFhVZzY2K0JUQkJwWFhhRDJT?=
 =?utf-8?B?TUJCR1ZDT016V3hJRnpMRXNXMkdrWlo3TnpvY21OTFNtYkk5SFdxYllqN1h0?=
 =?utf-8?B?a2dRNk95OWZMY1NKQngrci94aDRrdUt4MDMxZ3NwMCs1RUsrZThvblJSSkR1?=
 =?utf-8?B?T3Z5WG82c1FGeHMvcWxiblN4TjVJaDRRSTJCM08vVmRmRTROODkzTGRRSFFx?=
 =?utf-8?B?c3ljK3MwQ1ZJSWkwRFN3R09Qb2pOS3lrSUo0a3JoOHB2MDZIck9EQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d504e54-cafe-4719-086a-08defebf38e0
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:30:38.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmG1+KzeFiXwmyQpNM4igX0V808EUxbdcLadHmbJ9dttO9cv57wlGGZDe/D0EBKPNv8FhlvkU4bOpgl3bH7KEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7785

(Cc Clang/LLVM folks)

On Thu Aug 20, 2026 at 4:16 AM BST, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed "CFI_failure_at_do_one_initcall" on:
>
> commit: b7b8b4ccdad45a59aafa5cfc32a51fe1ee5cb680 ("rust: extract `bitfiel=
d!` macro from `register!`") https://git.kernel.org/cgit/linux/kernel/git/t=
orvalds/linux.git master
>
> [test still failed on linus/master 8d3ae59288f1e7d58d76558a6ee96d533bc501=
9]
>
> in testcase: rcutorture
> with following parameters:
>
>     runtime: 300s
>     test: cpuhotplug
>     torture_type: tasks-tracing
>
>
>
> config: x86_64-randconfig-015-20260715
> compiler: clang-22
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 3=
2G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.=
com

The issue looks like that LLVM is trying to merge functions by creating ali=
as
with different KCFI types.

See this minimized example: https://godbolt.org/z/PhhcGh4W5

Note that a and b have different !kcfi_types annotation, but they're merged
regardless.

This causes the merge of `__module_firmware_test_init` with `Flags::zeroed`
which ABI-wise are compatible as they all return just an integer, but have
different KCFI signature.

I think we need to disable function merging pass when KCFI is enabled, unti=
l
this has been fixed by LLVM. Clang disables this pass by default. We can al=
so
workaround the issue by disable the test that generates
`__module_firmware_test_init` (perhaps we should do this regardless, it's
strange that a module is produced from doc tests!)

So that commit is just a trigger and isn't buggy itself; it only introduces=
 a
new function which happens to be mergeable with the empty
__module_firmware_test_init.

Best,
Gary

>
>
> [   16.811904][    T1] CFI failure at do_one_initcall+0x12e/0x478 (target=
: _RINvCsdamrQDJyPhn_8pin_init6zeroedNtNvNvNvCsdPKRummocL6_25doctests_kerne=
l_generated33rust_doctest_kernel_bitfield_rs_04main43__doctest_main_rust_ke=
rnel_bitfield_rs_118_05FlagsEBE_+0x0/0x4; expected type: 0x6fbb3035)
> [   16.820524][    T1] WARNING: at do_one_initcall+0x12e/0x478, CPU#0: sw=
apper/0/1
> [   16.823875][    T1] Modules linked in:
> [   16.825674][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7=
.1.0-rc4-00055-gb7b8b4ccdad4 #1 PREEMPT  79da7d58e576708b28b47c0dd4cca3fe34=
a229fd
> [   16.831720][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   16.836267][    T1] RIP: 0010:do_one_initcall+0x12e/0x478
> [   16.838287][    T1] Code: d2 31 c9 e8 74 04 49 00 45 84 f6 75 0c 48 8d=
 3d 90 03 a1 0c 67 48 0f b9 3a 4c 8b 5c 24 08 41 ba cb cf 44 90 45 03 53 fc=
 74 02 <0f> 0b 2e e8 42 96 f8 06 41 89 c6 0f 1f 44 00 00 41 81 e5 ff ff ff
> [   16.843506][    T1] RSP: 0018:ffffc9000001fb80 EFLAGS: 00010a13
> [   16.845121][    T1] RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0=
000000000000000
> [   16.847279][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000000
> [   16.849427][    T1] RBP: ffffc9000001fe70 R08: 0000000000000000 R09: 0=
000000b8a3be5a2
> [   16.851619][    T1] R10: 000000006c292bb6 R11: ffffffff81407458 R12: f=
fffffff8f899850
> [   16.853771][    T1] R13: 0000000080000000 R14: 0000000000000001 R15: 1=
ffffffff1edab41
> [   16.855915][    T1] FS:  0000000000000000(0000) GS:0000000000000000(00=
00) knlGS:0000000000000000
> [   16.858307][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   16.860091][    T1] CR2: 00007fd1104620ac CR3: 000000000ba86000 CR4: 0=
0000000000406b0
> [   16.862236][    T1] Call Trace:
> [   16.863144][    T1]  <TASK>
> [   16.863961][    T1]  ? __cfi__RINvCsdamrQDJyPhn_8pin_init6zeroedNtNvNv=
NvCsdPKRummocL6_25doctests_kernel_generated33rust_doctest_kernel_bitfield_r=
s_04main43__doctest_main_rust_kernel_bitfield_rs_118_05FlagsEBE_+0x8/0x8
> [   16.869044][    T1]  ? stack_depot_save_flags+0x40f/0xab8
> [   16.870574][    T1]  ? irqentry_exit+0x1b8/0x638
> [   16.871878][    T1]  ? trace_irq_disable+0x25/0x100
> [   16.873243][    T1]  ? __cfi_ignore_unknown_bootoption+0x8/0x8
> [   16.874861][    T1]  ? strlen+0x32/0x78
> [   16.875952][    T1]  ? parameq+0x1a/0xf8
> [   16.877070][    T1]  ? __cfi_ignore_unknown_bootoption+0x8/0x8
> [   16.878666][    T1]  ? parse_args+0x17e/0x538
> [   16.879902][    T1]  do_initcall_level+0x10e/0x1c0
> [   16.881314][    T1]  do_initcalls+0x59/0xc0
> [   16.882501][    T1]  kernel_init_freeable+0x11e/0x1c0
> [   16.883889][    T1]  ? __cfi_kernel_init+0x8/0x8
> [   16.885175][    T1]  kernel_init+0x16/0x138
> [   16.886357][    T1]  ret_from_fork+0x266/0x5f8
> [   16.887598][    T1]  ? __cfi_kernel_init+0x8/0x8
> [   16.888884][    T1]  ret_from_fork_asm+0x11/0x20
> [   16.890220][    T1]  </TASK>
> [   16.891058][    T1] irq event stamp: 306141
> [   16.892233][    T1] hardirqs last  enabled at (306157): [<ffffffff8174=
9821>] __console_unlock+0x61/0xc0
> [   16.894765][    T1] hardirqs last disabled at (306170): [<ffffffff8174=
9806>] __console_unlock+0x46/0xc0
> [   16.897303][    T1] softirqs last  enabled at (305714): [<ffffffff8161=
8b94>] handle_softirqs+0x614/0x780
> [   16.899859][    T1] softirqs last disabled at (305705): [<ffffffff8161=
8ec5>] __irq_exit_rcu+0x45/0x140
> [   16.902401][    T1] ---[ end trace 0000000000000000 ]---
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260820/202608201017.100a4511-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


