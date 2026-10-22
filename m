Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792687598;
	b=wi1gpoX93NrBxelrRcZq9l44jDrtuAETMIvZ5jr1sojhWKmVUxtFtLW0X7gNDhWled+q
	 bBrY+r83HP+HbMGN7iyiJ9eR4WLZY881UDdSAVUdkOuhkLPEoRlLbfgWF3IIloLCEUZTR
	 kaZi+Jwfiu5xJJTpF2g26z8ZSKQQzzx01Zwx54D4usJ/JIg6xEJTmqmLSPjGT80vpVlGP
	 TL+RQO5SY2xBS4y6/cFMFohKZdN5S9aCoJn+UiBqO6KGrHTCigoXdBnXjJH0rLEKihU6e
	 c0NgbSZl7SO4WGNAJxNlguWwT8vhy0yRmnOWVJHssMAQvQFDCJHKZtTkSsz5Y7FuFgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
	b=YDWH+2Om9VIlkdkHC3TpZV8sNVYxnpgBZr9NpnJSt2fjRwAFw5Sm2/pOVsHQgjHTm2Nd
	 X2d0evjRrfYRfCswnkNXCGKcrW5a4teytRpMJNkJwX50VpuEEBDQwumEiW6PvAurkK25C
	 o3AnbGgcdEnkSR3LqY88ew7wlznQurlyTrfGDZD0AOMqBeWj4wTv+6V5zj4V2No8vD0Dy
	 4Y4ehc2QXCa3jAJU6UBnrGKCmNoRSE+FCX36bK4pOwV3Q2AbVLn44h5GoiBgc1vw5uBnI
	 HxcLMnZ5ET/rBScOussZDCS8PQsZ9Uye5hWX0EjWjhqlDkpyUuvaXAbbRRgevotSVkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="fWiv/6+i";
	arc=fail smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7B606A31F
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE7B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fWiv/6+i
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db33db4de9so85465ad.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 09:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792687597; cv=none;
        d=google.com; s=arc-20260327;
        b=UMKmxH7ZkITQE4uXvS8MWICxJ4hJf7Ob/DW3obisJQpqoygKHekHfVk+G9JoKJ7PPX
         1GjDR0ba17iyovCmeOT18+RdBbuLCkpeWNv0dgprCLisY77I/b82uFlpgwxxIgaBOEOI
         4S8nBRDuDjGQlVhp1h+2ixCl11UFkG5i8CeLj4U9p0GHQeGpLI+OVqzORTVR6ZTJqfke
         QAmOEY4GJEhFgT4+w8V8U8nPuWUoJfOj66M9csby1VHJ6GRym9GkBOaI5HxPI5k2f//q
         scMBTBfgJdb9Ne/t/kqAtcoLbm7GcUWfq6WI3ulJkT5GA/NAUTe3wa0yy44SrxeZ7jbw
         rz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        fh=MI7ReI/oR3MqW9+4NYSA3Oc0syiEAylK+W50tPLpkRw=;
        b=O3Td1sv9GVVJPYz2lhWmb7900FX1mq01f2f+9U0KuV/AB83djmb2NpphVF+wbKry+b
         DAEmMrzf1R/xheruLHGDltvp8m6KgREssUksrAYc8yzMqR/91/f65a1ucv++/GnHNLye
         303DcT6pSIS7tYm2IdkHETzzr8uSQ6nIB1hsyZTSeNv61aPfTJSJQK0m3+6u0LD1IsKO
         GA9kB8tVYfFulQO1Ea7QIlcQFV5tgBLYG74ANI15RvEa+PXlhZ3u04jmIBORqFj3Akt7
         CsLYLNfkb50LrQyXvgNHS1r9yt7kkM6ppkCl5/5g+BQBGHzDsqkH5xIl+nDZj/hYc1VO
         VkWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792687597; x=1793292397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        b=fWiv/6+iRBtZJjL3H+xnCmzvCKiEf6xAM4bSj9Gg7nmf2ejvBpMAzppahC3CjWJ9GL
         CDWtmeXSNRHeG1+OzZ9zgO0kgA8rbPEPDYFT4u8NvaQ3WGKvBG4fNi8/mH3Ki9ROXxkR
         3dh+/Q1T6sx6KeqZjASyVLJSsnJr0T9IpRSAIeGb71D2lDkJfVzrhnQfQyTWRSlDrw+Z
         zVHdQyHN8LcJS1KaE/Dul60HPCl5gJRv1uBJ0y9MZg0qP7AJZyuGczdSoyCF58NQg2KB
         4/5VHFV5Sq5hPI4VJf3dm03Zlp694Lv63v/MLZpsJ6bcwYY+34EUtlvVd5a5v0whsFT5
         gtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687597; x=1793292397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWReZSZPnxFWoJInKY4s3rEgmqruohf2mZWoSu7TMG0=;
        b=h5DmKNtatfha9i3Y/21F9PiP/asnFDkvukgnDiNiE7rcjypjmsljrl8ZYQ4VYyMnbO
         9MxJ/Fwy+5/L7SojMS/J7S+icyY6tStg4vre04oJLjmBMMaGWF/EC9uQV5CoT6N6c2xh
         ZL9/mg5q9p7FWOOumES0Yx/yDTakDAMW7bYx9h3aOgSQb21XI6ERI4XiR+43ro0UtEQw
         K3boeJ6A6TlR+iQTAqL4H31SdfKK+ztZE+TysdgOyj45W+bYFSPnOAfz6CpOR4GuiR7X
         nxP0qpONtN4DzTA9Ol5/gvjfprQvtCzFQIAVYj5cOWG1x2wZnNnWvFVtW87J4/ZiUAdk
         0Gng==
