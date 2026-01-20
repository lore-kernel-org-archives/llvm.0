Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55837423170
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913712; cv=none; b=Lo5GzrLVQj3DdYdrIMKPZbaZgp+qiU3lDmDFlVWJUMfRHWNCWdFwkfdkuMOcPACxBB2gd3MIrDjGD3JNib7si7pYHWrvzynZ/2gbv4KibrsyChifG7ASId0Z14uvEY7wO5i6ONcdPDFsg+Pa0202vnoGPO5GUd3PKCZxheQiTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913712; c=relaxed/simple;
	bh=xs6/qXvdwZqyPPASDySWjvLszgy3WDwkO/3lWhZ8HXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uI5rQFCyiTeEmUA1AoNI9Iq+lto4Uu1FGMG73dnOBiEQVhps4gwNlOeOt3R7K1L9gce6MqkrDLtOSjD3V6sfPtUs7EstLMxKRRAn0bzFFb9qpQ+ZIdbJu3TQSY8t5AyxkoQtr2QElP1c0VzjTnvKOsscBn5zQoSUB+hNUXOuG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xm94bQhp; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QFi+8KKf; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xm94bQhp; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QFi+8KKf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xm94bQhp";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QFi+8KKf";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xm94bQhp";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QFi+8KKf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A03875BCC9;
	Tue, 20 Jan 2026 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768913709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0UOZHr2Nk3gYOc7JHMLcwjUZ2FkjZDEANCYa8EhaDD0=;
	b=xm94bQhpKGFYr1R8eYbrXbPHZWPDyZh4mVeqokXSYRoE2a8d+tKRQcisFMnw2JcmHjEfnN
	zeLBQnoFjf/pvtzrkeM4HsV2CJImAhXu0YQtP4xjHrNscRSutnfbO/88Ib97IfPbRHNibL
	hRkrreVm3+SICYwLSE2wuvOt51vUzJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768913709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0UOZHr2Nk3gYOc7JHMLcwjUZ2FkjZDEANCYa8EhaDD0=;
	b=QFi+8KKfM7jhuDjHJoRhCGGz/YiybzJPD0WsqAUgcGOQ+yj2ny46RMygwG2Z4hLHyV5pnz
	6EvIf+QRTV6aG/AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768913709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0UOZHr2Nk3gYOc7JHMLcwjUZ2FkjZDEANCYa8EhaDD0=;
	b=xm94bQhpKGFYr1R8eYbrXbPHZWPDyZh4mVeqokXSYRoE2a8d+tKRQcisFMnw2JcmHjEfnN
	zeLBQnoFjf/pvtzrkeM4HsV2CJImAhXu0YQtP4xjHrNscRSutnfbO/88Ib97IfPbRHNibL
	hRkrreVm3+SICYwLSE2wuvOt51vUzJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768913709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0UOZHr2Nk3gYOc7JHMLcwjUZ2FkjZDEANCYa8EhaDD0=;
	b=QFi+8KKfM7jhuDjHJoRhCGGz/YiybzJPD0WsqAUgcGOQ+yj2ny46RMygwG2Z4hLHyV5pnz
	6EvIf+QRTV6aG/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 879303EA63;
	Tue, 20 Jan 2026 12:55:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ge/DIC17b2kMAgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 20 Jan 2026 12:55:09 +0000
Message-ID: <8bd3c3e8-9865-4467-86d5-17d891f6f21b@suse.cz>
Date: Tue, 20 Jan 2026 13:55:09 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slab: replace cache_from_obj() with inline checks
Content-Language: en-US
To: Hao Li <hao.li@linux.dev>
Cc: Harry Yoo <harry.yoo@oracle.com>, Eric Dumazet <edumazet@google.com>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
 <imazcyfzfkxofsnriyp5wa5v6yzszozljircucw2tgj6zex2ee@ytew6wy4kkh6>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <imazcyfzfkxofsnriyp5wa5v6yzszozljircucw2tgj6zex2ee@ytew6wy4kkh6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On 1/20/26 12:57, Hao Li wrote:

>> @@ -6774,11 +6770,21 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
>>   */
>>  void kmem_cache_free(struct kmem_cache *s, void *x)
>>  {
>> -	s = cache_from_obj(s, x);
>> -	if (!s)
>> -		return;
>> +	struct slab *slab;
>> +
>> +	slab = virt_to_slab(x);
>> +
>> +	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
>> +	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
>> +
>> +		if (unlikely(!slab || (slab->slab_cache != s))) {
>> +			warn_free_bad_obj(s, x);
> 
> Just to make sure I'm understanding correctly, are we intentionally not
> releasing the object x in this case? Thanks.

Yes, it means something went wrong so it's better not to do anything. That
was true before this patch as well.

>> +			return;
>> +		}
>> +	}
>> +
>>  	trace_kmem_cache_free(_RET_IP_, x, s);
>> -	slab_free(s, virt_to_slab(x), x, _RET_IP_);
>> +	slab_free(s, slab, x, _RET_IP_);
>>  }
>>  EXPORT_SYMBOL(kmem_cache_free);
>>  
>> @@ -7305,7 +7311,7 @@ int build_detached_freelist(struct kmem_cache *s, size_t size,
>>  		df->s = slab->slab_cache;
>>  	} else {
>>  		df->slab = slab;
>> -		df->s = cache_from_obj(s, object); /* Support for memcg */
>> +		df->s = s;
>>  	}
>>  
>>  	/* Start new detached freelist */
>> 
>> ---
>> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
>> change-id: 20260120-b4-remove_cache_from_obj-190fcaf16789
>> 
>> Best regards,
>> -- 
>> Vlastimil Babka <vbabka@suse.cz>
>> 

