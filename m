Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08907145B15
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715569696; cv=none; b=o7y/UQbysEuSRoz8MGsXTZD4OSttneATTsA9xvC1dVisL4w/lz3cjniplQSYJIYIsPFJm3UHCcwESkdhxyzoR45aoI6RA36RHDSNjKeKzyzIOQJU/e+1id/ohHS1SbWqX/T+yMrPwnX3lZGYeU24XK7DQ/kWrFBPU5E9DkeRYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715569696; c=relaxed/simple;
	bh=9b9dap/mBsOztov9foEw6JPg7L/Za777S45jFaNqDDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TClE8DE4wAHPXzN2SVeRttDOji/F6oAfmWsacqwoPv4QLdDjJnTGpOKAMn4/rWTNSapQmxuLAvt4ULKdpLrjn2fNNZyRe18KlVTwqfcO+nL5rHo8R+degNtqgjTHf83YFxRB2w8kPl6mMoY74Sf8n2vD8J7GwfgQZpZIq0MwHs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TaqSkL2e; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TaqSkL2e"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b27369b0e3so2020117eaf.1
        for <llvm@lists.linux.dev>; Sun, 12 May 2024 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715569694; x=1716174494; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4w1jo49aw27+rvRKGShr7/YYMsETCIgWlNJTN+A7s4=;
        b=TaqSkL2eN3q8nBVdN5j9Uz2gda+VmMkhDsMvq9XAhhnbGJJeeyNdwxaYmRMDAUzm2d
         U/+piXIwkPUhOj1FWXJGl38hhLDE/s+Hn1v5iLOC4+6FoVVlciyjFzeOJrPCOdcmZpi2
         KAFcDsfbrjNTmCDfo6fLiT0elsrqifDpv8rmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715569694; x=1716174494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4w1jo49aw27+rvRKGShr7/YYMsETCIgWlNJTN+A7s4=;
        b=Kcspfn0fipVbB0OmzlgJfS9UBnnRrDuR7B6xj6fmHXaS4ZCnEfAQDMJWG+mH+izV9+
         diHZ3jj1slSKqQv+qfBuzh7bMYCSfUwsKbvYIAmKFwq1aAuBJ7RVKWRk25zC6XLNsX7a
         4hO50Ge2edUXnXEhcFdMqmCV4/YTh5m69g6tYIm3fAFEmpqnzrxQVsVkOLAbNsbbUHK+
         fknBvc+PYPSP+E5CPdu27yXsJg4gTUh8ateIesnjV9QIxiXNHJPFCY6p3r5rVBAif7Q+
         QGDuzeZhxHXZTgiF3Rj/fWpBHNtT1HRMT5dMWvJ8geYDE1vMYz6FW4JkklE0b0KN+DTT
         uQcw==
X-Forwarded-Encrypted: i=1; AJvYcCW7W4n6pyuUyLJO65QH9qI14JsV1/Xs56d7lA44FLuHT2jwvY2A16AAwEdLNGJrVtTJv2gRu8zE1VPpYuQsw/PPpMKF0A==
X-Gm-Message-State: AOJu0YynRXt2aQLwC/gIooOgFOiAULg+oFaVhyecHE2V/r0GgwIBzUdL
	XL2H4EOISNxbXYuzqNf4lscd3uIcoCDP4A2/1x2eJLe3bV67zN3MFmrOJ2FQQw==
X-Google-Smtp-Source: AGHT+IHemrUQTb2bVSGfwn2RlROCPRFiGs0Fe9XL2NMMyj8IULH+Ezp+5PKYw2emvI1F7voWXC5PIg==
X-Received: by 2002:a05:6358:1209:b0:18f:6026:2d6a with SMTP id e5c5f4694b2df-193bcfde4abmr844964555d.21.1715569693849;
        Sun, 12 May 2024 20:08:13 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634119041b2sm5776476a12.94.2024.05.12.20.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 20:08:13 -0700 (PDT)
Date: Sun, 12 May 2024 20:08:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Bluetooth: hci_core: Prefer struct_size over open coded
 arithmetic
Message-ID: <202405122008.8A333C2@keescook>
References: <AS8PR02MB7237ECD397BDB7F529ADC7468BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237ECD397BDB7F529ADC7468BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sun, May 12, 2024 at 04:17:06PM +0200, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> As the "dl" variable is a pointer to "struct hci_dev_list_req" and this
> structure ends in a flexible array:
> 
> struct hci_dev_list_req {
> 	[...]
> 	struct hci_dev_req dev_req[];	/* hci_dev_req structures */
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the calculation "size + count * size" in
> the kzalloc() and copy_to_user() functions.
> 
> At the same time, prepare for the coming implementation by GCC and Clang
> of the __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions).
> 
> In this case, it is important to note that the logic needs a little
> refactoring to ensure that the "dev_num" member is initialized before
> the first access to the flex array. Specifically, add the assignment
> before the list_for_each_entry() loop.
> 
> Also remove the "size" variable as it is no longer needed and refactor
> the list_for_each_entry() loop to use dr[n] instead of (dr + n).
> 
> This way, the code is more readable, idiomatic and safer.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Looks right to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
