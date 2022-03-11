Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AD33E9
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 16:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAEFC340E9;
	Fri, 11 Mar 2022 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647015488;
	bh=0cZ6b7AXYUuBOJstkAJvZYlOE56pXKXh0+MXEe4ilt4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bB44RNJRgO12CFLMJfvtN1ALIgpjM0ISOh98aXoHrV4oBVvMBWQwNrFwqSw8Eia4E
	 KkVvEiNjIZgSTdlg7CbSYxzSSbdTQ/dIqLhJWXJAfqkLsCTWxTFoYjSUfxH+gm85bx
	 j0KcaRgviBPwBM33xK6jpiJhtjFjmAhX41lHTABOMVIZ5MXwmZM/+We+CRzVOECSy5
	 lThdGaVKKdgrej4/GGRdGTX5pThtNx8+XtW2THufklst1w4Mw23j8UkLKI2tneIF2B
	 y5iaNFRjlEP90KBeHI1frVg7vThMDrmPMhNXLCvYprz5Eu9lGIsRC97XWf5lex9WUY
	 +10LtiIw9lMsw==
Date: Fri, 11 Mar 2022 10:18:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] linux/types.h: Remove unnecessary __bitwise__
Message-ID: <20220311161806.GA304449@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310175216.252fabefeca040004216d40d@linux-foundation.org>

On Thu, Mar 10, 2022 at 05:52:16PM -0800, Andrew Morton wrote:
> On Thu, 10 Mar 2022 16:09:26 -0600 Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > There are no users of "__bitwise__" except the definition of "__bitwise".
> > Remove __bitwise__ and define __bitwise directly.
> > 
> > This is a follow-up to 05de97003c77 ("linux/types.h: enable endian checks
> > for all sparse builds").
> > 
> 
> Can we change the copy-pasted code in tools/include/linux/types.h while
> we're there?

Oh, you bet!  Thanks for pointing that out!

> --- a/tools/include/linux/types.h~linux-typesh-remove-unnecessary-__bitwise__-fix
> +++ a/tools/include/linux/types.h
> @@ -43,11 +43,10 @@ typedef __u8  u8;
>  typedef __s8  s8;
>  
>  #ifdef __CHECKER__
> -#define __bitwise__ __attribute__((bitwise))
> +#define __bitwise	__attribute__((bitwise))
>  #else
> -#define __bitwise__
> +#define __bitwise
>  #endif
> -#define __bitwise __bitwise__
>  
>  #define __force
>  #define __user
> _
> 
