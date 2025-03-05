Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003211F5826
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741163778; cv=none; b=CSZojejrZxKCMGIKcNSH0Bk8kzQDUcMs8yFx0LCp+xvDYmKHw7TUcTZB1FRNpwl4Bq8gK+oQYoYmyjY85P6Nx5DhGnq19gYFPtK1JKgeprme6XGvRojvDbh8H9l7tsdNxF8Yue9ZStiAhcwJZSiIJ2ZwBXWk393yiA6HF+OCWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741163778; c=relaxed/simple;
	bh=tclfnaQ+78uJUqE4m2J8GwrNwDst3SKOWGjXQTac2LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LW+Idvi8PDfdPIq0h0a630OvO7XRtu4CsIIW2i9OndEc+odnebFOya+zkNi9XmBt+MFYWpvYvqzy8q8dlQi0Kxl5YpBhI9cHrVFT0ZDRjZ90CT91D+AdrPcWT3LnZFEdwPx0dQPJmiYNQUuSKZSjH9V8xOlD07r5+Ef06shw9Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlmyCMpE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlmyCMpE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390eb7c1024so3767522f8f.0
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741163774; x=1741768574; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfQXwUL3Ydz7mR+cjRUeO/xqWRGS7uJqxxJMkaNfgT0=;
        b=XlmyCMpEFHGlp+frRAqLzf50mllkuYd6ebJOqDNH/PM45J73fnL38dFHEtSdloefqr
         /+vbcBdz1rs7NjcwGZHsceymv29T/rohkWnDAlHAQwvl/C0awwzUwrN2psN/+BQJozPM
         n/QE/ac4AC7NW8o1eN51py56LK7gy2hsM3XVcJVbDmWpwPxDp9SufMKjrT/l34fXefjH
         VUU4ormAxJZPubVcZQcxxyfh+v7psG2BrZ+d12aX/iIGLlZP1oHLiMimst+NS6LKCt05
         ZIfh2VG6x6k3kkJ0A5wU8vMEfIlwcLoBLMgP2NJjJJNGmQWc/i7a3GnlpEVbTDmnM3eC
         /mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163774; x=1741768574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfQXwUL3Ydz7mR+cjRUeO/xqWRGS7uJqxxJMkaNfgT0=;
        b=SWH5fa22QoItUW4l+dhXLqtcFajwO/NsMSuLsrvJfVEMcy6247AqjAzv+N1lMAU/25
         +vT/OeQ9JNyqCQ6A1MLPfznkKiZvk6233KJ3I+iQ8LspoCj92xL5Tcv/uurgV4mulR42
         xZA3/rf7Ouhx9XAsrd2dYn6nJeg565YbNYhdFzT8+2wQwv6Fc9ushoUMgi75Re7qSH8D
         otPxSUDL4TlgYargPUCifEyWrSouY1pf6k5d+IAGmFi/gtpoq613tIkOvIDPLpC3PYqM
         O72zuVgujfnXoelRhfZ5NTTh9IEbAjGeYGWwnxTTatwjUppYEnD9+JnbO79hoaoXL4uG
         91qA==
X-Forwarded-Encrypted: i=1; AJvYcCVnLwc1fCnchhRi1pc4CoT3uJkXttiLkXeywr7aKGKkRJlDxDPhuwkhTEphhid0WhbYoW8w@lists.linux.dev
X-Gm-Message-State: AOJu0YxttqjPlL2XVAMVbWb0Qt/Qth30NnBWGVypf+D6nPG8Z/i/cEut
	/hEt0oVjYGmreQpUv3GGaY95A0c3RPXuEFWcSoh2kl/kp4qPQMUXJDDst+UthfE=
X-Gm-Gg: ASbGnctfLr4Wzjb5avQipEWLYeFh40OLm1fmromXjylsLEPGn4W8V/IgLkSDDwNgYi4
	xAMtEC7GhLXD92w8iD1BrnhEJACPQcnaM0AAW+Z9R43hHgHq2wTREJfplAXnxsYIK5eS/UWYPxP
	Mp92NMcswHhFK1qu1LCFHfofbDR4k6D99FUybRdf3r+zen9yPDS9kmA3uRhXclp0hjXlTxJELpO
	PqcSKYKNvu+UzCdse8ZDuZs652xxjNdpZ5QwNepJqakjR9k2ZINYcXTyNhSq/vqRrgaHT35CeYX
	SGvf1cZRIx12qOS9ahj7D5+ChOTDFW3x8YRLZeCu9dUYIgHT4A==
X-Google-Smtp-Source: AGHT+IG1TdRy5Kvu8p1cmT5U4TYJbrUoCcVGa1tX1dkQIqW9WiR2lgUQPgvjP/3zB9IzHIHCvQwYww==
X-Received: by 2002:a05:6000:184c:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-39123deb51dmr497486f8f.45.1741163774150;
        Wed, 05 Mar 2025 00:36:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e479608fsm20564933f8f.14.2025.03.05.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:36:13 -0800 (PST)
Date: Wed, 5 Mar 2025 11:36:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marco Elver <elver@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 01/34] compiler_types: Move lock checking attributes
 to compiler-capability-analysis.h
Message-ID: <f76a48fe-09da-41e0-be2e-e7f1b939b7e3@stanley.mountain>
References: <20250304092417.2873893-1-elver@google.com>
 <20250304092417.2873893-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304092417.2873893-2-elver@google.com>

On Tue, Mar 04, 2025 at 10:21:00AM +0100, Marco Elver wrote:
> +#ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
> +#define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
> +
> +#ifdef __CHECKER__
> +
> +/* Sparse context/lock checking support. */
> +# define __must_hold(x)		__attribute__((context(x,1,1)))
> +# define __acquires(x)		__attribute__((context(x,0,1)))
> +# define __cond_acquires(x)	__attribute__((context(x,0,-1)))
> +# define __releases(x)		__attribute__((context(x,1,0)))
> +# define __acquire(x)		__context__(x,1)
> +# define __release(x)		__context__(x,-1)
> +# define __cond_lock(x, c)	((c) ? ({ __acquire(x); 1; }) : 0)
> +

The other thing you might want to annotate is ww_mutex_destroy().

I'm happy about the new __guarded_by annotation.

regards,
dan carpenter

