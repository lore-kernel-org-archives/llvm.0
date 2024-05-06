Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073015625A
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012869; cv=none; b=b+pwWjszGzJ0jSricmVEzMjWRN5k/hdm38LBJkywnZsWP8GaOa2B17Pa2gD9XJxA2OavoM4Ba09bT1yaAoJJceetBqvAj2Mkvp5ZDgXzWy9QcTtrTVWfqVX2rdezDhYRAfcBNFFn0QzXjG0G7gkg28CSgpZicOW6z9x9ZcniEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012869; c=relaxed/simple;
	bh=BIZlorch0tOfWgLcDNbvKqrhtK4P+bKgxAxpz0AQEf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyFoiu5UsLpXurMzvF/clXBM4GXd74oNcykErIWYeosuCI92A5c1/b2zReQNhy5cWBcR5sxUtSLefzE9mjGWlWrbpubF0gbNQHZTGigQkfbjvEWHzW3U/dcWNC3RGozu/lB5vM/djSxyBbj5CgQTgC6mDsVvt7mutXeCkoKglEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K7X0qZu4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K7X0qZu4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so1309400b3a.2
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715012867; x=1715617667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odqzrPs//hj8WC38Rhd4Ch2SctDBzFte4EXtwtCBz3k=;
        b=K7X0qZu4iUm7coNlfW+sSOriObw5x28dO6jrm/FDJgWIMn2kcrZ+T2nq8MKfCaNU3h
         wEYUR9HpYxCyI17TC6cn+tWzg9sLqSFkq5TldG3ySaiWqqLNKFDnBYacw9U6MQT2m7iz
         CryAX8QREWJJPwwAFqYclvI8sSplUSPbHpLTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715012867; x=1715617667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odqzrPs//hj8WC38Rhd4Ch2SctDBzFte4EXtwtCBz3k=;
        b=SU8GwzcDekkBRr8KVnyGpsNQf0A4KXRlCfBUnt3zJAsuyzomt+RWbinrCMvdisBOn6
         XRm/oXE8TvpNZtsdP7ML4nJD0xUzpZsNZAreiuwMU5VyUDh6lYkAjoEvCcy7czcTUign
         IaVfBMGQ1+nvu8IbeTsFGXG60OI/kCCdtDCv3ATrZLP68jCNXG6XgEQ3mchURukkQJ6/
         hu+S0HDBZh5n3gl9eZzyUAJP7AsC/DuFXlF9fJ0SNEswwfrQbTil+tSgK3/dqvGIFz6A
         AkkoBiyu0HWspRa8geU/D74SB1M5YRTXnFnX9ahsqP656JSvFPB1aYo/sy+9DcfxFnA5
         yk5g==
X-Forwarded-Encrypted: i=1; AJvYcCWcN9D1HzcQeZcOGyLdH1yTkj6039ENFOOO9C8JQMbKWGZXo+zDQdNfy/iAFkmUl8cw69ZeE7HX57y/Vq3dG5nHwsnLKg==
X-Gm-Message-State: AOJu0Yw9qB18ghSIVRC4nLxzzFi7IwKRUWPWBFd/LWjCD7zw4g4RuIBN
	MueJ+EC3aj9yx+jnO9wZTIsDIoFOLGpW498IIyshAiNKSwRL4C2hgFMviEmWDA==
X-Google-Smtp-Source: AGHT+IFx5A8ojwQhkf5tzPyoBV+wXS8DrLII4KW7i+NfXJRNfcIe8ljx+OJPW04VragyCU8v5vFkvw==
X-Received: by 2002:a05:6a00:2342:b0:6f3:ea4b:d1c1 with SMTP id j2-20020a056a00234200b006f3ea4bd1c1mr12045012pfj.1.1715012867078;
        Mon, 06 May 2024 09:27:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ls30-20020a056a00741e00b006f4123491d2sm7951997pfb.108.2024.05.06.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 09:27:46 -0700 (PDT)
Date: Mon, 6 May 2024 09:27:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Sven Eckelmann <sven@narfation.org>,
	Marek Lindner <mareklindner@neomailbox.ch>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <a@unstable.cc>,
	"David S.  Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH v3] batman-adv: Add flex array to struct
 batadv_tvlv_tt_data
