Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BBAA92E;
	Wed, 12 Apr 2023 21:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D2DC433EF;
	Wed, 12 Apr 2023 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1681333562;
	bh=tBuKzWjSMLs8UvYBdSDGzOLgtVGDJL5zVZa/hiwcI7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rmhB919gqmisPXX6gHRY+oQZFyU/szgZjbTc0ox+RrAHTyBXZ1JHeV66GM0B+wVeR
	 1lzvypLhE5gOdWeXFCWLKqc0jPTeaeQ686SAQcyxCRsikU2PGYnz6buDKNXfKZGgOr
	 OYuwzUfjWWBIpqdwtFXrI3k8H7wmiOxuaUxuDIwM=
Date: Wed, 12 Apr 2023 14:06:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, urezki@gmail.com, hch@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, elver@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com, Dipanjan Das
 <mail.dipanjan.das@gmail.com>
Subject: Re: [PATCH 1/2] mm: kmsan: handle alloc failures in
 kmsan_vmap_pages_range_noflush()
Message-Id: <20230412140601.9308b871e38acb842c119478@linux-foundation.org>
In-Reply-To: <202304130223.epEIvA1E-lkp@intel.com>
References: <20230412145300.3651840-1-glider@google.com>
	<202304130223.epEIvA1E-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Apr 2023 02:27:19 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Alexander,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> >> include/linux/kmsan.h:291:1: error: non-void function does not return a value [-Werror,-Wreturn-type]

Thanks, I'll do this:

--- a/include/linux/kmsan.h~mm-kmsan-handle-alloc-failures-in-kmsan_ioremap_page_range-fix
+++ a/include/linux/kmsan.h
@@ -289,6 +289,7 @@ static inline int kmsan_vmap_pages_range
 						 struct page **pages,
 						 unsigned int page_shift)
 {
+	return 0;
 }
 
 static inline void kmsan_vunmap_range_noflush(unsigned long start,
_

