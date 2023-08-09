Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5B24505
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 19:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B1DC433C8;
	Wed,  9 Aug 2023 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691608394;
	bh=LeVB41u38/bhZJrLFYAIuDBKlGLS2oWJkoZGthUq6Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foNa56/Lvq4BCC02Q0ZTTK/jrSpYteAeDNQMdVNsyuFpsa9NA9veVhr1OryMX+6Y1
	 5eo69vm1HvoiTG/+RFjyCQUESdxy1N0V+PJuoo1I77HXUdV3RoOcJFCZST144usBxk
	 UqEJUWXAf0J7zQ9DhyHWd2jZwqL+H5iiHiKzAPlCHjXM+t4Kc8ZU3QdqHoA9saStRU
	 Pnz4Y7aXVJn7GLkEWc2VbOhGhLklgpJvPd9SppbWmrEeCxXm3cUUU3eFiZoNv7QEqV
	 x4aWcmFpjm9Wc5o5cBSbEX5yduts81Vog3ta1qctnKYw0yuKy+UFvwlpdkybvwANvG
	 8jGt+6GCg8oFw==
Date: Wed, 9 Aug 2023 21:13:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jean Delvare <jdelvare@suse.com>, Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c/busses: fix -Wmissing-variable-declarations
Message-ID: <20230809191310.atpqztlpgdbdvc5m@intel.intel>
References: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>

Hi Nick,

On Tue, Aug 08, 2023 at 09:56:16AM -0700, Nick Desaulniers wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance:
> 
>   drivers/i2c/busses/i2c-amd756.c:286:20: warning: no previous extern
>   declaration for non-static variable 'amd756_smbus'
>   [-Wmissing-variable-declarations]
>   286 | struct i2c_adapter amd756_smbus = {
>       |                    ^
>   drivers/i2c/busses/i2c-amd756.c:286:1: note: declare 'static' if the
>   variable is not intended to be used outside of this translation unit
>   286 | struct i2c_adapter amd756_smbus = {
>       | ^
> 
> This symbol is referenced by more than one translation unit, so create
> then include the correct header for their declarations.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

You might want to have a Fixes tag here and

Cc: Jean Delvare <jdelvare@suse.com>

[...]

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amd756.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please, leave a space here.

And you might also want to have something like:

#ifndef __I2C_AMD_756_H__
#define __I2C_AMD_756_H__

> +#include <linux/i2c.h>

space here.

> +extern struct i2c_adapter amd756_smbus;

#endif /* __I2C_AMD_756_H__ */

Jean, any opinion on this patch, I don't really know this driver,
but is there a way to avoid this extern declaration.

Thanks,
Andi
