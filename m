Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C553FE5D;
	Thu, 22 Feb 2024 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621928; cv=none; b=mcEnqd8BX2L4Vr1HhjBud5c5lePHlF1WN2IscvUIs8sRrp7CXwhQXE8I4lFwy1zZcmJDBdr7Bil3NHoRgSoy2njMcfDLBr/RKi4StXdD60WzASZ6zJL7ZNb06xOtGY9edNHRwbOYZVh/Q1+aoAoxpy4NZE1DTm+yv4VSQZwtD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621928; c=relaxed/simple;
	bh=wNfsL80mNMC2d2nidGt395UjfsvPLVaIfIZViGCe8r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7UqHAQOzeGD0oCLdnFTEp0I+9yiP2EluOpkerZW9qBBd1Sy3ln71rLkyDURdGlux+MhXglikwYq6yXKpWZnhDEPm5ODx5N7ceyjYS1M9jVuSvKW2DJdCtKw8IDNsqDMONYm15EGXuYWQKAwDLwyTUgt4c07Mmrp4y3dbDrKbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq2mOiza; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq2mOiza"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so621953966b.1;
        Thu, 22 Feb 2024 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708621925; x=1709226725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R62y3zmfO3vkTBKELkMH6EBSN9Umpuk/UWSNDSUJmRE=;
        b=Lq2mOiza0nwu9wfknP/jSAs44qrexB7RxdFSoAdPQJWP5Izs1qUa4Y4H9+N8FcD5Il
         0KeSR/HVy58bktbsNEvZ1QI6SOnf2R1pdoVGnbyi+aag/+sczQih++ab50Uy650NMDa3
         Y40fY59SM0PHO8a0MQD0vvhOUrZaHgWBHi8axxekz0ylqo71hWta8wjKQi+Q/xwmP6is
         iG/sbBH/LPonzpw3vH+amHrs1IfeHkITqYsp5SuS94mkBJf/ysFxEC3ZPU7rjsKHQAK5
         dzreaTteoHH54keMF9tz0ZC4M9kp5OtvhLpj9z45xHWhfnPzwPTrRArnYynk7uMwCEC2
         Wung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708621925; x=1709226725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R62y3zmfO3vkTBKELkMH6EBSN9Umpuk/UWSNDSUJmRE=;
        b=BZgubP4dark7FvuE4KJATNDuGdRUjus6nQEjnvzLYlT8obaKxYaSlVfPdVmdKulo70
         AXVVjslpA+nA0Z8P78YykuFqfmY79oMtMsSOQp/ql4DBtTCaQH1aVSpZK94trOwe6Kqh
         hnp+BrsnyAuyPdcYwWhGNGCPw48aI+75JzdMNarVgLSHOU5GUNsqYgZbKd/68/AvECf3
         jl9HsXKnOw7kyubur5FmpEdpPxWgS9ODmcZa4tDpJ9QiQ8sSAb5hr3ppbZdzuRa9kHgh
         rxgFRCjmgHPCghaDB4rhaQnHqNFuZZ+W0Fo3RfWgfdMInV0VAEmXWpMP1vSKNyOKPuOD
         Hw2g==
X-Forwarded-Encrypted: i=1; AJvYcCUwCGP4NJi/i3YZlpOOViAeWmZxYeI82q1IvYmcWxpkyaJk0ULLd5WB+5aXjIU7W5oZ7m2OIaOxMRpDfLGac841Gagl5Bk129Y7RBW/VlSzouBliHyo6cFg3axGZfTMXPVVOpY=
X-Gm-Message-State: AOJu0YzkRxkP7L+XemzWYknqCe0ufk/R8+KEHYfjL/khPPgvkx+mTAZk
	4tWMJ0sjGeuOcO9XSMPLGLkJPrxJYkk2RPYF9EBjtxH0u5e+iCM5PcKogMxG4E6TfWIRoet6DW3
	p8+JgwDVgztk0HwLQfjoJzKdCxz4=
X-Google-Smtp-Source: AGHT+IE0sPki7t4TbugmLAgjhSr6glJUOzmra/6Ww/Qw1K5v8TM0qF7dC2R8Xsoh68eYEwXKc40Ck7ci/1qOLBc8qHw=
X-Received: by 2002:a17:906:1cc2:b0:a3e:4d4c:d120 with SMTP id
 i2-20020a1709061cc200b00a3e4d4cd120mr12161358ejh.12.1708621924680; Thu, 22
 Feb 2024 09:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230406000212.3442647-6-keescook@chromium.org>
 <202304061930.4Au0PASm-lkp@intel.com> <19930c5a-f1ed-4b04-b69a-d7259966f020@app.fastmail.com>
 <202402220829.10C6C7C@keescook>
In-Reply-To: <202402220829.10C6C7C@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Feb 2024 19:11:28 +0200
Message-ID: <CAHp75VfDxrTyPCunRbteANRu+-Pt0sMvepxnBAgRbc-Bdb=6nQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] fortify: Split reporting and avoid passing string pointer
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andy Shevchenko <andy@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Puyou Lu <puyou.lu@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Dan Williams <dan.j.williams@intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Yury Norov <yury.norov@gmail.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Sander Vanheule <sander@svanheule.net>, Eric Biggers <ebiggers@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 6:30=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
> On Thu, Feb 22, 2024 at 02:00:26PM +0100, Arnd Bergmann wrote:
> > On Thu, Apr 6, 2023, at 13:19, kernel test robot wrote:
> >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Link:
> > > https://lore.kernel.org/oe-kbuild-all/202304061930.4Au0PASm-lkp@intel=
.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >>> ld.lld: error: undefined symbol: __fortify_panic
> > >    >>> referenced by fortify-string.h:208 (include/linux/fortify-stri=
ng.h:208)
> > >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlis=
t_count)
> > >    >>> referenced by fortify-string.h:208 (include/linux/fortify-stri=
ng.h:208)
> > >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlis=
t_search)
> > >    >>> referenced by fortify-string.h:208 (include/linux/fortify-stri=
ng.h:208)
> > >    >>>               arch/arm/boot/compressed/fdt_ro.o:(fdt_stringlis=
t_get)
> >
> > I get a related build failure from the same commit:
> >
> > arch/arm/boot/compressed/misc.c:157:6: error: no previous prototype for=
 '__fortify_panic' [-Werror=3Dmissing-prototypes]
> >   157 | void __fortify_panic(const u8 reason, size_t avail, size_t size=
)
>
> Whoops, thank you! This series got a refresh after you did the
> missing-prototypes work and I missed this one. I've fixed it and
> double-checked for any others. Hopefully this will be clean in the next
> -next. :)

Thank you! (FWIW, I also hit it today)

--=20
With Best Regards,
Andy Shevchenko
