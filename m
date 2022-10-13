Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FE20F8
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665648749; x=1697184749;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=7n7bm9cEbwpAcQHLjxyNJZugoRkYPQp3Pb3ATCfFMcw=;
  b=ObT1NxtidbhoCaH2SFUCGamK0rrVCNOqdyRGLdKNr4RZU2ad9Hi85uqc
   LPItVJnSFXRZ9/GcTHBuZUtYMDhinpCHRxUAyru8wUCFttyFyCnT47Ba6
   SWzU2ZaMPURmNhecRN29OZ7ER35FXfUXd34nMzjNaLXGmTFYTiQICG6wU
   7ER0K35vKf+/uxs8cHqSSFOsZomdXE4Umj48ggY77sNXfP2J5LYt0bUhh
   fnFr/yX7eAiGzggpTZpRbkmY7dBxjllAiJGCZwpkqibOUCQKkVMig5XYw
   h/tJNVf4E4PPl1wIY8Wj3z1MF1reKdny9EmfPGDjtCUvFQ8dZ3y0Nb1Hz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306079537"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="306079537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 01:12:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="769524814"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="769524814"
Received: from ndenisov-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.41.197])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 01:12:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, keescook@chromium.org
Cc: luc.vanoostenryck@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com, dlatypov@google.com, vitor@massaru.org,
 gustavoars@kernel.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sparse@vger.kernel.org, arnd@kernel.org
Subject: Re: [PATCH v3] overflow: Introduce overflows_type() and
 castable_to_type()
In-Reply-To: <20221013064956.1548741-1-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221013064956.1548741-1-gwan-gyeong.mun@intel.com>
Date: Thu, 13 Oct 2022 11:12:29 +0300
Message-ID: <87zge0rvki.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 13 Oct 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index 0d98c9bc75da..44da9d190057 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,11 @@
>  #include <linux/types.h>
>  #include <linux/vmalloc.h>
>  
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#ifdef CONFIG_CC_IS_CLANG
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +#endif

I thought #pragma was discouraged. I didn't try this, but would
something like this work in the Makefile instead:

CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)

Sorry for not noticing before. If you all think pragma is fine, sorry
for the noise.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
