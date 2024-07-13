Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D54C7D
	for <llvm@lists.linux.dev>; Sat, 13 Jul 2024 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720829969; cv=none; b=iaqjPbM9ZzJ3y+pQjl45y26TLH4HgXyupA1O5clTYbS5kWE4GUDKUcKNveNv17JBjolYtWgpM29u0YWUetSExqhtSAl4DvuHO3l9KcbQF/S/fg95zG1BO/NeJ7HNn3HsSe8c3ylXSdtyiCbdH+FDkZkjEQTzb048phHtltKOnMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720829969; c=relaxed/simple;
	bh=vLk9e6f6ZIdLgxWwuGIJRVBysmnMnaoOmXt9U6jRDOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw+zNPTiFLMoIvDvxw+7ibxihCaFpo0/FAlhtHP1etvXM0f4GYKpl6iKS+KHcDEKXwz7eXPKJaWavE8BMZ75PzhkUgo+bfdGNf+QedCev5qe1J9A8Wn4FzAOEF6qdSZjqIVyrhkh9l36rJuAXxqdtQgBnLBS1lNAr1s9LZJWxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2/zgb3J; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2/zgb3J"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b42250526so2071034b3a.1
        for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 17:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720829967; x=1721434767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+BjHHa++K3M8o/jlc41ALJl1/CW2inFabQbWOCaWdc=;
        b=k2/zgb3J7oWTVOjBZTa6uqqE7H9u371rTH/vSuieqFdJ3eKql87AHxYK4xrFlp5VgV
         QqEI67W8H8w90vf/CFZISk1aV7QLc0UlFgkxo87EW3TxANlj9VG2bDkgTJpYoSxND5xl
         /zDbwS7GKVb9whc2gO5HqBC29J7PGaW7GwFUvpuRrU6ynKzlbj17NU4ZFnNN1FLsav70
         DEkZgRAMbii7T+BimkS7wyBt9aTOfxk7v1dxdS6rL/Uw6MN6Y16P92ZmBo/pb1VDDLWD
         cSTPkJvggL/6xpwU0jF0ddJgz1i0GS1nt8389MSxAP/mpsa5iZ6D8s7Vme/sP2v4L3MW
         UPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720829967; x=1721434767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+BjHHa++K3M8o/jlc41ALJl1/CW2inFabQbWOCaWdc=;
        b=wpjVnMlYW5LYAMvruyLP5PJOCqnNYbgHmOiPHnr4A2EI4hHs+1Wou4GE48IGQCO6gi
         7dkjmz49hgbEj03I9QPyaggrKpEh+gEDLYkCyhvmJOrlxjAu3u43NnQsBTBgK1+9OTdu
         wskUy0heA2/gnmD0kO/wC63IOy+oV/S9bismIA6bEn5MhyIKJWxqV8b0OTaInqome1Qc
         xL4yn+OGg4MsxOTUQQEVsVnetR+C9hbVYsCo+Ay7MK3oxzeCJrNH2MiXZf5HCUnGisH/
         CorZsLyAl5iRp3fbFB81pyFvAkHojXlOjhbPLpnDcwNp1ob2RJNuxZ3vwUg5PIExNu+b
         1zLw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7lC2/e7TqkaCncuxF+9hPNdjXWisdn4yHpRy/+S2WfgZl6j7WtetkXcgDdOgE6cHpw+tD8I1xec7mYb1qFjkgmZf0A==
X-Gm-Message-State: AOJu0YxEDpqFLyqFZN43kJnxj98Jku5bV64ux8jKzg0jHPctpg20NEsv
	6iBM9yLINQv6Zh3ddty6QZ8VVHwrYPNL7SdTF6ND/QRxEREgBrEi
X-Google-Smtp-Source: AGHT+IGtU9FFfbvKDOtrT4DOn+QwTdztE3gXGyiQe7TNdTWb0IhA/vkZNYxvhzL3u5D4LDqMeSPNeQ==
X-Received: by 2002:a05:6a00:c95:b0:70b:5b21:6c2 with SMTP id d2e1a72fcca58-70b5b210967mr8844104b3a.31.1720829966681;
        Fri, 12 Jul 2024 17:19:26 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ea794b7sm137312b3a.0.2024.07.12.17.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 17:19:26 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:19:23 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] bitmap: Switch from inline to __always_inline
Message-ID: <ZpHIC0gWwkbKGk5H@yury-ThinkPad>
References: <20240711163732.1837271-1-briannorris@chromium.org>
 <ZpFhv5VSYZ6jnsd4@yury-ThinkPad>
 <ZpGVLl7NQZScd8aH@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpGVLl7NQZScd8aH@google.com>

