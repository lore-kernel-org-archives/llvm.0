Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAC4854F4
	for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401206; cv=none; b=tX+wBLynQIAGkZy1unI48NwXJa+2o9+hD1m4FvpRE1jFg1hjWnG7hMaPicrZQlTNvrOfAgAi9tUYH2/SIocndgVj996k8/L4bRLLUDgEbrDTrM8/JOTdo1UTbs8skqa3SayhF5ZIu6a1m+nMCTkgLrUWrXagvHp+keU4m4+UhcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401206; c=relaxed/simple;
	bh=CJPdnJPDgAhmts5HCz5PCbMGbC6isHqPfvxJFOtvYcc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2OaL568NvoNRap+dktytwsmvUiXOSzJC036nlm5uGj2leGRAnTvdRpetErHQEAPgmBH1gtdrl8m6SLNS6OPdLKIcUuXyoG0pjCx7XovBJiCLs14I8RPM5QFVWQQ0ukZwoYhctn/i27d+0b0hEFIi7plTFGvSbI7iI0B9ho0vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LoDb+sKn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=09Rz/4uz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RmvMdzfi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JAkNuS6X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LoDb+sKn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="09Rz/4uz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RmvMdzfi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JAkNuS6X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC81B1FF45;
	Mon, 14 Sep 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEpmebZ3J9nvl5IRx5csm9JorAMkCS6kTS8+ivzL9/Y=;
	b=LoDb+sKn9JbUo+s6Rdc1kSPRHJ4osNEcRNWn6wpMy14F7fEt9qYCU48jMkid3vMImUooQD
	pb4LjSp1xdLXYpLR5xMYGzCuo9149b5TlW6zdOfa9BcmgeJwlzbG5E6RE1FU7u3zr5M413
	IGsT6rjeRrgySSuY9v05+2EWJUdp+p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEpmebZ3J9nvl5IRx5csm9JorAMkCS6kTS8+ivzL9/Y=;
	b=09Rz/4uzjZsvBKXh/RbXLWRklC3Ep2//lSDQKAZot6oK2VF0aeIiWe9EVwCGO05Rge7I/j
	+EcxXCFFq8G/UeAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RmvMdzfi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JAkNuS6X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEpmebZ3J9nvl5IRx5csm9JorAMkCS6kTS8+ivzL9/Y=;
	b=RmvMdzfi0TipwjsjtMKAh1WR0lTOLU9/4LLUJ0GOJMkps4iFMWWWRaruhmwREnK8I0KTYY
	W3LGhX/U8+3nPdx3fmkQApNNbWAhFbpEkPou7LWsV0OQ3rDKKnqT70W+P4LmD0ZlhzGiIv
	RVyo8MPEIuWvY2IAyMO2AZbEye76/A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VEpmebZ3J9nvl5IRx5csm9JorAMkCS6kTS8+ivzL9/Y=;
	b=JAkNuS6X4qZkz+v2BQcKgYnQLJ9kpuKU1IGFEUf2Cudn+eVRYHpF5jMvXQnqUKpQF2bq9i
	e41ljTGg0dqY2cCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 450AD13515;
	Mon, 14 Sep 2026 15:53:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oKQtD2kYqGpYBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 15:53:13 +0000
Date: Mon, 14 Sep 2026 17:53:12 +0200
Message-ID: <87ecevommv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Asai Neko <sugar@sne.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: skip the broken mute control on AVerMedia GC553Pro
In-Reply-To: <20260914-avermedia-gc553pro-alsa-v1-1-4c694e8b0cd5@sne.moe>
References: <20260914-avermedia-gc553pro-alsa-v1-1-4c694e8b0cd5@sne.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AC81B1FF45
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 14 Sep 2026 12:58:29 +0200,
Asai Neko wrote:
> 
> Skip the nonfunctional master mute control on the AVerMedia Live Gamer
> ULTRA S GC553Pro (07ca:1553).
> 
> USB tracing shows that GET_CUR returns zero bytes instead of the required
> one-byte value, both through usbfs and during ALSA initialization.
> SET_CUR succeeds, but switching capture off does not mute HDMI audio.
> 
> Before the change, the driver exposed a misleading PCM Capture Switch
> and logged: 3:2: failed to get current value for ch 0 (-22)
> 
> With the patch applied, the switch and warning are absent. A ten-second
> sound recording through PipeWire confirmed that stereo 48 kHz, 16-bit
> capture still works.
> 
> Tested on NixOS with the patched 7.3.0-rc3 kernel. The USB audio driver
> object builds with Clang and W=1; sparse and strict checkpatch pass.
> 
> Signed-off-by: Asai Neko <sugar@sne.moe>

Applied now.  Thanks.


Takashi
