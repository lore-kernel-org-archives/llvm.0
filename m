Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58A22C9D
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 23:20:43 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id o184so3076943iof.6
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jNypcQ3g46vmyczh20V/ouVF+9k+n33GgxhxhlzFVM=;
        b=gvLhpdKxPC6iwHPEJovrdC25s1Xkr0T/NWrCWtB8EbloRE/Xb0iJkimz4y4Ed/z0hj
         3LhCG4I6uXVJzLJTln3ti71Tbw+PNSdu4L9dGmaAOUTWjDXDBAfkx4L8puGiHGNrga5q
         Hlg/R6yZLsbBh3+1Kav06LiS+f8LZRBZeLqJZiCMgYVVOHr/wXqvWSrs646YKocjJKyg
         0iegnF86bYAZkqWeoFghejBf/bMZsKi8sm/2asXu6OTpzsLZe/wwRyXIEinekexp46iV
         nSds7P1E2lpX2vRLee9FpPlgQn+oRJBJ8DwMFCa3aS4Hge2ttzP2uJs/7JoRswbq1yXP
         H56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jNypcQ3g46vmyczh20V/ouVF+9k+n33GgxhxhlzFVM=;
        b=sZrr03VM/0dgaEp+28ehf9Vxeo50zQX1Rtyh48sqjM25Wq5CUxGhdzEUD1MfLsADgS
         R2zvzWZ5iS/DkRxtyuwzI7lONAAqYcwl9zOS9mTh3hQWRUy8u7BbvoTLdJuo9oxEuuuo
         Jotj7EgR8+EJ9hjPjFQlZbkXaXrO6H7PBW/9J6QwTZUmme/9HcNlIOYvx1q5YChVVJ/A
         sVi68DEuOu28JCHaf0oE3YNoGbb3DFyvZ0VyBGR9/TM/+NlALouwO5+hS5Vp/+jpqS/M
         U+pCm7qd1I0RB5yrBnlqPC5l8Vghduoc9Dz3vE/hSMiS55+6uDwOFAMvpJOoSOGh5nQO
         fxSQ==
X-Gm-Message-State: AOAM533SFeBUUVKgMGDqUS8fQ8CyVknsonzItynsuB4s+KeZhefA33Qm
	VukYLWM9p32mH8e5PW0iSerzvu2GjDTDOZUZYUU=
X-Google-Smtp-Source: ABdhPJxR0AL0rRRUd73R0Y//e7pMjn6qgr02pg7gORQBCRpaAMGu2LYd5ukL9iH/j/Iz+QYHtvEF2O1tOzF2kffAyKw=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr6276236iow.172.1634858442817;
 Thu, 21 Oct 2021 16:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org>
In-Reply-To: <20211014132331.GA4811@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 22 Oct 2021 01:20:31 +0200
Message-ID: <CANiq72kJQ9JBifggdMad6yLyc9YFuqZnQ2Yahp3ieh=qZncq1g@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 3:25 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> `__compiletime_assert` declares a fake `extern` function
> which appears (to the compiler) to be called when the test fails.

Queuing this one through my tree.

Cheers,
Miguel
