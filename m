Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E472D0C7F
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766095620; cv=none; b=VeJx4kJ3Fdrv/e9p3xgR9aEmh9Bm09gsilqz1X2nunDau9kqAMuecvb7Me285nraRtuyfFfvgJRqS2+E/X+c+NpLqjo2CFn7m1QOYPVhrPBcYVxRnTFcmzaQwOPghoxCjYdHGOg18NEAhFWR/aiBTBfrAMXn1+LImiWDwzHC/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766095620; c=relaxed/simple;
	bh=J4Nn2NlGfDoMoLD2jX96Gn59VTZ3FbVS9Sq+YlKTdug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KuCQhVqIwMXiCChTGCcaEnekuiQk/xOjAwilIyMztVB8gejvPXhHUl8LCNHy+ioRzNbOxxu3COQiTk2Arw1K9MuJCCji7tkFaQF3JtOX03v3mALRQDzbGW6S8PK2iyGs25wSXCNV8zV2v7eB/Is9RClVLZMfQfNk1AmgG6YdPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWX8YgN3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWX8YgN3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso8238655e9.3
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766095617; x=1766700417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCWNyqqNvxqk0sIuAi6HOTqP3nuQgibcAJ59og/NAJg=;
        b=OWX8YgN3VdXzKJjU6KR4vI4/cTrHfUSFzdo323r0GkFn5CNq7A7hrzDiNIslqXE2td
         ez3ruwMs9ETRmTEcU3rkbePavA7JZ7qeVXWhgvmj8LOb/FOxc/rWvVJ4ONCZ8yV86f6A
         UYzVvWULfluCmGooHMwJL6u9op64nKVzbymPwbkaz3GLTBCbybOMqTYUfnwyIT99nJjW
         cfbsen4snYIPEiNE2EXUTfuJgSI2Zr/lH6ytpKr3hJMFBJU3P+EBcR2MS8kXrer6/XRq
         UtrYXqvJmTtV3G/wRjz6hk4f5cUawtzLhLE+4uGqB7skZ3ZxwiHLXPilOYsko9Gd5S/b
         sh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766095617; x=1766700417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCWNyqqNvxqk0sIuAi6HOTqP3nuQgibcAJ59og/NAJg=;
        b=D83Ckt3xUaHPCQ2pSLC1dJIHuCXCmPmIlW9j8WibKOtMMYvuGkw6uBoguCFZUoRfYj
         +ERLw3DVQoofOcDdUGfzKkfAhcOhxYI4m5EdPnAEGfyU2kUCJjb2Zat2zPxBdPwATQR4
         EeA3wHRYcFi8vvCgeZwrDw4iYfo28tmuD0n7L/miK6E7XtTCQ7Yo2K2hFayoOMCz+pnk
         49IjzA7hfoRKR9FrtKAO8M9jtiqykdguB90r/c6buFGrKvMx3h4lZ26Yd1K3xnZrDq9i
         gWBYeGUH57K5yh9dbxdsfScnkzeU8Zb/XbjLG1ucHkv4F3xpYGk4CxdyGYjQp58/J0UG
         ffxw==
X-Forwarded-Encrypted: i=1; AJvYcCUWREfxvAGECVrSnk553UGsx42TL/BxhRfNJiwWHqHHs8rrWeoCE0hc1JecCX1vsWzFM8Nf@lists.linux.dev
X-Gm-Message-State: AOJu0YzCbvsPBePpE7KxK8DcuZAMRWuwc9LHnHqXOYb5SSk5KugAsLac
	O6wQvX0U4l4PmpfVqk7TaFacu+vPLaNmU0nL8wYnFD3imVTFrqDVfL4r
X-Gm-Gg: AY/fxX5uxIfxdd2kXGD6sU5Ulz7Sqc/IK3BC3RFvN9jdSjGfG3PVCWEKq2E5TBeDlBU
	2s8jbIyTelMHeT44sda78FdWapw+BMMVSucJvl+nRtpoDg07uI/7o/yjH5VzcPxHHa+JAWzSCli
	rxVfBeBNhjDn0lTEukw4HZyceILWAI9LTwynmgJIRNY2LWH87CaEyrvR713+tZk3Biot0XsCvAz
	CrcpWL/ORJhD5bJ2mw0gD/EnbqWHCbqIDJuvoJBu2f3yX1vQvuq+aLgV/xr3ywdQ3zZoVJeyG5a
	DyPVO7XdfkDULOo9viqMHn9mx46zpeHG3xAoLM3wiNhTX9QNGnXkal+fbbneuMVB7TZheIHPWWE
	c+uzhR6RhZjSbXg1ukehm1m0RGA29iGqbuE6RQ4z87PqESeXiWeGe7OvQr7+og0MGMVlEm9CMN/
	UjIQ1vTqR6Qxd2PG6mzcRyUa/cezLc+dKSyr1GtM2WBp2Fb+GfHiW6
X-Google-Smtp-Source: AGHT+IGTunC8kRSxjImDPeRC9HvKyQNV1Ibv0KtdSMjVnMShq1E8PEmRrIAevTE0VIl4mZ+C4NDiJQ==
X-Received: by 2002:a05:600c:3b8d:b0:477:7725:c16a with SMTP id 5b1f17b1804b1-47d1953da58mr7304975e9.10.1766095616415;
        Thu, 18 Dec 2025 14:06:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm71561025e9.2.2025.12.18.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:06:56 -0800 (PST)
Date: Thu, 18 Dec 2025 22:06:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <20251218220651.5cdde06f@pumpkin>
In-Reply-To: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
	<20251218202644.0bd24aa8@pumpkin>
	<CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 08:34:05 +1200
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > One possibility is to conditionally add _Pragma()  
> 
> No. That compiler warning is pure and utter garbage. I have pointed it
> out fopr *years*, and compiler people don't get it.
> 
> So that warning just needs to die. It's shit. It's wrong.

True - especially for code like:
	if (x < 0 || x > limit)
		return ...
where the code is correct even with 'accidental' conversion of a
negative signed value to a large unsigned one.

clang seems to have a dozen similar warnings, all of which are a PITA
for kernel code - like rejecting !(4 << 16).

_Pragma() might be usable for -Wshadow, which is generally useful for
local variables (but not global functions like log() and j0()).
(I usually enable it and fix up the consequences.)
Things like the masked userspace access define which carefully
creates a readonly variable that shadows a user local would need
to disable that one.

	David

