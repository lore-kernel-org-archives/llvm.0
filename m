Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35C3F23A6
	for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808875; cv=none; b=K9bGIWcNq4UZQDQUNaE+i57Ivjm95Q/ahzkv5z3Z5GZdzX2rUqlTQNZtKQ7k8u7TDBxZ7ff0RffFZYVpkvmMN0R742fDsBztshebTJ4+Zd5sNoeAgJr4wcIQlitgkK9N+W6nNTC+E3FaSErXLEoCCkwTFSbDUWOBfGxNopBPpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808875; c=relaxed/simple;
	bh=EWOHrvtfAdH8SUMdIJx2yEBFvBc3QNtqqxzu2fF0hD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVhAVd3MPy/mOc4+qN5nGiDJgazTjY+zd5J8KY+eUnTTaPYzHWaCF0YscueXe0R6xH5ErqLJrIn6NabG/zFn3FelQ7+83q25xuVzHcnvGbe0B05l9GpORPki+prhHHBUdfcCmRk/REHJYY6Sqz47mn3Akk2zrnRqLcqYXXv+mjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3UDvyo0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3UDvyo0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso15849755e9.1
        for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808872; x=1790413672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbapgDXr+FyoTKQ50JUeVgfa7Tqe0pMogS4ct7fFvKE=;
        b=f3UDvyo0U8hsmA3NZMqEQ7pH28iMGJoCrTo22N3A+7RNjEsoR6d8TbQ3IeX7MbJM+7
         CZsVKUXfTvX6Udsf+E6eB/4R6KVPncoU95GqN+LX2LF6TsPPp+58KdA4sPZv8ff7M1Z4
         W9woEUMEYCogQbuPCzmkebEXJlEyDuc1HFQc81XHYb2XPk2tVNemzXEn55mhyGS2rQGg
         ZpdSQOlcBSQpkCCEJ+Fw9xj+WJvcLZB8Lu7/c8uULJyE3ia/S+/q+w6RxWU7zArh9ma/
         RFh1SmSrkjEFWyxmKBM+kQaXkVK1TY+QC+vbJ8ZoOsXp3S85rXwXvg2sFW/TqE/XJOxC
         IY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808872; x=1790413672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbapgDXr+FyoTKQ50JUeVgfa7Tqe0pMogS4ct7fFvKE=;
        b=q22wXSZ4Jnw8ssXDY24fpqVORWuYlY1YW3bl5rhW0KIbA9dSm8roGguB7+rI3pFy2g
         EW7x/wCVkKNvegRkzvkiLksOc40p0CtFZDTjYDt9RJYDDIE8iHyaDf+t7iMsVmwFLCcq
         5OUhMlCUveG05EVbAwSch3gzzsZLgPmBo2G8PQHfIdn4jYTwncOLHioL4Gc1rJEE3N80
         Bc7ZBL1ZVfuSC20ewCtULTIGhLOxMBgZyoDoudLlHmjOLrIzWa4sXekrjE0LaPhmXBhX
         ZugHuCQVRhbxKNK1LDoZnq/v+uMjO9a6vVyu096eoOpmfWarNCq8inlaXJkT/KMv4waN
         fikA==
X-Forwarded-Encrypted: i=1; AKwUvBynrXYGkwDPEYRyGs4kfyl65xldHqAt1dCUsUT5iNsZAsog1wSAX2Alj8otlxOOK2O3KknK@lists.linux.dev
X-Gm-Message-State: AFuF++l6AQWKqUyQ4LNmMJeC1TYRaiFty8YubwkBmdjOh8gxMSmWDB3k
	bMv3cLc2XEoZJPEb1ugcXgbwcXnqgc9WSd+KmenqO/5HR/xynuY3Lwos
X-Gm-Gg: AYBFou3xbZ58OYBNC5av+ML2riokHBf57pS9txCEBj8pqFCqrCRz3cYjCHlfGlmaNS4
	BB73GyrtPq3PP96fgHr7P/T30gCvqr0uaGvXsbXbkutxub6eG5QuF7XxI21M+mn96NWc+Iv6rrs
	jr5e6JSPa0UrgiaWzjmteB1KEkPsFBgXBs47n/SvIcbZSjZPBOwtA5/dwP/S5KKZ1X763HWtmhZ
	nu6dGoHFLtg3/WBrfRD40NK1XihuTFzGzGSL3hnG0wQ1vwD5NPnV1F1p3MTqhAejSyA0+y+l3Bz
	qOmMqeRwGl9bsCCBiduK9j8VJjN/WrSJXj/bA1hacsW+y+XPOumR/nYfMFRrzFc5wOIc2mojrlX
	qR/2J+dT5iJF/Y6TFi8vDCTz7f72NIY7yNuZgqYfoJWqkCPIdS1evUaY14FdEeDjZnJmgrsjXBY
	R++7oXUPxvRQ3y0A310HdxW883AoFEqaorCaGntX1xQncd3QZZ/dxW/2qpzUVW8lL5ygqoUzPfZ
	Vlj0X7XU6f1F43QCjGKD0J9zEDMf7WFw3DQ8mn74pQpj8KRoM5GztEajjWZlS7wtruXHSbK5/Ls
	dMB2FeYcWOY7nrkf9tTmGv4z5XECrakvZTURQBNiHY3mRE+2biYwrwg+nlalhVBMglMUv8kTLMu
	71eY=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr70121265e9.29.1789808871519;
        Sat, 19 Sep 2026 02:07:51 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cba562sm86917495e9.2.2026.09.19.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:07:48 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/5] slab: ZERO_SIZE_PTR alignment and ERR_PTR
 hardening
Message-ID: <aq5QkQQkyaljq0R9@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
 <apqmVDiyGJWnEnp8@nixos>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apqmVDiyGJWnEnp8@nixos>

On Fri, Sep 04, 2026 at 12:25:59PM +0100, Harry Yoo wrote:
> I don't understand why v3 of this patchset suddenly implements
> hardening for kfree() and usercopy to handle ERR_PTR().
> 
> The address range for 'zero or NULL PTR' range and ERR_PTR() do not
> overlap. The bugfixes and hardening patches are irrelevant.
> It should be a separate series?
> 
> Also usercopy.c changes go through the hardening tree, slub.c and
> slub_kunit.c changes go through the slab tree, and LKDTM has its own
> tree. Patch 3 and 5 touch files across multiple trees, which can be
> avoided.
> 

I added the ERR_PTR changes after Kees raised handling that range in the
v2 review [1]. The two topics also came up together in the 2014 [2] and
2019 [3] discussions; in the latter, Jann suggested a separate
warning-and-return check [4]. I wanted to broaden the discussion and see
whether considering both together might suggest a better approach.

I agree that the resulting implementations are independent. I'll send
v4 with the ZERO_SIZE_PTR alignment, exact-match and zero-size KUnit
patches only, and pursue the ERR_PTR work separately. I'll split that
work along the SLUB, usercopy and LKDTM boundaries you pointed out.

[1] https://lore.kernel.org/r/202608111716.0FA9DB17@keescook/
[2] https://lore.kernel.org/r/87oaumdz1f.fsf@rasmusvillemoes.dk/
[3] https://lore.kernel.org/r/20191010103151.7708-1-mayhs11saini@gmail.com/
[4] https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com/

Thanks,
Karl

