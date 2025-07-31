Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7B101EE;
	Thu, 31 Jul 2025 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753984705; cv=none; b=r0134ClwZRn1T7Vs5OW1Cm8jo/nZLEh6BkzEL3xmwnmnC+wt9agFYsKHJNm4wbtVjIxN2wt8a2OkHOck3hHmiEW5xij88tDVds5M3tigTxshCiGjzey0BI9zh5ouXqcWRMdn/WDM8NWyFaj0r1dvfkeZmaluh9mwZ+svAPe/uTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753984705; c=relaxed/simple;
	bh=3QYv7hcqf9e1dHZCHrteuoD/HuUa2tNtGGNvaPfF7Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UELUP9eXbg0vur4p8oDthpdwxXVKMwhvzBx9gjRa3ao5nP09xyLipbIPx3/HNm8SF5cMCTms1/BchOrh2PO65EpV2tQa6vX+BE2zXoj6vALX5sAfIUari8ht6o6a5y+DkpK1G28YCDFea3aDzEcPF3KOgs7TiTWWdI2K8AX4M/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zgrs1KT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zgrs1KT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5214EC4CEEF;
	Thu, 31 Jul 2025 17:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753984705;
	bh=3QYv7hcqf9e1dHZCHrteuoD/HuUa2tNtGGNvaPfF7Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgrs1KT+WTIYvRVFIPKvv5k/dcfgc63ikDuQBTwSv0FYmYsiNJ3XCnJLFm3VFnoBP
	 gO+I82qS+8YkfS7cSjucQkYlL6yhStQguUm+2Bpin8H/y0w/2CdP2LBE5DDqMyfcTA
	 jeTxXI+nS16WEHKUefLWXvIbTbq/mKyICyuaWkRRgE5DK1lyc/yz1/PnakW2lPrV17
	 1WmcIgfVpNqblIfBDy3aaORB5eSIJLmhnAa8aBhxYPpbWm/2Vg0ENVIW5ZFZzT5vjR
	 tsy/8dxzTInfD4g//GC7wjSZYItVptC2KCSEYBfdl+MGO+i84wVbEarCY4Y1+8zC2Y
	 lzHG7dMLTU6bQ==
Date: Thu, 31 Jul 2025 10:58:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: Re: [linux-next:master 10769/12889] vmlinux.o: warning: objtool:
 f2fs_parse_param+0x80: sibling call from callable instruction with modified
 stack frame
Message-ID: <20250731175820.GB1455142@ax162>
References: <202507301859.QJFfmnU0-lkp@intel.com>
 <ee3e9dfb-a5a9-4dd1-aaaf-916ed2938403@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee3e9dfb-a5a9-4dd1-aaaf-916ed2938403@huawei.com>

On Thu, Jul 31, 2025 at 09:47:45AM +0800, Hongbo Li wrote:
> > > > vmlinux.o: warning: objtool: f2fs_parse_param+0x80: sibling call from callable instruction with modified stack frame
> 
> Does this need to be addressed? It appears to be related to compiler
> optimization settings.

I have started a separate thread with some LoongArch folks around this
issue:

https://lore.kernel.org/20250731175655.GA1455142@ax162/

Cheers,
Nathan
