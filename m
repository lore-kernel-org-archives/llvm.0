Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB69C168
	for <llvm@lists.linux.dev>; Fri, 24 Dec 2021 06:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B+P6/b0Tq7K4487B9M5tJlyJyCrS1rmaPRalccK0nLM=; b=BE8KiPx2efWAi46hmsX9ctm9FN
	uUpMc3hmUlqSgFHhGgCK57aW86dQ/BvimE8JxtBjzOmlDhh+OCOttS1/6kgFmaVFuiD7Y1B2xYOxV
	rxqTTC4611IZYe3JlaA96rGvavoyXjgVTH8MUrnnH5D8jTLNlg0/17xYT9sQRIq9cOWX3x3RGlF66
	OJbZvvl9Z5I5ce939Hnwn7v28xXTtwyenz+maWEGt+/wRb7i9l0OtkwvnVi6ctgXAZ3n+IuYEaSlm
	sjpWXlYvkRvLyVsrqf56EN/5bHXx8RhV9xd7iFJ7kBsz/P0GhxBqgc5usArz6BOMWoYZTtA3uevdA
	W7Y2YD2Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0eDW-00DnyK-1T; Fri, 24 Dec 2021 06:38:14 +0000
Date: Thu, 23 Dec 2021 22:38:14 -0800
From: Christoph Hellwig <hch@infradead.org>
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
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [PATCH v9 00/15] Function Granular KASLR
Message-ID: <YcVq1pMHWvPFHH5g@infradead.org>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223002209.1092165-1-alexandr.lobakin@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Dec 23, 2021 at 01:21:54AM +0100, Alexander Lobakin wrote:
> This is a massive rework and a respin of Kristen Accardi's marvellous
> FG-KASLR series (v5).

Here would be the place to explain what this series actually does and
why it is marvellous.
