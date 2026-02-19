Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E602C08A2
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488071; cv=none; b=oHOEnF8nGl3B1Qaf5QHkAXtbWAxefIEyeVbPyiS/qe6ZJb6QRgFKEeDtNLiY/QfDgVUQOwvUX4eVnORNFd+/BhxOFIUD34+ICvoPnnu3HcI2CalPqsRk1bKoZ4k1xH2w7zYVBu8Co+XSu1dts+s3RcF3jtnQTj9hEI/VSczrzD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488071; c=relaxed/simple;
	bh=97dxDuo1CGiK//r6VlQ2n/mnPEoD6lcPU66zb/bJ+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1DPzjMq98R7vQIjyDYln1qtKtTx7lkR/FA6DL8qGNaljZH82Ww/T8cndP0uirCZ1/7qpydgjXTwYj2r4QhBh2B8UynYa5OGSaYz2t2ORjIkLeBfxV1+jAni+bOBJQf8CkM8l2dW/+hVhKG8JsLWk/KJ3m58r6lSBCUZXiuel8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qFjfOndU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qFjfOndU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso5185355e9.3
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 00:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771488069; x=1772092869; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uEQ27jPIjOmpNod7ihflopMRb8gsNhXOZ78DPDWRDlQ=;
        b=qFjfOndUY53kty+fJFCL+eIBquFbkOWq0XaDjsehAVay0smZbPsZQQYVaJyKvb0Dtz
         CVbbDa+9Jr0QFw1qLsZ3n0j8y+XnbryLloKzq5z8zuoyRgAa1CRIYjPbEFXTSj8ls+rN
         C+egvdZ21x/N20uShYS+6XeMumCuBtzqE67nAC6RMAOjntbVVP9wzjYJ41TbLB1QFU+R
         wC4fSbuRO7OVca8BEJxnuzcgl0EfYDAWUCy2F9nd99M5Q1he0f3q379WpDVJdvGb0l5J
         vdahNrqZIfQchPHppJcFnjQwZ8GWNTESHaxoKcjrmOZ5kLN91W4TvuQkce1W3MbF8Yma
         dd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771488069; x=1772092869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEQ27jPIjOmpNod7ihflopMRb8gsNhXOZ78DPDWRDlQ=;
        b=bVogmSx99HAI/9255NnQo4qKIH+N/AzDVHHWD5N5I1lV06OVGq8evosQDyN6lw/DwG
         4QyEyJggIkfCjIdvW9nokEG4cFhSDb70rzGkSEnw2/H29Xy2D1KiXeZ76SIs9bhYnz/S
         qlrwMtyNZXSn0lzt8pB+P7J3aKwdOjZnE9zE0ohV8XoImTTrZz2r3BFobNO+TdeflJbd
         KYBC+GIBGY9bnGEHXE7A34aZtv9Zd0zO5mleHo0Mg7X2UmeK5X0wxL3Uejfg3V7SK5Mt
         EUL8mUc1nucCK+ZHwMDl7bRLFctPvg1ZvAome32lc4Syx4RUoTPLoIT6AWVQrr5zFt62
         Ng1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD9SOacqplXiOy2uiXDZHTS2DKL8EKM8Do5AfrY4okGFUQMFc+Dm28m9nOzYPx5Nf9JR/8@lists.linux.dev
X-Gm-Message-State: AOJu0YwzElXlRSuOe3ZknsyUVXFgYo73m7ni0lvIc3oGbyYgpoxl2AR7
	wL9jD/gHxzvePiYBQoaZxJmr/ST6NE4AWZno7lwUenKEcAltt2iW56Ez9XAPLvjr96U=
X-Gm-Gg: AZuq6aKFvATLfsOrC7cHSuqqTmKVOVmiarmCQ/8W9b8i7mJx6rbVIOO2ed0JJj9w63x
	5ULk+k8T9pXwilu+4BsO4h2AMIi27bcnhpSaiOrtH7QBIfQXX39HsXU1WiqLU8xUyGlbk1eK5Lz
	EB7+mu8ubhrhUrfv5KvvYWK2VywM2Sh2OlfJ/htA0Fquq06rtcuaDI4A9fjSLaA5B3+PPQ+Yxcj
	gD1BjMn7QHI1btLOwk8lkQL85Tsn4xc3TC0LKGHI9V0p5BdfzayNn/SKLZGiTs4L0CmZMgznJ69
	tvNvuoLrq980smdq1JX76D6tRZJjbcffb3xJTKEa6P1SWjOqcHd/byarncZyW58gJHAMttstu3l
	Mxv8Gx8GCb9QWBDgPoWcZUeHTJArE5yMp0Bs9NGXZbB/R4Vg72qXDYVTK/FWL9LIjtj+fsczXjC
	fbFgSiKglJcQt6mHcwormTSs4p9WiLw1E6e/rP5IE=
X-Received: by 2002:a05:600c:1381:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-48371098c8dmr309544945e9.36.1771488068588;
        Thu, 19 Feb 2026 00:01:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm461946265e9.9.2026.02.19.00.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:01:07 -0800 (PST)
Date: Thu, 19 Feb 2026 11:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marco Elver <elver@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 1/5] slab: Introduce kmalloc_obj() and family
Message-ID: <aZbDQLeMsHCv32X8@stanley.mountain>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203233036.3212363-1-kees@kernel.org>

On Wed, Dec 03, 2025 at 03:30:31PM -0800, Kees Cook wrote:
> Introduce type-aware kmalloc-family helpers to replace the common
> idioms for single object and arrays of objects allocation:
> 
> 	ptr = kmalloc(sizeof(*ptr), gfp);
> 	ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> 	ptr = kzalloc(sizeof(*ptr), gfp);
> 	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> 	ptr = kcalloc(count, sizeof(*ptr), gfp);
> 
> These become, respectively:
> 
> 	ptr = kmalloc_obj(*ptr, gfp);

We are already getting patches that covert these to:

	ptr = kmalloc_obj(ptr, gfp);

(without the *).  This feels like the obvious bug people will introduce
with this API.  I sort of think that "ptr = kmalloc_obj(ptr, gfp);" is
more natural, so maybe we could make it work that way instead?

regards,
dan carpenter

