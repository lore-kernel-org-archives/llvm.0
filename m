Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11213BC14
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 03:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715311576; cv=none; b=Ls98wT/vkNKGVoBYP6i+M5P031RAIDdaY946nArPagXW/uD+/AsPC1YiPU+MuKB8oD9qcf1TkElbqWtiQ4dENx3w1SUMT44DR0JpGfvBfCTEzkXfQLze5201jxYuCcCIxEDYkkPiGCWKNQPhF0iqfadE/XmPK8rxsphP4h+Hw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715311576; c=relaxed/simple;
	bh=KR9+aZtQF0/pSAuWezxC9nZ37UK13y4iod1lyaoIAd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1EIqT+aMo6hKuHYkVsHwiZ9AkZcHPq1Bo6Pi2OfEZVjtl9qlG5NytjdwGC6JF0LiKkVdniBT16it68EmgxzNtEOJFH26QIRNcSWsVRqWAzy0Mp64eLX9F3kouVysGyyIsvJSa3SeBbM3wVwUPmxyLjUTywfMMpR2f2eEQSVUFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XIOmHxT/; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XIOmHxT/"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7e18348733fso63986439f.3
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 20:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715311573; x=1715916373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGxG2e2VKN3u+G1wPMCaUsbNuE8sBdNRV0fq8NAvdDA=;
        b=XIOmHxT/JjhphuLWqTpT9vTDXFZzLdnFWh38Ljf/E8KU5NAFqBZ4aA3J3N+PA1pvgB
         saf0itRK6JBdFgdcTN85FXicHkG0w5K929q3rAUnRVLj2FPcY0pZWb9+21i+nuqK/Cf6
         +0CrbSewDfVif8h7wzooe7Ysj2dpJlLJ7hEnPpFBImX7AeBL+utiOXt8sQSU3pogwGgH
         /cCtuZUbZkAfs0P+aWPXUxIHR2efDmZ6KV35vOuVlQ5xyuJA1JjE0dOCnpgBEMbLHmjR
         3uMOMC2TFbBNgeZ4V+vb3W938WR1f/z29+DmE/3GFWMNC2ueywoongKY/UW/91zOhp9V
         JfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715311573; x=1715916373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGxG2e2VKN3u+G1wPMCaUsbNuE8sBdNRV0fq8NAvdDA=;
        b=AeUdnPnnLwvpotKPZE5fWkrwWOrOrUgSOiAlf7IcLIm3wvr3L+5Q7FQ5nD5PjpZu/l
         lbewsIQpmqiUkAKxhAhFSWZxsOlyJBgWNr1FL95XrC4bK55WLs8/rudnM48PdJvAsfHM
         Gdax9gjTJ/q4594R6hChoh2dYUuTAoRcJY0nHAuAVhGB8gpPCOH7Se0m+dcIZjX50R/Y
         YYI88mdncEa5eJe+WRUJzALNnU461pintNlYEEUxnW66hqpccyYjNkNgyZAM76rtog6w
         ujRFTY8+4OksYS3Lt1DpJAtDfsb8XEydt94KJ9F9zm20cUuiUWAe5MM+9e7jdhnry72q
         m5eg==
X-Forwarded-Encrypted: i=1; AJvYcCXGIx59Jyvceqna1YC8jRObT3UwCZ6FtP8cBv6hOvA/xZJYTnrMDsOrfgBuh41dXUi2tZrqSIffcPcibDRDtA83IhTOcg==
X-Gm-Message-State: AOJu0YwMjG4F6bvYfUvhMbiWHDnOjiu7wyXZ3iVKvsFEjOB983ektatr
	7oTKzyaOW7E34teeKC68h4LYSAkYTM5zw4M/cXLeF+Pj+D5Gvu3tDfrhLaUOSQ==
X-Google-Smtp-Source: AGHT+IFjs2Y7MUqk7i3aTHdpOsTi/0KqnFICd1YQCAkvu8AdXH/Iyxc228RpFccF4GUU9d3ijbo4fw==
X-Received: by 2002:a05:6e02:168c:b0:36a:2538:d70d with SMTP id e9e14a558f8ab-36cc14eca55mr17036045ab.28.1715311572814;
        Thu, 09 May 2024 20:26:12 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489375c13f9sm710317173.97.2024.05.09.20.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 20:26:12 -0700 (PDT)
Date: Fri, 10 May 2024 03:26:08 +0000
From: Justin Stitt <justinstitt@google.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] libfs: fix accidental overflow in offset calculation
Message-ID: <6oq7du4gkj3mvgzgnmqn7x44ccd3go2d22agay36chzvuv3zyt@4fktkazj4cvw>
References: <20240510-b4-sio-libfs-v1-1-e747affb1da7@google.com>
 <20240510004906.GU2118490@ZenIV>
 <20240510010451.GV2118490@ZenIV>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510010451.GV2118490@ZenIV>

Hi,

On Fri, May 10, 2024 at 02:04:51AM +0100, Al Viro wrote:
> On Fri, May 10, 2024 at 01:49:06AM +0100, Al Viro wrote:
> > On Fri, May 10, 2024 at 12:35:51AM +0000, Justin Stitt wrote:
> > > @@ -147,7 +147,9 @@ loff_t dcache_dir_lseek(struct file *file, loff_t offset, int whence)
> > >  	struct dentry *dentry = file->f_path.dentry;
> > >  	switch (whence) {
> > >  		case 1:
> > > -			offset += file->f_pos;
> > > +			/* cannot represent offset with loff_t */
> > > +			if (check_add_overflow(offset, file->f_pos, &offset))
> > > +				return -EOVERFLOW;
> > 
> > Instead of -EINVAL it correctly returns in such cases?  Why?
> 
> We have file->f_pos in range 0..LLONG_MAX.  We are adding a value in
> range LLONG_MIN..LLONG_MAX.  The sum (in $\Bbb Z$) cannot be below
> LLONG_MIN or above 2 * LLONG_MAX, so if it can't be represented by loff_t,
> it must have been in range LLONG_MAX + 1 .. 2 * LLONG_MAX.  Result of
> wraparound would be equal to that sum - 2 * LLONG_MAX - 2, which is going
> to be in no greater than -2.  We will run
> 			fallthrough;
> 		case 0:
> 			if (offset >= 0)
> 				break;
> 			fallthrough;
> 		default:
> 			return -EINVAL;
> and fail with -EINVAL.

This feels like a case of accidental correctness. You demonstrated that
even with overflow we end up going down a control path that returns an
error code so all is good. However, I think finding the solution
shouldn't require as much mental gymnastics. We clearly don't want our
file offsets to wraparound and a plain-and-simple check for that lets
readers of the code understand this.

> 
> Could you explain why would -EOVERFLOW be preferable and why should we
> engage in that bit of cargo cult?

I noticed some patterns in fs/ regarding -EOVERFLOW and thought this was
a good application of this particular error code.

Some examples:

read_write.c::do_sendfile()
  ...
	if (unlikely(pos + count > max)) {
		retval = -EOVERFLOW;
		if (pos >= max)
			goto fput_out;
		count = max - pos;
	}

read_write.c::generic_copy_file_checks()
  ...
	/* Ensure offsets don't wrap. */
	if (pos_in + count < pos_in || pos_out + count < pos_out)
		return -EOVERFLOW;

... amongst others.

So to answer your question, I don't have strong feelings about what the
error code should be; I was just attempting to match patterns I had seen
within this section of the codebase when handling overflow/wraparound.

If -EOVERFLOW is technically incorrect or if it is just bad style, I'm
happy to send a new version swapping it over to -EINVAL

Thanks
Justin
