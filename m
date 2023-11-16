Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AA3067B;
	Thu, 16 Nov 2023 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D571BC433C7;
	Thu, 16 Nov 2023 19:27:55 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id AF8EF10613A1; Thu, 16 Nov 2023 20:27:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
 trix@redhat.com, Su Hui <suhui@nfschina.com>
Cc: r-rivera-matos@ti.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20231116041822.1378758-1-suhui@nfschina.com>
References: <20231116041822.1378758-1-suhui@nfschina.com>
Subject: Re: [PATCH] power: supply: bq256xx: fix some problem in
 bq256xx_hw_init
Message-Id: <170016286968.830118.5959829920078266260.b4-ty@collabora.com>
Date: Thu, 16 Nov 2023 20:27:49 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Thu, 16 Nov 2023 12:18:23 +0800, Su Hui wrote:
> smatch complains that there is a buffer overflow and clang complains
> 'ret' is never read.
> 
> Smatch error:
> drivers/power/supply/bq256xx_charger.c:1578 bq256xx_hw_init() error:
> buffer overflow 'bq256xx_watchdog_time' 4 <= 4
> 
> [...]

Applied, thanks!

[1/1] power: supply: bq256xx: fix some problem in bq256xx_hw_init
      commit: b55d073e6501dc6077edaa945a6dad8ac5c8bbab

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

