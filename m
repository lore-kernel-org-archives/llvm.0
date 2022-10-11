Received: from condef-05.nifty.com (condef-05.nifty.com [202.248.20.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4913C32
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 17:09:33 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-05.nifty.com with ESMTP id 29BH3SWB030573
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 02:03:28 +0900
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 29BH3Acj006785
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 02:03:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 29BH3Acj006785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665507791;
	bh=jTdnNEbZqROx00fEcB0iHuyEJaBWdVHynTGvE9aGH6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HbGHoh0lmJaEk1JQf533TfgIsvb0et8BoUYi915JOHMUOLnOIJRzA3E+s/+Ko+sSa
	 hJmUa7IpjxtMB/QDNCzUrBEgyF3znejZGyIz6HnE8tr/kOII+l68wZsQzYk8AOLZk0
	 Y/Bb6u9ZG6Rv48Eab7A3TlrjKPigGaPsKVU6OpHUIT06Y1t06ToX47JN0HjTPVeVZp
	 6y28ICfE9Ue+TOx/sgRwTyqE1Wj7pkWnfH11muBvGt9Q7XzxBjT7m9uq6HOVLUtGpR
	 kVknkrKILIC9yzYUss4N8gfL25imV3k6zviB0z2byHVZ5WGjK/v6Sl5Nk4vIc+bMY1
	 1VHnJVoZS4VKQ==
X-Nifty-SrcIP: [209.85.161.42]
Received: by mail-oo1-f42.google.com with SMTP id c17-20020a4aa4d1000000b0047653e7c5f3so10497871oom.1
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 10:03:10 -0700 (PDT)
X-Gm-Message-State: ACrzQf1usNIrE34voUTpHacsP8mDuvTU23AD0ZJIL9yWUiwZKmzNjMIB
	hA1/+T0qLUP5xTJC5WjfAh5Z8WfanWkdHAxR/Kw=
X-Google-Smtp-Source: AMsMyM75hvTFtbuimxDA6m9fRmoFNWKNX/W8y3QilQSqAN5t4L/BrgAgLfccLylWXZqq0BMYs6A2WLP5QpXDJi0kKAA=
X-Received: by 2002:a05:6830:3115:b0:658:ea61:249c with SMTP id
 b21-20020a056830311500b00658ea61249cmr11488919ots.225.1665507789684; Tue, 11
 Oct 2022 10:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011031843.960217-1-masahiroy@kernel.org> <CANiq72k9wAVCbHKVZFE=E3xv+2ZamUMsJ=uV43NxsSUQ4wXGdw@mail.gmail.com>
 <CAK7LNASP74qJ5fjjcVYcw4CyZ1psPnnyzLHsUu0b+MxLq-W1eQ@mail.gmail.com>
In-Reply-To: <CAK7LNASP74qJ5fjjcVYcw4CyZ1psPnnyzLHsUu0b+MxLq-W1eQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Oct 2022 02:02:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3VMaZ2epwRuZt3dKCH434iKmrVnzBNxZ1ktbeTUaWWw@mail.gmail.com>
Message-ID: <CAK7LNAS3VMaZ2epwRuZt3dKCH434iKmrVnzBNxZ1ktbeTUaWWw@mail.gmail.com>
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

On Wed, Oct 12, 2022 at 1:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Oct 11, 2022 at 8:55 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Oct 11, 2022 at 5:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > >  include/linux/compiler-intel.h            |  34 -----
> > >  include/linux/compiler_types.h            |   2 -
> >
> > You can also remove a few lines from `compiler_attributes.h`:
> >
> >     * Optional: not supported by icc
> >
> > Thanks for this!
> >
> > Cheers,
> > Miguel
>
>
>
> Thanks.
>
>
> Maybe, we can drop #if ... #else ... #endif
> around __assume_aligned(a, ...), but I will leave it to you.
>
>
> I will just drop the comment lines for now.
> (Then, you will clean up compiler_attributes.h in the next cycle)
> Is this your expectation for v2 ?


Taking a look at the code, there is only one redundant #if.
So, I will clean up __assume_aligned() in v2.








-- 
Best Regards
Masahiro Yamada
