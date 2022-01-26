Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BF29CA
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643204649;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z6Z0P//1Nb/0zii1oKCv3nKwK9MpRH6b2WFxRnLAlcg=;
    b=QIIUVSEaKZp60JLVB1dknIwI+i92LHRTndkIg+f94/VaQSGimmYk7Z74ZGg9/NK6lG
    kq4SvGqKn0FjrOBSDCCe0CpX5TolDhrNTiJlwgzy6qGwn5amaRQdql4GjScLUcgmpBPW
    lnYiyY9LFRRQNK8WGb5zPfMZ3eioPBtM7ZsFm18AsKV2gqz8wmhqKO3yj80Isq8FpDWI
    tIj8e200dg7DKZUGykYbuolwictEl99nlvPbSueOqnqZGwGyGlr3K8H2Mh7CFRL4EQ1y
    DtfsPZYvEMxUBBXK6T9gTF4xJTsPEiMIZpUBn6uw6LcJ2mV9ODo9fGXzOnUTqUGXjhZe
    Q9iQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPaJvScdWrN"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
    by smtp.strato.de (RZmta 47.38.0 DYNA|AUTH)
    with ESMTPSA id v5f65ay0QDi8lSM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Jan 2022 14:44:08 +0100 (CET)
From: Stephan Mueller <smueller@chronox.de>
To: herbert@gondor.apana.org.au, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-crypto@vger.kernel.org, simo@redhat.com, Nicolai Stange <nstange@suse.de>
Subject: Re: [PATCH 1/7] crypto: DRBG - remove internal reseeding operation
Date: Wed, 26 Jan 2022 14:44:08 +0100
Message-ID: <32397848.ByM7UNSnkf@tauon.chronox.de>
In-Reply-To: <202201262050.xFgnR1Kx-lkp@intel.com>
References: <2450379.h6RI2rZIcs@positron.chronox.de> <202201262050.xFgnR1Kx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 26. Januar 2022, 13:15:04 CET schrieb kernel test robot:

Hi,

>    crypto/drbg.c:204:30: warning: unused function 'drbg_sec_strength'
> [-Wunused-function] static inline unsigned short
> drbg_sec_strength(drbg_flag_t flags) ^

It is interesting that Sparse did not complain about this. Anyhow, this 
function is not needed and will be removed.
> 
> >> crypto/drbg.c:1742:2: error: call to __compiletime_assert_223 declared
> >> with 'error' attribute: BUILD_BUG_ON failed: ARRAY_SIZE(drbg_cores) !=
> >> ARRAY_SIZE(drbg_algs)
>            BUILD_BUG_ON(ARRAY_SIZE(drbg_cores) != ARRAY_SIZE(drbg_algs));


Correct, it should be > instead of != :-)

This will be fixed in the new code base

Thanks!

Ciao
Stephan


