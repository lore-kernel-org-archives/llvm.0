Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB92912
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 17:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDE3C385C2;
	Tue, 10 May 2022 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652204959;
	bh=S6/3exPFt8Bfo86UBsebxqnr86eg3S4+zOOj9GMFN+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=fMjdSxr7KRi6GmrzOjC+4zc1+uPe8XjjoaYQ5RNM0zQUBz78iQHf+Bu91oeI7zKLu
	 V5TEqyv1kGsdWbuuGwvVE0MbiaWEM/M2a0tHF62LOxkKNa0++ySBxiNQ9YUWjvS2/z
	 UB9QslsX1u/COvA3g100dFvWOBn3QdaYXtwmr+j51IseH6MWxF8yy+CwqiIBrrixKc
	 rI4rK57ZfOhJbR8I2rDvoNoRpGdH3yqG/+poNmjwRmbQWsxpevDLj2iriztbE0bAbh
	 eeiEjjIwl6wcCQ88wvrxxhJ7DaTTy6yHyBNiWfkHL4+DH086/aSJ+6+SnUQ9sgUG5P
	 X3yp0wKuxOxwA==
Date: Tue, 10 May 2022 10:49:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Warning fixes for clang + x86_64 allmodconfig on 5.10 and 5.4
Message-ID: <YnqlnFWCrEz11T5Y@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

A recent change in LLVM [1] strengthened -Wenum-conversion, which
revealed a couple of instances in 5.10 and 5.4 (the oldest release that
I personally build test). They are fixed with the following changes,
please consider applying them wherever they apply cleanly (I have
included the release they first appeared in):

1f1e87b4dc45 ("block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit") [5.13]
353f7f3a9dd5 ("drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types") [5.14]

Since I am here already, please consider applying the following
additional changes where they cleanly apply, as they resolve other
warnings present in x86_64 allmodconfig with clang:

7bf03e7504e4 ("drm/i915: Cast remain to unsigned long in eb_relocate_vma") [5.8]
8a64ef042eab ("nfp: bpf: silence bitwise vs. logical OR warning") [5.15]

If there are any problems or questions, please let me know!

[1]: https://github.com/llvm/llvm-project/commit/882915df61e33f3a2b7f58e52f572717e1c11499

Cheers,
Nathan
