Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E380BE3
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715638027; cv=none; b=WOM7U4sUpDZYXJU9tLkq5fAFljEFaBbNmxONcV3LJO8QcgBzomSlL5S+pyicfVHDU+9uqBU526ewzko1UV7I8KP/FjbkiOU6ggIbRaJ7Oeje64Vh7vnR3H7p3MKiY4zOzKvT+ULHiJeg/ptBnQFf85N1ORM6wRQB7fLauKexYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715638027; c=relaxed/simple;
	bh=mZ4ms+V1KUqN4p5PXHq31cW+YVpnyNJ3X7Vbpk7ag2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ8eCjjAqltatUygF7FuaEFksBxWN3BFiLpWzpAIuw8uURPMlhiy1/4r72ivEzk1yJAVRHApMpv/M7V5hynM6PnDlGs/5y2jT0PrafYQNSUYJ5eXa5e7I0FUWS41rj8Ia1cCCG3NqRjawbRCgH5ME3ohFZceHci0dqTVerloSJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Yuza5UI; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Yuza5UI"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36c85170db2so22790755ab.0
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 15:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715638025; x=1716242825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUn2AW1w0vgCf/iafqE2auFhm5LkVxS+wThISH2ynMA=;
        b=4Yuza5UIwxlNQv8BTfUE52w1EQK3+0qWX3WHxjbOOh5iHfIr2dDsOzVTCQNlQMfocB
         oXOS3tFl5P4Q/HuipfXlfzd8zT02+yE6AWDDe/Q2hWD7U0jmyGuMHmDjUBmCDEB4j4qj
         8mH11Kc/gKJSFW8SsIQXWHQCbHHKcNQb3jxTAJZLvMJ+mk33j/CATpv7j2VsV6jN4Pot
         dBP7U9D6X/Y4YQc59L3SRZroFg8m0N/7/VJDeZ5gO/k1Ndb//kUybF2vKD6LeJ+KA4Jm
         NNjP42rHnBckIWsleNKD6cR3qZ37p/aL1t0xTen66sYoNbfuI3ayXhzd/0YwnFNzECVm
         WsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715638025; x=1716242825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUn2AW1w0vgCf/iafqE2auFhm5LkVxS+wThISH2ynMA=;
        b=iBnKXD/hgKfziMe3+ZZOyp7YcZzH8NZNgtzQVe1Y6jZDUhdH9cxl7S/w3XSngVYxMe
         P+PekQ6hFDFP7QRFdj+geML5JHbmP1h88uXHdd9yepL3bWt5Wo5pwVHiSANfZJKuVjP7
         Zo12KkXEiMnKC8M3AJldhcKoL2AsZzy5ATDivBkZdFF9BEhboSzsw5+DE0PYZ7LUhycc
         o/KuRBUbRRYbgljYNuxQ01Mg3vw8zutGd3HBd4R5Bcq8Clrac+2MeWqA8CyG/1AGXd1E
         31TsgXzYnH0IytU7Xr+ebEgNZqHzO4G9bAG/Cej8NuUDKPxRKn6ruX18SB61DkWoYyMc
         HScw==
X-Forwarded-Encrypted: i=1; AJvYcCWqpKJh1QwspfwSBVQLEtXnUroot6+K7nsCgwva88t8lh3PJ052uW/mpytPIf0BTgzaiigL3pvCO+Mi5NpJevWTNkiGRQ==
X-Gm-Message-State: AOJu0YwWWra9GIPuiURVU+ZMdd2pGUdddzcZ2QD2kSoY0GjgwVKRoX1L
	AvJj0zMSOM7mgCavsX4C0GUoxMiE2a2VPWyoS+SV7pEM5PlsZO9Qu3xgQvs1jQ==
X-Google-Smtp-Source: AGHT+IFjekC3/wk3ILbUqc0s7IPtYONycCw5QWMFVQVvxrFuhoysFXKfr+BdK3bb3fwrb0JJhvIKEg==
X-Received: by 2002:a92:cda1:0:b0:36c:546c:ccf6 with SMTP id e9e14a558f8ab-36cc148e3cfmr143375475ab.16.1715638024588;
        Mon, 13 May 2024 15:07:04 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36cb9d3f5f6sm24446685ab.4.2024.05.13.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 15:07:03 -0700 (PDT)
Date: Mon, 13 May 2024 22:06:59 +0000
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] fs: fix unintentional arithmetic wraparound in offset
 calculation
Message-ID: <q2qn5kgnfvfcnyfm7slx7tkmib5qftcgj2uufqd4o5vyctj6br@coauvkdhpjii>
References: <20240509-b4-sio-read_write-v2-1-018fc1e63392@google.com>
 <202405131251.6FD48B6A8@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405131251.6FD48B6A8@keescook>

