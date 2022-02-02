Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918D2F24
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 11:03:44 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id q204so24897005iod.8
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 03:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eSfvq8RBJI3skKqCpQ6Ck1/CfN/oj4KZbsyg9UC3y1Q=;
        b=IqowrhAdwp+8jZ/Ozz+5UOA10md6cUs52ruVveH1Sc10xql9IAuHjeqIKodns4LBLD
         /mR36mUCo0c9eHUalbVQbwdv1t4SMXqA77kMp3XCl6YLtB+qxW2vHNcM0Q8ks61eskHD
         C7t24sx/WvGqIkDFxnXBUxf18x0eKDvcFuhO2oSvEaZLmezo0NN7Bc5nxfUh5vljcjvh
         XT2JjaVHJFBGNPvy3/QUahQglb12ZmlPgw+UqwnJ0dAQMSkD1bTzHLDqr0W40V02G2Yl
         M6ZRSdJ0xNZjchJsTTxCe3JNia7BzE6IeKlLHmG6xRjohO6kWw9fh+/Qy/xqssa7G2QN
         1VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eSfvq8RBJI3skKqCpQ6Ck1/CfN/oj4KZbsyg9UC3y1Q=;
        b=6MApaOjY4rvl/evBjhE4zUsEzYUuFqXugD159ej5lwYeAAts4XfYJTF5iSqSD04lhI
         oZJjYGwy+eDqkVB2bncupO1hMw/QhpbrvHXqrqXFrvpyo2NEFlm6UmxuEZHiBIq6rh1f
         LCdMa5BAKhvEq9wf496iUSLHru0xeDhtHtTCXTWQHnWti6qEK91E764EkI1VV0WjP9u5
         vQ++pgZ/5Z4JNcblvI7a9GSlQo77GEH/q0aBcE+VrK2sDqVAy74yFBShsIUQ88z3bNgB
         g3o5Qre1jEa1MFp1g6d/EesALIYSmOwYTS4fkbtG5dPdoPK5PMF/USMYhceOkI5GcJeI
         5Y1A==
X-Gm-Message-State: AOAM533e9Uj+/AQbqBENC1pSI6tQ2SZGv+kd1qu5q3EAS9skTfDmdRjK
	qdq9PUmQRNe3Ix6ScjW5NxBAi6JBGpTHcUX6wxs=
X-Google-Smtp-Source: ABdhPJz9fQw9eBSXaNvzBKPtdRYkvl8oct0t5msyOZRWGIIxam54hhp5IcH0iHCAno35FFWzDr+2jPXGnNnCoz61gEE=
X-Received: by 2002:a05:6638:4105:: with SMTP id ay5mr15624212jab.186.1643799823768;
 Wed, 02 Feb 2022 03:03:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20220202102147.326672-1-linux@rasmusvillemoes.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Feb 2022 12:03:32 +0100
Message-ID: <CANiq72nCq9ACEpni=ieOTzmwv25Ca1RkS8yScwa2B=VddKB5aw@mail.gmail.com>
Subject: Re: [PATCH] include: drop pointless __compiler_offsetof indirection
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 11:21 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> (1) compiler_types.h is unconditionally included via an -include
> flag (see scripts/Makefile.lib), and it defines __compiler_offsetof
> unconditionally. So testing for definedness of __compiler_offsetof is
> mostly pointless.

Sounds good to me.

By the way, there are a bunch of `#include <linux/compiler_types.h>`
around that could be removed.

> (2) Every relevant compiler provides __builtin_offsetof (even sparse

Indeed, even GCC 4.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
