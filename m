Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30E349AFF;
	Fri, 21 Nov 2025 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735962; cv=fail; b=CTQLCpPGq9GYBs2QiGU57v4r4W0vsZn8b3oqFqZCP1/A+FiF50XIIRnKFpeRWjgJA+hnsdgkZBzaWAKdJs08muFohFHE8l3eJ3kSz9K6jZgiw7qF75RIp0UgOE8i1yh33PnUaXs0I3z4eFfLlra2E83R22W9gfZzhgBcrZdnLRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735962; c=relaxed/simple;
	bh=lQKRM25h5HIClgdKb1VLiOSELut391KMtm/e2epFSzI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EXuFPcmDMd2MdfUelwcKH0r8pGTN+5tZxc5y3tNkrS2wisBW1GDfD4zJughZCvOe5YO0w6X6pFqLrm9fcUR+jTyswD6vvCdjBfNg4Tb5HUNfhCcHGRbUW54JsxJ/BzmAQ1D+R0uTXXBWNpTQ3fkOOGAjvtIy925trwry4CZFAic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EncWlULg; arc=fail smtp.client-ip=40.107.209.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EncWlULg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM9/9K6L/URpk19E/HrEI1Gxiop6oHkJhP3BRkzt7Os6E+lrj3xYb8oHFr7trmabc/POLt3HxVYt4LJyCcltJnAcjmbjFmzUzfQI3NHdPqcTIPEPkrK5czB97rzPgLhlVB67T9xApxFs3K2eYDG9QsueHPAqGWMzUXNgEYW3DkJAEp8zi9OV1WUjb4kdvnWMK1LRW6PJk7QKHOgV23/6D20JrtHrMIvpJIg8ToecQcFAPRvKhk96zrpu+AnxWvOEGbedClTaE4NSfcXXrPsDH2xw4zTTXxyWjy32DIdhOhQyE9N1JlXvRQG81ycFZZ3CVUWoUFxoqqv6w2phcFkyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQKRM25h5HIClgdKb1VLiOSELut391KMtm/e2epFSzI=;
 b=aHeHM/xPIUQXSqjrPVGSo6bguw0nP8bQq//kTTUJAYetEX7H7kxGsp9E65z9gnPr8683bbbhKgm1RSIilBHlfojOwWhn3DQ7GkN5v/DOobxvs81LAbAVjDVhMbHWwx63T1NeI8q5hOTZm47fqVwbEDXRd0QX52a69qU9C6gobCikOw+hCCwi8JEPKeuxMTzbT6GtAcZBIjpqvSxRJIK12R+d4uykD6RZOGhjZiXTmQiMburX42oDvONg79kIXKlyN8ghLXfvbpeUGudj3VBboamZicsTK3GPdpGZiTgxfoPKvORQZXif6dkFmVuJDiG08yG1xmyic9PKWhvE4ru7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQKRM25h5HIClgdKb1VLiOSELut391KMtm/e2epFSzI=;
 b=EncWlULgoTRFaJI6LFCzxbbrOBVAXLFUjPPBpQ5+wVOWgh8Ths8jaAluRQGb8l1c81uSF2T3kLxk468NrAAMx742Q68g0EiQSwVBnjttTbRD8Shm/dYV2eXgwCOYZx1x3hBZBPvmE65RJxIyWaRAacbylzu46q4Ydq9RlhNNyFueSYBjwGsj/LzkD+f2QMIsDecDTZOChDRYLje2g7ZjsKBAVSyrGenMGlst0OTQpc0NJ23p8MRbgCl2vV/Ckpr5/FhaTF6P8RYBBY5NyV4u2oN4VEElKV7ltqiHyEA+hQEtLzUtKUFWrKDYAM5WmelmTWt+5iUD2CZQHMXyIJw8JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 14:39:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 14:39:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Nov 2025 23:39:06 +0900
Message-Id: <DEEG7O6HRLN7.QAT4259QYR3D@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Trevor Gross" <tmgross@umich.edu>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "kernel
 test robot" <lkp@intel.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
 <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net>
