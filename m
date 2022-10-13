Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3C20E3;
	Thu, 13 Oct 2022 05:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B77C433C1;
	Thu, 13 Oct 2022 05:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665640400;
	bh=JKvK5qnnvdNaD/71/4ZTyGVJa4Z/FNAIMsw5Vst0oEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x73m9d/b3X1I3tvjbdZ3FC+RetY04Xr8xtJZLvgRR2eYTtz34esB0hNZT0z8gV44f
	 Nbx9Dm0mqiq2FwjjxuAAn8fJcQNO6oLZfjVwbLJq0itP2SVe6j3FHxaklbpWqFGrvd
	 fzy4IleE6z+ZCs8+OKkHyBc6SfZXonFKh+ODOOyQ=
Date: Thu, 13 Oct 2022 07:54:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Nathan Huckleberry <nhuck@google.com>, llvm@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com,
	ztong0001@gmail.com, dave@stgolabs.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 4.14 11/13] staging: rtl8192u: Fix return type of
 ieee80211_xmit
Message-ID: <Y0en/E9XgB8Wyirr@kroah.com>
References: <20221013002716.1895839-1-sashal@kernel.org>
 <20221013002716.1895839-11-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013002716.1895839-11-sashal@kernel.org>

On Wed, Oct 12, 2022 at 08:27:10PM -0400, Sasha Levin wrote:
> From: Nathan Huckleberry <nhuck@google.com>
> 
> [ Upstream commit 2851349ac351010a2649e0ff86a1e3d68fe5d683 ]
> 
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.

Again, not needed in any stable branches, thanks.

greg k-h
