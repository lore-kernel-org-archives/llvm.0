Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48546C131
	for <llvm@lists.linux.dev>; Tue, 23 May 2023 23:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68F5C433D2;
	Tue, 23 May 2023 23:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684883571;
	bh=Yk6ohM0+0C0f//78Ndc/qWNk7Gzg1jlQjvY3wzS6MIA=;
	h=Date:From:To:Subject:From;
	b=ODOxj25PloBnZ5bxJdiQ7Kmw/7j7pZjDykNK8L9yi3IoTV093U4ViN7xQUaa9ricv
	 jAZXypgIE44pdOKfRpR/2slEq+NfzFvucb9GKVkAYobiQK4/hYVEupyKUr3144MKHh
	 X3a2/CP9oRGZbY9i6JvflBlWJ1BJ8j0ZM6rUyWazJ3KD6jS2lFlJY/N2mKQJHRGNhp
	 5wnetxVc/oQ+gDb8V78t++BzzjqnTVBvTeaCLXH9YbPD2g4G8fyHUqFOpYwPrwOjZe
	 r5ev7Q6qALHF0mrojAHsgP+irTVvFk+F5vBAAnZZY1K6aidEiGWbdTAmp+v88odTck
	 FEntY4iOYoXmw==
Date: Tue, 23 May 2023 16:12:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Prebuilt LLVM 16.0.4 uploaded
Message-ID: <20230523231250.GA894339@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 16.0.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

As far as I am aware, there are no changes in this release that strictly
affect the kernel. If there are any issues found, please let us know via
email or https://github.com/ClangBuiltLinux/linux/issues/new, as we only
have two more releases in the 16.x cycle to get regressions fixed.

Cheers,
Nathan
