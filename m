Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054A8F63
	for <llvm@lists.linux.dev>; Fri, 23 Dec 2022 15:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B7EC433D2;
	Fri, 23 Dec 2022 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671807749;
	bh=zd/QTYB6Krn6kLSVc2hJyljzXGc2//xWd9XTYLs+684=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XccTNox/kpbWY+JJgvIr6vTUP2MsdpeZMHW+ea2M/alCkUGTeC6jxfCU7HoaMSu6z
	 PuPQD4tEOW6zwdkYzUj4zGgRrYawRhzU51OZCLxx9i1tAU/qC9xwclYKEobbfbjvNh
	 AjywA07owkHuwGnlm+rf7AE5lt1O8resKoyS8LA8=
Date: Fri, 23 Dec 2022 16:02:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, LLVM Mailing List <llvm@lists.linux.dev>
Subject: Re: [PATCH v1] driver core: Silence 'unused-but-set variable' warning
Message-ID: <Y6XDAiMAMLniR9PG@kroah.com>
References: <20221223145137.3786601-1-ammar.faizi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223145137.3786601-1-ammar.faizi@intel.com>

On Fri, Dec 23, 2022 at 09:51:37PM +0700, Ammar Faizi wrote:
> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> 
> Compiling with clang-16:
> 
>   drivers/base/module.c:36:6: error: variable 'no_warn' set but not \
>   used [-Werror,-Wunused-but-set-variable]
>           int no_warn;
>               ^
>   1 error generated.
> 
> A reason the @no_warn variable exists is:
> sysfs_create_link() return value needs not be ignored to silence
> another warning.
> 
> So don't remove @no_warn, but add a '(void)no_warn;'.
> 
> Cc: LLVM Mailing List <llvm@lists.linux.dev>
> Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> ---
>  drivers/base/module.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 46ad4d636731..42f0b3b9e7f8 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -59,22 +59,23 @@ void module_add_driver(struct module *mod, struct device_driver *drv)
>  		return;
>  
>  	/* Don't check return codes; these calls are idempotent */
>  	no_warn = sysfs_create_link(&drv->p->kobj, &mk->kobj, "module");
>  	driver_name = make_driver_name(drv);
>  	if (driver_name) {
>  		module_create_drivers_dir(mk);
>  		no_warn = sysfs_create_link(mk->drivers_dir, &drv->p->kobj,
>  					    driver_name);
>  		kfree(driver_name);
>  	}
> +	(void)no_warn;

Ick, no, that's horrid and is NOT ok for kernel code, sorry.

Please fix the compiler, this is not a "fix" in any sense of the word
and is not going to work at all for kernel code.

sorry,

greg k-h
