Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873F2C81
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 18:30:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637605813; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=hS+cNZNvsc18vNvR+2V+IqRLIQR1if5Mbok+6txtYhw=;
 b=MNkOqEai2JGepSpWrTniWCjldp/RI7o9edEkgn0rr+HMri7ey8fpVG/CHIGpTxgqEuJ4u17V
 7/pOgJ1K4EcEMUFHScaq7F8WoXvZxRRTmkMFPcklDeGCRjOs9cCsZ8UksrWTpdsUa25PPmi6
 UjH0vi/92Ji4A0yFi5ruXzcrp+A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNGYzNyIsICJsbHZtQGxpc3RzLmxpbnV4LmRldiIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 619be1b386d0e4d888b79624 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 18:30:11
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 21FABC43617; Mon, 22 Nov 2021 18:30:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	MISSING_DATE,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D6910C4360C;
	Mon, 22 Nov 2021 18:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D6910C4360C
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
Subject: Re: [PATCH] [v2] iwlwifi: pcie: fix constant-conversion warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211111073145.2504032-1-arnd@kernel.org>
References: <20211111073145.2504032-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luca Coelho <luciano.coelho@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Johannes Berg <johannes.berg@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel test robot <lkp@intel.com>, Yaara Baruch <yaara.baruch@intel.com>,
 Matti Gottlieb <matti.gottlieb@intel.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163760580216.5904.8642934154284226912.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 18:30:10 +0000 (UTC)

Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang points out a potential issue with integer overflow when
> the iwl_dev_info_table[] array is empty:
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
> Acked-by: Luca Coelho <luciano.coelho@intel.com>

Dropping v2 and taking v3 instead.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211111073145.2504032-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

