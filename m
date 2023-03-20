Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46F1846
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 09:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C00C43339;
	Mon, 20 Mar 2023 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679305994;
	bh=D5BHlxKKNnfm+orqjuQfYDNb8O0fSKI6DJrwJTX1coU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i34lSCHJ2lij3k41ZH5uuH6oo6pHBkmRvOPrjx02c7BH6CocKB+wa7IxPrKrNvjnM
	 TizekFABjr4+eWsky5fM6vzJb5MGiX2QYLeEDA2UdcsyIwOiKR8tb0ffAjc3GxuGah
	 MemgsnBWBLyfNOBXa1MgHllkt48Jtz4mg4/Ev0sMf8uUheVXS6OsjLRsp+2afUKoNd
	 qA0kvzNr/XewrfUZR0Kr3Y+ZBct6crcUb7s5DK6HNT6dH2ZlWQ/YONuX495AjAoUAF
	 YyJIyfCef2gmBkDGw23ZBNaMpLgRrNVsh3oVGoVc+qlQSTvxR/Z8c6pQUnNQEUc+/F
	 jYJQyr3frYcnQ==
From: rfoss@kernel.org
To: ndesaulniers@google.com,
	jernej.skrabec@gmail.com,
	nathan@kernel.org,
	jonas@kwiboo.se,
	Tom Rix <trix@redhat.com>,
	Laurent.pinchart@ideasonboard.com,
	daniel@ffwll.ch,
	neil.armstrong@linaro.org,
	airlied@gmail.com,
	andrzej.hajda@intel.com
Cc: Robert Foss <rfoss@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
Date: Mon, 20 Mar 2023 10:52:38 +0100
Message-Id: <167930590639.1131145.3012560086575195897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318002321.1675181-1-trix@redhat.com>
References: <20230318002321.1675181-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Robert Foss <rfoss@kernel.org>

On Fri, 17 Mar 2023 20:23:21 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/gpu/drm/bridge/sii9234.c:870:31: error:
>   unused function 'bridge_to_sii9234' [-Werror,-Wunused-function]
> static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
>                               ^
> This static function is not used, so remove it.
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
      commit: 5327469ec4c07977e1d824badadd2628fcd04e85



Rob

