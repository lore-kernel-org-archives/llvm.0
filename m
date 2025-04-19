Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406D1DEFFC
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075594; cv=none; b=tPW+BX2DvMFKNhUFkZjhki8D8Ru/E/VsTss+rxhx1dTjlkQOJltMQyRzf5N1Ex6l3EtdnjHYB1jYJ/afJxyXERUvYJ8sbf2BxzF3QfTId3zLgRnn7yvuNoWyRv+VuFbuXAXcCijXWHTl5Gl0b7D8cFEfHh/LH7oMvWqmTWsT6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075594; c=relaxed/simple;
	bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQWYc+gCzf2c78L1FzIiNrE0ad79+XOQl7JWtQ8E5fbqC564Y0chqZ6D4U8MVwBsdzBLQwg+jwGnAqpdDL3OBv/w3sf258mJdZ3jpHeYUcdSTn972qJ1wMS32SQAf7Yno4ksdUsgSg2Ge0y4nfaoXIWYp0cc9C1XacqCDq8hgbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULq2zx7k; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULq2zx7k"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22409402574so5945805ad.1
        for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075592; x=1745680392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
        b=ULq2zx7kcrcHcpZepQdlIKzaGHOMPkahgJeu3RcVMHXM0IW6KVoLHiE9TRY6Mie7Xc
         sWYWfE4E9jcrjXFcwKWE21IEvzgAABTPXTxxPGcz3WGZDFDJGQokhssq2NwJGWyXFiTA
         06AKNVQX1knccQpkza5++e59SkDRg0TcYGNO0nNA9zwoH6NItfxfs4gMF9SwjtGkKy5z
         h8ppO3QF3vWozahII9svicINBPgFLwUhhBDGgeu6LgOA6Amg8UgmhO5g4GopehgiWz4s
         YGLSaBuzEUsEZJfXwssDpAwwG1GNl5I/58FuHajBoPr5YSqX8gm5Q3Cu1/ynKKzu+PSs
         JL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075592; x=1745680392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CofW3nXZrmceK15AfW5p+sn2cuh26U/EBkEBaryD+4=;
        b=OjcD5lXxdNHELmMVBuoXeex5ats+XETYzZdAILMWnfSX/Pa0BVQz5y6VHV8rPR/Gqq
         YZUfWQZWhvJfxRvVrEA104hUSB+HAk4T4X9HE8bt/zb4a4MZlcupEqGVdLmXfzIH/KVu
         bDR6OcHMMhTdaODvP7lqNsboP2jW7paD8YHbxoHc/wSkPLJsjr1mHMEibp5hHKrKNOo5
         N9lmapyGrtBTxGur9eGr+v5/HyjKTioY4qJMj366vopDzuniQNF1k05C71iUdsqjegLF
         Lg8VWcpmjwyw1iGOhGvusbBAsgIjHn/HKHD0k+RzFyEZSUtkdYt5mtIVcqR6o4aaKfQ8
         0lEA==
X-Gm-Message-State: AOJu0YxZ2vnYiKoTQE8zIsQNcOJBDs2N3tidPT9xp6I21GTSrIRsHNNZ
	huHJ6z62uYIS6vbDJZUiNuxrlLpCPclBRAcJkQol6d7GVHYb/RvEfT/UxnS8VMdQERNuO/+07j1
	w+hgg8zqAR5Ynhr9TwQY+j3zV3xhajg1t
X-Gm-Gg: ASbGncvek8dMAGouRwD4X8uE/WdXOuFwg7mLFWdg/6Ncx8XpNR4+D7r48/hoaPc71wi
	fC+cSMfFr/z5DuM8QOs78RYkuSwn9KKx6gOOs8IpPiNRZrqWIK9X4HukNq8ZcGm0lRKiWO+Ltcn
	98A2mlFLlf1h2LiBsVDWHFrg==
X-Google-Smtp-Source: AGHT+IHphlWBMlhbjmkBFyfL/q3M6NQmqluoHQlXSEO9MJG1hNTqWNBruXB375qqofrrESObQZb3L9dpgWeNX05VWT0=
X-Received: by 2002:a17:903:987:b0:223:f903:aa86 with SMTP id
 d9443c01a7336-22c535db69cmr35553235ad.1.1745075592062; Sat, 19 Apr 2025
 08:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402203516.GA281819@ax162>
In-Reply-To: <20250402203516.GA281819@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:12:58 +0200
X-Gm-Features: ATxdqUFnjA3ZiR077fl60cIbz3BhN8_bCQdWMv9lLxf2UOBn49aVsMCbRZ24eEQ
Message-ID: <CANiq72krxPC3s=+UiGfe2wqypfMtKTs3yjo_xa7Y8G2zmXd7qg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.2 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Build-tested with a native defconfig+Rust x86_64 build -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
