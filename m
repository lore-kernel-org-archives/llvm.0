Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A418C34
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 12:21:34 +0000 (UTC)
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTP
	id jx8VqaxVsDKaKk1deqIP1K; Sat, 23 Sep 2023 12:21:34 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k1ddqfMIV5plfk1ddqQcJG; Sat, 23 Sep 2023 12:21:33 +0000
X-Authority-Analysis: v=2.4 cv=eZguwpIH c=1 sm=1 tr=0 ts=650ed84d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=JfrnYn6hAAAA:8 a=drOt6m5kAAAA:8 a=VwQbUJbxAAAA:8
 a=07d9gI8wAAAA:8 a=cm27Pg_UAAAA:8 a=3OtJ-fU1epfT2BxG-t4A:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=RMMjzBEyIzXRtoq5n5K6:22 a=AjGcO6oz07-iQ99wixmX:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tknbAJbR0XiQqwpm/Xnoi1IoVHkEPm12JuyW0RHfomM=; b=llaO0aIx9SU2vfQ0N2IGjTWr/C
	lliL6aOFTr27O9f+ElRE8e3gZOc5Aotu6z1SiJ6nY5sYDIG7IVsPiTTRuGjPHc+ssXb/xyOPrM5Hf
	v8Alxeae8gYpE9muJBSd0VAvf9BFrpXOMdO7lm2aan4NdmoNhj42D7mjM3nMi4fK/fOEsaYJnSIjs
	StAPfvl8z66zQszNeVQS6JHzXGN2iLqP/bJ+34KqX4tkNhCqs3H+p0mCtJa6JdP92DLF2bPkJTqyi
	efWtrzmtB8GH4/sRjdODVG4gGQ02DX3aUaQEvCh7pIaZxTprv9GyLBkD06nyB/fAuI6McyQZVWObV
	xdPIh7ww==;
Received: from [94.239.20.48] (port=49354 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy8Q-003i3a-2g;
	Sat, 23 Sep 2023 03:37:07 -0500
Message-ID: <04d51691-4f58-f126-0f32-9ed398182b40@embeddedor.com>
Date: Sat, 23 Sep 2023 10:38:11 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] watch_queue: Annotate struct watch_filter with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, David Howells <dhowells@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Siddh Raman Pant <code@siddh.me>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Qian Cai <cai@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175407.work.754-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175407.work.754-kees@kernel.org>
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
X-Exim-ID: 1qjy8Q-003i3a-2g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:49354
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfITaoJdRZoKHhP2tyLZl/7lZ72VjiDW+xoChoc9ch2w9NJTm5AlSlJGiP7VE/atDH5N7/XJF6zcDG7+SuPlLPgK5LE8pHtl9TbKvSb1ACqQt8uXXJ+NI
 oucX1Z7iVMwWMbbl8gLlOW0ilEDM4E15HQ8hYwZJK0O/RiCjkpNHQjhaqk+dhey94IrkGMkg33GxZWdJagIoXH0wNYB/6jVYcwU=



On 9/22/23 11:54, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct watch_filter.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: David Howells <dhowells@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Siddh Raman Pant <code@siddh.me>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Qian Cai <cai@redhat.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/linux/watch_queue.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
> index 45cd42f55d49..429c7b6afead 100644
> --- a/include/linux/watch_queue.h
> +++ b/include/linux/watch_queue.h
> @@ -32,7 +32,7 @@ struct watch_filter {
>   		DECLARE_BITMAP(type_filter, WATCH_TYPE__NR);
>   	};
>   	u32			nr_filters;	/* Number of filters */
> -	struct watch_type_filter filters[];
> +	struct watch_type_filter filters[] __counted_by(nr_filters);
>   };
>   
>   struct watch_queue {
