Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F6226D18;
	Sat,  3 Oct 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040351; cv=fail; b=dUslDXsqG7HRI2f52+zm/9SonimDOlgxzuwcPMTFDABGMa/Qnh8NAx+lHx2cq0Tzz1PSnEXn94/5ahhRFvTWxM98+eMZgaWauGazkmum821pGANef90NNASCmIWMy3nAUuqofSzqBDQWQxHMMKFrQ0e2LgvghxqPP9uER1MwTmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040351; c=relaxed/simple;
	bh=0GG48naEwTh8959H65iteIUPmHBBtmwpnpc/rxdCd9M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fsS5Wn+cwlSH1TdQClBGOB12RZ1/JpxmUOL3xn5OOsUVA+a7QvHqivQl+BiDjoB9/CA9j8RhOoNTdVsS8KhRnh/H/xahqV2dZLQsquDJ+mMGkHeYYwIDjuE3OCZQ+O/ujKGZCWAxADgz21jApaEHsAIrFBQz7cwzlq7G6UbWTJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i7Labzvl; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i7Labzvl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/BrM/Hapnm51UcvviHtePa/Aiz0zSO75WTwFHThFaTL8m/+JyJDRyq6hM0IP/yrU74O3/ydB4JshVFbVxq0PB/6jjDH5HiT8EI/hMUxFlFyR8afLDOKVqi3HKo+U/svJ0SQwbLkCSzBbTjlJg05jUqxbEivVHQmF7j/0JgyQhn/759tewLnTEvD3vjSF3L67QJu8pglMSLA8dZ5stzhAz+B6DAGu6Wx+tufQjBHjhuVARjnZPZSMRurFHEULcsidIWEnbz3iorm43b6GTq1fu/QUvzGvDNJh52n2lVd3MA0Di+44jkKMJ4p+c0r2wfCMWdK42FL/xK4uLsaKr6xSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoL7qdTAZ3VBQf0hYyJEzliTxku1IEfr19JAA0voing=;
 b=hZULkPW//c3Y1Cf+2+6QgIOUHfocI/SaiT+t4CqGzZgLNPUbLkdMEKTPNy0zqxpIyp9kOgPSvRFPb5c5aySrCCDspdGaEnpZ2yCinI/9T7uyLp6yazycVKXamxJCeJARZLXqtd0BLuy/doP3NwExvAmV0VFES/SQELf1bNEHDkSCPduS4GBqdKxCWrii2dQtTcRZ0PBC1d9EL5IcK9jVv9amXddY8uXPJeyohfNiPIzpKUMgLmOZ0VLrQUiDadwRc4XhiFaXTqhtM+VnnRZth9BjrU6TXv8u0dLwVWLHmcu0VjvLYEAuqLzlVQOo0yL7idrblmUL7bxdpjpHqoINqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoL7qdTAZ3VBQf0hYyJEzliTxku1IEfr19JAA0voing=;
 b=i7LabzvlaRQGP8HuAb44YkP6vHB6PZ5rye3XPhvdLCDhDesT7UUWAebaL/QJQCHe24TZX5TmLzIxwgJx6GVeFYPeAPBPxK7FQtx7RYgMQzA7IS/Eqdj87gaDSAWvAjMj9buq2dGxJ72YOIWqhUxXyR6DohoWcc7t/wFkO1veOj4LYtxClypjSIvF9D+npBdrXy+igE9FGc4nekReW7vHiBdpv3Yto9c3nZvY0plTEjh5nJsIL7sqJJxnionPl5jHZZVT6B02ib90A8/Y8ExtYYkBOEcnbl+AgWCS2VhTVP+4h267s3VnvEnruLFJTwxUkhWopd68CY0PiuZ2k3Ly6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY3PR12MB9656.namprd12.prod.outlook.com (2603:10b6:930:101::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 15:12:24 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 15:12:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Oct 2026 00:12:21 +0900
Message-Id: <DLVATA7ILWLB.27BB2BXCREDOT@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 13730/14185] warning: unused import: `Spec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "kernel test robot" <lkp@intel.com>
References: <202610031630.JOlyp48X-lkp@intel.com>
In-Reply-To: <202610031630.JOlyp48X-lkp@intel.com>
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY3PR12MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 918aa700-4d4f-4d37-ff72-08df2160bacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Tql3t0xZP+xWctSFcS/P2dU77mZCoCs8r8zxOhV5JK/x5dDlO8l+rXF771YgOiqMb4Ed+GHkdWUs/THnh0NRcE245IaAl4BxlaGjaMyy1EFwN/22Bt6UrxEo6pPk6+KkxfeXkJstxs3kint7D09MwbKIl9FArJL1PkjXHo0QoraAi811N5KxyhWb9TgZbvwXEH0AWr1BzLIs98a/0tMZVFBibmhOUEs5QGjjuosgN8iVS2j8JVoiYy2y5tCbYMqMfwl/WTyyWQsg8dy3Klk2w7w0wJqeD9fhuS/GOZMn7WFuiBRVIMgyAccfgtHy/sAJYGxeRSMlWSQoGF/z2bHZU/4zbIOFZgBh+M1GtszV/1TAHEOUS+FXASpIvrEL3bliu4ZgvsHiojBosqUvUnTvf+yjfzLxcfHhgWdk+bxIqp8K3m+LghflVeVhCXlCePnmHBG0NFTZOrEE0T37aczIZkwT/l+0DBC2u36gjgpvHubFgguphlfdomLGXmJLtYFCIZq0MPALOjsRPedsZ3Q7BXgtKHmpZdfpiCwEv6ZZR///DRR3fsCrbQZ7VNikIe4PwUqLF2PzXeinan77RiQB05FEaRkdeDbzFrr/53yEs9oEtAHn83DUFicYA5dI5LHX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blYrZjVZNDNPcWQzMkxRZG83Qm9pK2RnZEUxVUpzSmV3YlN6OTB1amdKR3BD?=
 =?utf-8?B?dUh0OEk4R0piVStDUnhPWkVVQTJQb3RKb0M3V0FqM0JDYVFyMXFwVzFHQk9G?=
 =?utf-8?B?UzFyUG15RURUQ0JxR0R4Zkp5NmxTNmY5SG9kbTlVL1dlV3BmOWU1eGpxcXdk?=
 =?utf-8?B?Z2lqb0dqcTVqelYzdjNnNFd6UGRHbXdqWTB4VHBMbkNtb0dhTkw4RTlYa0lO?=
 =?utf-8?B?bXVldlV4WE5XRGNvOXhxRjhETkNJNk96UCtmbENVNkVWdDZuQWlPTTFOVXZz?=
 =?utf-8?B?QTJYN29hNWRrRU1BaCt6Vldram1TcE1NRVdSQ0V6WEwveWx3allvSi9neEdl?=
 =?utf-8?B?cEhDVmJnUzR4THRYZjdoRDNoQXlPNWczNUhYa0h6R0YzTSt0UWE3OTZmVXJN?=
 =?utf-8?B?OXdES1p1UjVHY0Fkb1ZmdEdTYmRSZUpIY1hDd0hSV2RBcWV1eGVFSEh5bHJm?=
 =?utf-8?B?ZzRUa1pBd0NxUnVjS2ZnQUN3am9GSHFqalYxWVZNelNXMzZ0OGZpWGVxS2Jy?=
 =?utf-8?B?TSs2blZxU3QwNUQvV0NmZ2JJUlBnb3NvMUFuNWZRYytuNHUwY3drQmRlM0Jt?=
 =?utf-8?B?SmRqNEE1ekZiUVBhbDRJWTdqcmo4S0lqaU9pbjZJVmpzUy9zU1hGYk11VlFr?=
 =?utf-8?B?UWlFbFBaVVlEMEZvMUVKdVZnTG1ablNNT2s4eVEyK1hHRmp1WlZHWUg1NnlL?=
 =?utf-8?B?czRJSFhJYXlUa0JTbGlmeXRvc0Y0bUFlZ2F2K0gyVHl0WTRTbXFpTzVRZG5S?=
 =?utf-8?B?STRhdUpKbHh5d2kwRHlmQm9tcW1BM1lBV1BZUFlSa1ZnMHNKNzk5R3NBQjNG?=
 =?utf-8?B?Z0lxRzNDdVdIdHl5RW1qYjY2dEZxYmxXckQ4NXdJaXdwTVBVSm54cXNCRmdy?=
 =?utf-8?B?SVQ2eTBVdVpNTUJnOGRWaEtVVVgwTjJYSCtTYWNndjdpNFFvMnZNQ2lFeFJM?=
 =?utf-8?B?RU1zODNhOThWM3FkdXc2bUhHcVdSc2dBdlFoVkxZYkYxRWoydi85cm5QQklk?=
 =?utf-8?B?YjRFc0YrSVlpTkpmL1d1Y29oaTJVK0ZVR3lTY01FZk85U0g4VmlLYnFXVU5P?=
 =?utf-8?B?TEdrbHZEcjhSZzJPM3lndEhucWg2M2pLTVBPNTQxY0VEbkRnQ3BPcTYxUmFm?=
 =?utf-8?B?MFU5ZjhaN09MU3NBWktBU3g5U21RQlJwWloyWVRmempaaDlKdFQ3TDc1emFy?=
 =?utf-8?B?N0hRbnBMUzZCZXRXZUpzNHBucmhwK0lmd0FRdFNQNkhETkRCRVV4N2NBK0w5?=
 =?utf-8?B?bXVNOEJuZ1VXeGovcE5YZVJHY0lNaXVIbWV1WGUvZzZ0cFFzU242TFQwM3Zj?=
 =?utf-8?B?UnBOZWlYbzVCbG9MbG4wam1aNmJ1RzFIOFhjSUszSlBTTnc2ZkhaNklPSkE2?=
 =?utf-8?B?TDViU2kwOVlKNFh1SGZ1YmJuTHAyVXl1N3FiNWE4YjJrMllaeFY5STIxcHo3?=
 =?utf-8?B?YjFZL2x1Tlo5S2lNb2RkajFySFVLdXc1VGhIS1dCUWQwNUxabXNDQzJVbkpB?=
 =?utf-8?B?Y0JxZi9VTXdDdlJDQmVZOFhNallBZkozejZ0SU1XQ1psb1pRL2g2Mk5NM3RX?=
 =?utf-8?B?WXJ1N2FaZnkyMGhTWjZTeXo0dEpJcWtvL01NVmZoTFdCZHpuZXpKaUtZN1F2?=
 =?utf-8?B?WG9MaWJTc21ZWmJTZStNV0NxeWdodUhUWEhqSGFTRDd3b1ZtK0Z3UDhFU0d3?=
 =?utf-8?B?RkZqVU40OWV3TGJOZk51eWhjVnhIZktGaTE4TlhFQkYwWmZEQmxoUU5jSHcw?=
 =?utf-8?B?WktONmlCRHpPeDNCRG1LSC9DOG4yZ0Z0NHVHSXhJTzJ0OXdZUitqOEVEQTNa?=
 =?utf-8?B?blBUcFZxVmdFQkVZb21tMDlqd2Z1WDNxRFFmeGl6SHd0bk9rdWxLNHZiMzVl?=
 =?utf-8?B?ejNJWVlLYXpCVHR3aFk4T29RYTltTmFoaExpcEpFQXFLT2M0cjZWTnEwNlQ0?=
 =?utf-8?B?anFtdjRsZURZZEVkN3BWVHFEK0oxcU14WTI2dWFjZlVTWXJaZFlQUTk4RHR6?=
 =?utf-8?B?UTV0UnJ2TEJqY2RwMWRGTC9vdFFtVmhKbzhhRGl2emhhUnNoQUczbHo1cGVD?=
 =?utf-8?B?UDJsYU10dUdRcGFndnBwNmhrSS9KSmZUdisxUDAwTndQYU1QL3Jqc3ZXUDd6?=
 =?utf-8?B?amhNTXZ3UWlVVjFTdXNoakNXTkFpUHVCQWdJYW9XOFJ6OVplSVZWZ2EraE1h?=
 =?utf-8?B?cG50TXEzNmhYZ2JoQ1ZiWEpVbDNpQVpyVEVJcTl6T2J1M2tpQ2dGWUlzeHhv?=
 =?utf-8?B?eG9hSkxmVndqMHo0bFlrcmNEZEJDU21wcUJ0QlRkWWx0Nm12QzRZTCt2RTkx?=
 =?utf-8?B?Rm9tNzNONU03L3VJcG8zbXJ2L2x1dVdIdjVidkdwYXJ3cnltS1BwUHh6dFln?=
 =?utf-8?Q?66FthHdpzez8XK8HmiRUukC5dOdWqzsoaQdIAy33QVc9l?=
X-MS-Exchange-AntiSpam-MessageData-1: 0uAxIklSRR0o4A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918aa700-4d4f-4d37-ff72-08df2160bacc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 15:12:24.5919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNInpia7RtCZXXv2pboUODOosRe3Kja7KGvCI+DGPhqkBUe12bLdYC3b2OuEw4Vq8kX0g8yBsOoW5pnAdDm5XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9656

On Sun Oct 4, 2026 at 12:09 AM JST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   f0406245cb9855e6318335a8a223551354291a46
> commit: 9cb3f5d56e81fd97a82ef361b210bc2322daaaa7 [13730/14185] gpu: nova-=
core: add an interrupt delivery self-test
> config: um-randconfig-2000-20261003 (https://download.01.org/0day-ci/arch=
ive/20261003/202610031630.JOlyp48X-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d=
7e4505dd447d115d85fdea45cd71030ac1d86ee)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261003/202610031630.JOlyp48X-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610031630.JOlyp48X-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> warning: unused import: `Spec`
>    --> drivers/gpu/nova-core/driver.rs:29:9
>    |
>    29 |         Spec, //
>    |         ^^^^
>    |
>    =3D note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by =
default

Mmm, this indeed can happen when `CONFIG_NOVA_CORE_SELFTESTS` is not
set. We should not import the symbol and instead fully qualify it on its
use site. I'll send a patch to fix this.
