Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935A85272
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715642999; cv=none; b=o0JpwulQ0lCJk9eiwU1HjJcOkJR6m1FQPvDrKVWslu++s+DOdD3YT01gkxG5Nwv2oem2iyFKA7npFR0mHu4dC/E1XqUDTQ7iNQDIfkN6nmwNu8qbR6zC058xQfhALMQHFqlzZU3Y8/kCvUxhnugOKsRWrTsFl+htk3TtcLCSwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715642999; c=relaxed/simple;
	bh=dH2Gh/VfvRAwRMCapomFJKaaLGs4S106axXfgAQnxwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcI7r6NOe3uGD5friYTZdz8/D7f2OTG1u51Tep0Mo2o3AaEyUy+9mq8AK0KAT5q7wy7kmPGVNKLJDBhtVXm6/vcd0vWEZIXUrMOBvZlJv5rlVrlxOSwZRZvjynpEs+6r3Na3URkrAzQw0IcmDQRDq/C0o/vM+I1R1jsmHSRT/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIpNkng8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIpNkng8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ee5235f5c9so38046895ad.2
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715642997; x=1716247797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E1EiMHldIKpnCXznyOw68lbbiSInf8wRIhCrNgk+6Oc=;
        b=WIpNkng8S00+xWmSJfGX9NYJTHgRMD8xZofvFtIwTzpP7kx78jbA6sujUJMF+GSKHT
         /eNNmGcUInvdRYCPAzYG+vsQZbKp0tQFvEA3qz0RE8jSeioayNYpWy64abbUpNLQVZmH
         xe522sKQXfVOW/d+54W4vGuYqjN7pe9+qafUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715642997; x=1716247797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1EiMHldIKpnCXznyOw68lbbiSInf8wRIhCrNgk+6Oc=;
        b=fLeU7qLEM16fAHNwpsOK1cVD7GOjHv7pZhktXUKWJc6LNgstlheUZ5HpmuhD3LkWlK
         CjXlWeIc6f4JnfBPHkB3LSytwqKYr9DQr34SdpFbub44VbtGGFWuVG2VbJS9PMf1CauO
         CkF0ztzpfxW+TJ4cm9zsocL+Aa4qQhRIwI63jN1M+1MS1KcYHRnSh3xhcNUMf5uWcdtY
         15f+V2dDyXQddWTFmBghE9TUeajSz6dJtBZRTiOw7pAAi56PzgJlim6QqocjSAhGHo5t
         ldqYaBb7cGGoqWUB6C6StIaHV1loT/vvdwN6NEbOHq+DtCoI5+cLCv8nyW6z54A3tTuz
         nSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtTNZkTpC70aeWzPuoj9beH8a7WF52AIKJNzdl4Ye6+Qz/+/83o+z+DRut6BZN0NWj2vlIDkmWIBZcIzc7/a/jDYjM4w==
X-Gm-Message-State: AOJu0Yz94Hetn8bbBYQaLP+vxGAdHA1dKAcpsyoo0YkD/fp0inTObu7c
	Nnyh5AlZI/Ri2Ioo1hH8zlwIyiGUzXJ0TRF42lK8DWFNSEEwSPm52GfPCr+zrw==
X-Google-Smtp-Source: AGHT+IHqChMWCIwa2ur3c5lXZsd7v1cl+KVoR9q/GWMdtWIhwTCr3j8ecpny3TzA+YcBJyw2U0Qsdw==
X-Received: by 2002:a17:902:f60a:b0:1ea:a87f:bd2c with SMTP id d9443c01a7336-1ef4405a80cmr134147885ad.68.1715642996861;
        Mon, 13 May 2024 16:29:56 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30c09sm84557115ad.130.2024.05.13.16.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:29:56 -0700 (PDT)
Date: Mon, 13 May 2024 16:29:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] fs: fix unintentional arithmetic wraparound in offset
 calculation
Message-ID: <202405131629.9C315328C1@keescook>
References: <20240509-b4-sio-read_write-v2-1-018fc1e63392@google.com>
 <202405131251.6FD48B6A8@keescook>
 <q2qn5kgnfvfcnyfm7slx7tkmib5qftcgj2uufqd4o5vyctj6br@coauvkdhpjii>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2qn5kgnfvfcnyfm7slx7tkmib5qftcgj2uufqd4o5vyctj6br@coauvkdhpjii>

On Mon, May 13, 2024 at 10:06:59PM +0000, Justin Stitt wrote:
> On Mon, May 13, 2024 at 01:01:57PM -0700, Kees Cook wrote:
> > On Thu, May 09, 2024 at 11:42:07PM +0000, Justin Stitt wrote:
> > >  fs/read_write.c  | 18 +++++++++++-------
> > >  fs/remap_range.c | 12 ++++++------
> > >  2 files changed, 17 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/fs/read_write.c b/fs/read_write.c
> > > index d4c036e82b6c..d116e6e3eb3d 100644
> > > --- a/fs/read_write.c
> > > +++ b/fs/read_write.c
> > > @@ -88,7 +88,7 @@ generic_file_llseek_size(struct file *file, loff_t offset, int whence,
> > >  {
> > >  	switch (whence) {
> > >  	case SEEK_END:
> > > -		offset += eof;
> > > +		offset = min(offset, maxsize - eof) + eof;
> > 
> > This seems effectively unchanged compared to v1?
> > 
> > https://lore.kernel.org/all/CAFhGd8qbUYXmgiFuLGQ7dWXFUtZacvT82wD4jSS-xNTvtzXKGQ@mail.gmail.com/
> > 
> 
> Right, please note the timestamps of Jan's review of v1 and when I sent
> v2. Essentially, I sent v2 before Jan's review of v1 and as such v2 does
> not fix the problem pointed out by Jan (the behavior of seek is
> technically different for VERY LARGE offsets).

Oh! Heh. I was tricked by versioning! ;)

-- 
Kees Cook
