Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3532F23
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 15:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DBCC433C1;
	Thu, 10 Nov 2022 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668093500;
	bh=P1veQsKG59JRNLlKHFjt59W4QFwwnV8LOv0rq5XQ56w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PypWXxbwE2Wx2kOKCsexwtBMj8zgdFyua7vGiENW2rNoaz2AQR9Fu/UvXmZ6eAZql
	 MOITHP6LTJcUZA7uNxVFVBlHKMNIsYkNSRCVS6qLfHkV0/jxJHz7QMKhxY6Y/ZCtJn
	 P7bt0RGOpexvl/NMzf1Kmj3BF+w0tEkb3t37OcBt1eti/URlyqAYXrD5nO36iUSaTm
	 ixzfD732dRYISonQIEHuTx8Nq+1vEoAy7ejxrB3JYcotl+TrakRX4E1YGEp4XLFI31
	 q5xEWcjTqnlfP1M8aQqVp+48kEONe43RBIEh7Rnf0lcTHiqv3hKtL+gLTl+6fFt4ec
	 hwi8diJlyS4Xg==
Date: Thu, 10 Nov 2022 08:18:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Suleiman Souhlal <suleiman@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv5 04/13] zram: Introduce recompress sysfs knob
Message-ID: <Y20WOnvkJ3xL7hq/@dev-arch.thelio-3990X>
References: <20221109115047.2921851-1-senozhatsky@chromium.org>
 <20221109115047.2921851-5-senozhatsky@chromium.org>
 <Y2z4DbuYgDJ/v8u+@dev-arch.thelio-3990X>
 <Y20LV+1jJMZ2FFnM@google.com>
 <Y20NAX4R6RgRpWnE@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y20NAX4R6RgRpWnE@google.com>

On Thu, Nov 10, 2022 at 11:38:57PM +0900, Sergey Senozhatsky wrote:
> On (22/11/10 23:31), Sergey Senozhatsky wrote:
> > On (22/11/10 06:09), Nathan Chancellor wrote:
> > [..]
> > > drivers/block/zram/zram_drv.c:1894:10: note: initialize the variable 'err' to silence this warning
> > >                 int err;
> > >                        ^
> > >                         = 0
> > > 7 errors generated.
> > > 
> > > Is the fix just to initialize err to 0 as it suggests or should there be
> > > a different fix?
> > 
> > Yes, that's the correct fix. Thanks for catching this. We had "err = 0"
> > in v4 of this patch set, but it somehow didn't make it to v5.
> 
> Nathan, I just sent a simple one-liner patch. If you don't mind,
> may we ask Andrew to take it as a fixup (folded) patch?

Yup, sounds like a plan to me, thanks for the quick response and fix!

Cheers,
Nathan
