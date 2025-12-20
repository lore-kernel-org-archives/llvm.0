Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1036279DAB
	for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239928; cv=none; b=G4lZ2e/7h0qf3z1LkfGUxHZK/zNYg8YQZ0Rbnw8C8sXVbcZI2PRYqEg9yMWJ1sMY0qpHoH9HSA4oqOgo+AEfxTZ7lePUntejFCwP7SlnIHGyjeF7UsJ9ZIAgVRF7vSTUergOTkKjHBN0C7AWZw//DwV2ZCyXMgOhGRxen3Etblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239928; c=relaxed/simple;
	bh=+91vBrhME9o7XT0lR5vxdKLtA/ksi1YyENBrti96Ue8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKtbz29He0IP5MACluH9vpmt472uVRo7gbl9410OuonUr53NIcw9M1dQAak7fThTSivrjq30htwHeDFKqQBpax8PPTGQ/+Nyfocktcu8ikfB+NVJq9NdOqun13yxgpzT//tkwxQgZNkdE2jzvgZeDXTmBaSD22k7DbPKz97dM+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrizCNUG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrizCNUG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a08c65fceeso4878625ad.2
        for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766239925; x=1766844725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+91vBrhME9o7XT0lR5vxdKLtA/ksi1YyENBrti96Ue8=;
        b=TrizCNUGNBsdt5OLArOdFGGXIV5KjPxGF9JgJrsFXMK/6M/kQtiJbSYdGdfTJ5ozYk
         /+e1vEcrLSo/0BWq934zKv0lMxLjDjpw8l1gAOblo8+fMP5J85UxMdbyKdIy34NqOhXF
         /3+UQz1ZLiG4+WzXylkuQA69ZLtDeWiC/wkFNL7HwzweMeeNp/CJE+Mmp8sMm1Ic5oMH
         gprOrk30oAD48mE8BFoD6Lr8fnq4qcC+A6QRz/741QKofmGkTXlaJmUDMEJg++4y2/Ow
         I/msr8HafnNOfCjL36iMi0kn1ekPE/AlzuimKBwBGVZSFl/GQ0njWyBqn7ydT2D1MaMK
         NKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766239925; x=1766844725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+91vBrhME9o7XT0lR5vxdKLtA/ksi1YyENBrti96Ue8=;
        b=dPJ9yIE2QLU6y5uTTSsUwuEalY3JmqjSJ9a01152sZ5c1c3vyXML2WQdBvTgMxoxiT
         OAIXCFveZOUnXWuJiuV+PEytQkdjf4pc8MfIo0Jp3o/7DUR7Vx7RSiWo4c9TGUEPqJgC
         8kUSm8qe6W/5z0seM1t/GcZsHcaVnIgmC5AljNseyFLZj2X7wwXu5rFUWZHNaIm9+B5Q
         p6J8GSL1quOWxiINfkpD5wXAB2ZyZsZcpVdEt9WO7R7lIvDWkGawz+aSGaZEbyTCChOe
         4I69ZpinPydoGRqpEA9/iMTuMkOMYIC/KkpuOOBKNkVfdQr7/A0Ff8VRQ/fQe6IueKFk
         tDAQ==
X-Gm-Message-State: AOJu0YwHOL2GW7iugly/duT8X9wWibvIPAIVuvYvua1KA1sXjv3h1Dsy
	ChJS+loE42uRyBxUp+vAGJqZib6a7X+vEwviBTIjzFWpMZrNjBY9G/c+JfrwG+xDj3e/uMYxAAX
	bY+UYRjksgzTmiOVJlNsgY1IOikzDfbE=
X-Gm-Gg: AY/fxX70qcThl3HeC8hi1ObnH6d32RwbpbmqqfkNUXsalbk4PRjpzoRc/2yy0I22Bfq
	3aN1sM2hRGPTYvJFaHGZ0CzTE/43htKbiQ7tRuO31KcMCbSoTph3m+O15zYm4wSb/iNezt61+Zb
	mDYZFa/mjbiVw2XlsgVnvxGxWxBk9rZ92baF15llLbZX94zGgSpO0qZMPsmymE6z96WEqlxYIbt
	la6BtU4GXBJCXPpAIhWZL38iEq0bhqKBq9mEavjX7GrgMYapyciMfpdly8Bn+HhULoJVXMAimgN
	YRhS6nym4EgSBrBITr2vN4soh6o3/ANenhTfMOf6MkMo1ACaJ5i9KgTjK/glTRwBlx8LRE6U4/F
	lJUJ11Y9H8LTl
X-Google-Smtp-Source: AGHT+IHAUAAzcSF/Xr6LlavmzcGZmNlEgcMWNP3ooY+65Kdl/CwWJh3B+IhAUqnTHD5T3gT3ilHFBKiWyz1f0AaxRTo=
X-Received: by 2002:a05:7022:6294:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-121722e11famr3752203c88.4.1766239924960; Sat, 20 Dec 2025
 06:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218051614.GA2453313@ax162>
In-Reply-To: <20251218051614.GA2453313@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 20 Dec 2025 15:11:52 +0100
X-Gm-Features: AQt7F2p-vE-vIH08CDzxhBKE4C3NvinIUsBmVRfKFOAyvJWw55gXE8rI5GRCwQw
Message-ID: <CANiq72=z76FhBwOURGd-87w7XCySW8_JXMpR24ew_MCMbG5oLw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.8 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 6:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 21.1.8 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.

As usual, thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