> > I like it more, when it's split onto several patches. We already have
> > my bitmap.h rework and your cpumask.h one with their own reasonable
> > motivations. Can you keep that patch structure please? Then, we can add
> 
> I'm not quite sure what you mean. I imitated the patch structure of your
> patch 1 that I linked, which had the following file-diff list:
> 
>  include/linux/bitmap.h   |  46 ++++++-------
>  include/linux/cpumask.h  | 144 +++++++++++++++++++--------------------
>  include/linux/find.h     |  40 +++++------
>  include/linux/nodemask.h |  86 +++++++++++------------
> 
> Are you suggesting I should split that into 2 (one for cpumask and one
> for the rest)?

I think the best way would be make a separate patch for each file:

1. find.h - because all others include it for find_bit() functions.
2. bitmap.h - pick my existing patch.
3. cpumasks.h - pick your existing patch.
4. nodemask.h - just the last piece.
 
> > separate patches for find.h and nodemask.h. If rebasing the old bitmap.h
> > patch isn't clean and takes some effort, feel free to add your
> > co-developed-by.
> 
> I don't really care who gets authorship, but I did manually rewrite it,

I do care about authorship. Not for vanity reasons, but because author
is the first person to blame in case there's a reason to blame.

> since there were enough conflicts, and it's basically scriptable. Feel
> free to suggest which Author/S-o-b/Co-developed combo makes sense for
> that, and I can adopt it in v3 :)

Can you keep my authorship and commit message for bitmap.h please, and
make sure that all the functions are __always_inline now? If you have
to re-write it, Co-developed-by is a proper tag.

> > > According to bloat-o-meter, my vmlinux decreased in size by a total of
> > > 1538 bytes (-0.01%) with this change.
> > > 
> > > [0] CONFIG_HOTPLUG_PARALLEL=y ('select'ed for x86 as of [1]) and
> > >     CONFIG_GCOV_PROFILE_ALL.
> > > 
> > > [1] commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement
> > >     arch_cpuhp_init_parallel_bringup() and enable it")
> > > 
> > > Cc: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > 
> > So... This whole optimization is only worth the reviewer's time if we
> > can prove it's sustainable across different compilers and configurations.
> > 
> > Just saying that under some particular config it works, brings little
> > value for those who are not interested in that config. Moreover, if
> > one enables GCOV, he likely doesn't care much about the .text size.
> > And for those using release configs, it only brings uncertainty.
> 
> I think I partially disagree. If it's neutral for one compiler but
> helpful for the other, that's still a win. But otherwise, I agree we
> should have some accounting of diversity -- not just a single test.

Sure, I just want to make sure this wouldn't bloat common sane configs.
+/- 100 bytes is a negligible noise. +2M for defconfig is not.

> > Let's test it broader? We've got 2 main compilers - gcc and llvm, and
> > at least two configurations that may be relevant: defconfig and your
> > HOTPLUG_PARALLEL + GCOV_PROFILE_ALL. And it would be nice to prove
> > that the optimization is sustainable across compiler versions.
> > 
> > I have the following table in mind:
> > 
> >            defconfig   your conf  
> > GCC    9 |  -1900    |           |
> > CLANG 13 |           |           |
> > GCC   13 |           |           |
> > CLANG 18 |  -100     |  -1538    |
> > 
> > The defconfig nubmers above are from my past experiments. And you can
> > add more configs/compilers, of course.
> 
> Perhaps I wasn't too clear, but I was actually testing a few things:
> 
> * my ChromeOS-y build, with gcov and clang -- to ensure the section
>   mismatch warning/error disappears
> * a pure mainline / semi-defaults build (which happened to use my host
>   distro's gcc 13), to do size comparisons. I also happened to enable
>   gcov in the currently-posted experiments.
> 
> But agreed, I can get a larger matrix with a bit more specifity in my
> commit log. TBD on the ease of getting a Clang 13 or GCC 9 toolchain,
> but I think I can convince my distro to provide them.

It looks like minimum Clang version is 14. The rest is good.

Thanks,
Yury

> > > --- a/include/linux/bitmap.h
> > > +++ b/include/linux/bitmap.h
> > > @@ -203,7 +203,7 @@ unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
> > >   * the bit offset of all zero areas this function finds is multiples of that
> > >   * power of 2. A @align_mask of 0 means no alignment is required.
> > >   */
> > > -static inline unsigned long
> > > +static __always_inline unsigned long
> > >  bitmap_find_next_zero_area(unsigned long *map,
> > >  			   unsigned long size,
> > >  			   unsigned long start,
> > 
> > Let's split them such that return type would be at the same line as
> > the function name. It would help to distinguish function declaration
> > from invocations in grep output:
> 
> Ack. I thought I was being consistent with existing cpumask.h style, but
> I got this set wrong. Will fix.
> 
> Brian
