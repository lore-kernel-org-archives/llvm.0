Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647443;
	b=E51clqOGue/uHuiwgYkOix/GYtHj00+0jDKb10vb9kXW9mtJZ3PS5IowE8xAq9qIrpX/
	 7WLxIVXalI4AFI7kzt04nDYI9RWM5rnr2BSbFfzwzrlmGpzBlgrfi2NmdWUpDNoIy2xpD
	 Y8j2ILulG6DWlXgqvbTuzpXZ+K+EfSSSOt0leIzzMdN7gZZem+Ftg27sVbCCVM59uP4O2
	 p5Tyb8NHOVr2PEUrwIfcErJAXMJ9zY193eOIIXhIn27YHdfKM6EY23CGArMexxjjZs9xj
	 jyl6dK7r2idzwUmpp7GxXNTCby+4EQFTQPiEP1BTki1BNl7C6DP8a8T/QJSxPJ0bCvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
	b=xr/d5wDMNmearB08hagUF/LcU+//KKUEuFITiDZRVJLMkDP6c+Kpwyfv0ffwXVsanRxi
	 mVRfC1bkhOOuRIhc10HlnM9uklM3JhoVfr5GhBEmtRrWIT7w3XhF1vmVF/Mtt9iT0D1rD
	 rWOV+2UtEBjJvqEuhHwgdLocPMv1500fdTk9qaepwfCBOGHO8uW8wAgho0Bz0Jnur3Ifq
	 wMR/GwLZgCj0ZhyF+pf9SJjMYSIJ+rkKQ57NpnRKFmHWXYalWnA2aG4Y0lxwfyZOM5iYv
	 ffHw+WB8r+7Ibwm2BSY/oEyItHnmX18TOLh4iXIPr3hKTa2BRSMcRF0taZjQ/MpcZVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U0HWYZd2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D4606A33C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268D4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U0HWYZd2
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d88baba78dso1721219137.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795647442; cv=none;
        d=google.com; s=arc-20260327;
        b=JgvvFOK7eF1p/mCvrez9/z/zwqa4x+dlv9oz2vHqaDeRo5IIVQsaEOj1gdYPZO9w0M
         8UBWCr/8/Ysj7V3QHZFb8hagiQWV1uCP9FWZHagA8uUxcd1AZcXYmJUyYRywcXqO/85C
         IKScl7YP7aeFx76VZBkdcz3aZUUAvGqEEbD2zaoBjgWgSWq09XuzUhztltG495N24Byd
         X8LT7DHhduJiRMKmjgiGnAZqO5GY9XJxiNIUbhnANorfXfcM6wilHysm7Nep7rzXXGJr
         +ZNkp1xY6iX4NJyHX8isCdhPOe/ubPOjzGRu2dSDYDOoJaS7MxZfAgkUs0BGaiLYOqS8
         217A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        fh=DqxUR6eD2Jlvc+XZhPAR7miig8CYjtCPZODv5Zih+ZE=;
        b=AbhrdVZNIBr0TWPekwW4W01LE8SL6JNCQSyTB92RJ4mmphPCtgMmFIG7dnEL4TVU16
         4Z+wKcEbOA8+jaz/55GwJRbRKaBvQBw/SXWZN2rY1gGXBG9kybtsFAOK4ndYrZFIa7+l
         ykEt5pWv2JeDDajnL3jhAvQgyuddt9cdLBbNYvP/izgoxshpyjeJlgfWqxYPkT26xsuP
         IJoXtJeoqMd7MNgP9j6Yds6gN1yInFtq+PUgC+D7CFTxi8TQI9vx8valSUAwqkZ4TPoV
         oWNDjA4gtJjlzoLheimi9zB5JUJk+ua0WcUSgbBn2xMlgdd9TvKJprvhZ1HLI6J/8CwK
         u6nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795647442; x=1796252242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        b=U0HWYZd2GRKBsHhdeagtJKynf4UgcQPGWyGvjqHVjMwSskNlq/Q1T5HwHYEN+RSfkP
         a7lEJvTxtzDziimmUBeSvyAkvE45me9LNRnpvxPZKj+TbaKF3xYPNC41z/W95rl2yd3H
         05wnYZqk6xW9G/1SnvL91eXgMOODOEGzTeeGuKM/KTlSOYDN4OIOVun6+jRnvD7AM6al
         NhnzCXTpTX6mb2MOxJgvI5ZlLZFML2PKYPIiLbC3QpsiFiU0/mr13jZT2oiw8z8KWEsX
         oKGGN9G/SHi08rMFTiFpAYkBsZ23QO9et+RgZOdAayWGB0tRpAkwDLNlu/d47t57DXrZ
         q8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647442; x=1796252242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OVfCBvpQu7+LPEH8zPzzFoXUbPUS8d7sUdmZNjwHnQ=;
        b=o3AD0lxlZ8jZU3xd5LAYFMeJ06kimLoxQIEx0yVyzd0O3XlbO0/TmZj0Z2V6UjECTA
         1+qI+DB4U48XLjxlYxs/qg+/r+aznigPxF8H8DVIb9vXef1IUUGGufO775TJLiabaEAC
         zjOW9iEPes/iyqrmWLFfahIye1AOdNNx4OeY6JtMEWNQvV8N9Q2MA8s3ITUP53EHUcdl
         84YUcS2VnbEEoa/pja+O5dNvh06f5QJTEthNIhyb9u9DcGNM8ir7yld8jvL1gVCUOYC6
         iKQVC6l/8+fIcRfShehq1jm3JPrq9Tq+m9uj3no35YJfvnpaQxab15xcbOC9y1nzWx2X
         vKFA==
