Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D657F;
	Thu, 24 Aug 2023 01:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KprUD1fZl1q1RFOckCpReD7n8OxB4pYnkqaHq8r805c=; b=jb4jqkfAuZIlb1ai0uoiPnVsSm
	hTzX/mJ4OYFIm1B7ohIAGoKS0WuEOLrOJj6biHwGbGe/5rs+NANWCNwSszZyY35PlFxjvuXEKOXOj
	gP3w1ZP/Duk9VSRfSWE2P/F2e834olXmQDXMyzIiSAibtcmOThJaXja3Ygk67sFA+CILmShCgSYDG
	kOSkudXA3rdIfFKNUEkpz4zkzPdJ9o+qH+XNbIQ+9JAAoGzLfrlnv0tR4kum71hQlQTX1QSDu7s9n
	91BsIA4JX1zoOoq25mc9lHO5CCCY0IlinkHU4Wg/sZadq2f8uc13y4MnqVzfGotNGxDXBBM+1yloK
	UQFsAegw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYyq1-0081Ia-6F; Thu, 24 Aug 2023 01:08:41 +0000
Date: Thu, 24 Aug 2023 02:08:41 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 11462/12208] mm/internal.h:709:3: error:
 implicit declaration of function 'release_fault_lock' is invalid in C99
Message-ID: <ZOatmXjnQ71xJZHu@casper.infradead.org>
References: <202308240613.DrqV4VT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308240613.DrqV4VT4-lkp@intel.com>

On Thu, Aug 24, 2023 at 06:51:10AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
> commit: 0790e1e2b1b71ba357e89e779451efe79dff28e6 [11462/12208] mm: allow fault_dirty_shared_page() to be called under the VMA lock
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308240613.DrqV4VT4-lkp@intel.com/config)
...

>    In file included from mm/filemap.c:50:
> >> mm/internal.h:709:3: error: implicit declaration of function 'release_fault_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    release_fault_lock(vmf);
>                    ^
>    12 warnings and 1 error generated.

This is a patch ordering issue (and thus bisection hazard)

release_fault_lock() is introduced in d169f9691c08 ("mm: handle swap
page faults under per-VMA lock") which is currently ordered after
0790e1e2b1b7.

It's architecture independent, and ARCH=um is not the relevant part, nor
is clang implicated.
