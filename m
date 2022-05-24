Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370CA21
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653406745; x=1684942745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4rd15RSs+bC2DmRXjk8iPqEenJ0gefzbXgGg23o0n4E=;
  b=b+x9g6YpQAx5/mPrxvq7WrywApQfKxbVGdVgL38bwwmUPirGk/rHBDUF
   +/Wk9EbVg/DOXaT4boZ8PFcGLWN4Fii0eshlqzUhVKafTPF4mhJZyo3Pt
   W7ifoGgVdSHmFqIWVHOP9KbQxS1M7bCtUekWiPJY5ezRLT3AbNEJqR3Wa
   kVs9Y61Xjp2R6vgR+g+LhO/QQMDRsSc+yiqVjU9iqVkADbRrr1atoHTMg
   oze3/haawt0m4MOihkqATjGsjcCMszwiT34cwEQj/wwoFCYced7i+832T
   dcKwn+pi7VXTYqTTqKbNthY99kTRRgtbITo7rGV/3xYcH+Jwm8V1PBl89
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="261173190"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="261173190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 08:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="577938831"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga007.fm.intel.com with ESMTP; 24 May 2022 08:39:01 -0700
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 24OFd0qk001875;
	Tue, 24 May 2022 16:39:00 +0100
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH] ath6kl: Use cc-disable-warning to disable -Wdangling-pointer
Date: Tue, 24 May 2022 17:38:14 +0200
Message-Id: <20220524153814.1093477-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220524145655.869822-1-nathan@kernel.org>
References: <20220524145655.869822-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 24 May 2022 07:56:55 -0700

> Clang does not support this option so the build fails:
> 
>   error: unknown warning option '-Wno-dangling-pointer' [-Werror,-Wunknown-warning-option]
> 
> Use cc-disable-warning so that the option is only added when it is
> supported.
> 
> Fixes: bd1d129daa3e ("wifi: ath6k: silence false positive -Wno-dangling-pointer warning on GCC 12")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I was just about to send it :D

Reviewed-and-tested-by: Alexander Lobakin <alexandr.lobakin@intel.com>

> ---
>  drivers/net/wireless/ath/ath6kl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath6kl/Makefile b/drivers/net/wireless/ath/ath6kl/Makefile
> index 01cc0d50fee6..a75bfa9fd1cf 100644
> --- a/drivers/net/wireless/ath/ath6kl/Makefile
> +++ b/drivers/net/wireless/ath/ath6kl/Makefile
> @@ -38,7 +38,7 @@ ath6kl_core-y += recovery.o
>  
>  # FIXME: temporarily silence -Wdangling-pointer on non W=1+ builds
>  ifndef KBUILD_EXTRA_WARN
> -CFLAGS_htc_mbox.o += -Wno-dangling-pointer
> +CFLAGS_htc_mbox.o += $(call cc-disable-warning, dangling-pointer)
>  endif
>  
>  ath6kl_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
> 
> base-commit: 677fb7525331375ba2f90f4bc94a80b9b6e697a3
> -- 
> 2.36.1

Thanks,
Al
