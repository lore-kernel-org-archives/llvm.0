Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19D77B
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651143128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVmMzvvsM+l6jjM2DlsQ3PnbV7S7Df9oIF0P1l8IEtM=;
	b=OcV5TasnoHH/SZ9CsKA/9efKPuCUI8XV569PEUvItya7WZlNW3n/UV9EFCd99TlAmwNSL2
	1kzivNEJgu6lIcmEeCwA6ZPbNXAIxbGOn2QTXuMeLbQWzEXY/RvFnNRjIUffMEKuV/2oFq
	xzv+yHDXAkuFa5//wTWY616Mf4ETNNU=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-i6Ad04MWPFW48sVnWO9agA-1; Thu, 28 Apr 2022 12:52:07 +0200
X-MC-Unique: i6Ad04MWPFW48sVnWO9agA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akqDGllr9noMpiQ58SdAZrBJp0YRuQRgPHwih2IqAUH2joetEaPcLXHbjUSW6P/aUMH5f+X5kJEgK5hVVhCYWX+dmGtMj69wdxIHoXT96TW3xRUVMMw3O4tOQgMuQsyovWsRbrxJtG0Tl+CfoH+HDJQNbUP6bpWCAKKBVpULAGfbQygRSKYYIupvuPwMwJdqP9nhZQWE8Xtncw5+7CUpUN51h59CkHZRXGGoznB3U3dH1glrcEBD60OVLsdp86KmEsy7hlh3khxQ83dT4UNF8Xp1vXVjUQvafYC7RTfhar7tLRdNVUm9G+QGya2mP94tzqZptfv/cjIzsEDkt9L5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVmMzvvsM+l6jjM2DlsQ3PnbV7S7Df9oIF0P1l8IEtM=;
 b=J6CKAxQg/SEw2PpygAw2TwwiqKjaU7/ufbR49b24Vt5wTh38eBmDz8yN5QtnN2QicQUp1KrkhwKxyaudxxdWa6thCNtDOojbKWuyTGIurP+Zlj84ICrUf3c+HaQwoMGft06L6RDwXNeXdJN8QnhrLgyQ5ggIgJui310QPUrVSZ4jXQa87LTqBUE/aoPNdsNQZqQaTfsh1v+46vpN1e3UsdAc0/WGtttkgD3iVD59fJiXhl0GW+A7P1zZht8kXZNr1QIlSo9OM24DyeOq6nbRvSC6Rh2XXekYAsoeR7kVV3dfIUuzh8qgOQL2JxlYMVisrntU+cpIOfJt8odGk7kmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by AS8PR04MB8737.eurprd04.prod.outlook.com (2603:10a6:20b:42a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 10:52:06 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::917f:6f1:b888:b74f]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::917f:6f1:b888:b74f%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 10:52:06 +0000
Message-ID: <f0e4e00a-b3bd-e42f-b93d-47b304987691@suse.com>
Date: Thu, 28 Apr 2022 18:51:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC v2 08/12] btrfs: switch buffered read to the new
 btrfs_read_repair_* based repair routine
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <7782502d2dc775c941f2f9e5309cbb9288034a53.1651043618.git.wqu@suse.com>
 <202204281717.jzlTSpQj-lkp@intel.com>
