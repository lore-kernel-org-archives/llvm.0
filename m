Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4064ECB;
	Fri, 16 Jun 2023 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7NMn5FMbTfSQEBtJ1sgdlKHxn3BWoPbJ2tOem4xpBjA=; b=jqFB1SofE1CtkJBNNhAbJW8LN+
	d2G+pzpSGadm6Lu/qQ4syWd4EZsH0bHKgnsaOlHaX3zbnmuyb2qf9ImHo3b9ZpEK3u5CwvtjB3Wdb
	U2Tb9YFgCVSTOKkcqgBpX7JfVJhF89PCyCBoNTrKNtZnW/bc2KFksKMNwcr9nwJo3PT6s/0UfHfcG
	8L7f4Cy5gUDEIQuhFaJveWAjjqPjUL+rW43gx+4pSsUKhea7NiJT9m24w35J3WDc5hT8EfAGwlMsy
	O3n/z3VL9OasdFPf1ri3RtE6KAYL8cjgzuKvEVRHqW/vY5E0p3KtGZ80gczw8ivKVKmQ7GroohLUa
	+5YmzNVw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qAGVo-009MTl-PY; Fri, 16 Jun 2023 20:57:40 +0000
Date: Fri, 16 Jun 2023 21:57:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [mcgrof-next:large-block-20230616-hacks 37/38]
 fs/iomap/buffered-io.c:830:42: warning: if statement has empty body
Message-ID: <ZIzMxFPbJWnuyHHI@casper.infradead.org>
References: <202306170021.8TZdCFER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306170021.8TZdCFER-lkp@intel.com>

On Sat, Jun 17, 2023 at 12:13:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
> head:   5416cb31017b28b25627f4f5b8292af96bb65f58
> commit: ddf48d516b57d686874c57ffa3630ea19c4b7fdb [37/38] iomap: Copy larger chunks from userspace

This patch is out of date.  Luis, can you replace with the v3
patches, please?

https://lore.kernel.org/linux-fsdevel/20230612203910.724378-1-willy@infradead.org/

(there will be a v4, but so far all the changes are to comments)