In-Reply-To: <20251121143008.2f5acc33.gary@garyguo.net>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 15577fa4-d43e-4ffb-9f3d-08de290bbb26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHdXY3BMZHRMdVRnNXhZV0tFOE9sRzhmQjlHdVR0ZEl6YnlMYUR6SDdqbVJn?=
 =?utf-8?B?WENhVWFoYzhWbHJrUmkvUi9CWFByK0p5MkRiY2RlK1dqRWo5KzZjYnlENWdH?=
 =?utf-8?B?UWNFQkFSTVZPcm5NRzRPMWJVVGk0aGJ4ald4WUZCSmlYdSs4cm1GK2I5QXdU?=
 =?utf-8?B?bjRBWTg1dkVKbGtncU43b01HYUZYUjhBMjE4Rmx6K0pPRjZCYU1waGVLNzNw?=
 =?utf-8?B?SXZBMXEvbWFrWEJjcGp1SkZuYXFIOVJVaXFycW1lUjJIMW9WdGFsdjdGa1l4?=
 =?utf-8?B?V1lYWXVnb0VkRHFQdGdZTmtGREJjdVRIdlFqVkdETEE2Y3J3QkF2RE9yVzV5?=
 =?utf-8?B?d0ZWaU9qR0pJczVvMXpyYkNTZ2J0Tk40amNGQk9WaVJIem1neUFiQ3orSXpL?=
 =?utf-8?B?WTJSWERDdFdtNFNkOVpvRko2cldOL3VSZ0c4c1IzMlE1RXpaNnlwUDQrOW5w?=
 =?utf-8?B?ajhhRmIxK1BXSUtpVkZaVTNjOWcrYXJCRVlxdmxNbmlITjh6SnNtWGtJSU5m?=
 =?utf-8?B?Nm9rYVlFZ3BXQUo5OEF1NlFnckp5cGx4ZWFqQ1BwVkpwblQyYnhVQWRhT0lw?=
 =?utf-8?B?VlNGUm9QM0NHaFlsdkhMSnpjZzhQL3ZiOVV6d1BWdjErSkJoUXc1L3BkV25w?=
 =?utf-8?B?OS83VktuMUxqRy9XQXVUSWVEN3J0ZHdrVnE1UUo4a0QvWit6U2VQbTFPY3pF?=
 =?utf-8?B?UjFhZ2tpcEZNNEF3bDQ3T0g5eGxzT0tEVjFPaVA5d093bS8zTGdKSDdYdGhW?=
 =?utf-8?B?K3JUMUNpV1pETnRFMytWbTR3R2dvL0wzK1hKa2hic2tDWmNLNTNQRWl0Szlz?=
 =?utf-8?B?YnlnNXBuQUtobHpwaWpaUktCSHF5OFFHRWs5bHU1c0IrMUVwL0RKZHBNNFp0?=
 =?utf-8?B?Q3o3VHYzUFQvT2lDdFJ0OWw4QWRKVXJjYkVFRDA2bW9iNzVpZzVscTBITEo4?=
 =?utf-8?B?YWhBZUxjdGZra0VaZmpEQjlxbmx3UUZ0V05RKzhnd2tENDNHQzMwWjY5VXo4?=
 =?utf-8?B?aG9kVXpORy9VUmRwQU55T2hKeXViU3NFb3FYRVplR2xXU3dxNXMvNWQvVC9y?=
 =?utf-8?B?SXVnU3pqVWJBMk5UY2dwSFpZdDYwbFYzOU81VU94MnE4Mm5ENFZDbEJIbTJi?=
 =?utf-8?B?QVgxUm1nR01qR0R0K3MvVlNkaHc5M3cxM0s4ZzJsS2Z3cDIzUHVWdGxpaFVr?=
 =?utf-8?B?bFlPQUV1ejNqTkN5aWd1RzhrcldHU1FsRFA2aHdGRkFaN085bVRSLzJzYVln?=
 =?utf-8?B?QTgwRTFFWjhOUi9QSkZWeVdzWmVtb2xzRTE0bCtDQ0tPeG44OXRNcWk1NWpL?=
 =?utf-8?B?KzdGemhlTmRyN1hlbUdFWWZFWVZqcmZOSjJsWmFtZTBFYmVjSStaMW1qTWVL?=
 =?utf-8?B?L3RKUzhPK2I1VEVLRDgxMVhOMmRFbkI0TnhPTmZLRjdnWi8rQXJTYzM1UW1X?=
 =?utf-8?B?bHo4S1IwRnlXaTAyTTJlQ1pQS25JR1VRdzgxSEJwcGd6Szg4KzhHYXdibGl1?=
 =?utf-8?B?VUIvdktVdXJoUDNzQ3g0aDFibU5GWmJBakkraktYaVB0ak9NNmVTV0tNbzBy?=
 =?utf-8?B?dDVmczZlcTY0VXptMFZUa3hjOGxwMHBhMnpGMVBDSzc5aDRhMHpJN2FFTzky?=
 =?utf-8?B?ajZrcXFMc1dsK2h4MElMTkthV0J2YWxQNndGcVUyUDQrOU1MTEk3K3RFaVdv?=
 =?utf-8?B?VGwxWEJWNjI1UVpWNzRXZm9UT3lqUEVPTnFmQ25rcUNXQ3p6M01EdTdrZ0dZ?=
 =?utf-8?B?aWh0TkMwd1cveUUrWWljdGVjekVoQzNieG1QL2tWVVZEMzlYSkE3QnZkQXZw?=
 =?utf-8?B?VU5SeVowKytwdENmRldxUXo4ajZjblRqZVJqU1poajEwN2toa3BFd3orVFZG?=
 =?utf-8?B?Q2M3NG5mTFhXdjJNTWFwSnlMUjBnaXhveXQwSjdVT2Z6OXJHQUQ2SHVQOGor?=
 =?utf-8?Q?sy8z21y4toTw6oezkqyyupGoY4NRLKyg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0tRVHM3eHFFT2oxd0h6R3c0K2loN0hlQ1BMZytRRzNycmtUZ0k2aXBwS3pu?=
 =?utf-8?B?Tys4ZVY5a3FEWCsxSGRnZVRqYzAzeFBOaWc3eHNoOXVrVXoxd3lZRTRyY2c5?=
 =?utf-8?B?SXN3WDJKNGFuSjZIYmxhM0UrQ3plUkE2WlkrT250NGt3ZS9WWFczWXFqMjU3?=
 =?utf-8?B?cVFnSzhSQTNJL3RueE1GQW8xOS9CdlNOUnkyd3k3a1R0MFdKcmxPcmllZzZG?=
 =?utf-8?B?T05VWElDMjBuWmd3UXVHS2JCT2dKSEFabkxCa0VTaGFDaEcxbE1Wa0lnSTFZ?=
 =?utf-8?B?K3hoTW8wRk9oeWdUaENiTVU0NCt1c0d4RW5NRGlVV3ZFRkJpb3VXcVUzeTVX?=
 =?utf-8?B?ajVzQ2F4YnVjNWEwb2VVZWFuRWtsb2FiRllqV1d1MDZhWHFmZG9yTENLQnFn?=
 =?utf-8?B?TDhydDg4bVFkM3BvT0owQVVrSVRTM2h6aTF4R2JoM3lER1BPVEUzYVpFWXNv?=
 =?utf-8?B?eW9TQ1gyK2s1R29qT0FKdEo3S2piYlpGK0x3VjN5S3hMRWt4bUZaS012WUUv?=
 =?utf-8?B?U0ZVUjdXd3hDOGUwcUdkQmtjNkNpa1VDNnNJWGFEeHlENG94alRCRHllZHVa?=
 =?utf-8?B?OVJZbnpVMXoyNEhML1lZbTBHZFd6R2l5SUJEYzRoMHdlYVNRNTc5VGw3aFNT?=
 =?utf-8?B?RDFORzRyUUlYTGUzMnhEZE5pNWRVWmFjK0E2WXlVakdlRzlsdE1XbW16WGZR?=
 =?utf-8?B?Y005RXZJbjZrWDQ1am9JTUt4RDQzV21DUXdKTFJEdUJxOFJYZHBxdmZFdkVT?=
 =?utf-8?B?SVFhT2hTeUJ5LzgxR3ZjRXpvZlRxcUh0SVJkeCthejRqbHl2c0xvVTFsNlV6?=
 =?utf-8?B?aTVkRDRaVFQvZ2pvTFZMRFZHeWwwcHhqRkNpekxrRHE5aGhybnJpNXNZMFdL?=
 =?utf-8?B?SFFmNFBNeGhtY0t4cEQyYVo4S1NnNkhlTkJsQ29FOExGV0x2cDdkOUFkeXJp?=
 =?utf-8?B?QVlpVFMwMy9qRk5tVmxDSStNYWQ5QTFTWnlqV1NDM3FlQW1RY0h2aE5NSWFa?=
 =?utf-8?B?dGoyU2FkVkxKWmFsWjN1a2dkNVFqTWlNRng1WFlQRjVGbmxqd3JsWElPRDIw?=
 =?utf-8?B?d3FjZlBjVHQ1WWlUQmoxaUVLN2poU0llRzlNZnB3cHNsUUJoVk53ZzI0QmxV?=
 =?utf-8?B?SHM2MEFxYmxVMFFEcHFKSWxPS1pMejRoWSszSkNPS2tLakw0V1N0SVFSWmhu?=
 =?utf-8?B?ZkxoK0NFMml4RGpvYmE5dUxQZUs1eGZxQ3N1d0hPOVZ5N3V3NHNrVkp4bWdQ?=
 =?utf-8?B?a0NnVUdrOUVvb2U0YlQzb2hPUnJkZ1Q1Y05TSmxtUGZaK3pEY0Z4akx6WUNH?=
 =?utf-8?B?czE1MkJnL2tsQmN0SURZYjNUSWNuSkNwWkxvcHExb295ajQxa0tMK0hUc0N6?=
 =?utf-8?B?VEJ2Y3VGdWp2U3hCY0w0T3ovSjJwZjlBMTdDMzUvenZuckl1YTNZbGZJeVhD?=
 =?utf-8?B?d1VKd3duTVI0WGs0M0VKL0xod0J5bUtFcHFSaXloTG9GbTF1UUpMczlmbHdn?=
 =?utf-8?B?NktONjZ5bW53VnZmcW9XaXA3RmxHWTlDR1ZtYngrOG0ydW5NRElSK3R1Titw?=
 =?utf-8?B?UHpkT241NGhGRU9WSWNYU1FpbE1HMklqN1FURzdqcWsvdGZ4emFpcmJyb1R0?=
 =?utf-8?B?bzhjenM2NzcwUzFQK3pCVmVvTm1ITVNmVitlbEN0dURhT3pYVlh2M2ZIa1BP?=
 =?utf-8?B?Zm5JRDNuR2NmNEI4MUtnR2dDb1Z2V283VXoyWC9INncyTEVpS0ZjczlzVVNY?=
 =?utf-8?B?aVNiK0dqbG9DTVJSQmd1b29LajJOcENNQ0NCSkYxSENVWVo5MnUzeU5hZ0RF?=
 =?utf-8?B?RUUvSEhiaDErTVRWOUl0YUJCeVRpNGlHUGZPOHhGYWdqRS9WbW9ObUk0N25W?=
 =?utf-8?B?azNsQWNXVjlVbDM3bVRSWUlvdXZDcVZaSXFoZW1tSHRxcUc2YW9LWEhEdXZ0?=
 =?utf-8?B?MHBObnpORlFiVHJ2WnVJTDRxa1kwaHlScmV4YXdiVlNiejNGWGlxYmMzNHhj?=
 =?utf-8?B?VlBUZXd2YW42Mm82OFN3dExpOHo3U1ZPTVdSRVJzL2hVa3NPejlDdmxkeXUx?=
 =?utf-8?B?VjBFMlc1ekxCOE50bGdqa0tFTUJlcjhLQVdJbmhiTXQ0cFRBbHJ2T2lQZWcy?=
 =?utf-8?B?K2UzQXpVYmNLc1ZrSEJnKytXRlVFOUdqUVNtZ2pueTRjQ2dDOFErZFRvM3Fi?=
 =?utf-8?Q?W+WRXm4L7TPm9XeERk4RsgaXduP0Mx69Exb/YclMnmBZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15577fa4-d43e-4ffb-9f3d-08de290bbb26
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:39:09.6991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPW8iP0xJb77kLI2Fo22I44MCyTBMCoAyGoDG+hjZ0sfvzdzNlIzIQdoQnNKS5s6Ojp9CfZUCERTZ5fYqqkyqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541

On Fri Nov 21, 2025 at 11:30 PM JST, Gary Guo wrote:
> On Fri, 21 Nov 2025 15:21:45 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
>> >
>> > This kind of thing is why I keep saying build_error() is too fragile t=
o
>> > be used at all. =20
>
> The case here I think is a perfectly fine use case of `build_error` as
> it's completely by-value and does involve references. If compiler can't
> figure out, it's either a compiler bug or a source bug.
>
>> Adding `unsafe` blocks for things that should be able to be statically
>> known isn't great.
>>=20
>> `build_assert!` is just too useful, so it is best to try to understand
>> what can be done, or find an equivalent solution. Gary et al. may have
>> some input here.
>
> I'd argue that these build issues actually helps us catch missed
> optimisations opportunities :)
>
> For this particular issue, I noticed that none of the functions
> involved here (`from_expr` and `fits_within`) are marked as `#[inline]`.
> I suspect after marking them as inline this case should be resolved.

Indeed. Another thing that caught my attention is that the `num_bits`
parameter of `fits_within` could be turned into a const generic.