Message-ID: <202405060924.4001F77D@keescook>
References: <AS8PR02MB72371F89D188B047410B755E8B192@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <3932737.ElGaqSPkdT@sven-l14>
 <AS8PR02MB723738E5107C240933E4E0F28B1E2@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB723738E5107C240933E4E0F28B1E2@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sat, May 04, 2024 at 07:08:39PM +0200, Erick Archer wrote:
> Hi Sven,
> 
> On Sat, May 04, 2024 at 11:35:38AM +0200, Sven Eckelmann wrote:
> > On Wednesday, 1 May 2024 17:02:42 CEST Erick Archer wrote:
> > > diff --git a/include/uapi/linux/batadv_packet.h b/include/uapi/linux/batadv_packet.h
> > > index 6e25753015df..dfbe30536995 100644
> > > --- a/include/uapi/linux/batadv_packet.h
> > > +++ b/include/uapi/linux/batadv_packet.h
> > [...]
> > > +/**
> > > + * struct batadv_tvlv_tt_data - tt data propagated through the tt tvlv container
> > > + * @flags: translation table flags (see batadv_tt_data_flags)
> > > + * @ttvn: translation table version number
> > > + * @num_vlan: number of announced VLANs. In the TVLV this struct is followed by
> > > + *  one batadv_tvlv_tt_vlan_data object per announced vlan
> > > + * @vlan_data: array of batadv_tvlv_tt_vlan_data objects
> > > + */
> > > +struct batadv_tvlv_tt_data {
> > > +       __u8   flags;
> > > +       __u8   ttvn;
> > > +       __be16 num_vlan;
> > > +       struct batadv_tvlv_tt_vlan_data vlan_data[] __counted_by_be(num_vlan);
> > > +};
> > 
> > Thanks for the updates. But I can't accept this at the moment because 
> > __counted_by_be is used in an uapi header without it being defined
> > include/uapi/linux/stddef.h (and this file is also not included in this 
> > header).
> > 
> > See commit c8248faf3ca2 ("Compiler Attributes: counted_by: Adjust name and 
> > identifier expansion") as an example for the similar __counted_by macro.
> 
> If I understand correctly, the following changes are also needed because
> the annotated struct is defined in a "uapi" header. Sorry if it's a stupid
> question, but I'm new to these topics.
> 
> diff --git a/include/uapi/linux/batadv_packet.h b/include/uapi/linux/batadv_packet.h
> index 6e25753015df..41f39d7661c9 100644
> --- a/include/uapi/linux/batadv_packet.h
> +++ b/include/uapi/linux/batadv_packet.h
> @@ -9,6 +9,7 @@
> 
>  #include <asm/byteorder.h>
>  #include <linux/if_ether.h>
> +#include <linux/stddef.h>
>  #include <linux/types.h>
> 
>  /**
> diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> index 2ec6f35cda32..58154117d9b0 100644
> --- a/include/uapi/linux/stddef.h
> +++ b/include/uapi/linux/stddef.h
> @@ -55,4 +55,12 @@
>  #define __counted_by(m)
>  #endif
> 
> +#ifndef __counted_by_le
> +#define __counted_by_le(m)
> +#endif
> +
> +#ifndef __counted_by_be
> +#define __counted_by_be(m)
> +#endif
> +
>  #endif /* _UAPI_LINUX_STDDEF_H */

Yup, this is needed for UAPI as you have it. Thanks! I should have noticed
the need for this when I reviewed commit ca7e324e8ad3 ("compiler_types:
add Endianness-dependent __counted_by_{le,be}").

> If this is the right path, can these changes be merged into a
> single patch or is it better to add a previous patch to define
> __counted_by{le,be}?

We're almost on top of the merge window, so how about this: send me a
patch for just the UAPI addition, and I'll include it in this coming (next
week expected) merge window. Once -rc2 is out, re-send this batman-adv
patch since then netdev will be merged with -rc2 and the UAPI change
will be there.

-Kees

-- 
Kees Cook