X-Forwarded-Encrypted: i=1; AL+hErE+ip2djWZlHMkPeSu4kHoR2qXmtgnkTwyNbgAzJW5h2cP6dYiFYLDVwf4v478i8Aimv7HF@lists.linux.dev
X-Gm-Message-State: APuU4Z+bcKqMIEM0t6xXNZbStSNVvxBGqR2EfzlDaQ3yEtlkck+NZ8Sx
	0wqsVZMpIJpeVAHr0WLo8iHezegbmG3Cwl5goFoSevaTIopd3E5TlRJIRWeMG8I5HX4nEeG1ABG
	Bv/65xoIpkgAi5Rryi0Z3yQ2DkX3ZUnwTNydGiP1G
X-Gm-Gg: AZFdTZfPhN2xDvkqHtB9Eh/TwRU3KDIYScZ7sI/ir23LZBfNlaqDp7SdfB+1HRYIE4C
	sXX+B/EVTWdcwdkILTXv11eurmJ3jipd8r7JVuSiVky2ZmU61mHeDrBypJrSPyx//MMPujiIvoA
	gOOnaqY/W6EGqAmVVySfEXmYHtUCfwVvfmCFw+KHEpWfuvbNBJCh3pNpNTvjIksTBLUstD5JPKs
	xRRMs/wB7nxotFSkZYtU9hAZ2oYcvRfO3Rlg13lCmUbv5z38f1uu9WYYyAA/B24PoSmtNQSBDhi
	GqT3FxFx0MOPTHrDfZKxuID39EUb+lub6hYfVbOUWBg04G7RU9lTqQQLCTceb8syQQwNNJd1Y+H
	RyMFso6csXBTUGHMie80elgxsPkgyvTCLqgWdmGKNSmpfzylVPMGlek3ddnCfagfubMwb
X-Received: by 2002:a05:6102:3713:b0:7ce:645a:13a4 with SMTP id
 ada2fe7eead31-7d7395a933amr10370821137.20.1795647441313; Wed, 25 Nov 2026
 14:57:21 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125221911.1425213-1-elkin@google.com> <6afabd96-1888-43d2-9ccb-73ca6702a004@kernel.org>
In-Reply-To: <6afabd96-1888-43d2-9ccb-73ca6702a004@kernel.org>
From: Elkin Cruz <elkin@google.com>
Date: Wed, 25 Nov 2026 14:57:09 -0800
X-Gm-Features: Aa3M54po9M19B4zck65Q5x7Gi_mcnDA_E4XC-TXXXd7r8mQrZUfrKezEY8XNZ0k
Message-ID: <CAC_6YktVNFdtDLsNHgPEy-8_2YfZ42mUsuXJ6OKkm=T7zFnxHg@mail.gmail.com>
Subject: Re: [PATCH] mm/huge_memory: check VMA end bounds in insert_pmd() and insert_pud()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:40=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:

> Which users in the tree trigger this?

Very fair point. After a quick check, there are indeed no users in the
tree that can trigger this.
Back to the whiteboard. The linter is still too noisy. I will hold off
sending any more patches :).

Please ignore/drop this patch.

Thank you so much for your very quick reply!
Elkin
