Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9827C
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 13:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDCCC385A5;
	Tue,  7 Jun 2022 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654607477;
	bh=gnONcHJ/AolSb/eRrOjC4crVY3aMOQooVXe77m9/SCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1aM7qDxpgweXoAhOYGiV+2mSw0Is++BU/6XjT2OAM6oXhq1mzMlmVcAuXvUji2Re
	 /bDK0bKs5/JgANacfr2W+969UPUvWxarIxWIUZ6F4Vba6leHS9cxwEUsOVug1tjxMR
	 XAgWgR04m0g1CKjuM6vy+ZQb4nbNBF5Om5n5WEhA=
Date: Tue, 7 Jun 2022 15:11:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: jirislaby@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	peter@hurleysoftware.com, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] serial: core: check if uart_get_info succeeds before
 using
Message-ID: <Yp9Ob3pXUS8Jggm4@kroah.com>
References: <20220529134605.12881-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220529134605.12881-1-trix@redhat.com>

On Sun, May 29, 2022 at 09:46:05AM -0400, Tom Rix wrote:
> clang static analysis reports this representative issue
> drivers/tty/serial/serial_core.c:2818:9: warning: 3rd function call argument is an uninitialized value [core.CallAndMessage]
>         return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> uart_get_info() is used the *show() functions.  When uart_get_info() fails, what is reported
> is garbage.  So check if uart_get_info() succeeded.
> 
> Fixes: 4047b37122d1 ("serial: core: Prevent unsafe uart port access, part 1")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/tty/serial/serial_core.c | 52 ++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 9a85b41caa0a..4160f6711c5d 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2690,7 +2690,9 @@ static ssize_t uartclk_show(struct device *dev,
>  	struct serial_struct tmp;
>  	struct tty_port *port = dev_get_drvdata(dev);
>  
> -	uart_get_info(port, &tmp);
> +	if (uart_get_info(port, &tmp))
> +		return 0;

As Andy pointed out, this is an error, don't tell userspace that all
went well and yet you returned no data?  That will just confuse it.

thanks,

greg k-h
