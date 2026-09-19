Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539C47C0F1
	for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789815904; cv=none; b=HK6tAyiAXWRz3cEoOZEmcgB0IW/ObeNHI6Yjc+AGBqEjZWZAlRyInIIcRyjFl10XhuxHMqJHuLOAIjySS4lxdc6aCkfD3gzymaf7pk9iWEtMO5Fra5uUoGvuVi09Vp0OftK4fmeijA61SeXvn7seS7UpKa8OnFJ4z7UwAS7eA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789815904; c=relaxed/simple;
	bh=gQDfqWyvWhhukz0RZPe3Rxu+FRVDAMr+ZZPy6EzA9hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B2ThiE4zInLscv2LkQFa0ef1+NYjZG7r4Tz+wwEHj7Jj3OP77R4yoy33YsVo4pfZWRh782E5Z0jUQex6atTPF/91z4L6sKNoL0xkbMRIB6JVJPyEPNno6bnyKZcFCRLmNr2mE4oc/+rHN77fCNQifRUlRcUmUYEv6LDFFQFASyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDQihhwK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDQihhwK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so842815f8f.1
        for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789815899; x=1790420699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rwy3osRntuCmj5MLCO/i0SriZXb6Zy0hh2IOAi6LGs=;
        b=jDQihhwKz1FMOxHFz90Ddf55kXD7QrxSMtnQK4dbLJ+MsN7SQxUBgUkTpuA+XXv3j4
         aUlQDk0Az8wX/095+8iNA/OxIevdYvDjX4OfO7IkNIHuCuz1vgHGN402qq46d9rPlbf+
         k9LRqb52rkPkHByzKvFgiH3pP3RsdZfPTlhQp1a/BfmuQfuFhkVV1LMQ9AZ5QCRa4Qer
         RAQ6rfsHRAqE/iAtFeTOxwtNcvSkcl1igAegvUMjT5x7240WUFZBwupCZHsEhdstwgZM
         OFckGQsxhmHyUO3Vzr4mTsumVu3tPi2CEzWgiNFrLWUUFzXHt2GKU2DlUmnk9FE1Uwq7
         TlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789815899; x=1790420699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rwy3osRntuCmj5MLCO/i0SriZXb6Zy0hh2IOAi6LGs=;
        b=1dSMn8TSLsqJZicWyonRfu0GUj7UIqWK6IObrAtU8KTxL1y0MNOxw5VM8X5k5i7JNu
         V+vy/kF3NMUCdv8oiZWGKWuyOj42M9NcUoRjw4xy4vT8xopPRTDJql/NTaruCCumUFFM
         pGqBX37L7eLg99f63eX9cVC8Iesss4NXBS1bxy6oMb3PU5bd6/DO2E/ehBBz5wlRA3yg
         dpGM/TuYHFBapsyeZ1dpdRJHSi6WTd5P5lTGZ4tmjUZJP64SOplvVwj9ppRco4df8c8f
         I8sHtXdW9DTT3aiPIR6Or4N/F5qEcTDzez+CNQSm/nfEJTbQ6SevsAJyuTLZ5k+5NAgM
         Ir8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmmtRpwGEJNhWgSuqgjAMBaAyt4HqMmLy9FZhyVj85okA9gyhdPkgWJR1GUc8Ldv2nGsTT@lists.linux.dev
X-Gm-Message-State: AFuF++nMOymZC1mZeOj6BkFeXEWKzR13MZGhTvJuqNpetEqyUJCsW249
	5ldoTC4oMEiC4E8i6A8RIv8P2mpgQ/UjqTTyZmfEDnZdSTGw3R4aUstD
