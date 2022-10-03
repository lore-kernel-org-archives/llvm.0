Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72A7C
	for <llvm@lists.linux.dev>; Mon,  3 Oct 2022 16:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95CD2C433D7;
	Mon,  3 Oct 2022 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664814015;
	bh=dwtZ7BObBTPWiquhzCO1AxtAGeHx+444b7TsTQk1lo0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WEq7hCj9eCDltGUuKPub8wnP8pgjfUo6xszFUjO+XfFecxWRDAKWGpePfCebP6EnU
	 YuG4JGe6NdpAJVdSIO+UFfL9y2Ox2R//0uEySigJOOwkUtklX9Ff3+3xpOI7rin2Mu
	 7J0dfPsXCe8yxVYjUyVF3Jr3jkKHJ7Ppl2R5sCr6UjbFCqcZ9wAbtbg43N6vHhSYTk
	 6i47wPZ5dcTGARMiH1yoJ6zmnHs51xNX6ZkKPMfA80xx6wd12C1yLGVRH4iqAXsvtS
	 VEAJRPFj0OZ2ccEn3ElH7s2VZ+D50ZcgEyTDKdvfmtq5QIFJ4kPNGPQHeLhbGcFinX
	 3GzFvtBrWPFGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7485BE49FA3;
	Mon,  3 Oct 2022 16:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] Documentation: bpf: Add implementation notes
 documentations to table of contents
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166481401546.8397.14038744797480125600.git-patchwork-notify@kernel.org>
Date: Mon, 03 Oct 2022 16:20:15 +0000
References: <20221002032022.24693-1-bagasdotme@gmail.com>
In-Reply-To: <20221002032022.24693-1-bagasdotme@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: bpf@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, corbet@lwn.net,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 dthaler@microsoft.com, lkp@intel.com

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sun,  2 Oct 2022 10:20:23 +0700 you wrote:
> Sphinx reported warnings on missing implementation notes documentations in the
> table of contents:
> 
> Documentation/bpf/clang-notes.rst: WARNING: document isn't included in any toctree
> Documentation/bpf/linux-notes.rst: WARNING: document isn't included in any toctree
> 
> Add these documentations to the table of contents (index.rst) of BPF
> documentation to fix the warnings.
> 
> [...]

Here is the summary with links:
  - [bpf-next] Documentation: bpf: Add implementation notes documentations to table of contents
    https://git.kernel.org/bpf/bpf-next/c/736baae643cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


