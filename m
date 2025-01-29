Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5916C854
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738146125; cv=none; b=VWsoNjyDvgNyVVccg6c/W8l8iF3BFUoveY5C++kC5t5uTB+noOchmKXSImobbCU8iI6OEUENTJVVOz+S3chq8Ih2W73X/NMunm8qucC+p8dUmNi4/Wt9USSd0HIYl/12JrdWcvcqZn8p7z68kDEScvLEiGoVOQZibqBCfbEtWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738146125; c=relaxed/simple;
	bh=GTNzmfMAf/g0ji4H9+yTg5ZJPyLYWvsUXeFpxOnFBys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5XB3yuIrESxJ0Dd0dkqU7CZEYB9hV71E/HPYWmYdEuIlVvpOJmeObuKOvwEIiDshFKF62vfL3hoKIiuKopsQ8CqzQdbdeMrVgXZ0mvrmZUHxhds0HT/zxdDTrnRXtWesQwkIWlHykPpUzeMDrPKeh3cxPOyX6YORA5A82a+g/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pnClhKrx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5uMddur/; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=TeFqkYCR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=uQ4+1M3R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pnClhKrx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5uMddur/";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="TeFqkYCR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="uQ4+1M3R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C59681F38C;
	Wed, 29 Jan 2025 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738146121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pCv3qMl45iFGxWDauLw6FPk20Iw8zC6ZjXOYD01Fts=;
	b=pnClhKrxe3aQsIps+BHD9avk5sNKL+quw7qiGlcS8sNwo4dGkODQqpUznN9IEdwTcQ9IYc
	TQiZ32RZsZ2pEJUd90Sa8viYPxitIXnF0ZdYb86JYcFE4ikjLIckyxdmVX5UAl16u3t+rU
	0tyVGqA+kknmov7YD98OsvjnFfa5VXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738146121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pCv3qMl45iFGxWDauLw6FPk20Iw8zC6ZjXOYD01Fts=;
	b=5uMddur/FjSwFkpKN8li3mdhUnPrxTjAi0ann3ltapuF7BGRz2rJK5S5Opju+ncxbZXcj+
	AfZ9k+V3Co3i6hAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=TeFqkYCR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=uQ4+1M3R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738146120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pCv3qMl45iFGxWDauLw6FPk20Iw8zC6ZjXOYD01Fts=;
	b=TeFqkYCRbwopsHx/erprzmj1KVa8PEW/3MYOBqQHmAnuatd59ykUF8bubJ893n9ISxr0W9
	IIAtO+PQDIJ9Oyq1XDOoiqu6Yff4jN1Une0ujFDo9RsHAdayN1xw9yKIWbJb8Q8eetjRpE
	FS4Hb8f98X9W/NFqiWW29Cg11X1T4YA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738146120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3pCv3qMl45iFGxWDauLw6FPk20Iw8zC6ZjXOYD01Fts=;
	b=uQ4+1M3RTRlXx/9EMbgjOueUGwfJSbt4KodjxZORp3k2u6T/urtBU6TULH1ORbLPcRT9Rq
	Imhgg6MdAkbryxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90ED1137D2;
	Wed, 29 Jan 2025 10:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bXYLI0gBmmcSRAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 29 Jan 2025 10:22:00 +0000