X-Gm-Gg: AYBFou2h5EYRuwVBPVeRJM4UtUvvO3Uf62Z/ajoSHdF+apzVEtE0syK0FLF8j/Vgi0O
	QNvHYJXa7ZIWpZHChnTw/T0oLAnP+x5IEXXjbde0YtbBTvlabVBifYfEL9u61U91GbpQocLgx/9
	HkuVjcTj+bAiRI6H6cHwxAchy4ubF7QT4spZkZYOFWvFFAJ96cFaYfjwBQ1Qn4bSmGRVd9JActD
	RAiZyFpBKG9h+qUm2yNU6hpmjutOJi7BbnaiScRMsLooid8uS6zaGh38WTsA6rKojfJqKZO91qs
	vzh0/VO8fqgoGoimwMsUVLDhpFGml7UBuIzuz19heJZXzoS7JmpMAbh7wvy3LccSwxw6mZOyenC
	2zjjOvfxCL7/Y29PUNu+9jgDXSBorVjLDbJpCu7glQ35uT6nM1x7ShX8lBgse9wvguVMEuMaw2z
	S3I1d4ufDeUXwLLKXjrP5PLtuBYEbOr1A+rPq515e9cK3p95CkS7WXUd+a3eA14la13yg7YmDV1
	A8loNQOK/WX2WRpHoaff2C7vNYXFnk/Y+4k
X-Received: by 2002:a5d:5d02:0:b0:485:8ee5:5ffa with SMTP id ffacd0b85a97d-4871e36b1c7mr7900927f8f.38.1789815898629;
        Sat, 19 Sep 2026 04:04:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460767sm6267511f8f.13.2026.09.19.04.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:04:58 -0700 (PDT)
Date: Sat, 19 Sep 2026 12:04:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/5] slab: handle ERR_PTR values in kfree and
 hardened usercopy
Message-ID: <20260919120456.5575e0a4@pumpkin>
In-Reply-To: <20260903203720.63689-4-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
	<20260903203720.63689-4-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 22:37:18 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> Passing an ERR_PTR to kfree() currently reaches virt_to_page() and may
> fault. Warn and return instead, leaving the bad caller visible without
> using the pointer as allocator metadata.
> 
> Also reject ERR_PTR values in hardened usercopy. Keep both checks
> separate from ZERO_OR_NULL_PTR(), whose exact matching is required by
> krealloc().
> 
> Link: https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com
> Link: https://lore.kernel.org/r/202608111716.0FA9DB17@keescook
> Link: https://github.com/KSPP/linux/issues/93
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  mm/slub.c     | 3 +++
>  mm/usercopy.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index f9b56cb439e7..027b44dd7f07 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6780,6 +6780,9 @@ void kfree(const void *object)
>  	if (unlikely(ZERO_OR_NULL_PTR(object)))
>  		return;
>  
> +	if (WARN_ON(IS_ERR(object)))
> +		return;
> +

Since kfree isn't usually called with NULL it is likely to be better to
have a initial single check for all the error cases.
Something like:
	if (unlikely((unsigned long)object + MAX_ERRNO <= MAX_ERRNO + ZERO_SIZE_PTR) {
		WARN_ON(!ZERO_OR_NULL_PTR(object))
		return;
	}

Although is would save a lot of code elsewhere if kfree(-errno) were valid.

David

>  	page = virt_to_page(object);
>  	slab = page_slab(page);
>  	if (!slab) {
> diff --git a/mm/usercopy.c b/mm/usercopy.c
> index 5de7a518b1b1..c8d8703544c6 100644
> --- a/mm/usercopy.c
> +++ b/mm/usercopy.c
> @@ -157,6 +157,9 @@ static inline void check_bogus_address(const unsigned long ptr, unsigned long n,
>  	/* Reject if NULL or ZERO-allocation. */
>  	if (ZERO_OR_NULL_PTR(ptr))
>  		usercopy_abort("null address", NULL, to_user, ptr, n);
> +
> +	if (IS_ERR_VALUE(ptr))
> +		usercopy_abort("ERR_PTR", NULL, to_user, ptr, n);
>  }
>  
>  static inline void check_heap_object(const void *ptr, unsigned long n,

