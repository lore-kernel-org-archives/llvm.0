Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D8185E
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 13:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD582C433D7;
	Thu, 10 Nov 2022 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668085776;
	bh=pKLI4hJQENSG/gSAWyu3k71l5rFZ3bAWEtxR/Q5BjXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKEkrHWT+ZBpJ7NqdmCjGILQA2wXS1Z57Ng+hj4y3MT4/FL0JU8k7vGUEp/giRyjB
	 CWJ2JpcVW3Xj7tPN8JrP6l9OhqOu1swmDS5DUBG/vJhwE0wnpjneY6DyEsgMguqfw+
	 XZ4B2XlbR47yL0NXFfMh9xaa7LNDTcADywdbb5qri2rPit/1YRKDGp25MsgC0UzeUN
	 do+DpIYRt6+UvOksmk6fAw6laOtNl4Tbqn+kVY7DQVtcvoc7uOm/vLUHXezUWb+Jj1
	 OI/JSOmSNUNe9K8c0dA52CseMiCxxsScmZUXZlOB6TeCM+CkF0std8gc2h4iRuRAV7
	 SAoTWqzOwpbUQ==
Date: Thu, 10 Nov 2022 06:09:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nitin Gupta <ngupta@vflare.org>,
	Suleiman Souhlal <suleiman@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv5 04/13] zram: Introduce recompress sysfs knob
Message-ID: <Y2z4DbuYgDJ/v8u+@dev-arch.thelio-3990X>
References: <20221109115047.2921851-1-senozhatsky@chromium.org>
 <20221109115047.2921851-5-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109115047.2921851-5-senozhatsky@chromium.org>

Hi Sergey,

On Wed, Nov 09, 2022 at 08:50:38PM +0900, Sergey Senozhatsky wrote:
> Allow zram to recompress (using secondary compression streams)
> pages.
> 
> Re-compression algorithms (we support up to 3 at this stage)
> are selected via recomp_algorithm:
> 
>   echo "algo=zstd priority=1" > /sys/block/zramX/recomp_algorithm
> 
> Please read documentation for more details.
> 
> We support several recompression modes:
> 
> 1) IDLE pages recompression is activated by `idle` mode
> 
>   echo "type=idle" > /sys/block/zram0/recompress
> 
> 2) Since there may be many idle pages user-space may pass a size
> threshold value (in bytes) and we will recompress pages only
> of equal or greater size:
> 
>   echo "threshold=888" > /sys/block/zram0/recompress
> 
> 3) HUGE pages recompression is activated by `huge` mode
> 
>   echo "type=huge" > /sys/block/zram0/recompress
> 
> 4) HUGE_IDLE pages recompression is activated by `huge_idle` mode
> 
>   echo "type=huge_idle" > /sys/block/zram0/recompress
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
...
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index a6a5fd2474d7..749e4266dd72 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
...
> +	for (index = 0; index < nr_pages; index++) {
> +		int err;
> +
> +		zram_slot_lock(zram, index);
> +
> +		if (!zram_allocated(zram, index))
> +			goto next;
> +
> +		if (mode & RECOMPRESS_IDLE &&
> +		    !zram_test_flag(zram, index, ZRAM_IDLE))
> +			goto next;
> +
> +		if (mode & RECOMPRESS_HUGE &&
> +		    !zram_test_flag(zram, index, ZRAM_HUGE))
> +			goto next;
> +
> +		if (zram_test_flag(zram, index, ZRAM_WB) ||
> +		    zram_test_flag(zram, index, ZRAM_UNDER_WB) ||
> +		    zram_test_flag(zram, index, ZRAM_SAME) ||
> +		    zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
> +			goto next;
> +
> +		err = zram_recompress(zram, index, page, threshold,
> +				      prio, ZRAM_MAX_COMPS);
> +next:
> +		zram_slot_unlock(zram, index);
> +		if (err) {
> +			ret = err;
> +			break;
> +		}
> +
> +		cond_resched();
> +	}

This commit is now in -next as commit 03e6c729aa64 ("zram: introduce
recompress sysfs knob"), where it introduces the following clang
warnings:

drivers/block/zram/zram_drv.c:1909:7: error: variable 'err' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1909:3: note: remove the 'if' if its condition is always false
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1909:7: error: variable 'err' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1909:7: note: remove the '||' if its condition is always false
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1909:7: error: variable 'err' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1909:7: note: remove the '||' if its condition is always false
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1909:7: error: variable 'err' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1909:7: note: remove the '||' if its condition is always false
                if (zram_test_flag(zram, index, ZRAM_WB) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1905:7: error: variable 'err' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (mode & RECOMPRESS_HUGE &&
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1905:3: note: remove the 'if' if its condition is always false
                if (mode & RECOMPRESS_HUGE &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1901:7: error: variable 'err' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (mode & RECOMPRESS_IDLE &&
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1901:3: note: remove the 'if' if its condition is always false
                if (mode & RECOMPRESS_IDLE &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1898:7: error: variable 'err' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (!zram_allocated(zram, index))
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1919:7: note: uninitialized use occurs here
                if (err) {
                    ^~~
drivers/block/zram/zram_drv.c:1898:3: note: remove the 'if' if its condition is always false
                if (!zram_allocated(zram, index))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/zram/zram_drv.c:1894:10: note: initialize the variable 'err' to silence this warning
                int err;
                       ^
                        = 0
7 errors generated.

Is the fix just to initialize err to 0 as it suggests or should there be
a different fix?

Cheers,
Nathan
