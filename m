Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793101751;
	b=qo1SwGAshLKrFTO8jgYNJDUU9QMAW05tr5cb8WJksTp3ps5QRS0bcnQX4k+OaWsjkkfQ
	 B9PKsRYuStHnBx1rR+FzxcbqxjuVkQxg8UaKdYXuOpexHeub1avQ+Raj8md3qS3snEeSG
	 V00a3NZFsQ54qQK/UIvgeHBU7PSb9TKLllJoXzjj+zti8oEhs+FQL5M7kU3nX41WxkIAQ
	 whORcOuerxQ3f/18+iGxYa775hijLiZPG2nnGpI30pxY9dSynFFzf0PkNO7jV3LJ01+JJ
	 copsL/GHkGmidIgyT+WTFxgz4ZpvF628ixuFiMU6x2jyopwZKiDWOxXVoO7MRRKN4UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
	b=PEdYs3h6j9YbjOU/GX+P1HX4acvm+EACwENWOy8Da2ojA/TrVZnvQ60Fd+01yDff3dQ1
	 9jGh1MrQsU+quGZSvRU9GgMdDKK6kSEiIb32ahDY1my3DnS/nbocMLPmiyn2D+0K3LJ4o
	 Qyjdtw2Tfhsl7jBWYr8NRTYKkHArdUos8YtstqSFBlafvTFfaWov/vv6coaXoG3LIIurz
	 5vIVHE8lm8dy575zaXdxqRzPyZxkC7ZUENruatuR+hiWR1M4T05A90/2hUaqm2CiBGHdE
	 CNDmMCU6Sdi5NmqhkjMpehKTG9Iea1WSMsrXMj0yAyBRQVqG1Hg8ozDwUcLLe9kux4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJiFZ6Bt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D7606A31D
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 11:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618D7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FJiFZ6Bt
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4f540ebso2001830f8f.3
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 04:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101750; cv=none;
        d=google.com; s=arc-20260327;
        b=g+W2as2il0Pkj0gp5S/absw1ehKfWs6KQtg3I9plkE5WC1sRCbYLdDEvaOdhQQtCXo
         HqrfM7k4/ZSN0xGKxsCLDD/7AAG8IzJOVqKEvJ+onqa9PmVwPBX2UTX3R9lCuh1vTth5
         NwTukhBM4ztiSfmfNNHlVx7NHQb3uCTR+j1aMMR2F9iguZKQMhnaBT7YVh3QbvGeMTlx
         rAUOa4ScbYd2YiuFT0RsYTjnZwPyAs+wZRN307BYZfsqt1GZyq7bgKrKRDRXV37qDa1r
         FH7PAVGJROgMgMd6p5SZsE4biQgdVZhQVHhZSJN+Ltkmsr99nA/51zYFXwsEBeP95llN
         PS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        fh=f2SCLd7Rud4MCBygSiBsz3aqkToNRjew+UwrQPbQmN8=;
        b=XAYoyW8aCnEmcgOuQGu3Dqo2gabz+srmk1E3nargeATTajd46PZuZpX0hsphAz2zhB
         HHWz/qiCjbB36rvqBFz/+9skqSIMyXpFGYnEKXaG3Lt14K6BigrYgouInuvW7IUU6/th
         narvfAEclDvbSsA2co0l8hoE6s3sYezyNrMtZT0qekZCNIanS2EJuYnM4PVmqSaq0bLD
         dVlvqKHrPctbTqsBfM/7D2RBDYouNFJ+DyGkpdWJE8HRQJYbpjGxvtqv1NxwsZKn/PfQ
         bKhXx2OpQrVjG082g3H80OiUf9XB52fLuRFFkbzqJT9FyMEMf5hQQEf/cylKBu+fR7SN
         S7eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793101750; x=1793706550; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        b=FJiFZ6BtdKk5cs/CHer4T8ko0MXIOXfnSxyK+/4LUdUzSrQ97LOR+eQF8JIfbJjJ2C
         nELjX84j711txLRqXw5TwrVosRul6yW8+UW4o8qAQ8+sggx6EJdgdShDfZDshdbvVRu0
         gsXxZneM0Y+FwaQAnn7VGhkDbxx/lb9cWycQ366HgnkcBBqYtt73WpN8Ef2T17W16OBg
         62HD30qhmhTz7eSexBdTUsLbGLH+OaDiqZHlcD16XjiBGP0K7mCYgmn8rt8QZc/DRW5X
         4gxtBd2tMPNMyR02sdVbX2zVAugfxlTw986rs677SoEea6A0wA8kLI9HNP4PgIj6k/Jp
         HbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101750; x=1793706550;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2g9BVPgPIcnwD1/br3vEj5plzxjX60zzyQRO+kbF6w=;
        b=uAEAnGgFnTIW0vEEQeaO3NOe1E0xI41zBwvKYX59XuMvHm5AJrVpPbBYGoAg5gTGgO
         +BvbWytnwgT6D3jHJU0SJ5eUn2m3tcZ52xJyZIyFWZgsq/lbPwbYyVl/BSmRrZ/QK5j1
         3l0lixmsXnQzwZZSAzCSGo8Q/JlrTBzhJFHOz+1Df8U6RQlmmWRzM3z9anmKRWgojjzG
         T/C7PvTg/g7mZit2hs26W5DcYRi4jPOepRKqccrTpruZFsomlPCH8otPyjc5bsB1PQqG
         QgS/QjJp47nW07JvY28pF723SkJJ7iz/Ac8vIHI0f2Pn0aL5F+0Esjht3KsLR0Lx2zks
         Ougw==
