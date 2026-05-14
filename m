Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F273AEF34
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746973; cv=none; b=WLDLEymGkLGjs3YK7YcW10Wsu337DRvwT+DO2JVwumzTSLgiW2G7BHSRaPutmQ2Hzwokfbu9qGjDAO1fp+13zb/iN7fBfaG5zjzKBP5pxwtfqxnoB2UAgoIRp0EYmzxVJPgOZxuazlngsFwO/bk0oXpMpUS8HzGKodCV3CMTXsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746973; c=relaxed/simple;
	bh=3WjDEzCHsM60UDSdPtY66/xViUYjVkKVnCvLEkxbKG8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeRGsL3GA17Q0W+9K8uR2LUTfZ+Vm09PROmBZMOm5V9HlVZ0VcS7dWe/MRuat2KKH+JqJI46Ja1Kr8iTN7zOLjM9Pdx0Q0eEQgKDHNt/UjMP8ZMwSR9+CNKjp3c1XS7d26M3v7ddiZns6WZB2FEaC6qBoDVWEKq5W5X7AhOmWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDvF4Y89; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDvF4Y89"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44509921fbcso3894284f8f.3
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746970; x=1779351770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnnqbs2N6v6CmeDw57e03ve8ioJE3EIg9PporZt60VY=;
        b=tDvF4Y89kiO2fvzOywLRSVsEVfTYXSlgEUHfq5ZIDIyS9fkxfmiHJ+7R27xXx2M+mc
         IROpP5buhj9Y7DJx+XfjZJa8peiVGjpL7jgNqC2g0i1hvj5KydkEN1rZSv7knsaChall
         ZMOdoo70QDovco9tJ8APDlH2bBVkggsKP8GnJyLW3WmIHDO6lLCrwFRFRFlv0yhvan3V
         n6Rfzm1SKxD4fjsUx//crGEKAPnOv56o8AMxHv+Adnof9s4L4NOZ360PGYs1uu3xLqYu
         ZPZwnoTjKY78kQ5mLnA5Tl5FjzjPwzGuQn6LHUV0a/OuFEN7ECHB4dHeMeRea2O1qMmm
         rdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746970; x=1779351770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jnnqbs2N6v6CmeDw57e03ve8ioJE3EIg9PporZt60VY=;
        b=i+/jjOqjU/OZx50oURe5S4/l8RlYJHCE0F6j1YSNO1ReaiKhTLZ6q0ZXYwm+yULpw8
         Yue0EQgosU8BuLEk1fxTODeBtOiJBQ7d9216wO/0Tz+aXO8iOGslxJuA+1pCDGJ7D5rH
         IlqWE5DjDSyMFVEhFslULfuEJ1x9f7/9/Axn2VdZ4/npc8v1kKtImnQ9rTyTS8q6MzsH
         Q9Nt/z6kMJhaF1kzBaNIHPxiNaHUN1fL1/b2zrFcRCv3+BZ6Oa9idXWkjCpAGj8EbsXo
         PG9keWD9dKDRRGjFAk9TZQ6PqKEOSHTlSf+5ERnk08FFukkV/fIEcUAylzRCY6eOyvYj
         ZbTA==
X-Forwarded-Encrypted: i=1; AFNElJ/iCwzd0PVg/HteRb4Z/B0zrSIQUhKTRec+IeSLzzairyiU4II2wBhgZYPyGszz2tF8FW/g@lists.linux.dev
X-Gm-Message-State: AOJu0YxNE4/a2x4HXg8v1aa74UccqEDcs7vhFFhRf/nJq+r3SWDpWYd0
	SIR4CSz+Podck0tuv8bKy9iYCJAChmPj1RmkMcCmXFg5yuQ6GteO6Eyx
X-Gm-Gg: Acq92OHjsAxyi2NwQzvuPFM7TG44baGdaHcPoo8KUIZ6Cng8qb2WIvFMEalEi23Gppn
	1IiEp/e3HHIkINGFtbVALSAIX/k4hJYG9gRKyad6mrrBZlClrH5qq2iQSAB2rvVrTsCQDAPqISU
	8JmI/MPN2poCWPDedaXIe6F40doFQClx0syaV7iPuKWOh+vvbgSi+A6esBPGdOrY1zk+l8N9FCC
	T/ufkD5Q8q48qquhhMfSKmjL4qacIukidmxN47qMixB+b6O4WQRw8bkEVRHoX5F1ZQFTXEbJzi6
	Y31OOPOYB7iIuj2VSsIcw15Oz7XbH3To8Oqnvi4dmRu69XbvMeYt4vblW9kBMNpmOTbOTuWr6Kv
	ZotjXYP2O2gdT1DJTyNAVH8YK5G9sSrl/zR/bRknakMH/SX2I/xosOnICDqHEGFXXfx7R9lpki5
	NTduON3Wa7q0224VfyM7BMAWIeuN/UyszauKF6c9+dcHdDXOegWKT6swib0Bac
X-Received: by 2002:a05:600c:45c8:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48fcea151fbmr93519065e9.28.1778746970041;
        Thu, 14 May 2026 01:22:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64a22a9sm49882335e9.8.2026.05.14.01.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:22:49 -0700 (PDT)
Date: Thu, 14 May 2026 09:22:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, David Hildenbrand
 <david@kernel.org>, David Rientjes <rientjes@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jann Horn <jannh@google.com>, Justin Stitt
 <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook
 <kees@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo
 <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
 linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, Dennis
 Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko
 <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM
 randomness
Message-ID: <20260514092246.12b7d1ee@pumpkin>
In-Reply-To: <20260511200136.3201646-2-elver@google.com>
References: <20260511200136.3201646-1-elver@google.com>
	<20260511200136.3201646-2-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 22:00:49 +0200
Marco Elver <elver@google.com> wrote:

> When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> to identify the allocation site. _RET_IP_, however, evaluates to the
> caller's parent's instruction pointer rather than the actual allocation
> site; this would lead to collisions where a function performs multiple
> allocations.
> 
> With the generalization to kmalloc_token_t, we now generate the token at
> the outermost macro, and using _THIS_IP_ would fix this for all cases.
> 
> Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> the address of a local label, which is considered broken by both GCC [1]
> and Clang [2] because label addresses are only expected to be used with
> computed gotos. While the generic version more or less works today, it
> is known to be brittle. For example, Clang -O2 always returns 1 when
> this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> To provide a reliable unique identifier without breaking architectures
> relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> to _THIS_IP_ where architectures provide a safe implementation, and
> falls back to a zero-cost static marker where _THIS_IP_ is broken.

Doesn't that mean that all the other uses of _THIS_IP_ (which seem to mostly
be tracking lock requests) are basically broken on everything except x86-64.

Would it be better to actually fit that?
It isn't as though it is hard asm, you just need to look at how gcc generates
PIC references to static data.

-- David
