Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD583DAAA8
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931876; cv=none; b=q2YUJE2XTcdrPzjNzumsfPe3FlnD/LUsDtvKvP6HocWeocUxilhcDR87k9rdKcUtXw4vU6iC14VPDSlI4xEHVtaALpNtgylP29gEq7txMiyd2siShpA/pGiyCT/1asoioMCEHwujbIbylXBDQdQTYSqJkEuxTKN+uVSWr64zG6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931876; c=relaxed/simple;
	bh=tY9Wy2XAqCoXDTllUI2mZDj2RZgUx8/BhiDsHcHrl5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oTfzbxGJDSlMD9nsfqhKlhyyons9L/zdNE0aMC+mKVVg9c1HuyqNGNbu+eoSq9CSqZFZkh8KCECVpn2dEGMTklXqEb1hpshKzBSxE3pijDjm8otiHA+YlITjNELXw1fneGGBDdb+t1EdHGjLy0r+YURfI88cScIJABT3LHFDdLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAnj1HCx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAnj1HCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790931873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OAmOlflbJV02//t0PYsWYtP2AS3mBRNwN6t9PgpiJVo=;
	b=KAnj1HCxnkEkRYdl0O4l+7z31/Bm+Z+yt5BZxSBFKB73Ho8ykSUG8cGn4lu/MUvuLNpnKb
	SMTtatkfcE3w8qpwyh9fr/3Ad3VMkwP9Xjlk1f7HG+qnhIhiN3HpUVfaxGKaE8mBkZ2zhO
	UWs4fxvAWzAnsvhRVWDDtBbUDDHHZCY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-wL8yjLxzO4yb2DWeJfZafA-1; Fri, 02 Oct 2026 05:04:32 -0400
X-MC-Unique: wL8yjLxzO4yb2DWeJfZafA-1
X-Mimecast-MFC-AGG-ID: wL8yjLxzO4yb2DWeJfZafA_1790931871
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so11729065e9.1
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931871; x=1791536671;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAmOlflbJV02//t0PYsWYtP2AS3mBRNwN6t9PgpiJVo=;
        b=jJwnrrgHNVYIi3HEG9A+uXcrDUOHnEWrRBSKlJiXGseJmYwAp3lE9gV1G+wXaETmdr
         0Nml9kQLVNPmznZusKvKA8Mmllowvbc+CX6SfFkSR57W1c9H/V20AWF16b/pf0kUQXDA
         xRKXt+NNfAiDt1w4aVcgBa066EzvVlUY/ffSC1neD9AS+NMPOxqkavMGJE3zehlUVSYE
         QmA8DnTA0jwOakeFE8GCMCLJi+wOVJpJZkrelZMhkIao5TgYfSWNFDQg6o7QytdeO+fg
         TIeSXkcKOS4tGhM0aefBowPKMPZmBCgEMYQD9/tp8UP3w2uOG9jbJvs3znd+HsJaL1on
         hFTA==
X-Forwarded-Encrypted: i=1; AKwUvBwJbFK8+nWed6JRDH2OBnAEBs49ljUfCzviyL30PFBRSkEum1Ynt+Pis5kBVQ1WfJb7ECxj@lists.linux.dev
X-Gm-Message-State: AFuF++mtFJKukiQAXePkqwen3VErDucDq8E5V5AW53ZzIbJK9Xu9nUMC
	ePDDbzqJnViZI5y2U8rbJPAgquVmWx77QDkW//rlXwdG9G+7/6Vcz7jhk6wXLRys4Ue3HRJNc6S
	aW/rMFyclPTEIw4tCul2gI9m9ZmrSwREe6+Win53oHg5+5wDaiux4Amo=
