Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A52741DA
	for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 23:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761350194; cv=none; b=bMXEjPz6ynUZYmHL79ML5WAhz6GThs/LA0e7HdfJphEh0JcW+wHr/dudDvaZyXFn/zpCbK2/38hrTvH6bkNRVhUWbZizwOEDbbdZkK0Gw/zbl0xQl8XEg6JAhvKOJVXaggnxquf0cWJNPWLjPlAaBGVdsyIVH0bR6JCjTQoTnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761350194; c=relaxed/simple;
	bh=I9+wesjXwdYP5crXHyVvJlapOGnpLDggg324REWnDlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=id5eT83G96Jt/dwdsaeI6RzIujx6/pOn6eBl4AZOaOCoIrjCpbtgW/feuSNgD00u6sxyXJq8iTvwdQAMkDMcRU0dhJtkFLKyvjCWu1f+HY+v2IFbAGkJVK9w/uIlFS4SGC7MDbrll9dXDj0k90rZ2HRTKZCGuiA7j21+u0/fkFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g/M41ies; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g/M41ies"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4736e043f9so495646066b.0
        for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761350190; x=1761954990; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7c0ATkCCZkZUA6CJerpy4FrdLqyWgahzYfyRj8pR78=;
        b=g/M41iesb6wYtbVQdaq9hDHr4ojRJq+Awd96dfhpOe0ituJimO3uOfFiVvN/wk8ubZ
         O+zLSZeKQEXgRLi8mkImobB2zOGAt+Gs2Z3uxTFuEudKajCETkik5M1LRR/3UVCSkV8V
         7NapnEEFFHGX3jhFJE5FMxXOcxaYZHZYi7/3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761350190; x=1761954990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7c0ATkCCZkZUA6CJerpy4FrdLqyWgahzYfyRj8pR78=;
        b=lkUJ4LsXquTIhzdwSokuvojhcLUDQ3/GCc6vQ8vUGl7bKczAfZQ1ZtTuC+Gpsx7TCm
         ihgY/0zA482MfabBNz+BbDB9kYVHkRucRLYmG2HDenRQjltHQ84Ty3UJcVwgcxf7KOjC
         TI5z2/6PZi3+xd9qm6czQPfLNdIaYNGjTaorftvMVs9V3Sh+IVBygzgdSTmzeH0o5nnh
         KS+yyTL4q6VB1HUPd4uTy/GU8usjMCfPsbu0Qr5pkPPNwTPPd91jQuW2nHfBql1oiYWn
         IVkae4MLbPbu9nO+LHslzFWhanUBXzz9fsJKwkMnBOpZtvfX7rYcQnvRha6tbHL/6ttN
         Le2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUE95Lg2lt/9ttPcSJLdmwiYUT2Or9Nuv/6pryOq49i+qrM54JUqUnqnJwRkMtREbRcRaCA@lists.linux.dev
X-Gm-Message-State: AOJu0YyMjTsc5A0W3iG7QFrtzgv7oUVTechCFG35t3B7V05W94tIfAsE
	LOaCcjPM1f3tBC3+gQSLeONFQiRfZ0UwvTq9zzJV0nxfg/HgUMDPa35R6Kh7yQQEyBuyHL07D+y
	KCkpmafg=
X-Gm-Gg: ASbGncsNgbZjuvKMZ5QHu1IY78U01Guo5SY0sBRYTma/4QA4PDGQonUenM7NcCYRZcF
	o6A3shcp9QcN4+RYbL1LSGOMbutfwuFosBHslT9RDotalQ9jwDrFug3vV1cIuVrENgoOSU41sik
	1/6XngI2SRYsSIPKiJqVBN16jsaKtoIhaTAkfTFAJs9jvxa/4acUVZK55lN30SuOk/B9C2SdO7Z
	bNueRFP2glso7br7wqufbRfCyBPKHmZYDmnLzcSjDMHrFTaAA4LviSNqjSqRsniL/uqASKqLdEk
	JjMGatd4+afaA4K90yEukZXqC8DYtyT1y/9yDSrdymge7O0q4COcfhl5xy2pk5ClQmQpG3uXZHD
	+oxtjEyVPaS9Lk0YqW99xi0sucXTjhWJhDWpOx90f8ddRwXhEh0YsoFR8Y409wxfgYdtCpOdbTW
	QDpd2xM0CkB0gp2VOQhsMLQOtpyWfAqZIo0mX/pky1WndvDmJZQuk2i1UjMFxA
X-Google-Smtp-Source: AGHT+IFtF8cXPIvUc18zb7jz21Hh9hHYJy78befvg2YJ0aamZaFKb+PqljGGNYaBGGwLQrsODI57jg==
X-Received: by 2002:a17:906:258f:b0:b65:dafc:cd0a with SMTP id a640c23a62f3a-b65dafccd66mr2431467066b.52.1761350189723;
        Fri, 24 Oct 2025 16:56:29 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853386d8sm48551266b.18.2025.10.24.16.56.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:56:28 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d5b756284so501826766b.1
        for <llvm@lists.linux.dev>; Fri, 24 Oct 2025 16:56:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUVQ3Xe8/7AVfhcZgIhNAEgl15K2W6R68qhSUPYK1r4X77Dx8CkrUPlb3XuGyM9NUub8Ad@lists.linux.dev
X-Received: by 2002:a17:907:9481:b0:b6d:7231:3276 with SMTP id
 a640c23a62f3a-b6d723137b3mr403583266b.19.1761350188531; Fri, 24 Oct 2025
 16:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015091935.2977229-1-andriy.shevchenko@linux.intel.com>
 <aPYKpJ4MdjlGeILa@ashevche-desk.local> <20251020104934.GQ3419281@noisy.programming.kicks-ass.net>
 <20251024211901.GC2068@quark>
In-Reply-To: <20251024211901.GC2068@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 Oct 2025 16:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibTpMh-UZV83Gvn0-+vkFQ6bF735v=8fFSJhxQWqHT6Q@mail.gmail.com>
X-Gm-Features: AWmQ_blIYWKp4ZzGql30b3lNkRizUrL6QNoIR_6U2_V3YJhFKrJf9JUkjU16zcY
Message-ID: <CAHk-=wibTpMh-UZV83Gvn0-+vkFQ6bF735v=8fFSJhxQWqHT6Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] sched: Remove never used code in mm_cid_get()
To: Eric Biggers <ebiggers@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Oct 2025 at 14:19, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Linus, could you consider applying this directly?

Done.

            Linus