From: Qu Wenruo <wqu@suse.com>
In-Reply-To: <202204281717.jzlTSpQj-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13585752-ed47-42bb-16c0-08da290522c5
X-MS-TrafficTypeDiagnostic: AS8PR04MB8737:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB873708A5B4504EFA8D5AEE52D6FD9@AS8PR04MB8737.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KExJFHagTtTMuhuzrf6R8Ua5893Strsfmsqx3CGcpiHt+88Z754s+PJbidU78sjEgFFsgBLQ6llhavRgsjEeYPJy94Czb3vsdNO32AwFZvxZIHQVgKb1OnwmbSBCU6iyvWW9jfUL85hQh00DxJHDgP7l0rZj/q/puYyD0V91EwpK1XEeYemVD2hcxBUQdv7wEvIxneB0AcG6G6UbBVMz1x3fi7B8FmqHTzFp+hu9jEDmMMerjAbP4xcAfGRE4BhfslSR2er7Z0pomXqnub9cZstqUcL2h0g+b1aCi5nKohzcKBzhgRF5Y84DnN00KRpBvpS5W3sRaL8Wi6LZVCEs1hneQTR/CZyzWuaisfhiTjY7QJGKtGYEb5APVedmXZRFsA7StcP/j9GAqK9zh9/RRdMOOQ5XVa0s9un2rkSYhbegka1TwoEvxENceMBlBl4Gj/Hw1frE1GO//AxUIudncfB/EQFIQDykSwaC9QZ1EMaXw9IYUhvqjtnydHSazeDE0k+vV1JWqy1mJSTG/ElYP6rKANfgsJEAr2L9e5yuduWrz1gBFGxMvncWLZsdHKko3t/kkGB82dim3zEPpUsSC0U1NJ4C2THrAUCrhrcwuVVaWqCOxBDRIw4Az25zorHzHgnIrKSdS11scjvEMOVBgZAU3qeAG+orrSYwVCijXUNTR/UqgYkLIWbGpU4DGb0PHQZfiBMGxr29GWQ9mkFlh/zKbXM6y48eqa1jFJM0R+yRLYjfetOvLfz7Dt3st5qNYOJ4g6MMnJjTPeGE4yj8Xx0SVo91PnJZsJP9HiFKdtyvB983/2DuQYj1P1OjIRzpaQ7KiQytKDBAeoDORTuDNB+lL7lAISTm/IxAdmr2Aug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(5660300002)(186003)(83380400001)(508600001)(2616005)(66556008)(66946007)(4326008)(966005)(31686004)(6486002)(8676002)(86362001)(66476007)(6916009)(2906002)(26005)(316002)(53546011)(6506007)(6666004)(6512007)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnk2R2UyZFpzV3oxalZEV2JVN1lXYlhEbXVjSFkzZW1jOHRxTkVXTWNIRHU0?=
 =?utf-8?B?SFpueWJOSVhQMk1WUGYyR2c1SkZQaUN5NU9Hb2NTektNbWNuMG5PWVBMMFRF?=
 =?utf-8?B?aFoxd3pDTVQxd1o5Y2JhQXpONXdySk5mUHZybnFWcXZoSk1SSEV2YjdLTWlL?=
 =?utf-8?B?aEtZOVMvK29uMCtDSzBtcWZlSXZCKy8wbG9KWjczY0NTQUIyVXltUHNJaGs5?=
 =?utf-8?B?MllLSFNQK0xtaWk4TFZyL2kwWmFRUkdKclVEd2RMZ0ZIZ2V5NExudHVYRHQy?=
 =?utf-8?B?T3Z1V3BLWHpBN0hibm94TzhObTBkNU1NN2xUVUtnZFNOeDl2TDY3bEY1MVda?=
 =?utf-8?B?Mlp5RjJuNUlZaVZVTTNManRvOU1laGV3ZE84cUtQWTdrUHJHSUNKeTV2REhY?=
 =?utf-8?B?aThOVDYyZkxmRnRLVXNjQkZDbS9FdStka1FaNVNjMGtEVnBFbis2a1VacWRu?=
 =?utf-8?B?TG1YYXBqOEtFNkFZTWdvdFQxeUc5clVDdmI2NzV5Tk9UWHdZQndwenhWeWMx?=
 =?utf-8?B?UEFMdWk1R3JhYVV0eXNObzI5Y2NGaWVxc2xWeUU4MlBjbDFLTlpvRkE4QVhM?=
 =?utf-8?B?MzBzTWF5U1ZQMk93d2UvQzFDWUR5V29TOHZFVUF5OXI4cDk2U1BQU2l1YytG?=
 =?utf-8?B?cmhQSjRFVHhSS095cjh1ZGxBQXZrWStBRUJSdHdTZmI2SHlrUjVmTTlIVkN4?=
 =?utf-8?B?L1h5OTNWWFdrc20xUWRWWWQzYnRYZEcyMkZRcTNwU0NVanN2a3dibUZtK3N1?=
 =?utf-8?B?RlBWNVdFcWpMR3FYcDFzZk1GUkdlazdDQWNTOXR5djZZSjlQaWFwU044cDY3?=
 =?utf-8?B?Y0tCdmlsWDMzWmxsdEZjNElUbGNod3p0REtDditONjNyVEowaTZUaE5Hc3cr?=
 =?utf-8?B?dXVubm1Yc2pIVzFiWkRUQm0yemJjaDYrcDFqbngwakhvZy9WclFudXY0ZHNx?=
 =?utf-8?B?MEZyQ2RnellOb0ZSR041K1VPWUJDeE9oTVNiVHdKaXJrRHV5azNoUWRZNEhC?=
 =?utf-8?B?SUVDYUhxS0szQVpJWW12clVHZUxPQnI5aktZa1J3M3VldjgzYmJ2UWlFaUc5?=
 =?utf-8?B?MXFDVjVSVWxwc1lmZ0Vyd0F3SVhXNTBCdVFSUmoyZ2I3Yy91UFZnMXoxME1L?=
 =?utf-8?B?QXoveVpQbmVYMk9hTGUxSGs0SDhOR3JudXM4ZXcveUZmRG9qenhPOTBNLzBB?=
 =?utf-8?B?RmdOazhPMXplTDF6QUZJVW0xbXBjNGJGclNNT0s5bTYwUm1NdGJlT1V6RE9S?=
 =?utf-8?B?dmtMa09wVStRMEV3MjhlZU9ZZTA4R2ZuaWhyWHhGM1pUcEtZWU5BVlFLb05z?=
 =?utf-8?B?L2N2Wjl3dkYvZGxQS3BmZkViRDhiMVJSN1c3aXY3V2R4dWh2cCtDUEhYUE1a?=
 =?utf-8?B?SExmTG45djJHV0x4aGE0dE9hSnQyZVRxKzgzNWlGZkR1aEpqdElOdnNpZ0pm?=
 =?utf-8?B?MEFNQ1pONVJ5SkhyQlppbnljTEVFdUFObml3dHluZVJVcW5JTWV3TE44ZGhK?=
 =?utf-8?B?UW5VamRpMjdqNjM2ZE51QVNra3M1NDVQSHk0TEd3Ny9TMG9LNFU0Y0VTVU9r?=
 =?utf-8?B?Z0hITGMrWFhOdWJ6WWNjeS9YWFJMcWFtekM0ZGRKUllYc0tmQ2pwNy92eGdI?=
 =?utf-8?B?WmtjVW5OMUpvQUx6OTUwVTFxejhpamVEbVl4QkFsNFJiS1o5STZzUlp2Nndw?=
 =?utf-8?B?RTMwWi9nWnZVL0dYVkQ4WmNNRlR2anVvRkNHK0hRQkhrSjRDT0JPUUJJLzY0?=
 =?utf-8?B?UWhGbmRDMjVJRml3VmN0ZFFiRTlES0dld2tzeUVzbTBpMzdzejZydFdreWpS?=
 =?utf-8?B?UkRnT3RlemlOZ25pa0c3Z21TNzFSMTZBbE9YcjdqREdiRjZwSytxN0F3YUN1?=
 =?utf-8?B?TnpKV0NTQ2QzWGVQTld0eXN6TWpFSWVDOFZ5YkRJWWV4WVVMU1dJTG5YOHcx?=
 =?utf-8?B?OWl6ZEMzV2Y3UmRFbmVXNUpndTJlL2wyd2RiYnNkMzBRLzJhbjBHZU1xODdJ?=
 =?utf-8?B?Mld0cStpclg3UEY2S0Z6V0VXcDQ1aGUyaTgrSjhVb3ZEVlkxOVBaTVRkaEdx?=
 =?utf-8?B?QUVreFhTVFZEUlN3a1M0Um5ITnB3WjZMam8wK3VoYjBELytudmhWUmpDMFFr?=
 =?utf-8?B?VVlCYXhYR3RhMXVHakd3bmV5UXNsVTU3YjZJaG5rWU1hL1RlWjJsS0wxK1Iz?=
 =?utf-8?B?bnJ0NUhvNFJ1aWZyc1l6RFZzeXQ0M2daRlFMaW5oYTZvYnZMWlNIWGlZK1Fv?=
 =?utf-8?B?UjMrcjBCbWlEMitTblNlUUE3MzNRRGhPSzdVaHZuWjhHR3lCeEZIdmM5VURi?=
 =?utf-8?Q?KcHZIMx7uWn0wZ1G1h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13585752-ed47-42bb-16c0-08da290522c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:52:06.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwsHrYh+KNpcwpwNtpJtIg1TRIj6Mnl04x629KLyCYALSo0wJ4MfF7LMCwJrTLDa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8737

