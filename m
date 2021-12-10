Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08829CA
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 11:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639134121; x=1670670121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBain5rvAuM0ab2ClY+MBBH0nuRkV+7ToR7QQbmwcnQ=;
  b=nOKIgwLS8cJDehNfpfj2ocu3C09UBCpILW0tAPujZLy3srJa5hadyDAX
   tQ8iYriCrvl6G8gotU4yAXOXGsIi45QCK6+Rv/ho6VDc+gnyLGJqaCfZe
   8e1wcsTcFFZM5Ezo3SFjVN01glrD/f3jPl5HdOJyzoLUcTbcm9auVC6/n
   2ahfzoifq+odwJXywVKqm8MmG46tP/zcqAK2lHdqefsQzNEWvKGy9zZUV
   c4LlueNC1NZl/XNgRuPJ13UrNL6m/iFN8LsmmJFpOKeTt1lilcOp35O+u
   iRpjw27qS15bO+M4Pc87NnNIaHjlM8MqWWUGiapVmR4ZfVkmnzLwBIK7L
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262437852"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="262437852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 03:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="612893140"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga004.jf.intel.com with ESMTP; 10 Dec 2021 03:01:34 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1BAB1WjI016878;
	Fri, 10 Dec 2021 11:01:32 GMT
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
        "H . J . Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
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
        live-patching@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 05/14] x86: conditionally place regular ASM functions into separate sections
Date: Fri, 10 Dec 2021 12:01:02 +0100
Message-Id: <20211210110102.707759-1-alexandr.lobakin@intel.com>
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

This condition

.pushsection .text
.if section == .text
# do something
.endif
.popsection

doesn't really works. `do something` doesn't happen.
This works only when

.pushsection .text
.equ section, .text

but it's not really okayish I'd say to find all .{,push}section
occurences and replace them with a macro (which would also do .equ).

I don't really know how %S with --sectname-subst should help me as

.if %S == .text
# do something
.endif

doesn't work at all (syntax error) -- and it shouldn't, %S is
supposed to work only inside .{,push}section directives.

I could do unconditional

.pushsection %S.##name
                ^^^^^^ function name

but this would involve changing LDS scripts (and vmlinux.lds.h) to
let's say replace *(.noinstr.text) with *(.noinstr.text*).

So I hope there is a way to get current section name? If not, then
the last option is the least harmful I suppose.
At least not as harmful as current approach with alternative macros,
far from it lol.

> 
> #define SYM_POP_SECTION()	\
> .pop_section
> 
> and wrap that inside the existing SYM_FUNC_START*() SYM_FUNC_END()
> macros.

Thanks,
Al
