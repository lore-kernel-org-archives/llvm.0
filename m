Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A333D1
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 12:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9076CC433D2;
	Mon,  3 Apr 2023 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680525623;
	bh=EgSj7Qv0PkBmFZ4Dodeo1bN+kcfgvMLV+dPFSYwL1xU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SkXD4a4QbJprcm02OXV6/eJsDmlSqPly49I0jCNYMBwB8k2vRfesWvEzLF7CtlHPn
	 WCsbMrlEI7j0cQ2EVAt4QeBpQRBzEGsOhxmDl9hnrJ3mSYhp50DRXglfTosoHKNGbN
	 MdBMIGhtxVcY6D65g204TYXqBfNVcxurjcxkjEjJXJasCVrWtvKw58WcTrHbVakfN2
	 BjO+ma+58ISprW7+ucXKJaRz0ByWo/h1ax05Jn2wLlQlhNuq2p7tqaHjT4y1sRjb3j
	 LWFFa/RyffWLANIG6h06KnLg5VINu8XktrQ0NCA2FPM+TtPsB9TfCX4ES/h8KVOROU
	 irqAOzwE6XDmw==
From: Leon Romanovsky <leon@kernel.org>
To: jgg@ziepe.ca, nathan@kernel.org, ndesaulniers@google.com,
 Tom Rix <trix@redhat.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To: <20230330153607.1838750-1-trix@redhat.com>
References: <20230330153607.1838750-1-trix@redhat.com>
Subject: Re: [PATCH] RDMA/mlx5: remove unused num_alloc_xa_entries variable
Message-Id: <168052561997.175957.559845976488333081.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 15:40:19 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-a055d


On Thu, 30 Mar 2023 11:36:07 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/infiniband/hw/mlx5/devx.c:1996:6: error: variable
>   'num_alloc_xa_entries' set but not used [-Werror,-Wunused-but-set-variable]
>         int num_alloc_xa_entries = 0;
>             ^
> This variable is not used so remove it.
> 
> [...]

Applied, thanks!

[1/1] RDMA/mlx5: remove unused num_alloc_xa_entries variable
      https://git.kernel.org/rdma/rdma/c/9eed9353a16755

Best regards,
-- 
Leon Romanovsky <leon@kernel.org>
