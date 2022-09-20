Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29E10F9
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BA9C433C1;
	Tue, 20 Sep 2022 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663684205;
	bh=I74h6Nr+i8FTSqMM2icXg4l/Z8d01teWye2vzkJV1Yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tHarhIC2/v9gdXe8pFO5gXOuAP/7hsBnlKicHFa4HPoAj/rpPDrietRKjaL4T/Jh6
	 ZdvbDq80prp81jUORiUO9QansekQg8YHYHrA/R14iIDhXbuZJ6QtnH7cqPeFWF3ztD
	 hXqC/4Y/dT7gwvq0UdYzLgOqKA3n2d2nlyxTAiBUVFmdRu+VxNIRAFji/s14TQFyn8
	 S8G767aHCoBNK/rt2XKGk+/82GueazboMFIICcJantWmx7ibIkRvX6LXAnU6dJkEYK
	 ldsGZtRZ71AmJhh1Sqq26kmLwBrRPtpgwZqJozUz+lUd44jaF22Zy7BkoIoRfKrK5Y
	 kNf+jquNSTU3w==
Date: Tue, 20 Sep 2022 07:30:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Lars Povlsen <lars.povlsen@microchip.com>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Casper Andersson <casper.casan@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: sparx5: Fix return type of sparx5_port_xmit_impl
Message-ID: <20220920073003.5dab2753@kernel.org>
In-Reply-To: <20220912214432.928989-1-nhuck@google.com>
References: <20220912214432.928989-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Sep 2022 14:44:29 -0700 Nathan Huckleberry wrote:
> -int sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)
> +netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb, struct net_device *dev)

Similarly to mana this has a prototype.
