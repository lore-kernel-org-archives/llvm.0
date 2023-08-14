Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D3BA34
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 14:33:36 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1692023040; bh=8SoUg7FO+B5ltN+g6mc/GlWomKwJReuVjx+WDxr4fG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q7kRvaONx8fu6n6qI38VDGpzAWdZEDVoe1g+DoBmUZtrq0Fn5eI2ui186O6rxbt/Y
	 W8vwFlb2SGysuamOxs99cfHh6jlzfvdfjk3LkKtxJeqJR7T4U22IDSszXrc6tgPJy9
	 FieoOMY3S4Qa1zykwR5wTnoXLmUzCQarLx3+Mq/04aTOxHA13Jkyfao9XbNFtFZ27h
	 f8VptPi3zogfbPgb9CUSoyc7+njnL7+3Fq5yS2XD5eM4SgF7ziYxj3WdKlgL6lbWK2
	 a5HyqElzaFH/TI1EGlpEEksDpnsQ3fnt8tT2kB12mM6LkR+LV7gfOgW2gxRxuWWaun
	 WtClH1slP7r1A==
To: Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <quic_jjohnson@quicinc.com>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Aloka Dixit <quic_alokad@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, Karthik M
 <quic_karm@quicinc.com>, Aditya Kumar Singh <quic_adisi@quicinc.com>, Muna
 Sinada <quic_msinada@quicinc.com>, Johannes Berg
 <johannes.berg@intel.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] wireless: ath: remove unused-but-set parameter
In-Reply-To: <20230814073255.1065242-1-arnd@kernel.org>
References: <20230814073255.1065242-1-arnd@kernel.org>
Date: Mon, 14 Aug 2023 16:23:59 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87zg2tem80.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This has never been used since the driver was merged, but it now causes
> a W=3D1 warning in recent clang versions
>
> drivers/net/wireless/ath/ath9k/main.c:1566:21: error: parameter 'changed_=
flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath9k/htc_drv_main.c:1258:25: error: parameter '=
changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath5k/mac80211-ops.c:367:62: error: parameter 'c=
hanged_flags' set but not used [-Werror,-Wunused-but-set-parameter]
>
> Remove the bit manipulation on the otherwise unused parameter.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For ath9k:
Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
