Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25940EC5
	for <llvm@lists.linux.dev>; Wed,  5 Apr 2023 11:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62CBC433EF;
	Wed,  5 Apr 2023 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680694740;
	bh=Ac8wTw9RR/85DVjXUxxvaiBRTiHVdB/k4QsbhkKgWLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIqe1gT4vcZIjvsLtoiJSi7tp746yDBu8/mBlP7hSvfcy6MiuGPFRFV6I6sGvAcqY
	 XtsGkzf23WgZfFcc5+tYHRwqD7PmCkFKK66bhRC9NV7yETzLjwFoX8mszseSHlHiEN
	 Z7SyhqCLWzqji4K5cPC14ShD5XRljk/DznftXq1oszUh7/Igqt/DQk8+UJjnqsmdsr
	 asjOUvsKkgudJc5SeChHwKi3d8WqhlE7rCo6/E6+w5joroS2iYKklD23zo1WeI9sNo
	 cH/VyU/2rANX8tas5/ILiklfubyKhrBbrjR/AfxJRhBSVNGvQ43gbNvyWji9l/ftCi
	 BDvz5roOGy2Uw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pk1UB-00059d-BR; Wed, 05 Apr 2023 13:39:31 +0200
Date: Wed, 5 Apr 2023 13:39:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: gregkh@linuxfoundation.org, nathan@kernel.org, ndesaulniers@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] USB: serial: quatech2: remove unused qt2_setdevice
 function
Message-ID: <ZC1d850dwMjggbzo@hovoldconsulting.com>
References: <20230321181255.1825963-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321181255.1825963-1-trix@redhat.com>

On Tue, Mar 21, 2023 at 02:12:55PM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/usb/serial/quatech2.c:179:19: error: unused function
>   'qt2_setdevice' [-Werror,-Wunused-function]
> static inline int qt2_setdevice(struct usb_device *dev, u8 *data)
>                   ^
> This function is not used, so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Now applied, thanks.

Johan
