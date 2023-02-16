Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1523A3
	for <llvm@lists.linux.dev>; Thu, 16 Feb 2023 08:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76152C433D2;
	Thu, 16 Feb 2023 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676535373;
	bh=VyzmEsPoa/Y565Ji4nqFDLHYCje9rYD0PrA6meuz6yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ad1O+QQV/rW9JaixcdpRKFUQz9al6FjHd3z3HPbEEI6hYl56YB4XkPPWZHoi/aY9b
	 nubWjRWKnrIQZXSSstWRBjLWJhqneHNtqVm51BArm1SYV/B17VpWofCQVVI47Nkmi9
	 CIVWLzw6k94dwsw1oaeqdby73f2okGp5FdthFbJQ=
Date: Thu, 16 Feb 2023 09:16:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Taichi Nishimura <awkrail01@gmail.com>
Cc: andrii@kernel.org, mykolal@fb.com, ast@kernel.org, daniel@iogearbox.net,
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	iii@linux.ibm.com, ytcoode@gmail.com, deso@posteo.net,
	memxor@gmail.com, joannelkoong@gmail.com, rdunlap@infradead.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next] Fix typos in selftest/bpf files
Message-ID: <Y+3mSp2j2Xqe1sT0@kroah.com>
References: <20230216080423.513746-1-awkrail01@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216080423.513746-1-awkrail01@gmail.com>

On Thu, Feb 16, 2023 at 05:04:23PM +0900, Taichi Nishimura wrote:
> This patch is a re-submitting patch.
> I cloned bpf-next repo, run spell checker, and fixed typos.
> Included v1 and v2 patches to this one.
> 
> Could you review it again? 
> Let me know if I have any mistakes.

This text is not needed in the changelog for a patch, please read the
section entitled "The canonical patch format" in the kernel file,
Documentation/process/submitting-patches.rst for what is needed in order
to properly describe the change.

thanks,

greg k-h
