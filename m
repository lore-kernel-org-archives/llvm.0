Received: from metanate.com (dougal.metanate.com [90.155.101.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979868
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=Bz8cdhZXbt7ZToRTPSoSmYiw1e6Kd14GIZdjGatloIw=; b=zM41P
	+/C+xf1ELT2qg/fxigElKjTpMaNsB8GtPzYCWMNnz/nQ6LXTfvxS8IHTWXkDci7TPzv25M4uVsBAh
	42aSZ/4QW6q2ALr/O2k4H2IxAsb1uzSXyjenG6LCKvmNZALKVvXVv8DnXfOUgBqB9pQSWtNTFEvWB
	aSt+pw+lfZJSpJn4QAB+Cv/rdu5c+11yhGyDWhYNyL7+ND4EG2O1UGx05exjtCiFpeBa1ItiGKjro
	mALuRN4lMd1unQMuP9dVL6/2WKXDxzushe9dtNngJ0amEhe/cnqn1nu8+uF800u7ZhcdG71vQ6YO5
	xom+1Gzl9qRGxJ770Fpvcpbh7GxQg==;
Received: from [81.174.171.191] (helo=donbot)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <john@metanate.com>)
	id 1miyxl-0003RI-Pv; Fri, 05 Nov 2021 13:08:57 +0000
Date: Fri, 5 Nov 2021 13:08:48 +0000
From: John Keeping <john@metanate.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] usb: dwc2: hcd_queue: Fix use of floating point literal
Message-ID: <YYUs4PME9QizsPTt@donbot>
References: <20211104215923.719785-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104215923.719785-1-nathan@kernel.org>
X-Authenticated: YES

On Thu, Nov 04, 2021 at 02:59:23PM -0700, Nathan Chancellor wrote:
> A new commit in LLVM causes an error on the use of 'long double' when
> '-mno-x87' is used, which the kernel does through an alias,
> '-mno-80387' (see the LLVM commit below for more details around why it
> does this).
> 
>  drivers/usb/dwc2/hcd_queue.c:1744:25: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux-gnu' does not support it
>                          delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);
>                                              ^
>  drivers/usb/dwc2/hcd_queue.c:62:34: note: expanded from macro 'DWC2_RETRY_WAIT_DELAY'
>  #define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
>                                  ^
>  1 error generated.
> 
> This happens due to the use of a 'long double' literal. The 'E6' part of
> '1E6L' causes the literal to be a 'double' then the 'L' suffix promotes
> it to 'long double'.
> 
> There is no visible reason for a floating point value in this driver, as
> the value is only used as a parameter to a function that expects an
> integer type.  Use USEC_PER_SEC, which is the same integer value as
> '1E6L', to avoid changing functionality but fix the error.
> 
> Fixes: 6ed30a7d8ec2 ("usb: dwc2: host: use hrtimer for NAK retries")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1497
> Link: https://github.com/llvm/llvm-project/commit/a8083d42b1c346e21623a1d36d1f0cadd7801d83
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/usb/dwc2/hcd_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
> index 89a788326c56..bdf1927e1be1 100644
> --- a/drivers/usb/dwc2/hcd_queue.c
> +++ b/drivers/usb/dwc2/hcd_queue.c
> @@ -59,7 +59,7 @@
>  #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
>  
>  /* If we get a NAK, wait this long before retrying */
> -#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
> +#define DWC2_RETRY_WAIT_DELAY (1 * USEC_PER_SEC)

Using USEC_PER_SEC here seems quite weird.  This is used as:

	delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);

so the units are nanoseconds.

Maybe NSEC_PER_MSEC would better indicate the intent here?