#syz test https://github.com/adam900710/linux read_repair

On 2022/4/28 18:08, kernel test robot wrote:
> Hi Qu,
> 
> [FYI, it's a private test report for your RFC patch.]
> [auto build test WARNING on kdave/for-next]
> [also build test WARNING on next-20220428]
> [cannot apply to rostedt-trace/for-next v5.18-rc4]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-introduce-a-pure-data-checksum-checking-helper/20220427-161943
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
> config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archive/20220428/202204281717.jzlTSpQj-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm cross compiling tool for clang build
>          # apt-get install binutils-arm-linux-gnueabi
>          # https://github.com/intel-lab-lkp/linux/commit/3f389ea1be2d5c290c4b523743ca200983f45765
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Qu-Wenruo/btrfs-introduce-a-pure-data-checksum-checking-helper/20220427-161943
>          git checkout 3f389ea1be2d5c290c4b523743ca200983f45765
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/btrfs/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/btrfs/extent_io.c:3076:6: warning: variable 'nbits' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>             if (ctrl->error) {
>                 ^~~~~~~~~~~
>     fs/btrfs/extent_io.c:3098:46: note: uninitialized use occurs here
>             for_each_set_bit(bit, ctrl->cur_bad_bitmap, nbits) {
>                                                         ^~~~~
>     include/linux/find.h:284:16: note: expanded from macro 'for_each_set_bit'
>                  (bit) < (size);                                    \
>                           ^~~~
>     fs/btrfs/extent_io.c:3076:2: note: remove the 'if' if its condition is always false
>             if (ctrl->error) {
>             ^~~~~~~~~~~~~~~~~~
>     fs/btrfs/extent_io.c:3064:20: note: initialize the variable 'nbits' to silence this warning
>             unsigned int nbits;
>                               ^
>                                = 0
>     1 warning generated.
> 
> 
> vim +3076 fs/btrfs/extent_io.c
> 
>    3060	
>    3061	static void read_repair_finish(struct btrfs_read_repair_ctrl *ctrl)
>    3062	{
>    3063		struct btrfs_fs_info *fs_info;
>    3064		unsigned int nbits;
>    3065		u32 sectorsize;
>    3066		int bit;
>    3067		int i;
>    3068	
>    3069		if (!ctrl->initialized)
>    3070			return;
>    3071	
>    3072		/*
>    3073		 * Got a critical -ENOMEM error preivously, no repair should have been
>    3074		 * attempted.
>    3075		 */
>> 3076		if (ctrl->error) {
>    3077			ASSERT(bio_list_empty(&ctrl->bios));
>    3078			ASSERT(atomic_read(&ctrl->io_bytes) == 0);
>    3079			goto mark_error;
>    3080		}
>    3081	
>    3082		ASSERT(ctrl->inode);
>    3083		fs_info = btrfs_sb(ctrl->inode->i_sb);
>    3084		nbits = ctrl->bio_size >> fs_info->sectorsize_bits;
>    3085		sectorsize = fs_info->sectorsize;
>    3086	
>    3087		/* Go through each remaining mirrors to do the repair */
>    3088		for (i = get_next_mirror(ctrl->init_mirror, ctrl->num_copies);
>    3089		     i != ctrl->init_mirror; i = get_next_mirror(i, ctrl->num_copies)) {
>    3090			read_repair_from_one_mirror(ctrl, ctrl->inode, i);
>    3091	
>    3092			/* Check the error bitmap to see if no more corrupted sectors */
>    3093			if (bitmap_all_zero(ctrl->cur_bad_bitmap, nbits))
>    3094				break;
>    3095		}
>    3096	mark_error:
>    3097		/* Finish the unrecovered bad sectors */
>    3098		for_each_set_bit(bit, ctrl->cur_bad_bitmap, nbits) {
>    3099			struct page *page;
>    3100			unsigned int pgoff;
>    3101			u64 file_offset = (bit << fs_info->sectorsize_bits) +
>    3102					  ctrl->file_offset;
>    3103	
>    3104			page = read_repair_get_sector(ctrl, bit, &pgoff);
>    3105	
>    3106			end_page_read(page, false, file_offset, sectorsize);
>    3107			unlock_extent_cached_atomic(&BTRFS_I(ctrl->inode)->io_tree,
>    3108					file_offset, file_offset + sectorsize - 1, NULL);
>    3109		}
>    3110		kfree(ctrl->cur_bad_bitmap);
>    3111		kfree(ctrl->prev_bad_bitmap);
>    3112		ctrl->cur_bad_bitmap = NULL;
>    3113		ctrl->prev_bad_bitmap = NULL;
>    3114		ctrl->initialized = false;
>    3115		ctrl->error = false;
>    3116		ctrl->failed_bio = NULL;
>    3117		ASSERT(bio_list_empty(&ctrl->bios));
>    3118		ASSERT(atomic_read(&ctrl->io_bytes) == 0);
>    3119	}
>    3120	
> 

