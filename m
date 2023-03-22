Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A4BA29
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 20:09:59 +0000 (UTC)
Received: from p508fd58e.dip0.t-ipconnect.de ([80.143.213.142] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pf4mJ-0004Ps-T8; Wed, 22 Mar 2023 21:09:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: daniel@ffwll.ch,
	Tom Rix <trix@redhat.com>,
	hjc@rock-chips.com,
	nathan@kernel.org,
	s.hauer@pengutronix.de,
	airlied@gmail.com,
	ndesaulniers@google.com,
	michael.riesch@wolfvision.net
Cc: Heiko Stuebner <heiko@sntech.de>,
	llvm@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: fix uninitialized variable possible_crtcs
Date: Wed, 22 Mar 2023 21:09:45 +0100
Message-Id: <167951576826.1541042.11962083782525897631.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230316132302.531724-1-trix@redhat.com>
References: <20230316132302.531724-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 16 Mar 2023 09:23:02 -0400, Tom Rix wrote:
> clang reportes this error
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
>   variable 'possible_crtcs' is used uninitialized whenever 'if'
>   condition is false [-Werror,-Wsometimes-uninitialized]
>                         if (vp) {
>                             ^~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
>   uninitialized use occurs here
>                 ret = vop2_plane_init(vop2, win, possible_crtcs);
>                                                  ^~~~~~~~~~~~~~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
>   note: remove the 'if' if its condition is always true
>                         if (vp) {
>                         ^~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: fix uninitialized variable possible_crtcs
      commit: e88adb4ac27a37de4167150b8a6a736d40cf7018

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
