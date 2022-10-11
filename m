Received: from condef-08.nifty.com (condef-08.nifty.com [202.248.20.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C773C32
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 16:59:22 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-08.nifty.com with ESMTP id 29BGrT1g017610
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 01:53:29 +0900
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 29BGr4UG006654
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 01:53:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 29BGr4UG006654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665507185;
	bh=f8HvnuVAteWRI5ncBuuE0MgQLi5Hb1h+j3HTVM2jcno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qf8UL9ba1bhUo0chFLLB20TY56gnxZVwRMDNLwKGRx5d8SBtKu723evzOB1ogKA54
	 MCsmRZgqE4FtDWOTviTId/6CU4JJl6ENThC45ijm8cy2RogCD8v/PNpFzNx8mG0L46
	 lbWzNeelzbfNAeKbEolTII7gQdBVawu/+xMtL7vigjAu3XPZuYYt8oKFhswWK0KHuf
	 Oj4P8BZdP81GOX1vLa71zZGvb0tPxgRmpUjfFUFiw/3/alI+bKqPBzB445m2aCCmcG
	 9a/5PQ/3ElYCrySigHsvHQXx/Bd6aVLDUpIUNVxigUVZAjtkb2P8w20bSID/79Iug6
	 WELXf5efwYahA==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id w196so10136394oiw.8
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 09:53:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf1uKcD2md+aZhJ3nmryatmIH9FNW3I3uMVPzIaNXGP10Z9bi1Oq
	renG5eAsbz8qbwPqP7F+pXOoPS/mQp/en6RP0KQ=
X-Google-Smtp-Source: AMsMyM60Tso+KMnUhy3DtJsunnEn/q5/4uBQ3277fO82D6ZNQB96rIUQqv8lGiPwNNRorBX3UApuHH5XmivLJygZy+I=
X-Received: by 2002:aca:bbd4:0:b0:353:f167:6fd3 with SMTP id
 l203-20020acabbd4000000b00353f1676fd3mr945oif.287.1665507183814; Tue, 11 Oct
 2022 09:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011031843.960217-1-masahiroy@kernel.org> <CANiq72k9wAVCbHKVZFE=E3xv+2ZamUMsJ=uV43NxsSUQ4wXGdw@mail.gmail.com>
In-Reply-To: <CANiq72k9wAVCbHKVZFE=E3xv+2ZamUMsJ=uV43NxsSUQ4wXGdw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Oct 2022 01:52:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASP74qJ5fjjcVYcw4CyZ1psPnnyzLHsUu0b+MxLq-W1eQ@mail.gmail.com>
Message-ID: <CAK7LNASP74qJ5fjjcVYcw4CyZ1psPnnyzLHsUu0b+MxLq-W1eQ@mail.gmail.com>
Subject: Re: [RFC PATCH] Remove Intel compiler support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-ia64@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Robert Moore <robert.moore@intel.com>, Tom Rix <trix@redhat.com>,
        devel@acpica.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 8:55 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 11, 2022 at 5:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> >  include/linux/compiler-intel.h            |  34 -----
> >  include/linux/compiler_types.h            |   2 -
>
> You can also remove a few lines from `compiler_attributes.h`:
>
>     * Optional: not supported by icc
>
> Thanks for this!
>
> Cheers,
> Miguel



Thanks.


Maybe, we can drop #if ... #else ... #endif
around __assume_aligned(a, ...), but I will leave it to you.


I will just drop the comment lines for now.
(Then, you will clean up compiler_attributes.h in the next cycle)
Is this your expectation for v2 ?




-- 
Best Regards
Masahiro Yamada
