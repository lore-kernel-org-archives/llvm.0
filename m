Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6501C02
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 16:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3D3C433EF;
	Tue, 18 Apr 2023 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834772;
	bh=rjCJgj3IuUXB+KMYP0dE2Q1zZouJ/iv0wsSFGHMlwCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pxom4GbEnS2sAH8Qd4YlaSHokC7ntgKttB4AOynP2+JBLVM2ga0OvTSQrRAlhlZSg
	 gz2crHvc1fCs4PiHhlI6jNBVtc6v1TkRXP8+c/uN01auvSc0ANazJCMDxW7jTLOpiV
	 jRNd2oN79bTYe2k5GqAk5BJEmv03TfhboiaeD5Kun/NPQNH7VhMmV+lGRplI9AisUY
	 rRoSi1rFmFJk7SD0gPZ7R8yeScCB3ypApa/S4gqhXIZvV5NE8uG3gn+UpVuRLUwHET
	 WGkbvym4wmOvYkDkVR7osavwkJ5F5LJaKBkE9CwkduFzIgi1P9REBUZF8YqD3orvvo
	 dsf58a/v9ffhw==
Date: Tue, 18 Apr 2023 09:19:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sashal@kernel.org, conor@kernel.org, stable@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 5.10 0/4] Backport of e89c2e815e76 to linux-5.10.y
Message-ID: <20230418161930.GA4411@dev-arch.thelio-3990X>
References: <20230328-riscv-zifencei-zicsr-5-10-v1-0-bccb3e16dc46@kernel.org>
 <20230411162001.GA3308382@dev-arch.thelio-3990X>
 <2023041223-nastily-huntress-cfa2@gregkh>
 <2023041847-catalyze-unfailing-ffe6@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041847-catalyze-unfailing-ffe6@gregkh>

On Tue, Apr 18, 2023 at 11:46:56AM +0200, Greg KH wrote:
> On Wed, Apr 12, 2023 at 08:17:06AM +0200, Greg KH wrote:
> > On Tue, Apr 11, 2023 at 09:20:01AM -0700, Nathan Chancellor wrote:
> > > Gentle ping, did this get lost?
> > 
> > Nope, just burried under a raft of other proposed backports.  It's still
> > in my review queue, will get to it eventually...
> 
> All now queued up, sorry for the delay.

Thanks a lot, I will take later over never :)

Cheers
Nathan
