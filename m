Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15651119C
	for <llvm@lists.linux.dev>; Fri, 19 May 2023 17:18:52 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-623914a4bf0so10715446d6.3
        for <llvm@lists.linux.dev>; Fri, 19 May 2023 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684516731; x=1687108731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn3pb3ky6n4pf56znsEup8Qsq33kfGGXMaRQqXwj8cQ=;
        b=D6V9pK1t4iImlAC2FRJwK85sRgEGr9GCc93tSrL4yGcg/i0jXJUvPwh2xy21+sGumX
         GlhqAKNMehAfMqDLHxpItFXZROQXkRAHjZio6SMI0dlFdiH29CnbX4C32ic3ntopbf0x
         nf+rCqjxLoRTQoRztUmWQCYVkHQ426ySM/VmalxqVbawj+0WTJaRagQej49aodYpCHAb
         tl70Wc+72VnTbY3nT5qf6GH+yag2gf8yOEA41CLRS12RnePUzTFZuFWQs9iYMOxrK3ku
         57wThlub/XfaPsL2Jx8ZG0HGsTHuCxE5FxtgJkQChkMJzNbcndbHNjnJbUGY27/KLvzI
         /UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516731; x=1687108731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn3pb3ky6n4pf56znsEup8Qsq33kfGGXMaRQqXwj8cQ=;
        b=HIHKzZ+ViFIANJWpQER0Zje7sjIpuY0EVxzPmrS9oEoXuF2l5FLvySB4CEJ8b9d55g
         AX0Ee2n64V4ZGEFKfQUq9/rDuU7CF66g2ovuz/H6L+LeruLuthGZsQPYWEp3syIhHpGn
         PZ/eXhcwZCUthsJ/9NTBa6qfKD6qRd61kUDKBtqrJYtkNy/tr4gLcGP4YTFR2QpbC73i
         o4rjCQ8ieuz00YGciTov8ZlgtsZO+WrirayB2MhzcqxUpbT6Y22MQMu25U71McZnUrpB
         0SJVbKKAZM3cugHTQoNa/9gENiFx7toI3aXXkUg5CHCF2iNpJSR236TXot9FbUNuLzUV
         saOw==
X-Gm-Message-State: AC+VfDx10pE6MzRg/eblOiJvdVCx/MioRmDG+wGp7CvF1pF/7NI5e4KW
	Tm5oFsJuNwvzza9OZItSEXm8wwI47vU2p/EdvbwEMg==
X-Google-Smtp-Source: ACHHUZ6xwwhBbIjFEzoyEL/zh1GhlX7PmwlY/xtNyHdQa9LBAsq0Od/kzqiSqmzeNnOgl1Dc5KUtJMBBaqFLb68gcW8=
X-Received: by 2002:a05:6214:e6e:b0:623:9218:58e1 with SMTP id
 jz14-20020a0562140e6e00b00623921858e1mr6374017qvb.31.1684516731558; Fri, 19
 May 2023 10:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230412-no_stackp-v2-1-116f9fe4bbe7@google.com>
 <168440808395.404.16801982965854981978.tip-bot2@tip-bot2> <20230519171120.GA1939377@maniforge>
In-Reply-To: <20230519171120.GA1939377@maniforge>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 May 2023 10:18:40 -0700
Message-ID: <CAKwvOd=ywPnLS40HNUnXH1nqm3Ke3sMtomSgL+rVOoSjXvQB=A@mail.gmail.com>
Subject: Re: [tip: objtool/core] start_kernel: Add __no_stack_protector
 function attribute
To: void@manifault.com
Cc: linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 10:11=E2=80=AFAM David Vernet <void@manifault.com> =
wrote:
>
> On Thu, May 18, 2023 at 11:08:03AM -0000, tip-bot2 for ndesaulniers@googl=
e.com wrote:
> > The following commit has been merged into the objtool/core branch of ti=
p:
> >
> > Commit-ID:     514ca14ed5444b911de59ed3381dfd195d99fe4b
> > Gitweb:        https://git.kernel.org/tip/514ca14ed5444b911de59ed3381df=
d195d99fe4b
> > Author:        ndesaulniers@google.com <ndesaulniers@google.com>
> > AuthorDate:    Mon, 17 Apr 2023 15:00:05 -07:00
> > Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
>
> Hi Nick, Josh, Peter,
>
> Do you have an ETA for when this will make its way to Linus' tree?
> clang-17 built kernels have failed to boot since [0], so it would be
> nice to get this in sooner rather than later if possible.

David,
Can you confirm that your version of clang-17 is updated? clang-17 is
unreleased; ToT will become clang-17.

https://reviews.llvm.org/rGfc4494dffa5422b2be5442c235554e76bed79c8a
should have fixed any boot failures related to stack protectors.  That
is to say that Josh's series is irrelevant to anyone using either an
existing release of clang, or something closer to ToT than April 13.

LLVM commit fc4494dffa54 ("[StackProtector] don't check stack
protector before calling nounwind functions")
landed April 13, so please check that your build of clang-17 is after that =
date.

Either way, thanks for testing with clang, and the report. You can
always file a bug at our issue tracker:
https://github.com/ClangBuiltLinux/linux/issues or see our page for
more ways to get in touch:
https://clangbuiltlinux.github.io/
We're very active on our mailing list, and on IRC.

>
> [0]: https://lore.kernel.org/all/7194ed8a989a85b98d92e62df660f4a90435a723=
.1681342859.git.jpoimboe@kernel.org/
>
> Thanks,
> David



--=20
Thanks,
~Nick Desaulniers
