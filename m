Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69F168
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641224507; x=1672760507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g5C1DLmzAjmvh8fBdfrCcd+FGlrkD8urpR90vXZoFjU=;
  b=HOWXC2jJcDYF8YtdbbuzddztDuoo3p+1Xs2gjCdo+QEdm6Z07LL7pPR5
   UlbU1Iuol6e2SBi3B6N4SFkb6Gf9JoimoeSYs6dDusnOkXzcsxP1O5Q7B
   PdNFbpHx15pfDDFzn/d/oxnYiC6rKjN0wj3peDsNDV1FRqZBhJTDqzTIp
   gL8d6qWqoEjZJxp/cHDtiT4Ss3ASa1ouVrAaEP33g+T9hYmwEHZmTIjNi
   c43gg66WWVFl+O43Ab2h1uOHEXi6+3z9T42DmipY7x4NaJgMY7HaCaKxy
   p92BnzF+tbdcdHndbyU1gO1EaIChfrLnJq81OHBvLowJ7WaRqqYVkCkyi
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="242034518"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="242034518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 07:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; 
   d="scan'208";a="688243455"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga005.jf.intel.com with ESMTP; 03 Jan 2022 07:41:39 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 203Ffa79022803;
	Mon, 3 Jan 2022 15:41:36 GMT
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
        llvm@lists.linux.dev
Subject: Re: [PATCH v9 03/15] kallsyms: Hide layout
Date: Mon,  3 Jan 2022 16:40:23 +0100
Message-Id: <20220103154023.7326-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <Yc40UKmylVh38vl5@zn.tnic>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com> <20211223002209.1092165-4-alexandr.lobakin@intel.com> <Yc40UKmylVh38vl5@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@alien8.de>
Date: Thu, 30 Dec 2021 23:36:00 +0100

> On Thu, Dec 23, 2021 at 01:21:57AM +0100, Alexander Lobakin wrote:
> > Subject: Re: [PATCH v9 03/15] kallsyms: Hide layout
> 
> That title is kinda laconic...

"kallsyms: randomize /proc/kallsyms output order"?

> 
> > From: Kristen Carlson Accardi <kristen@linux.intel.com>
> > 
> > This patch makes /proc/kallsyms display in a random order, rather
> 
> Avoid having "This patch" or "This commit" in the commit message. It is
> tautologically useless.
> 
> Also, do
> 
> $ git grep 'This patch' Documentation/process
> 
> for more details.

Goes straight from the original series. Worth changing anyways.

> 
> > than sorted by address in order to hide the newly randomized address
> > layout.
> 
> Sorted by address?
> 
> My /proc/kallsyms says
> 
> $ awk '{ print $1 }' /proc/kallsyms | uniq -c
>  119086 0000000000000000
> 
> so all the addresses are 0. Aha, and when I list them as root, only then
> I see non-null addresses.
> 
> So why do we that patch at all?

It displays zeros for non-roots, but the symbols are still sorted by
their addresses. As a result, if you leak one address, you could
determine some others.
This is especially critical with FG-KASLR as its text layout is
random each time and sorted /proc/kallsyms would make the entire
feature useless.

> 
> > alobakin:
> > Don't depend FG-KASLR and always do that for unpriviledged accesses
> 
> Unknown word [unpriviledged] in commit message, suggestions:
>         ['unprivileged', 'underprivileged', 'privileged']

I either have some problems with checkpatch + codespell, or they
missed all that typos you're noticing. Thanks, and apologies =\

> 
> > as suggested by several folks.
> > Also, introduce and use a shuffle_array() macro which shuffles an
> > array using Fisher-Yates.
> 
> Fisher-Yates what?
> 
> /me goes and looks at the wikipedia article.
> 
> Aha, a Fisher-Yates shuffle algoithm.
> 
> Don't be afraid to explain more in your commit messages and make them
> more reader-friendly.

Sure.
This patch initially was at the tail of the set, after the commits
where this algo is mentioned several times in a more detailed
manner, but I moved it to the head then as the requests for doing
this unconditionally converted it to a pre-requisite.

> 
> > We'll make use of it several more times
> > later on.
> 
> Not important for this commit.
> 
> ...
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks!
Al
