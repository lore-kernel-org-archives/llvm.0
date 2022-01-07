Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE8168
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 00:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A8C36AE0;
	Fri,  7 Jan 2022 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641514592;
	bh=OfWvjgMz/3A2cIrWooPNudV7uT9VchsrhR5VhQdH8dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soRh/bTmEiDBwxCHqevgGU3/fdavQHU24UxRQTjfUtXb7JO/wMUwf48N1HOl/IH3n
	 VU2yg3yrwiQDFjhMs47yHKhbqolAHqGBOl/0pyvo24POpX7YLDzbXkZz0Rpg/ufW2C
	 nZvMnM9ocIgL7yr2Q4IeS3c2zwuHCzj3TF84A9oo5k5X0Zq01bpcoGHUwCuXCMPSsH
	 4DQFGtRINjGlkGuiHQQqKZUJFucR+J+Bu/gm3E6qyIv2cghrXZfQ79BJvbvR0BecEk
	 XyGzG4Bg6BdzgkMI0Tm+0dnqcT4De+LebwYHo01kwobUBqPnldzGPq0OF/4aJ9O4z5
	 MdsHT4qeNKfJw==
Date: Thu, 6 Jan 2022 17:16:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Samuel Zeter <samuelzeter@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 0/2] *** Fix reformat_objdump.awk ***
Message-ID: <YdeGWyzvsXxntcAT@archlinux-ax161>
References: <20220106023606.283953-1-samuelzeter@gmail.com>
 <Ydc8wUjX4hnHg7ZE@archlinux-ax161>
 <Ydd522/ivtZunIXl@szeter>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydd522/ivtZunIXl@szeter>

On Fri, Jan 07, 2022 at 10:23:07AM +1100, Samuel Zeter wrote:
> Thanks for the feedback, Nathan.
> 
> > For the future, I recommend putting the maintainers in the "To" field,
> > rather than "Cc", to ensure they actually see it. Additionally, I see
> > some small nits in the commit message that the tip maintainers might
> > comment on, see
> > 
> > https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
> > 
> Thanks for the link, I missed that one. What were the nits apparent to you
> in the commit message?

I primarily just saw a couple instances of "This patch", which is
frowned upon in the main submitting patches document:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#submittingpatches

I thought I saw something else but upon further inspection, I didn't.
It is minor enough that I would wait for further review comments from
others to submit a v2.

Cheers,
Nathan
