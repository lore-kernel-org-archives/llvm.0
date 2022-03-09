Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0796A48C1
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 16:51:16 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 580A91F382;
	Wed,  9 Mar 2022 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1646844669;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ydrdKSlhrPNxyTjqpwFz/lVnyTdgAwQsHL5yVVlnOA=;
	b=eT82rI/QkvGXelJqBnDXZ6DSfPbxpE/9kD06Wm421Hm28d/zpE1K/K13KnElJN5d398JeQ
	RonRRpZIKvqzB9DndgVzGEF+km1Drf8ASsp0Z5z3QYRgp3nDF+PHkgDWoDZ0xSUG1Sq9fd
	+hLU73pHUPEXalYPJ3MNoU06ZwyMbSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1646844669;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ydrdKSlhrPNxyTjqpwFz/lVnyTdgAwQsHL5yVVlnOA=;
	b=yLp5xgKJZ2+1DXVn2EKVVMwLVmSTPLl60bWHoe7jQGGzYDxZ+kesslNxqqwqygWh/uLI0o
	f+LcpnR/hjl7ZWCQ==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 342BAA3BCC;
	Wed,  9 Mar 2022 16:51:09 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 9C727DA7DE; Wed,  9 Mar 2022 17:47:13 +0100 (CET)
Date: Wed, 9 Mar 2022 17:47:13 +0100
From: David Sterba <dsterba@suse.cz>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, alexs@kernel.org, arnd@arndb.de,
	dsterba@suse.com, elver@google.com, jani.nikula@intel.com,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	mark.rutland@arm.com, ndesaulniers@google.com, ojeda@kernel.org,
	torvalds@linux-foundation.org
Subject: Re: [PATCH 1/4] [v4] Kbuild: add -Wno-shift-negative-value where
 -Wextra is used
Message-ID: <20220309164713.GX12643@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Arnd Bergmann <arnd@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, alexs@kernel.org,
	arnd@arndb.de, dsterba@suse.com, elver@google.com,
	jani.nikula@intel.com, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, mark.rutland@arm.com, ndesaulniers@google.com,
	ojeda@kernel.org, torvalds@linux-foundation.org
References: <20220308215615.14183-1-arnd@kernel.org>
 <20220308215615.14183-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308215615.14183-2-arnd@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Tue, Mar 08, 2022 at 10:56:12PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As a preparation for moving to -std=gnu11, turn off the
> -Wshift-negative-value option. This warning is enabled by gcc when
> building with -Wextra for c99 or higher, but not for c89. Since
> the kernel already relies on well-defined overflow behavior,
> the warning is not helpful and can simply be disabled in
> all locations that use -Wextra.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> [v4]
>   split into a separate patch
> ---
>  drivers/gpu/drm/i915/Makefile          | 1 +
>  drivers/staging/greybus/tools/Makefile | 3 ++-

For

>  fs/btrfs/Makefile                      | 1 +

Acked-by: David Sterba <dsterba@suse.com>
