Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F697E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 00:48:00 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id m65so3008253vsc.1
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 17:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hxTBhCI0F5j/2VZXRiH27pSDCjgcW9IAx9MdqUjicTA=;
        b=pR0smMM+P4+BPyuL8kqpu+hfHMn3uKgzZOeKg9mikK3AiGbd0DWuHgG+Ra594j7mlA
         keOMF9a3Y46gU9rbxjugz3wWlG3T8QukRsf3y8Rfub8s5BCFL8nILhBJReOt4k0Ze/4f
         7j6gzOn5rU/1tMtEbAZpVPzWik3n5wsuI3/2D34KI4Mk4/sv1YIekuy9NHbKrejDL4eM
         JG4WPD1rj8LdelhXF7X/zzPKqfX3mE25wiGo9gBB6Q4637lCO/1A/H4yz+9lIzEryDVc
         ptvvZh3+MYf2U3to8X3w5gliceYUgwUFd2sOTcSUCGTLsRAEH1naWSPjYzDNVXDYY4am
         udgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hxTBhCI0F5j/2VZXRiH27pSDCjgcW9IAx9MdqUjicTA=;
        b=7u0rDwQ3iG/zOrnehmfJrx3O/Zr8uH3gaOuabpNuCMXZ+02pnumRvHv3wqdIPMxlp7
         x3k3ZH4tCRFA3nk8efp0RgpVkyT5dEHBKNrC/nzFRQfpa32oQafoctJnNPAbF3f8knz/
         eEFarpffj5fCjSPDZBBQo35qgzwA10cTfIJezTNRZ7mBu+yWe7ozhvs9pcKeAHtgNkiP
         nJtaknIPGe2lJt+lix/VeBLBwlATPtNCcVLCF0YSlDNApncBuSWqr1cmZvoMkUUmImXZ
         xM6b0iV+Q1wOQCBMRzbGcT4/jF9N/mmKSlOOcDZThfDFnaLAHZYsP5Kg1ZTw8/Pkoe4r
         rmYQ==
X-Gm-Message-State: ACgBeo0EezV3tdyxN8Rn62yO33Hr5E/YXBROQVPZTxvj45oO1wno7H2x
	c6punMCj9SGc2ALlAJyqWZNKv9Og5TBYVfUVKNuK8w==
X-Google-Smtp-Source: AA6agR5yr8YF6+0QafYupObEbHLSCcL/AToRyHImwx66OLyyvYDWNl4DuIdWi+YN40kdYlI1lSoXTQPNzh1f9ypKSFY=
X-Received: by 2002:a05:6102:304e:b0:397:6b53:5f81 with SMTP id
 w14-20020a056102304e00b003976b535f81mr360723vsa.80.1662511679176; Tue, 06 Sep
 2022 17:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X> <20220516214005.GQ76023@worktop.programming.kicks-ass.net>
 <YoPAZ6JfsF0LrQNc@hirez.programming.kicks-ass.net> <YoPCTEYjoPqE4ZxB@hirez.programming.kicks-ass.net>
 <20220518012429.4zqzarvwsraxivux@treble> <20220518074152.GB10117@worktop.programming.kicks-ass.net>
 <20220518173604.7gcrjjum6fo2m2ub@treble> <YoVuxKGkt0IQ0yjb@hirez.programming.kicks-ass.net>
In-Reply-To: <YoVuxKGkt0IQ0yjb@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 6 Sep 2022 17:47:23 -0700
Message-ID: <CABCJKueB-tZmxESGP_W9JUghu-6y1Dj1DeahRsGb3bOUttctMA@mail.gmail.com>
Subject: Re: [PATCH] objtool: Fix symbol creation
To: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 3:10 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, May 18, 2022 at 10:36:04AM -0700, Josh Poimboeuf wrote:
> > On Wed, May 18, 2022 at 09:41:52AM +0200, Peter Zijlstra wrote:
> > > +static int elf_update_symbol(struct elf *elf, struct section *symtab,
> > > +                        struct section *symtab_shndx, struct symbol *sym)
> > >  {
> > > -   Elf_Data *data, *shndx_data = NULL;
> > > -   Elf32_Word first_non_local;
> > > -   struct symbol *sym;
> > > -   Elf_Scn *s;
> > > -
> > > -   first_non_local = symtab->sh.sh_info;
> > > -
> > > -   sym = find_symbol_by_index(elf, first_non_local);
> > > -   if (!sym) {
> > > -           WARN("no non-local symbols !?");
> > > -           return first_non_local;
> > > -   }
> > > +   Elf_Data *symtab_data = NULL, *shndx_data = NULL;
> > > +   Elf64_Xword entsize = symtab->sh.sh_entsize;
> > > +   Elf32_Word shndx = sym->sec->idx;
> >
> > So if it's a global UNDEF symbol then I think 'sym->sec' can be NULL and
> > this blows up?
>
> Oh indeed, sym->sec ? sym->sec->idx : SHN_UNDEF it is.

elf_update_symbol seems to be a bit broken even after this. I noticed
it converts SHN_ABS symbols into SHN_UNDEF, which breaks some KCFI
builds. In fact, the function drops all the special st_shndx values
except SHN_XINDEX.

Specifically, read_symbols sets sym->sec to find_section_by_index(elf,
0) for all SHN_UNDEF and special st_shndx symbols, which means
sym->sec is non-NULL and sym->sec->idx is always 0 (= SHN_UNDEF) for
these symbols. As elf_update_symbol doesn't look at the actual
st_shndx value, it ends up marking the symbols undefined.

This quick hack fixes the issue for me, but I'm not sure if it's the
cleanest solution. Any thoughts?

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index c25e957c1e52..7e24b09b1163 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -619,6 +619,11 @@ static int elf_update_symbol(struct elf *elf,
struct section *symtab,
        Elf64_Xword entsize = symtab->sh.sh_entsize;
        int max_idx, idx = sym->idx;
        Elf_Scn *s, *t = NULL;
+       bool is_special_shndx = sym->sym.st_shndx >= SHN_LORESERVE &&
+                               sym->sym.st_shndx != SHN_XINDEX;
+
+       if (is_special_shndx)
+               shndx = sym->sym.st_shndx;

        s = elf_getscn(elf->elf, symtab->idx);
        if (!s) {
@@ -704,7 +709,7 @@ static int elf_update_symbol(struct elf *elf,
struct section *symtab,
        }

        /* setup extended section index magic and write the symbol */
-       if (shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) {
+       if ((shndx >= SHN_UNDEF && shndx < SHN_LORESERVE) || is_special_shndx) {
                sym->sym.st_shndx = shndx;
                if (!shndx_data)
                        shndx = 0;

Sami