On Mon, May 13, 2024 at 01:01:57PM -0700, Kees Cook wrote:
> On Thu, May 09, 2024 at 11:42:07PM +0000, Justin Stitt wrote:
> >  fs/read_write.c  | 18 +++++++++++-------
> >  fs/remap_range.c | 12 ++++++------
> >  2 files changed, 17 insertions(+), 13 deletions(-)
> > 
> > diff --git a/fs/read_write.c b/fs/read_write.c
> > index d4c036e82b6c..d116e6e3eb3d 100644
> > --- a/fs/read_write.c
> > +++ b/fs/read_write.c
> > @@ -88,7 +88,7 @@ generic_file_llseek_size(struct file *file, loff_t offset, int whence,
> >  {
> >  	switch (whence) {
> >  	case SEEK_END:
> > -		offset += eof;
> > +		offset = min(offset, maxsize - eof) + eof;
> 
> This seems effectively unchanged compared to v1?
> 
> https://lore.kernel.org/all/CAFhGd8qbUYXmgiFuLGQ7dWXFUtZacvT82wD4jSS-xNTvtzXKGQ@mail.gmail.com/
> 

Right, please note the timestamps of Jan's review of v1 and when I sent
v2. Essentially, I sent v2 before Jan's review of v1 and as such v2 does
not fix the problem pointed out by Jan (the behavior of seek is
technically different for VERY LARGE offsets).

> >  		break;
> >  	case SEEK_CUR:
> >  		/*
> > @@ -105,7 +105,8 @@ generic_file_llseek_size(struct file *file, loff_t offset, int whence,
> >  		 * like SEEK_SET.
> >  		 */
> >  		spin_lock(&file->f_lock);
> > -		offset = vfs_setpos(file, file->f_pos + offset, maxsize);
> > +		offset = vfs_setpos(file, min(file->f_pos, maxsize - offset) +
> > +					      offset, maxsize);
> >  		spin_unlock(&file->f_lock);
> >  		return offset;
> >  	case SEEK_DATA:
> > @@ -1416,7 +1417,7 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
> >  	struct inode *inode_in = file_inode(file_in);
> >  	struct inode *inode_out = file_inode(file_out);
> >  	uint64_t count = *req_count;
> > -	loff_t size_in;
> > +	loff_t size_in, in_sum, out_sum;
> >  	int ret;
> >  
> >  	ret = generic_file_rw_checks(file_in, file_out);
> > @@ -1450,8 +1451,8 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
> >  	if (IS_SWAPFILE(inode_in) || IS_SWAPFILE(inode_out))
> >  		return -ETXTBSY;
> >  
> > -	/* Ensure offsets don't wrap. */
> > -	if (pos_in + count < pos_in || pos_out + count < pos_out)
> > +	if (check_add_overflow(pos_in, count, &in_sum) ||
> > +	    check_add_overflow(pos_out, count, &out_sum))
> >  		return -EOVERFLOW;
> 
> I like these changes -- they make this much more readable.
> 
> >  
> >  	/* Shorten the copy to EOF */
> > @@ -1467,8 +1468,8 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
> >  
> >  	/* Don't allow overlapped copying within the same file. */
> >  	if (inode_in == inode_out &&
> > -	    pos_out + count > pos_in &&
> > -	    pos_out < pos_in + count)
> > +	    out_sum > pos_in &&
> > +	    pos_out < in_sum)
> >  		return -EINVAL;
> >  
> >  	*req_count = count;
> > @@ -1649,6 +1650,9 @@ int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
> >  	loff_t max_size = inode->i_sb->s_maxbytes;
> >  	loff_t limit = rlimit(RLIMIT_FSIZE);
> >  
> > +	if (pos < 0)
> > +		return -EINVAL;
> > +
> >  	if (limit != RLIM_INFINITY) {
> >  		if (pos >= limit) {
> >  			send_sig(SIGXFSZ, current, 0);
> > diff --git a/fs/remap_range.c b/fs/remap_range.c
> > index de07f978ce3e..4570be4ef463 100644
> > --- a/fs/remap_range.c
> > +++ b/fs/remap_range.c
> > @@ -36,7 +36,7 @@ static int generic_remap_checks(struct file *file_in, loff_t pos_in,
> >  	struct inode *inode_out = file_out->f_mapping->host;
> >  	uint64_t count = *req_count;
> >  	uint64_t bcount;
> > -	loff_t size_in, size_out;
> > +	loff_t size_in, size_out, in_sum, out_sum;
> >  	loff_t bs = inode_out->i_sb->s_blocksize;
> >  	int ret;
> >  
> > @@ -44,17 +44,17 @@ static int generic_remap_checks(struct file *file_in, loff_t pos_in,
> >  	if (!IS_ALIGNED(pos_in, bs) || !IS_ALIGNED(pos_out, bs))
> >  		return -EINVAL;
> >  
> > -	/* Ensure offsets don't wrap. */
> > -	if (pos_in + count < pos_in || pos_out + count < pos_out)
> > -		return -EINVAL;
> > +	if (check_add_overflow(pos_in, count, &in_sum) ||
> > +	    check_add_overflow(pos_out, count, &out_sum))
> > +		return -EOVERFLOW;
> 
> Yeah, this is a good error code change. This is ultimately exposed via
> copy_file_range, where this error is documented as possible.
> 
> -Kees
> 
> -- 
> Kees Cook
