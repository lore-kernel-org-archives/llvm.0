Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080B2AF1E
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149720; cv=none; b=MV4S+/rQ3pC1P+a4FFgtd3BadiULJdwOGwB16ieGeZlvJ5KBKqv/R4tuHClLgSPsBEo40gL2eS1jYlwG7IvFis9C5GPVV6+neQO3FCtl0G0iS4Kmqkp8I+MRSU6BHGypzmroFpYbqOBMJtdLg5GYK5YpPjJQKGQyEgnpZkWVR0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149720; c=relaxed/simple;
	bh=0As8xmw9EhCI8l9UThvyG5mZVKiCmUiyNh+yysJrxBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHQ7v1okrE+V9CnDU7yqRbgfOoiCMCuAuNcUzWZxN33kTbPXZ0kReQ90GOaSeXKXJXvSheuBvEwmVy/VpMz9w0YKAtQ0nccg8pTQL8X4RfF/ugU6F9mgk0fnxHhZf3GXi2aLhWXNucZ5mtsIgN3e90cnWBh+2U44MiKCI0Sm0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VSZToNwF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VSZToNwF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2236632a12.1
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746149716; x=1746754516; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=VSZToNwFUUquUcUcCNChVubuulaqN4jlMzBo1TUBdNwXLeOXKIzLt5eNc5P+7k+mQf
         TqFZlDwgFzCSw/IT1kUgY8qbKiAKzNaj44og5rYCbtzuxnUeG4cMD5uTxJ4Y4RR0i4Fm
         YBrF2Z4sGYRuzDCbLLGRwl1BiDNn0xl+oyoZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746149716; x=1746754516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=ei/LB/0UdlOnRK9R79GITetN8hCQf4HovBi7r2XeOOn4V/pPQaT56r7ElBhJIrjMqW
         +PCer7Mryl5vHIhGmSnFaE1iDptNhGzxqoM71Z9bPAJDdsE+F9KoAiBktc5+8ApVKiFF
         YEWFbO2e+wUnICeFeZxI/HUZed0BO824277s2g78DSlDJagQYCzADGUPs+kTGHG++SqL
         KfF/wB2PYGi9eUPWpxBFpyINWLuzRioBnWA0EPBnso+ueAsFAHGgVJUZCvvkBSRUdDFC
         lVlPHBv4XxOmEAzqudejXMhU0CFYfNi711euDMuQJcQ5HgAwsH2fcyYK/2X3Q5NipMqU
         x4MA==
X-Forwarded-Encrypted: i=1; AJvYcCUE3MecXNBOYR6IUTl7BckBimMv8hJTKuEVsbZ98Vxd4hF7SNaofX53VebBogmBncXdqQi+@lists.linux.dev
X-Gm-Message-State: AOJu0YzBbngiSYUKZO+vGutlzTma+9BL0d0pDv/uQvD/OFE2Ns3Xv5F4
	0Z16iD+ds/vjQ/u0EVbF2a/gMq07JCLrUwoqb7Ck+dw7vqp+bFJDvV2Fh6syREq7Ox3XkTZkmxj
	eWik=
X-Gm-Gg: ASbGncs/g2EazhJ1Tltz9SZKKeyIzFwLPXJuuzrj7w/dosJ+J4Pe/vpIW+MBYP3LuM4
	R/UpQ3HgLXMgTtRxzW8FsNvCn99DL9jx05VUXUXh34UA/ka22NDeTyDQz4+X/CjGow3FZBgJTTv
	dMifQcDfy7oME76lk9EzND6WFY4vG+jBDOWGWa9sJmrsll4adiD93kogVZpi74lU3lV5S1IoxuB
	V9Vy2gTIJsBgbiF7QdU5xYc2Jplodx5R0fbVihirw2YpKWHde9Wgqxa8EZJmtJxh8wuSqXC1PMs
	n4Dexmih9AGhs08vKqRslEOVvJSxpSlPh88UMxMMvmIbYw3DG2uNp+k5GEMNc7wNOCpfdeVUZRR
	+IF/PX06cThsAZhE=
X-Google-Smtp-Source: AGHT+IE1a0v+R+tFgivvJA+RXzdRACEVMnsPjpzTYPT6JUjT3RhX7j1ny7VvFZN4WUMnO+Zjk+LaTg==
X-Received: by 2002:a05:6402:27c9:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5fa77fe07c6mr738360a12.7.1746149716434;
        Thu, 01 May 2025 18:35:16 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781bf6asm411699a12.44.2025.05.01.18.35.14
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 18:35:15 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso2236607a12.1
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 18:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTHOItIrXaFrDbIE+vkuGIcw1QGyQsSkBRTF69sYwe1eJUNT3E+teQAmniHK9ZiIQK3+Ow@lists.linux.dev
X-Received: by 2002:a05:6402:3806:b0:5f4:35c4:a935 with SMTP id
 4fb4d7f45d1cf-5fa788ade3emr571279a12.21.1746149713941; Thu, 01 May 2025
 18:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com> <20250502012449.GA1744689@ax162>
In-Reply-To: <20250502012449.GA1744689@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 18:34:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
X-Gm-Features: ATxdqUH6AO9B4IM6TzOpfLne5kIG1EGNzVEfwRIWeNnmYRyNorzVe6ZE38sDwtI
Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 18:24, Nathan Chancellor <nathan@kernel.org> wrote:
>
> but '= {0}' appears to work: https://godbolt.org/z/x7eae5vex
>
> If using that instead upsets sparse still, then I can just abandon this
> change and update the other patch to disable -Wdefault-const-init-unsafe
> altogether (

The "= { 0 }" form makes sparse unhappy for a different reason:

       void *a = { 0 };

makes sparse (correctly) complain about the use of '0' for 'NULL'.

    warning: Using plain integer as NULL pointer

and gcc has also finally adopted that warning for braindamage:

    warning: zero as null pointer constant [-Wzero-as-null-pointer-constant]

although it's not on by default (and apparently we've never enabled it
for the kernel - although we really should).

sparse has complained about this since day one, because I personally
find the "plain 0 as NULL" to be a complete BS mistake in the language
(that came from avoiding a keyword, not from some "design" reason),
and while it took C++ people three decades to figure that out, in the
end they did indeed figure it out.

In case anybody wonders why '0' is so broken for NULL, think stdarg.

But also think "Christ people, it's fundamental type safety!!%^%!!"

           Linus
