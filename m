Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09135377016
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834863; cv=none; b=uxNZ36axs4eBWNCzS2GZK3F9x7s2ni+Eyeq3GwFCf/EYz3L55OehesMlOb2tfiyM0vFICwjzhIkeQ9DThrkhe7GF3puFafy+7538JRTV219jnEmKyeDJGSm9Y+V8v3KWRbNEJzBS17BZ5xdjBaE1rUOXinWRYcR8n/JC7SpKSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834863; c=relaxed/simple;
	bh=B5aabVrK7CuFR9p6EofPvq+YGzmzY/pLaE+wFKqEHgU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMDQtDFfLCUjlaeD8scULv/65G2LO0KSscI5nzGwLqk0Tbt6QDANifBbyes/CLcIor3aVg0T/V6CL2TOnOz5Lbjs9LH5pipqMIE2OIlyWW65xxe8lD7m6fqSZxVrtG0IrE5qoPdig6bALU9kwx7YchDhnFWtq5NUuzYOkFTnTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BLEYd+lS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=raMiP9ff; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BLEYd+lS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=raMiP9ff; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BLEYd+lS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="raMiP9ff";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BLEYd+lS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="raMiP9ff"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E5844D3F2;
	Wed, 18 Mar 2026 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773834860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfNFbOAqwGkjQrO0stm4VazchXW3FOuSmfutzwdvZ+s=;
	b=BLEYd+lSa1qUCWL5oxD+ATNTe96cZomB1154tFARe3wfbG2lOBJd6z/SJjA09PsTINxNyN
	aBd79qAe3Q0zBNA0uLgr7/edQSyu3LImyR3pu0TV90IKHgH1dCLWsMCr34Sy7zPOOP9vQo
	SsonoK9YzrATaYlUnrrfNLzjVdjtVBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773834860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfNFbOAqwGkjQrO0stm4VazchXW3FOuSmfutzwdvZ+s=;
	b=raMiP9ffarhBezVoGkQ40+QXH82eFfwpwBjVLe4mj7jkjURsaBU/PdOjUZfRdPcOTX2MfD
	nxWu5i5/kfzw88DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773834860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfNFbOAqwGkjQrO0stm4VazchXW3FOuSmfutzwdvZ+s=;
	b=BLEYd+lSa1qUCWL5oxD+ATNTe96cZomB1154tFARe3wfbG2lOBJd6z/SJjA09PsTINxNyN
	aBd79qAe3Q0zBNA0uLgr7/edQSyu3LImyR3pu0TV90IKHgH1dCLWsMCr34Sy7zPOOP9vQo
	SsonoK9YzrATaYlUnrrfNLzjVdjtVBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773834860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfNFbOAqwGkjQrO0stm4VazchXW3FOuSmfutzwdvZ+s=;
	b=raMiP9ffarhBezVoGkQ40+QXH82eFfwpwBjVLe4mj7jkjURsaBU/PdOjUZfRdPcOTX2MfD
	nxWu5i5/kfzw88DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10CC84273B;
	Wed, 18 Mar 2026 11:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zjTQAmySummxPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 11:54:20 +0000
Date: Wed, 18 Mar 2026 12:54:19 +0100
Message-ID: <87eclhcpzo.wl-tiwai@suse.de>
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
Subject: Re: [PATCH] ALSA: asihpi: avoid write overflow check warning
In-Reply-To: <20260318105017.1934798-1-arnd@kernel.org>
References: <20260318105017.1934798-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[lkml];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,arndb.de,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Wed, 18 Mar 2026 11:50:08 +0100,
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
>  sound/pci/asihpi/hpimsgx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
> index b68e6bfbbfba..432a5b787a2a 100644
> --- a/sound/pci/asihpi/hpimsgx.c
> +++ b/sound/pci/asihpi/hpimsgx.c
> @@ -581,8 +581,10 @@ static u16 adapter_prepare(u16 adapter)
>  		HPI_ADAPTER_OPEN);
>  	hm.adapter_index = adapter;
>  	hw_entry_point(&hm, &hr);
> -	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter], &hr,
> -		sizeof(rESP_HPI_ADAPTER_OPEN[0]));
> +	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].h, &hr,
> +		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].h));
> +	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.s,
> +		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));

I think the last one is still a bit confusing as if doing an overflow
copy again: hr.u.s is struct hpi_subsys_res which is smaller than
rESP_HPI_ADAPTER_OPEN[adapter].a which is struct hpi_adapter_res.

If any, the last one should be

	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.ax.info,
		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));

Or it could be even

	rESP_HPI_ADAPTER_OPEN[adapter].a = hr.u.ax.info;

(I'm not sure which one can be a better result, though.)


thanks,

Takashi
