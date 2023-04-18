Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667C1FA0
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 09:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FCCC433D2;
	Tue, 18 Apr 2023 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681811219;
	bh=/xfbOpyupvbqNz2qsHH+H4MqAraE3d2u1isOY9SKHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3RILYSZY608JoNmaCMLCq3EX1vBjdMh2BdTdvWV1/8jsNF/pSexOpgeBD6hAC4Lc
	 ZEs0coHWgDhkJTGyypg9riN/4uuSixFWhGw4rnW0edLOS/XO7N+RdHTWvPYWmxhGYR
	 kzEsL9VxsDYroMshYRrH2KmTjhcNEDOOTdTUtQBA=
Date: Tue, 18 Apr 2023 11:46:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: sashal@kernel.org, conor@kernel.org, stable@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 5.10 0/4] Backport of e89c2e815e76 to linux-5.10.y
Message-ID: <2023041847-catalyze-unfailing-ffe6@gregkh>
References: <20230328-riscv-zifencei-zicsr-5-10-v1-0-bccb3e16dc46@kernel.org>
 <20230411162001.GA3308382@dev-arch.thelio-3990X>
 <2023041223-nastily-huntress-cfa2@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023041223-nastily-huntress-cfa2@gregkh>

On Wed, Apr 12, 2023 at 08:17:06AM +0200, Greg KH wrote:
> On Tue, Apr 11, 2023 at 09:20:01AM -0700, Nathan Chancellor wrote:
> > Gentle ping, did this get lost?
> 
> Nope, just burried under a raft of other proposed backports.  It's still
> in my review queue, will get to it eventually...

All now queued up, sorry for the delay.

greg k-h
