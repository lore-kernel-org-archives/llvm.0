Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D7A7C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644838511; x=1676374511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YGHaP2hnU1orIs+CLY7os5ijsM1R9T/d7HZLRE0xrlA=;
  b=kDjLyAT0w/+clGKojAiku1i+2MatVlC9Ezht/Y1gV29r3zIn+nSb2fR7
   GpSgIH2SCw3KNmmm0jC5/eB0ILxO5lv6Z+gXVxAuvaUHzB73vmQPaPL3r
   hBoUss0ZUO42LWbm48dR93bDdX6lhpKe0XoIhHbZ+jq6wKimdUkLydi1Q
   Xf+qunR1bY5/sCqS0aLODz+BfokhSTYvYaOLe2omz4nfjHoHqXk8/d3uF
   2TGO9WoG9LMfEoqm2QjOaknrVY0vX9SSuCE3Sm9Odufak2WQtpKhtprSV
   Z+T84zTWfnM9JvcfBsvNxwE2iIFRTfk8Z/YYAWTlOmoTHRwTmQp9gLvLc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="237481808"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="237481808"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 03:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="775096766"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2022 03:34:59 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 21EBYuXA031487;
	Mon, 14 Feb 2022 11:34:57 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        linux-hardening@vger.kernel.org, x86@kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
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
        Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v10 10/15] FG-KASLR: use a scripted approach to handle .text.* sections
Date: Mon, 14 Feb 2022 12:34:34 +0100
Message-Id: <20220214113434.5256-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211153706.GW23216@worktop.programming.kicks-ass.net>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com> <20220209185752.1226407-11-alexandr.lobakin@intel.com> <20220211153706.GW23216@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 11 Feb 2022 16:37:06 +0100

> On Wed, Feb 09, 2022 at 07:57:47PM +0100, Alexander Lobakin wrote:
> > +sub read_sections {
> > +	open(my $fh, "\"$readelf\" -SW \"$file\" 2>/dev/null |")
> > +		or die "$0: ERROR: failed to execute \"$readelf\": $!";
> > +
> > +	while (<$fh>) {
> > +		my $name;
> > +		my $align;
> > +		chomp;
> > +
> > +		($name, $align) = $_ =~ /^\s*\[[\s0-9]*\]\s*(\.\S*)\s*[A-Z]*\s*[0-9a-f]{16}\s*[0-9a-f]*\s*[0-9a-f]*\s*[0-9a-f]*\s*[0-9a-f]{2}\s*[A-Z]{2}\s*[0-9]\s*[0-9]\s*([0-9]*)$/;
> 
> Is there really no readable way to write this?

I'm no regexp master, so I'd be glad if someone could help improve
this :D I only tried to optimize it using online tools, and they
eventually didn't help.
It could probably be replaced with a pipe to `cut` or `tr`, I'll
take a look a bit later if there won't be any other proposals.

> 
> > +
> > +		if (!defined($name)) {
> > +			next;
> > +		}
> > +
> > +		## Clang 13 onwards emits __cfi_check_fail only on final
> > +		## linking, so it won't appear in .o files and will be
> > +		## missing in @sections. Add it manually to prevent
> > +		## spawning orphans.
> > +		if ($name eq ".text.__cfi_check_fail") {
> > +			$has_ccf = 1;
> > +		}
> 
> How is that relevant, x86-64 doesn't and won't do clang-cfi.

1. One of my test cases was based on Sami's ClangCFI x86 series from
   LKML (the one that was getting patched by objtool :P).
2. ClangCFI is present on ARM64 and it can receive FG-KASLR in a
   future, why not make it work together from the start?

Re "won't do" -- sorry for trying to hijack this thread a bit, but
did I miss something? The last comments I've read were that LLVM
tools need to change their approach for CFI on x86, and Sami went
redo it, but I can't recall any "life-time" nacks.

Thanks,
Al
