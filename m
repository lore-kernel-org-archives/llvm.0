Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C46A14036E
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715981061; cv=none; b=SuyOd2PHTBJ7kx3L6gv6oFqkMTXQONntwdU4zXiyckrPuq596z/rivc8du6XNCpmIENqm+Zyx5SXjtsr5uCoXsGpp/eJ/TDX9oP+Ae7iFCS2rDIDSV95mKVf82dAmFEZ+EgDGIEYYzkzUO3taMSfs6OGaN7paSWW1+P5RgsPfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715981061; c=relaxed/simple;
	bh=IfJYkc42KzwKWgTt9YCXYbwQ78/cdkAW+9n0nYrQkT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+tFycqZlaD5ClhBeDdoOKrl2Pq3MFNBT7yV1XRaZ1nrKw3vZcjVkwFCo63oiYv2LNIIBNz8mkJ+GQoSC6MSwxyL9SUoaUWHDuMcAAqVJZv2Nn6PbdHgqo/DkvyAzylIz5t/kYADOSShoj9P3/7mnsT2YKwStQYZAncG0oj8QXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X/Oz4J+o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X/Oz4J+o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ec486198b6so20546445ad.1
        for <llvm@lists.linux.dev>; Fri, 17 May 2024 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715981059; x=1716585859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZePBSOIoDFc3SJ8gpxBa7DmK4+hYpUiZT8OtqItIpw=;
        b=X/Oz4J+oix0GOAN/cgMuF+8/AcPor7Uul+w5d/ACm0E+DWF/4OPgV/mJGtu+UMRDx4
         6r84dlHAHmIeWuVZ8LJPwxAKyI8YE2IbANY1ixFoyBPaxV/1WQwxgvny1Sya3cww5h+v
         1/1v080pLho8MgBEoRcXJGIO6CdEV5B0b1Uv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715981059; x=1716585859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZePBSOIoDFc3SJ8gpxBa7DmK4+hYpUiZT8OtqItIpw=;
        b=clQqiuBE5T39fE47kP/M2ko/YxLMTnfEel5F/gmZSB26bAvTm0euxMuI1zLBVMLeO6
         2wAUo2BBD3Ya9jVUV61l7vL2LYpmrpwsH7GtHiZv8oyYrTN/iCIgvXN+j5ndj7B4vC+N
         90A6zN+hF98LmlhB/OHJlw8zfXH4vb7UL6gpwhcmGj3FZO261dD45v1vv2+4KdMnbNKk
         EzfbTL5+tRSdMFm5oRLXJuEkss9DrroOm5alva47z81zrwtjanBiuFbgXbr3X9Vlb6nP
         oAsjpuNbvufDa/HNM76VP+ghk4NsIumGv5+wh0c9YrmYkoOP5P5qXZQ6ZLrRyTlQQ4lS
         ywdA==
X-Forwarded-Encrypted: i=1; AJvYcCWYjKzkXfc1+GYSiLbsUBZCN07UNABVlV9Qcf5eAJZPgvJ663iOfjhmGOOo24TeQsrt+6nIfFXC/2HAl6ZektNh2ulGVg==
X-Gm-Message-State: AOJu0YyxP8ui2fcTXDRRWhHttyLf6tFhkT0iF1ZfwUx+oRZfUH1nIlX9
	Skj4ceu4EECKgdDxAW5OadwnPfQ5hPytHqJnpxgOf7qLsCm9aiCBsFbwA5f1Ig==
X-Google-Smtp-Source: AGHT+IGp7tPMh78BJ0Avg5PsASLZPSKcpqsBME5h6vFDRUhs+O+wV26Hx+4VAxiIkqft96DMjEQODQ==
X-Received: by 2002:a05:6a00:9290:b0:6f3:e6e0:d9f3 with SMTP id d2e1a72fcca58-6f4e0385654mr24139207b3a.31.1715981059389;
        Fri, 17 May 2024 14:24:19 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a817cbsm15080510b3a.58.2024.05.17.14.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 14:24:18 -0700 (PDT)
Date: Fri, 17 May 2024 14:24:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>,
	Justin Stitt <justinstitt@google.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] fs: fix unintentional arithmetic wraparound in offset
 calculation
Message-ID: <202405171417.B290C50A@keescook>
References: <20240517-b4-sio-read_write-v3-1-f180df0a19e6@google.com>
 <ZkavMgtP2IQFGCoQ@casper.infradead.org>
 <20240517012647.GN2118490@ZenIV>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517012647.GN2118490@ZenIV>

On Fri, May 17, 2024 at 02:26:47AM +0100, Al Viro wrote:
> On Fri, May 17, 2024 at 02:13:22AM +0100, Matthew Wilcox wrote:
> > On Fri, May 17, 2024 at 12:29:06AM +0000, Justin Stitt wrote:
> > > When running syzkaller with the newly reintroduced signed integer
> > > overflow sanitizer we encounter this report:
> > 
> > why do you keep saying it's unintentional?  it's clearly intended.
> 
> Because they are short on actual bugs to be found by their tooling
> and attempt to inflate the sound/noise rate; therefore, every time

"short on bugs"? We're trying to drive it to zero. I would *love* to be
short on bugs. See my reply[1] to Ted.

> when overflow _IS_ handled correctly, it must have been an accident -
> we couldn't have possibly done the analysis correctly.  And if somebody
> insists that they _are_ capable of basic math, they must be dishonest.
> So... "unintentional" it's going to be.

As Justin said, this is a poor choice in wording. In other cases I've
tried to describe this as making changes so that intent is unambiguous
(to both a human and a compiler).

> <southpark> Math is hard, mmkay?  </southpark>
> 
> Al, more than slightly annoyed by that aspect of the entire thing...

I'm sorry about that. None of this is a commentary on code correctness;
we're just trying to refactor things so that the compiler can help us
catch the _unintended_ overflows. This one is _intended_, so here we are
to find a palatable way to leave the behavior unchanged while gaining
compiler coverage.

-Kees

[1] https://lore.kernel.org/linux-hardening/202405171329.019F2F566C@keescook/

-- 
Kees Cook
