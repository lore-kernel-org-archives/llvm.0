Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19739138E
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 06:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C00C433C7;
	Mon,  7 Aug 2023 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691390396;
	bh=cLRE+sII7UxJ95Wse28eozoKbP82elCRGURB4T28oU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xv3pC6z4NdGXo6fFO2mAE0b7pnfTYgjb109MExyrfTcLvK1Nb0Ld75UnbO+0aByN3
	 /yyKCBy5B+XW5LNWCm1k1MgrJirKlbInMghvuZJw7m1cAPmaBiRJYIxrFUra4Jsubx
	 KIqy2yPpqlk6KnycbxENlR3VzDHUoGHteVhNLduE=
Date: Mon, 7 Aug 2023 08:39:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jannik =?iso-8859-1?Q?Gl=FCckert?= <jannik.glueckert@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Huang Rui <ray.huang@amd.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux LLVM Build Support <llvm@lists.linux.dev>
Subject: Re: Fwd: CFI violation when reading amd_pstate/status
Message-ID: <2023080747-outsider-despite-acd2@gregkh>
References: <c7f1bf9b-b183-bf6e-1cbb-d43f72494083@gmail.com>
 <2023080743-amendable-moonlit-15b7@gregkh>
 <CAFqe=zJ9uRTVG=jny2PzUrrFGW2E_mZrGKF-3YMRkjzMUdu_7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFqe=zJ9uRTVG=jny2PzUrrFGW2E_mZrGKF-3YMRkjzMUdu_7A@mail.gmail.com>

On Mon, Aug 07, 2023 at 08:21:37AM +0200, Jannik Glückert wrote:
> Hi Greg,
> 
> our kernel uses the Fedora config and has a homeopathic patchset on
> top of upstream - see
> https://gitweb.gentoo.org/proj/linux-patches.git/tree/?h=6.4 except
> the 50** patches.
> Namely we don't touch cpufreq or pm.
> 
> > Comm: cat Tainted: P
> 
> I am not using any out of tree modules, the kernel switches to
> Tainted: P on the first CFI violation.

Ah, ok.  Then work with the amd_pstate driver authors on this, odds are
one of the sysfs callbacks is incorrectly created which is quite easy to
do for stuff like this.  CFI also gets confused at times when dealing
with sysfs attributes due to them being cast in all sorts of crazy ways.

good luck!

greg k-h
