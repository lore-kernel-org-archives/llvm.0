Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380B365
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 06:04:15 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-06.nifty.com with ESMTP id 2A15wIsg024280
	for <llvm@lists.linux.dev>; Tue, 1 Nov 2022 14:58:18 +0900
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 2A15viwV013598
	for <llvm@lists.linux.dev>; Tue, 1 Nov 2022 14:57:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2A15viwV013598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1667282265;
	bh=gCNWBb2Eok8RLy3ONe6jfzn3xPMLs34Yqwb+SBG6Glw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D+mq7Rhu/EH63zPTFNBDJZL5CdYxdPyLmxD/bi3q+5UT3u5QtlFu3E01kKBxaXeij
	 MlK9kO8VB0s/Z//f9nboSrEvTkB8NVgsVcaxka57DPRbHyeVpjctVWychs0F7/2BvV
	 Ab5cjUn2t7IMwy1I6TsCxSobnB0qcDZRsP/hxAaWaDOto4mtGTd0GlNh2NsJWZKbmf
	 m4c3LuA6q/1LI6v/j9aMMmjCjxgm86QddRn8inU7ekmuNqZ1IjiOEGHlv+6Kp2odQ7
	 gW3o5fPM5CQjtS/9Y4pOSVAPUvyrGEKeumgQcmGSJAK0Qwg8SsOkdsBSGqeLdpHONC
	 xtrSr/Ux1PhJw==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id v81so6302184oie.5
        for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 22:57:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf0V9SsZSf/TbOxQ77YXqVpAUmXXhaiRo8I6hMfrDFM0+DcZgwGu
	CMbRXloFKx1qCmYN9Yj+CNk3LSN8DHqzHUBr9uk=
X-Google-Smtp-Source: AMsMyM7n8houcv2BWsa7QWJkxKzh5DKRqrh/PWmVCfZXKXtJA6KJU0/z+oQhzFQ2OKyMwHbCqc0ovVYaYJ3FTsTm2hI=
X-Received: by 2002:a05:6808:1893:b0:359:f7c7:1caf with SMTP id
 bi19-20020a056808189300b00359f7c71cafmr6481270oib.194.1667282263919; Mon, 31
 Oct 2022 22:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221020175655.1660864-1-ndesaulniers@google.com>
 <Y1GV9sHyODVmBbFW@dev-arch.thelio-3990X> <CA+icZUW2tFR=xjJEXJDNARW1yd_vjOOA1etF6aMN3Cx5ReFgmg@mail.gmail.com>
 <CAKwvOdn_mP8kVn5Bhe7bbC8R+VZxr8h02yWwKhvaTHW40ZJ_Uw@mail.gmail.com> <CAKwvOdkNBM2-pMm+fqzXpMxL5745p0Gzmw_+--P8RSqTk=v+VQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkNBM2-pMm+fqzXpMxL5745p0Gzmw_+--P8RSqTk=v+VQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Nov 2022 14:57:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrBDSLqBZFmWr5RA542pUVR=mieUSNVYXy8thkHS6w_A@mail.gmail.com>
Message-ID: <CAK7LNATrBDSLqBZFmWr5RA542pUVR=mieUSNVYXy8thkHS6w_A@mail.gmail.com>
Subject: Re: [PATCH] Makefile.debug: support for -gz=zstd
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>,
        Sedat Dilek <sedat.dilek@dhl.com>,
        Michal Marek <michal.lkml@markovi.net>, Nick Terrell <terrelln@fb.com>,
        Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Miguel Ojeda <ojeda@kernel.org>, Isabella Basso <isabbasso@riseup.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, sedat.dilek@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 3:49 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Mon, Oct 24, 2022 at 10:44 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sun, Oct 23, 2022 at 8:46 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > On Thu, Oct 20, 2022 at 10:56:49AM -0700, Nick Desaulniers wrote:
> > > > > +config DEBUG_INFO_UNCOMPRESSED
> > > > > +     bool "Don't compress debug information"
> > > > > +     help
> > > > > +       Don't compress debug info sections.
> > > > > +
> > > > >  config DEBUG_INFO_COMPRESSED
> > >
> > > Also, I prefer...
> > >
> > > DEBUG_INFO_COMPRESSED_NONE
> > > DEBUG_INFO_COMPRESSED_ZLIB
> > > DEBUG_INFO_COMPRESSED_ZSTD
> > >
> > > Following...
> > >
> > > $ ld.lld-16 -v
> > > Debian LLD 16.0.0 (compatible with GNU linkers)
> > >
> > > $ ld.lld-16 --help | grep compress-debug-sections
> > >  --compress-debug-sections=[none,zlib,zstd]
> >
> > It's a good suggestion, though I deliberately did not modify the
> > identifier used for the existing DEBUG_INFO_COMPRESSED.  No defconfigs
> > set DEBUG_INFO_COMPRESSED explicitly, but I think one issue with
> > changing the identifier of existing kconfigs is that upon upgrading to
> > newer kernel sources, if you run `make oldmodconfig` if you previously
> > had DEBUG_INFO_COMPRESSED=y, kconfig doesn't know that that option has
> > been renamed to DEBUG_INFO_COMPRESSED_ZLIB so it would be silently
> > disabled, and image sizes would increase due to uncompressed debug
> > info. That seems developer hostile.
> >
> > Masahiro, what are your thoughts on how to proceed? Should I change
> > the pre-existing Kconfig identifier, or "let sleeping dogs lie?"
>
> Hi Masahiro,
> What are your thoughts on the above?


We renamed CONFIG options from time to time.
We should strive to update in-tree defconfigs,
but we did not care about external users very much.
(we rely on "make oldconfig" showing new options
and asking users for their choice.)

So, I like Sedat's DEBUG_INFO_COMPRESSED_{ZLIB,ZSTD,NONE}.
(and it is consist with CONFIG_INITRAMFS_COMPRESSION_*)

-- 
Best Regards
Masahiro Yamada
