Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9110F1107
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 09:17:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9F771F855;
	Thu, 29 Sep 2022 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1664443036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71EGSfS37//o0vnm3QcXzqADuyadLykD8DwNAjDozNM=;
	b=HYhHxvF5R9MZgs/n2dBHAoOW31tPKSK54FyKQWJLhuJa0/dmQ69jamOecI2ZMjy7rYjUiD
	DS68vIxawtbYsHHd/Z84bIhw4fZ+4zyuf21I0K4nCWJZ9G4zGJ4tma3Yi6xfKWT+79o7Lj
	Na8yGMGIbSV5gRSVxtr1wjCjhUU8G6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1664443036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71EGSfS37//o0vnm3QcXzqADuyadLykD8DwNAjDozNM=;
	b=uO6c1+sBJ0l+zWjlAlXoMSN5FkCeXfBxD0k80z1CZiVltvoS5N3/1MunDKgBzmYis1KohA
	vHKg222nS4mY/HCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A06F61348E;
	Thu, 29 Sep 2022 09:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8X5yJpxiNWPhMQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 29 Sep 2022 09:17:16 +0000
Message-ID: <9db958ac-7e0c-5915-ffe1-7f809b7ed9ca@suse.cz>
Date: Thu, 29 Sep 2022 11:17:16 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] compiler.h: fix compile error with gcc-8 or lower
 version
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org
Cc: keescook@chromium.org
References: <20220929033845.485728-1-yangyingliang@huawei.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220929033845.485728-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/29/22 05:38, Yang Yingliang wrote:
> I got the follow compile error in latest linux-next kernel with gcc-8.4:
> 
>   In file included from <command-line>:
>   ./include/linux/percpu.h: In function ‘__alloc_reserved_percpu’:
>   ././include/linux/compiler_types.h:279:30: error: expected declaration specifiers before ‘__alloc_size__’
>    #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __malloc
>                                 ^~~~~~~~~~~~~~
>   ./include/linux/percpu.h:120:74: note: in expansion of macro ‘__alloc_size’
>    extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
> 
> __alloc_size is not defined in gcc-8 or lower version, so add back the
> conditional test for __alloc_size__ to fix it.
> 
> Fixes: 63caa04ec605 ("slab: Remove __malloc attribute from realloc functions")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  include/linux/compiler_types.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index aa81da7a28eb..aae8852ccbdc 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -276,8 +276,13 @@ struct ftrace_likely_data {
>   * be performing a _reallocation_, as that may alias the existing pointer.
>   * For these, use __realloc_size().
>   */
> +#ifdef __alloc_size__
>  #define __alloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__) __malloc
> -#define __realloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__)
> +#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)
> +#else
> +#define __alloc_size(x, ...)	__malloc
> +#define __realloc_size(x, ...) __malloc

This would be wrong as with 63caa04ec605 we don't want __malloc in
__realloc_size(). Anyway Kees sent the correct version and it's now merged,
thanks.

> +#endif
>  
>  #ifndef asm_volatile_goto
>  #define asm_volatile_goto(x...) asm goto(x)

