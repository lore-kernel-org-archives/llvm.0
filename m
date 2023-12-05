Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A96E589
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2KvpB9Ql"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3333074512bso58962f8f.1
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 13:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701812401; x=1702417201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kbHlqbkhYwBbDQLJMz0TJVKvZVaLjuc/LRCzX5dlF4=;
        b=2KvpB9QlNf8mRQgUT8PWn1I5SbH3TZk3Jq8H49YJWG47pK7Or/yu+o/bcifyLk6vWS
         a9tacPEJLV09J57jU/671qzZPy7hMEtD8fNOVZkxuinuhrbYA+o8kxhMSf+ui9GlzNkj
         R+YUL2/4HRZLo7X0oU5FWAO1IcubuFyFf76gnBn32kXgj+PqqhbpKFFy+w03ponUO7aO
         9kPSHuWSJvG27xkNp4z4Kwevu/nTc1Gy+u4eEuwX+MTvnmC29m4/3TbcVjVtfcOv3xPD
         bBYXvwiUMJSP8F5NtCbnHi4oSGlFwhSzENBsyG0UZcXnOU/IwOXX6z5tMPbHnwLLO/wd
         BtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812401; x=1702417201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kbHlqbkhYwBbDQLJMz0TJVKvZVaLjuc/LRCzX5dlF4=;
        b=gX5qrueiKqmV2G/m/u7GQtxnHPO47eEEaE21LPDCNWO2BRMjNoxhJM0bX4zrmJ5YDD
         2rpwokvEMdf4VDW5OKoWeH0MkPgh+8KxVT8454bXbIW7AX9mrCgxXWJ/4Qe+Cb7+5SBu
         OenmwoeSKmo2+zYU00PI6S2dHm/717dzrqhS0Gv2LLseMHjnrc0VGMzzH7nKAmoLiBgt
         SZ1wQEPQlfbq2cJoOO8mEb1mc61GrsQeIHKPBJzwKz7lhpcnhfC0LTWMThs3yEhnkbk9
         VrjcjKdTyZax/gb0ArqxV7QAgeYIB5XoXtYCcKjnV3PIG8tHNptxHHFYQPnEK+X+Ti/F
         l2rg==
X-Gm-Message-State: AOJu0YyBAHRUD+vEb0RGKX3nlH3bbrq4m1wW7A4bmk8vSX9UMIU6Mtlv
	hyVW9B6cNVm11dUT04XXf1PomOAwHI/PAD8Kdhp3DA==
X-Google-Smtp-Source: AGHT+IGMn79dOXEc4cRtYoqKYziKCkAseM49c6cHdzYaoWCqgxNOZ+I1/FwkoTDwVqORs0jMTHot/e41TNqNF/jcYS4=
X-Received: by 2002:adf:ea4a:0:b0:333:3b79:27d7 with SMTP id
 j10-20020adfea4a000000b003333b7927d7mr1299396wrn.59.1701812401438; Tue, 05
 Dec 2023 13:40:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
 <CAKwvOdn+VTM+LY6ALcgaZTL57JpiKt5rBPMSPNXsgS3MCENhDQ@mail.gmail.com> <20231205132452.418722bea8f6878dca88142a@linux-foundation.org>
In-Reply-To: <20231205132452.418722bea8f6878dca88142a@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 13:39:47 -0800
Message-ID: <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tanzirh@google.com, Kees Cook <keescook@chromium.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:24=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 5 Dec 2023 13:14:16 -0800 Nick Desaulniers <ndesaulniers@google.c=
om> wrote:
>
> > >
> > > The preferred way to import bit-fiddling stuff is to include
> > > <linux/bits.h>.  Under the hood this may include asm/bitsperlong.h.  =
Or
> > > it may not, depending on Kconfig settings (particularly architecture)=
.
> > >
> >
> > Just triple checking my understanding; it looks like
> > include/linux/bits.h unconditionally includes asm/bitsperlong.h (which
> > is implemented per arch) most of which seem to include
> > asm-generic/bitsperlong.h.
> >
> > include/linux/bits.h also defines a few macros (BIT_MASK, BIT_WORD,
> > BITS_PER_BYTE, GENMASK, etc).  If lib/string.c is not using any of
> > those, why can't we go straight to #including asm/bitsperlong.h?  That
> > should resolve to the arch specific impl which may include
> > asm-generic/bitsperlong.h?
>
> It's just a general rule.  If the higher-level include is present, use
> that.  Because of the above, plus I guess things might change in the
> future.

Hmm...how does one know that linux/bits.h is the higher-level include
of asm/bitsperlong.h?

Do we mention these conventions anywhere under Documentation?

>
> We've been getting better about irregular asm/include files.
>
> But bits.h is a poor example.  A better case to study is spinlock.h.
> If this tool recommended including asm/spinlock.h then that won't work
> on any architecture which doesn't implement SMP (there is no
> arch/nios2/include/asm/spinlock.h).

The tooling Tanzir is working on does wrap IWYU, and does support such
mapping (of 'low level' to 'high level' headers; more so, if it
recommends X you can override to suggest Y instead).

arch/nios/ also doesn't provide a bug.h, which this patch is
suggesting we include directly.  I guess the same goes for
asm/rwonce.h.

--=20
Thanks,
~Nick Desaulniers
