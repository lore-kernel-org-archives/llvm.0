Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44186388
	for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Alcgnt/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9A2C433C8;
	Thu, 30 Nov 2023 00:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701304946;
	bh=8nzlEGlTs23WnuWO60c1e2cluA21UQcXiLq8MdrlUq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Alcgnt/BtUoUp4InDQMZgs/IX+8gQPxIZcPXGUc0udT5b6Tq/haKiZm04X93M1BzD
	 Cg2H1jkgvc5R6esOS+bKTc/iFFT9zDGZs+aQqPHL5H6aNrRhLBIV6v3ckvPghTNTiw
	 ZKEes9qGssNEGFZXCGEqr1E0pfLLZ0qlTxIvKO1wxGHBL/kg0agO2xr80k+T196MZY
	 IasBxgkod+kYtMMOaFuZg7Mv2JV5d2Ji2lJMMPNjpFO7MITDIg8DovvYNYpkFwdNcl
	 NDOJAyyQw273ZvY0UoQUICBsc6cWBZQ6iz0LH4Kcv7JjIf502bEGHIiPPd18e74MH2
	 ErMz8UgWXsP/A==
Date: Wed, 29 Nov 2023 17:42:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231130004224.GE2513828@dev-arch.thelio-3990X>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123-headdress-mold-0dd7a74477f7@wendy>

On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> > RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> > architectures. Enabling hardware FP requires overriding the ISA string
> > for the relevant compilation units.
> 
> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

:(

> Nathan, have you given up on these being sorted out?

Does your configuration have KASAN (I don't think RISC-V supports
KCSAN)? It is possible that dml/dcn32 needs something similar to commit
6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
or KCSAN in dml2")?

I am not really interested in playing whack-a-mole with these warnings
like I have done in the past for the reasons I outlined here:

https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/

> Also, what on earth is that function name, it exceeds 80 characters
> before even considering anything else? Actually, I don't think I want
> to know.

Welcome to "gcc-parsable HW gospel, coming straight from HW engineers" :)

Cheers,
Nathan
