Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B52C82
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640630102; x=1672166102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8OxMzk4LmZIvd9hWJt6fgsujXh98jLKyXLBMPu5pD0=;
  b=YeUkk1+5JFIXFWkCYQVWynwUBIa4NLuUavxnn2KULuahYWO/Eckq6Fox
   qB2xbUMXe3UdDQ9UwlMX6pZKRxbR+g4NUQxlSyzlS+u0tL1AnzEKNxM6z
   X3aJgZ+9Pe1NXZ3pVjZhi7I44IR7KxFaqLUMqLBPmG7yS+Tk07MUPMeRM
   JH+lA03hk/Z20Tsvqn9yo1JO8kEY4f6R6glywGzHA1PTGUGjdGXDg0yGE
   fB+SAmuBGkQ9kdf8Ftig49NSzgPliKFi4x8/EDhMtXlGrA1JBtjVJZfYm
   6cbf+hH+KabKFy0RP2tlnXMjz0GUuwkTBlDGg4+f+BkbP8TVHETLAKvRA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="327580841"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="327580841"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 10:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="615417656"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2021 10:34:53 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1BRIYpRQ004547;
	Mon, 27 Dec 2021 18:34:51 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Christoph Hellwig <hch@infradead.org>
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
Subject: Re: [PATCH v9 00/15] Function Granular KASLR
Date: Mon, 27 Dec 2021 19:33:18 +0100
Message-Id: <20211227183318.1447690-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <YcVq1pMHWvPFHH5g@infradead.org>
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com> <YcVq1pMHWvPFHH5g@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 23 Dec 2021 22:38:14 -0800

> On Thu, Dec 23, 2021 at 01:21:54AM +0100, Alexander Lobakin wrote:
> > This is a massive rework and a respin of Kristen Accardi's marvellous
> > FG-KASLR series (v5).
> 
> Here would be the place to explain what this series actually does and
> why it is marvellous.

As I took this project over from another developer/team, I decided
to preserve the original cover letter and append it to the end of
mine, as well as to keep most of the original code in the separate
commits from mine.
For sure I could redo this if needed, is it really so?

Thanks,
Al
