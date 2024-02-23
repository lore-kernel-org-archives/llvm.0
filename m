Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881313248A
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710613; cv=none; b=ILtoI9gHH61bxeGapRNdmHsza7X6tW39TZbAW5lWd28etgiX2RA0ufB2MMcYZRS5yaw0FUx4xWgDVzY89rIR2tnuQnrSRnV+B9UnebnJPFCnNVeXCrx+E3UPHRPrKf4qPqIgV7rhxabeRmo9v5VufDkhI1KLiIpK1TWULwM9xm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710613; c=relaxed/simple;
	bh=CjG7WgCgFDAFL/tReNZpG/kD85Tt86MKrrUPD2AYLQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcLpkzPBPVkpS/sfgSx5ayZgKKcMKqjc9KfWPOwE3F1CkrN7PpuZPRA8iBdgWcww01UcKlYVB2sobv7wpuz5yn9TMI0d+r75K2sKdJ5NJHVuW35QIn/xx5hGdybSEPN1ygA+TtToyiLhSczWIuLgV0jPV/BX/JVJKZ3fBOqRsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VsbO1ZIy; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VsbO1ZIy"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5e44a2e34eeso991708a12.1
        for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708710611; x=1709315411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh8E4x68Izt4HceoSL2C5zjPW+nFmkMjm9Tr07dbTE4=;
        b=VsbO1ZIyq+1vaVHoXHtAhiDAWW92fKjWBzjdqq5Dd6jHnp80Mz2PX/UeIt1X3Rx3Vh
         3SLnMoLxGV8nG75d48JlAZM5MYQMgF0mvRs35Uy3rbfQxXPBxOpE4O1HAlJMwXMqDXFf
         Q4X4xvxf2TLj/qnYqdt5NvN1gdQv7yjKV9lHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710611; x=1709315411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh8E4x68Izt4HceoSL2C5zjPW+nFmkMjm9Tr07dbTE4=;
        b=c4pok7BFr4vN4+GXPZyrHPZEAeMNXdBK8DHISsBcUqDA/irLXcEzHAs2dCJj/ZU43J
         HDx4MLvh93LMEm9hnHot0cypE7/9M9HHYBa/3knVHF7pjRYBvEpIVQL1hno3UKFvaSza
         mUQ8l+8VC71yTceTEmPzSzdgKNJzmmBi62ggEJUNM+iCfC1Of7874hsfA3DtKIuVSHdM
         /2DdSTTipPfp7x06b8scMnNK+YkZ3WqzNLU1M2i/BzvqyZmZwzqGtP2D4KgGFBPZcHVB
         /nG5Vh/+0HBybWJ/1AFPbPUI/IfsEFqjVvOjUdsMRXwgPxRoGUg8BywbfEOp94I4Wumw
         Cjjg==
X-Forwarded-Encrypted: i=1; AJvYcCVOqS4j0IeS4pzJIqaJruiBlkvrwQtld/YVKm2bSA6MTew6qrG2B/7Qyb+68HnEa/prSU32mhgUtw/Ho3Jsg0fLFWQE/w==
X-Gm-Message-State: AOJu0Ywmx7tA7N16Bm8bUmGPszOxDH0pDkM+4xZv5IXsMH949YCX5ByT
	gM0XVn+44j/XKNpAQQJskQRTLl93leKXoQproGFE78v6yOw1j1spJmfZ9w1wzw==
X-Google-Smtp-Source: AGHT+IH1UP6oOCdgigSlZN7GfzqMGdE+JitpTrFkneg82nmtKJhtaUdsf1z4v1ua63Pt3t+NHytt5w==
X-Received: by 2002:a05:6a20:a901:b0:1a0:61e4:a940 with SMTP id cd1-20020a056a20a90100b001a061e4a940mr573533pzb.45.1708710610948;
        Fri, 23 Feb 2024 09:50:10 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u2-20020a656702000000b005dc26144d96sm10977296pgf.75.2024.02.23.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:50:10 -0800 (PST)
Date: Fri, 23 Feb 2024 09:50:10 -0800
From: Kees Cook <keescook@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Tomislav Denis <tomislav.denis@avl.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] iio: pressure: dlhl60d: Initialize empty DLH bytes
Message-ID: <202402230949.E06F3297@keescook>
References: <20240223172936.it.875-kees@kernel.org>
 <ZdjaOLVd1yxNXhsp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdjaOLVd1yxNXhsp@smile.fi.intel.com>

On Fri, Feb 23, 2024 at 07:47:36PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 23, 2024 at 09:29:39AM -0800, Kees Cook wrote:
> > 3 bytes were being read but 4 were being written. Explicitly initialize
> > the unused bytes to 0 and refactor the loop to use direct array
> > indexing, which appears to silence a Clang false positive warning[1].
> 
> ...
> 
> >  	for_each_set_bit(chn, indio_dev->active_scan_mask,
> > -		indio_dev->masklength) {
> > -		memcpy(tmp_buf + i,
> > +			 indio_dev->masklength) {
> > +		memcpy(&tmp_buf[i++],
> >  			&st->rx_buf[1] + chn * DLH_NUM_DATA_BYTES,
> >  			DLH_NUM_DATA_BYTES);
> > -		i++;
> >  	}
> 
> Not that I'm against the changes, but they (in accordance with the commit
> message) are irrelevant to this fix. I prefer fixes to be more focused on
> the real issues.

Jonathan, let me know if you'd prefer I split this patch...

-- 
Kees Cook
