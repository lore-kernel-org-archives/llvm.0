Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF883C2C
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 07:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F832C433BB;
	Mon, 18 Sep 2023 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695021955;
	bh=XczSW4IgXwy5b6EVDrL1hNFjSu1hIpUOMnIm2ormMw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnLTYbHm8lA7WkZiTVQmgo+uMmyokOVLQr6OynysDQ8dV1xKrXa9zsTpehK/PFkXh
	 LlxkZa/m9FU4fwGcoysNP0Pz7LT2tCcSP2LAbkzAwb8cCvIGXVWTUyVfBcTAGpRZqE
	 3LKRX7rtogBziaC8eHPfJIcNQKxClkP3HjXPI66055IdQZkmUVvxYzkiXKmLLfdGhy
	 AMfOXaFznZ5ojZ2Bz+Xl2N4twPR3s87o9NWtJZNZGkKGf+21zNpV5l3zQE/No/Az01
	 e80tIe8P4atINnrVJx3VzYxHt1eMpf/b4gKLN9ugdpAdXlI7qeajnRO/rmmveIxsBJ
	 WrTTSuQogjFFA==
From: Christian Brauner <brauner@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH] aio: Annotate struct kioctx_table with __counted_by
Date: Mon, 18 Sep 2023 09:25:40 +0200
Message-Id: <20230918-fotoreporter-beheimatet-5e7732ed6298@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201413.never.881-kees@kernel.org>
References: <20230915201413.never.881-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=brauner@kernel.org; h=from:subject:message-id; bh=XczSW4IgXwy5b6EVDrL1hNFjSu1hIpUOMnIm2ormMw0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSy/w6NsNnv8cu+2pKZn1VAdONDo+3XD2gtEVomdaooT3nN FYPEjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgImI/2b4ZxZ/4d+jqeX72gO0vk49dk fDJyx+p5Xn0jU1V3p1A1fwpjAy3A8/8snn6vE4J+5UW1+F130Lz1kJLJY8ub2nXiB2QxQ/PwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:14:14 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct kioctx_table.
> 
> [...]

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] aio: Annotate struct kioctx_table with __counted_by
      https://git.kernel.org/vfs/vfs/c/7f3782aef7e6
