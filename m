Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23DBE7C
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 14:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC8EC433C8;
	Wed, 23 Aug 2023 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799949;
	bh=aK8sjaMMZCwX9NyCciICkzG/hN1SXAT3vqzO/pjFLfU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Wy3UBr+NXNWEJ0EK7Z7zSFIDDpS79KrygtZ/M2QrDWykNrZLB+nC9TuIzBKj4M8zd
	 5F65MB/Z0zUhZ9oKfA9Q3KY4flQE9A8KrD9MkMU33jMOwLkYcv5kNiYlCDZbUbv4Kb
	 2ZbBV9iSvOMAmq6xk52O2Y/0R5luCW1sTkzQ/k0ouQ5P9weP9OODRuMCcEHcEgZDay
	 OIK7YO++zXlzbsGUZRnglE8CIUGRkmGqCl1i5wGwnqnsYCcV2fLI46KNlS1m9LrfJj
	 JFH45QVbUGqx6BPARaJw7K3a43L1itv8zwQ+6XAHsnH4Bp/KTX0n18o4zlkiQndEe8
	 vTbCdSNWmP59g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wireless: ath: remove unused-but-set parameter
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230814073255.1065242-1-arnd@kernel.org>
References: <20230814073255.1065242-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Jiri Slaby <jirislaby@kernel.org>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rg?=
	=?utf-8?q?ensen?= <toke@toke.dk>, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Aloka Dixit <quic_alokad@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
 Karthik M <quic_karm@quicinc.com>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Muna Sinada <quic_msinada@quicinc.com>,
 Johannes Berg <johannes.berg@intel.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279994309.1241462.4902060190559349249.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:12:24 +0000 (UTC)

Arnd Bergmann <arnd@kernel.org> wrote:

> This has never been used since the driver was merged, but it now causes
> a W=1 warning in recent clang versions
> 
> drivers/net/wireless/ath/ath9k/main.c:1566:21: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath9k/htc_drv_main.c:1258:25: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> drivers/net/wireless/ath/ath5k/mac80211-ops.c:367:62: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
> 
> Remove the bit manipulation on the otherwise unused parameter.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3b86f86d0f16 wifi: ath: remove unused-but-set parameter

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230814073255.1065242-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