X-Gm-Gg: AYBFou2nFh78Ge+llcJ/jagjxUUnqDe85Jv6LmH4P4ePPlyoC9njjJnvEDVTr+g19rO
	7dqlPaKmope4oc7xLfdza5Rr02R9Dp5SksUyKGL1R3g36NNIKjgNWQm9x6XDe6KOAuAZ1axJSsS
	mL7HT0Vc0d6YTmEtLycdNOTVsIkjAgfS7cB0rYOekq9s0PB5pJUfHDTBY7sOc08kikYBfTlfJCX
	/oZ3TqqWtcGMmtfDquHY9+n2gTatuOwA52/n+kbWrVY+VqvfSJOaoM2XBx/W6/Yjg85FbAUqX1Y
	uirP0k9u7Ip77zeq0PN1S0HTfK7P07gBvR8AEo4+2uxn5F+XlCD5gfRMoX5CGSJwDzmHr3vaQGt
	D0+APsTHw1D+aNn0sEdIjKmcLi5sEM8jw6OXA1QXnbFGTzwRAJlXbe9QoXLS9aQnk4A==
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr39355085e9.15.1790931871156;
        Fri, 02 Oct 2026 02:04:31 -0700 (PDT)
X-Received: by 2002:a05:600c:4e42:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a027586525mr39354405e9.15.1790931870651;
        Fri, 02 Oct 2026 02:04:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm67197175e9.2.2026.10.02.02.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:04:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <a92aa0bb-d50f-4b67-a645-942090d4fe79@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
 <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <a92aa0bb-d50f-4b67-a645-942090d4fe79@linaro.org>
Date: Fri, 02 Oct 2026 11:04:28 +0200
Message-ID: <xlv1a4owfp7n.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2-9NeMIAC87cYr0lzi4mJlfV2otHoyirHxIt0Ab8H_A_1790931871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Hello Neil,

Neil Armstrong <neil.armstrong@linaro.org> writes:

> On 10/2/26 09:37, Javier Martinez Canillas wrote:
>> Neil Armstrong <neil.armstrong@linaro.org> writes:
>> 
>> Hello Neil,
>> 
>>> On 10/1/26 08:50, Maxime Ripard wrote:
>> 
>> [...]
>> 
>>>>>
>>>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>>>> really cool.
>>>>
>>>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>>>> you can have a built-in panel driver that works without user-space
>>>> intervention. So this is not a topic of discussion anymore.
>>>
>>> It will still have users-space dependency, meaning the BPF files will need to
>>> exist in the fs when drivers probes.
>>>
>> 
>> It doesn't have to AFAIU. The BPF programs could be built into the kernel
>> image, just like firmware binaries could be built-in as well.
>
> Right so my main question still is: what does it solve exactly ?
>
> All the descriptions I saw so far is that it simply moves
> the panel C code to a BPF code with no other additions.
>
> I still don't have a clear view of what is precisely solves.
>
> It adds some complexity to load those BPF driver, adds some
> maintenance complexities since with every API change we will
> need validate BPF still works in addition to C (and maybe one day Rust).
>

https://www.kernel.org/doc/Documentation/bpf/bpf_design_QA.rst doc makes
it clear that BPF programs can't expect the in-kernel API to be stable,
so you as mantainer don't have constraints due the panel API being used
by BPF programs.

In other words, this shouldn't cause additional burden to you (other than
the code in drm/panel/bpf/, but that is also true for any panel driver).

> As the maintainer of the panels, merging a bunch of new panels at each
> releases and helping migrating to newer and modern way to interact
> with panels, I think I have the right to express my interrogations.
>

Absolutely.

> I'm clearly not the oldest kernel contributor & maintainer around here,
> but the main interrogation I have when submitting, reviewing and
> merging is : does it really solve something efficiently.
>

It does. As mentioned, this could make it easier to have some panels
working with an existing kernel without any modifications (or out-of-tree
modules). I wouldn't say to prototype it, because as Maxime said, it could
even be a proper support. But you get the idea.

So just like sched_ext can be used to extend the scheduler (and some of
those extensions might even end in some of the scheduling classes once
are found to be generally useful), this driver could be used to quickly
add support for new panels.

> I don't want people to be frustrated by my review and question,
> but I feel I'm allowed to say I'm not convinced about this solution.
>

Yes, of course. From a bystander, I think making assumptions or taking
a decision prior to understanding the use case is what might had caused
frustration. But as Maxime said, it would be helpful to have these
discussions in person next week at LPC.

I'll also be there, I'm looking forward to meet you in person.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

