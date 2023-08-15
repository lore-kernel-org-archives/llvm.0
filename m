Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7817ACA
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KNXPvYcZb7t5cm0QAdkUsloaAM5T4oHA+oToVO1OQQM=; b=beY9uSXeRpnVTnYCsL6X+sk2Ek
	DZDib77o+BAJyCGsCND7saxzTldBTUdEiU/SgQ6nevWgBsV/b3Jf7tjniPlOc9KmbiCjYTMMepviR
	bC9w6DXdb34+m00CYFpJ97xEh8vTs9me2ZOPKqkf8j+3kaByYO58/WUmkKTnwP640NEg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qW0rD-004CEM-V0; Tue, 15 Aug 2023 22:41:39 +0200
Date: Tue, 15 Aug 2023 22:41:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Stitt <justinstitt@google.com>
Cc: Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] net: mdio: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <cf3a36ea-d8d2-4560-9032-04ecc2ad7495@lunn.ch>
References: <20230815-void-drivers-net-mdio-mdio-xgene-v1-1-5304342e0659@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815-void-drivers-net-mdio-mdio-xgene-v1-1-5304342e0659@google.com>

On Tue, Aug 15, 2023 at 08:35:59PM +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/net/mdio/mdio-xgene.c:338:13: warning: cast to smaller integer
> |               type 'enum xgene_mdio_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         338 |                 mdio_id = (enum xgene_mdio_id)of_id->data;
> 
> This is due to the fact that `of_id->data` is a void* while `enum
> xgene_mdio_id` has the size of an int. This leads to truncation and
> possible data loss.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
