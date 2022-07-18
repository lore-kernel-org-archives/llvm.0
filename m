Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4A320E
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 15:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9576CC341C0;
	Mon, 18 Jul 2022 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658156901;
	bh=sjASCU4RCMN5BFgrVZDcpbtnLD5ZRJDk340Ku8DogJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBUmX8thOXHZJFoygwmcHxqvXtQDGJTCGlUSElMhXprQabGRGtOoy+9OH1iMwmp9v
	 TxKrhudeVM+dJetY3hpjl/c/tBonjhZoZ6jZpROEEZvGlMiIR/lQtG2yQ3A1/4Ktx5
	 CC2IyPOVC607txj5hfM1R3UqKCh65nDIZqVIHN1whyGKbL7zxUaQLCGGX6UuIrXN2t
	 gy0wS+y3DHU8W8Pf5+5UXscWvePatpbrP7CMZC7R1pNZ+gaDRSFxx13PbAy9uHDDMW
	 P7XyLQyQ3Zgta9E30dCD/nkCELV4N0RNehx/BTeMP7AX/4WJ1SRb8fis20wuY4967y
	 Pv3DHLR5tRShw==
Date: Mon, 18 Jul 2022 08:08:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: llvm@lists.linux.dev
Subject: Re: x86_64 build failure of next-20220715 and next-20220718 with
 clang
Message-ID: <YtV3Y4Ha4tPk3kU4@dev-arch.thelio-3990X>
References: <YtVPpVFwy7WhXKPx@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtVPpVFwy7WhXKPx@debian>

Hi Sudip,

On Mon, Jul 18, 2022 at 01:18:45PM +0100, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> Not sure if its reported, builds of x86_64 allmodconfig of next-20220715
> and next-20220718 with clang are showing lots of new warnings like:
> 
> warning: objtool: asan.module_dtor+0x15: 'naked' return found in RETHUNK build

Thanks for the report! Nick fixed this in LLVM, it was a problem with
compiler generated functions like the ones that are generated with
KASAN, KCSAN, and GCOV having 'ret' instead of 'jmp __x86_return_thunk':

https://github.com/llvm/llvm-project/commit/140bfdca60ae8b1b2ad115846379e3c9ca914bfb

With that change, you should see no warnings of that nature with
allmodconfig anymore. Thanks for the continuous testing!

Cheers,
Nathan
