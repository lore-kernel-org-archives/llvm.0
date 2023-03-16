Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491720EE
	for <llvm@lists.linux.dev>; Thu, 16 Mar 2023 08:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BBBC4339C;
	Thu, 16 Mar 2023 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678955084;
	bh=5Q/QIbLOXO7DCEdS2CkGNvVExG82N1FQBQzurDfaNbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBVXTD+d2H/giNE16Fnu4bqvkkJk2n9kNNBGGlNWW09d32wNq/dLGloKfi5b2Zmu1
	 mDKktg73vNd5UsftKZwdSyLOELquugliYYxVZtH/DjSDDwpH2jZsoMXO2277liLMkt
	 g62aK8v7zkx+FpMX72mOVEfb/scQaW6H26vrVG40=
Date: Thu, 16 Mar 2023 09:24:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: sashal@kernel.org, stable@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: Re: [PATCH] Makefile: use -gdwarf-{4|5} for assembler for
 DEBUG_INFO_DWARF{4|5}
Message-ID: <ZBLSSWw4G86Ka6BZ@kroah.com>
References: <20230315214059.395939-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315214059.395939-1-ndesaulniers@google.com>

On Wed, Mar 15, 2023 at 02:40:59PM -0700, Nick Desaulniers wrote:
> This is _not_ an upstream commit and just for 5.15.y only. It is based
> on upstream
> commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files").
> 
> When the user has chosen not to use their compiler's implicit default
> DWARF version (which changes over time) via selecting
> - CONFIG_DEBUG_INFO_DWARF4 or
> - CONFIG_DEBUG_INFO_DWARF5
> we need to tell the compiler this for Asm sources as well as C sources.
> (We use the compiler to drive assembler jobs in kbuild, since most asm
> needs to be preprocessed first).  Otherwise, we will get object files
> built from Asm sources with the compiler's implicit default DWARF
> version.
> 
> For example, selecting CONFIG_DEBUG_INFO_DWARF4 would produce a DWARFv5
> vmlinux, since it was a mix of DWARFv4 object files from C sources and
> DWARFv5 object files from Asm sources when using Clang as the assembler
> (ex. `make LLVM=1`).
> 
> Fixes: 0ee2f0567a56 ("Makefile.debug: re-enable debug info for .S files")
> Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)

Now queued up, thanks,

greg k-h
