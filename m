Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017962;
	b=xFFfmkkhic0qkvxeyS5yR+LpKWFph1p6mCaSOwXwuLjYGgGS/mX0u5JoWo8UYQYL8xLz
	 2a6YafGebpQU/35CiUffb7YZqOFCHq8AXUPaAScMow5J94Tp/0xUcEkJTEHql4/Sokthr
	 VC6ttx8HbZGlmmmrrvPRBXMcGpAk5MpqYh0igSyk6PCVUhXXbJYtSx9+Bb+wi8PN4bh+3
	 7gnCk7lwZW/4tLG99pWzODQ9aKGNMHk51/Nhq7Z4b8u6JkM3HnoLqQdqbRaOg7a0XrOte
	 KoFQTOZp1gNAI5UzJEyQ02wzppqt68upCzfPupBwtRlFbiELIv5WLx5aJzdDuohI19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017962;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=pTAzI2hUKUTu9W9mB/eEoovB30J1dpgkPcyXX/Rmmjo=;
	b=ogffh6pGs8JAH4lZBN2aj+a2kzmbaG+uI86znKT9wRuMbaKLJ/xyu7YOG+nUQ7n0q89c
	 snZ4daxFHPjODosyA4+cBD8zMJEMOEnaEFHJ+9LrbWId80qQRZ/Q2rPn+jcCM1fyX4S/0
	 aVfR5cHxZhzUhc8/swQ8Z3K0FyPMpvYGjhPUPIq98/QinquuteFCBV0+G351DWK7P0Qw7
	 bSWf2soWPfiN7zwW4PFtGlfIvFxlICg6ajwIBHhtrnCzbZ8O2VDWth/SayqAU6tOs5A/z
	 lqSlpT9IL+vb7hphWLFNDmJECMKBDCA+rxQToNeHdKqSVJTJezG/C7jplnjm6T2zZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bqm8BSbl;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0hC7VGlX;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=M+a2xroc;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="J/bxvERt";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD00606A31F
	for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 12:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD00606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bqm8BSbl;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0hC7VGlX;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=M+a2xroc;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J/bxvERt
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 255301F7A1;
	Mon, 26 Oct 2026 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793017960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTAzI2hUKUTu9W9mB/eEoovB30J1dpgkPcyXX/Rmmjo=;
	b=bqm8BSbl79/5I0jhOT769hkDicqExLxI/IoIUsOUzcfgmvccNlJi3h3Z7fVoRZJR7rXDN3
	r/g7ZBoz9ssa8zjLVlpYj8+1dj46qQbUsYl5aRESWBkPolHBOdGKmjl9GYjSGGNsPr0r/R
	6rFUr8Z3RjJqQRJQFBJ72sURGD18BOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793017960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTAzI2hUKUTu9W9mB/eEoovB30J1dpgkPcyXX/Rmmjo=;
	b=0hC7VGlXRxZeUdbe3mLmEtSScwT4+e4wU3ZVoEdlkErMJksXHasFGosl9hs6Q78YTZ+jqz
	iABOal/EkQmcbaBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793017959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTAzI2hUKUTu9W9mB/eEoovB30J1dpgkPcyXX/Rmmjo=;
	b=M+a2xroc3RMugjNL0reMI9hIghuy1Lbj6wQrXpG49VImvwolbk7gY6UyJn9aWHN7Wy84rE
	gyUoa8jLm7Ha8GDiqAUTnKlZziz9JSjEgJW/FjvTnA99sz+4vCiQnFvOjgnYs9Fk7vCR5o
	P4GIXRa835xVelZ/7y4B7+kSLeEfFdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793017959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTAzI2hUKUTu9W9mB/eEoovB30J1dpgkPcyXX/Rmmjo=;
	b=J/bxvERt7yfv9BETOYH9U30R9IiYOCmgfNRlKqLubNYvSONwlBAR9v05ARPsb144UrLFEs
	TLg300GKUtN6p+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE92B13319;
	Mon, 26 Oct 2026 12:32:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KzAGMmZI32oPOwAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 26 Oct 2026 12:32:38 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 6F282A1419; Mon, 26 Oct 2026 13:32:34 +0100 (CET)
