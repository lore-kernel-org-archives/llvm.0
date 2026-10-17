Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D6E3B27C9
	for <llvm@lists.linux.dev>; Sat, 17 Oct 2026 16:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256325; cv=pass; b=VzNQxXGLAtXkfVhZhhTusX+GbdAyUFkk5iOVRlJMh6FspR7OvxPfjrWeC59eJ59Z11VH/UN7w/yVbSzLJxWw3qWL9XYFlf1HcXZgxRPM6cTufABU0InX/Cl8peHWlGR1zJ32uWezyN0xQtmfKA6+1uKxWJ8pZ0LrPhx9PaBo/eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256325; c=relaxed/simple;
	bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVM4u4ADx+Sp9zxGAg4AdzCQo7nHji1mvjWd+5A6Uef0ARWwRDZ+YSMe9HCCSQCIceutxj1Ene66mEBQDVAgf9sOxen9V/9/Nn3Rbp5bXjSKFgl70Nj23AQQgPLl2qOkSnJ3E5kxNnk6ETE3beNrD3Wh7Qrx3PzBXQIUSOy5xfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHHiZP2x; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHHiZP2x"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-313bab9cfe7so103906eec.3
        for <llvm@lists.linux.dev>; Sat, 17 Oct 2026 09:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792256324; cv=none;
        d=google.com; s=arc-20260327;
        b=pVAUbOPkhMJWA81h9Y6etPMjKMjtUusAwW0TJgmo2JsvwkjEucAl6RMXPp7AsSD+HW
         3qgf/ypridW4S4rZDYTm117QmXBO8fdb/T/lRqqhL7IUCT6ahyiGfzu5oirWzmOVdYCP
         t1ID/9xQHgdC3RnzQdt9otnM93STn64/PVYdP6g/fyLre9X2QqX44S0eLYeXQiR7GQJP
         P9LFLIrHk4qRtKaOgnpKAk8bDqrxSt2KVvcJ8ARmiF6UtGiJOseFm05YRDuf3s94deZT
         YOnTPqQcciZNhcWRKY/twvMKF0Bm2KIvxbXQSXEhLAr79Pjdz10e6DoBusUN5oXplfI/
         rJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=GpuxM/4ccR5rd+TQ4ufS5/xy66Vu46P4sIrDFcQXxETOrWegGHiXUw7KWBLon8ML0H
         I3fuM+H7wWvWeE1ZxJSbz79Amu/F/5oUFulOfw2yPmOhFIF1Itvs9Udp6s/Dug8b+lx9
         OLQV2917y/jp9Ct0Y62I1R3hIAgrdTH8FRKBcZz1ONXRPo4lH1CbpaRvUWYuFvIbKDdn
         ZSJaJtBBHR82rPbDkKn0ZSCsUgr6b+EVZkoJUjLUI/zDShHJ4lOZ8/33kIJmTfy0WbGJ
         oSLXD90ioqXLftpm1zoJ/rEHYDIgQxhJMM8CjDEVy0E5urURdYaACw5kZ3L+a9U4C4pL
         uTzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256324; x=1792861124; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        b=YHHiZP2xx++JsGG4WuP7pTOKeGIynuEb5Mx2Wf1xB6JA/slIAe5c+LlqHJN61OJ//y
         gV4N1USHhb7P4mNxYQYv0BFXBn583qIK7bhesF7JQ26tmWHnKLgm2BKJszTx0in5yk04
         sch49j3JX0bpXIdgvh++hUTEfE1KeEvpAvD5MA/A4/NOGzK/cIYhwZQz+XCC4U+zbRMf
         4w26eMOW3ZMWwDvHIufvyhM2xPmbThGIAN6rFburk6WtabR/pYyye3dtB6yad94w8rx4
         ZpgtvNfTo9HfFVw0YgZSvXga3vvtW3w888AZ3YuBmransh2HuJNs1I42jwGeDxbjBzDw
         +R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256324; x=1792861124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIhwnLqXpvnHxtG46G8WNHwz1LYqRAFP+Pfo+qHuE8I=;
        b=CJCiKPxuYOrzLAbQGZITBYuFDr/8EPIkQ2rPzUUqIS2kaenKY/U8Q9nQsoWFvgAQfq
         LnQRIOd9Y3hn/DCKtuY+nHVTSbXGBBNYdU4ys0FZlzUYgZUHjspekd4Vg1Ai27NR8yg8
         n4EAnN/nJLdG/48kpbqXo7tZX7UAd6qG26yJSDg16vt/fwqIGAcvwFNh6/RiHADbvXay
         x4WA5M7xPbbH5s6AD3n/bRhfvUHk80XHv5jqMgXfGrvEIkmg8uyMAKiTLKtgfoO5I13m
         ZJTeOyjwTV5vjGZRhxATcXa/s3dIKAwunoxFGPGmiH5DS1t/+5TpSjO6GavmtiAroqqe
         5MAA==
