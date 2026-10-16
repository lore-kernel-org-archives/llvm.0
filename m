Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F044CACB
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143913; cv=pass; b=IpKmbtqhJuT0X5uH/XIgL05Ax/653id2srGVAGe2/OBpe4y6/i9k37kNPsgYtQOc4+PIx+oPV0QafybJzOSn9QroSVgaOTNMm1RT1VOAGUI8f5F3KldEKVeDMdGHrz4CW8ZpgAppUStPluNPcZGJJQ30tP12fJNIaoKdw6MU3Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143913; c=relaxed/simple;
	bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyXKIk5E+7mZtHYpGaMWsoh84KM0vizxfNLEr2WFVZDxPf6l4VDqSbVqaurUkhrHGYCSoCFmTUO1aARc+GiAi3squRILBEiVnMCltuPEJcS2f9KQSUlg5F39e3wJYke8fbwlypnXa83DEcK2OanZXKuP2SZw9grDCnfeersxmIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SegBhkLd; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SegBhkLd"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-360bd1d1f9bso39320eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 02:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143910; cv=none;
        d=google.com; s=arc-20260327;
        b=C0SYOcU8xsIB0sC8hKt6PRAEq2cJ9k4FDwBk2zyk0VRrT6yfDYYus1ZVrFm1VOSnEu
         AzMxZ2KMSeUYF5YEDt8vXgntARHkFutqIcj4MGUeo32Er9FdrF8Ok9Zip5w+Qm8Zm5FG
         7kkDXLZ/HGlbhpgqWSePh+5fRldqFw6oAd1EE2Z4uK29tS6anTSHN88FvBhNQJjnNp+5
         mDYEYIVE5b59EBexbsxwE9JIC0Ei98fnfUCI7MfYcg89IY0q/3DyXPxz92xfSs2Exf6w
         vgDduhp3o8oAgJPXlJs4hR5poFoFvBzQqMiZQ+2vPvFxv7G1ydgDtf9Xn3VlQqWeihmo
         bLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=EpCiYEo1xbuHsE90g12OUnoPNiKePd2JKuM4Q4wSPfsKjHmk2AFIdb4BxJdjZkCiAG
         Y+s7WY4dVt/AtKKLyO3Oj7hox78s3E1NWE0nekjK71oXb1rl4Q0kN4SWPrwjGli0kFEl
         q/a+5TdY4BhL8VH0WKhVZWur2NRyBuUYfu8VqIXiX1QIo3SxmcwVjUou3S+wzhGxW762
         LJ3Tz8dwrEHukAXLuIYaOMNp0ii4bnqRmoRpSEJ9LOOZn2z1dWWayvOK3dO/GQJSv8sO
         4c+1ERWEXn2wYTRbcbYP0OKbyuD962Kehsevgh25XSuKI0Mr19ZAE3BQo3/jG4UwLy1L
         zJjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143910; x=1792748710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        b=SegBhkLdJdZSFXVhN7LVP7hs9NlaQShjFFexREHj/H4A7irC+k413bB8n9PcW1HTDI
         DZou12JLrfBwyQ3671JVdtXdGNqYD47BlN4BEEktLtPwl34x49/S6Pxu6aMgzWCZQV31
         nBco9FIwsSGdxrc0FLmJ45BhZSG9zc5u9YZHAGpwi8ejeS7HiVqQVHo8+f80FJHN/XyT
         SJZ1eikchUXuKNxqJpslX9UgT+2jkIdGwQlwuYJHdBw6Llr00UsxDw0WhJ9rV8ELXbHA
         cv5r1j3SuBJrtc4dEtoWi/S1yr9gVg4ZbT+LSnjdlfZ8XDic1+oq+nUiNeyrBpQxlxev
         napw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143910; x=1792748710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0VMzH4y79XzqfuNwyK8eQP0Ra6FWB8wgouUhbiVkuU=;
        b=2dvC4ZnPleyPNWVU8jq211c6DFhp1fXD6NVfI5OzxazHUxGWO5KznzllXryBacZAVP
         Um0IvlbTEakocUYOHaDbG0BVJTSYbXENoJYGe5VkKbDXdw2yRgnrLWN+dnpGbUAsXGrJ
         0EhIqdJcaxbQSnL27eOUFBdLKsQwWvJcQph3T8DWDWDy1UW999+wyXMoEErmivZe5qy4
         NRG//vFcaCjX76qUayuhEu+iEvM6vWDQomY+rTSAdVVYCoi98sg0aTyOvF0brh2O0ESP
         0Pfp0WZlgoPqSHGuzI4/LJCH6trAup+0bqKTD+W4McIiHYnUZ+IXkV+HtRwq0hN+v4+1
         l/1w==
X-Gm-Message-State: AFq9FYJJJ72ZPd8nBq2y2/kcsSl1QKx4EbHBzoWlpCtSSp4gA4l3yCJo
	TEB97OAm59+bM0D07VSe8bqjoYofSRJocDJHkXWD0ZPPpS8jhUASZcTCYCq7Q/iohnOI1oSeCzZ
	oisF1xSniy5axa78m14HjNCduAz4ep8I=
X-Gm-Gg: AYBFou3h1K294rok6epTiOMLEhYkaU5B0d1+V5hOsYbFC9w1Jm4ag0nuwHqHbK4D0NR
	nKeUckWOjVWlZamo2wcYTxQZ0yAll8GniNTH8KceA96Bgn776rO06lAflp3X8uVDjqrF4BYflT8
	e3HRTS0+FFDKCsm5CX1pC355tICOtGzmq4y5sxDIhmgAPEgQhRmS/4rLq+0wqao/o+Tzw5u8mE9
	8jW5DcyRI17j3Usji8Xn5q85F80tE+Jdcobk5Vi8U20wECULO/3iXI3oHhsTXGCIrdcZ+GLRpAV
	s07Mp+X5lz26guhURvvnz0ir80an+BFORMRT/kJ0F8UwydRtDnLylpWbcePu7iKdIvhhuhrKDsE
	uD3lZfIFI+1DuSNqHmVj0PnFKFe0zUsExRJCyCuDI75U3ZXjTknsocS/3sHcRRRczXnCB39Yglk
	hDAApTsBO7LaS9ushjDl3Qdt7MFP4DdEKqLF3zBuYoW+X83Yf2W5E=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr21983206eec.0.1792143909709; Fri, 16 Oct 2026
 02:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162> <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
 <20261016023418.GA3746059@ax162>
In-Reply-To: <20261016023418.GA3746059@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Oct 2026 11:44:57 +0200
X-Gm-Features: AclHuK_1HbfCKCwQ23wv2v1S3AsFdibLw7WDClp0pzQ9hEN_e7mFm7luShe5I_o
Message-ID: <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:34=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Whoops, I am in the process of uploading 1.99.1, which should allow us
> to cut over to LLVM 23. Thanks for pointing it out, I need to stay up
> with Rust releases better.

Don't even mention it! I thought perhaps there was some reason like a
fix needed -- if it is just that it wasn't updated, then that is good
news after all! :)

(I am happy to ping when there is a new release if that helps or
similar -- actually, they follow release dates like a clock; I even
have it in my calendar as a periodic event)

Cheers,
Miguel
