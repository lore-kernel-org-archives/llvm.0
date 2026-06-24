Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFB823D7FF;
	Wed, 24 Jun 2026 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299087; cv=fail; b=pb5nJE1wJuhA2+0uQsA19mVgfh3EiROLshRBUtqnA1K9MyYJcChAbpdWFvItKVMPTiV+f+NlqqHSk34xkfaYBhl9QRmMcmM4idDP9phZv4LFaLgQB2i1R0E3VlGdIWVZUX9KPfyoQVqeKOpxITUJU22IvWFbi+CfEf/GKfiqsFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299087; c=relaxed/simple;
	bh=7PNNUgkjofDMvfLgYAs4iPLS/kaldodyQz6SVYNzrVs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fsMSNRAtcu5QgZG/beqCunvQCP6V6SiieU3XGJSOyC4pm9zImSRwwoV+12DFU39PGeN59l1BLsFH6sKFI+ejPjoDO2J2+9q28G++8H2FdEFkhzA/1Eowz2lEDRET3PT/BgcyW9t2zrHGtkfE9n13aSKFioUfapK9pVtJZhuNZcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EJEsmxYm; arc=fail smtp.client-ip=40.107.200.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EJEsmxYm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6lzsNtqIfuS6IwOvakptqgzKqWctXydkkrt/HIMBZ2TFCyge3BP+dQCASqm2/ro3XQocghxc549Wa+BU679/hgvKVjK+dCMiONWuOxncMDIDdZRywRFfVlQ+Rmyo1+3qqKMMDqEI8rtGgiVdN5WYpDQ6LzIzafJkwGDBqu7ljpPFl6ydftoXnnBc0GgTKEhqzFgoZwyuaN5DsYgYbMUrcva4/X+DshE5EjmvGEgF6QNbwz91zoY4UBfyuLWfIVQ0/NvWIZz9vbsKGAyuqLMmLyySEZuAoc3TJXb6bbfvZKh2UIcKYEtllQWGkbU/PZqfKNMb8SSsErW8Q5FdyyXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du0Pc+pcNgFIsUlsSLXjrN/BxWNnLCMWSxxakb9/2Rs=;
 b=PCK2DQe1CJC44eoDFx6k6GewyWl6eLKruWOiHpF9sYRod/xA++/qqCYQkK2j6+wnKApxGJal+PoYRrv1Hwho5EaYoY97va/kVgMOejkiylp7p06Lv1Ag30TUX46G8xhDvlSxyFZ7wyWQGb/ZBDn+8mA3y91n6xVBteUP7kIldTHdj4OcCJq4LvaIc5DbfMdM1CJr9b+2f54k26jw7QaXPlBlbTjOpoxGXefeFlJxcfL3GiIXTmxZrC7BpuHJDMy/s4VlI37jlsMO7DUQEnTQgahZKhh2SC/doK/jXxnekqy/hqc9GHNxUtHpjN0rANDCh7s35TBHsvtBS4gWM2SpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du0Pc+pcNgFIsUlsSLXjrN/BxWNnLCMWSxxakb9/2Rs=;
 b=EJEsmxYmOG6w7oWjqmA8tTSj1asFs0SsiyzJtG1fXUTUS87fUlu0XZ99QAoJx883kbr728qee28Frw4dXLWq8GnkRYqVABFVpR2WaPKFtzRNVvUPv2nX0AKcPSMsb1fzU20JP2KWrkPOfitMYMyKSul6w4PipI9mfvPDZGmCPMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 11:04:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:04:41 +0000
