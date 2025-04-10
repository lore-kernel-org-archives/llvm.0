Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571181BF37;
	Thu, 10 Apr 2025 00:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744245755; cv=none; b=jMi21xMGUYVBXoFUpUM1FCnNqCFPU4MWW91u114vK+35vFUyQBgWQuZe8PLMIdlNKmQzCb2lJN/tGxMPy9Ff7oL4mk8sj02bZqZyUqtIeQ48Mh5HzNK3E9AEE4eclhskcfy1O+b6dxWdoR4RI3nLw66fqrtg6vXbNfXwTZw24To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744245755; c=relaxed/simple;
	bh=P2S8aK12CClwWGnVC/C9FYOWUgsMiQv8sGdu86HwovQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JRxJRmRBD1a00tOGnTKAtEfrwgrWkrpxyr3K4/0PRFsLAB0Ly6s6DBKKOOjcC3BgE4SYBQ+no5uDUvVbOmQCb6SVE4EddJdWSeFqRBQ1TByRRa7t44+yI1I68gaML3L7tl33v7XzwQwMLo2Y576mxCEDDLNvmKmnYngh5TGAJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1YLlTHr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1YLlTHr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73583C4CEE2;
	Thu, 10 Apr 2025 00:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744245754;
	bh=P2S8aK12CClwWGnVC/C9FYOWUgsMiQv8sGdu86HwovQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1YLlTHr6aZl6aiOLDWOjvA9F9jdJVScTUDlPw8J4aNcuKuAz/bFN5bs3dYr6ifQz4
	 g/9FtefeZnZ0vl0fjMVAFC82ra8kz9iPeUb3rUGLNItd2+u94FQdjlSrAXvAhI7mRn
	 q6kJ9tAydVqqz/axWz0CUbqYyvfiMiHFn9GCSr9Y=
Date: Wed, 9 Apr 2025 17:42:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Tim Chen <tim.c.chen@linux.intel.com>, Baoquan He
 <bhe@redhat.com>
Subject: Re: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Message-Id: <20250409174233.b3703db45767fbe5b9cd3b5b@linux-foundation.org>
In-Reply-To: <20250409165452.305371-1-sj@kernel.org>
References: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
	<20250409165452.305371-1-sj@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 09:54:52 -0700 SeongJae Park <sj@kernel.org> wrote:

> > I'll add this:
> > 
> 
> ...
>
> This makes my build fails when CONFIG_DEBUG_VM is unset as below.

Uh, OK.  I'll leave this to Kemeng to address, please.
