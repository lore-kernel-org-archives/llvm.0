Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87310FD
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655908687; x=1687444687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xA+AX77vbPPnWCLAuym9yD93ebv8XWnin6EN1d9z6Y0=;
  b=hQc6b+5uHOKQCo3GhbE2Tlz7cn+LJ2lsWHHc70nj6kdtLL/NS5TouowG
   35Xfqw9HJx6VFh4KDTRLQpWXfo5DRT0TW5nA+wh5YOR1W60v8E5ivfumy
   cctGjz/g6gLcUhPB3Ez9L4vmW6OiDmcVK7Vmur/E8dD24yu/3mlKR7Mte
   fhlb56WAA/dP/cXBvWRduxPE1KZ7ibLGXY+oJtCy6plmLeU+Jl5ALDMC0
   hUiIS1RWLXLG/74cPyg8Yw4/kRnwZRdEarQGh4QhrLGN2755DcYl2kbL+
   4qxpi6Zmujlkqz6bhpSldtLv+GfWpEvLcyuMVGHQYp3Jc6vg1UlitGbSi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281163588"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="281163588"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 07:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="715428449"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2022 07:37:43 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 25MEbfrW014711;
	Wed, 22 Jun 2022 15:37:41 +0100
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>, Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v4 0/8] bitops: let optimize out non-atomic bitops on compile-time constants
Date: Wed, 22 Jun 2022 16:37:39 +0200
Message-Id: <20220622143739.291698-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YrMlrjbue7twWLk1@smile.fi.intel.com>
References: <20220621191553.69455-1-alexandr.lobakin@intel.com> <20220622122440.87087-1-alexandr.lobakin@intel.com> <YrMlrjbue7twWLk1@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 22 Jun 2022 17:22:38 +0300

> On Wed, Jun 22, 2022 at 02:24:40PM +0200, Alexander Lobakin wrote:
> > From: Alexander Lobakin <alexandr.lobakin@intel.com>
> > Date: Tue, 21 Jun 2022 21:15:45 +0200
> > 
> > > While I was working on converting some structure fields from a fixed
> > > type to a bitmap, I started observing code size increase not only in
> > > places where the code works with the converted structure fields, but
> > > also where the converted vars were on the stack. That said, the
> > > following code:
> > 
> > [...]
> > 
> > Oh gosh, now s390 failed and 7/8 revealed one existing code flaw in
> > the ice driver.
> > I'll fix those, then will try to test more platforms (to not spam
> > series again) and send v5 soon (mentioning this as bots CCs only
> > myself).
> 
> One mail per person? Because I also got a report.

From the headers:

From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: <llvm@lists.linux.dev>,
 <kbuild-all@lists.01.org>,
 <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I guess it's due to your Reviewed-by in the commit message, no one
else from the original CCs list is present.

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Olek
