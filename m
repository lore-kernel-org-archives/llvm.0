Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14603B27DB
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849743; cv=none; b=p2Vl4DSkwHZoYiyx0lQrJfpj3YSYSzuEgUfCCOydPsnhk7fhqSca5+TIDVCusReroKlECLSzJIJ4o0yComQsdXReChIoxWLaO+fQZOHaKuOvDWlvC8Mp67TrjlR8nptT3jlZdqG/G64YXOgKkIyrX8Am29aGMkfv3NzNUC1qXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849743; c=relaxed/simple;
	bh=jlbFnWqkJTnl/zzkZhCyWdDgvyh0j1BKiZNim9nq6d4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npgQRQLmSNRzgGDgk4VZ5rtcF2ueD9rAaRiTwybQvat57DakmS10ikEEV+RN+Zi4M4dO0Buigppwdn2WeS8T17bmrO1Lkuqjt3xFyICtPmhmWhThpqX6Uh6u7ahyr/wWtXiUnp5MKoB2uEUNJyxzB+ApQxQnjDFhMz5yX8Zrza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OUB41oPt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q1aXJt36; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kMODMvSG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qxOMW19b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUB41oPt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q1aXJt36";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kMODMvSG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qxOMW19b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4D915BEC8;
	Wed, 18 Mar 2026 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773849731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mSf19b1jhenmvaLomGbxX0Yg6uNP1NpERxPlC4iLUjo=;
	b=OUB41oPt9v9QXb9hwyPO7pkjdLHaYhQBzQ8Me03uXGDaebGJv5lD/lxW1fsDbpt3AE8P/m
	OaxwXr1TTyJ9Yp2s5IMClZG6nRAqMdETHVKb+n12Lbtu89bMX3tSjXxuNUR5hR9pvRMfq9
	8zXomZtOi0WQzxxCaw2aHpGAxRitiwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773849731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mSf19b1jhenmvaLomGbxX0Yg6uNP1NpERxPlC4iLUjo=;
	b=Q1aXJt360Mo3/bJKuq1RmYeqR8ksAUjyLTnMf6nCuMsDeX2BDUTZ+nYEBJ8jE5W8vH+Xw0
	BIhHoyWu8z75E9Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kMODMvSG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qxOMW19b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773849724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mSf19b1jhenmvaLomGbxX0Yg6uNP1NpERxPlC4iLUjo=;
	b=kMODMvSGzMtO3DOdpH/RJyJepbi96b40ikUDON8i1cYB9bi+vFnT9vlRUSLKSBwoIm/koQ
	oiW0C4/v8uwZSTkLTzBvRHjnvzcdYA2k6pJJSL5MLOv+XU2DWVBCNCOcIsEXvwsI8tH5B/
	UfI6YxCye8BxpGzy1fcjtcVm/FTYA3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773849724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mSf19b1jhenmvaLomGbxX0Yg6uNP1NpERxPlC4iLUjo=;
	b=qxOMW19bHl+SxvmMgSVB2A5vSwpOwxlzuv4ENH/J/Ru6R37I4uSncWvIl7P0P+yeNRrI0h
	SpnT3idgRgOcYIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6287B4273C;
	Wed, 18 Mar 2026 16:02:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wWqVFnvMumm1RgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 16:02:03 +0000
Date: Wed, 18 Mar 2026 17:02:03 +0100
Message-ID: <87341xceis.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] ALSA: asihpi: avoid write overflow check warning
In-Reply-To: <20260318124016.3488566-1-arnd@kernel.org>
References: <20260318124016.3488566-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,arndb.de,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[lkml];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: B4D915BEC8
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Wed, 18 Mar 2026 13:40:07 +0100,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 rightfully warns that the memcpy() in adapter_prepare() copies
> between different structures, crossing the boundary of nested
> structures inside it:
> 
> In file included from sound/pci/asihpi/hpimsgx.c:13:
> In file included from include/linux/string.h:386:
> include/linux/fortify-string.h:569:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>   569 |                         __write_overflow_field(p_size_field, size);
> 
> The two structures seem to refer to the same layout, despite the
> separate definitions, so the code is in fact correct.
> 
> Avoid the warning by copying the two inner structures separately.
> I see the same pattern happens in other functions in the same file,
> so there is a chance that this may come back in the future, but
> this instance is the only one that I saw in practice, hitting it
> multiple times per day in randconfig build.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> 
> v2: use correct union member

Applied now.  Thanks.


Takashi
