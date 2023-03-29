Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CA2F30
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 16:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A58EC433EF;
	Wed, 29 Mar 2023 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680106617;
	bh=TWpPK393k95haP5OmkFSJZSaIGBXcPtCisO7udVorLE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mCKVLvP3ZRlmOkHI70rR6kIipm/a/7dK5KUbDGYxs9Gqqhd5gyex8NDtc419bpeT7
	 3BMU/CHjXAGLydvu8fMhwsvKeynWbYt6PRVO/FbZitHvfMdlHhvf7RL4ka4SfSMzC2
	 enA+1FU1D7yDaNRDWfWVK3kvdaNbJoKJs3ATVDQzBDMmz7ao4FevWcxlfa5hJ98kiL
	 Jirn3Loz2fJsBlZ8N4xQzyrbVzkC5xE2UrdAY1MNy4VWs1BmMpNUyCZMfvRkoSNAEt
	 3PKYjqRl0QEwJuZJI8HQ6QkY3iigioy/9XLX3grIgBDe9zlN40aIfiIOxccoo//YZi
	 Ok+ClCczVnc1g==
From: Kalle Valo <kvalo@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: amitkarwar@gmail.com,  ganapathi017@gmail.com,  sharvari.harisangam@nxp.com,  huxinming820@gmail.com,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  nathan@kernel.org,  ndesaulniers@google.com,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH] mwifiex: remove unused evt_buf variable
References: <20230329131444.1809018-1-trix@redhat.com>
Date: Wed, 29 Mar 2023 19:16:49 +0300
In-Reply-To: <20230329131444.1809018-1-trix@redhat.com> (Tom Rix's message of
	"Wed, 29 Mar 2023 09:14:44 -0400")
Message-ID: <877cuzcz2m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Tom Rix <trix@redhat.com> writes:

> clang with W=1 reports
> drivers/net/wireless/marvell/mwifiex/11h.c:198:6: error: variable
>   'evt_buf' set but not used [-Werror,-Wunused-but-set-variable]
>         u8 *evt_buf;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

There should be "wifi:" in title, but I can add that during commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
