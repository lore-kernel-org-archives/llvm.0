Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F38A29AB05
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764698952; cv=none; b=DJLk6r3bkxb/0QZQtjtewUMAwF2+GwN6DEkYaFHXgU93613UvJ0aBvGtwe2dK/YyAOSDce4kru5Kzf/tqZfnlE1tAj5r1/1CA/VW4U693GhBYEkwqYKiFCHIAfH5OYkhir9YXSuO5lqYUK4IohJoZrNKXOwxiAs+qhkMScLwhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764698952; c=relaxed/simple;
	bh=UG+N/xBqWWtHFr6V/+KQYio2aIw6MK/kPFUY2YlcHU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAjZFVA4KNXK7oagkGcZoF5e928d51fYSLZ+pbRcwpkuVp2qEXowbEhyRMTnKXhhS3H+brWva4q8l1ZH7ilyZ8guhRfKWmTLXor7IBbrxFPZk3aVoH623WyFz+QzM/6B8vDUHp3Dqx27RrB1ENzq2rtZy0W3csABeoLWEONaiMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT3oEqGd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT3oEqGd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so2336837f8f.2
        for <llvm@lists.linux.dev>; Tue, 02 Dec 2025 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764698949; x=1765303749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn1wtJCzfHvdF61J32xr+9Xn5as1IC7b82lr72buXkA=;
        b=AT3oEqGdjf0DPoxT7J93jTRVR1Mkdh5NAos+fLzAwukOQnXuL59cpx+BFnVdp9YoUr
         yIMkeDx7yxc6xDJvF+1SN7JlKd5m1f0MTB7aLvalWzcP7BQkOg80pnQBJDjlK8v3Wzw/
         DR7CdjA4tjbPrLx4u1aYrvmVtLqMuCWCzFEMyut6P02/JxhQ+o7t/ms96Mpfp6Q10r5z
         k34G6HuAdtq8nu9oLd1KoXsymUJpGoSwoV010xFbboXwxm6v4fdr+RuS3lYMb5UgS3AI
         77q7bO6YdWf8DdxrzKvDQt8gJVKOmZefoOG88J4V3+tCWrkV4PHPqAPqWnNcOTiOU38M
         egpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698949; x=1765303749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nn1wtJCzfHvdF61J32xr+9Xn5as1IC7b82lr72buXkA=;
        b=t1OdPVlWmxoqDfDVeHYlf0uguB5IuNSPYdzzWEV5UYU0xvyuUbY7+pUY7yFl6523IE
         ousFZjjngiANGSKN1JbODGHGEC83BiTcryITtbpWLpaRO0/Q91P4FQOtU6uhZEZXxJhh
         tHp5igR2JJ3ZN0ssoxlHky/vyAc5U2kbSpkTBJREs+HWmEwG7tn4fiTL58Hy0ZihP7cd
         Y9oqRXJeH/Gx31eXByTgypp6mgwDGg/k2enqNEdZazAj2SsVlRWskZcj4E5gXK94WXYQ
         OSrk7UX/VzV+AIKUMkFXw3m/nQq11UQyBQJ24jW54YmV/OT0Bg5tLhdyP3T2I+00cfaC
         Q3hA==
X-Forwarded-Encrypted: i=1; AJvYcCUqRXiUQ+5mIc86ja/5UIuuSSb1yqZxJhIjOZ0xwkEi7NNCH49wyBKV2gIciD2JN/TFAxzA@lists.linux.dev
X-Gm-Message-State: AOJu0YxfIg9AKLJwM7Eq7x56/mJawFHXdEVUskuppuo1TA0oI1yZTzXf
	gbLrKjrIkHPh6+pZC0gsv1GwI7QvrrDr/g+S8AOHgCbWw6uLhTFRKx64
X-Gm-Gg: ASbGncvgY5zFhM4envSCximtLx6F6y1YR42WP7cf6kHIAlGbgujy5JY8yoqwTpy4ZbF
	PpHt3O9Z8fTgf3tA39XjK6nVsoukLE8ESWWXcemJeraydTz39h/gMw7SzbzfR460IUjRuo9nW+9
	/f9OCytwaTAiByUOVZ9zLYTp9v1sAe8SYsSOt6clZuRDJRXYmu9lJuoN9TEchDB6e1ROmKWVEtV
	GCD8XSi+XewN4zkJUNEHDAiNGz3WnoLQ5qGP1YAsLlkfPRI4VhAssJKMxm0bkUGFN+bKkKXiOD/
	pfKkjfRcmn4vbEM12/Okh/3b1PtZiQhQF90qmA8JyxvufwoUVzkc0ZzfF/ZsuW2/FWgBX5C9xCy
	yukg2JmNmZW2Msfx9ocrKDBq/2v42bS4QuPj7r5YY0MOr2Kex9TvLePwLUu5O9QXpLE1nrKC29T
	J/RRVqAo19lXM2pvolPn2VKOai5TPOVRQY2yA3APlHwT9wUbt33fLd
X-Google-Smtp-Source: AGHT+IH+d4MVT3R9wTmhxR6atWTe6Ko66coCxkIKz6AXqTPqWPTj1AMCd/UTxeqBUk9Rtu6IhUkLOA==
X-Received: by 2002:a05:6000:430d:b0:429:ba48:4d6 with SMTP id ffacd0b85a97d-42e0f1fc42dmr29824912f8f.10.1764698948540;
        Tue, 02 Dec 2025 10:09:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cac995esm32914834f8f.43.2025.12.02.10.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 10:09:08 -0800 (PST)
Date: Tue, 2 Dec 2025 18:09:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, Nathan Chancellor
 <nathan@kernel.org>, linux-kernel@vger.kernel.org, mingo@kernel.org,
 peterz@infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 11/30] objtool: Trace instruction state changes
 during function validation
Message-ID: <20251202180907.169ba703@pumpkin>
In-Reply-To: <gl5aug2lwyhjyp2adwjtomxodxixqbpzxj3bcbnimfzo3xmce5@tvpxxghlmxif>
References: <20251121095340.464045-1-alexandre.chartre@oracle.com>
	<20251121095340.464045-12-alexandre.chartre@oracle.com>
	<20251201202329.GA3225984@ax162>
	<vlam452zory73y4nvtgl63ofr3yrguguda63qsns3k6r7sgsey@2xhf3fbc5pkx>
	<96eb8fc0-b93c-4ec1-9d04-eb7b67857b11@oracle.com>
	<gl5aug2lwyhjyp2adwjtomxodxixqbpzxj3bcbnimfzo3xmce5@tvpxxghlmxif>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Dec 2025 08:13:21 -0800
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

...
> The static local bothered me, I went with a different approach to move
> that variable (and its usage) to handle_insn_ops().  Will post shortly.
> 

Does look a little wrong inside a recursively called function.

How does the code get on for 32bit builds?
I'd guess they have a lot less stack available?

	David
