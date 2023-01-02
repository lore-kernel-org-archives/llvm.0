Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEED320E
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 12:50:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCD2120F26;
	Mon,  2 Jan 2023 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1672663820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAgWaDyX+CD+dHh7IWXVooNTsZBsSrrFLlnSItEwsbU=;
	b=wXVFNfsXtGEajs6z4yGHknsxESh9f+vtRtdfuP1i1X8sEVfqsAjmsjhXcqkOBacswWcYAC
	wQ2BOUuJi9Itt5NP7/yAPNaI6/7SXFfFO8QG743qILX/sGBkk/J2q8rBALc+BV7Mv5G3i0
	tbNre87gjI98OSElZabr5UmqBFrS6iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1672663820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAgWaDyX+CD+dHh7IWXVooNTsZBsSrrFLlnSItEwsbU=;
	b=zfSV81cXHMhk0J0/H6dk+ayKCD64OqT92Ux+9hAmjxrcBV33QNIFaCJnS3t6MJckpXK0Oe
	3X9V0pxDpVTd7ECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C177713427;
	Mon,  2 Jan 2023 12:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /EwrLwzTsmOpGwAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 02 Jan 2023 12:50:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 19026A073E; Mon,  2 Jan 2023 13:50:20 +0100 (CET)
Date: Mon, 2 Jan 2023 13:50:20 +0100
From: Jan Kara <jack@suse.cz>
To: Tom Rix <trix@redhat.com>
Cc: jack@suse.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] udf: initialize newblock to 0
Message-ID: <20230102125020.fg5m6aqz3ca4f2mt@quack3>
References: <20221230175341.1629734-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230175341.1629734-1-trix@redhat.com>

On Fri 30-12-22 12:53:41, Tom Rix wrote:
> The clang build reports this error
> fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>         if (*err < 0)
>             ^~~~~~~~
> newblock is never set before error handling jump.
> Initialize newblock to 0 and remove redundant settings.
> 
> Fixes: d8b39db5fab8 ("udf: Handle error when adding extent to a file")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks! I've added the patch to my tree.

								Honza

> ---
>  fs/udf/inode.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index 4a912e2edcec..31965c3798f2 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -604,7 +604,7 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
>  	struct kernel_lb_addr eloc, tmpeloc;
>  	int c = 1;
>  	loff_t lbcount = 0, b_off = 0;
> -	udf_pblk_t newblocknum, newblock;
> +	udf_pblk_t newblocknum, newblock = 0;
>  	sector_t offset = 0;
>  	int8_t etype;
>  	struct udf_inode_info *iinfo = UDF_I(inode);
> @@ -710,7 +710,6 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
>  		ret = udf_do_extend_file(inode, &prev_epos, laarr, hole_len);
>  		if (ret < 0) {
>  			*err = ret;
> -			newblock = 0;
>  			goto out_free;
>  		}
>  		c = 0;
> @@ -775,7 +774,6 @@ static sector_t inode_getblk(struct inode *inode, sector_t block,
>  				goal, err);
>  		if (!newblocknum) {
>  			*err = -ENOSPC;
> -			newblock = 0;
>  			goto out_free;
>  		}
>  		if (isBeyondEOF)
> -- 
> 2.27.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
