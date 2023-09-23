Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE031D68F
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 15:02:03 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTP
	id jx8AqGhQlez0Ck48ZqCMhO; Sat, 23 Sep 2023 15:01:39 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k48xq0dnLHmohk48xqL7kl; Sat, 23 Sep 2023 15:02:03 +0000
X-Authority-Analysis: v=2.4 cv=Avz9YcxP c=1 sm=1 tr=0 ts=650efdeb
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=Q-fNiiVtAAAA:8 a=ag1SF4gXAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8
 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10 a=Fp8MccfUoT0GBdDC_Lng:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AoQyo766oEqmFaV118F1a6DY0lVOzWlN7PDJW/H/op8=; b=wbMNnlsNRzxs9fUMU9AE00OmY5
	yl0TGAyc13dlBMiJ+2M1GDkicOKXOARyB5YpF2++DrRsM0E5MMJwkauPf+ZyY+blfasATJv9j7zK/
	N8xWzwIONP3ozEdBJ4Y2eAL+l0dgDQeFuIUjjNa+wc7vME+/6O5AfG9IKsa7vdl6RjCoZU3z72Qy6
	mfgpnrsMlG21FCwqWFU/hbiIjraPdGABVYgfr4GIRTsUcPkTTfKS4UMdia+mgiVkxVTgsR0/q5Utp
	BrkJrGmz3nVW41KAfzAdPBNXzfS18LxSeuo2GPI4kNsKr7iWZyeJxcWFLr8IKQGPDXBanKuySMEoR
	JZIsNGfw==;
Received: from [94.239.20.48] (port=38504 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy24-003ZlW-2t;
	Sat, 23 Sep 2023 03:30:33 -0500
Message-ID: <b967e5b1-7c15-2c45-4136-f6e10adddfd1@embeddedor.com>
Date: Sat, 23 Sep 2023 10:31:38 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] misc: bcm-vk: Annotate struct bcm_vk_wkent with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Scott Branden <scott.branden@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175057.work.558-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175057.work.558-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy24-003ZlW-2t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:38504
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDs6VXQdDKPD86wHHdHXi0CnmsHi6HvDKvbYoj+dBNXyBIw7VsS14Ify0owYIJC7pyo1NGIDTRvgpbYPdJrKyQNPYpDHl+ru7Si5pKWVjSK6uKQi7H1h
 8TZwDLu3j8Qv3Ia5E2tnQIpgKrJgXpbQw3YTmpB7Cl6MESNJ/Hwo+jKdrm4YF66lDmWN20u8WHvoDk1m6Mq2qyKP1ALtMWPIFsM=



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct bcm_vk_wkent.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/misc/bcm-vk/bcm_vk_msg.c | 2 +-
>   drivers/misc/bcm-vk/bcm_vk_msg.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
> index e17d81231ea6..1f42d1d5a630 100644
> --- a/drivers/misc/bcm-vk/bcm_vk_msg.c
> +++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
> @@ -703,12 +703,12 @@ int bcm_vk_send_shutdown_msg(struct bcm_vk *vk, u32 shut_type,
>   	entry = kzalloc(struct_size(entry, to_v_msg, 1), GFP_KERNEL);
>   	if (!entry)
>   		return -ENOMEM;
> +	entry->to_v_blks = 1;	/* always 1 block */
>   
>   	/* fill up necessary data */
>   	entry->to_v_msg[0].function_id = VK_FID_SHUTDOWN;
>   	set_q_num(&entry->to_v_msg[0], q_num);
>   	set_msg_id(&entry->to_v_msg[0], VK_SIMPLEX_MSG_ID);
> -	entry->to_v_blks = 1; /* always 1 block */
>   
>   	entry->to_v_msg[0].cmd = shut_type;
>   	entry->to_v_msg[0].arg = pid;
> diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.h b/drivers/misc/bcm-vk/bcm_vk_msg.h
> index 56784c8896d8..157495e48f15 100644
> --- a/drivers/misc/bcm-vk/bcm_vk_msg.h
> +++ b/drivers/misc/bcm-vk/bcm_vk_msg.h
> @@ -116,7 +116,7 @@ struct bcm_vk_wkent {
>   	u32 usr_msg_id;
>   	u32 to_v_blks;
>   	u32 seq_num;
> -	struct vk_msg_blk to_v_msg[];
> +	struct vk_msg_blk to_v_msg[] __counted_by(to_v_blks);
>   };
>   
>   /* queue stats counters */