Date: Mon, 26 Oct 2026 13:32:34 +0100
From: Jan Kara <jack@suse.cz>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Kara <jack@suse.com>, Marco Elver <elver@google.com>, 
	Timothy Day <timday@thelustrecollective.com>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] ext2: Make sbi an proper alias for EXT2_SB(sb) in
 ext2_fill_super()
Message-ID: <l5r3w2wshrbhcxx4jamjufxdodmkb75zvitxcrll3uipih5cfq@plrdwt7fy5xz>
References: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,msgid.link:url,llvm.org:url]
X-Spam-Score: -12.80

On Fri 23-10-26 14:25:02, Nathan Chancellor wrote:
> A recent LLVM change to fix parsing and validating __guarded_by on
> structure members [1] reveals a couple of warnings in ext2_fill_super()
> from the annotations added by commit 023051c2d0f1 ("ext2: mark
> s_mount_state as guarded by s_lock") and commit c23746524faf ("ext2:
> annotate s_rsv_window_root as requiring s_rsv_window_lock"):
> 
>   fs/ext2/super.c:1040:7: error: writing variable 's_mount_state' requires holding spinlock '_res->s_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1040 |         sbi->s_mount_state = le16_to_cpu(es->s_state);
>         |              ^
>   fs/ext2/super.c:1040:7: note: found near match 'EXT2_SB(sb).s_lock'
>   fs/ext2/super.c:1138:8: error: writing variable 's_rsv_window_root' requires holding spinlock '_res->s_rsv_window_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1138 |                 sbi->s_rsv_window_root = RB_ROOT;
>         |                      ^
>   fs/ext2/super.c:1138:8: note: found near match 'EXT2_SB(sb).s_rsv_window_lock'
> 
> Context analysis does very minimal alias detection [2], so it is not
> able to figure out that sbi == sb->s_fs_info == EXT2_SB(sb). The only
> reason there were no warnings before the above LLVM change is because
> the annotation was not parsed and verified correctly.
> 
> Rework the allocation and assignment of sbi to have a direct assignment
> of EXT2_SB(sb) to sbi so that the analysis knows that sbi and
> EXT2_SB(sb) refer to the same object, clearing up the warnings.
> 
> Fixes: 9708538ba204 ("ext2: enable context analysis support for ext2 filesystem")
> Link: https://github.com/llvm/llvm-project/commit/217e229a1f32785fccdd3b3f51429f0d309dea45 [1]
> Link: https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#no-alias-analysis [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

OK, if this helps you :). Added to my tree, I plan to push it to Linus for
rc2.

								Honza

> ---
> Changes in v2:
> - Fix allocation size (Sashiko). I thought that I checked that they
>   were equivalent but I guess not :/
> - Link to v1: https://patch.msgid.link/20261023-ext2-fix-context-analysis-clang-24-v1-1-2b35c33cd0fa@kernel.org
> ---
>  fs/ext2/super.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index fb217ef2d69f..bde5b433776c 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -883,17 +883,18 @@ static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
>  	__le32 features;
>  	int err;
>  
> -	sbi = kzalloc_obj(*sbi);
> -	if (!sbi)
> +	sb->s_fs_info = kzalloc_obj(*sbi);
> +	if (!sb->s_fs_info)
>  		return -ENOMEM;
> +	sbi = EXT2_SB(sb);
>  
>  	sbi->s_blockgroup_lock =
>  		kzalloc_obj(struct blockgroup_lock);
>  	if (!sbi->s_blockgroup_lock) {
> -		kfree(sbi);
> +		kfree(sb->s_fs_info);
> +		sb->s_fs_info = NULL;
>  		return -ENOMEM;
>  	}
> -	sb->s_fs_info = sbi;
>  	sbi->s_sb_block = sb_block;
>  
>  	guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
> 
> ---
> base-commit: 782654a3e9c4065dea2e9f10539899d348b7a1fc
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261023-ext2-fix-context-analysis-clang-24-504b5dd53038
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
