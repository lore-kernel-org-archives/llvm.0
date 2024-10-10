Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64247A60
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728556833; cv=none; b=EZtQwrhoR4XzglrYf0w59kkPo5k0+YUMOxmiM4hxYnWSMVtY8nE11fiCtD5NrCtaezIrszFm+Ad66XHUqZZkBxyC5mElD9v5XMUzjf+2bfiZ1AjieKaZ/jQfDcuGa9xbatmbzIafL0/sQFFmJ9yKB5SfbtGOrFnFZ/fC68xgm8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728556833; c=relaxed/simple;
	bh=6IZ/lCHicleSJFqXu6KLb1FlJSmDUPAbcpMj5ss5U8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY8yyCXpn9CsAnuRLT1bgtOqsTiRP6O+Y2uhDtU8Pvz3IpYIRlUItUSI4OTnWsbkkcbXuJQ+h/H7jTxKIcdHJYrzWQcFfN862wZ9abtBEMm6Rcbq62FZkfQsfY6CD6IAq9zZwN6voNDYey5f/wrwaWtTp8LtH2VbfVVA5kpM0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DluyClL1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DluyClL1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d49a7207cso326974f8f.0
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728556830; x=1729161630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EBHWiktfVYlgbYifeV/Ct3rZTbpPbZ7HKtEDGENAOyk=;
        b=DluyClL1h6pbnf/b8cSN7GP2o3Oc9wNnPGPFEkdO2vbBvp+sYi5zH+Jz6UwXSN+scW
         ciMkqAmn+3dA8AbKMjZLs60F8MvorAtvEx3wyDR0ZtzA3fbnOYhe9EvVKPucE5Ly9GTg
         /OhoNL6yeRx8MMvfrYKAfIk3u9yLPkb+Z7F3pMmGArHHiCimyghxuj8xEvrBFi0apNfE
         gyG5qJ0IHdZUHE6X+wkK1X97DYHLAxi8ZdFypnGVCeTK+kSs/nRK77UGluvCIgEbG8LY
         ZQu5+mkrVpbBzriuS1DJrSOcCwYq0Mxl2/A2irPhY+wFsxf42WREkFmOsh9BXVpX+hcs
         Od1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728556830; x=1729161630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBHWiktfVYlgbYifeV/Ct3rZTbpPbZ7HKtEDGENAOyk=;
        b=j/7OjtC3S0OAQv0Cc4axUuC+96OohEXngFOnq3oJV1AnSQy4fLIojjHI4PVUjAgGVx
         T7+A+Pk7/sl4uW+mWXAnonUXZK5K981c6RtD9qnsQoX/1gjRD4lZ85ilInDsIzL9akp3
         QW3rGKiRQ2i/c2lI75VU/Y3LZaLIOyUDs/trmo7bm7eJC7KWWeL1pnLVhWLFTAbFJz7C
         xi24XnrNmbc9I98TwwOIxrlR2w5RoqTkUgfmJRludl0h3NWT1uEodjqVxhxGjrFQcaoC
         uzP215Sdm3khOCApiP1Wo1rALE1XdSWfIgRcQVou1QTbQ6KPEC+V1tTI8rmdV26XOrPZ
         hzvg==
X-Forwarded-Encrypted: i=1; AJvYcCUjl4w/TPY5FW8LnGCG1P/hjRz5B2S6W2rkCgalZQJK0CnhRT1Ha5zf8yx1b2yV82LbEHXd@lists.linux.dev
X-Gm-Message-State: AOJu0YyjS4k5+nJGDP5t6cYNo6ZfXmVo97R0VVbRMcZQDPMHIMZFWiMk
	0pq2Yog4esK+P8xuFUzZNRFSaI9SCQpSQ19QGF2Z5IibaK2k6VDEko8/a2Bmu33FmiIHj6/dfSY
	x7fTu
X-Google-Smtp-Source: AGHT+IFO5jDd08ddK1X0YjR9dIy7JGWXcVcRqZfK2+MjUcvEOY5tKA5RJvpLtMudOT6lSTGNeMHZZQ==
X-Received: by 2002:adf:ecca:0:b0:37d:4a68:61a1 with SMTP id ffacd0b85a97d-37d4a68621cmr1116060f8f.56.1728556829836;
        Thu, 10 Oct 2024 03:40:29 -0700 (PDT)
Received: from localhost (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8269sm1183712f8f.1.2024.10.10.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:40:29 -0700 (PDT)
Date: Thu, 10 Oct 2024 10:40:25 +0000
From: Aleksei Vetrov <vvvvvv@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, vbabka@suse.cz, willy@infradead.org,
	hannes@cmpxchg.org, anna-maria@linutronix.de, tglx@linutronix.de,
	arnd@arndb.de, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/vmstat: Fix -Wenum-enum-conversion warning in vmstat.h
Message-ID: <ZwevGZHiXOBqoslA@google.com>
References: <20240621111604.25330-1-shivamurthy.shastri@linutronix.de>
 <ZwRA9SOcOjjLJcpi@google.com>
 <20241008005136.GA241099@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008005136.GA241099@thelio-3990X>

Hi Nathan,

On Mon, Oct 07, 2024 at 05:51:36PM -0700, Nathan Chancellor wrote:
> For what it's worth, I never really saw Matthew's comment around what
> value does this warning provide addressed. I was the one who originally
> moved it into W=1 at the request of Arnd because he felt that instances
> of this warning could be bugs and they should be audited.  However, I
> have not seen many instances of this warning pop up in new code through
> 0day build reports and the ones that I have seen seem to be intentional,
> as they are using enums like integral values, such as here. If that is
> just going to result in a bunch of patches like this adding unnecessary
> casts, I think it would just be better to consider disabling this
> warning altogether or at the very least, moving it to W=2 (which is for
> warnings that are noisy but might contain bugs), since more people are
> using W=1 as their normal build configuration nowadays.

If time has proven that this warning has never found an unintended enum
conversion, then it is worth to disable it for everyone. As you said in
the original thread ([PATCH] kbuild: Disable two Clang specific
enumeration warnings), W=2 is not run by any CI, so I would prefer to
disable it completely.

Alternatives considered:

* Enable -Wenum-enum-conversion only for 0day build reports through
  KCFLAGS. It will eliminate noise for regular users while keeping
  developers informed about new instances of this warning.
* -Wno-error=enum-enum-conversion to keep warning but don't block
  compilation for CONFIG_WERROR users.

Arnd Bergmann, what do you think? Have you found it useful after all?
