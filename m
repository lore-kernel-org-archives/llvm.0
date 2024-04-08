Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AE3BB50
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563197; cv=none; b=SkdsRbByt1fGGLn0T3+nIk0SZPHjkJwk3JVVqq5WCURJH1HQNtUV+8zlZcWefwAieknNMfby2PGVIs6Iy6+UJUPMSteLxlVgqpzQ6VU6xsB9OqeeZ3O8qbkCZU9TVxea/lftDT8fbrCLWhc6shcLHocKOxRzjv+9HGL5Yu+0/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563197; c=relaxed/simple;
	bh=i9GmgAXRUBO3xKQwlP/KAP2zpPAiSC47cX5gf5BqJfg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnpqodeFuS8djodLgki9vDQGSNh9FNthqQY8PU4AzROrIMBpXNOkRI42KPbbvbBCyBHW7WyLnITliGUhiAGBE9HxO/1sZvAZ9BhKrxKs2Dk2URmNYQ0sT2EUrk//mXzXIyom7Ymfbx7ywvqEOxnfTCLe0IdnD2lFOOUM1uAqf3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EXHENISy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NG6esFs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EXHENISy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NG6esFs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EXHENISy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NG6esFs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EXHENISy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NG6esFs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA46D22157;
	Mon,  8 Apr 2024 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712563193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeMiwe/89XLtlU9A7wTUtu+OV5lp0v9WZ0aprkeXVh8=;
	b=EXHENISyHk0j7TJEZacEu01aHSPwcJd3jqtyt9OVBA8LUkMMraeOemEjRMfbR1SGdLzphX
	EGYGGwyZUZz+DqZCPZVqDiZufrwGnlS6cRr/DoW6s2QBj6kVVPUXkvZv1Dy2lgz3FNI6Ih
	uqWVCJmSD5BwvOoJZhmKzfHFolcjvo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712563193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeMiwe/89XLtlU9A7wTUtu+OV5lp0v9WZ0aprkeXVh8=;
	b=5NG6esFs0xZT2IRnNAMtIKcI4HbY8Bou2EWslwPlsGvKBT4fAw4zrPS8jUSex3KlOEqjB2
	7f8dq5mT4uAVF+DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EXHENISy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5NG6esFs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712563193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeMiwe/89XLtlU9A7wTUtu+OV5lp0v9WZ0aprkeXVh8=;
	b=EXHENISyHk0j7TJEZacEu01aHSPwcJd3jqtyt9OVBA8LUkMMraeOemEjRMfbR1SGdLzphX
	EGYGGwyZUZz+DqZCPZVqDiZufrwGnlS6cRr/DoW6s2QBj6kVVPUXkvZv1Dy2lgz3FNI6Ih
	uqWVCJmSD5BwvOoJZhmKzfHFolcjvo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712563193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeMiwe/89XLtlU9A7wTUtu+OV5lp0v9WZ0aprkeXVh8=;
	b=5NG6esFs0xZT2IRnNAMtIKcI4HbY8Bou2EWslwPlsGvKBT4fAw4zrPS8jUSex3KlOEqjB2
	7f8dq5mT4uAVF+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22A4E137D4;
	Mon,  8 Apr 2024 07:59:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fcxmAfijE2ZNXwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 08 Apr 2024 07:59:52 +0000
Date: Mon, 8 Apr 2024 09:59:43 +0200
From: Jean Delvare <jdelvare@suse.de>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
 "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Greg Kroah-Hartman" <gregkh@suse.de>, "Nicolas
 Schier" <nicolas@fjasle.eu>, "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt"
 <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH 05/12] firmware: dmi-id: add a release callback function
Message-ID: <20240408095943.48e6c0cc@endymion.delvare>
In-Reply-To: <63909b0a-7d76-418d-a54c-1061bd3b6e11@app.fastmail.com>
References: <20240326144741.3094687-1-arnd@kernel.org>
	<20240326145140.3257163-4-arnd@kernel.org>
	<20240329134917.579c3557@endymion.delvare>
	<63909b0a-7d76-418d-a54c-1061bd3b6e11@app.fastmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.60 / 50.00];
	BAYES_HAM(-2.09)[95.57%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BA46D22157
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.60

Hi Arnd,

On Thu, 04 Apr 2024 16:07:55 +0200, Arnd Bergmann wrote:
> On Fri, Mar 29, 2024, at 13:49, Jean Delvare wrote:
> > Will you get this upstream, or do you expect me to take it in my
> > dmi/for-next branch?  
> 
> It would help me if you can apply it to your tree directly.

OK, it's in my dmi-for-next branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git/log/?h=dmi-for-next

Thanks,
-- 
Jean Delvare
SUSE L3 Support
