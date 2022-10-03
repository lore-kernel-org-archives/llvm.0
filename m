Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1733E0
	for <llvm@lists.linux.dev>; Mon,  3 Oct 2022 23:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03ACEC433C1;
	Mon,  3 Oct 2022 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664840398;
	bh=BdDmn/tBMHEUzOzeye2K3yXjRAgX2JNv9LtWU1Qkbp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oHJ73VvMhk7vjRqEQcCk2XsIxXOLivpiq/DI2xh+kvyJncFxLnCOMLyQCSeYVusuh
	 uU6Hin6NkmdgT0mz/gEWQrQGuYjl6n/gPfZpKn5sMfJd/rlDsu4tj3u8KzmvVlerbr
	 6C8UhDXmnySKmqPcmKIJpyFsVRBUNkw+2yrPiOqQLpg7tbm5Iwj6loAxRTC/aP0GmL
	 dxdiWgcYH8jR63UDgwFv/b0ibpXWfXC3/TLhMTUMujRAFpZ0QmmpjTnzA1rtUWPwoy
	 iJH3+Ynao4ON7/tdX2qcQFoN4u35CINrjeRnWIyIBuJBf/WHHzknsOXYstg+3eU0zx
	 Lsj7eTNy7IUjQ==
Date: Mon, 3 Oct 2022 16:39:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: davem@davemloft.net, decui@microsoft.com, edumazet@google.com,
 error27@gmail.com, haiyangz@microsoft.com, kys@microsoft.com,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com,
 netdev@vger.kernel.org, pabeni@redhat.com, sthemmin@microsoft.com,
 trix@redhat.com, wei.liu@kernel.org
Subject: Re: [PATCH v2] net: mana: Fix return type of mana_start_xmit
Message-ID: <20221003163956.080534f0@kernel.org>
In-Reply-To: <20220929181411.61331-1-nhuck@google.com>
References: <20220919182832.158c0ea2@kernel.org>
	<20220929181411.61331-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Sep 2022 11:14:11 -0700 Nathan Huckleberry wrote:
>  include/net/mana/mana.h                       | 2 +-

This file does not exist in the net-next tree :S
Perhaps it was created when RDMA support was added?
Anyway, repost in a couple of weeks, it should all be straightened out
after the merge window.
