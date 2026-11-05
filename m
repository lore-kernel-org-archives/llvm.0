Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901808;
	b=lQxUEFfIPZ770wdX8DX2AzIDPTBqzO1ja51069ex3esYknebPQpiPU9MCDhBxKAYi2wA
	 scgnC92vBnlY3RW8KqWhRAAro0xdqloPfdNvN1WCteKPz8eqJ58gyURYgWwH3XUhn4mrT
	 yh1yoWivHwom6TtZk+1AfoBgFTrAnXDQeoUnj9/D+dYKPpDXF8xkgIfEwTbGcNnNd88uC
	 0nvKDZ5tiXTj7s2lM/xYZpR1BesmDN2B8Wp0kUlC0lZn4KeN+IB8Hny/Lngk0FcnvXrPo
	 VWQ3gyX5YMDk4cG0Rs859Eg2QJR9mW4OO/G10MWHRwAKVnVYBd3xUL3MyCZXXdTSmPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
	b=OG0SUyca19PeLmY3GWOg+178jKOpmbsjOhaE1s77dad0ESZ/F9+k+TjIJvkufwxR3Oqg
	 n7K2L/3XPcTfJomdAIagWPGU9cPEpoTgpUu7PG3RAaBNv8uGQd5KTjgjpPIRt/NV4cfUX
	 CVPKFvmvlT6dKT+WoIQbPhQI5QhGBUCEcGuoWmiMCrbS0CZOH6AOGonuGdKryuTgeD0mD
	 /zK1xGdYAspwpIKfoJY1zwzrv40Bw804UlWG6ezrbyqYrxzI+OaMUOI8JavRUl7aXx+vZ
	 cD15uaE/w6lS+nLItG4vdNd8s1GHL8XSD3H8U2gGcBiwZ8YeRaeEMZuws/jnNN9jZQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWj8RGS0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666C606A329
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7666C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWj8RGS0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so18943475e9.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 10:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793901806; cv=none;
        d=google.com; s=arc-20260327;
        b=DzKqFIBUFXx1tjkKgjfSy5n1XTjmvZHwOkRXWFbslj+ayh7HkWmk+PCTX3XBpeDY0P
         RelYOec696FICtlc6kdtKstYCWBT61wE7tsDlolFlkFNP2wa+omm9UzpIMr/zk+uSLQX
         NJpvmloYZNDIUdkMgLe7dR5teBaVH5IOsTZL0CtXdx4fMvjn9S9zl9EdpFmmhR9mvfTE
         gtG93qrA65gMn6wUojMXVJJTYKsgFRM+ptBjol5Qm5Q/mAN+dY8qOJFh1kDPoC80uVJC
         CHCGbruA+v9HtBHgJJ4iwGiBmiaxn9vwjuYJZIUAwf+iD3XkaGtpYhB66KaFUz3XQNpQ
         41Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        fh=SnzXhCj/5TuXhvFRim3zyjt2pBJyMN/C13SJAiJXHRI=;
        b=Qc0q/jwQ7iXwHvC2ZUqyClbabUWIao8zlcHhpzB3vEbNWT/diHG+wxml7g56Pk6P2A
         c+xZFg6jWWDexMQQ9UcCbr9PxMsNXcZt3AS9+1EE3z40u9RrJ5pEQ02+RCbo3MSPj/D7
         1sy+qACkY92SV/NoOlgb6FnSCfhV/tIXa4B3nM719DZmLhcskVmhjAz17OZ/aFjiPQHF
         UjoCkbT+2RhzbC44kDanvnE8ySFiq4vGWPaDmZvuOrFY/BZHZe4G/VtS+iQJ6Krf5oDv
         OpnLkGR0UyoBHKauqzKaF2Z9Ou886MnCDB3Bi/QC1n1UTHz8evqyEPcVYWLdePHpZxGE
         bjkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793901806; x=1794506606; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=hWj8RGS0f5JpFvHB+HtSBuXqgdquqWfUKufA5VMmz07ujl/U+QoHOErnQfX/kvNKv0
         ixp0ykjJt5Zq5I4FCCU5sNSYF4TfTzJUiRLjOJDsRAOSgECoCZ+t/0TDzGWinKEhp73O
         plt5vadPdFAKD+mOoNPSkjzTGFOUE3pp5R2sq5uoZIwoZdMtHN7FsH0tIw466AxoHcVS
         UmDscny4+tEVkrGq2YukUVfxOPFROeWEpnzgoTVpEI7pVxEYV8pPuhOSQnZBMvAtm/fb
         jhIzBwEVqb2nhv3irVCntTllWJXyt7aqMrdEhWDdImqGcmmEhjFEIRhUSR3Gkgwk/V7l
         N08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901806; x=1794506606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=JRtOj+n0Rg4aMDeP7OfBJyzuskt8ESKLSEFBlNjBx4RwJlEb1u3Wp2Xe0R1PZtvS1t
         mLsaezQJ45fOXqkdioax/zZMCO79EtV1oGdnITwQ8O+d97GYdz44/NcCezVK1WBOC79M
         MIDROG5Pw4m0pIDWwfjpxCR5dfa9ExOGqUUF1woB2AjTyYmfIBvVmp3aiOoe8RWcEk7a
         XqJOQdZV81ZD0bS2Kx3WaLDlMXJp+eXvBvle7AXfUM6+R3zf+jJJMfuuURVyBT9+DwrK
         xaFbgw6vDYiGWxChnf6U0gmyLRq+Z4EnFxHm+nghP5ssnfGMdTwiYPRJBK4/M8ESjcYr
         9iCw==
