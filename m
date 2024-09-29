Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B414A61B
	for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727624165; cv=none; b=ljx/tozXRotXEM7HR+8gmgA69fJc4k3NksOlUTyMNYijpGFGaHxC7iRHFqB5QJMGwFOYHcMBm/Zr8yN1XzgDUDsSnr5yg0UuTHkStC4zEpdwCJBlbR1o1ECIGfP3JEAj2w0YGMU16+FMKUkdehZFiCqnVu5ZJ5Ul1P54eK7kUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727624165; c=relaxed/simple;
	bh=Z24+oNbwDBYDjUFeXrH3yiHjyPp8DkpOlh8f85DEeEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRoLnSn+BV4PV2DR5YxkqccC4YwxorKiX9VUyiTW1q6UIrkBxmAbSOL9/WWn1P1gggxkn6SEFTjOCyQgQP2Hvp/jgtKgENWXGrGbdgqaJ2Tilzhpqi++NFASFJFtrPgRwk++yw2zFvpFnlGE552V/EmkKPRTPGUOPqncllTbK4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gLq9Rsqk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gLq9Rsqk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d2daa2262so412208766b.1
        for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727624162; x=1728228962; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7aEO2yZHG3E/MlCpO8gpWwrr+WlYuH7Zy33FEPXBtWU=;
        b=gLq9RsqkKEsYOL1mH3uKHsuQGnzv+CJb6TrwmEAjiZrbk53yMvDwgVWjcQoPPm+LUp
         1DdJlu0pTQF8raSaWkLXNWfD1WcYLQ5WvYCapnj3iO+PubQQ8ZpavqnLijeQ2CyOCkmP
         tAt8me0q3v/J4VC971TBmAtTAAm0lL1JZkm1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727624162; x=1728228962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aEO2yZHG3E/MlCpO8gpWwrr+WlYuH7Zy33FEPXBtWU=;
        b=g+kASwLUM0FRh+MCvg4N3beYcHuJZWlwYG2y1NL1ekMcB9e1sdIwH4ZJz7//hAV2V1
         XTFjvgQ+bnWvJ9R5iY9bXU/UFu6XoGJakLaGiGOBEOz0xz071EjhceEXYNRUdAnfVWET
         GMBZ+WVyL/9licN6wvUn9J82E1de0jL0ZSJ0R9K5FzIXekGLn9+EZf0DawSUuVt+JxfZ
         R97pniLqaRgqSLP2ulWlNmehmWNpehzUX13Zup7CkVII5lzyhH/4TAfu7qgaN65hWZdd
         yPNwH475UQIGYmV/l5Gmt16lSguoHPWBxUmDte9WQGPerazHmCiJ/u1zHfzk+uztS9sJ
         mh1A==
X-Forwarded-Encrypted: i=1; AJvYcCUSkaeAUgQzsBwqi+QmfMZtc/KGohnmXFbMUxZYrIMbcNe9GIXPG8QYvQ5fCyL9RyQv+DA5@lists.linux.dev
X-Gm-Message-State: AOJu0YzydGcUYpoCP1zoab6w0ul1KeuWErlVD/cSR6/8AjrFvGteD81C
	0W29nQMYlvvL35nWlkBsGW8bAB7Efk1gbYVFhkVDIajVQCgtAbk0Op6/2vEj8GwPEMfa52gQp54
	Vn28=
X-Google-Smtp-Source: AGHT+IEXsVErl8C8qlHVmvEgGUfjG+1nwQg71g+BVelCqsTOeTyB3ayRcSmka9lJDJIYU1KGephUhg==
X-Received: by 2002:a17:907:7da7:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a93c48efd0fmr1106822666b.8.1727624162190;
        Sun, 29 Sep 2024 08:36:02 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299f99dsm389558466b.219.2024.09.29.08.36.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 08:36:01 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so578644366b.0
        for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 08:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4ibAN2N5wDRTERgmnPCoRY1be4BHmFbiSHl4iTrQv+9W3Uxv0KdQZ4P+JKB0ZCJJyp8JB@lists.linux.dev
X-Received: by 2002:a17:907:8692:b0:a8d:44a5:1c2f with SMTP id
 a640c23a62f3a-a93c48f089bmr904801366b.6.1727624160624; Sun, 29 Sep 2024
 08:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240928-fix-randstruct-modversions-kconfig-warning-v1-1-27d3edc8571e@kernel.org>
In-Reply-To: <20240928-fix-randstruct-modversions-kconfig-warning-v1-1-27d3edc8571e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Sep 2024 08:35:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdQ5TjbXX0D568GZebYnt5ZuhTW5-ffeim-aoyT9LnbA@mail.gmail.com>
Message-ID: <CAHk-=wgdQ5TjbXX0D568GZebYnt5ZuhTW5-ffeim-aoyT9LnbA@mail.gmail.com>
Subject: Re: [PATCH] hardening: Adjust dependencies in selection of MODVERSIONS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Sept 2024 at 11:13, Nathan Chancellor <nathan@kernel.org> wrote:
>
> MODVERSIONS recently grew a dependency on !COMPILE_TEST so that Rust
> could be more easily tested. However, this introduces a Kconfig warning
> when building allmodconfig with a clang version that supports RANDSTRUCT
> natively because RANDSTRUCT_FULL and RANDSTRUCT_PERFORMANCE select
> MODVERSIONS when MODULES is enabled, bypassing the !COMPILE_TEST
> dependency:

Argh. I should have checked, but I didn't think anybody would 'select'
MODVERSIONS.

That's such an odd thing to do in general, but I guess for RANDSTRUCT
it actually makes sense (since a plain version check is nonsensical).

Now that 'select' statement is truly crazy and another level of odd
duck, but I guess it still makes perfect sense ("give me the build
coverage, but this is never going to be run, so don't bother with
MODVERSIONS").

So Ack on the patch. And now I did check that there doesn't seem to be
anything else with odd MODVERSIONS Kconfig rules.

            Linus