Message-ID: <0ff5f3f7-c2d3-4b56-95ad-400626d8abb9@amd.com>
Date: Wed, 24 Jun 2026 13:04:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 kernel test robot <lkp@intel.com>, jpoimboe@kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
 <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>
 <20260624105658.GB48970@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260624105658.GB48970@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 406f34d2-a3da-40d3-6a53-08ded1e063c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	a3RSxji/u0lNcSf3jTAAXT0Gw0jsAcGd1PBVLhxqRg0c3VPFMOOM5MKM9S1JtegGB1fR86DM3XNRIcYISIhycRB4pbvs0vP8FISoaT765q+kUXYX8Q+wbi3ajIMR+AhXroFONTPRLWMbQptPARxbQRpRpWFikYssgN+C1Z6IDr8drt2EE1lG/PVywgEFJnjXumCgwhfNCJ751UdK+E32+bYLdIhbAGaKwt2oWLovslgO3TQAd35EwGS8AP+FxLTfhTTOKk+zKq24INTHIGM/MEb0w8hpnXIAqSHKyspiHKunfUBgmVYxnYJZTvzN1UphkAZd64PvBEHlJpuZYLGnKkL0v4NBryvs40INSYKeupACu5BQ9RyW1nIPG39ySfvXW86/1h+t6XLntYXoEU3AQJAb/e8APZf6UmlP9CF9nZco6r6ncQRXXVibsK0XZ8BOqmws7tRBRBfoPZMkRj4LO1BX7lBvAzkRZS7PuXTrP3053z4JuUw8gQPvtAkA6+Crl5veZeYi4cQEWFojaCP6yxBtwzTT9XGKGvYenCTTAt/Fl00Gv1vZG7lAnJ851uTBQORsb/27gNcufkiVhtC8jAwTlCCm1tmL/CBwbxWXBewAijYoX4YDm7D6GZGoM9SHsIYRuL3ZuEiYtdPtK7OabV8xr9qxTJO7WMmneyguy20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJjS0pkSGs5b3lncjdBWXVqeWZSZk9nRFhRcU1YTmhSdW82eWdqalZ2OEFs?=
 =?utf-8?B?c1EyUWhVZk82YkNNRTVxMTlMQkx6eTBiaWVsbXJUZzZBZ0xYWlBQSUgvb0dC?=
 =?utf-8?B?eTg4WG51cDh3RXB1WWxNS3ZPVTVJcitoTzBUYWtuWTZkL3JMSmFMTGxpV0lt?=
 =?utf-8?B?aDVnakxrRytmdTFadlREZUFMWEZZQVQ4UlVwRERucFNsazA0eXZKZ3lCTTZa?=
 =?utf-8?B?Q1czQktTdk4rQ1cxdlFZVTI1SWl1MVpHMGJqOGM1SXFNWks1RlNVcGcxVFRU?=
 =?utf-8?B?b1FKOGxCZVVzalBtemRxbzFjZ3NVTmtWNUlISEJFVUEwWVArNHVBaTFEa0xC?=
 =?utf-8?B?clpCZG01L3BxMG9jeEh0U3ZKbENreUo5a08wVFdVQzdyc0UvM2cralRONFJ6?=
 =?utf-8?B?eEh6K0E4SUtkbExjK1IwcGR5UzduNXltZm9vN2J0VjNqOFJiS0szdlFXcjZm?=
 =?utf-8?B?RXNEeGtibGNtbW5jbEh5TVhGZzNLOUJvZEdlVkFCTkppTTFjWGpFU2F6dXk2?=
 =?utf-8?B?NnB4cm5NdG5hbFU4U0Z3bUdQZVRWRS9mQzhwUDRyOVp1ZThmYUo3RkprdjN5?=
 =?utf-8?B?bVZteTJ6VDkxZFRSZmRidXBJVE5SSzYzWlZxNjNnV2xraGtPeUpWY1BKUXlh?=
 =?utf-8?B?S3VmOFMzODQ5ME9JWmh2QXAvekk5Q3F5ODJXb0FRWHdNaWIwV1o0WVZNMzB5?=
 =?utf-8?B?Zzg5M2VtVzg3QlBjY2tTRytaUmRqNTgvQ01ncTBCN0dra2pLVyswMm9zcUZP?=
 =?utf-8?B?bVhiUG5kMys2ZGw1NDlkZjl1cDNjOHpHbGcyQUJscHhSZXRlVFJnU1VGVjYv?=
 =?utf-8?B?ZlRzOUUrcGR4M2F2YU1jdnlhQlBiTzM3bVk5dWN3RG0xUTE4djNoTUgvcEl6?=
 =?utf-8?B?bEtFOEJiTVJmaGVFa1R2SXk3RWJwTlB4dXM0NHVGYlFyZzU5Y041OXFMOVBn?=
 =?utf-8?B?blQ0Q0RGOXJNWjhFeFhUdGNSSG4yNDNWdEFrQkhOcmM1OTE5cUtpbjdFNzNO?=
 =?utf-8?B?R2wwMThzV1c0aEx6Zis1Z21HV2c5N1BSYnlJSDNzaUtOQW51SVZJL0R0b0pY?=
 =?utf-8?B?WDd3ZnRWR0RORHBaZ0lnYmxHQ0IvZGpvek50Wnd4MUxSdFhxUklSUHZOZGdX?=
 =?utf-8?B?R3gzdVUzOGw0WVREM2U5cTRsWDdtVEdxdU1wRUdBNmQ1OWg4Zk4wejhuZEs1?=
 =?utf-8?B?a3RMdHdkOHBkVVIvc3ppcjhnWWNuSHp5T1crVitZZUUzLzZqb3pneFBZVlNa?=
 =?utf-8?B?NDRoSHp6OXJyTDJZTmxSam9ES2gvc1ArcnUzTG5TaFVWRDM5VjJNc1c0STR6?=
 =?utf-8?B?c3BKWTBsSU40dXo0VWpGNzBGZW1OQUVieWRQRkNnQlN0MllIYlRXeHRqUU0y?=
 =?utf-8?B?MnVqY2lGSjhLUmxFVDI1d0xIT3lPZzd1K0IvNEdXQlVkcEpDcEhIMWtrV2Z4?=
 =?utf-8?B?SEUzMnRuOW8wWC9lSGhjcWE3OHgrQ2wydGZOek9ORXRqanJralNFSmQwOVNB?=
 =?utf-8?B?TUg4WEl4ZkV6UHJnQUhFOGZhdXN1VFpYa3k1bDJRd2FvYzFIVTVEcFBZUHVV?=
 =?utf-8?B?M0FodnJ3dWVmRy9UeUxLVFRrOE9mUHRrczltWkE3ajRhcTVvUUMvTFVVTHpN?=
 =?utf-8?B?a29mdjZvMUs4NnlmZDRpTExpR3dJcmJpMEs0N2dPZHNPSUtDL3BLWGlqMVBM?=
 =?utf-8?B?TC80UDd1L3hiTytjZWh1MVAxZFZmY0RwS3U3U2VwVFVzL1U4aE1PbnRLejY0?=
 =?utf-8?B?ZmRxbUNqOHVmWUlIb0JvWjBBNXFKMjJTY0Vsd1ZsTlRIcVJpZnBPWllSaG1i?=
 =?utf-8?B?aVZlMnZEaDE5L1ZuUDZmKzg0amRRQ29xYkZ5eVZTT1BjR21ObSsxL0pDSU50?=
 =?utf-8?B?dk9NMEdKejFvaHJITHc5MVgrUVZpRDJlKzJDYzlNYjFwMXZNcjJMd1JUcE9h?=
 =?utf-8?B?bGM4d3hNSG13d0p0UVJnQWpNWitCTFRWYjcwVE9wTnM0bEF0WEt4cDVKdHZt?=
 =?utf-8?B?Z2NZVUQ4a1JOTVhmc0lVRCtVNWllRmJOcTBXaGdMTnRSb2pXUHV1UU8zanBL?=
 =?utf-8?B?S3lsdzdQeDdkdVBNNlZjNmlrVmdBc3dOcHRxTk8yZ3pWQXJ2VHFSYkNJNk1L?=
 =?utf-8?B?YkIzenFFVTlyTzNUa3owTCtmN3ZyakZqdGJsM1gvUnRiMDRlNGNQcDIrQmhy?=
 =?utf-8?B?ZENvb2U1MlNMbDhmSm8xQVRqK1hMYVozdEJ6ZlE3ajZRdVI1VlZ6MGg2bitY?=
 =?utf-8?B?VlRoa2oyaGhBc1dQU3EwWnM1UGVFOTlKK0pHVWdvNi8zRVRzaTBsYVZ5dDVZ?=
 =?utf-8?Q?Rq35KgIVLJCq5sdQsT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406f34d2-a3da-40d3-6a53-08ded1e063c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:04:41.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/q6Z7dZ+B8JY2tOOMVIRyNSkL6G+wdeL16ufnUsr5HHRhO8+zxv0xuTPP9RgD0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