X-Forwarded-Encrypted: i=1; AKwUvBzzsVRs9LazcfyshP9O8qVMy0FUIKZjOXj0Tf/TqHTXhyUuw8KCNsjrdEoBCvVCeJFpA1CV@lists.linux.dev
X-Gm-Message-State: AFq9FYJmaQCgAXSyRS5mpsBHeUfJ+3AHiF1nhYdIjOkc93sO4GoeoZnb
	1DJpb9O+AmOxarnQpaF03sN+Kg0ZctnFgQ3yh7OaM3MvJvFXWMyt+uRqMgx5dLVL86Mv7Qs4d3P
	9TNeTxuE0QmW5SSpopoY0G/6+4sZfWG8Q9YOyqsgx
X-Gm-Gg: AYBFou2lH6gQDbzJI8B+zucKnGP5sH0rcaPsyvraMKA9QPYHa9WAM0TM19tE9iQwvkz
	xT/OiKT4oY9jAmeUnjGsQKV7lIw4a0TPnXTTVClfCvCTu7nYtboSutj6DooC4VYE1gNEioq9vhI
	pPkk0lIrIeoOnsDlBRgqXWW54nj+IeU+FU6zi56axTJFktdZlL3kVr8wWsYAjKoJQmHIj4vAUlT
	GnUuCh793N42l7xrthwPMmDs8Z6ipvychqkWvq9Ft8wiU0RiV73OErpBQsR88JY8IxV7HKpvzhl
	8dVGWwqVi7FfKfjjHqfHuEGz06i+Y3+RYusND1atzh9fTm91oZcMYa+H3mJXf9ZQP5r9aiopGej
	ZPCxoQxhequp6C71Seh4I3DU7ufUX/IGxYRF2JUAWLTB4BuZLeVHKxLfnUapbkTNV0gvfNxQ7m4
	YL4b9PmL1SH4C2GOeUZwFUOg==
X-Received: by 2002:a17:902:db11:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2ea63088254mr5085175ad.2.1792687596491; Thu, 22 Oct 2026
 09:46:36 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021162538.1852602-1-mic@digikod.net>
In-Reply-To: <20261021162538.1852602-1-mic@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 Oct 2026 18:45:59 +0200
X-Gm-Features: AclHuK9zuGI6ax3vqvDDohM9t-hsk36f5joo8NmHv8Bwy_LXI-q37xMxgIQtv9M
Message-ID: <CAG48ez3Rptvjvt=t_YEcBHHwYGD4zmPtc6tk+gPLtorZY7WEFg@mail.gmail.com>
Subject: Re: [GIT PULL] Landlock update for v7.4-rc1
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Haofeng Li <lihaofeng@kylinos.cn>, Paul Moore <paul@paul-moore.com>, Tingmao Wang <m@maowtm.org>, 
	Wang Yan <wangyan01@kylinos.cn>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 6:28=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> Jann Horn (1):
>       cred: clarify that task_struct::cred is only for the current task

FYI, that already is in mainline as
https://git.kernel.org/linus/b030ffaedc1d638f232f6992406cdcdcc82d5602,
it went through the LSM tree.