X-Forwarded-Encrypted: i=1; AKwUvBz8hVPthr8yEiWMBJCWWjH0QFUvL6QGTZHj7eOKAsb9ot7BlgfSVvH77Yk00JfiliRwYiLs@lists.linux.dev
X-Gm-Message-State: APuU4Z8qpwt23MQWUEQGBKHrciwXgq5/84FcaS8QwzbKW0uQXcSBH7Hk
	z5zSwPR0FtzB0g0v2FE82lZVwQCtavz42usT5czj4PQ08KZfTFQCx7sHOOo4xh6/P6NDZEGYXu7
	r8HynX0rMDmuy+3OCknP+WnZd6SLtqL+vd3+NbXk0
X-Gm-Gg: AYBFou127mDJMpidfew3Sx97NXpeBz++N0jqjUoXOWiWoi1B/Twn1Yldrw0NupdmWwu
	u55X9pd11hxUc15kob7zmYcNqfO6M3WLihUmfeKDsKhc1JmbdMc+9l2zLZ+qPLuiMm4fugPX5L2
	jcal7jSXBE7B1Emmk+d2mkXM91dF77Ev90IFV/g1yGIi2qKkSonWYlQTYkz3XhUahKisl49rw5o
	IphwAAFrcw/90/XqBMOMEdSpzhhAyAB3KhyySzpparZT6mhl+qcjsLAz9J06FiC1GGXUH4lOJvZ
	8L6Qz22fbgh5bbXwn3dc2a1XKqaX55kDQZPdq43P6soYhBBho1HfdTF9Vu+yrtHiv0OL/f/JOAh
	K4ew6mVNrQdA5w4eLGCbMwbgscEWNLqKvbvdt2+yTMDdCEC+JVs45JnDsynHlyq9cZyy2MCMlce
	kR5wMxjGnCJESIiAndH6FWmxkC//XT8wxTFOF0PullXheYHnitJCwB37nwfWO2ji+9W90puPQje
	HSrcpWxw1AeYujx0iUtQQFSiWbMwzPTJ9jTRmdiXBXM0UU/p7o0eG82sA==
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id
 5b1f17b1804b1-4ac181e759dmr461771285e9.31.1793901804993; Thu, 05 Nov 2026
 10:03:24 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105175748.3057520-1-vineet.gupta@linux.dev>
In-Reply-To: <20261105175748.3057520-1-vineet.gupta@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 10:03:13 -0800
X-Gm-Features: AclHuK8C3o2kc44T55unuXB9fXbsGmvBzidv-Ub4iWxmKhGyxfDi4rGo075tswQ
Message-ID: <CAKwvOd=J8bYO6kzFO=mOfWi0NiHq9Y7u6JwV2WfZiS0VOoMpYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to W=2
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:58=E2=80=AFAM Vineet Gupta <vineet.gupta@linux.dev=
> wrote:
>
> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
> of && or || folds to a constant other than 0 or 1. Unlike clang's version=
,
> it also checks constant left operands and operators that come from a
> macro expansion. With CONFIG_WERROR=3Dy, an x86 defconfig build fails in
> prepare0:
>
>   arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' wit=
h constant operand '4194304' [-Werror=3Dconstant-logical-operand]
>
> The warning is meant to catch && written for &. Kernel history has no
> such catch. Of the 13 earlier kernel fixes for clang's version, only
> commit dd7fe5d9fd6a ("rtc: max31335: Fix comparison in
> max31335_volatile_reg()") fixed a bug that the warning found. Commit
> 394b52462020 ("drm/i915/gem: fix bitwise and logical AND mixup") fixed a
> & written for &&, which the warning cannot see. The other fixes rewrote
> correct code. In GCC's own tree, the warning found two sites since it
> was added, and both were false positives.
>
> Disable the warning for GCC unless W=3D2 is given. Keep clang's version,
> which skips macros and constant left operands.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Link: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@l=
inux.dev/
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v1 -> v2:
>  - Replace the four per-site fixes with this one change (Borislav, Peter)
>  - Link to v1: https://lore.kernel.org/all/20261104160722.1637541-1-vinee=
t.gupta@linux.dev/
>
>  scripts/Kconfig.toolchain | 3 +++
>  scripts/Makefile.warn     | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..1d68075f0469 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -233,6 +233,9 @@ config CC_OPT_WNO_FORMAT_OVERFLOW
>  config CC_OPT_WNO_STRINGOP_TRUNCATION
>         def_string "$(cc-option-str,-Wno-stringop-truncation)"
>
> +config CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND
> +       def_string "$(cc-option-str,-Wno-constant-logical-operand)"
> +
>  config CC_HAS_COUNTED_BY
>         bool
>         # clang needs to be at least 20.1.0 to avoid potential crashes
> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
> index 556fa249ca07..03b677bdbb0a 100644
> --- a/scripts/Makefile.warn
> +++ b/scripts/Makefile.warn
> @@ -167,6 +167,7 @@ endif
>
>  ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS +=3D -Wno-maybe-uninitialized
> +KBUILD_CFLAGS +=3D $(CONFIG_CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND)
>  endif
>
>  endif
> --
> 2.53.0-Meta
>


--=20
Thanks,
~Nick Desaulniers
