Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C6360
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 12:54:59 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-10.nifty.com with ESMTP id 27KCqXuf028646
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 21:52:33 +0900
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 27KCqOlP024100
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 21:52:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 27KCqOlP024100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1660999945;
	bh=GHahFXt4ioyW5MZu1ElfcdTptt6dVXg5M3W1/jxlxvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SOesfCmNwq9P6oJZf3lNhUjXIgx9FzAK8yaiBK0/AuOAOHropLavhP/npi3fmUgFG
	 FtvzPHZbdziK8ivUwLzPht7zOHnDYB/y+4IJGkEn387CyXIlF9OFOfBqTMuM9k9+Ei
	 W65+DMXjjrCTfT+RadTcHSe+2u6dLTQMmclaU0vRy6/CVmAN5VcXpErqtyjB/keNp4
	 l3Vy2zixqzWmdSJnuIDNMiXYRU/UV7UwNLxAhImo+rjvncmABiwx7QEwT/RVrLVNjn
	 6wY2nDoDKHzIMRl8XLm2AvB3ME9qoZ3Lj1SSaEwvopzULul6TzcihDob/NgdhK6CsJ
	 ceSmTFl/Gi1sA==
X-Nifty-SrcIP: [209.85.221.43]
Received: by mail-wr1-f43.google.com with SMTP id u14so7998181wrq.9
        for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 05:52:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo2Bqb3nLiXLN/fowZeD7TvidA5i73a+dz8KmmFN8FJg6Tnpi2j5
	fLAdliJBGNxOacRoQoKdSC7FE+GChSIklQDMxnk=
X-Google-Smtp-Source: AA6agR4wWnuB9XGAuI1WKA/jjk/uFVdV/ka150NMuJlMrDN+HuAKVcpPpy2YXZSHi6SBo5A1JSymTbR7DaCJ22EUSkQ=
X-Received: by 2002:a05:6000:1acb:b0:223:5de3:f8bf with SMTP id
 i11-20020a0560001acb00b002235de3f8bfmr6438282wry.691.1660999943314; Sat, 20
 Aug 2022 05:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <20220513113930.10488-3-masahiroy@kernel.org>
 <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
In-Reply-To: <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 20 Aug 2022 21:51:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKh4DrgSeN+E1r7xmh1YL6mwWL_g2zL-rz=NYuzXT1bA@mail.gmail.com>
Message-ID: <CAK7LNATKh4DrgSeN+E1r7xmh1YL6mwWL_g2zL-rz=NYuzXT1bA@mail.gmail.com>
Subject: Re: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2022 at 7:02 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
> Le 13/05/2022 =C3=A0 13:39, Masahiro Yamada a =C3=A9crit :
> > include/{linux,asm-generic}/export.h defines a weak symbol, __crc_*
> > as a placeholder.
> >
> > Genksyms writes the version CRCs into the linker script, which will be
> > used for filling the __crc_* symbols. The linker script format depends
> > on CONFIG_MODULE_REL_CRCS. If it is enabled, __crc_* holds the offset
> > to the reference of CRC.
> >
> > It is time to get rid of this complexity.
> >
> > Now that modpost parses text files (.*.cmd) to collect all the CRCs,
> > it can generate C code that will be linked to the vmlinux or modules.
> >
> > Generate a new C file, .vmlinux.export.c, which contains the CRCs of
> > symbols exported by vmlinux. It is compiled and linked to vmlinux in
> > scripts/link-vmlinux.sh.
> >
> > Put the CRCs of symbols exported by modules into the existing *.mod.c
> > files. No additional build step is needed for modules. As before,
> > *.mod.c are compiled and linked to *.ko in scripts/Makefile.modfinal.
> >
> > No linker magic is used here. The new C implementation works in the
> > same way, whether CONFIG_RELOCATABLE is enabled or not.
> > CONFIG_MODULE_REL_CRCS is no longer needed.
> >
> > Previously, Kbuild invoked additional $(LD) to update the CRCs in
> > objects, but this step is unneeded too.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nicolas Schier <nicolas@fjasle.eu>
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>
> Problem with v6.0-rc1
> Problem with v5.19
> No problem with v5.18
>
> Bisected to 7b4537199a4a ("kbuild: link symbol CRCs at final link,
> removing CONFIG_MODULE_REL_CRCS")
>
> The above patch leads to the following problem building
> mpc85xx_defconfig + CONFIG_RELOCATABLE



Is this because the relocation implementation on ppc is incomplete?
(and is it the reason why relock_check.sh exists?)

arch/powerpc/kernel/reloc_32.S does not support R_PPC_UADDR32


--=20
Best Regards
Masahiro Yamada
