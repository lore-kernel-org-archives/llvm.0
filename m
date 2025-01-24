Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E381A3;
	Fri, 24 Jan 2025 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737684110; cv=none; b=N0BHmdV+5GKVfOdUbdRHHAfOOC5/v0JmVtVdkN/rRbzX+5vkJLGmEYGXrnjuIGeyqvLIPMD/mgEETXiJrxjP33QVyjoJTnFGiUvmEA6LcyTdKu12rUtrUuy8kuCjFY7jgVp65lCZDu+Sd0gib2k8Xrgbib64/4NVi2zniLJoR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737684110; c=relaxed/simple;
	bh=llYYVSTCdd8WGjIV6yX5USa1TGzN+n9ANSA5necuuDA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=P9aCzK1igZNi0pGmbSd3tZBIyokXG/2PKsM1NXKnRMsc2EjGS55NyTctblS40vbejSXrYpQg4XDil1TzlJrf46OUvS+hWGvIFFzhnRer0Md4NnFy1S4dRWjyVheiuuzB/5ATlO8zHgysnKZcwpAAppReRB4BSQNsBnQSFfn8oEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jA8dFWPQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jA8dFWPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3267EC4CED3;
	Fri, 24 Jan 2025 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1737684109;
	bh=llYYVSTCdd8WGjIV6yX5USa1TGzN+n9ANSA5necuuDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jA8dFWPQ9Mtw2quZUmb+EFB1zqGkgEIxCSVDUjOlNAGg3uzfMxAqo0z+jqbu7hQfD
	 9Ge2eaQa9W4IH40pVK5yrLVBua49B5XWu6tK/GiOgLOz5i5IqkNC3+5z6VbOJRLt0S
	 cPR3bbVuRnYwWsFFkU6v1qjTwEvWGzCYrqYlgoTI=
Date: Thu, 23 Jan 2025 18:01:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Hyeonggon Yoo <hyeonggon.yoo@sk.com>
Cc: kernel test robot <lkp@intel.com>, Alex Shi <alexs@kernel.org>,
 kernel_team@skhynix.com, 42.hyeyoo@gmail.com, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8826/10150] mm/zsmalloc.c:431:20: warning:
 function 'is_first_zpdesc' is not needed and will not be emitted
Message-Id: <20250123180148.4f4e6a8b2e93626efeb9d8ef@linux-foundation.org>
In-Reply-To: <96ec41ca-16d8-4960-8d4f-cedf5aca386c@sk.com>
References: <202501240958.4ILzuBrH-lkp@intel.com>
	<96ec41ca-16d8-4960-8d4f-cedf5aca386c@sk.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jan 2025 10:45:45 +0900 Hyeonggon Yoo <hyeonggon.yoo@sk.com> wrote:

> Andrew, if you're ok I'll send a patch after the merge window's closed.
> How does that sound?

Please send the fix as soon as you can conveniently prepare it.
