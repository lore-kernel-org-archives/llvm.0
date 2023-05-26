Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BFF2CA6;
	Fri, 26 May 2023 16:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A90C433EF;
	Fri, 26 May 2023 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685119293;
	bh=mvjNlLZflmQ9eqW8p95dzCluSVFryDHkTIl5aLa5JbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kny7HpQRbRdhEnU4vp5TKv49ROVtsQxJOHGt+5CfMX1eu9G2M4kUWZHrBfC5ca3kg
	 97LCz57xmsJmmt+r1fzIP/9lunMCtx9Fa0wc17BM+ocvcmpvC2jS4w0zJwlY3C98sT
	 3cqYir+Incl8C3yiLe1LsIrUWfEgMNQN5yxkOyFo=
Date: Fri, 26 May 2023 17:41:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"# 3.4.x" <stable@vger.kernel.org>,
	"Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
Subject: Re: [linux-stable-rc:queue/5.15 105/106]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Message-ID: <2023052620-unrefined-strobe-da13@gregkh>
References: <202305210504.yw7qgOom-lkp@intel.com>
 <MW4PR84MB19703614A2DB230AD0BAF63CA8409@MW4PR84MB1970.NAMPRD84.PROD.OUTLOOK.COM>
 <CAKwvOdnjXD4K6284znWQ7FdshZFYdqNUTN4U79h1pA+xPJ6vCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnjXD4K6284znWQ7FdshZFYdqNUTN4U79h1pA+xPJ6vCA@mail.gmail.com>

On Tue, May 23, 2023 at 11:55:54AM -0700, Nick Desaulniers wrote:
> On Tue, May 23, 2023 at 11:31 AM Lopez, Jorge A (Security)
> <jorge.lopez2@hp.com> wrote:
> >
> > I investigate the compile failure and appears the latest patch reverted the code to an older version.
> > The latest code shows the proper implementation and compiling the code does not report any failures.
> >
> >             enum hp_wmi_radio r = (long)data;
> >
> > instead of
> >
> >                enum hp_wmi_radio r = (enum hp_wmi_radio) data;
> 
> Looks like
> commit ce95010ef62d ("platform/x86: hp-wmi: Fix cast to smaller
> integer type warning")
> 
> is the fixup necessary for 5.15.y.
> 
> Dear stable kernel maintainers, please consider cherry-picking the
> above commit to linux-5.15.y to avoid the new compiler diagnostic
> introduced by
> commit 6e9b8992b122 ("platform/x86: Move existing HP drivers to a new
> hp subdir")

Now queued up, thanks.

greg k-h
