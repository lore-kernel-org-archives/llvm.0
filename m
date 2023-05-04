Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9998FC06
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 15:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BCEC433EF;
	Thu,  4 May 2023 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683214269;
	bh=2rwTNxyy/a+OI1xu++VzokI68B070OKIEG9Yh63+Wzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bay72SSYhV2yo8B6kf1azuiZodR2nB9+vdpiBdheVy4c17zUOHwzAzEKlRf57zi3I
	 KxRwt7nVWLjJZc8CA8zvfzG1E3/3j/LsAtVhzoR/ZFKaRKRzeFE+PAKFW3vz1RTKBb
	 TibeoaJ02BYnWOiA/1JeLdtdPbcixwVwQZX483MyOBcQ79uScw//3tQMYswNdgFDkg
	 fD+7zeWURTRkz4dj4nEjiMM2C1NKQWz7q9UtQvuJf4GuZVdew7tbCvpQ0Q7rZJtTVU
	 ykdt+NUVffEowWE2Kb/bPB8/Jw7l5+ii4HRUc4tSyrQdfAI7jKxwyTeL+K0SeQ8kX9
	 M4oG5XRHg5cNw==
Date: Thu, 4 May 2023 21:01:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Phy <linux-phy@lists.infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [GIT PULL]: Generic phy updates for v6.4
Message-ID: <ZFPPucb9VNLB8r8v@matsya>
References: <ZFI74eeUzVPKhi4f@matsya>
 <20230504150624.GA1000378@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504150624.GA1000378@dev-arch.thelio-3990X>

On 04-05-23, 08:06, Nathan Chancellor wrote:
> Hi Vinod,
> 
> On Wed, May 03, 2023 at 04:18:01PM +0530, Vinod Koul wrote:
> > Hello Linus,
> > 
> > Please consider pull to receive generic phy updates for v6.4-rc1. We
> > have a bunch of new controller support in qcom, mediatek and rk socs.
> > Intel Thunder Bay eMMC PHY driver is dropped as no users and bunch of
> > driver updates for the subsystem
> > 
> > The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> > 
> >   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.4
> > 
> > for you to fetch changes up to a0106132372120dd0abf5ad7636614e5aeb5da08:
> > 
> >   phy: cadence: cdns-dphy-rx: Add common module reset support (2023-04-12 22:16:16 +0530)
> > 
> > ----------------------------------------------------------------
> > phy-for-6.4
> > 
> >   - New support:
> >         - UFS PHY for Qualcomm SA8775p, SM7150
> >         - PCIe 2 lane phy support for sc8180x and PCIe PHY for SDX65
> >         - Mediatke hdmi phy support for mt8195
> >         - rockchip naneng combo phy support for RK358
> > 
> >   - Updates:
> >         - Drop Thunder Bay eMMC PHY driver
> >         - RC support for PCIe phy for Qualcomm SDX55
> >         - SGMII support in WIZ driver for J721E
> >         - PCIe and multilink SGMII PHY support in cadence driver
> >         - Big pile of platform remove callback returning void conversions
> > 
> > ----------------------------------------------------------------
> ...
> > Guillaume Ranquet (3):
> >       dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
> >       phy: phy-mtk-hdmi: Add generic phy configure callback
> >       phy: mediatek: add support for phy-mtk-hdmi-mt8195
> 
> This patch went in without one of the three simple/obvious fixes sent to
> you, so now clang builds with -Werror are broken, as they have been in
> -next for almost three weeks :/

Sorry between vacation and travel, this was missed.

No worries we have process to deal with this, so this shall go in as
fixes.. I will do the needful shortly

Thanks
-- 
~Vinod
