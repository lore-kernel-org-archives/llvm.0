Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020085.outbound.protection.outlook.com [52.101.189.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B6194C95
	for <llvm@lists.linux.dev>; Mon,  1 Jun 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322389; cv=fail; b=gZSLQ/oiU02vq3dTsLZFNOzZ8yMPk2JrnLItZI3JRfMHlI/CWUUjgYutxD/FWACMOisBVWLd0X0XEqqt8nO22shVS+swSku+6QrhaTFrDmsaKDmNTfJX74tKmKbtmG2XNad4Q3ox/kmOQZwNI+/k4+Hqs2mm5Xcu8KXfXslGU4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322389; c=relaxed/simple;
	bh=K19dH/kNk72WBMiX4ZVUIa8BxFIuXf6YgabGBllJIlA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PneCXtRVYCC9HX+V3CGZTIbEh5k2ksJG9v9LWjOV20xmCe8/WmEmxXi4M4+QtFVLdbeQjE5LTC+eFGIX+pXd5zOhq3mBoTBtJxwTYInSv9+yP26l3qNiij7lxH+VN0bE4DBYcuKqVIDKizAgHIz6fEPzhbQubTuSHFGFd0K8vw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ePJ0h4KM; arc=fail smtp.client-ip=52.101.189.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ePJ0h4KM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlsvyQjTiypXLkLfTor2ecgcEslsB5le3eWxskCxdxXRwdrQmL8QeA2RJ6s8Rw7UCSP3irEDS6ikBibaEflQ0HbVUCoAwdvFWg9qy766CaqOZAm+/EdT70AN76D85EZ8FAPyXFiD2bmFrDQyLuuQPpkwKXGl98x4JUb3vv5WcWkT3/VZPKly2aT8kvY8y9D5kcaREgjRmVG1auFDLexpmcPbG3eTsfMqLphFQI1XIRa4/ObroZIOmscruw3lwk/cM7Ee1lbsKXcCDvQ4SoASeLAlO0Dy/8Ojsa/vf/gVwheELVJTyDzKizdD3vw/2XvkpczZ7kBQvHtAwySj1yFCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3L4K/lRdhgJKDg8kv4VcNtOk3qjwFawlReULMtPuBM=;
 b=Zv4frwcvcaGT1wkWn2NwM+lqc37fT0U1IzWiwuRhq7FKSF/8BMg4WwDJqRojpQRE927cZOalRRGbEvSAutrmXM/YdXzfmm0eWJjWli/ihGXOSnAp+uW31yKSFTfbr2qqLOHmcdVxt/NTORfL02BT+2fdwnuiAGaAoIAoZMDziWESs8YH3e5d5t2mAkgXJ0rj3xm8D+6UbUsz/2Y84rYzVkLYvYk7JT7XfxBKbOKM6uhhPinLH2e6yJz9ZKYWuVQdGMBCQ+qUIrnkb3crxUPXVQ4TTZgJdzGJH5TKSKy9F+dzhNwRC5txBiN/khBB4UQMKrviqbcOV8ESiQdjB+ArGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3L4K/lRdhgJKDg8kv4VcNtOk3qjwFawlReULMtPuBM=;
 b=ePJ0h4KMUOFKBmCEBoScZZO9oTflscv74ENpWy3kcAkFiMeW0DJz9XdfrbtorDSVku6a22KCOEVAxPP/305gBMQ0l386xhI4CLKqUi2ANBS9PPznkbnMP/89WTgQvnTPVTLBih3mZ6qRdfLDF4tgjvqFi0DVDrQu7jvvDSn3U3+juwkOzRlMGy2uasL/YFdJou5s7Wwf/3I50tR3nJfnAegwVJ5f9fCK62hrZukv3Blqcgoe9v1SUkdvC7g6WkivWaTr6VB9ki3c6L9FJP8dZKhmzuhrYEz7GW85c5ZGdsOgiLHR8KwZrYVb4j4vuES9EzV7rONvxiGVPxED3+I79g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB5423.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.6; Mon, 1 Jun 2026
 13:59:37 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.21.0092.005; Mon, 1 Jun 2026
 13:59:36 +0000
Message-ID: <5f8457e2-ffc5-4a0f-997d-a0f11641979c@efficios.com>
Date: Mon, 1 Jun 2026 09:59:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
To: Qing Wang <wangqing7171@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
References: <20260601021359.3679327-1-wangqing7171@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260601021359.3679327-1-wangqing7171@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0005.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::13) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 649d0066-98db-41ec-1707-08debfe6041e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LIY8fFfF4lA9iHEsHL9sAkfZWWLlffpVx3MJN0kXa0Z4VFabtDFsKNaeruQMPoffx0L5kRUCkujcYRjC4KyjbWsFH1fV+vbUSBnQQK0edWfF04DStZmPD0BdJcPXU6Wi+gA/uuxzLzXKeyc/0YtMmqvjLhSJ9vk1eUd6uGpuAN5sXv71g/dqj13nqkzMlNtUzmMP/NaTYaop2pWN32IDKS1Xo906ohSakcbrN+Z8n7ushXcc5DDvwX7tIykoUTvyMM0/3/N8tkQ1ewag9CLnjzXiCywf1zPbvahqAqlQgwnF+KbVPGd4dmtgZZ477kVgL52xK6+qK2jbQf0xnFjCfZPcDHHxYaLkzxhCU/Ob8PUPPFsnZNV0ImgbeAJmJSA0qiPAgcsuhdfaBEVQHcm3gVLN+acd9+wPQqeHM+ohcZqaTGVIkzv7w0HnHoWvup85poqOVnt1ngbDMniRGyVDTDyLz2M+NmM9sCXkW+v0GNrQxVkWvt9M1fDX2SrnMJZiQkS9Islqz7gDca7ujBU/XdzWFZEgoa+jhQIDs5qFVOXi2rxcvd1jy8604qYm+wy/8/A2oSH5dv1sfPwyi63ypkwV9f7GTFbMqSsYHsojVUDXet6a8HmmytVx9UgDMopgNxBEwzBwi3XAP3IcJMyzLirFCNo7Ikz+SKa2t2pzWVIng4JM1Zkak0MRNpfjGKTT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW82YUg2NWpML05tUDNUdHpFdXlmWmVKM3FjQk1YOERGekpCZS9zREtNa0Vy?=
 =?utf-8?B?WXo4ZmdWUWkyK1gxQTVRRlVHTjhsY2VLRHROb1VHcUhkZWl6b2ROUHkrS3Uv?=
 =?utf-8?B?L1MvWVRtdUlqcjViY2sxRSt5aE1EVUNRcmxBbHB2QTNXOWRieXI2eXpaUXp5?=
 =?utf-8?B?Y1AwdVR0U005V0MyVnQ1c0piLzc4TlBsMmIzaFZhamVyL2h4RHVFTTBhVXNz?=
 =?utf-8?B?SHNlbTNDRTh2RGZLcnB0bFBIbWRHR0hDaG1NZktJL0pkb004dXJZL0Z2SVBG?=
 =?utf-8?B?N0pybW0rWi8yNE5oRlo2OVA5VUNVbVhqMVM0K0dpY3VZZjNGTFhQakRBaW9h?=
 =?utf-8?B?ekdvRVBPY3pXWTN6NkZZLzh6Z2RJLzlUdGpadVFyUG82bTBkby9VQ0V5QktS?=
 =?utf-8?B?UEVyTlE2NEFPRC9nK0gyVzhBOVljNHFvcDJyMDhIZ2QxYjM4em94VG9OeVdR?=
 =?utf-8?B?ZmduWVVzZmo2Q1VxekxVcmdaYnREcUw1NWRoUW1vbUhSRnY5K0ZKWjMvaXZJ?=
 =?utf-8?B?bksrcWxmQjR0dTdyL2JmRG4zdFVJUU16UHo5blZwTHJIVlJ6c2Uwc3RWWkx0?=
 =?utf-8?B?SERISldKMnVUanJTZSswQkd4OGlPbTlCUzJzdnZXTW54SWllYm5TSEVLUGZI?=
 =?utf-8?B?NEkrdjlSc1BqNzFXS0UrVjBTSzVESmhlRGh5emhSbUdIZ2ZNVXIrU3JZbEtv?=
 =?utf-8?B?QkJjTzZQQjdjS20vV1Q4WWpGSDRLVnlGdDFPb3RKZUs4SjdHdXpDclVKU0FH?=
 =?utf-8?B?QTlrekU5SU1seTRDQ21WYUVFNFY0VFFiSktpOGZHRTdOSlZBdTZDN0dGU21T?=
 =?utf-8?B?cGdlbDNxS3JOTDk2VEtVakFZejZDT0gzejQ2dmNqT21QNkVRRU5PTWx3RVdM?=
 =?utf-8?B?bDUrd1FEc1BjeldzK1V6K3hyTWN5Skx4bkNPSHFwclVoaklaWjZuUHd0MXhl?=
 =?utf-8?B?ZzhhNFRWSTAyOXAvMkhvYUlIZ0F2NG9nU0JKa0tXYldSQlVWZ2srMGpsR1Iz?=
 =?utf-8?B?T3A5Mit1eEJhVTllSVRDZXBFM2c0VXNKUnBxOEZZbTVDTi9yS1FCaEVMSnRV?=
 =?utf-8?B?Y1FrY0RkbGVTYnJFcDRrWTFZWDV1SjQ2TDg4RzdPc0M3RXJJOWk0akNTejVS?=
 =?utf-8?B?dUQ2VWFhdEFhdzRkU0hwVVFlcVVuMmVveXBicUVnMmhCVm9keEtpa1NMQjc2?=
 =?utf-8?B?Q1Q2Q095eFVVMHZXMGRyYVhxcnQwVElFVjlSRk0xOFRremhOWkVLMUVKdE1W?=
 =?utf-8?B?eEU0L29jUnRGb0RRZmw3R1k2TllNRUJUMFMvMTBBQU9uVWMrTGswRTVRTFkz?=
 =?utf-8?B?L3BxdjdnUWlhNXE5Y0RKUlkwa1ZqZGI5OUFqdFRWQTROblFtakhoWkxWc1M5?=
 =?utf-8?B?S2FYZEpORFhzNzFnZndFWUVtUU45U3F6QTlVMXdvekNjdlh5MUxOS3lGWHVx?=
 =?utf-8?B?Y3ZwQTMvc2J1cEZXYUlXd2tDVkJUQ2taeGdkdkFlaDN5V0RTSURxY21VMzNx?=
 =?utf-8?B?SU1uR2pUcUxHVWJHUVpsNUtoRC9RSUZsbnAwSG1rUy9nRjV2RkVSRURkc1Vp?=
 =?utf-8?B?MFNpeHUvMytDTUF2WGU1T0RYL0RZS1JUdDNJckdDMU1tOElUVFdUTldWcS8v?=
 =?utf-8?B?VEl4NTJVcmJXekZLRkc1UXJRVkptZStIckVEK0NxaEFsL3pmT3BhalZSZ3JY?=
 =?utf-8?B?blo1bGZsODU5T1VCdXYrWGdJVmtMakF5OWhvQ045RlJDeE1CNm9IbmhlaXVw?=
 =?utf-8?B?MFNvSkRFZHB6NkdVUWErTjZLWTZsUTBsekhYSmxBcXUyQncvUFFpVnhxT2VW?=
 =?utf-8?B?NXdjVmsyKy9TQysvS3JYVlBxOFpiYzRFN0NJUm9OdXFxQ01UT09landyb1g4?=
 =?utf-8?B?UjBwUjlmdHNMR1QwTDU5cFpEMmNGaEFSTTJnelhVY2ZlL1JXU1A1ajU2WnVi?=
 =?utf-8?B?emNPaXFLVjRaU3ZjbXJXeXFmWVZlaXV4cmlkUGp6SHhoR1pJQjljMHNDaWhC?=
 =?utf-8?B?ZldENFVGQ2pxMllXOU80aDVWcG02ZWlJSmNaaC9naWQxRi9IRnBLdFZSVFVY?=
 =?utf-8?B?V2dNMG9kTThScmU0bFhydTg1U1hnUzVVV0ZiZXJqLy9DeVpzNGRWdzg1d0lK?=
 =?utf-8?B?bld5RWRzM3pYaVZ5eG02ZEE4RXNPZGdQcjZZKzI1cFZkSE9iREFGeUVXYlNj?=
 =?utf-8?B?Q1JwNm0weEliaVY0QjVtSUFDanhCdUFvRUl2V2FVeFh6d2RBVnZCbWw4Zmky?=
 =?utf-8?B?aHZxN1Z0UzNrUERYc0ovNlZFckZGeVJKU2xGUnI2aUtDWmFKelZXRGgyNVp4?=
 =?utf-8?B?dm4zSTkxOU1zMThnWGVrdW9zaURJeXRxdWZCazV0WjdqL3NRTkUzM0FiZEhQ?=
 =?utf-8?Q?BmnZqQvxNjFljWf0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649d0066-98db-41ec-1707-08debfe6041e
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:59:36.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fozrJYX+kDKliws7jGrWqyyVq/VV3FoWgtJfUBI8TYWaipqIJWZClQa7Y2DI/XNb3dxfVu4urH3pzE5LhUNVeWCxNV5AiYrbjPEkjm5f6ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5423

