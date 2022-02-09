Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E6F2C9C
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644433160; x=1675969160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lDXFHCnNkuwrtByUN11SlzF5cvcRHsyXQHMq9A+A45Q=;
  b=nJKmZQ0ile1Very0iKjS3oykHLspIlbGooSw/dSeN2w0yLiloZvQcAR2
   d2JFpzSmTDcnLuPst46KlNElh2nyttY2qRtheQaaeH/BZQLRO1IQbQcn1
   8YRooZxDWwoTnXiohacIKdGlkHQBFhLpz5/3+8jXEaPnIVM22YjiVzF02
   ysIy+abn0d1iuaIhIYwWE38KT20v10CD1bmOTZm5Jz0o3Bq+1UDMI/rsL
   gSf94IPkwERVXrbvxKKz/jM9ewUbgq4K5sEVXfrmpYEiBrTVyUJEq6GXG
   XFOsn1v3TXCrdgTk46ecB5WzZ5TqINAPKv3e+5ubfqW5fJRrR5gmVhLWf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="312597913"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="312597913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 10:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="485376320"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2022 10:59:11 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 219IwjQY031082;
	Wed, 9 Feb 2022 18:59:09 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: linux-hardening@vger.kernel.org, x86@kernel.org
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
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
Subject: [PATCH v10 11/15] x86/boot: allow FG-KASLR to be selected
Date: Wed,  9 Feb 2022 19:57:48 +0100
Message-Id: <20220209185752.1226407-12-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the kernel has full support of FG-KASLR from both core and
x86 code, allow FG-KASLR to be enabled for x86_64 if the "regular"
KASLR is also turned on.

Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f6bb48d41349..d5442107a915 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -105,6 +105,7 @@ config X86
 	select ARCH_SUPPORTS_ASM_FUNCTION_SECTIONS
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	select ARCH_SUPPORTS_FG_KASLR		if X86_64 && RANDOMIZE_BASE
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if X86_64
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
-- 
2.34.1