X-Forwarded-Encrypted: i=1; AKwUvBz9f08I+lLQk0RS4niNCstxNt9QJjwZyJmgIPmmyZzDIoLbN9HPRglJjBfeNtW84aE6UYeL@lists.linux.dev
X-Gm-Message-State: AFq9FYL+tOawzPdyTI/17GB+G7D7sCWo8xQk3XpsxxnuJH/EFByH5s4l
	ppge2sBr1EeHaF5BNSM6XmF63TDAZDbMXHhOEq53E5tMCG6zjJLk8jn0L1LW8zAvQSuuUnpQLo4
	bGI/57zKhGigtiqacWYoSAgVLvOZGt33vCTUTVb1Y1w==
X-Gm-Gg: AYBFou0k7HBACPzb2U9D+cKX5gajzzpD9uJSqyVdDAAN4+FSEuWi0wU4CwdjmWz5Xvy
	5KeKNAulZXVZzum0DlA003c9QhPEDeWX5LCkpgcK4vM9B6tqnxq1+W9IAekiWtoFVl9efNFoMiD
	rDAM3inK5grCFcfVaGOphcMZKJPZakIEAmaHKaRUgIDpV6FO7PjrD6l4Bng/G8j+1ysL0JTkiBI
	7FBsa0ozCq3eJj4u4iPmuQQk5zWkP0+6mVeItv3pBSxJWnrShxXmjAPqQ0cOA93VtNksoSGZMny
	YPHAyzI/lVvbDhEGXyFcYm4HKHI7g75WLxfVK5aPctUyugPVsS1iHJrqJzqUAhUzVyk06ISkPCZ
	j7NIzeGImk7LGXgtB+G9CeWCDpOYErC8x23daSOJuoZxZvH7vnz1VqzLfH2JW1jbqz5ZMl/6fDa
	yxr1eRiYdpkLz/hCes8WvRq9UiXvp2iur2gNc=
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id
 ffacd0b85a97d-48e3eb859dcmr17962003f8f.16.1793101749776; Tue, 27 Oct 2026
 04:49:09 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <1b0822425d9c76cbf7dc4e5fe9eedf62ac153b56.1793095807.git.wqu@suse.com>
In-Reply-To: <1b0822425d9c76cbf7dc4e5fe9eedf62ac153b56.1793095807.git.wqu@suse.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 27 Oct 2026 12:48:59 +0100
X-Gm-Features: AclHuK9xjjyPxUFOC8E53XVJHVXp005yxnBPTO3OG5ctbKV28EPtiGeGiwnD5TQ
Message-ID: <CAPjX3Fe5+7PTmqx5HNmbQLgsv-DtGhJxgF=u14mZQnTMFN-nCw@mail.gmail.com>
Subject: Re: [PATCH v2] .gitignore: ignore GNUmakefile
To: Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 11:15, Qu Wenruo <wqu@suse.com> wrote:
> I use GNUmakefile to shorten the command of "make".
>
> E.g. for my arm64 worktree, I have a GNUmakefile with:
>
>  export ARCH := arm64
>  export LLVM := 1
>  export PACMAN_PKGBASE := linux-arm64-custom
>  export PACMAN_EXTRAPACKAGES :=
>  export PKGEXT := .pkg.tar
>  MAKEFLAGS += -j12
>  include Makefile
>
> And for my x86_64 worktree, it looks a little simpler:
>
>  export LLVM := 1
>  export PACMAN_PKGBASE := linux-custom
>  export PACMAN_EXTRAPACKAGES :=
>  export PKGEXT := pkg.tar
>  MAKEFLAGS += -j12
>  include Makefile
>
> So at least in my case, GNUmakefile is really a shortcut to specify
> extra environment variables and build flags.
> Thus it should be added to gitignore.
>
> Signed-off-by: Qu Wenruo <wqu@suse.com>

LGTM.

Reviewed-by: Daniel Vacek <neelx@suse.com>

Thanks

> ---
> Changelog:
> v2:
> - Limit the GNUmakefile to the top-level directory
> ---
>  .gitignore | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 9875120ea7bd..6f018294a119 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -194,3 +194,6 @@ sphinx_*/
>
>  # bc language scripts (not LLVM bitcode)
>  !kernel/time/timeconst.bc
> +
> +# GNUmakefile, mostly to export extra env variables or build flags
> +/GNUmakefile
> --
> 2.56.0
>
>
