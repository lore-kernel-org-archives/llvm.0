Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98D1C3D
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 06:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB14C433D6;
	Tue, 18 Oct 2022 06:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666075709;
	bh=Jy99C/HcPBQSTw9vUyzUhj6RU0lBf7est7ynINYHjgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7LMjvAM56VBwOkW7oaTupASb5CBMChVlfdtIkhxVyoy6xtqRPIxJzXH1DXYY7c+W
	 zTQn75vlxLnYdOTiBqAN2qS/P5pkzu/NSgD8jogwdjEgpvood6sn244ohWWhV5pXEQ
	 hLM6iXCMcOcgqdQ3WWDjTPK+tH5nA7AhIq8korSQ=
Date: Tue, 18 Oct 2022 08:48:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Apply 0a6de78cff60 to 5.15+
Message-ID: <Y05MLG3EFoOuYmi1@kroah.com>
References: <Y02WW7iIeWPFTV8L@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02WW7iIeWPFTV8L@dev-arch.thelio-3990X>

On Mon, Oct 17, 2022 at 10:52:27AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please consider applying the following commits to 5.19 and 6.0:
> 
> 4f001a21080f ("Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5")
> bb1435f3f575 ("Kconfig.debug: add toolchain checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT")
> 0a6de78cff60 ("lib/Kconfig.debug: Add check for non-constant .{s,u}leb128 support to DWARF5")
> 
> The main change is the final one but the second patch is a prerequisite
> and a useful fix in its own right. The first change allows the second to
> apply cleanly and it is a good clean up as well.
> 
> I have verified that they apply cleanly to those trees with 'patch -p1'.
> Attached is a manual backport for 5.15; the changes should not be
> necessary for older trees, as they do not have support for DWARF 5.
> 
> If there are any problems or questions, please let me know.

All now queued up, thanks.

greg k-h
