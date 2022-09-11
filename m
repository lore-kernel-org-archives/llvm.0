Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A77F
	for <llvm@lists.linux.dev>; Sun, 11 Sep 2022 05:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B01C433C1;
	Sun, 11 Sep 2022 05:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662874790;
	bh=mybsurrOWREMvkGSNhERfDf80wwy/PvQEsIMp7BiC4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyvC7fIrBq7GTbK6ryPo5gZ8w6bIquzA9/Fkn3cM0sDr0I4V2kTqKZvB8vpeiHdYl
	 HTRZ3fzqIkd5JlgvRxcTa7TAsxPCxDoWlA5WHlAzKw/OTOvc0ipXQehDgNIRutAi3e
	 PuHzAw4YI03J7hfSx6BK76SJktopU+Y9z6goXSBI=
Date: Sun, 11 Sep 2022 07:40:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Apply 5c5c2baad2b55cc0a4b190266889959642298f79 to 5.10+
Message-ID: <Yx10s6a7dnOZ+uI0@kroah.com>
References: <Yxyga8k1jee5A9Vs@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxyga8k1jee5A9Vs@dev-arch.thelio-3990X>

On Sat, Sep 10, 2022 at 07:34:19AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please apply commit 5c5c2baad2b5 ("ASoC: mchp-spdiftx: Fix clang
> -Wbitfield-constant-conversion") to 5.10 and newer, as it fixes a
> warning with tip of tree LLVM. There will be a minor conflict that can
> be resolved by taking commit 403fcb5118a0 ("ASoC: mchp-spdiftx: remove
> references to mchp_i2s_caps") before it, which seems reasonable to me.
> If that is not acceptable, I can send a backport with just 5c5c2baad2b5.

Both now queued up, thanks.

greg k-h
