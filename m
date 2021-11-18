Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDE2C86
	for <llvm@lists.linux.dev>; Thu, 18 Nov 2021 16:04:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BD2B613A3;
	Thu, 18 Nov 2021 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637251445;
	bh=oa7oSmJxHRoFc+bzoJMwa3+/zIjqvCBcVLfQMRXh6d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cepdl9GxzCeJczoIb9omidGHLGmWsBUuiq31lUe/OvdnSh1CiOuhPyx/W6S+8szGJ
	 ZrCUzLyrcCNXtlhzWndtlnFyDq9nEmdztk2YN1fdtJuDzG12UU/W1PpVHP1cTYIgs+
	 InUTz28W7wy7dd9i7Zc/v7eQu+kIAozGh+mqyTFT12aEZpH+U9mbBg0TPd9Fcr4SSK
	 z8sPG4htZ+grxKcOMVB6OtNUd43RKijEBU/oHsz9cBsDVHAjoS9ClDOdqCcKWBKoEG
	 8MMWvB+K2MhSwiRsKtMnsafQQlm7f1iDRM9sfCj5hFgmEryQcpo37BYfP7PRVaAfo6
	 aYD6dXP1Jeq4A==
Date: Thu, 18 Nov 2021 09:03:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Luca Coelho <luciano.coelho@intel.com>,
	Kalle Valo <kvalo@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Yaara Baruch <yaara.baruch@intel.com>,
	Matti Gottlieb <matti.gottlieb@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v3] iwlwifi: pcie: fix constant-conversion warning
Message-ID: <YZZ5b0FoppEBRcdL@archlinux-ax161>
References: <20211118142124.526901-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118142124.526901-1-arnd@kernel.org>

On Thu, Nov 18, 2021 at 03:21:02PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-11 points out a potential issue with integer overflow when
> the iwl_dev_info_table[] array is empty:
> 
> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
>         for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
>                ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~

For what it's worth, I do see this warning with Clang when both
CONFIG_IWLDVM and CONFIG_IWLMVM are disabled and looking through the GCC
warning docs [1], I do not see a -Wconstant-conversion option? Maybe
there is another warning that is similar but that warning right there
appears to have come from clang, as it matches mine exactly.

drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
        for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
               ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
1 error generated.

[1]: https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html

> This is still harmless, as the loop correctly terminates, but adding
> an extra range check makes that obvious to both readers and to the
> compiler.
> 
> Fixes: 3f7320428fa4 ("iwlwifi: pcie: simplify iwl_pci_find_dev_info()")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Regardless of above, this resolves the warning for clang.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes in v3:
> - make it actually work with gcc-11
> - fix commit message s/clang/gcc-11/
> 
> Changes in v2:
> - replace int cast with a range check
> ---
>  drivers/net/wireless/intel/iwlwifi/pcie/drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> index c574f041f096..395e328c6a07 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> @@ -1339,9 +1339,13 @@ iwl_pci_find_dev_info(u16 device, u16 subsystem_device,
>  		      u16 mac_type, u8 mac_step,
>  		      u16 rf_type, u8 cdb, u8 rf_id, u8 no_160, u8 cores)
>  {
> +	int num_devices = ARRAY_SIZE(iwl_dev_info_table);
>  	int i;
>  
> -	for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
> +	if (!num_devices)
> +		return NULL;
> +
> +	for (i = num_devices - 1; i >= 0; i--) {
>  		const struct iwl_dev_info *dev_info = &iwl_dev_info_table[i];
>  
>  		if (dev_info->device != (u16)IWL_CFG_ANY &&
> -- 
> 2.29.2
> 
