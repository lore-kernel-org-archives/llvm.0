Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C45C96
	for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 17:47:11 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u15so466407oie.2
        for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 10:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YOIx3Gp+OOth7iTTSTnmRVvtuHwOIWSfbp7MBZ3lhr8=;
        b=ceHhsn9vxuGQt25KzxXHZksQqJdv+wXeDC9dgm/Be5N0xH074n4BNy4bxSmeJ5WMg6
         J1GutrjG75o0z+HoVCBr+DkpSYi+MccZTPWA15z/nRcoDKgfEhi/evz3jVvN6jRL34H+
         q8SAXttOdUgBUnbZQQwbsthuPlOU5DoAioYU3tSHxiKfAtFf03gChBwL3cIqMOKKkms7
         i4CAwjG1iTKCNXx/ql+3kr+muc7PFX+pJMVJTNIsgTT4LQPT8Va2mnYskG5f+jp5PBWH
         5Ns3zqHqihgUsJv9okTVUNrrdR2ajMudytIys3/e7gupi/va8FwsgRkeKvHIrWmBcYGn
         LvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOIx3Gp+OOth7iTTSTnmRVvtuHwOIWSfbp7MBZ3lhr8=;
        b=J2/o1QXLvS7eW3QrzIL7AKK6yJqOteIdmvZal5hsoAgIlgb8rivCUTuquhcAlfz4HF
         oErakB1HXWMQw1YfmnU1wV6UsawKmSchMQC+WWVoX0kgvTJmL064oB/Ktz3PRISkD+iO
         YJkPxmq+CNHrsCfzBfEJ7gUkiS4RYFrSJJ1CQ4DitPoQzwNmFaNh70NvaJSBhSPc4rk4
         BtiuXV+1Qn4DpNk6vI1ZFINRyVjoFu83exhguScroTO75Da27QEJ1Df1Uhda25tctf7A
         Na9w+8Crd8EHcmB5Qxkxfoi4Bxvd6aKYx9NvbcDilLrFmnqo025zUGdK/wGUqCXhnI7Q
         4/ww==
X-Gm-Message-State: ACrzQf1Y5pJGHCq14wRZ+bBie1ZTyYM8bfDAjInFPFFpA/Npm5+SHkUN
	GuiiV3CSmWATozrzDM0r3Gkch/jllJ92991ng3A=
X-Google-Smtp-Source: AMsMyM7uPjt1yjlFLRaDPeqL3b5RFJP0n+1456Mp5LpP/6RJfVA9PHEg90rIGRKgDpkV+98vbmMvFWcgQ1pknqu2CkY=
X-Received: by 2002:a05:6808:e8e:b0:34d:7829:135 with SMTP id
 k14-20020a0568080e8e00b0034d78290135mr7842845oil.252.1666288030741; Thu, 20
 Oct 2022 10:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DU0PR03MB8319B83F92372CA86A42C089F3289@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CABCJKue6M4cXyTP9wgaBx0oZ+5K7sQna9UQF88Pxcknv-kzcMg@mail.gmail.com>
 <DU0PR03MB83196C180979F74ABEEB0562F32A9@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CAKwvOdncRqrTNqmiDhtkj74V4eU03FBgDr25H4+npwHYgrYQRw@mail.gmail.com> <CAKwvOd=7GZfdmtAG2W3Tjo1sPUA0eGnXFpUPWHp-3WJOgVpDEg@mail.gmail.com>
In-Reply-To: <CAKwvOd=7GZfdmtAG2W3Tjo1sPUA0eGnXFpUPWHp-3WJOgVpDEg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 20 Oct 2022 19:46:34 +0200
Message-ID: <CA+icZUWKnw=eKZghzADQRse242dsx1WwGpF0hcSCUby_Wz7=QA@mail.gmail.com>
Subject: Re: Update15.x/kcfi to LLVM 15.0.3 (ZSTD + DWARFv5)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Sedat Dilek (DHL Supply Chain)" <sedat.dilek@dhl.com>, Fangrui Song <maskray@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 7:18 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Oct 20, 2022 at 9:56 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 10:44 PM Sedat Dilek (DHL Supply Chain)
> > <sedat.dilek@dhl.com> wrote:
> > >
> > > -----Urspr=C3=BCngliche Nachricht-----
> > > Von: Sami Tolvanen <samitolvanen@google.com>
> > > Gesendet: Dienstag, 18. Oktober 2022 18:00
> > > An: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
> > > Betreff: Re: Update15.x/kcfi to LLVM 15.0.3
> > >
> > > On Tue, Oct 18, 2022 at 4:54 AM Sedat Dilek (DHL Supply Chain) <sedat=
.dilek@dhl.com> wrote:
> > > >
> > > [ CC Nick + Fangrui ]
> > >
> > > You happen to know or use the ZSTD cmake-option (see [1] and [2]) - c=
ame in with changes post-15.0.2?
> > >
> > > AFAICS Fangrui Song had some patches to use ZSTD debug-compression wi=
th DWARFv5.
> > >
> > > Unsure, if that combination is now possible in v15.0.3 or is a featur=
e of LLVM-16.
> > >
> > > [3] says:
> > >
> > > [ lib/Kconfig.debug ]
> > >
> > > config DEBUG_INFO_COMPRESSED
> > >         bool "Compressed debugging information"
> > >         depends on $(cc-option,-gz=3Dzlib)
> > >         depends on $(ld-option,--compress-debug-sections=3Dzlib)
> > >         help
> > >           Compress the debug information using zlib.  Requires GCC 5.=
0+ or Clang
> > >           5.0+, binutils 2.26+, and zlib.
> > >
> > >           Users of dpkg-deb via scripts/package/builddeb may find an =
increase in
> > >           size of their debug .deb packages with this config set, due=
 to the
> > >           debug info being compressed with zlib, then the object file=
s being
> > >           recompressed with a different compression scheme. But this =
is still
> > >           preferable to setting $KDEB_COMPRESS to "none" which would =
be even
> > >           larger.
> > >
> > > I am interested in the equivalent changes to cc-option/ld-option with=
 ZSTD (usable with DWARFv5).
> >
> > Good idea.  It looks like there's still a blocker to using -gz=3Dzstd w=
ith clang:
> > $ clang -gz=3Dzstd -x c - < /dev/null
> > clang-16: warning: cannot compress debug sections (zstd not enabled)
> > [-Wdebug-compression-unavailable]
>
> PEBKAC
> $ sudo apt install libzstd-dev
> <rebuild clang>
>

Hi Nick,

Hehe, yes you need the ZSTD *-dev package on Debian.

Interesting:

"libzstd-dev: cmake file is unavailable"
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1020403

Looks like Clang-16+ is needed as well.

The WIP kernel patch looks promising.

Please, let me know after your rebuild of clang if it works OK not
only compile-tested but also debug-info is OK.

-Sedat-

> >
> > https://github.com/facebook/zstd/issues/3271
> >
> > Attaching a WIP patch.
> >
> > >
> > > Thanks.
> > >
> > > Best regards,
> > > -Sedat-
> > >
> > > [1] https://github.com/llvm/llvm-project/commit/6fba7854a2f0b6b3899bb=
156c1a0c4ae35c96e24
> > > [2] https://github.com/llvm/llvm-project/commit/b4840279846e1eea44c3d=
ca575395a90c9d77ca0
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/lib/Kconfig.debug#n315
> > > [4] https://metadata.ftp-master.debian.org/changelogs//main/l/llvm-to=
olchain-15/llvm-toolchain-15_15.0.3-1~exp1_changelog
> > >
> > >
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
