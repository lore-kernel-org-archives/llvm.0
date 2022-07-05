Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9057C
	for <llvm@lists.linux.dev>; Tue,  5 Jul 2022 06:05:42 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id l11so20032494ybu.13
        for <llvm@lists.linux.dev>; Mon, 04 Jul 2022 23:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nbyECK3263/RIOlKgtKBVow3c3mI3lDCcZ6/fs9YY58=;
        b=hUSvlWnsXGp49fhdQXPLiewzuIeH3gUpLWCml+qlfxHOvACIfZbvr6lsB201e8WSAi
         UwQK+Vci+BYYv853VVQkXU9pAUe0ry/wra4/twDbkFodaD0MJG5p1zycPrsb02IVaDG1
         PltFpOtfltb8XEvhn2NpnzTl1L+FL4ar9AGsv5jOxuZr49jIIoTrOFApr24g6KeUtlPV
         Kuj//wE/SJvvy2O8C5iYWp6exCPJtHyzjqWu64AC8zUKFgtF/v3Eenfbx7AKxOMd4PZS
         GGRE0QOXBl9n5PulF+SV69GscIEdlSK2m6BXA4INmNHptkmH3zKXQQdPpj8EISkbbOFk
         hBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nbyECK3263/RIOlKgtKBVow3c3mI3lDCcZ6/fs9YY58=;
        b=iBsqBIQpD4hxm1e1XthCOrWjzUktu9Pvll8O4t3fd7K1IJcCoTCNd3ydbLDBX3OnE/
         c5dD1ZZiD5VXDMb+Ekcfb70R6uMvg/xAnrwirrDKkgMZmNNODJc2xiG62q3d6V75pm+V
         xaYVQgJnJbWPlviuUnCoX3pV0bCfYU9e1540aOUZmX1DDvW4T/xGjS80IFGuG5L+mTY/
         d4RMiF2N7RSkJyyDM1QfK9V6zH9oQSMUo1uN7Jd9fjquQDszx/cRnjud2L4Gc6Pax3as
         eUBq38dxm5/vc1mISk+GpbzbyfpvoqpvXCzsoZm8n82ECmd6FTdTK9cJtpCrkhisuR+w
         p2Rw==
X-Gm-Message-State: AJIora9JkI3R2RcUietIHdaQto+25BRMTPe+J6gtGSeZF6T4/pXwaeKI
	bxPPWLIk/45Tr8UB9nvExFBM/Pk8VgYkOqBhEZA=
X-Google-Smtp-Source: AGRyM1sDgPankvWElsMSV8lRoPFYUbJgM7WBumAixEKK/3jPU65pIsxYEOanVPial5z8nYD2qd/+j1eVDIfJ/ncUvow=
X-Received: by 2002:a25:8d8d:0:b0:66d:e087:4f2c with SMTP id
 o13-20020a258d8d000000b0066de0874f2cmr22896512ybl.389.1657001141710; Mon, 04
 Jul 2022 23:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220704092605.19604-1-lukas.bulwahn@gmail.com> <YsMVuVBoCVWUawsq@linux.ibm.com>
In-Reply-To: <YsMVuVBoCVWUawsq@linux.ibm.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Jul 2022 08:05:31 +0200
Message-ID: <CAKXUXMwzKQxw7sbUaZ924PFwMjxZo5HrN4HetiL8ww6r5_OObQ@mail.gmail.com>
Subject: Re: [PATCH] secretmem: drop unneeded initialization in secretmem_file_create()
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev, kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 4, 2022 at 6:30 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Hi Lukas,
>
> On Mon, Jul 04, 2022 at 11:26:05AM +0200, Lukas Bulwahn wrote:
> > Drop the unneeded initialization of the local variable file in function
> > secretmem_file_create().
> >
> > No functional change and no change in the resulting object code.
> >
> > This unneeded initialization was already introduced with the introduction
> > of secretmem in commit 1507f51255c9 ("mm: introduce memfd_secret system
> > call to create "secret" memory areas"). This minor code-stylistic issue
> > was discovered as a dead store with clang-analyzer.
>
> You are right and in the current code the initialization is unneeded, but
> there's a pending patch that relies of this initialization:
>
> https://lore.kernel.org/all/Yr1jKwz2+SGxjcuW@kernel.org/
>
> Let's wait and see how that fix develops.
>

Agree. I will continue tracking the evolution of this function and
resend my patch if this patch above does not land in the next six
months. For now, this clean-up patch here can be ignored.

Lukas
