Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264330FC14
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757683397; cv=none; b=Yq6tTVVWIR4+33qmbQF0RzRu9LCRx2+xVY0mS4IdMYGIGIVg1PadJnFHxhLNmlOR4qEam2OG1ukb7Q+Tl5eAb2luiFy/sPVbffLFz/5/78APqGsdB4ZAfkGLm3iE9EYkCnUxdX7ryR7s3XZJJtyPDhxLVozWiFRwyj9ASfUhbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757683397; c=relaxed/simple;
	bh=HX0a3ccR+QITRaRHH7dRV+A3AX+uY2b7ywRoyQhDG/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIoszd+5HUj15vYP5keQvMJLyCEXkZa/xmDIJK8zTSchBZ6QVJ7eCYjSSHUUJW8i+82oxZiDI1BfZhPFt40f0AzMA72gvu4JNRdIQjOCoG+OGtVXPl/fIEzwRT4yYibANjeeHkAxGzOiRu0pBMAqpY731nZTCvRS8ESnhbxPpFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FIhA3Uyv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=xGzRxfDo; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=r9NFTES6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IMI9huKC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FIhA3Uyv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="xGzRxfDo";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="r9NFTES6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IMI9huKC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA4BE21002;
	Fri, 12 Sep 2025 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757683391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VoE3Dg1oBpiGBChJQrjIFUPIH9aCo1cpIPZjfwEUPqI=;
	b=FIhA3UyvlutNw+ce2h5LfcCwvEelZEqmHYOHngabNDG3QxBRs6Li055oja8d1lL0xcAphO
	Nr0e7MshbfPELtv/iiVfp8XlV+5lCcDxCyeaIAb6w97810Lan3XT3+1tBALIRcp16K22nz
	Ukk2TCfM8vAJIsNuQjXOdk8BVcFmKH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757683391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VoE3Dg1oBpiGBChJQrjIFUPIH9aCo1cpIPZjfwEUPqI=;
	b=xGzRxfDo/SPnIXch4G/vYV2LqWav71a5D4t+8UDj01BxixSoEMlqDDX0IMlcy09R3vKxC9
	VTFT2dGSaNKgF6Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1757683390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VoE3Dg1oBpiGBChJQrjIFUPIH9aCo1cpIPZjfwEUPqI=;
	b=r9NFTES6lLfyfe54LgPQiD7eAgRMsrA7+buaNB3YxFAwGwPxHwv0yt5hRLQeYr+Vkuegbf
	jFeZ90Y8Z8uq+Ot9Ie4CxtXQ3VYu2Q6Qj3di+oC9vQU8RweilmcGp5Bam/QuwDs2qQF4jb
	s7M1TzjqdvpAo3tG8DjxhVqAvDqQQDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1757683390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VoE3Dg1oBpiGBChJQrjIFUPIH9aCo1cpIPZjfwEUPqI=;
	b=IMI9huKCDx3GxP/D2jj4kSLzGZQlm2lvMND9SsTOx570bFiK/QZDImH313Zp7BxSibBhta
	SSxcBImYnpOCkwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D931B13869;
	Fri, 12 Sep 2025 13:23:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pPF/Mr4exGgpEAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 12 Sep 2025 13:23:10 +0000
Message-ID: <8fe99133-3322-4e39-9b58-80df547b8d1f@suse.cz>
Date: Fri, 12 Sep 2025 15:23:10 +0200
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
To: kernel test robot <lkp@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Harry Yoo <harry.yoo@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
References: <202509121822.aOV6H1ts-lkp@intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <202509121822.aOV6H1ts-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30

On 9/12/25 12:25, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-6.18/kmalloc_nolock
> head:   8014922e0e72dde7684abebeab3404720401679f
> commit: 8014922e0e72dde7684abebeab3404720401679f [14/14] slab: Introduce kmalloc_nolock() and kfree_nolock().
> config: x86_64-buildonly-randconfig-004-20250912 (https://download.01.org/0day-ci/archive/20250912/202509121822.aOV6H1ts-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121822.aOV6H1ts-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509121822.aOV6H1ts-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> mm/slub.c:3866:2: warning: variable 'flags' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
>     3866 |         local_lock_cpu_slab(s, flags);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
>     3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
>      279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
>          |                      ^~~~~~~~~~~
>    include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
>      171 |         int __ret_warn_on = !!(condition);                              \
>          |                                ^~~~~~~~~
>    mm/slub.c:3891:27: note: uninitialized use occurs here
>     3891 |         local_unlock_cpu_slab(s, flags);
>          |                                  ^~~~~
>    mm/slub.c:3780:48: note: expanded from macro 'local_unlock_cpu_slab'
>     3780 |         local_unlock_irqrestore(&(s)->cpu_slab->lock, flags)
>          |                                                       ^~~~~
>    include/linux/local_lock.h:52:48: note: expanded from macro 'local_unlock_irqrestore'
>       52 |         __local_unlock_irqrestore(this_cpu_ptr(lock), flags)
>          |                                                       ^~~~~
>    include/linux/local_lock_internal.h:202:21: note: expanded from macro '__local_unlock_irqrestore'
>      202 |                 local_irq_restore(flags);                       \
>          |                                   ^~~~~
>    include/linux/irqflags.h:240:61: note: expanded from macro 'local_irq_restore'
>      240 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
>          |                                                             ^~~~~
>    include/linux/irqflags.h:179:26: note: expanded from macro 'raw_local_irq_restore'
>      179 |                 arch_local_irq_restore(flags);          \
>          |                                        ^~~~~
>    mm/slub.c:3866:2: note: remove the '&&' if its condition is always true
>     3866 |         local_lock_cpu_slab(s, flags);
>          |         ^
>    mm/slub.c:3776:2: note: expanded from macro 'local_lock_cpu_slab'
>     3776 |         lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
>          |         ^
>    include/linux/lockdep.h:279:15: note: expanded from macro 'lockdep_assert'
>      279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
>          |                      ^
>    mm/slub.c:3863:21: note: initialize the variable 'flags' to silence this warning
>     3863 |         unsigned long flags;
>          |                            ^
>          |                             = 0
>    1 warning generated.
> 
> 
> vim +3866 mm/slub.c

>   3852	
>   3853	/*
>   3854	 * Put a slab into a partial slab slot if available.
>   3855	 *
>   3856	 * If we did not find a slot then simply move all the partials to the
>   3857	 * per node partial list.
>   3858	 */
>   3859	static void put_cpu_partial(struct kmem_cache *s, struct slab *slab, int drain)
>   3860	{
>   3861		struct slab *oldslab;
>   3862		struct slab *slab_to_put = NULL;
>   3863		unsigned long flags;
>   3864		int slabs = 0;
>   3865	
>> 3866		local_lock_cpu_slab(s, flags);

I guess this?

--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3772,8 +3772,11 @@ static void deactivate_slab(struct kmem_cache *s, struct slab *slab,
 #define local_lock_cpu_slab(s, flags)  \
        local_lock_irqsave(&(s)->cpu_slab->lock, flags)
 #else
-#define local_lock_cpu_slab(s, flags)  \
-       lockdep_assert(local_trylock_irqsave(&(s)->cpu_slab->lock, flags))
+#define local_lock_cpu_slab(s, flags)                                         \
+       do {                                                                   \
+               bool __l = local_trylock_irqsave(&(s)->cpu_slab->lock, flags); \
+               lockdep_assert(__l);                                           \
+       } while (0)
 #endif

