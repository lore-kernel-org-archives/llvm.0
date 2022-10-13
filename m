Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FB20E3;
	Thu, 13 Oct 2022 05:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80877C433C1;
	Thu, 13 Oct 2022 05:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665640374;
	bh=wN2/YPTyS86u+SvPb1SImwgJpnyUAlRCeWfoZaverfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDlYSmlXzctApZdYn7L9A5SpuyB4oVN4/XjogXEu1ZcdPGs/dWX96bNWocoSHW72f
	 5SU8qXHwh3OrvNIdUKVMc8JQo1/Ji+tgHjOhO0hjoF3XPEp2tkhX9r9UBQtlbt39hr
	 eSomSWKK9KJTFvE70hDviS6r0dgkbkkzsXmPdPcs=
Date: Thu, 13 Oct 2022 07:53:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Nathan Huckleberry <nhuck@google.com>, llvm@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, ndesaulniers@google.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 4.9 09/10] staging: octeon: Fix return type of
 cvm_oct_xmit and cvm_oct_xmit_pow
Message-ID: <Y0en4uFXvSikVcES@kroah.com>
References: <20221013002802.1896096-1-sashal@kernel.org>
 <20221013002802.1896096-9-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013002802.1896096-9-sashal@kernel.org>

On Wed, Oct 12, 2022 at 08:27:56PM -0400, Sasha Levin wrote:
> From: Nathan Huckleberry <nhuck@google.com>
> 
> [ Upstream commit b77599043f00fce9253d0f22522c5d5b521555ce ]
> 
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.

kCFI showed up in 6.1, so this is not needed in any stable branches,
please drop it from all.

thanks,

greg k-h
