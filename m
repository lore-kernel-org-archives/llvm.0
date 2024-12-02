Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82461D63CA
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160485; cv=none; b=rEuuMnS5vVq4kWtVfPqozWXmq4SeItO5XOpzbM7YEUQdCg1k6SVfcdINwDs7R3KPykEFFnDUspgz5JbuQC11JvaYj9rrFpxLHt/y1KkUyW5vAdnwSn5u+2/iUSTwDBuRMKUfEBvH3+ADqLlUkJxN1Um6O98Sa2EcG0wHuTWVWTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160485; c=relaxed/simple;
	bh=r/3/WvrUYpNr+tcjXSjzxvxpguA79BHRy4L5fPvtBqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVvZcWAuAFYpoCqTfgfiGLpM8sP6PC6QSSug7vhXLxVFHaqDrHAH7SRF1nsaxNNTNgtCxYekoSSoZWFEGqpdsgnyhFmAz0HS3Yk6JdHb5riW2WzfTZCW8oIjHjWsUQdUxXPFWwZQ0/2r4pIwETGeMKhva0x5Tv7n8gCMRpmroKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DYlZuBhN; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DYlZuBhN"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so2562050a12.3
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 09:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160483; x=1733765283; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zV7VHVGHL7Rl9Gp4X03jHFgxr0pgqWsD/7qzPnBvxDs=;
        b=DYlZuBhNNN0fIau0wbzEZPHjrLfsAGLwf6+rYQ1yJyruUA2LhG9h4kmx4/0hXqK9qM
         lo007pflB+W4yk6GZACITCLdfpGdf1Cd7Z/lcyDwNn0JrNNFLSuPaNg1HQbQTVRnwogp
         Dyjt5qlest2COgGdiQnANhLV8ctH+2jKMuiig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160483; x=1733765283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV7VHVGHL7Rl9Gp4X03jHFgxr0pgqWsD/7qzPnBvxDs=;
        b=KYH9wZQDj78yX3qyi+I2IgMyAB1YIScBi5+fDIIpna4w2VcFl8tWyg1yJala44SaUc
         DmuRxlqOF/mFGiyRtUnc7bm4Jf+0oGWShHUiimMw4/zzZ2ncV4wwwO6dQkxzWxp0PSA9
         XdT/oLdPZfkbjAhGnc/N+eMReRb8K8svpFv/CxmeU2jcFtJjt2thZIXjQ6W2usUdQhvK
         brtzYWNv9dIGfbzjXBZnIlR4c6/XUo9mn6/Uh1gaUaajbRFVw5pT2hIB+GtHM8BZAGQz
         mvvhRDzhfseWa95rCF+i3SLGJ7iCZzIkPvqAAgDIlshNJNxXrrIhD9rIv8RAsK68tA3t
         bHSg==
X-Forwarded-Encrypted: i=1; AJvYcCXOvpns5dWtLeblAZu5ub2BvxJx/AuuEwaFMFuqeo5WLadOtWJDbrMbNlhBl3G7Mfq5BY0S@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3gNB5zQmw+3NfYVaRB5sd3YUn1165I/i9qryFbEm5IsNfW/Wv
	A76/SEpg5UAoQInGCu6cJYiLcTHhda/iJNCM3LsYpP/30suNL3IwxS0hsaos+LZFTu5BvcFOlIk
	=
X-Gm-Gg: ASbGncuEhWd0orVkep3y9fZpv1oMuwqoeYrhyqQgSq9nkbKxSwLemhyufyKInE5nQ+E
	26peYBIlAhZsJCif1QzW4CyhdMw8Nv/e8gc539kGNBBfaZvO1uxdHgkrdWDpbP5fz0fsorcv4kC
	yril0+548Qp5EABJrGmKSURbLgkf4TKupCc2lMW/MojczFehhrEqjuNnxRtiCwbxzTULfWEHs19
	+Lt6/BR4tv6IqrMCbZkjKXePiJeDq5Gm6eKIXHeBPZd90yEiMDVx0uVUtiScB4X7LhIoBBGRyvl
	kVvRZ9MpCdkBFpS2
