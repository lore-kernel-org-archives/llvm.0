Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F14158DCB
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712706403; cv=none; b=q+NVJvtf3lizQgmw7jdPV5Soa0I7ULf8jjNJKHKCkg50OS43pz95QBolPu6XMHZw8k3LkSFbn4vJRVx4mKy48qrPw/i99mrKdRJlWRb1shru6D7/lHJ6b4vDvNKvQ1GtWmX1rKHcfPlasOSVYoji6zupYRPZHaa72qnily11NWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712706403; c=relaxed/simple;
	bh=jNSBzWXhZJZfc+eIqIw5Gr2uSmaIhh7uL5umKj2kPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQDBC1IS4NUG51XMQf9e39agMGQ2qFmjvZHwbIjeiZuiKMR7Y/hZQuAsH7jezma4oWbFOmCWC5EagC7pFM4vxD4dS6VW7YHaivN68pvMxCqhbc3lndvWNwNUB/qZWQ7YXbsrUqtmv6C2NOsPxfSUTcfV7/DCV+5/luxXbJDxBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BFnh+HxD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BFnh+HxD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e424bd30fbso19466135ad.0
        for <llvm@lists.linux.dev>; Tue, 09 Apr 2024 16:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712706401; x=1713311201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAaMW4DkptdB8vkfU6X0XRhtKwrtwp59dGPucd4k3xk=;
        b=BFnh+HxDv5fArWveoMU9FLWGuv8YQHgMvhZ5ve60og0/XAZRPqNIy1VFK6FCfpE7Rd
         0dXfhD5FATqxET50jtRxc2h5Rw/dlR/R5uuA64yzHK+99Sq8o2CxfS23UkhUv8N3Qs5n
         dx8eC+YYLUe7/ucEbhKhKnjHLYG1fwd6jPo8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712706401; x=1713311201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAaMW4DkptdB8vkfU6X0XRhtKwrtwp59dGPucd4k3xk=;
        b=BLaQs3uYBOMIidvjtfsSh5E2z2kRyo5bOZEVAY/4lFpeRqdZmJaNDsv9+zc/dchEif
         mW+WP0QZm806Ph/0uVlKIPqtHoV7hwWOerQbYw0temIm54eSojTHyU8ifNDtGH/m3sSL
         0BfCwFMxWn72Kcok9pFSADXx+PX+KVV5HbNp9dNPOku50GlOTgIX3i+KBzEqe3xehKn2
         qlT1xPUvInTp/sx9GAuokwc0PYGNWmbrbBO+EMJj3X0r2nBtBWOHfqgj+EGeP7RvD40t
         +4nviqJFJ7j8tSSyKwN0Q8e48dfMjOskpCoiqFwyDzegTCNuGeC+YMOn+0HgeypwC8tN
         wNsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvqkTeH2lgzcgYWsCw20XCKhIZjzKhQK5l0CZyHvI7V9NuBRZiqhcemVqOj4gO4ehTU/0TwepKPAC3nPmEWITO3JDMoA==
X-Gm-Message-State: AOJu0YyVvdZCe60Fr/ZUSG+jDe8os0VYWNunCJ8cmEKJEgE+Nrl8obhn
	Q289CzV1OGtorlkcUpPNDG0cNvGBHEjHJMUIT6J1SUQCGw4V1t0FpymPPo/uWw==
X-Google-Smtp-Source: AGHT+IGINmKk+cI6DD2WQ7SjjT99R0HHKYxf0CC6JwcygaTUpcCJ8LVus266jgna/DTBfAx9a5m9Ow==
X-Received: by 2002:a17:902:eb8f:b0:1e3:cf18:7344 with SMTP id q15-20020a170902eb8f00b001e3cf187344mr1829767plg.11.1712706401500;
        Tue, 09 Apr 2024 16:46:41 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902eb4d00b001e2086fddecsm9497419pli.139.2024.04.09.16.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 16:46:41 -0700 (PDT)
Date: Tue, 9 Apr 2024 16:46:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: kselftest_harness: Print empty string, not
 empty fmt on PASS/FAIL
Message-ID: <202404091644.9CFF82A@keescook>
References: <20240409224256.1581292-1-seanjc@google.com>
 <20240409160920.3bfe3eeb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409160920.3bfe3eeb@kernel.org>

On Tue, Apr 09, 2024 at 04:09:20PM -0700, Jakub Kicinski wrote:
> On Tue,  9 Apr 2024 15:42:56 -0700 Sean Christopherson wrote:
> > -	ksft_test_result_code(t->exit_code, test_name,
> > -			      diagnostic ? "%s" : "", diagnostic);
> > +	ksft_test_result_code(t->exit_code, test_name, "%s", diagnostic);
> 
> Have you tested that to make sure it doesn't change the output?
> 
> .. warning: ^^ leading question ;)

Probably should be just this, without changing the NULL init?

	ksft_test_result_code(t->exit_code, test_name, "%s",
			      diagnostic ?: "");

-- 
Kees Cook
