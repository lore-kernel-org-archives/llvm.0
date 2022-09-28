Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059EE5381
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 21:53:50 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so2790167pjh.3
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=d8AWbiSBxXrgrvwAoskxcicNPYKtAtvQ8eTNvx31A5tDj05HG3JYRAX8qf2vlcBFux
         Q1KTlPLAgoTxKVWu/nVzVOf7AiT7GTQhdNsUYqMxZ71hoxMdvb5Q9qsvn3yjzUg5VS4Z
         AeFBZtfNn12MoU7iIzQGkn5wjz+gaTpfVO1hEeE57+wJ12W7ze2a3aRKpnA8Lx9MTtIJ
         grbEUQMs3nxDSYRKy9B5Ov4jaMGgXhqeyepODAApSSchrz1BCHHbq4bwQtIzq5YjUq/5
         KGRlA9uTZis4skTF0coWa95GNfO6iWQbU6avtKMDiR8zb+dfBnXP+edrsxPOv/ezAxb2
         ZDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=ae4bY9bzwbMh+L93T3yWzk69hkga/jbfcRQC2jcGkdqmEq0tLsj7/TmJjOPQfzThGr
         FIG0A0HX8srNnBcbCd0PAZmrZaiYWiHTcmcOHxC4aNYwpWuImUQ9cozIfY0ZZWcQ7bLQ
         l0yDOswYUx4Vx4UvWufZEZwodbrHP2ezYODLq2ET7UA4MTz9S++ZJZ1q6goZGiRayT4e
         SUrtLc7NYcI3XFXURPkNS7GDBjqRcUhmZ1u5FsbyMGI/EHUL7P9c4mJnuezh4XQOOjrL
         C4H4YjJXSNfNRS2uBjnZkvfaDZHn+Yn1N/0ULz97cQIYKdf+VdXNkdqeJm+4CzR5cFva
         mvFQ==
X-Gm-Message-State: ACrzQf1tpSVWQZaFKBp+H9siOGVMELR/08pwmxjrn6C55wG5pXyQOCxu
	kyN+Fu0IYg9Oy3DxI62dyzLdbxq0mg8AEdqqqscYbA==
X-Google-Smtp-Source: AMsMyM6+V0RnFW83E4Yey5hPTG/WNDzcVaQZ9uZmK44iTcOwLQ3OpYQRTfUlegcvBrQLEHiPkA+P6skieEZazNbCnnA=
X-Received: by 2002:a17:90a:74c4:b0:203:336d:dd36 with SMTP id
 p4-20020a17090a74c400b00203336ddd36mr12421313pjl.107.1664402030259; Wed, 28
 Sep 2022 14:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org> <CAKwvOdmPLqX=oCwg43TYHj=tdoaU5OYc=bO906u=LeqcSrx+Dw@mail.gmail.com>
 <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
In-Reply-To: <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 14:53:38 -0700
Message-ID: <CAKwvOdk87wRWoiVjswZPwoLbSm+sYsMW6FHZv+r6MHxLHn0Trw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, llvm@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 2:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Sep 28, 2022 at 02:13:47PM -0700, Nick Desaulniers wrote:
> > Reraising my concern from
> > https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1258678969
>
> Sorry, I thought I addressed your concern with my comment right below it
> but I probably should have worded it better.

No, I just missed your point about other architectures.

> > We've put a fair amount of work into getting CC=clang LLVM_IAS=0 to
> > work for DWARF v5 (both on the GNU binutils side, and Kbuild), I'd
> > hate to see that effectively knee-capped because of an issue in GNU
> > binutils that is only relevant for one architecture.
>
> Sure, that is a completely reasonable concern. However...
>
> > I'd concede support for ARCH=riscv, but not for all other
> > architectures, which this effectively does.
>
> No, it does not, CONFIG_AS_HAS_NON_CONST_LEB128 can still be enabled
> when GNU as supports this construct for a particular architecture; as
> far as I can tell, RISC-V is the only one that doesn't. See the tests
> with ARCH=arm64 and ARCH=x86_64 compared with ARCH=riscv below.

Ah, sorry for the noise then. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
