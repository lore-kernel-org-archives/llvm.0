Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F0DC148
	for <llvm@lists.linux.dev>; Sat, 13 Sep 2025 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757796410; cv=none; b=j3oKCsSq5bqezA93EwB0Bh7eIfAI6I2U+XHSiPFi8nfFzL+dTTpqfp1WDCRVWrGwNUY+EUYi5DbH4Fk0sBG31fy1jSRBFMJFoBlHy2Jg/WD38NtfQ79lcMwoZl094OaTClWsk9XqndAstaawlTVhTDPRwE0aB9DNUf4XvkMXqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757796410; c=relaxed/simple;
	bh=7Z7MCzQL01ky3hCuIBFWkKjCmjaCW3oov0qmsAX2Ass=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzYs7I1NFHUqL2/bYA+fdffHBwHY4A5/kZMRVzmHgrfCJpIBUMbmG2A/cN3czlbU5fme03c7XZuVQXpViGXyKZZ+qy5N/YgP+ERxmgBjr1I8hNQ8Yy1SRXjVkvZVE5onPmXc4umWtaZTcxshDd+Urxl3UYcPYUj2XckPuNxPuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Vl1wE06q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Mnytsj7B; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Vl1wE06q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Mnytsj7B; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Vl1wE06q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Mnytsj7B";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Vl1wE06q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Mnytsj7B"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD4703EB95;
	Sat, 13 Sep 2025 20:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757796406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=38MKvmoG9sJlDP35qP5Jp0TIm1uAH+pH6cn4t8ko1Cc=;
	b=Vl1wE06qrNqMW0HqlqZ/M+jT5XnJfPIujr/Qb0Xs9xEj/Tk9x1GBSOMOl86kc7Er4faLmC
	sapigQUSDzhXgI4x4khq9IcYklyzWxaWRWGvibBTPmGiTJw5mWTSqKdXF5234efuVYWuh4
	hcUPmVa0SL4cIpXLA6FfomQWaAx4OgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757796406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=38MKvmoG9sJlDP35qP5Jp0TIm1uAH+pH6cn4t8ko1Cc=;
	b=Mnytsj7BFrJRllabJ3CaQTCHsRj6GG4ORvjb6d7DlXVcBjTz9D2Ymrewba1pGD39R3iiQI
	I2KPaYW3SufbnNAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Vl1wE06q;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Mnytsj7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757796406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=38MKvmoG9sJlDP35qP5Jp0TIm1uAH+pH6cn4t8ko1Cc=;
	b=Vl1wE06qrNqMW0HqlqZ/M+jT5XnJfPIujr/Qb0Xs9xEj/Tk9x1GBSOMOl86kc7Er4faLmC
	sapigQUSDzhXgI4x4khq9IcYklyzWxaWRWGvibBTPmGiTJw5mWTSqKdXF5234efuVYWuh4
	hcUPmVa0SL4cIpXLA6FfomQWaAx4OgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757796406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=38MKvmoG9sJlDP35qP5Jp0TIm1uAH+pH6cn4t8ko1Cc=;
	b=Mnytsj7BFrJRllabJ3CaQTCHsRj6GG4ORvjb6d7DlXVcBjTz9D2Ymrewba1pGD39R3iiQI
	I2KPaYW3SufbnNAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93ECA1372E;
	Sat, 13 Sep 2025 20:46:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KfLDIjbYxWjcZAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Sat, 13 Sep 2025 20:46:46 +0000
Message-ID: <b1628e73-92d6-4b2a-b0a0-0f7e26f8c3a1@suse.cz>
Date: Sat, 13 Sep 2025 22:46:46 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vbabka-slab:slab/for-6.18/kmalloc_nolock 14/14]
 mm/slub.c:3866:2: warning: variable 'flags' is used uninitialized whenever
 '&&' condition is false
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Harry Yoo <harry.yoo@oracle.com>, clang-built-linux <llvm@lists.linux.dev>,
 oe-kbuild-all@lists.linux.dev, linux-mm <linux-mm@kvack.org>
References: <202509121822.aOV6H1ts-lkp@intel.com>
 <8fe99133-3322-4e39-9b58-80df547b8d1f@suse.cz>
 <CAADnVQJWXk+Zzsf_oVTaJkpm4nO3iq34bGcUDQRarOVSX+tLbA@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <CAADnVQJWXk+Zzsf_oVTaJkpm4nO3iq34bGcUDQRarOVSX+tLbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AD4703EB95
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

On 9/12/25 18:39, Alexei Starovoitov wrote:
> On Fri, Sep 12, 2025 at 6:23 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -3772,8 +3772,11 @@ static void deactivate_slab(struct kmem_cache *s, struct slab *slab,
>>  #define local_lock_cpu_slab(s, flags)  \
>>         local_lock_irqsave(&(s)->cpu_slab->lock, flags)
>>  #else
>> -#define local_lock_cpu_slab(s, flags)  \
>> -       lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
>> +#define gg(s, flags)                                         \
>> +       do {                                                                   \
>> +               bool __l = local_trylock_irqsave(&(s)->cpu_slab->lock, flags); \
>> +               lockdep_assert(__l);
> 
> That works, but would raise questions for anyone looking at
> these two lines as-is, since it's an implementation
> detail of lockdep_assert() and combination of .config flags.

TBH when I see some code with a side-effect wrapped in a WARN or assert that
can be configured off, it already raises a question if that gets executed
when configured off. There are examples where it does, and where it doesn't.

> what clang warning suggested is imo cleaner:

That silences the warning about flags, however it means that when lockdep
gets disabled on runtime, the locks stop locking (but not unlocking). While
debug_locks_off() only seems to get called in a serious situations
currently, we should not make things even worse then.

> diff --git a/mm/slub.c b/mm/slub.c
> index 4079abb5d0e1..a6b50cd1d95f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3865,7 +3865,7 @@ static void put_cpu_partial(struct kmem_cache
> *s, struct slab *slab, int drain)
>  {
>         struct slab *oldslab;
>         struct slab *slab_to_put = NULL;
> -       unsigned long flags;
> +       unsigned long flags = 0;
>         int slabs = 0;
> 
> Could you fold one of them in?

And so I've folded in mine.
