Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE05168
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640629475; x=1672165475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C+oHdzLPkEGQP3y/+XFIUPLmI6lwlv3Q34bwmNyrap0=;
  b=MbYz/+DzEh8itH/Xusc9PNb2UIZ4/uxDn4ZygHN9QV89FKDFtixql6On
   vtkDuz/xGsVtpgBAlTGrk/0iUwe7i92Zecx3TAyao4WtP1EN3zAuNijmb
   ZiVbpqMJPyQ5AiEZAt24bcjpcbf5H4uuFRdNS1pgsEJ+zWIXuzCvk0bgL
   vBmiyMVnJvm1qD4CuTLNZKYvjGrjvnuQ43ucF8A8s91UW3yMEuWRqfh19
   r2o2nbgoqeqAzq+b24fGU4dVahfvFyElwltL9deekvamGU0OgrCKsigo3
   NVfZRQkWCJAyY/vEE/Q+K7cjC5erTH+TeRtQRQmJFUrJeXVR5zJmbKT7W
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="327579744"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="327579744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 10:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="609115399"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Dec 2021 10:24:25 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1BRIONTP032398;
	Mon, 27 Dec 2021 18:24:23 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Borislav Petkov <bp@alien8.de>
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
        llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v9 01/15] modpost: fix removing numeric suffixes
Date: Mon, 27 Dec 2021 19:22:46 +0100
Message-Id: <20211227182246.1447062-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <YcShenJgaOeOdbIj@zn.tnic>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com> <20211223002209.1092165-2-alexandr.lobakin@intel.com> <YcShenJgaOeOdbIj@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@alien8.de>
Date: Thu, 23 Dec 2021 17:19:06 +0100

> On Thu, Dec 23, 2021 at 01:21:55AM +0100, Alexander Lobakin wrote:
> > For now, that condition from remove_dot():
> > 
> > if (m && (s[n + m] == '.' || s[n + m] == 0))
> > 
> > which was designed to test if it's a dot or a \0 after the suffix
> > is never satisfied.
> > This is due to that s[n + m] always points to the last digit of a
> > numeric suffix, not on the symbol next to it:
> > 
> > param_set_uint.0, s[n + m] is '0', s[n + m + 1] is '\0'
> > 
> > So it's off by one and was like that since 2014.
> 
> What's the relevance of this? Looking at
> 
>   7d02b490e93c ("Kbuild, lto: Drop .number postfixes in modpost")
> 
> what you're fixing here is something LTO-related. How do you trigger
> this?

It's just a couple lines below. I trigger this using `-z uniq-symbol`
which uses numeric suffixes for globals as well.

> 
> For a Cc:stable patch, I'm missing a lot of context.

It fixes a commit dated 2014, thus Cc:stable. Although the
remove_dot() might've been introduced for neverlanded GCC LTO, but
in fact numeric suffixes are used a lot by the toolchains in regular
builds as well. Just not for globals, that's why it's "well hidden".

> 
> > `-z uniq-symbol` linker flag which we are planning to use to
> 				     ^^
> 
> Who's "we"?

I thought it's a common saying in commit messages, isn't it?

> 
> > simplify livepatching brings numeric suffixes back, fix this.
> > Otherwise:
> > 
> > ERROR: modpost: "param_set_uint.0" [vmlinux] is a static EXPORT_SYMBOL
> > 
> > Fixes: fcd38ed0ff26 ("scripts: modpost: fix compilation warning")
> > Cc: stable@vger.kernel.org # 3.17+
> > Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> 
> ...
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks,
Al
