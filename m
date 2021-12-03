Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA42C9E
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 14:11:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224225414"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="224225414"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="513259816"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga007.fm.intel.com with ESMTP; 03 Dec 2021 06:11:18 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1B3EBBT7008557;
	Fri, 3 Dec 2021 14:11:11 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        linux-hardening@vger.kernel.org, x86@kernel.org,
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
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        live-patching@vger.kernel.org, llvm@lists.linux.dev,
        hjl.tools@gmail.com
Subject: Re: [PATCH v8 05/14] x86: conditionally place regular ASM functions into separate sections
Date: Fri,  3 Dec 2021 15:10:51 +0100
Message-Id: <20211203141051.82467-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <Yanm6tJ2obi1aKv6@hirez.programming.kicks-ass.net>
References: <20211202223214.72888-1-alexandr.lobakin@intel.com> <20211202223214.72888-6-alexandr.lobakin@intel.com> <Yanm6tJ2obi1aKv6@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 3 Dec 2021 10:44:10 +0100

> On Thu, Dec 02, 2021 at 11:32:05PM +0100, Alexander Lobakin wrote:
> > Use the newly introduces macros to create unique separate sections
> > for (almost) every "regular" ASM function (i.e. for those which
> > aren't explicitly put into a specific one).
> > There should be no leftovers as input .text will be size-asserted
> > in the LD script generated for FG-KASLR.
> 
> *groan*...
> 
> Please, can't we do something like:
> 
> #define SYM_PUSH_SECTION(name)	\
> .if section == .text		\
> .push_section .text.##name	\
> .else				\
> .push_section .text		\
> .endif
> 
> #define SYM_POP_SECTION()	\
> .pop_section
> 
> and wrap that inside the existing SYM_FUNC_START*() SYM_FUNC_END()
> macros.

Ah I see. I asked about this in my previous mail and you replied
already (: Cool stuff, I'll use it, it simplifies things a lot.

Thanks!
Al
