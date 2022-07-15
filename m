Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B572F31
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657891651; x=1689427651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MuD9J6xLfZe+36EwcjDB1aMvs+O7CntqPJd8E9s8qzc=;
  b=by8C/sDGu+NxkJhWPBp9MqbaKiy8jTWUoCPRrxIDEOGwt2tHtGuCLptP
   5OXbguUiLJumdlAvmCiyl3bcFQxFeqwyK39GDTm/vhKMNyVzTmYDxWrA2
   Rpixgy+s8aROd0O4NYz+2BamDSVfsUwVnlQIuXfqKTNPvAdg0PoYxjWou
   TJdkebFKvA1Gx07U/78uBVUT/krKVq0vGN4x5Y6FL41j3pdHcBwc6fF03
   xrVUu6GrReAcE/CRzpPK+fsGT37LImRrCmAm77VkXqXMwrWkqvTN35Eht
   PjVlfiUNUUMUEPYsAS0aAv2tpXOXdUhWuQC0MX3Yq5jy2jXdd0e3MOBjL
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="347469853"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="347469853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 06:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="654332878"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2022 06:27:25 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 26FDRMdI020138;
	Fri, 15 Jul 2022 14:27:22 +0100
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>, Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        kernel test robot <lkp@intel.com>, linux-alpha@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/9] bitops: let optimize out non-atomic bitops on compile-time constants
Date: Fri, 15 Jul 2022 15:26:33 +0200
Message-Id: <20220715132633.61480-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715000402.GA512558@roeck-us.net>
References: <20220624121313.2382500-1-alexandr.lobakin@intel.com> <20220624121313.2382500-7-alexandr.lobakin@intel.com> <20220715000402.GA512558@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 14 Jul 2022 17:04:02 -0700

> On Fri, Jun 24, 2022 at 02:13:10PM +0200, Alexander Lobakin wrote:
> > Currently, many architecture-specific non-atomic bitop
> > implementations use inline asm or other hacks which are faster or

[...]

> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> > Reviewed-by: Marco Elver <elver@google.com>
> 
> Building i386:allyesconfig ... failed
> --------------
> Error log:
> arch/x86/platform/olpc/olpc-xo1-sci.c: In function 'send_ebook_state':
> arch/x86/platform/olpc/olpc-xo1-sci.c:83:63: error: logical not is only applied to the left hand side of comparison

Looks like a trigger, not a cause... Anyway, this construct:

	unsigned char state;

	[...]

	if (!!test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == state)

doesn't look legit enough.
That redundant double-negation [of boolean value], together with
comparing boolean to char, provokes compilers to think the author
made logical mistakes here, although it works as expected.
Could you please try (if it's not automated build which you can't
modify) the following:

--- a/arch/x86/platform/olpc/olpc-xo1-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
@@ -80,7 +80,7 @@ static void send_ebook_state(void)
 		return;
 	}
 
-	if (!!test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == state)
+	if (test_bit(SW_TABLET_MODE, ebook_switch_idev->sw) == !!state)
 		return; /* Nothing new to report. */
 
 	input_report_switch(ebook_switch_idev, SW_TABLET_MODE, state);
---

We'd take it into the bitmap tree then. The series revealed
a fistful of existing code issues already :)

> 
> Bisect log attached.
> 
> Guenter
> 
> ---
> # bad: [4662b7adea50bb62e993a67f611f3be625d3df0d] Add linux-next specific files for 20220713
> # good: [32346491ddf24599decca06190ebca03ff9de7f8] Linux 5.19-rc6
> git bisect start 'HEAD' 'v5.19-rc6'
> # good: [8b7e002d8bc6e17c94092d25e7261db4e6e5f2cc] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
> git bisect good 8b7e002d8bc6e17c94092d25e7261db4e6e5f2cc
> # good: [07f6d21d6e33c1e28e24ae84e9d26e4e7d4853f5] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
> git bisect good 07f6d21d6e33c1e28e24ae84e9d26e4e7d4853f5
> # good: [5ff085e5d4f6700e03635d5e700f52163a6dc2a7] Merge branch 'staging-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> git bisect good 5ff085e5d4f6700e03635d5e700f52163a6dc2a7
> # good: [eb9e3fdbdd8b61ef0f4bee23259fe6ab69e463ab] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git
> git bisect good eb9e3fdbdd8b61ef0f4bee23259fe6ab69e463ab
> # good: [9f2183cd961e5ddb7954eafb6bb01a495c6a9c7b] hexagon/mm: enable ARCH_HAS_VM_GET_PAGE_PROT
> git bisect good 9f2183cd961e5ddb7954eafb6bb01a495c6a9c7b
> # bad: [e878aa5faf9ac8c0b5d0c3f293389c194c250fff] Merge branch 'mm-nonmm-stable' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect bad e878aa5faf9ac8c0b5d0c3f293389c194c250fff
> # good: [cf95d50205f62c4f5f538676def847292cf39fa9] fs: don't call ->writepage from __mpage_writepage
> git bisect good cf95d50205f62c4f5f538676def847292cf39fa9
> # good: [5103cbfd92d3587713476f94f9485b96e02f0146] Merge branch 'for-next/execve' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
> git bisect good 5103cbfd92d3587713476f94f9485b96e02f0146
> # good: [ee56c3e8eec166f4e4a2ca842b7804d14f3a0208] Merge branch 'master' into mm-nonmm-stable
> git bisect good ee56c3e8eec166f4e4a2ca842b7804d14f3a0208
> # bad: [dc34d5036692c614eef23c1130ee42a201c316bf] lib: test_bitmap: add compile-time optimization/evaluations assertions
> git bisect bad dc34d5036692c614eef23c1130ee42a201c316bf
> # good: [bb7379bfa680bd48b468e856475778db2ad866c1] bitops: define const_*() versions of the non-atomics
> git bisect good bb7379bfa680bd48b468e856475778db2ad866c1
> # bad: [b03fc1173c0c2bb8fad61902a862985cecdc4b1b] bitops: let optimize out non-atomic bitops on compile-time constants
> git bisect bad b03fc1173c0c2bb8fad61902a862985cecdc4b1b
> # good: [e69eb9c460f128b71c6b995d75a05244e4b6cc3e] bitops: wrap non-atomic bitops with a transparent macro
> git bisect good e69eb9c460f128b71c6b995d75a05244e4b6cc3e
> # first bad commit: [b03fc1173c0c2bb8fad61902a862985cecdc4b1b] bitops: let optimize out non-atomic bitops on compile-time constants

Thanks,
Olek
