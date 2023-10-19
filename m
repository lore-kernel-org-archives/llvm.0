Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846431581
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AK302akd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5BFC433C8;
	Thu, 19 Oct 2023 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697729486;
	bh=qSu4RIZEraVAYVn1Q+ySBlnu/3u/W7qdwdV2NJ7fb7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AK302akdyCJaDeC1du1RqUPgiJPnkmrBchu96lUz6VGYy2XkRkjsLqejrr3tg5JSS
	 WMDNeg4GJiOQOF44VhPFU2hsoMvL4mIxcdBbK4fwxzV4rbyIZY37AP+cEJ8oO2fH72
	 jP9IdXkvmZYNMBWjxL1JU0pIdh5R8PjBx9unTURTfojW6X0Hb8y/QOf6akExgysDV7
	 6LU42fPgvPCDp8GCqoifOezVf95hjWknKf7W+f2jW+62C59ks56qT+TPwQ6J3UjHhn
	 YDpfTM1MUM8h3XZyXb+P7mn6364ojVlD7K3wtFF3ibaubqsibAVMQb+LHSGg7LGP7e
	 ARb9d+w1k0jvg==
Date: Thu, 19 Oct 2023 08:31:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linaro-toolchain@lists.linaro.org, llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-18-init-8757-gfd311126349b: Failure on
 aarch64
Message-ID: <20231019153124.GA99953@dev-arch.thelio-3990X>
References: <937553743.43340.1697682701023@jenkins.jenkins>
 <CAKwvOd=bG0a_aOK-PvFFpkjsFN8cYc9xmeXMoOkHpUuan_zupw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=bG0a_aOK-PvFFpkjsFN8cYc9xmeXMoOkHpUuan_zupw@mail.gmail.com>

On Thu, Oct 19, 2023 at 08:29:15AM -0700, Nick Desaulniers wrote:
> Thanks for the report. Looks like Nathan has reported this, too (as
> have Google3 folks):
> https://github.com/llvm/llvm-project/commit/fd311126349b8fe1684d62154a9fa5a7bbb0b713#commitcomment-130346081

Looks like Fangrui reverted it last night as well:

https://github.com/llvm/llvm-project/commit/e4ea0997486000b460c4875a00301b73b3c0d6a7

Cheers,
Nathan
