Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2587E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 18:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC50C385A4;
	Tue, 26 Apr 2022 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650998266;
	bh=WiXSbg1inz4+HZNgAwnO2NFGzpWvm6UUxHLCn1D/lhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBeUsXg6vfVsAoeNyeuKPy6Zrx/xe6J5VDZl6IUNh2X5G0Taeg8m3ydVrDKqVk5CU
	 kqrxPmY7mQZAcepOxEhIkipjDsIl7HsBYGiuL9FZjft6krz8n0eDPUrFwINzsckMx6
	 y52cUTnErojZr5w5lhdxMgjLBnN63+pjOXChYy+E=
Date: Tue, 26 Apr 2022 20:37:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: jirislaby@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] tty: n_gsm: return -EINVAL when adaption is not supported
Message-ID: <Ymg79qM3Wq2rlYvj@kroah.com>
References: <20220426120554.1120585-1-trix@redhat.com>
 <Ymfhtv5b9M33AQuc@kroah.com>
 <4789ae7a-64a2-566b-d445-b8433d3f867a@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4789ae7a-64a2-566b-d445-b8433d3f867a@redhat.com>

On Tue, Apr 26, 2022 at 11:16:35AM -0700, Tom Rix wrote:
> 
> On 4/26/22 5:12 AM, Greg KH wrote:
> > On Tue, Apr 26, 2022 at 08:05:54AM -0400, Tom Rix wrote:
> > > The clang build fails with
> > > n_gsm.c:940:13: error: variable 'size' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
> > >          } else if (dlci->adaption == 2) {
> > >                     ^~~~~~~~~~~~~~~~~~~
> > > 
> > > The else should return an error, so return -EINVAL.
> > > 
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > What commit id does this fix?  Any reason you didn't cc: the author of
> > the recent changes to this code?
> Sorry missed this part.

Please always do that, otherwise it's hard to track, right?

> > Is this the same issue that 0-day reported?
> 
> Maybe, it was part of next's update today.  Where is 0-day reported ?

On the same mailing list you posted this patch to:
	https://lore.kernel.org/r/202204230704.5MxboEEo-lkp@intel.com

thanks,

greg k-h
