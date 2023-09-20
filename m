Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6D15AE8
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 11:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC11C433C7;
	Wed, 20 Sep 2023 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695208516;
	bh=ien7KJ6XrEwO+Bq1GOg+pQVFCdR0bSGZcnV8VgcfewU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CsrbLcn0B04q8yzKIGWnAmLze/wJn2L3uZ5janCCQPzqPJVzIZMj0qrIRzfMwsaH4
	 VDt3AhmEL7/0BjRbm5ksl5MC5S4n1OjDWwtfm3LlqIQcEzk/KckODpRWoOZtugs2J6
	 Ci3S8owHmJp8Ka0ju5sHhJbidqzjPy3HPnzKL1bssN9xLyHgLROH8S8VdQAvcamCk9
	 YyeIj88LjkjeiTJTsGSwU+uosSamxtbz2EqN7/ZFrMpxCkeeYRZiG/dCId8/dkb0ng
	 TNHW+7duY3URUS74lLEmB3lsIs27y+w6dZY7CCQq7aIfmmHV2YQMjnTp1U9bNCKM7f
	 TatzLJmdWmlwQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: brcmfmac: firmware: Annotate struct
 brcmf_fw_request
 with __counted_by
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230915200552.never.642-kees@kernel.org>
References: <20230915200552.never.642-kees@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Arend van Spriel <aspriel@gmail.com>, Kees Cook <keescook@chromium.org>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Matthias Brugger <mbrugger@suse.com>, Hector Martin <marcan@marcan.st>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169520851058.991705.15337054707712499896.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 11:15:12 +0000 (UTC)

Kees Cook <keescook@chromium.org> wrote:

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct brcmf_fw_request.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Arend van Spriel <aspriel@gmail.com>
> Cc: Franky Lin <franky.lin@broadcom.com>
> Cc: Hante Meuleman <hante.meuleman@broadcom.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: brcm80211-dev-list.pdl@broadcom.com
> Cc: SHA-cyfmac-dev-list@infineon.com
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>

Patch applied to wireless-next.git, thanks.

45aec443bbb0 wifi: brcmfmac: firmware: Annotate struct brcmf_fw_request with __counted_by

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230915200552.never.642-kees@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

