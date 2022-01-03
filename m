Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C1168
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641226053; x=1672762053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rVVwDAkcOxhvyeGTJ9bFMrtt0ZWlk8cQj8m6qKDK0tg=;
  b=Q4MthhJR1zQe30eqOwIyHpRz+CT9wodaVm6osFHhtXc6qqv5191mxGTl
   4+Oz//fjCALn9SnTI+DxEDAjFlkbSA2tDgxjSOn9WY+DhngEZUes6g7RA
   OMv675FQJWImM/jjAtu2vF00RBnYfofuYu5qQRj3q9yiPX8cEgyYSrI0F
   gjXDTpAKKQfJiRKSXWCYup7ACiW57OEHGHOXV/Aw+VwJX2gK3NJ0oqjnH
   BGkaRDaoRct0LBoP1uq9ENUN4qw6/XM+XXISuvw9B0/MzPISckCDGAvIb
   /Ton+w1Z6flqqWgw+krVwGKw82HOyIFoT8YIpC7pqM7nuyoaEpq6y22CZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="305438053"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="305438053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 08:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="760128765"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga006.fm.intel.com with ESMTP; 03 Jan 2022 08:07:25 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 203G7Mbb027955;
	Mon, 3 Jan 2022 16:07:22 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        =?UTF-8?Q?F=C4=81ng-ru=C3=AC_S=C3=B2ng?= <maskray@google.com>,
        Borislav Petkov <bp@alien8.de>, linux-hardening@vger.kernel.org,
        x86@kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v9 02/15] livepatch: use `-z unique-symbol` if available to nuke pos-based search
Date: Mon,  3 Jan 2022 17:06:15 +0100
Message-Id: <20220103160615.7904-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <alpine.LSU.2.21.2201031447140.15051@pobox.suse.cz>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com> <20211223002209.1092165-3-alexandr.lobakin@intel.com> <Yc2Tqc69W9ukKDI1@zn.tnic> <CAFP8O3K1mkiCGMTEeuSifZtr2piHsKTjP5TOA25nqpv2SrbzYQ@mail.gmail.com> <alpine.LSU.2.21.2201031447140.15051@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miroslav Benes <mbenes@suse.cz>
Date: Mon, 3 Jan 2022 14:55:42 +0100 (CET)

> On Thu, 30 Dec 2021, Fāng-ruì Sòng wrote:
> 
> > On Thu, Dec 30, 2021 at 3:11 AM Borislav Petkov <bp@alien8.de> wrote:
> > >
> > > On Thu, Dec 23, 2021 at 01:21:56AM +0100, Alexander Lobakin wrote:
> > > > [PATCH v9 02/15] livepatch: use `-z unique-symbol` if available to nuke pos-based search
> 
> ...
> 
> > Apologies since I haven't read the patch series.
> > 
> > The option does not exist in ld.lld and I am a bit concerning about
> > its semantics: https://maskray.me/blog/2020-11-15-explain-gnu-linker-options#z-unique-symbol
> > 
> > I thought that someone forwarded my comments (originally posted months
> > on a feature request ago) here but seems not.
> > (I am a ld.lld maintainer.)
> 
> Do you mean 
> https://lore.kernel.org/all/20210123225928.z5hkmaw6qjs2gu5g@google.com/T/#u 
> ?
> 
> Unfortunately, it did not lead anywhere. I think that '-z unique-symbol' 
> option should work fine as long as the live patching is concerned. Maybe I 
> misunderstood but your concerns mentioned at the blog do not apply. The 
> stability is not an issue for us since we (KLP) always work with already 
> built and fixed kernel. And(at least) GCC already uses number suffices for 
> IPA clones and it has not been a problem anywhere.

LLD doesn't have such an option, so FG-KASLR + livepatching builds
wouldn't be available for LLVM with the current approach (or we'd
still need a stub that prints "FG-KASLR is not compatible with
sympos != 0").
Unfortunately, I discovered this a bit late, just after sending this
revision.

OTOH, there's no easy alternative. <file + function> pair looks
appealing, but is it even possible for now to implement in the
kernel without much refactoring?

>
> Am I wrong?
> 
> Thanks
> 
> Miroslav 

Thanks,
Al
