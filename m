Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5215667
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672680284; x=1704216284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MsclmYEbFQLTFumk27drrI0fnEhnwF05BH3vrcK1XM=;
  b=Zuu0P2qceyuck5L3YA/oO/w+5y5QRYkCcYNfbk5pwlE0gZtMBOg5xHrt
   QpH6M8QfT8h7GK7VhQuJU/5iL46+7D559BMoCuC3QPZFigBHJthVOBTE9
   Z3MHa3i1VWacAEcl4GSibn5uH4PfDBDtVdYHqtuQ2o1dnu4BYRQtj5cOe
   yGVlbf9rC60Tup8plc0P5VSLrR4ge9fo/yEPozIXsYJdDFCXnjSHYcsI1
   QQjN8WqJkAkDBvzV4KxqUSh/cLwdtoIGUYfU3Aenw47d5VIijriMzy/8s
   g+UyORqtyvyX2bLY6PtKYhp8+XvDM45ZwD83yN1QvWFlRwTjNLWo1Jm33
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="320231192"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="320231192"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 09:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="632193640"
X-IronPort-AV: E=Sophos;i="5.96,294,1665471600"; 
   d="scan'208";a="632193640"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 02 Jan 2023 09:24:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pCOY3-003WV9-0D;
	Mon, 02 Jan 2023 19:24:31 +0200
Date: Mon, 2 Jan 2023 19:24:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Turner <mattst88@gmail.com>, Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S. Miller" <davem@davemloft.net>,
	Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
	Tony Luck <tony.luck@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>,
	linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] bitops: always define asm-generic non-atomic
 bitops
Message-ID: <Y7MTTtlDCottjQi1@smile.fi.intel.com>
References: <20220624121313.2382500-1-alexandr.lobakin@intel.com>
 <20220624121313.2382500-3-alexandr.lobakin@intel.com>
 <Y7MC5/wxgGZz/met@boxer>
 <20230102163059.3556962-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102163059.3556962-1-alexandr.lobakin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 02, 2023 at 05:30:59PM +0100, Alexander Lobakin wrote:
> From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
> Date: Mon, 2 Jan 2023 17:14:31 +0100
> > On Fri, Jun 24, 2022 at 02:13:06PM +0200, Alexander Lobakin wrote:

> > this patch gives me a headache when trying to run sparse against a module.

No, it's not related to this patch.

> > Olek please help :D
> 
> It was fixed shortly after the build bots turned on on the original
> series with [0]. Hovewer, no release tag's been made after the fix.
> There's also a short discussion regarding packaging Sparse 0.6.4 for
> Debian with that fix cherry-picked[1], not sure if it led anywhere.

Debian already fixed that for a few weeks at least.

-- 
With Best Regards,
Andy Shevchenko


