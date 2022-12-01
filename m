Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682B77473
	for <llvm@lists.linux.dev>; Thu,  1 Dec 2022 17:15:36 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y4so2261953plb.2
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIINIHGhGskcMDqmUFFXNmVZPREPkJD5rw4zIRk+6sQ=;
        b=lX7ncvUzSC9rS2ZdVzvSVXdSjYS0XfkOJUpUDqM9m1MziQwQ+9qm+151brYvHnWkOo
         FgANLgqlGG/z5WgU/eqZH7t6i4HEXTREHuZ76s9iSD6WuDoDYQ9MIb/9FB99Uo1dHdPm
         I1pD+By6iGuvWEmYvkWzU2tygVfKpSYoBbn4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIINIHGhGskcMDqmUFFXNmVZPREPkJD5rw4zIRk+6sQ=;
        b=L76/fkE4C5h3wnRtErbqCgd0SpQTQRzgB2hwZURhT9x7fXrVR8ty0UCDNoyNIpzoum
         C0N+SAJx7HccPVyM5XsaWc7MByxVE+P8ib4zKaTJq+q45JpiYlSB7vfQLk8M751WKwyY
         yWJbvJFWgYxFFUbwyAbdPwFg4zzVkdCdGMpSoTzorLjLC3CLDh0z1dGmoISGhG+8DTH1
         dC/JyaOMcwz9RYJwxGzrw+fxl37SirscEG+H4jEo44+4WGMKLd5b0Cft8RYsv0lQJQPg
         INHWd3KLbkUiAA4HwibNnTR51vyun9/1MNZS8GBViAFzotXGPWuGwm8nsa6rnG7zx+HP
         cdbA==
X-Gm-Message-State: ANoB5pnrgn3GaV/fOjI5pMys0sdxjtxFUnP6zGnM2vsk5VtkGUUqlIbJ
	DogO55OteMkqw1Z3XOfRTuF3fw==
X-Google-Smtp-Source: AA0mqf7hLOuoteAV7+avN4qvvGgVHF7ekfjG+aG+RXbz2yEIxrPB3hTqariDmAhhNwmKDWq0XzzGcg==
X-Received: by 2002:a17:90b:3e8b:b0:1fb:825c:af8a with SMTP id rj11-20020a17090b3e8b00b001fb825caf8amr31770278pjb.104.1669914935787;
        Thu, 01 Dec 2022 09:15:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s20-20020a170902a51400b001894dc5fdf2sm3850559plq.296.2022.12.01.09.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:15:34 -0800 (PST)
Date: Thu, 1 Dec 2022 09:15:34 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>,
	Vlastimil Babka <vbabka@suse.cz>, David Gow <davidgow@google.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/6] slab: Provide full coverage for __alloc_size
 attribute
Message-ID: <202212010915.ADB7D298@keescook>
References: <20221101222520.never.109-kees@kernel.org>
 <Y4X6AHdMZcxvFnDP@wendy>
 <63ced4a4-33b9-4c03-8d7a-987ceb1fc2c7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63ced4a4-33b9-4c03-8d7a-987ceb1fc2c7@app.fastmail.com>

On Tue, Nov 29, 2022 at 01:33:03PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 29, 2022, at 13:24, Conor Dooley wrote:
> > On Tue, Nov 01, 2022 at 03:33:08PM -0700, Kees Cook wrote:
> >> Hi,
> >> 
> >> This is a series to work around a deficiency in GCC (>=11) and Clang
> >> (<16) where the __alloc_size attribute does not apply to inlines. :(
> >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96503
> >> 
> >> This manifests as reduced overflow detection coverage for many allocation
> >> sites under CONFIG_FORTIFY_SOURCE=y, where the allocation size was
> >> not actually being propagated to __builtin_dynamic_object_size(). In
> >> addition to working around the issue, expand use of __alloc_size (and
> >> __realloc_size) to more places and provide KUnit tests to validate all
> >> the covered allocator APIs.
> >
> > Hello Kees!
> >
> > It would appear that one of the macros you've added here is doing Bad
> > Things^TM to allmodconfig on RISC-V since the 22nd:
> >
> > ../lib/fortify_kunit.c: In function 'alloc_size_kmalloc_const_test':
> > ../lib/fortify_kunit.c:140:1: error: the frame size of 2384 bytes is 
> > larger than 2048 bytes [-Werror=frame-larger-than=]
> >   140 | }                                                               
> >         \
> >       | ^
> > ../lib/fortify_kunit.c:209:1: note: in expansion of macro 
> > 'DEFINE_ALLOC_SIZE_TEST_PAIR'
> >   209 | DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > CONFIG_GCC_VERSION=110100
> > CONFIG_AS_VERSION=23700
> > CONFIG_LD_VERSION=23700
> >
> > The report came out of my CI (which I should have passed on sooner) so
> > I do not have anything other than stderr - I can get you anything else
> > you'd like/need though if you LMK.
> 
> There is generally a conflict between kunit and the structleak
> gcc plugin, I think the Makefile needs a line like
> 
> CFLAGS_fortify_kunit.o += $(DISABLE_STRUCTLEAK_PLUGIN)

Thanks for the report! I've taken Anders's patch for this now.

-- 
Kees Cook