Message-ID: <a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
Date: Wed, 29 Jan 2025 11:22:00 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
 Ivan Shapovalov <intelfx@intelfx.name>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>,
 Joel Granados <joel.granados@kernel.org>,
 Sourav Panda <souravpanda@google.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
 <20250122015818.3308696-1-intelfx@intelfx.name>
 <6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C59681F38C
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,soleen.com,redhat.com,cs.cmu.edu,cmpxchg.org,gmail.com,kvack.org,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 1/28/25 22:36, Bart Van Assche wrote:
> On 1/21/25 5:57 PM, Ivan Shapovalov wrote:
>>> Spose so.  One always suspects that adding a typecast is a sign that we
>>> screwed things up somehow.  The relationship between enums lru_list and
>>> node_stat_item is foggy, and I'm unsure whether this is the place to
>>> make the transition it.  Perhaps lru_list_name() should take an
>>> `unsigned int' arg instead.
>> 
>> All of these *_name() functions do seem to expect arguments in range of
>> the corresponding enums, so perhaps keep those args typed as a form of
>> self-documenting code, and do this instead?
> 
> If nobody objects I will submit this patch for review after the merge
> window has closed:
> 
> Subject: [PATCH] mm/vmstat: Fix W=1 clang compiler warnings
> 
> Commit 30c2de0a267c ("mm/vmstat: fix a W=1 clang compiler warning")
> suppresses some but not all compiler warnings that are reported by clang
> when building with W=1 about NR_LRU_BASE and NR_ZONE_LRU_BASE. Hence
> revert commit 30c2de0a267c and instead make NR_LRU_BASE and
> NR_ZONE_LRU_BASE integer constants instead of enumeration constants.
> 
> Cc: Ivan Shapovalov <intelfx@intelfx.name>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   include/linux/mmzone.h | 22 +++++++++++++++++++---
>   include/linux/vmstat.h |  9 +++++++--
>   2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 9540b41894da..92ed919ea99d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -135,10 +135,19 @@ enum numa_stat_item {
>   #define NR_VM_NUMA_EVENT_ITEMS 0
>   #endif
> 
> +/*
> + * NR_ZONE_LRU_BASE and NR_VM_ZONE_STAT_ITEMS are often added to 
> enumeration
> + * constants of another type than enum_zone_stat_item. Define these 
> constants
> + * as an integer instead of enum node_stat_item to prevent that the 
> compiler
> + * warns about enumeration type mismatches when these constants are used.
> + */
> +#define NR_ZONE_LRU_BASE	(1 * __NR_ZONE_LRU_BASE)
> +#define NR_VM_ZONE_STAT_ITEMS	(1 * __NR_VM_ZONE_STAT_ITEMS)

Seems an acceptable approach, dunno if this multiply by one is any better
than casting to int?

> +
>   enum zone_stat_item {
>   	/* First 128 byte cacheline (assuming 64 bit words) */
>   	NR_FREE_PAGES,
> -	NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
> +	__NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
>   	NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,

Should we rather use __NR_ZONE_LRU_BASE here?

>   	NR_ZONE_ACTIVE_ANON,
>   	NR_ZONE_INACTIVE_FILE,
> @@ -155,10 +164,17 @@ enum zone_stat_item {
>   #ifdef CONFIG_UNACCEPTED_MEMORY
>   	NR_UNACCEPTED,
>   #endif
> -	NR_VM_ZONE_STAT_ITEMS };
> +	__NR_VM_ZONE_STAT_ITEMS };
> +
> +/*
> + * enum lru_list constants are often added to NR_LRU_BASE. Define 
> NR_LRU_BASE
> + * as an integer instead of enum node_stat_item to prevent that the 
> compiler
> + * warns about enumeration type mismatches.
> + */
> +#define NR_LRU_BASE (1 * __NR_LRU_BASE)
> 
>   enum node_stat_item {
> -	NR_LRU_BASE,
> +	__NR_LRU_BASE,
>   	NR_INACTIVE_ANON = NR_LRU_BASE, /* must match order of LRU_[IN]ACTIVE */

ditto

>   	NR_ACTIVE_ANON,		/*  "     "     "   "       "         */
>   	NR_INACTIVE_FILE,	/*  "     "     "   "       "         */
> diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> index 9f3a04345b86..eb115b9a50f4 100644
> --- a/include/linux/vmstat.h
> +++ b/include/linux/vmstat.h
> @@ -135,8 +135,13 @@ static inline void vm_events_fold_cpu(int cpu)
>   #define count_vm_vma_lock_event(x) do {} while (0)
>   #endif
> 
> +/*
> + * item##_NORMAL has type enum vm_event_item while ZONE_NORMAL and zid have
> + * type enum zone_type. Suppress compiler warnings about mixing different
> + * enumeration types by converting item##_NORMAL into an int with '1 *'.
> + */
>   #define __count_zid_vm_events(item, zid, delta) \
> -	__count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
> +	__count_vm_events(1 * item##_NORMAL - ZONE_NORMAL + zid, delta)
> 
>   /*
>    * Zone and node-based page accounting with per cpu differentials.
> @@ -515,7 +520,7 @@ static inline const char *node_stat_name(enum 
> node_stat_item item)
> 
>   static inline const char *lru_list_name(enum lru_list lru)
>   {
> -	return node_stat_name(NR_LRU_BASE + (enum node_stat_item)lru) + 3; // 
> skip "nr_"
> +	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>   }
> 
>   #if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> 

