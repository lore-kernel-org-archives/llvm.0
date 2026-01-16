Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53FD3587AB
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557207; cv=none; b=W8G+Ci7EWODmup4MqpUNqzGg7wTq3m+D1EEv99XY7tXk39G5eQdizfIl2SSrk+bD4wKcElNLELQkAVEiWl+P6tnVZTxoOIL3nAq7Zcmq/EVp5YW05yispLvooEtx5lyTYZLhxlWlGAsuTtk3iVhAtrD48f9VN3zKNoqyEM/j+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557207; c=relaxed/simple;
	bh=UTgpQh0ZLgnzkFSvhFTTbcTXvNmo/rsBWjbi2EKkncY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVCxROuQ6Vb1an9a41aUE6bZw/zA813FChzPBRPRh3LGVtkxHLb8J7C7+AQlGWCwOpLQRMO17vQnxoPsgq8JcV6iYSBy0VHjBmfOGe401ZXQS2daA3sYQqckbfCnMY+c8C/KfEu4OQ+9zNTxZyG6Svpbo8o+M6Z2RejaFXNWmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6pj8Jg0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6pj8Jg0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so12855925e9.3
        for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768557204; x=1769162004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc9Ty9XgpUdwxFhTnyIgiWP6bdhC4HIf+rr8u+NJ+Go=;
        b=G6pj8Jg08GDP7hZzpfAO4/9g3d4y8r/AbRbNnG7lZm+O3sHAfCNMTjFL8iL+sNMvbl
         iQz0Y9nAo6tlbmGEc8/+A5j4hq42PYyY5UE3WSEKocG1r6FAm2r0zJvfp7kMbLELOASf
         0NVw3pcWbzwc9bK9VVpSEZLRxssH0H6bd0JFk7dz+GBI3kweq22sivBisLfZ+rNM+0lg
         nXuNebISaKsqVvojxqc1y7KX2UkN7xsr408ptb6I6/AY6jUw1bmxkWaBeP0hxUDUk75X
         fiejzFwUgfxs2tyjfvzk4FYe6QvkX9GyAFbg6AD99K5v2zBKAkTKJJho1+UgYSeQsJQt
         NBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557204; x=1769162004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kc9Ty9XgpUdwxFhTnyIgiWP6bdhC4HIf+rr8u+NJ+Go=;
        b=ky32r9kKLdBydzehdAYZbXKPDeIfdgkJZXI9pZCftqVnflIt7w7E0BCpDZIodJx+dB
         70m6TRNlT2/eFEyk9dGj1EmMzL9P19RjOYDkKe0XgHWJ6dsDI6ef8qgFZcUcBcZecEpx
         N6hu14duDmzPFC1l9spuTrkU5OTIGTyQr1B7dosIZtbwD9VI7CJSPF7GwzXrimJcjEXo
         HS1B7IbSc83dfSGu+hB2AoPZ9820fl1HlAarghxG+3Y5y6Urp/vRGW5/XWZAPebgXJmx
         QegHwXMpQsMp/tARZCB7EUNcwi66dct9KysQ0FOx48e9/x0jUeRmm/JPYXKHXAF4jgUr
         bVpA==
X-Forwarded-Encrypted: i=1; AJvYcCWDGpgTLULx3vl8NHviq6xj3NenClbg2wHlYj9oPsCBj5mRB+pmmJa+2C1dKNjeWIru1xnV@lists.linux.dev
X-Gm-Message-State: AOJu0YziiuYvmlEpct/w3wfK/vXI7o40c9GBF2ZukqzgYIX0uMdO2/mO
	YxYUP5HE2+ASCVlvl8Lv5sijaGTP4zQFEphqV84kIY18FHCQRWChnBv+
X-Gm-Gg: AY/fxX6J9M91piM0xn+DVi650tpsdw/0g/6FctMUAbB0gIDvsDtYXefygdyVcKeliQQ
	MkCWqz0bIfOGp/TQltOqw91+aiFumlSh5vVqLcPHEGzI3tSF/8jI1rqvdjtYaZA7EG2NE4HbiQx
	bBIDFkocjaaCoVLuZep+/OE3/58Z/tU993M56EDG5z+yVo8jpxM4i1l+2Bf6EBHBj7nGH2xDc1l
	qdcE7FooXxXydQZ0V0sH3bjyzKTtLNDWwvkCrFxAHmJfzh+rEPd0wAHRNrUwYX33Tp4us9PUZp4
	8sS16bx0+Ak+LGc2LxwLH7kLzxUyTgM+y7ILqcwKw1wVoPMLicEzU2yrXUYvhRE6DsorRjkn7AM
	TUpkw8xs4uOPgPN5kNygOrC5zC5SZcBrI29b1QD29gayGh5xt2/WX9e8e0cyMqmpZdmQnqLvokW
	L3vj2IHDdtaeWHM4A3BtV0oXQm7/YJunImRa0Lic8v7kT9jm0Iotfk
X-Received: by 2002:a05:600c:8b64:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-4801eac0f22mr21648235e9.14.1768557203887;
        Fri, 16 Jan 2026 01:53:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428ac749sm90683575e9.5.2026.01.16.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:53:23 -0800 (PST)
Date: Fri, 16 Jan 2026 09:53:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu
 <jeffxu@chromium.org>, "Michal =?UTF-8?B?S291dG7DvQ==?="
 <mkoutny@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, "Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?=" <thomas.weissschuh@linutronix.de>, John
 Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, Masahiro
 Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, Nicolas Schier
 <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Naman Jain <namjain@linux.microsoft.com>, Simon
 Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
Message-ID: <20260116095318.46a149fb@pumpkin>
In-Reply-To: <20260116005838.2419118-1-morbo@google.com>
References: <20260114193716.1740684-1-morbo@google.com>
	<20260116005838.2419118-1-morbo@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 00:57:57 +0000
Bill Wendling <morbo@google.com> wrote:

> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members.
> 
> struct foo {
> 	int a, b, c;
> 	char *buffer __counted_by_ptr(bytes);
> 	short nr_bars;
> 	struct bar *bars __counted_by_ptr(nr_bars);
> 	size_t bytes;
> };
> 
> Because "counted_by" can only be applied to pointer members in very
> recent compiler versions, its application ends up needing to be distinct
> from flexibe array "counted_by" annotations, hence a separate macro.
...
> diff --git a/Makefile b/Makefile
> index 9d38125263fb..6b029f694bc2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -952,6 +952,12 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>  
> +ifdef CONFIG_CC_IS_CLANG
> +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +KBUILD_CFLAGS	+= -fexperimental-late-parse-attributes
> +endif
> +endif

Will that still be needed for clang 22?
Looks a bit like a temporary flag to avoid regressions.
Probably ought to at least have a comment that it won't be needed
by some future clang version so that it gets tidied up.

	David
