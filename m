Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189367B
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 11:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2C6C433D2;
	Wed, 29 Mar 2023 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680089306;
	bh=lrJxW6LBRPy/CJbOq9d8xUclvtd6lwZLPJY1+hAM29g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gpi+zPCEA4bIllFgY3PlXRJomnQvj1OLjat7DA6fId7+Y2pUuD5qS8wYL/CnkIGF+
	 JMQ+aBo7yVAxg9Y8/kU8YITCtKZU4Y4RyV3PYClKbnACe8P9EylnCzM4NbdzZsntyR
	 +ZQsYWYoHY59UdlIfmopZxaCdzQ9DvWqR8+EZd594WKI1XKhoeMAB5HBJ2LaWQKR0I
	 apVBzpY+P0a6LM4vMNiF+8ja3DpvHCIoN+aeCgOFmdw++i8zWMz2N47spjmPm8oPov
	 bbN4rSRlPatwLn98h0OqhO9QR0AAPmkj7OfVBwb7jYFT2emjKo6gRbzUvRzouECHjw
	 fbkKv+vL80PHQ==
From: Leon Romanovsky <leon@kernel.org>
To: selvin.xavier@broadcom.com, jgg@ziepe.ca, nathan@kernel.org,
 ndesaulniers@google.com, mgurtovoy@nvidia.com, Tom Rix <trix@redhat.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To: <20230326120959.1351948-1-trix@redhat.com>
References: <20230326120959.1351948-1-trix@redhat.com>
Subject: Re: [PATCH] RDMA/ocrdma: remove unused discard_cnt variable
Message-Id: <168008930265.1169130.1752490473855395346.b4-ty@kernel.org>
Date: Wed, 29 Mar 2023 14:28:22 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-a055d


On Sun, 26 Mar 2023 08:09:59 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:1592:6: error: variable
>   'discard_cnt' set but not used [-Werror,-Wunused-but-set-variable]
>         int discard_cnt = 0;
>             ^
> This variable is not used so remove it.
> 
> [...]

Applied, thanks!

[1/1] RDMA/ocrdma: remove unused discard_cnt variable
      https://git.kernel.org/rdma/rdma/c/cba968e33e5df0

Best regards,
-- 
Leon Romanovsky <leon@kernel.org>