On 6/24/26 12:56, Peter Zijlstra wrote:
> On Wed, Jun 24, 2026 at 11:48:09AM +0200, Christian König wrote:
> 
>>> So, if my heat-addled brain isn't completely gone, then this all boils
>>> down to something like:
>>>
>>>   drm_exec_init(&exec);
>>> label:
>>>   for (;drm_exec_cleanup(&exec);) {
>>>      ...
>>>      if (unlikely(drm_exec_is_contended(&exec)))
>>>        goto label;
>>>      ...
>>>   }
>>>   ...
>>>   drm_exec_fini(&exec);
>>>
>>> Except, you've laundered that label through a computed goto to allow
>>> multiple such constructs in a single function -- because can't have
>>> multiple identical labels etc.
>>
>> Just FYI: That's actually not the reason for this, the label name is unique now.
> 
> Yeah, I know, but I thought that the only way to transfer the name to
> the drm_exec_retry() sites was to create that computed-goto alias.

Yes, that was also a problem.

> 
>> The computed goto is used to limit the scope you can use the retry
>> macros because we initially had problems with people using that
>> outside of the loop.
> 
> Ah, also a very good reason.
> 
>> Exactly that, yes. The nested loops are unfortunately a very common use case here.
> 
> Yep, saw that.
> 
>>> That is, I think this drm_exec_until_all_locked() thing has some
>>> fundamental problems the moment clang fails to optimize it away.
>>> Correctness really depends on the compiler not actually ever doing a
>>> computed goto.
>>
>> Mhm, that's not good at all but I also of hand don't see a way to
>> avoid the computed goto.
> 
> Best I can come up with is something like this. Not exactly nice, but
> should be fairly trivial to do.

