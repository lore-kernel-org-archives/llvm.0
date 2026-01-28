Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D46349B16
	for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592822; cv=none; b=jPdLQiFeZBL87do6Xzt08MoPVJ7KlukT6EGSBE05dPXUHmZwUm6Drbu2iBLUTWBqVjQdhCAGSJ8xIFB5KSn8ImTKBwgWw4ZLFiJpIc3zQK0QW3kUnkVc86Ir6tIVhMuSzXqSFOh7cv/xvKMGttzieqDbvVYq0CmxneD6J+DQtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592822; c=relaxed/simple;
	bh=uOsFKecVdgOaM2dYn07D10IoSxwRfxK7jQysDzSCj9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7cQQAl9J7A5iQR2U+Q1mX7Rllfc2RPApp2RchArec1ZtUIVN2/JNZgp5z5Pg9HCNZ0b6n5OQ9VBzJoFT5M9quJYIwENj6NIoszrOGsVYqI2k7GwzUig9Ol842+n6JyXJWip6WInAhxGDU2wQLHUESxxksmktpr7TD8LSm1e724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eRqda9am; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eRqda9am"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso5676345e9.0
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769592819; x=1770197619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZEd4Ae0SjVXdfXDHLByruVc+qFACePuPH2DSSILnOY=;
        b=eRqda9amP8pKWKw6RfoNxUKkTGZuXUa0sY8pATjoKvBlmO8B/QVZpHIiUqxbvsrIx9
         2hV38iKu/0yEjDT+dO5HaOxx7ICAPV4V8hEqqqfGDRjZ7w3jFkotbtM4aOs0c/3Ijqyq
         5hgnnJRh+X/1jOQKzfzXH59eBBXb8IORAjS5yv4R17Ibus4wb0Rzj2o2RxKFBz6wbjDM
         7r/YMZsMDsuZtZZy3kpw64F0/oD45EJNhqmgw1Qzyx5IDJssBuPHRTh16+dW7DZTYhnf
         2ADV0I2cOLELR5DPCblmx/YUj10BkQynfG2/OC63X4zdxqymtTBEVXzPah3aydVDxKLF
         ZMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592819; x=1770197619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZEd4Ae0SjVXdfXDHLByruVc+qFACePuPH2DSSILnOY=;
        b=EYALjAAscpfi9dyy0V0KM+/Lu1wYur04T4GL1BCjtD8z1+iGOBwIvECSmlxR4jSqf4
         Fs1utMYCW7fPRhsPqfGztqwPsQkzf8V7ZUUGUih4PNeBl9/rfeiCQfDwDtXEzl+KnVrt
         8HtI69tHcL5UZbrfmKiWYLTYafvu2g1GRRPMVqK+5ylB4ZEakTqC13gCHrXEjA0iMmQz
         qarvvAYGMON1fKXC2DPfJxgLGMZO4Zjf9o8hUEsC2q0sYHA80TyqUFDq/XdrqMuIKGPD
         fOzy32KPHQqgSvFht7cPwG4dMvBllrJRZhFRMwAnjOm31uPfH4NYWuCPovt850ReiZEs
         ApjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93tOv3ikb+ozcghM91yRa4ENG1yIsQQHBbqeS9b0XekooQWPhPM5noGuv8hInZlSZBrgc@lists.linux.dev
X-Gm-Message-State: AOJu0YzzZbFCf5YtUg3vk3y334LVqUUg4DswH1BbDwGVVuENjrPx2lDN
	Zka3xLiZ3z2EUvlZNLXka67COSf2oC2UEi51hIssGFWyKbVQM4M6cSfqGN/zk3DI8CE=
X-Gm-Gg: AZuq6aKGKyvc6Qd+IVUCw8L8NrFOCqXj2rgGp7moHJUNCqfmslNeaKrE/ocMVSHZnIv
	C85d0NQtEvjWcsJi+z/BA0q4P9QqppGy0yjMAIVUa4h9wtODN4bgpfsjgNDUKJRdwda4muXW0HZ
	JqvdZX9BH6PaKULayKi2GCvPtWfNXYlksH3OjAS27tW7+mqAJuuOOGZ/7VQOkRkzGpA2DfuVMfg
	qhz+kDA7ZWuWZklHO3mvsuyCgGL0RTcmvhngqxQEIYTRKuprsnQgmTGJ1zikSgOz8rDSiokmgsP
	NzWJwoCgTgWMoXhiv3TW8j6NYk0FF5njXRDBemDBzh1VlVgwmnjXqempDcTbu7vObwxtam7GSxy
	2HX3duTS9d8yy8FtIRmHHge0AuPoFjd4A06VA6qJS2Hfu468/boyqajk6p2qrKSxA0R2eb5zd08
	NBiOOmSQjvJzPCcQ==
X-Received: by 2002:a05:600c:35cb:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-48069c7c409mr63857995e9.28.1769592818706;
        Wed, 28 Jan 2026 01:33:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm124338565e9.12.2026.01.28.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:33:38 -0800 (PST)
Date: Wed, 28 Jan 2026 10:33:35 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
Message-ID: <aXnX77aYdsyFBiU7@pathway.suse.cz>
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>

On Wed 2026-01-21 11:10:08, Tamir Duberstein wrote:
> This allows the compiler to check the arguments against the __printf()
> attribute on __test(). This produces better diagnostics when incorrect
> inputs are passed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

JFYI, the patch has been comitted into printk/linux.git,
branch for-6.20.

Best Regards,
Petr
