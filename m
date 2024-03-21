Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF76E57B
	for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044782; cv=none; b=ekGnqyDD+y3kmoPiptuA3xgYPUs5vvi68H3XnEakSdA5uwT8PsNefa/JY1saIxp7S9NoG1oOhHdhwaJlK3A0E+hXSeo98+AEvgJEwLJ+WxO4BCnD2Qsmr6d36bQ/y23y8qQ8NeGkLaoYiH4WAxyP8rO6eb/wed9QGHTiAZIhAUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044782; c=relaxed/simple;
	bh=WXQ931QfJbmec5vuyVH/cqzWhVr3qlsdOAwdRqTWd+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3DMHC3ZHqs0Az9qoTsTGrS5piCJdAcmstbJYKFhKle7oUXjhEbH4LcVHtRGp/NKjaQfTBn0Uc5q1WiY6q74v5/V2d8mF3Sh+P7Au33fDTuG/eABaakt63VgsD0qJvdtAugE9Q+43JKby+SdwIrkdP9e0fwhrm7Iofup5cXXjug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fj6hgFxQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fj6hgFxQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a46d0a8399aso402361466b.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711044778; x=1711649578; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q/wQDn+XrvGaKVfjTo2fVVoUWFJ48sLRKpaxsdz0AY=;
        b=fj6hgFxQerQmXDHzmXvpr6djGZmVPRc6Xvo4P9BpRf+kz33x3XMJh7ZcT1t/c/UVTs
         8QMjesxIGT1d7CG7J1LmDZg07ztnzmH7WP4gF+kYd+Dw3ZQy1hqLNuWhrxOE4nJUNd4I
         kU+5bJnAZ7h1uWSjP1HyJOCZ7jmWO15uma7XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711044778; x=1711649578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Q/wQDn+XrvGaKVfjTo2fVVoUWFJ48sLRKpaxsdz0AY=;
        b=ZwAanzxVS+PWZmHSXICEM57S6DiqxLCZHnMoIWjMqiOEOdN7utJR2jdp/jiYhQhHoy
         TObOfWGxY0b/MSrYq25E6qmqfZ9tIZ3H3FcCY7nxZ9Gc+sx1U14tPoAT/J0rA6HtAUms
         UunmylGtvm3rvRSI2Rmq08gkErUHUJinLva23EsNHAeJQhv2tdsD1uORPxoudd5U1I6s
         NoH4EmJypgXHhPAbT10yDBGz0Q0NMeiBKLa1+7JmJE4v9BFq0jo+8Cyc/RHloNAnXbJe
         BBl1/FwoVzTw0MdF3XIDr1Vw5wtwOKs9PtROpo+OP1VCDBRw2NDmAJ6BTWQjSuR1a4el
         YlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlEaX4+SIP1YHd3lJkXvx9sGkU20flMrnIszHwTduh4Hf5LIBuJUT9K3ZOn9y8THuiig95ZjnvgLyXsL5Dn75pHJMilA==
X-Gm-Message-State: AOJu0YxMUMFDjJhkPSf5LB43P2MGCYUVNlwjvqGZLjzi9jFlwJcNNTP3
	x6CxKab/ZtZOKCAOFX4FRtotJ4+AQsMh0EndLcsayBDyLft+A8/Hc8AQ6cmdNQAp4v7SkOjlZj+
	mUyAUCw==
X-Google-Smtp-Source: AGHT+IHjF50V4qrhkU6rUpzQzLcKvPp4bOSAkuffvJFh2CQ5JeOyEYo24O1a0MXt6Xlqomw1w0ZY9w==
X-Received: by 2002:a17:907:76c5:b0:a45:f9c5:3024 with SMTP id kf5-20020a17090776c500b00a45f9c53024mr2947557ejc.11.1711044778443;
        Thu, 21 Mar 2024 11:12:58 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id u15-20020a1709064acf00b00a46cf8aea7bsm175082ejt.30.2024.03.21.11.12.57
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 11:12:58 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a470c79ef7cso186654866b.0
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 11:12:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWPz4E84vhOk2Ca3HvQEKJJcZtcErciTRnNRNy2frg+9q0an9WVLUqAYcQ7scj3hDtt45m3AF4lJHtXuKnr/yz6MU/KA==
X-Received: by 2002:a17:906:6d18:b0:a46:8846:5ab0 with SMTP id
 m24-20020a1709066d1800b00a4688465ab0mr225246ejr.2.1711044777393; Thu, 21 Mar
 2024 11:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zfwv2y7P7BneKqMZ@kroah.com> <20240321134831.GA2762840@dev-arch.thelio-3990X>
 <CAHk-=wgGhgkEngBBureLRLKe7mQ-sRhYngUQNvxEUqR9mmc60w@mail.gmail.com>
In-Reply-To: <CAHk-=wgGhgkEngBBureLRLKe7mQ-sRhYngUQNvxEUqR9mmc60w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Mar 2024 11:12:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=whyOUaDohM3z5vqxjRdw-vo5sfE41VuOfckKq7=_yBJng@mail.gmail.com>
Message-ID: <CAHk-=whyOUaDohM3z5vqxjRdw-vo5sfE41VuOfckKq7=_yBJng@mail.gmail.com>
Subject: Re: [GIT PULL] Char/Misc driver changes for 6.9-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:10, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So the "labels without a statement" thing is not only a long-time gcc
> behavior (admittedly due to a parsing bug), afaik it's becoming
> "standard C" in C23.

Actually, let me take that back. I think it's only a proposal (WG14
N2508), I have no idea if it's actually going to be standard.

            Linus
