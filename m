Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219045;
	b=Uh5440HzQEuDpInhZH+00H0DCGYFURtL5A6LpXeXoIZJgwXRfEjZbQN8evb8xisu42rh
	 xFO15ed7mIMB4evmnglrcaHb5IuLNr6z7PuB9p3pgE4YGN5WEiFNh92CtBgHaH6RVAzx/
	 oiZrMbXGqHlC8SBSzXmQVbqis89Yy6jFpMuoM29IjiHjTO20ZljO0Nt1V3Ly+4OdCDtUE
	 pvpG+iAoTMelN2GVb8t65TF/DOtew3AuH5jDD+tY/M43SHfwOGGTPTRT4k8HBh2u27M74
	 1FIE8HS7OwcX6rvkIPtKEU6xo2JIWyX/unAYy1/JMj2jnRq6xKQX7m59/QGaUg2pczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219045;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Yau+cqWHppsEyJegcQgqY8UAEBWteAU0el19tRPccxs=;
	b=zuh85aeVZ5VqqjgWlHyv91wKZpZLxPepIhnxMvRGn/sYtSkmQ+uSSvF0N4/yclhICmx7
	 IWwz8oN7eeYrCSfrK/5zLkYHGNS6HUZbdbDc7XNIOlhIoanrIeCW1YKL3HUWXVdwmKMYx
	 JtG3zW4RFUlZTLXDGxlrcdHz96QILpGRSN+PIBiPhWFBYPXW0fP5QQJWWZ12qMutQlPLj
	 /GnWnCWeOIdhsmC2pufr+A8oVphgzUOTLvE066DRaEJIRhcDFQDzJ2/KOlBrL+EiMuinc
	 +wj5e6I85l1ypR2SMyHZYBC2QjZSyQQFGybSs6YoZ577UlV1j0D6nDLkwbJT2Zs+swg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nq/PeQua";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3021606A31A;
	Wed, 28 Oct 2026 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nq/PeQua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80431F01825;
	Wed, 28 Oct 2026 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793219044;
	bh=Yau+cqWHppsEyJegcQgqY8UAEBWteAU0el19tRPccxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nq/PeQuakKtfuNJ2QuBKQEP2sN6Eee1W4DcK47HblxoeLWHqcjxzkRw/x6fCdJgVh
	 gpQ0EwuwR6Mikl/ZclzpqvirJnPWo3fLFkb+8/bx2o4gPMfTALAfGq+UPq2ElBpWBi
	 doGAQYMwMznYYHXQKlXUzMhXRwPMpEg0FHWxJ9L4sV+N0iW8lfKC2KkS8MLzJXv4+l
	 zSxwL+ki31gF78XSZ+iU8CnE2ude9mnrGv4pnRIdGj9H8fsZTXa9U76E6UlM/YWPjg
	 GxnGBv3GbkqvbJkEvAHdQWjAU2PZc8v54jj/pRxf/XnvwAdxRuP79nsTOqC8ZzMOeV
	 pRGrPIjSjyzRA==
Date: Wed, 28 Oct 2026 13:24:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
Message-ID: <20261028202400.GA835963@ax162>
References: <202610290223.iOEGeDs2-lkp@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610290223.iOEGeDs2-lkp@intel.com>

On Thu, Oct 29, 2026 at 03:10:30AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> commit: 7a097aba725501c399b5e93d0199aa3a2f6e9c88 clocksource/drivers/timer-mediatek: Convert to OF probing
> date:   2 weeks ago
> config: x86_64-buildonly-randconfig-1001-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290223.iOEGeDs2-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290223.iOEGeDs2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!

This warning occurs as a result of the above change because
of_device_get_match_data() returns NULL when CONFIG_OF is disabled,
which results in LLVM dropping the kCFI setup since it knows that there
is no valid target for this call. Adding a check for a NULL timer_init
avoids the warning, which would probably be more robust anyways since
of_device_get_match_data() could return NULL even with CONFIG_OF=y?

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..33bf4c97bb77 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -353,6 +353,8 @@ static int mtk_timer_probe(struct platform_device *pdev)
 	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
+	if (!timer_init)
+		return -ENODEV;
 	return timer_init(pdev);
 }
 
-- 
Cheers,
Nathan
