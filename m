Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DAA2D47E7
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756879212; cv=none; b=qtaBE+Hm2QgWhr8FKITIZhhkkKWDIx4Y+RGJf6e/r5JuRw0hQZ9sBG2Cm+3Ewq9yU4/r3iNcgKmfw6fr0x2jNoFKWMxN727DoCVngb6YT4/bTIHUvOaGT9RvEoKsquNWCP0Livipgg8fRj4QcJ3PPO16ofKW6AAyncftuKFrC9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756879212; c=relaxed/simple;
	bh=86y1tP9tg5b5qwrYZn/kOU2GBbl4E8/GHyUZAUCz39o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMJYs1EPbTfSgaixfaTRvcuSIJST02TmQIJWw0USHtslZFwKJNoQMMg4OSKFfYHRxId2mzA1lpY/CHoupJFUqP/jixg2Ickt2KeTDQAdRDf8r0tcSn2ycZdqb+BrNFUxznuU8cA6BzMhUad9BseGSVRgoCNUHxmwjJiJ1tVloCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tK4wQiiN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tK4wQiiN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2489acda3bbso49622545ad.1
        for <llvm@lists.linux.dev>; Tue, 02 Sep 2025 23:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756879210; x=1757484010; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FdC3QTxmU3besuQLS5g8tc+09uf1KenOXC1aPNt3jcA=;
        b=tK4wQiiNcra2ERXVGoeOn9SsOdSj9yfuNooDYyrz2iHlN7tPQR6syCnzl6nuOFi//T
         cDXTceXamEjPkJnTOO9pfj6MaVYrw4stsXROQMN/JLAZZUxG6sQh1EomZ9FFLrsELIAx
         sFao7hxJ1wqUl1BkZbqIwknkZLRMTjym2urkSaYnKwmHIRQdmabN5FyF4gXm/rEvFgO2
         xFf4YMAnOIvLnyaJ8KnUrsAKDmoBxX49MAjdJ38dW/QwQZ4koOemnJnRIeRgvR1R1hCq
         ppmA3Ho1L7kFqkC6W4mvFOXehe4PEmdfd9nHOwnyYRJbUmHJxpNzU8R85689WWy5smPv
         YG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756879210; x=1757484010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdC3QTxmU3besuQLS5g8tc+09uf1KenOXC1aPNt3jcA=;
        b=V8qIjm+p8dlwWEpIJVXQlxZgTw3EhpxK+XN35TE0I/jWZQoK+GmLevmvr0Ud42hNPo
         62HS0Tf8vIMxo2XH9Y68/kssGQ1oQsm4/cNuE2sgi3WXWaC7UvR7lBOC6D8ijfSbFG/3
         l1NPcChYCX7WigQQNx6Q2zejUfePk6oikn818cL13QNYrWioHT6dQS5QzpOvkJs1nPHG
         zIyPJpF1eJ0UoZquGrIrir3kQbDG0PEOmH6Fm4q00wmfI9PkplSbpm0MT8adYCPU3Uuq
         dUAsfUOeHZga+t1G7QPKU+CyrxlfNxJHD59nhBgzlSeTI9GK53/Zk2nU1RyD2O0xQzKW
         wasA==
X-Forwarded-Encrypted: i=1; AJvYcCUrd5JBL0EiQtu2mdROkHiplDY4O+fsgg5hjhODrJzbqsWrOHr1uULKd+l/tJ1ZZmLCthfE@lists.linux.dev
X-Gm-Message-State: AOJu0YwGojzaK/PLKz8dPV2ulcyzGAn/wfvLEb+8ahDi6vC6RShm0/HC
	p4UGW7cydoxHVaBJt8jV31o4uZMjQacWKGzAP7vy2Q84OerNNHFLskSgjLlkJaAAK9NRfA8iZtJ
	yn+TUO90Lbj/nkl1780+ual++itmOB5FJbWG3HL0K
X-Gm-Gg: ASbGnct5vq2kqInE5YHkg9NFvQxAcF8ZwwDedBALtH2mbE9PLqLYPh5lU3Rod7F3GkH
	AroLpgpiR73VryHHz3uPhDR8MAKRafe8/FRVYw/qx4ssd6/QeDnm/FpD5W8NXOrj/c32v4p0Bnr
	Xu7oeZkrmYCaUumWpID7VvLZy4k7fH0GeIfhfut8YBQj5eSOa5swLZGuHHaDcNQJeV/ulfOCfnt
	aIPSk4CFbaMCLYfvq+ljXZi7YalbBCxNVV4FUBfZKKHLQ==
X-Google-Smtp-Source: AGHT+IE4iWea1dHMglD1MtIs2f5EA13KiTkiIb8qI2VYbzhFnB8dDcZN8fetSPmt+uSKa/XqAOMO3DrJFBjK/NVnrDg=
X-Received: by 2002:a17:902:d543:b0:246:4077:456f with SMTP id
 d9443c01a7336-24944b35030mr172147985ad.58.1756879209794; Tue, 02 Sep 2025
 23:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903000752.GA2403288@ax162>
In-Reply-To: <20250903000752.GA2403288@ax162>
From: Marco Elver <elver@google.com>
Date: Wed, 3 Sep 2025 08:00:00 +0200
X-Gm-Features: Ac12FXy7vOsop2eZcEJ8r-sYpuE381OhvdK3KJiYzgxTh4KO44xvrZCKXVwkZ5E
Message-ID: <CANpmjNNV=ZmjcGWvPwHz+To6qVE4s=SY0CrcXFbizMeBrBaX4g@mail.gmail.com>
Subject: Re: clang-22 -Walloc-size in mm/kfence/kfence_test.c in 6.6 and 6.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 02:07, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi kfence folks,
>
> After [1] in clang, I am seeing an instance of this pop up in
> mm/kfence/kfence_test.c on linux-6.6.y and linux-6.1.y:
>
>   mm/kfence/kfence_test.c:723:8: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror,-Walloc-size]
>     723 |         buf = krealloc(buf, 0, GFP_KERNEL); /* Free. */
>         |               ^
>
> I do not see this in linux-6.12.y or newer but I wonder if that is just
> because the memory allocation profiling adds some indirection that makes
> it harder for clang to perform this analysis?

It shouldn't, there's still a direct call:

  > void * __must_check krealloc_noprof(const void *objp, size_t new_size,
  >                                     gfp_t flags) __realloc_size(2);
  > #define krealloc(...)
alloc_hooks(krealloc_noprof(__VA_ARGS__))

> Should this warning just be silenced for this translation unit or is
> there some other fix that could be done here?

It should be silenced. I'm surprised that they'd e.g. warn about
malloc(0), which is well defined, and in the kernel, we also have
0-sized kmalloc (incl krealloc) allocations being well-defined. As
long as the returned pointer isn't used, there's no UB. I guess doing
an explicit 0-sized alloc is not something anyone should do normally I
guess, so the warning ought to prevent that, but in the test case we
explicitly want that.

> [1]: https://github.com/llvm/llvm-project/commit/6dc188d4eb15cbe9bdece3d940f03d93b926328c
>
> Cheers,
> Nathan