X-Gm-Message-State: AFq9FYKO0OZdjdAMKb6hjJmp8hTsVx3K7zqQssJQABy+lLLU3o57qZdS
	uODyNmnXJK/pba8HPPSIJyhTDts3ZtPV3UY6ktZOAIf2WEUL4UYSgP7+fS+Ji5pV/e1BmJ6dw4F
	on59jnnHrDphllnTfB1Lt75ixuYQidzp0Uvbr
X-Gm-Gg: AYBFou2gt5FtkeW/OWQDCdA8s0lwk8MCbOqowOp9WuaaWzvz+lYzSqbC90DWw1Q6kX/
	W6vqJxuf0A7TZWPg9NJScVZnQbSddLDtCSqACoyo3Lt8VhHRiAtvn2O5dfwTlKYWUbuxlR8LwBh
	lKllvdPtAy90wnIwfh+Wy5iVWu+UpPYly1EreW8LqBZucjKWImtzCVL/gcNldsHsUzi+Z+sIIRf
	LqFcqiN1bM2FbrD6I8/EA1IXuoMItH1FFhFzBU3jyXZDg0sqrkgGBt2uOVxxHpIYRCop/gsIbym
	aipYKIFEvhmiFmWoouw3sEf8oHHDkzybV7gFjudtL3yujARqw6/CJ2+BSzyfvd0OVEhfle/ADBz
	Nje/5+T7fSwmXwgWqmiH1sFhGCY0wtHLb7KG3P2jlOk8Iu/1LXXv6adfirDO2+mLeXuEqerPKHn
	K0q0LECG3IKZ718XxE2Lq6ZSBBOHNPy+NhnHHM7woiBcjAbxj9KtA=
X-Received: by 2002:a05:7301:2706:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3619b601fbcmr6726101eec.0.1792256323689; Sat, 17 Oct 2026
 09:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014232030.GA3382959@ax162> <CANiq72m14wLrcr5rfN2SADH+D6oQDp1o6R=d_NNkPkarS--ZGw@mail.gmail.com>
 <20261016023418.GA3746059@ax162> <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
In-Reply-To: <CANiq72=A-vC0RTav4v5wL+P2uYKzteJ2M+t0UOTXNniLCjh2pw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Oct 2026 18:58:31 +0200
X-Gm-Features: AclHuK8xCih_HLKp1JdFCDIjoCYLnBEawHclaeGCvL0iU0jGmEtTCsh2gnAWMtk
Message-ID: <CANiq72mhaCSsMiXJstWMnvt77y7jJvZsQwnNCACs+YYioAoA4w@mail.gmail.com>
Subject: Re: Prebuilt LLVM 23.1.2 and 23.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:44=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Don't even mention it! I thought perhaps there was some reason like a
> fix needed -- if it is just that it wasn't updated, then that is good
> news after all! :)
>
> (I am happy to ping when there is a new release if that helps or
> similar -- actually, they follow release dates like a clock; I even
> have it in my calendar as a periodic event)

By the way, the Rust 1.99.1 + LLVM 23 archives you uploaded on Friday
work, thanks! :)

Cheers,
Miguel
