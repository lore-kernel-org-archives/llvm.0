Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32512245012
	for <llvm@lists.linux.dev>; Tue,  5 Aug 2025 08:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754381592; cv=none; b=BugIAbE2EtAtqEpv9z6d0ngKypXc+NZNyu5z7nEzhNbwy00PeYxsgSVejdg7uAJ2ycwFqet7Ksd6wPv/4TOlJMZ8tjFJxo7FcQbHgjE3K9Avv6pcC72+Gv6yCH/SNGy7hgW8XJGNtK9fS1AH1Okyt3EZAlK/H0krm3fbPNGukBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754381592; c=relaxed/simple;
	bh=XY5X8rTqj6KCB7z+WOowtTK7MrFk016Y1kqMLEFIi1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6TYyb/RAPe6Xpt/mLNhEKMOSOWb6HY8GtS8UOTmQea6+PTuQ+/cutLwAT76VvC+S+uG2IfkOwlZqM8Y6CbvdwVAXYZDF+W5sftg0xg0/fY4/Pt3MAvgq2SCEFne970xE4yMQApNYpA9XnCB1k1C22PkmxH2Tj4uMH1E/0biR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88bbfe763ecso1192592241.3
        for <llvm@lists.linux.dev>; Tue, 05 Aug 2025 01:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381589; x=1754986389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYbREyEF6GDi+6BqzkUaervyY8mSRtfMj7JERduR6Tc=;
        b=JM/sncUQ38h6op8Q+kBZgBlQ6eqfn4FmfENN9CKdeCLpdC2KXZWESVdTAUSX7HfP4y
         foqQwt4hsxegCLiP2imwvEhETsD0sI2Ct70QnwOk4vbqT+aW4OuRaLiJSlhtASO47exu
         ZUc1MJvbAzR6taowVDtQAq49T6ZZf8qWOwnE60d8JUW7SrtY3kGtEOY+QwD1o7rqB5Pw
         IK9Mn/3pgyu1izkOYKEPMqXI9pPXLCp1ejHTV6xb5S7gn81wOSTnPuobYUhDhBbQ9ldg
         kc8cPL4Bdoot90owdmrP70qbq29tDikYg3tdw6hcKG2rht+hmOlNJGlX3FhdRM42+z3l
         lIdg==
X-Forwarded-Encrypted: i=1; AJvYcCUSYiYatdf0BDamIWudgY2hKTi+BKd5H0kE4gc34tV3ikcExCZieY8cRqoaOn8uvPXlKAwu@lists.linux.dev
X-Gm-Message-State: AOJu0YxXNfUCFgr4dvAJ0Vaf1h4brKE03Gj0UG4Mxjzvz/qcXrKvwkjk
	49xl/pinPOh27W9kP0hRJvc93PQNUY//qGPmDsMKRPBkoNlNL09rKXKp+DoZGozf
X-Gm-Gg: ASbGncvqEZgfTxx4kaEi5MBU8M8s5WuN8mypR4ifzmEJSjb6ij06OoM0P/YDYT8/aqN
	950lFKTyxKKWmxEVsJ02yf25RCTM2F7GST2J+dtlxQwbaezZ7FAcOP4bWQD+nyk74/RVRvWiBN4
	tnKk0FL2OtGpOJB39YQRbotZhxXhif4z2DTo8P+Tj9+jI8rykE9k6etAx785zYGEwbeWXxyaV3n
	gCX3DkSBDO99POu+mrUULKyBLYUddoD06x4ZGs4RHA1MPrLLDGIp/bZga9DZ761LgFQgejUdoFV
	UY5Wia5gjNxdtHoX82Ounzdr39B8vLA9EF2zP3G7YyQkXD1oZKpHB7V1QC+PkL5uWzXMhU9kTcU
	hykPwNrhAfMO3iaIvIrCuQGulz+Af9zXew7tWf0lBOekkFC6wghAEWSDFpfw3
X-Google-Smtp-Source: AGHT+IHu1B5tHV3AGeZiM5RAj6PNLOfo2hohPzWmA3T05nOBf3cHIYpOvOMGgxvmRLmn1I5NaC94Jw==
X-Received: by 2002:a05:6102:80a2:b0:4e9:b0ec:9682 with SMTP id ada2fe7eead31-4fdc480e68fmr5459319137.24.1754381588757;
        Tue, 05 Aug 2025 01:13:08 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3f016dsm2687417241.15.2025.08.05.01.13.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:13:08 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-88bc6ab70dfso1180945241.2
        for <llvm@lists.linux.dev>; Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL0N8nUL7t6l6ArgRQuEnBsoD+HOPHuLrR9nENJF9HiTiTqFdrcrUcVDL2epuq8VhpcenM@lists.linux.dev
X-Received: by 2002:a05:6102:3a0b:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4fdc480dc77mr4806207137.21.1754381587163; Tue, 05 Aug 2025
 01:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804163910.work.929-kees@kernel.org> <20250804164417.1612371-11-kees@kernel.org>
In-Reply-To: <20250804164417.1612371-11-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Aug 2025 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
X-Gm-Features: Ac12FXxoASDmKZziFEtov1BZOWBk9xds-hH6z1CBqhINtQO4YVRNUk0c1YQzJUM
Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
Subject: Re: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 18:44, Kees Cook <kees@kernel.org> wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> Add missing __attribute_const__ annotations to M68K's implementations
> of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
> pure mathematical functions that always return the same result for
> the same input with no side effects, making them eligible for compiler
> optimization.
>
> Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

# ffs: pass:9 fail:0 skip:0 total:9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
