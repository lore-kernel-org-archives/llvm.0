Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0102F31
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 16:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2635C433D6;
	Mon, 17 Oct 2022 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666022633;
	bh=DLnN0htvivwVhuJQm7cIim+/YRJwPriv2PpoqwyHlSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiuJUAR/ea4x4NaK2D4yJyt1vA6WE758Mv0xHXmgJ9aNw3zYyfmyCCyey7ihQq02E
	 2RwieJBrEp7hJSUKL/h/IcdWi9VHL0oDunl6+G1czR3ZWGU4//3Z9uY6PadeQKK/zW
	 1MyDEBUM2RJTiV1qzheh2YXAkf92LBGAcM8WjDNqOjfww41HyoYTf6PhG5x8dG55Ya
	 PLSL9qY4Gyx4kVKY/s2AghpR4a/tG7VRxcGh63KoQJ+UmcXgqjwi9WFm3BCdVTwkhW
	 mLdyXZ1lK97qfyWgRU7CPwxo3iGpKiCWlGthjkjbXnL1/O+MXZLHK9E1x3GvSQK/1/
	 Opg8ZlbD22QNA==
Date: Mon, 17 Oct 2022 17:03:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <Y0185O1zjyfv7WjN@spud>
References: <20221006173520.1785507-1-conor@kernel.org>
 <20221017155103.4dt5uzmnlbtibqcn@kamzik>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017155103.4dt5uzmnlbtibqcn@kamzik>

On Mon, Oct 17, 2022 at 05:51:03PM +0200, Andrew Jones wrote:
> On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> 
> However, we could also drop the compiler and linker checking if we
> converted our use of cbo.* to the insn-def.h framework (I think Heiko once
> mentioned looking at doing that, but I'm not sure.) I'm looking at adding
> Zicboz support right now and for starters I've duplicated and modified
> these checks. But, I think I'll look into defining the instruction type
> needed for cbo.* and using insn-def instead.

What is the ETA of your zicboz support? Do you think these patches
should be applied to v6.1 & backported before being replaced by insn-def
when your zicboz support arrives? Or just wait for your zicboz series?

Trying to decide what status I should set for this in patchwork.

Thanks,
Conor.

