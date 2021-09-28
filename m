Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB43C3FCC
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:08:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 3D4852FF; Tue, 28 Sep 2021 11:59:59 +0200 (CEST)
Date: Tue, 28 Sep 2021 11:59:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] iommu/mediatek: fix out-of-range warning with clang
Message-ID: <YVLnnQ+7U/P2vA8A@8bytes.org>
References: <20210927121857.941160-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927121857.941160-1-arnd@kernel.org>

On Mon, Sep 27, 2021 at 02:18:44PM +0200, Arnd Bergmann wrote:
>  drivers/iommu/mtk_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

