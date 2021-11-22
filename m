Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D52C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 18:35:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637606139; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=13j6XBVuZRlOT+crcyS/jgeKW773HvgGp8s1QfJeY7U=;
 b=vyFiaFC7GoNQ/a0iUIXKpqDUhQdXkcix6eHUYzX2QHB//XsohRgNg0C5tCaf52/076Lu5YcY
 E2f2kHOw97wrYcL0xbzz048MJgJhkG0sayqbKIwMFQy1ffYkA85qgmfNuNfKWTqvz2UdBvtx
 yzb8PQi3qVrciwsjVP+XP7LBdWA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmNGYzNyIsICJsbHZtQGxpc3RzLmxpbnV4LmRldiIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 619be2fa4fca5da46db6ef9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 18:35:38
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E0F38C4360D; Mon, 22 Nov 2021 18:35:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	MISSING_DATE,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 84F74C4360D;
	Mon, 22 Nov 2021 18:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 84F74C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [v3] iwlwifi: pcie: fix constant-conversion warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118142124.526901-1-arnd@kernel.org>
References: <20211118142124.526901-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luca Coelho <luciano.coelho@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>,
 Yaara Baruch <yaara.baruch@intel.com>,
 Matti Gottlieb <matti.gottlieb@intel.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163760612835.7371.9754662728498548410.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 18:35:37 +0000 (UTC)

Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Both gcc-11 and clang point out a potential issue with integer overflow when
> the iwl_dev_info_table[] array is empty. This is what clang warns:
> 
> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
>         for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
>                ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
> 
> This is still harmless, as the loop correctly terminates, but adding
> an extra range check makes that obvious to both readers and to the
> compiler.
> 
> Fixes: 3f7320428fa4 ("iwlwifi: pcie: simplify iwl_pci_find_dev_info()")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Patch applied to wireless-drivers.git, thanks.

fe785f56ad58 iwlwifi: pcie: fix constant-conversion warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118142124.526901-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

