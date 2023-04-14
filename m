Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236C620
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 01:16:13 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id a13so17430894ybl.11
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 18:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1681434972; x=1684026972;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNHtFxDJlWhvI6wADsECZUb5iqPCc6WyyTDSQpHBCP4=;
        b=AGAi6TcUOpevNguQX5VZI/MKtP4++I+3zkSwEmzDDxo9XWXMyKlWljGtjFrMosS1ZO
         uZXXsmrdKYKfzjuq0gnJNKrjhb0bL2H08FOfpniz9xMFNPbB0Kz/VYjYRYAhzhD++4nX
         7nsMbZzLiTMhlpWhwuK0RE5X7x6rlS/J+nzxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681434972; x=1684026972;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNHtFxDJlWhvI6wADsECZUb5iqPCc6WyyTDSQpHBCP4=;
        b=iY90Zj5ElIHymv6yJXPHJO/nCeDMIGGWcRnqRWamGC0A2aTJ7h8pZHy8VxXmiNltW/
         5qr1hKVZtmEeDd2hcBrU9ahC0sScKOEIIiqKJLbggk2mnDNmyKGJS4EAJC0++JMYp++/
         c9Iu9IY2sgFYUJLtSZKBF0p/iJ4dPV1wddWfX3SSWrlzHZlpJorD3doFQFY7/fCH9DDs
         guFACpIDuha83L/C1Z3ZJQqvWPlLwWmygKnyYbUejXFn3hy7+XpM9IHtirpplRWxpx7a
         Ty7U7R73zj61y9W2OnHOtcD8egZaiLyL7aEPaFSTzH1dYCGNb20kB47w0F9twgJDDLD1
         UKxQ==
X-Gm-Message-State: AAQBX9d13zv/IkHP7CvGM7iG52uysZfvtqI1I46UI4aYChp86/fCxbOM
	diSOCwPn/7ZXoS5K9bCqSr5jDuabCRp/6Z1naDeUIA==
X-Google-Smtp-Source: AKy350YBgqABe4fGYo+miNAK99kHZ/f3+4+DfdFNgd+lcx14l03CYmKrb+CqtAAvVzGRZZ5T2JuDG/+utkawrPli0/8=
X-Received: by 2002:a25:748b:0:b0:b8f:6ab7:9328 with SMTP id
 p133-20020a25748b000000b00b8f6ab79328mr977997ybc.2.1681434972610; Thu, 13 Apr
 2023 18:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414005309.GA2198310@google.com> <CAEXW_YRm62XHtpw4Ubp7x3n9jZJNGezRp0ymOGbQ3e62mysz1w@mail.gmail.com>
In-Reply-To: <CAEXW_YRm62XHtpw4Ubp7x3n9jZJNGezRp0ymOGbQ3e62mysz1w@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 13 Apr 2023 21:16:01 -0400
Message-ID: <CAEXW_YRPk6Q92MTL7Bnr9kzJT=FHTAiEwxLU=vT+VP+TqPApew@mail.gmail.com>
Subject: Re: clangd cannot handle tree_nocb.h
To: rcu@vger.kernel.org, ndesaulniers@google.com, nathan@kernel.org, 
	trix@redhat.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 9:11=E2=80=AFPM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> Hello,
>
> One way to fix this could be to add this to the beginning of tree_nocb.h
>
> /* Make clangd understand tree_nocb.h */
> +#ifdef CLANGD_PARSER_ACTIVE
> +#define TREE_NOCB_H_CLANGD
> +#include "tree.c"
> +#endif
>
> And then at the end of tree.c, do this to prevent recursion:
> +#ifndef TREE_NOCB_H_CLANGD
>  #include "tree_nocb.h"
> -#include "tree_plugin.h"
> +#endif
> +#include "tree_plugin.h"
>
> Then in scripts/clang-tools/gen_compile_commands.py, we can just make
> it add "-DCLANGD_PARSER_ACTIVE" to all compile command entries in the
> JSON file.
>

Ah and even that will not fully work, because there is no entry for
tree_nocb.h in compile_commands.json to begin with :-(. However, that
also can be fixed. Here's how:

We can just add metadata to tree_nocb.h , something like:
/* clangd_infer_from: tree.c */

Then we make scripts/clang-tools/gen_compile_commands.py  duplicate
the compile command JSON entry for tree.c but for tree_nocb.h.

Lastly, we add -DDCLANGD_PARSER_ACTIVE to all entries (including the duplic=
ate).

 - Joel