On 2026-05-31 22:13, Qing Wang wrote:
> There is an bug which is an uninitialized stack variable use in
> `rseq_exit_user_update()` reported by syzbot:
> 
> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
> 
> The local variable:
> ```c
> 	struct rseq_ids ids = {
> 		.cpu_id	 = task_cpu(t),
> 		.mm_cid	 = task_mm_cid(t),
> 		.node_id = cpu_to_node(ids.cpu_id),
> 	};
> ```
> According to the C standard, the evaluation order of expressions in an
> initializer list is indeterminately sequenced. The compiler (Clang, in this
> KMSAN build) evaluates `cpu_to_node(ids.cpu_id)` *before* `ids.cpu_id` is
> initialized with `task_cpu(t)`.
> 
> This is fixed by moving the assignment of ids.node_id outside the structure
> initialization.
> 
> Reported-by: syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc
> Fixes: 82f572449cfe ("rseq: Implement read only ABI enforcement for optimized RSEQ V2 mode")
> Signed-off-by: Qing Wang <wangqing7171@gmail.com>
> ---
>   include/linux/rseq_entry.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/rseq_entry.h b/include/linux/rseq_entry.h
> index 63bc72086e75..e05f4c18f39e 100644
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -638,8 +638,8 @@ static __always_inline bool rseq_exit_user_update(struct pt_regs *regs, struct t
>   	struct rseq_ids ids = {
>   		.cpu_id	 = task_cpu(t),
>   		.mm_cid	 = task_mm_cid(t),
> -		.node_id = cpu_to_node(ids.cpu_id),
>   	};
> +	ids.node_id = cpu_to_node(ids.cpu_id);

I find the fix odd. How about:

int cpu = task_cpu(t);
struct rseq_ids ids = {
	.cpu_id = cpu,
	.mm_cid = task_mm_cid(t),
	.node_id = cpu_to_node(cpu),
};

instead ?

Thanks,

Mathieu

>   
>   	return rseq_update_usr(t, regs, &ids);
>   efault:


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
