Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4912D9ECD
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204615; cv=none; b=ZsgYiYHnWO7gSLAykUlYhqbzupPy9YjbWBSJyX3++UNBsanW72kpDx4BRYkIFtnK7GmX2JMwtwgihBnwYqQe1QSl7moqcpaKtFY3mg7pb8VVlD0hC/NCAVhVAxTqWLU/HJLGsiJ6EOW/owg992seZmwUTUgatf0f/9LFZBiczfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204615; c=relaxed/simple;
	bh=+9CZK+gYzdke0WanUIsRXs+ijCNvWG8v6vSqD5cwkZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZAV/w1WZSAKMD4aCjQHG/4ojT6bl9A1KfYwVKS9L5CXqztf9LpfjAfDWhYoti5LRKbOPr4J5OjlBj2VFZ5jPbmrq4EzLtERSh1GKhk0em76+jxIYG9x1DzbsVe6SqiDGUkYYY+/NDRapjmNJyOqnW7Uwo9i8Tdl7p355vzIq4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXwZdwJP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXwZdwJP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so16632445e9.3
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775204613; x=1775809413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnwWJRlzvo+TcqTX7rjkQ/PhcRI0dDJhSQ3DGzMwyDA=;
        b=WXwZdwJPZf24BstYrE8qFKcu/uG0N+I5+ciKqq1Z1nvEiGh61SVrwN9YqVkPGXbzbh
         k8mbHu/mPE8ZDhi/rXWi3u1oTk6acXmKw623zheg+oCTd/KKyU3LdpkpU7atlkSwYuSc
         2nt0Vo3ava7btJ7DVJq33fIRb70CQQHSBhF0t7EJeiXaSKsGIgZ071lp4yEq9DBSOr2Q
         Cei9PqVkisttMusUO24uTkYgbrBbK6Xa5s03O0P6MQT0n/1ZrfBuPX8oOJs+VeTaQV/w
         vlrBmjCN9KlFwjw1gSn4u9ZCoU7yAFVNuQWWEDmeOo4nS7TRc6G7HrC5QLDNyrhKNXzf
         6oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204613; x=1775809413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnwWJRlzvo+TcqTX7rjkQ/PhcRI0dDJhSQ3DGzMwyDA=;
        b=eXqODRg8vmQ0HLrNulN1d3XDno03F+TMz7JVGK41oSWKxswOPS+2Ts7HPNa0NMw7iZ
         alQLOzBIDLQ33cPeOPYcw+D+NBw5VIHX6aZ0xrmGeB72cuiNdoOg5Q3Tz1aTebPIfqk0
         YjYnsxTHJwXHH7FYXsG0ooq0YQ1X1n+QDO4B2q9n+Mi/JcSwtvpFPfOFU4QQxw2NE70o
         4ggeCRaA+R0XgX2u1goizVnZkF6T3L/I+qWYfhs/GKZVtnaQ1LUAzBwq8KqytZB8HfZ/
         bP4Xt8A96zTmcm7zfT63xwKj8fsf6ofm05bU3jpLCWIpHQn95mSXIVDDdCv8J4swKSmG
         Z0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCPhUTWsxV9CWSNHJTNUHj68psyzQsH6ZVuatfxavJ4aoYXMq4MATaodZ+3fCasZuvHev6@lists.linux.dev
X-Gm-Message-State: AOJu0YxDhlS3JNozKUFwnjdL1M10bL43EWPSFUpBI4+ffIh3GNRaYGLS
	iqZgKPJEOdhnlR06gz7YkzFbIgBxM5n4soh77OLpbE66nGBs+YR6WfAO
X-Gm-Gg: ATEYQzx+Z/MDudvBbZhNeW6KaqaA9jVngl8/YkOwKDPH86tCEF+98S2EOyT4NIVbP9o
	b89iw0DxdSVNLpWmsEnjh+Fh+3nejufQrYrQouvnZkPgsMeqTQQ4+Tj5ZLqspKYC1Y5bJU9ytnY
	jBKN5LZbwO+dlKvOUMpWERYuswKL4+Bav/tWLQQH6xvXwySPGV/fqS9gU/z6ExeTJxbE1Rh4Mwa
	XY0n5zuLU8cyMwtlv80yHGzFx52/UdvVlJkPHlxq/fHG+KaLk8Dx6HJZH6pwhAWj+h+69549J1H
	x4IKlJWsjkYLQfKpE3QSy1EZ+j7z5obRiVhHasjTmyXDBTn9LEtLWvPoHwTZH6iCColm+iGYZXa
	HJ664Q2QpQehnuoTk1Za6UgTP1MIo8Sq9dn+g9ntDOUpVmD/+ms6EV4/1cdrPE4hO3srh3fQIMZ
	toOBV9UHRFgyM8Jmp+vg9pJ4iy60bjfMGj0oxudHia6B0qqEcmE8Gt1roe3qrl
X-Received: by 2002:a05:600c:1d1d:b0:488:7ebd:78 with SMTP id 5b1f17b1804b1-4889977cbb7mr32423555e9.14.1775204612546;
        Fri, 03 Apr 2026 01:23:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm327110915e9.3.2026.04.03.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:23:32 -0700 (PDT)
Date: Fri, 3 Apr 2026 09:23:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next 2/3] fortify: Optimise strnlen()
Message-ID: <20260403092330.0382a39e@pumpkin>
In-Reply-To: <202604010835.IWCsUV7z-lkp@intel.com>
References: <20260330132003.3379-3-david.laight.linux@gmail.com>
	<202604010835.IWCsUV7z-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Apr 2026 08:15:22 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260327]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/fortify-replace-__compiletime_lessthan-with-statically_true/20260331-041123
> base:   next-20260327
> patch link:    https://lore.kernel.org/r/20260330132003.3379-3-david.laight.linux%40gmail.com
> patch subject: [PATCH next 2/3] fortify: Optimise strnlen()
> config: x86_64-buildonly-randconfig-001-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010835.IWCsUV7z-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010835.IWCsUV7z-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604010835.IWCsUV7z-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __fortify_undefined  
>    >>> referenced by fortify-string.h:290 (include/linux/fortify-string.h:290)
>    >>>               vmlinux.o:(parse_early_param)
>    >>> referenced by fortify-string.h:218 (include/linux/fortify-string.h:218)
>    >>>               vmlinux.o:(parse_early_param)
>    >>> referenced by fortify-string.h:290 (include/linux/fortify-string.h:290)
>    >>>               vmlinux.o:(setup_boot_config)
>    >>> referenced 2103 more times  
> 

I'm not sure how this can happen.
The references are all behind a __builtin_constant_p() check.
I haven't tested the actual config, but allmodconfig compiled for me
with clang 18.

	David
