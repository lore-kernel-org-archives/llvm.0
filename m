Received: from out-217.mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDB27EF5
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 20:53:51 +0000 (UTC)
Date: Tue, 19 Sep 2023 16:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1695156829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQ9SnVQR0ev2rRpFFyXcwg3OT+7mPuajRg1/AFqHDzE=;
	b=rW8Qh/dj/Kdb0RdB34BMKvHEQUKyWwxEEGeAOrIG16Tyi6NBCYeGDrJYnhhjuQejbCMCd2
	FOCbOwc/UoeJ1CogiUEw73ECBpEecqhEEGFr5TbN3K9T82WTKsdLUrLcyqX3aapC55qWag
	NqNdM3+mCPAfvLWQosoqhwmwgTAXevk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] bcachefs: Fix -Wself-assign
Message-ID: <20230919205347.qfof2omdw6tyedfe@moria.home.lan>
References: <20230919-bcachefs_self_assign-v1-1-830936792fc9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919-bcachefs_self_assign-v1-1-830936792fc9@google.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Sep 19, 2023 at 01:38:31PM -0700, Nick Desaulniers wrote:
> Fixes the following observed error reported by Nathan on IRC.
> 
>   fs/bcachefs/io_misc.c:467:6: error: explicitly assigning value of
>   variable of type 'int' to itself [-Werror,-Wself-assign]
>     467 |         ret = ret;
>         |         ~~~ ^ ~~~
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Applied, thanks!
