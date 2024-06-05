Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B092BD0D;
	Wed,  5 Jun 2024 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717568257; cv=none; b=YC6P/sfPZRn35jN6XyL8kIHoFAg7QKQ55yGk2KGKWzlRdC7i95eiaUsj55sGk2IzpG7uzivVNZHX9oEQXR/EHFkQKVCZJY32NLzveFvEJnmOezJpEibfMiENTPBL5c4ZK2CVTd6qa9ZCnpnG6OFGpTzT49vRlcqeDoQJLbzH4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717568257; c=relaxed/simple;
	bh=yV4hXhnbkqRWbzKRQFt000wHs7U2KnsfGgFlcBTFv+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9ey4SnKWcVsTgQlhSKfpPMEA11EAqzGLwyOvESV73AVfoyQtY1gdcaBw+kBnzJT7Rx9dvafZD/Aq6KhfFld32dO7zRBqxNCVhKh/fgrm7ccfbaOGQVZAwhZ0xqLg4VS97QGHD3hS40SmJAZ3akHct2Djz69rT17k4QZix6wpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zxl6qe8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zxl6qe8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B315C32781;
	Wed,  5 Jun 2024 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717568256;
	bh=yV4hXhnbkqRWbzKRQFt000wHs7U2KnsfGgFlcBTFv+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zxl6qe8BJtjkxN3sCVNGkgprZEMnKAOonITeplAzjP3FIJOa9JiRErHhGfYf6VqNd
	 rPRIrPdsWU9Nj5/gPCHgKZs3Rp2Ck3LxC5oK5v7G6aewmh+mvDulRDT8tqnRhQlj5o
	 K79JhFH+nff4GVtW7webgIy/2wYIVVZSsyyscCFFbIW2APqvR4n2Z3loxLX+81vR4A
	 ci/KVPMSJhPsGb8ziTjHudYeHE8xrjUlxp+142EZxKlnwoIJlQINXDrjkacURrUSrs
	 MeNUsaFCAVNWDw5Bo7X0QdxJphvnXnr7CulcxtS+CwH7NSY7ELRmy+ROM9MEXf4Blk
	 /jhpKn4mNEooQ==
Date: Tue, 4 Jun 2024 23:17:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linux-next:master 1323/3381]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4: error: format specifies type
 'unsigned char' but the argument has type 'int'
Message-ID: <20240605061734.GD279426@thelio-3990X>
References: <202406050622.SmOX6DL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406050622.SmOX6DL6-lkp@intel.com>

On Wed, Jun 05, 2024 at 06:23:57AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d97496ca23a2d4ee80b7302849404859d9058bcd
> commit: 0ea55445554209913a72eab86b60f5788776c4d6 [1323/3381] drm/amdgpu: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
> config: arm64-randconfig-003-20240605 (https://download.01.org/0day-ci/archive/20240605/202406050622.SmOX6DL6-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050622.SmOX6DL6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406050622.SmOX6DL6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4: error: format specifies type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
>                     xcc_id, ring->me, ring->pipe, ring->queue);
>                     ^~~~~~
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:12: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
>                     xcc_id, ring->me, ring->pipe, ring->queue);
>                             ^~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:22: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
>                     xcc_id, ring->me, ring->pipe, ring->queue);
>                                       ^~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:34: error: format specifies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int') [-Werror,-Wformat]
>                     xcc_id, ring->me, ring->pipe, ring->queue);
>                                                   ^~~~~~~~~~~
>    4 errors generated.

For what it's worth, I think that we take care not to enable -Wformat
with clang versions older than 16 because of this issue, see commit
b0839b281c42 ("Makefile.extrawarn: re-enable -Wformat for clang; take
2") for more information. However, now that I am looking at
scripts/Makefile.extrawarn, it appears that we only do that for a normal
build, not W=1? That seems like a potential oversight of that change but
I am a little fuzzy on the conversation around that and I am not sure
Nick is around to answer that...

Cheers,
Nathan
