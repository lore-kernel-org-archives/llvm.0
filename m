Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227823C3
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 21:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bnDPlV0Dc9sLm1RymyVAiKBxdIfGczhj1WyheEv8HQE=; b=a6pHHUQGzYqW14TCoRaSs4xOv1
	rE9WS1HZ3jD+28LyqdyXmT9x2Y1eWe/yx+uEEHo7MvSK4VxVc0LwHVUZVX17OgL+V9VtA3cCl8Nft
	+cnRFKeqW7sft25+rB0unT20iMTMxue7wsEUfAlsfsEJ0MWdTINioKPZjfDZiNtQv4gv4X49bIA5y
	GYyS8lJRgDNuo0a0CoRmhsMUkteoqGyoC1NtxlPjxMGOEcessAizYe+q1vFUXXH46RTU8XVMxH8gQ
	gjfX96LsZiQcJ2fytOIUBkUmRHxMCjx4h1sZiHVD6x3zgmO1xyL7gh16d8t2h+Y3f1v7SgqFjpdBQ
	hnXC3YAQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkulB-00DblM-Pu; Sat, 30 Apr 2022 21:36:13 +0000
Date: Sat, 30 Apr 2022 22:36:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [willy-pagecache:for-next 60/69] fs/ntfs/aops.c:378:12: warning:
 stack frame size (2216) exceeds limit (1024) in 'ntfs_read_folio'
Message-ID: <Ym2rzWiP8iNRHWxS@casper.infradead.org>
References: <202204301355.hFVoSOPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204301355.hFVoSOPa-lkp@intel.com>

On Sat, Apr 30, 2022 at 01:11:43PM +0800, kernel test robot wrote:
> >> fs/ntfs/aops.c:378:12: warning: stack frame size (2216) exceeds limit (1024) in 'ntfs_read_folio' [-Wframe-larger-than]
>    static int ntfs_read_folio(struct file *file, struct folio *folio)
>               ^
>    1 warning generated.

Am I getting this warning because I changed the name of the function?
Or did I do something Bad?
