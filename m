Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CA82C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 20:45:34 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id q127so21175882ljq.2
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OP8lq+CNNstsD6MdqxQkt/+Qf2pjO5hiMrphojuZwoU=;
        b=N1MCHAoWUOlYLJDlA8wsBKE17FbxUlNpj1KofdDJGYesdQY9l1rVYYgINrRkUaFZBf
         KZNoHtazLOFrvgO9HPbhkQGgMOkNa9WzmFHFsFTH/M9qA1u3o9csud+Tm3UjgZ2VXRRD
         MBJdqlKmhqMj9/7feMzK7v3gFyZRAULTAPFyDEKazMIngNZsWxfMaLlpzKLS16prACCB
         asGdmQF+SIIfQ7UskfAH9aJ7LdR7aWz737U8q97afIlghe20cwOmwee5S9cmVI84d7ND
         wNXe1uIhJrSlDO6Uso3Aw5t0JLY2/d0ne0JionMT8Xtu2qOll51EJMY/rmU8W8unvURw
         tMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OP8lq+CNNstsD6MdqxQkt/+Qf2pjO5hiMrphojuZwoU=;
        b=3Zpo43QDRB+W3HEObQTYyM3DHM2EpW2RTPJ/pEUTnGB8AdlFAY8jHSESupA0jGz+tD
         Ab37We+yp3GBopfCdv9jAOs1xpo5rSEg8vFNdxkqNMns9rxh8s4PWESEhNum19NN2BEU
         2L/Ve8pmmkd732TF9FBac1bg4PobAkRDEnM3tE4c8PRSxZvuR/g1rTxTjUWzTuIF0sx1
         B6Co2E3OTapuL8+CuHgvJ69rXwQwVSayEdJTRvO8Fn2VwHuhf0usx4kVW2JhQOD12w97
         0YXdM9Gj5T7NeGMQ/squmCf/+I83o76dIGz0n92KWBFmE4Upb/wXV5TeIWMP6rK17nwG
         dpgA==
X-Gm-Message-State: AOAM533jRWQgV7BPZhjvXedxqfOnRXjgrRHmi17IBeYoqbmX1iZBqGzx
	oqbjinCZprGMsnF27G/JgsluDHaoTRF1iddxl9CQ1g==
X-Google-Smtp-Source: ABdhPJyUGs/IuSxxzyGQxz64BV96QhIOuwlW+Oh1fnhj7wrQYLrrNl3HYHpoA3JpS27Xsbp+jya9RNlM8rpDYvQ9TSo=
X-Received: by 2002:a2e:954:: with SMTP id 81mr5661437ljj.198.1643661932405;
 Mon, 31 Jan 2022 12:45:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic> <20220118192256.jzk5dnceeusq7x7u@treble>
 <20220118230120.pivvson7qekfiqic@treble> <CAKwvOdmLzwz=02ypt0_1324_5-7i3Az7HizFaDMqZv__-D99uA@mail.gmail.com>
 <20220125233128.GT614@gate.crashing.org>
In-Reply-To: <20220125233128.GT614@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Jan 2022 12:45:20 -0800
Message-ID: <CAKwvOdnB=OfCc_31b=PMjxKewvb3CV2WDwhMWrigviWaHrGMhw@mail.gmail.com>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile & __COUNTER__
To: Segher Boessenkool <segher@kernel.crashing.org>, apinski@marvell.com
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Borislav Petkov <bp@alien8.de>, Vasily Gorbik <gor@linux.ibm.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, x86@kernel.org, 
	llvm@lists.linux.dev, linux-sparse@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 3:34 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!
>
> On Mon, Jan 24, 2022 at 03:26:36PM -0800, Nick Desaulniers wrote:
> > I'm more confident that we can remove the `volatile` keyword (I was
> > thinking about adding a new diagnostic to clang to warn that volatile
> > is redundate+implied for asm goto or inline asm that doesn't have
> > outputs) though that's not the problem here and will probably generate
> > some kernel wide cleanup before we could enable such a flag.
>
> Its main value is that it would discourage users from thinking volatile
> is magic.  Seriously worth some pain!

https://reviews.llvm.org/D118297
PTAL
-- 
Thanks,
~Nick Desaulniers
