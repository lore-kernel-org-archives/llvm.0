Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA20441F;
	Tue, 10 Oct 2023 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wb+Xk4J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDF3C433C7;
	Tue, 10 Oct 2023 00:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696897924;
	bh=LDyd7HoMfWZeooT24v4F76QudG81vVKSM7PM7vJRP0c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wb+Xk4J3tAsqKsKwwBacAoxb9jiZt4+KD4sS1mRAZhgT98aSQ31gweLX77wBzAP35
	 QMH407LwvF/I9Ly8JdgZEt0SawDDS2QPsH8/vo+jCJ3whIB7S4Zt4omOZeRsNvVBmS
	 Fpv1kG0alPvZpa8PgAn+4rxdfmx6wwpxlLyjKpTk=
Date: Mon, 9 Oct 2023 17:31:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 175/204] mm/list_lru.c:98:7: error: call to
 undeclared function 'list_lru_from_kmem'; ISO C99 and later do not support
 implicit function declarations
Message-Id: <20231009173147.0ab0e6136e461c6bd246775e@linux-foundation.org>
In-Reply-To: <202310072139.CXKkky51-lkp@intel.com>
References: <202310072139.CXKkky51-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Oct 2023 22:08:25 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
> head:   2b76550922a81fd63e16b81b6b39f1eb19df52f0
> commit: a39744c1a652d8847098d9f1a022b50a9ceb3f10 [175/204] mm/list_lru: remove unused function
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231007/202310072139.CXKkky51-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310072139.CXKkky51-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310072139.CXKkky51-lkp@intel.com/

Well drat.  It's a shame that it took 2+ weeks for this to be discovered.

I'll plan on dropping a39744c1a652 from mm-stable, thanks.
