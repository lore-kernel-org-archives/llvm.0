Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83629CA
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:33:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9634161359
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634657581;
	bh=iCmSyqMmxKzt3nMwc23Yk2MEoPhytAS0pzkiqRt/Np0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=shUZoThxdyG9NreWRDhy9JebIe2d5u0sgZtncpkeRQuW/LE+0l45NxDeTSprCfRRY
	 811Z7SAoEA5UX97emkKZQGghLJUhK+EW5iWDfMwr5ylGfqHoCvbKZaT6KvQtTXJglf
	 cLOeeQQABPn0Ya+69yxwAFMC+lBJaxES5kH1/Tx0AaGTLA/u1EqVxrFCcRyQPF9bTt
	 MytGP1Tk2fSm6V7+AdhutHDoZDwPR4m5ppHbtxxmi72YI/BdkxDx3OqwSXi+srZM70
	 Aqb1hrkGNOagGTYwWvXMtYA/K+aEiEYPuuZuq5+PlM9/9IXxqFM4E3Dgb7AjDafoKv
	 Z/3f/mcl5twew==
Received: by mail-wm1-f50.google.com with SMTP id o24so5049418wms.0
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 08:33:01 -0700 (PDT)
X-Gm-Message-State: AOAM533CpGRGCa9LSMIUmPMSTouKwBeN2rTus7hexq9n3w9U7SG1FrSd
	awE8db9lC5Oc46dKvsPHKiIOga6X/nbOC7xF2xg=
X-Google-Smtp-Source: ABdhPJzBWL0609j2KrMD/tpj/g7L9anqnkXyV5JmyXcEBMw2jtlGifO1MILHXVHJyfbyKyVaZWhLEB6PfPQ4pWYUmRY=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr6558667wmi.173.1634657579815;
 Tue, 19 Oct 2021 08:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018132538.2468989-1-arnd@kernel.org> <d4ad897585ddc815c188bbf0b3b8cec1cb40b7a4.camel@kernel.org>
In-Reply-To: <d4ad897585ddc815c188bbf0b3b8cec1cb40b7a4.camel@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 19 Oct 2021 17:32:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0EYcoPYDPa7MJJJB130qcRAqE_RPiJ-Era0O3i2GBNKQ@mail.gmail.com>
Message-ID: <CAK8P3a0EYcoPYDPa7MJJJB130qcRAqE_RPiJ-Era0O3i2GBNKQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] tracing: use %ps format string to print symbols
To: Tom Zanussi <zanussi@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Qiujun Huang <hqjagain@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:42 PM Tom Zanussi <zanussi@kernel.org> wrote:
> On Mon, 2021-10-18 at 15:25 +0200, Arnd Bergmann wrote:

> This looks fine to me, thanks for the patch!
>
> Reviewed-by: Tom Zanussi <zanussi@kernel.org>
> Tested-by: Tom Zanussi <zanussi@kernel.org>

Thanks for testing!

> > -                     seq_printf(m, "%s: [%llx] %-45s", field_name,
> > -                                uval, str);
> > +                     seq_printf(m, "%s: [%llx] %-45ps", field_name,
> > +                                uval, (void *)uval);

This turns out to be still wrong on 32-bit, as 'uval' is a u64 and I
can't cast that to a pointer without a uintptr_t cast first.

I was testing randconfig builds with clang here, and for some reason
that didn't catch the bug, but I found it after going back to gcc testing.

Sending v3 now.

       Arnd
