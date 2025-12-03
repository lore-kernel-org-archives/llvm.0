Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA680255F3F;
	Wed,  3 Dec 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798605; cv=none; b=LhbwL5LpZnpajClu20zKPXXDKPkJ3IuN4CjsXE4Gz+2ldhUsD1sXXZecwUazZobRsuQ6Cpsj35QcNo6mmQ1elMs76auKpvSmpU1Xpt/FffV9aF+R9wVJLaf9CTnNghdAiJSfP0VdznnyYF3dHmUkoYRbK4l+glB9CzlBhxMHAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798605; c=relaxed/simple;
	bh=a1vLDrWJiWB9iwEznxpMPNyicMp53/pifzezjHaUACA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryzf0fzvHXTz6EWLYbMl9AqjVBM/XZ0S1XZkf6bKksaxEgkbG2/b+H/Idm8VVUt4WdAkbFqM4PNeWhcDZxLcDr4z6BYjj7mLV8dKAy/vhFp2k1gHanxRUd5aBAoW6Hik8pRBSVUEzxhAhhfjvysDHUFkhb9y2wr5TCC0opLHlxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMtayfUt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMtayfUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD61C4CEF5;
	Wed,  3 Dec 2025 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764798603;
	bh=a1vLDrWJiWB9iwEznxpMPNyicMp53/pifzezjHaUACA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMtayfUt8x34iV1IHXV/aKOfK1qW3tFwnFnywHK/kIhGFa4MBVQohMSIBMdImD0NX
	 1e7gw9OssTKurhvi1S7tC8XZjrk+VYkevOJr97DnFYKZgWN9r6cdLNFE+E0bDpdVKc
	 qu/HtjM2QAQN+lCs5K91pDUhzTuDorfPQPuG5/XF3IFI31hPkr85FsTOx7pyUdjSE2
	 mgy7qaE4fEZX1K8Q/WfkmCfn/1w3Yy/SCJaBvqLiG6gX26Awmz7F3hcv//ukboYyi2
	 ejD5L+JDt7ympbunnM4uMhakfDKxml3JwuS9zYcqARM6KxzDBQ7Seu8pVV4sW4+C4m
	 M4uLbIS9SjG/A==
Date: Wed, 3 Dec 2025 14:49:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: codecs: nau8325: Silence uninitialized variables
 warnings
Message-ID: <20251203214958.GC3060476@ax162>
References: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203140611.87191-2-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On Wed, Dec 03, 2025 at 03:06:12PM +0100, Krzysztof Kozlowski wrote:
> clang W=1 builds warn:

For the record, W=1 is irrelevant here, this warning occurs in a default
build as well. I only mention that because I think some maintainers
mentally downplay W=1 patches (I know Mark already picked this up).
-Wuninitialized and -Wsometimes-uninitialized should always appear,
regardless of W=1.

>   nau8325.c:430:13: error: variable 'n2_max' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> which are false positive, because the variables will be always
> initialized when used (guarded by mclk_max!=0 check).  However

Right, which I pointed out on another report:

  https://lore.kernel.org/all/20251201191052.GA2727778@ax162/

> initializing them upfront makes the code more obvious and easier, plus
> it silences the warning.

I get silencing the warning to avoid breaking the build but I think the
warning is flagging that this code is dodgy.

If we remove the known dead code as the solution to the original
problem:

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 3bfdb448f8bd..e060a8950940 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -426,11 +426,6 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 			}
 		}
 	}
-	if (mclk_max) {
-		*n2_sel = n2_max;
-		ratio = ratio_sel;
-		goto proc_done;
-	}
 
 proc_err:
 	dev_dbg(nau8325->dev, "The MCLK %d is invalid. It can't get MCLK_SRC of 256/400/500 FS (%d)",

Then we get the following warnings with W=1:

  sound/soc/codecs/nau8325.c:389:35: error: variable 'ratio_sel' set but not used [-Werror,-Wunused-but-set-variable]
    389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
        |                                          ^
  sound/soc/codecs/nau8325.c:389:46: error: variable 'n2_max' set but not used [-Werror,-Wunused-but-set-variable]
    389 |         int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
        |                                                     ^

So then we remove these variables:

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index e060a8950940..86725912a014 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -386,7 +386,7 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 				 const struct nau8325_srate_attr **srate_table,
 				 int *n1_sel, int *mult_sel, int *n2_sel)
 {
-	int i, j, mclk, mclk_max, ratio, ratio_sel, n2_max;
+	int i, j, mclk, mclk_max, ratio;
 
 	if (!nau8325->mclk || !nau8325->fs)
 		goto proc_err;
@@ -418,10 +418,8 @@ static int nau8325_clksrc_choose(struct nau8325 *nau8325,
 			if (ratio != NAU8325_MCLK_FS_RATIO_NUM &&
 			    (mclk_max < mclk || i > *n1_sel)) {
 				mclk_max = mclk;
-				n2_max = *n2_sel;
 				*n1_sel = i;
 				*mult_sel = j;
-				ratio_sel = ratio;
 				goto proc_done;
 			}
 		}

Then there are no warnings but was it intentional that these variables
were unused? I was hoping the original author would be able to answer
that. At the very least, it seems better to remove the known dead code
than leave it around for the compiler to clean up.

Cheers,
Nathan