Yeah, definitely not nice. The macro was created exactly because people messed this approach up more than once.

I could live with some other hack/workaround, but clearly not with changing all users.

Maybe we can goto the fixed named label but have an extra variable to check that we are in the right scope or something like that.

Regards,
Christian.

> 
> ---
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index 2fc47f3b463b..7d69c06b2dd3 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -60,6 +60,7 @@ static void test_lock(struct kunit *test)
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		ret = drm_exec_lock_obj(&exec, &gobj);
>  		drm_exec_retry_on_contention(&exec);
>  		KUNIT_EXPECT_EQ(test, ret, 0);
> @@ -80,6 +81,7 @@ static void test_lock_unlock(struct kunit *test)
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		ret = drm_exec_lock_obj(&exec, &gobj);
>  		drm_exec_retry_on_contention(&exec);
>  		KUNIT_EXPECT_EQ(test, ret, 0);
> @@ -107,6 +109,7 @@ static void test_duplicates(struct kunit *test)
>  
>  	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>  	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		ret = drm_exec_lock_obj(&exec, &gobj);
>  		drm_exec_retry_on_contention(&exec);
>  		KUNIT_EXPECT_EQ(test, ret, 0);
> @@ -134,6 +137,7 @@ static void test_prepare(struct kunit *test)
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
>  		drm_exec_retry_on_contention(&exec);
>  		KUNIT_EXPECT_EQ(test, ret, 0);
> @@ -166,9 +170,10 @@ static void test_prepare_array(struct kunit *test)
>  	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -	drm_exec_until_all_locked(&exec)
> -		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> -					     1);
> +	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
> +		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 1);
> +	}
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	drm_exec_fini(&exec);
>  
> @@ -181,15 +186,15 @@ static void test_multiple_loops(struct kunit *test)
>  	struct drm_exec exec;
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -	drm_exec_until_all_locked(&exec)
> -	{
> +	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		break;
>  	}
>  	drm_exec_fini(&exec);
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -	drm_exec_until_all_locked(&exec)
> -	{
> +	drm_exec_until_all_locked(&exec) {
> +drm_exec_label:
>  		break;
>  	}
>  	drm_exec_fini(&exec);
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 8725ba92ff91..f2bfa6aa7b7b 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -101,17 +101,6 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
>  #define drm_exec_for_each_locked_object_reverse(exec, obj)		\
>  	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
>  
> -/*
> - * Helper to drm_exec_until_all_locked(). Don't use directly.
> - *
> - * Since labels can't be defined local to the loop's body we use a jump pointer
> - * to make sure that the retry is only used from within the loop's body.
> - */
> -#define __drm_exec_until_all_locked(exec, _label)			 \
> -_label:									 \
> -	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
> -	     drm_exec_cleanup(exec);)
> -
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked
>   * @exec: drm_exec object
> @@ -121,7 +110,18 @@ _label:									 \
>   * guaranteed that no GEM object is locked.
>   */
>  #define drm_exec_until_all_locked(exec)					\
> -	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
> +	while (drm_exec_cleanup(exec))
> +
> +#define drm_exec_label							\
> +	__label__ __drm_exec_retry;					\
> +	__label__ __drm_foo;						\
> +	if (0) {							\
> +	__drm_exec_retry: __maybe_unused;				\
> +		continue;						\
> +		goto __drm_foo;						\
> +	}								\
> +	__drm_foo
> +
>  
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks
> @@ -133,7 +133,7 @@ _label:									 \
>  #define drm_exec_retry_on_contention(exec)			\
>  	do {							\
>  		if (unlikely(drm_exec_is_contended(exec)))	\
> -			goto *__drm_exec_retry_ptr;		\
> +			goto __drm_exec_retry;			\
>  	} while (0)
>  
>  /**
> @@ -158,7 +158,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>  #define drm_exec_retry(_exec)					\
>  	do {							\
>  		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
> -		goto *__drm_exec_retry_ptr;			\
> +		goto __drm_exec_retry;				\
>  	} while (0)
>  
>  /**