X-Google-Smtp-Source: AGHT+IE1wMktysdl6EdA45kXAUIA16hdhR2CO9bQf3Vk0Bhg7CZgzKURDJU44PywXT4e0vk1O6enCA==
X-Received: by 2002:a05:6a20:9144:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1e0e0b5cc99mr39791914637.31.1733160482664;
        Mon, 02 Dec 2024 09:28:02 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176148csm8776164b3a.19.2024.12.02.09.28.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:28:00 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7256dc42176so1410613b3a.3
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 09:28:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU37cS9sokkPjTa2c7YDeopz5DZO+Fn23l/EQ42+vEFCafmknENI/3IGIIg2+K5kstdEj6Y@lists.linux.dev
X-Received: by 2002:a05:6a00:1390:b0:71e:5a1d:ecdc with SMTP id
 d2e1a72fcca58-7253012f56dmr32940878b3a.17.1733160480025; Mon, 02 Dec 2024
 09:28:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202-fix-vmstat-v1-1-c995585b7df5@chromium.org> <20241202161811.GA2843691@thelio-3990X>
In-Reply-To: <20241202161811.GA2843691@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:27:48 +0100
X-Gmail-Original-Message-ID: <CANiDSCt_RALHi4O313bzi=Grr=sCV+Y8WmHmOF8JpttHw6nFpA@mail.gmail.com>
Message-ID: <CANiDSCt_RALHi4O313bzi=Grr=sCV+Y8WmHmOF8JpttHw6nFpA@mail.gmail.com>
Subject: Re: [PATCH] mm: vmstat.h: Annotate operations between enums
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 17:18, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Ricardo,
>
> On Mon, Dec 02, 2024 at 04:02:19PM +0000, Ricardo Ribalda wrote:
> > Compiler is confused when we do arithmetic operations between two
> > different enum types.
> > In this case NR_VM_STAT_ITEMS and NR_LRU_BASE are not actual
> > enumerators, they are used to find the first and the count of the
> > enumerator.
> >
> > Add a casting to int, to avoid the following llvm 9 warning:
> > ./include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >   505 |                            item];
> >       |                            ~~~~
> > ./include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >   512 |                            NR_VM_NUMA_EVENT_ITEMS +
> >       |                            ~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >       |                               ~~~~~~~~~~~ ^ ~~~
> > ./include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
> >   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> >       |                            ~~~~~~~~~~~~~~~~~~~~~ ^
> >   525 |                            NR_VM_NUMA_EVENT_ITEMS +
> >       |                            ~~~~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I think it is just better to disable this specific warning for normal
> and W=1 builds so that it is not visible for people, as this objectively
> makes the code uglier:
>
> https://lore.kernel.org/20241008005136.GA241099@thelio-3990X/
>
> https://lore.kernel.org/20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org/

Thanks for the heads-up.

Either disabling the config or this patch will work for my usecase (media-ci).

FWIW, we only need 3 patches (plus this) to build media with W=1 and llvm19....

I do not think that this patch is very ugly :P

>
> I have just pinged that patch for acceptance.
>
> Cheers,
> Nathan
>
> > ---
> >  include/linux/vmstat.h | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> > index d2761bf8ff32..32c641d25bea 100644
> > --- a/include/linux/vmstat.h
> > +++ b/include/linux/vmstat.h
> > @@ -501,27 +501,26 @@ static inline const char *zone_stat_name(enum zone_stat_item item)
> >  #ifdef CONFIG_NUMA
> >  static inline const char *numa_stat_name(enum numa_stat_item item)
> >  {
> > -     return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> > -                        item];
> > +     return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS + item];
> >  }
> >  #endif /* CONFIG_NUMA */
> >
> >  static inline const char *node_stat_name(enum node_stat_item item)
> >  {
> > -     return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> > +     return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
> >                          NR_VM_NUMA_EVENT_ITEMS +
> >                          item];
> >  }
> >
> >  static inline const char *lru_list_name(enum lru_list lru)
> >  {
> > -     return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> > +     return node_stat_name((int)NR_LRU_BASE + lru) + 3; // skip "nr_"
> >  }
> >
> >  #if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
> >  static inline const char *vm_event_name(enum vm_event_item item)
> >  {
> > -     return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
> > +     return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
> >                          NR_VM_NUMA_EVENT_ITEMS +
> >                          NR_VM_NODE_STAT_ITEMS +
> >                          NR_VM_STAT_ITEMS +
> >
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241202-fix-vmstat-88968bcaa955
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda
