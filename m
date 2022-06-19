Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287227B
	for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=svs5G5U9ZLanKZIE8i/7zmItG6MWpJd6KG5Sk+MzSnk=; b=LezKtrHb5jAt2iZ2TKSHG6o7fE
	BApIEjUdMAzqi/sjiPruo/A4wqLkCSA2C/PAKtuZv7JuFkxZZ+WYzRSUTGOBwJOVCdd0Da9ywtZot
	yrRaWzRw3L2yHLJ36HJtvCFT/psKGd+G0OLhlcVjQwVjMJDSlNWtgp2zbmPJP5ZRVVaksjQX+8gDN
	4azjBYJF9wI5VBRO0yjd4kgBkZlmk4Sod2ig3WZ7P89CbpV4zVKv28MJDxArIhyeYZ0FbT4yhmnKR
	IjHobQJ1pKtP3YQJ2sY2X0gC3HlvH3bIW6Hx3ijF9dJKeakE7RvStEpAWbaWv+aP152DYN/pp/NEW
	9kdqoEOw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o30J9-004Yhk-TP; Sun, 19 Jun 2022 19:10:04 +0000
Date: Sun, 19 Jun 2022 20:10:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [willy-pagecache:for-next 3/81] mm/huge_memory.c:2380:21:
 warning: incompatible pointer to integer conversion assigning to 'unsigned
 long' from 'void *'
Message-ID: <Yq90i/eTPYuGkpDS@casper.infradead.org>
References: <202206200151.WMsNVIYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206200151.WMsNVIYY-lkp@intel.com>

On Mon, Jun 20, 2022 at 02:21:01AM +0800, kernel test robot wrote:
> commit: ddf632ba3fd866d92f0ec9343984c6b2c18a788c [3/81] mm: Clear page->private when splitting or migrating a page

thanks; obvious fix pushed.
