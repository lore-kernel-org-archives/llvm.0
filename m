Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B5414DFA
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140275; cv=none; b=ICHtCZ6SeP6owVV+s4VNWV+R+ocUWT7jUgkATDePh3v63HbTmXj45+A6a8vuSeCZ8ooWZ1uhFuIsnlni3oFk6ks5qAJRJ2vnhsZF03V95oihI7cBNjZE1SfduzmdeZIos7uqgUydD+C2wZHUmWVZDJHjzD3h3+s+zblyPWl9dNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140275; c=relaxed/simple;
	bh=sylCtSF2MlCfq1b39cak/n9U1b8c8EdsoicVmdhuVhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKvxksCG8TsUJ95UmkHN7s5by40+k3gMeKflQrqPlzEdJ/Sh1mjzhGXZaZYM9Oub/KeQOx4FUWizd1GqeZG8dBFQAwaRqVQT4UXmqXoSqvyUPp1DSvM8/kTbewNUqTsjPczP5Cn+Ha5VVzl0UQbopGKuGFxoCVwMfiBLxcnfo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com; spf=pass smtp.mailfrom=morsemicro.com; dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b=nnPDRNC/; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20251104.gappssmtp.com header.i=@morsemicro-com.20251104.gappssmtp.com header.b="nnPDRNC/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so338558b3a.0
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 22:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20251104.gappssmtp.com; s=20251104; t=1790140274; x=1790745074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JoQb5pHgIxz8ZF+3NPp5p/PXUFzw+s+TYUg7wlblHUk=;
        b=nnPDRNC/l4CPKZZQNcbd2s7cHtP9r1VOZpHBzBuQJafjYZR6X6nrmPbg5f/l4x9xhC
         kf4zFIdJCjO5B9/155qaRexAV7B9AIJYBpAfXCQHIOEkFFOdtiEeOuSco9IMZPe/Wouo
         cJuU+/GXa9CTLhWWgd4SS9+CKV1lp71tmlm2fqdmwqcSfzGLBbdd4b1zSQCULVak9VEh
         Ft//pKXwF+M93UHR/cVxTNogMPGNW1DgClF0aw6hBNORFhAWbGIbhE5YFyU4aRR6Sn91
         5+q3R3Z/U9hPGuZv+IALYE+n8+iRimaRYRnXVvVd6eKjfn/T7w92B3ARWCX+sVEpShT/
         6I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790140274; x=1790745074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoQb5pHgIxz8ZF+3NPp5p/PXUFzw+s+TYUg7wlblHUk=;
        b=CZ9ffqkOPRKL2YXGBG/DKWWf7NX3hFU3Btz0uEqJ/9Mv0avpxlmdTLKGs4YkBCRXEw
         vCJ8Jmpxc/GwhFm77urLTZvum10xpkw+5n8UacEX82y3mDX95VADAN1d03mbUDwDWBF8
         DwPWh/uGYZYFTTkHoczseMuZ/HoPb8VbKBLXtWcHNg+zNpUSaKRLYu6J0ecrGjel+s42
         8lzaUPDTeLwbxPb/N9ZFFymseiQ9XR7ML3wy23qgNLGV+WyLcC6MRZtUYi+QSoW77x0/
         tK7ryxGpRsWCqOVI0HqJjKzmEuTVnsCfguQnqbj5bvRefaQUDqJYocepPyRJntrZdrXq
         wHvg==
X-Forwarded-Encrypted: i=1; AKwUvBw/RrcKem15oy+INzV6s53wIuofd47VfW9kaoJQzTf4Cu2OdAeeyMMFmos38c8VssaDWeHd@lists.linux.dev
X-Gm-Message-State: AFuF++nCnY4W1jsvDFCR53FhMlmZAz6foB5M6baS+9E5gd7p7OWv5DZg
	rmu9nlU/TNR2iBLSb20tSoLMLb8ag4uT4tWGBof/8oERnH+H/K/xljwUcIyB69dt9P4=
X-Gm-Gg: AYBFou2uVsOJ+l6v+OewVCy7yupC454Gx09hBJpt1lSZ1in+jmWVy1+xHTPh2/Zx8Qg
	g2vvVqHRduqqmyUKtUHIhMkMXm8us5egAvkEVIh/2DxEfBNsrEx9CsMbkPZyA8CyKx7tVU6FoDP
	SaTZuj60fag+dCYzMfyecl/f7VuK0OMG7H/prJeO0voC0l4xEO395tDYQouf4xpHc3gdtkSncMk
	q8pQwqmbASaxVy3UDqxt8r1lzgujqWE/LvgdBkI4CmBWWKZ7MFUoi2Sc5ctxk6i7xmARczShX1D
	dmLdLYvul+8iYkGRAW1GnI/DKmIr957LdccvlUajbg1xGoXcC52VuDhM6jS4GLC8XPlKYtJ6jib
	PD7+Bf564eXCLH7PYoQ4bwWTwQZmky1LyUmNVTQ2Mw6kylw5zr8ymVfvAAhXHJ0VKe8UNLKe45j
	tmWBUtwFUm4wBRl2pWLVL24BN4yKTHLHqJfZSgdIs/vAG3gBak7PglQd472dn+mHnTZlxRXiXSH
	eMabmXK28ETGNvqrn0tPA/Ad+GQMU5x379FLgNhjua3hLgw/jpznxieFzp96LsyZ01HizI=
X-Received: by 2002:a05:6a00:761a:b0:87d:3894:197d with SMTP id d2e1a72fcca58-87d3894223amr1197529b3a.40.1790140273603;
        Tue, 22 Sep 2026 22:11:13 -0700 (PDT)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfc0a05sm693810b3a.10.2026.09.22.22.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:11:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:11:10 +1000
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Bryam Vargas <hexlabsecurity@proton.me>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, codemender-patching+linux@google.com, johannes@sipsolutions.net, 
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ieee80211: annotate struct s1g_tim_enc_block with
 __counted_by_ptr
Message-ID: <lia5ezt3tyf6vcpe742sel3vz4w2fuxva25uxgnztc7rkftk56@4qrkx22hmx5v>
References: <20260923045233.2579591-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923045233.2579591-1-morbo@google.com>

+CC Johannes

On Wed, Sep 23, 2026 at 04:52:33AM +0000, Bill Wendling wrote:
> The GCC and Clang compilers support the "__counted_by_ptr" attribute on
> pointer fields to associate them with an element count in the same
> struct. This enables KASAN and UBSan bounds checking to detect
> out-of-bounds accesses to the pointer.
> 
> In "include/linux/ieee80211-s1g.h", "struct s1g_tim_enc_block" has a
> pointer member "ptr" of type "const u8 *" whose size is described by the
> "len" member, which is correctly populated with the size of the buffer
> before any pointer dereferences.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  include/linux/ieee80211-s1g.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/ieee80211-s1g.h b/include/linux/ieee80211-s1g.h
> index 3f9626ad3d97..8f6107782c38 100644
> --- a/include/linux/ieee80211-s1g.h
> +++ b/include/linux/ieee80211-s1g.h
> @@ -349,7 +349,7 @@ struct s1g_tim_aid {
>  struct s1g_tim_enc_block {
>  	u8 enc_mode;
>  	bool inverse;
> -	const u8 *ptr;
> +	const u8 *ptr __counted_by_ptr(len);
>  	u8 len;

Sure

Reviewed-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
