Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6679CF
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715115223; cv=none; b=r8KmwKxkWxnHfHEDRfu0rpmTHjRXZtbgbwcYzS789bcLBaf9CeJIaSvkh9nDuO3/HjpeFVBy7Fwz0u1XX2DDM4EdKXycdVX6IdNKKVFDu5tSHpYx6H93zova0OduutMp8gbfjPJKKySRTve399i1Gezck9aI+yGAAqOlOtMX28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715115223; c=relaxed/simple;
	bh=7M+NtxKZnPDppdk30q3K/jPePHvgBrshS2sV34FSFas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mm5btR0WYUc0wA09N2ts/1ucZG6GAvpxWHRFiPNzMBxCT6Vq/LQpnRJm+Y1K4btsnVXZufi7g7iN8yx6YDIdsZTs5DCpjImh0lqMT39qGjPwh+NPeh1/rNmfsimTyrpzfGXlCQtX+93d7fFcKc3w/mnta09jpHAxNTRjVykHt+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b=k8hQGcGK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="k8hQGcGK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b9dff6be8so24724535e9.3
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1715115220; x=1715720020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFVFsbOtBEE+BmWcqY4bLdtjzye15d8lPmfNqQm2W7E=;
        b=k8hQGcGK196wOXIO4bDPapvQh6SoI+8S5d253cdTGsPKEgWhTEgVOvlnkidMUivWeu
         m/noUe0pJVNY9mjjKap/fo3Nyf7Pljrhu6kJhRpvxmHQ9quAwFyuPLDEo4ROeZDZB9va
         Pg4x20F4b2jNM++QS/J2Lt6hkIpb8pBMPedLv9xOCdGium6kugJBgS7wtcpyE3C0GPMu
         cvDGHG6Q0GAZ6nUhNm8YAxTszYGKZV8bZLb5YfwM/xZV9MmLog96cJBhWcqWp2B1B5WO
         PxDCCe3Kjic5SKO0p3lwCEs+qjatAvcGg3xnW0phW/TmRQOEhHtnzBGDI1CCKYfUfbst
         QAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715115220; x=1715720020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFVFsbOtBEE+BmWcqY4bLdtjzye15d8lPmfNqQm2W7E=;
        b=D1QvKyzk1yNTVGuIZCIRg/JyEBH/dqx0yWeb3BgL0sl5b6T1VLkQf+cXoZrcKXruo6
         5yp2vMWPlJdJWup643Ys20i/8hApH+GvjzAHVsjlF7h+S6SW4kYf1GVyvAWLh1H3R6pu
         rtLoukLwOk8siQUC4V+uY0eyHG71Cs5gsWEREgNJPGqE86oAK8nEqbyctsenPvVe7EQE
         o08JSLtP95gY/h2jBYLUnai80HUwMsacVIdEEqdT733bCBK9vIeYg3VYxFUwGOQEX6Vy
         LBDK/PWkdYxIjgVEV+hLJa87yOQ6ZoNvqETKhnThZ8xKC1Hed4uACOvM2M3Udr+aDEb5
         Pslw==
X-Forwarded-Encrypted: i=1; AJvYcCWrmDEBoi0HFmRsNUl3kS/aU8A4zaTXbVjI2VaLE5ZIgVQE/Ik/TJVYcvTjh3S4Vf6BE46YwLQDAU2aA43VMDWPSuhSFQ==
X-Gm-Message-State: AOJu0Yzw8CWJGSvOgNm+dKnHPoFnIv7RRrMjQuM2/YKMg53dtICjiJTw
	EdOK/I3TWZU4S4UjCGdh+nD2Vf3o9QfuaCTtUCy8fuJkalcjpbieOw2D2dxCayE=
X-Google-Smtp-Source: AGHT+IGvKgByFba511+kQjW5eQZwi1LEu6PO71nv4QsVrnVhDPPAGCjI1x7cguks0dBbCf7Cf+etgQ==
X-Received: by 2002:a5d:58f2:0:b0:349:8a7e:e0af with SMTP id ffacd0b85a97d-34fcaddda53mr545108f8f.11.1715115219785;
        Tue, 07 May 2024 13:53:39 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id ay35-20020a05600c1e2300b00419f419236fsm20909420wmb.41.2024.05.07.13.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:53:39 -0700 (PDT)
Date: Tue, 7 May 2024 21:53:37 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Justin Stitt <justinstitt@google.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] cdrom: rearrange last_media_change check to avoid
 unintentional overflow
Message-ID: <ZjqU0fbzHrlnad8D@equinox>
References: <20240507-b4-sio-ata1-v1-1-810ffac6080a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-b4-sio-ata1-v1-1-810ffac6080a@google.com>

On Tue, May 07, 2024 at 04:54:04AM +0000, Justin Stitt wrote:
> When running syzkaller with the newly reintroduced signed integer wrap
> sanitizer we encounter this splat:
> 
> [  366.015950] UBSAN: signed-integer-overflow in ../drivers/cdrom/cdrom.c:2361:33
> [  366.021089] -9223372036854775808 - 346321 cannot be represented in type '__s64' (aka 'long long')
> [  366.025894] program syz-executor.4 is using a deprecated SCSI ioctl, please convert it to SG_IO
> [  366.027502] CPU: 5 PID: 28472 Comm: syz-executor.7 Not tainted 6.8.0-rc2-00035-gb3ef86b5a957 #1
> [  366.027512] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  366.027518] Call Trace:
> [  366.027523]  <TASK>
> [  366.027533]  dump_stack_lvl+0x93/0xd0
> [  366.027899]  handle_overflow+0x171/0x1b0
> [  366.038787] ata1.00: invalid multi_count 32 ignored
> [  366.043924]  cdrom_ioctl+0x2c3f/0x2d10
> [  366.063932]  ? __pm_runtime_resume+0xe6/0x130
> [  366.071923]  sr_block_ioctl+0x15d/0x1d0
> [  366.074624]  ? __pfx_sr_block_ioctl+0x10/0x10
> [  366.077642]  blkdev_ioctl+0x419/0x500
> [  366.080231]  ? __pfx_blkdev_ioctl+0x10/0x10
> ...
> 
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang. It was re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
> 
> Let's rearrange the check to not perform any arithmetic, thus not
> tripping the sanitizer.
> ...

Hi Justin,

Thanks for the patch, looks good to me and seems like a sensible change.
Reviewed and build/runtime tested, I will send on for inclusion.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
