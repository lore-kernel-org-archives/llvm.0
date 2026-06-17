Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320C1A6803
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781740474; cv=pass; b=YzV3N23qC+3d13cBS8Q7+L2ltElpYdeht8/jnsqU6e8r2fdqCI0aJtT6itAMTX3EjjbRtLPrJ39UKokU32EIpdV1jkfXCjtsA4sjs/sZc7BC0ndPXU55aNMowlEtHPujMoYPI4LNdMZwOvFbgNCzYMOiTV+BMcBXzwk3bzw/LDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781740474; c=relaxed/simple;
	bh=3qi9wKef9p+/KIh8lEa+qaWKowKFhHYyErsVIeQFyw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0h/guh1Ps8W8ETXgGt24N+uHfJ0c4GU0bPexGuBsRBfny/CuwPlH9YtHApEzkxjHve2qIyySRNTkYmgg+9+wRX+7215MulAx8+X8AO2jZwtFdDs7/2WCsXEZEiZ53pbFiNRmxYdDBbRg5C9nMeZW18fnu+4H6halRLUdDyxXxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhbzcEv3; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhbzcEv3"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bb87c90deso45784eec.3
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 16:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781740472; cv=none;
        d=google.com; s=arc-20240605;
        b=QbZgY99fU1Qeox5240jdcJSAc1jrbqe26iZyRLfVWsL9nbOaW19ijXZTv44spQkk74
         j7bv91QxQIfblWB0G/JNEdbWsrbFCyEd3Jl655F8mk16BhSC9KeLT6kLsWLzhcx+p0T2
         9GwEUHpFUbYZd3s07FKq76hH+ekSm8WUgOLxfQsOtagRi/atM+S/2HnYVKVzp45clYbE
         B1ZEEgefXFq0/RaB8eWMm6R7G4YrmanYf70nAthQDAedqUtCRlAvZ5zn4SblIwInsQ7w
         VEXaiJYG458ImN+lkUnweZ6Wc4W3WZZqy0sWOpCc25vOmkTX6n1Fqc+PFrdVhuEDBLcC
         /iaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qi9wKef9p+/KIh8lEa+qaWKowKFhHYyErsVIeQFyw0=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=SP4yuFNpxqNs8ObsmlxLPWyDsEhRY85ZUS0PzyYV5PKXKzmnTxVfEq6x+Xi9X4BbjV
         7Uv7tPJBPp2cz9jRVmw7f3X4lC7VPYjlHsOFFvW3RyPOCtqkOoZm8F/ARVjBknSVLWZJ
         WCfcLe5Vfo63IPKTmbU6T359CODO3saQGhzw+9juthvcbNu/1eF3N5tQaljOkJoAiE78
         Yxf6feuIll6Sj0vC4s6gHWQlqfdNv/lrTvT/9ihT8vhHfk+p0dOweMtqZT7aOKYwuOYn
         c9K3S/IPPEijl0uDDPQjewK7ubKIam8ospMwmT0r+S/52GQIQnNoVMwzuhSYZ87b/R0e
         IPmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781740472; x=1782345272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qi9wKef9p+/KIh8lEa+qaWKowKFhHYyErsVIeQFyw0=;
        b=PhbzcEv3f65oaq6Ydfl3PqXZislGr0EvFHG7kSo5ECK24lk+xiWEjjsYe5xhFbZaV1
         XF06kH3snBJVkc6IdIARY40JVjTZLPAEZ6SnozvY1Rhew9R/Q77+DeV3/4S6Y3KpprzR
         kfxyAGOcgT7LsMMS+S276lZYpDiUlFMj+4aZ7Kcaa9M1tm74O5LbLL0p+RMJS2JKgtSU
         iZbwZr49Ezj5QBSKrlHU42x0EwosS4m5Exq//8YZWXnVI4jtnP6bWc69fgoyPVSHRe5K
         dMP7nR53aZQvy4U7V/RCfG3cAs9PII1x3HB1MCPjIYy2m9IHIqEah7QoPWiZBi6Tr73H
         qNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781740472; x=1782345272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qi9wKef9p+/KIh8lEa+qaWKowKFhHYyErsVIeQFyw0=;
        b=ahANfXzVadtIqfKPC0yjFsse2UxJTdt5Wm2a1SiEoEUAUoSFLH9+qUUUOWDfbi68FM
         S7oMN1+eO7Y9QfsQxFd7EGqyrsQnigINX1SyCAgb0+qK10rIlS3N7TrcrmZcpDjXK+aZ
         toIDi8lEGmhHE6hlOEXo469f1wdGVT0wvI1innBU3bIqxsyFZWUHYxQo/HYRJmk5SHyD
         mA4L82iQ6e7rs+L8OUODxUXft+d8DmIwPW/z7oGRDBZn+eOl42oDgyyZN9xgiyZji7Kt
         Mknw3tHMDciZKg0t6A9tAeZW1H0UixksTVhpWysnyvzfbgz8Ma2IeSw5kGXl/jCrWU39
         L6nA==
X-Gm-Message-State: AOJu0YzxHbACRmq5AC70N0+CwjCWXo7tuzKXHhyh+nJIuxtjk7iuuyUq
	motz2267khjBeoaP8abZTGD7skAQrZG2JeIcELSZfPZC4i7AfzbR862K8k1L20nlyXT5IM20VMz
	GlKG2W0fnzTuLdPOAairdmyDOqJwXsWQ=
X-Gm-Gg: AfdE7cna6Hbar32iGpSW4r47GPAJyzuD080i6dVlPM/z5VHnoIMwUY4NAd6ekrnQDWK
	6m9R1qpZxnT7Yin3tgzej+8O8bUogbAIhAX6NwDvivXfkReZzQyUg2ovC+C5aqCQq/TmDBgeRp/
	siOCi9bEv0axhEexLaYxNXxQrRrZ9GVXqDAqvH6tuJnK3KSaTh8aSKzub6XyLwyga8SHqn016tf
	G+sk9+GPNFu5rh2vyKUFiU8SUBT2PPv1Fh7G4Hoz3LjR1Shbtuhybe5jrU0E5mDvf+yOdDzIgKo
	zP78nw3lhohpQGviWIQHmB/RxXcrmC5x0K95lVh7yqi8x4gv26p8nOXnd1SmsFMJk1a94tjW+2D
	Qod2x+PyF4zFgFEH/Gqbkw68=
X-Received: by 2002:a05:7300:730b:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-30bf08e8ee2mr282973eec.3.1781740471971; Wed, 17 Jun 2026
 16:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617020040.GA3268077@ax162>
In-Reply-To: <20260617020040.GA3268077@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 01:54:18 +0200
X-Gm-Features: AVVi8CczxVd9waKbHhyC8Y2V4IQtOTUpcx74L5acmxOiYY9ukO_Wr4kXSdojkX0
Message-ID: <CANiq72naBrHz-A1PDnZ1sgToge7sy9rYJZORpeHVG7kG8BNQwA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.8 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.8 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new. This is the last
> expected 22.x release.

Tested with Rust as usual:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
