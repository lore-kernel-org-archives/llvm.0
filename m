Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E15A7C
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 16:47:07 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1321a1e94b3so347388fac.1
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ejkO549z4V4tBXsuJSnJcLjr+xb5uPcOfoYg03WmHAU=;
        b=JWB4zGbVaYzLZLBUCo+rtY5Wi5gTziOGiA84Mq5RidDu/lAUxPTTaeXI5+yUYVWkvk
         ZQltiVOIX7xrhl3wJp8NqRGhWaEQmiZDtRSb8Wn0AsWYyoLgq4PsZv024rzhpq+ZKzoi
         INpypXwPxYs3sBVwItsvqi5cdqG9vt2TkU0WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ejkO549z4V4tBXsuJSnJcLjr+xb5uPcOfoYg03WmHAU=;
        b=kao4F551wCigRiAC3uTtFNzOajo04TvUhX+mDIBvnExI9TkmW2aN98qbQXvmEWF7Wd
         of32F39VvHmMFmOK5/I5GHxEMlp8V72Ga8upykX9QWa6AWWlOJUR17NchzposPwbLw/z
         v2LYjo5POY3er1aJGeYpI8vJlyNjWs8M8ot8/VugOGEsBEXZ3/Gqpa0IHQkhpsH6C+z7
         9CtOK/JhQXYK40FJRH1jtWtTZXL+9JyRR0TqupLpFUX+yqNTf/Yt9rm+oUUA8wD2dmcj
         FBLTkME85SJ1lTMF7oC0t1ohTYbQbvN0mdFybOTUuA1CwMDKW3VqLwTgc5idZDifNOch
         lSaQ==
X-Gm-Message-State: ACrzQf187zZTfysZi7qiKiH70sGC7B1SqO3QIYF4+ggrBhCWaHChizmW
	0TH+HxlJZwXUS1nVYmMuaOoyrcJp5/zHLA==
X-Google-Smtp-Source: AMsMyM5Pp0dPzBdnwB5QYMZzbYafNxqSS+bXeTDBvNdk8jeydMn3ptVe8WN3XuM3Q8kbiLC1+u3zOQ==
X-Received: by 2002:a05:6871:14b:b0:131:fefd:51dd with SMTP id z11-20020a056871014b00b00131fefd51ddmr1763696oab.50.1664556425807;
        Fri, 30 Sep 2022 09:47:05 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id o2-20020acad702000000b003437e4f2510sm619573oig.11.2022.09.30.09.47.04
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:47:04 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13189cd5789so6079002fac.11
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 09:47:04 -0700 (PDT)
X-Received: by 2002:a05:6870:c888:b0:12c:7f3b:d67d with SMTP id
 er8-20020a056870c88800b0012c7f3bd67dmr5502798oab.229.1664556424468; Fri, 30
 Sep 2022 09:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkaKTa2aiA90VzFrChNQM6O_ro+b7VWs=op70jx-DKaXA@mail.gmail.com>
 <20220928210512.642594-1-ndesaulniers@google.com> <5672845ec66744df9ee0f0c56031ab00@AcuMS.aculab.com>
 <CAKwvOd=QsUGZ2ZF_3xHb0dG0JF=f9e3_vHvU+rsj0eXfAQP86g@mail.gmail.com>
In-Reply-To: <CAKwvOd=QsUGZ2ZF_3xHb0dG0JF=f9e3_vHvU+rsj0eXfAQP86g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Sep 2022 09:46:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXWNx_c7XsYLRtKTpG2L0uVJuSm=hOX81m7Lb=U4PWHA@mail.gmail.com>
Message-ID: <CAHk-=wgXWNx_c7XsYLRtKTpG2L0uVJuSm=hOX81m7Lb=U4PWHA@mail.gmail.com>
Subject: Re: [PATCH v4] x86, mem: move memmove to out of line assembler
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: David Laight <David.Laight@aculab.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Andy Lutomirski <luto@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 9:43 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 30, 2022 at 2:55 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > Oh - and why do all the labels have 'byteswap' in them?
>
> .Lbyteswap is swapping single bytes at a time.
> .L4_byteswap is swapping 4 bytes at a time.
> .L8_byteswap is swapping 8 bytes at a time.
> .L16_byteswap, .L16_byteswap_backwards_loop, and
> .L16_byteswap_forwards_loop are swapping 16 bytes at a time.

I think the objection here is that there is no "swap".

A "byte swap" in particular is generally a byte order operation (ie
swapping bytes within one word). And "swap" in general is about
switching the value of two things.

Here, the "byteswap" code sequences just move data in one direction.
No "swap" anywhere that I can see.

             Linus
