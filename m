Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683D2874FE;
	Wed, 18 Mar 2026 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851031; cv=none; b=eQ5ukjkv+W8Nm8LXcAHm3zcUWLvbne+Utbk4l7MFAcNJXacL3Rg6cPnGIU47FOAZnIVpPFkbUAhLt0d6W7ect9sUHIiiokJUmAwMgGEow93FQ14XBHrxa+c0TQnREGsmoArRBq8xwFNYJ1Acs4QXpr36bjSMA+EmP6x52EI96aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851031; c=relaxed/simple;
	bh=aHDPWpZDMzCjnS+BH41VMj7QJyPcpd/avzDQ23CMQro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qww5FAzKt8PP9VQ9tikjVeIjHCgNxJLPs5sMahdp0WVDVrgCcXK3SDQsgO+AVzGAZ7dj8odAPWrGb/C8fGLynNtlEkFZBHTZaJdfjVJFwJ5m3QuAj2PmUJ5qe1omZQ+z1psG+jQBBbgUTzDKDmlmwMt7jUIranoUktBdBbabDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdZGBgv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdZGBgv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F73AC19421;
	Wed, 18 Mar 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851031;
	bh=aHDPWpZDMzCjnS+BH41VMj7QJyPcpd/avzDQ23CMQro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdZGBgv5YWx0TYo+oWteCzNNwypClO+BO/MRtYEk3hcEoaHao1e03dcWncP6jZy0W
	 002s5AmEzSijgdE1V9Ai9ewFbTf6yNLRf/TiRTV+77j4pJAh/2bRonLVn5RBf3Rfdw
	 XoGkaq5agwYmcCuipK7wtBMfO4qSIT3gHUq5J7Gwif4k6Xft1QGW4o2fiqg20iFfQ/
	 Eqimz+vJrdxpF/FqGA7gZJzZbjzpgmtKydXbx7hcfk141g/bVLJksJhT4BpyKPnVUz
	 V/pobnZjb+qjWY5bTIejiW4f3yLxj1a85I/75YgnZeue9SncL4hyYurP44bD5a1LFZ
	 eAz+fb6k0LxfQ==
Date: Wed, 18 Mar 2026 09:23:50 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>, Tao Zhou <tao.zhou1@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gangliang Xie <ganglxie@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/amd/ras: work around write overflow attribute warning
Message-ID: <202603180923.9208D4C4@keescook>
References: <20260318105050.1947902-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318105050.1947902-1-arnd@kernel.org>

On Wed, Mar 18, 2026 at 11:50:36AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 warns about possibly copying beyind the end of an array:
> 
> In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:24:
> In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27:
> In file included from drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:29:
> In file included from include/linux/string.h:386:
> include/linux/fortify-string.h:569:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>   569 |                         __write_overflow_field(p_size_field, size);
>       |                         ^
> 
> As far as I can tell, this is a false-postive warning, but there is
> an easy workaround, by using a direct struct assignment in place of
> the memcpy.
> 
> Fixes: 7a3f9c0992c4 ("drm/amd/ras: Add umc common ras functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Yeah, direct assignment is much preferred anyway. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
