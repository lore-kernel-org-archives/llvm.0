Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4222C80
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 16:59:25 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-202-008.088.067.pools.vodafone-ip.de [88.67.202.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C1C0D1EC01CE;
	Mon,  3 Jan 2022 17:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1641229159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=ts44VVgH9vdtQvsOCoUEuFivddAMNPUEDPS8OSJXVYg=;
	b=nfC00FSml3Yvgxtd6HqgtS5JNr6Fc3GQM8Jd7kUwmMzWTxwFIpSWVhWlp+t04uFD+vAopj
	Hp1ptTv1Kkc09sOxjZNrhllxxBJUSrPBfumpaXkvyRa7LH6qeYMtZ5/MtQyvWeL9ge8Xds
	LA/roCFzE0evxqS+dGv8CFS9MHoGXBg=
Date: Mon, 3 Jan 2022 17:59:27 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: linux-hardening@vger.kernel.org, x86@kernel.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Bruce Schlobohm <bruce.schlobohm@intel.com>,
	Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
	Miroslav Benes <mbenes@suse.cz>,
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
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marios Pomonis <pomonis@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v9 03/15] kallsyms: Hide layout
Message-ID: <YdMrb/t2zJbpLYj0@zn.tnic>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com>
 <20211223002209.1092165-4-alexandr.lobakin@intel.com>
 <Yc40UKmylVh38vl5@zn.tnic>
 <20220103154023.7326-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220103154023.7326-1-alexandr.lobakin@intel.com>

On Mon, Jan 03, 2022 at 04:40:23PM +0100, Alexander Lobakin wrote:
> "kallsyms: randomize /proc/kallsyms output order"?

Better.

> It displays zeros for non-roots, but the symbols are still sorted by
> their addresses. As a result, if you leak one address, you could
> determine some others.

Because if an attacker has the corresponding vmlinux, he has the offsets
too so, game over?

> This is especially critical with FG-KASLR as its text layout is
> random each time and sorted /proc/kallsyms would make the entire
> feature useless.

Do you notice how exactly this needs to absolutely be in the commit
message? Instead of that "this patch" bla which is more or less obvious.

IOW, always talk about *why* you're doing a change.

> I either have some problems with checkpatch + codespell, or they
> missed all that typos you're noticing. Thanks, and apologies =\

No worries, and thank python's enchant module which I use to spellcheck
stuff.

So lemme look at the actual patch then :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
