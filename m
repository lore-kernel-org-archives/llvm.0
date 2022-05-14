Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E12565
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EA4wtK7gQ9hqsqQdDfF22RWsFvyLaQ/vhQ6wqoitYxU=; b=AL9V84t/LcKwV+mLxijXHctdmh
	DNGbR81myT+NbbW1E0H8IBG6rYXt4/8Ey9to+Cvcee4ico9bcLTMrMkKM4MMsfcuxlBxL48Tj8mqc
	la/dQ70nK6pjxKIYL4oVbYIEx+xQHGr/n/NDfY9gkKMjdX+GRZFQTeH6atUNYtE0pnPV6kxTl1S7L
	/seUWXsisOLJWjgLB2wp1BHIJkTFhTEUThOpCzClpv6L+pnrPRrV0fEJbKHp+gkJj4L7WiCB/UNu3
	XJukGfcqpxe2DAazxfnNdNg2xhIrn4SLsDOkuxonecfc1bOL8KmE6Xro1bVTo/ttI9Ap9OiOyvM17
	5iIHN4xQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npud7-008KuL-Gf; Sat, 14 May 2022 16:28:33 +0000
Date: Sat, 14 May 2022 17:28:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning:
 stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <Yn/YsTpOh898B30l@casper.infradead.org>
References: <202205150051.3RzuooAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205150051.3RzuooAG-lkp@intel.com>

On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
> commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
> config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
...
> All warnings (new ones prefixed by >>):
> 
> >> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
>    int block_read_full_folio(struct folio *folio, get_block_t *get_block)
>        ^
>    1 warning generated.

Now show the warnings that were removed.  This patch renames the
function, and I bet there was a similar warning before this patch.

But basically, I don't care about stack usage on hexagon with clang.
AIUI, it's a known bug.
