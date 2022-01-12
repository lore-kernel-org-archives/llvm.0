Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FA168
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 06:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3711C36AE9;
	Wed, 12 Jan 2022 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641970224;
	bh=ICXLXCzZlqVeY8PhNh1AenYiIO6Dd6x1LdgAofrqb/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyPHKlfG5XUmI5RqOYNvWimu8IBiC5sQBbn2RoL24LTh2qH0tCtj1IZVzCEUGnP+k
	 7btmWuwFmIeO/IQFdhpFEfjhDh5S7OwdxhQ+K6kDH9kmfDAAPVSuI1a2s6j4cVOe8b
	 WIfVQeV9IOlQQJwAxJeZ/Yh7RtTtpuADwkZk97LjIocB3BlMtV99mZcA5kP+yk27Bu
	 ZdLIM1d7Fd0WN3JcNv4yDH4sceYCE8mdXmdO/6DOpbE7XrTyevaZe3b9taoMBZnm3R
	 +KoVawLdL7YrpvAAOrojtDtCW0jIHiWndpKkNrpNvzjyFGWAlelcT5/Tc2TKDuelvF
	 vOFw93tp7iLeA==
Date: Tue, 11 Jan 2022 23:50:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Roman Lebedev <lebedev.ri@gmail.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [SCEV] Sequential/in-order
 `UMin` expression
Message-ID: <Yd56LdGd17JZe+br@archlinux-ax161>
References: <1113802202.11035.1641968209817@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1113802202.11035.1641968209817@jenkins.jenkins>

On Wed, Jan 12, 2022 at 06:16:48AM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [SCEV] Sequential/in-order `UMin` expression:
> commit 82fb4f4b223d78e86647f3576e41e3086ab42cd5
> Author: Roman Lebedev <lebedev.ri@gmail.com>
> 
>     [SCEV] Sequential/in-order `UMin` expression
...
> # 00:05:01 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:05:01 make[3]: *** [scripts/Makefile.build:277: sound/core/oss/route.o] Error 134
> # 00:05:03 make[2]: *** [scripts/Makefile.build:540: sound/core/oss] Error 2

Reported yesterday:

https://reviews.llvm.org/D116766

Fixed this morning:

https://reviews.llvm.org/rG76a0abbc13cdfd3ae71f8db8a9376f65a9f6f725

Cheers,
Nathan
