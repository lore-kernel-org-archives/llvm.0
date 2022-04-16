Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86F2100
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 16:33:26 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id q19so11444286pgm.6
        for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXAjmlQH108j2yJVfly5XEzHc4w2ZtC5LgwURAgR384=;
        b=IJ4MYAY+QoHmeLmSBnHXQa/r9o6nOYb8ctLbNSkxmQDOPwRV4JefeyPccbTw414ZOK
         YVGIn5f5Co1baZkZjM5XDTGfkgyWC5TYO+3jdbz3S7NH33Vp2sh71INdRmnJ+OP5ZPRb
         DddI/hA7GGtQIMGgWE0a3SuINcbizxM9eBtJwFJ57f+ZH7nqejKyu3S8m5WGXP0lJTho
         78gLNkrXeoicxDZ4PWvtojbWP0V/g9U3cNWMvIxNVwcsBJQto7X1J7hQHEfljaWWtgVq
         HgvmE5EtjWObBhRAsNuOqAxC009IbJ1pp7U/HZefuIFnEEa4iJonkYLK6Jj2lAP2fkwt
         LG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXAjmlQH108j2yJVfly5XEzHc4w2ZtC5LgwURAgR384=;
        b=4pHYdWl0TGQ+OWMwfmDo+sLx+vVtAC95frjWDGCI+gG63hg6E9WOb2WnOC/hUVuQ7b
         lZynTq/gb4vZGtAXWkzWDt5IdlQII5ncR4Ujhq9As7q0TPPHVykgLqH4Iea6Za8yLheo
         PkREYep2y625cf2yyzr1VWMWLgyD1BBvDfAlLDRbKkJINcf+ZcGya9TbrHtS9UG0Ptmo
         cufHM+e3hRMIKPaEvTVrFOztGr07FeXxIpzsAnPcdJQaf38mogE+4F1bI/kTDCR0Xary
         Ta0osPBlZxjrsmgPzY+zDpDRJRygqdDvHuOHowF8I7MLCGV8b2mXcJXWRkUMSlM3F+Ee
         sBFg==
X-Gm-Message-State: AOAM532IyPH14pDCqw2d3KLJDNqEn/MrBSNh4olnPu4tSr5OS4D4zNHO
	yz+uKN4U7pE/RaWXta/k9UIqbV+2/zwOxWhDtno=
X-Google-Smtp-Source: ABdhPJzLzRVQ8AcmY5dX0l4Joh9hZIxAPQ88mAu5a8eckjTHhK2kBRbgfeZdKnsbCrno3XSHmk+qDf6oAKyq31Ss77Q=
X-Received: by 2002:aa7:8888:0:b0:505:a3e1:d246 with SMTP id
 z8-20020aa78888000000b00505a3e1d246mr4184746pfe.76.1650126805939; Sat, 16 Apr
 2022 09:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net> <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble> <20220416104809.GC2731@worktop.programming.kicks-ass.net>
 <20220416160742.6g4nejji4xyrgpvp@treble>
In-Reply-To: <20220416160742.6g4nejji4xyrgpvp@treble>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Sat, 16 Apr 2022 09:32:50 -0700
Message-ID: <CAMe9rOqt-XE4+0nBtQcfhycCEqE7nK6GxCH0LNdpD=Jy41TnMw@mail.gmail.com>
Subject: Re: The trouble with __weak and objtool got worse
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Miroslav Benes <mbenes@suse.cz>, rostedt@goodmis.org, 
	linux-toolchains@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 16, 2022 at 9:07 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Sat, Apr 16, 2022 at 12:48:09PM +0200, Peter Zijlstra wrote:
> > This *might* work for static_call. But what about things like
> > .retpoline_sites?
> >
> > If we get an indirect inside the weak function and at
> > a different place inside the non-weak function, then we end up with two
> > patch sites in the non-weak function.
> >
> > And since all of that is compiler generated, we don't have anything to
> > stick anything in to alleviate trouble.
> >
> > (in fact, I didn't observe this with static_call, I just picked it for
> > the example because it was somewhat easier)
>
> Ok, right.  And ORC entries will be broken.  I found the ones below by
> disabling CONFIG_DEBUG_INFO and looking for "sym->bind == STB_WEAK" in
> the elf_add_reloc_to_insn() fallback.
>
> I guess objtool will need to bite the bullet and create section symbols.
>
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x0: missing section symbol for reference to weak function text
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x4: missing section symbol for reference to weak function text
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x8: missing section symbol for reference to weak function text
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0xc: missing section symbol for reference to weak function text
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x10: missing section symbol for reference to weak function text
>   lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
>   lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x0: missing section symbol for reference to weak function text
>   lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x4: missing section symbol for reference to weak function text
>   lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x10: missing section symbol for reference to weak function text
>   lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x18: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x1c: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x20: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x24: missing section symbol for reference to weak function text
>   lib/crc32.o: warning: objtool: .orc_unwind_ip+0x28: missing section symbol for reference to weak function text

STB_WEAK is meaningful when deciding if a symbol definition should
be ignored only when there is no STB_GLOBAL at link-time.   Tools
must keep the section index of a weak symbol definition if there is no
non-weak definition.

-- 
H.J.
