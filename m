Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293F4A43E2;
	Thu, 10 Sep 2026 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049441; cv=none; b=j4QXrA7610XPeuUxCdcKrFNejNKUYtifPACLCG/koQQ7/cARK2Wj/pHECeRszNit4llB+KQmadnouD5flmBJ5vd05YjxNt834NxjB8KAZQMPu8qPuFq102cTlIoMzUQRfAUsOwf+5OXKQtr5UADAPyYJsEcFm7J7pougU+IXgEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049441; c=relaxed/simple;
	bh=pGXcaTCS0DMWKBWv7Gug332gF8k+CZl6lsWiKMdf390=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eiykI0FyNYu/e+cKZ5ZF2BJPGjXOWA+pxNhty1h583IcD9XQJJ4yAqvqxv1Is6Spjot4LwqFgFpdAzd8ZlfsHUN2K5roladSc0w1vuyx3P/4e3rPxhQ7CHMhZDu8ZBY91FN7LVQs3fLnxg7jzFqGoowUGo8yt3jRTo6nFspO5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ6cVMpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ6cVMpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDA01F00893;
	Thu, 10 Sep 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049439;
	bh=s0QG9I71upZyEXzzfooDadpnQxcSy4xLmb/YzYBTnWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jJ6cVMpgVqoE8r4JQrNW0qKarn00BwdkL/vODUPlIMP2kdZaEhOLC1z5eASE2CWma
	 PA4H83gqYstWkoqoVpqAjIB0xLPuU3DPlRLPk9G50Z8Gn/v6jIBFVpSEbl6pGkhvuI
	 qvtbN7bwLkHhskcRTSNUg4xDNpi5/QidQKHW4RAb7IG1dCZkHUd7axbQkXcFtOXoyi
	 MH1mmRZzGOOSyhillmUPSfK4rN8mS5TBCh1DPLfeanMzPO9bWrXtk2WV6D4s+bsgV0
	 e0JpFlgcnM3Dap+L7TSVMqmbxLZ+FgUQTlo9/YrlQPHmqS8Zk+XCetntKRYF/GzEHO
	 GSpmAfJxe9RHA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260908213334.593584-1-rosenp@gmail.com>
References: <20260908213334.593584-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: ata: drop unused local variable
 'inc'
Message-Id: <178904943598.118320.5959463863404222502.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:35 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 08 Sep 2026 14:33:34 -0700, Rosen Penev wrote:
> bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
> was never read, tripping clang -Wunused-but-set-variable:
> 
>   drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
>   used [-Werror,-Wunused-but-set-variable]
>      58 |         struct bcom_ata_inc *inc;
>         |                              ^
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: ata: drop unused local variable 'inc'
      commit: db1a748a3509da959c547689af40e8a064a19c6b

Best regards,
-- 
~Vinod


