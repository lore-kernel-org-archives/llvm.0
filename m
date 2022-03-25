Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106723DA
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 15:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E106C340E9;
	Fri, 25 Mar 2022 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648221663;
	bh=NdSDfG51M7eTZ8GzzJ2lDj0tjAGkdduj45sf3JOH5ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfL2IVScbUlIXNnfv1+9KgI1OYvvhbxF7KgnJovSL3B1EknL20h6aMsuGOqO24ZlX
	 XBOry4N595eZP2ip1Scg4h2FIrlA9AF3d70x2TKM0X2Ji6eStkHU1J2CeWLg91Sc5A
	 vOPM/RwTBZQU1lM4LnPy5J8eBjAshjtmKzOZTZNhKE2Nd2b/lVPuJyH5EEYQdPZYR3
	 VS1RPeBeatk9hgfCMv5OQk9GLbKV0+TSrmtBO7vy7LJHRk6KYo9Cu+pjPnaGZFZdTq
	 kR8TiLxbH2W3n/f9+6bRsGxmGkjE9Iy+RdKv6J9IVi+yLruGGZHyesgTlsf2Uz5Qog
	 qFLv8Gxr1KStQ==
Date: Fri, 25 Mar 2022 16:20:58 +0100
From: Christian Brauner <brauner@kernel.org>
To: Axel Rasmussen <axelrasmussen@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] selftests: fix header dependency for pid_namespace
 selftests
Message-ID: <20220325152058.rjrfzrojufn5ba2p@wittgenstein>
References: <20220324223929.1893741-1-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220324223929.1893741-1-axelrasmussen@google.com>

On Thu, Mar 24, 2022 at 03:39:28PM -0700, Axel Rasmussen wrote:
> The way the test target was defined before, when building with clang we
> get a command line like this:
> 
> clang -Wall -Werror -g -I../../../../usr/include/ \
> 	regression_enomem.c ../pidfd/pidfd.h  -o regression_enomem
> 
> This yields an error, because clang thinks we want to produce both a *.o
> file, as well as a precompiled header:
> 
> clang: error: cannot specify -o when generating multiple output files
> 
> gcc, for whatever reason, doesn't exhibit the same behavior which I
> suspect is why the problem wasn't noticed before.
> 
> This can be fixed simply by using the LOCAL_HDRS infrastructure the
> selftests lib.mk provides. It does the right think and marks the target
> as depending on the header (so if the header changes, we rebuild), but
> it filters the header out of the compiler command line, so we don't get
> the error described above.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> ---

Looks good,
Reviewed-by: Christian Brauner <brauner@kernel.org>
