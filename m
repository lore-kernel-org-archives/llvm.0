Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C053FC3
	for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 17:32:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F76F610D1;
	Fri, 17 Sep 2021 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631899964;
	bh=k7IXvAbIA8eaijHGPxu1HGiN3un89nIcKNNqBYPFw0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FVtBt4U5ENuZiDTOxFPNs+tMSlgFBGoBmf+lxL3RgAULL6xhguVWtV8owvwFHyA7F
	 VwJ7qvA1qZn3TiSHsI3Z+X7mHlkN5KGRKlLmQxHMxSUm9/P4biKpU3YV5xLOw12Vfp
	 ZsdkvoX2ofcFghfhjcfmN3bzUqfd6xQz0wPXi5RJ5Qtbk77LW/H23vZU6cFQsfoRPN
	 GiYgdVQ1b0cV7jaZAoZ9pyzxdtaJ7SCKvnTE54d6GrA2Ciwg8WrYJINEzMkAlUKeSd
	 nCoNOnr08BhXjfRXLY6OWucTvysqHM2VuGZsm7NgOdnsaluk+4GI6Mfu+YViCra5mu
	 I1pxwfGcvxNeA==
Date: Fri, 17 Sep 2021 10:32:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jonathan Lemon <jonathan.lemon@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v2] ptp: ocp: Avoid operator precedence warning
 in ptp_ocp_summary_show()
Message-ID: <20210917103243.560c1777@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210917054114.u7ivmjfdsw7ta72m@bsd-mbp.dhcp.thefacebook.com>
References: <20210917045204.1385801-1-nathan@kernel.org>
	<20210917054114.u7ivmjfdsw7ta72m@bsd-mbp.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Sep 2021 22:41:14 -0700 Jonathan Lemon wrote:
> On Thu, Sep 16, 2021 at 09:52:05PM -0700, Nathan Chancellor wrote:
> > Clang warns twice:
> > 
> > drivers/ptp/ptp_ocp.c:2065:16: error: operator '?:' has lower precedence
> > than '&'; '&' will be evaluated first
> > [-Werror,-Wbitwise-conditional-parentheses]
> >                            on & map ? " ON" : "OFF", src);
> >                            ~~~~~~~~ ^
> > drivers/ptp/ptp_ocp.c:2065:16: note: place parentheses around the '&'
> > expression to silence this warning
> >                            on & map ? " ON" : "OFF", src);
> >                                     ^
> >                            (       )
> > drivers/ptp/ptp_ocp.c:2065:16: note: place parentheses around the '?:'
> > expression to evaluate it first
> >                            on & map ? " ON" : "OFF", src);
> >                                     ^
> > 
> > on and map are both booleans so this should be a logical AND, which
> > clears up the operator precedence issue.
> > 
> > Fixes: a62a56d04e63 ("ptp: ocp: Enable 4th timestamper / PPS generator")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1457
> > Suggested-by: Jonathan Lemon <jonathan.lemon@gmail.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>  
> 
> Acked-by: Jonathan Lemon <jonathan.lemon@gmail.com>

Applied, thanks!
