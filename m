Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AA36894D
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885411; cv=pass; b=YAvjU0uI79KWMgmQM+E1lOA/elsKG1CX13P5if3GOidfs5gyInYeg5uqGPBre4DF19AmmE4fh9OhOmBOa+vydTb0G39PMGMmfiX0FctLph3CK6fhbZmv5JmiG50faj/lRt53Q89okpref3pQ5z0p0cEaWmVYcPpNSOvYYZqWUhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885411; c=relaxed/simple;
	bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oW1ufAhrXJnY/jEwxU1LujavLSfW2eAoAZ9OhOCcgNemJTXxMN87DEtuZeaqHOCmW5wKknCnoNRKyVJOLIqZ+9JUibWVjtqnSMAfzetsjHtl6wicjkJKGJH2AcA32cRmZd6qEo1GYerVLZ7R5DfL1I7NXl4se+B2qJZARdCRtnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKdVsPzd; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKdVsPzd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfa33a983so934119f8f.1
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 08:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774885408; cv=none;
        d=google.com; s=arc-20240605;
        b=ff9xXzalI3zYLm1LU3MY0QKktdTkBFOES0Vt9agsCGWeVX/7unZrPCEfM55TH4WxHD
         OpO8i9xwIMi1AGZsiklkz8pwQATKUU7/HBJbGFDdTMcWW0l8JCaRpvB2ZwKdTcGaYvpo
         08DZqbVXTylEiHJl/AfHoy3ndLpDv10ubMF7PuBpNzMkdvjlacJB6m4vzgQv61JQJteK
         b8J4QhPvfiy3zQkTmK0ZBdZtCQTb5cxUAapTaeQmUjrY9mWd+WhCE67BFBj1HtF9VEY0
         2zoyoN5URzhwFJpJGRAQiNvYd/ceCEZCn5oFRwAbjcDSRakWXMMxU5Wd4SIjMF53t938
         7LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        fh=p55FfjiT3ZbpnttH6AJ7XEu77rF1I6+chGh6f7Pdgts=;
        b=VAqxrwhwad1KbbRrs6Mzfl7yLxlujEY5BIsxqapWqfsmc4OWZq/MnwzCH9xz5ALomo
         7XC/Spl9OBbmWvfHWnSgy4NHGvg3rUvAoaALp5mK8akiRyEfTpHv7CBakjgoZ7pEf+1h
         MXDEFNiG7AxL5Kzkw8ht0GTDL6ds/WhMDtW40LScaJT5UFQfWFeyhwsA+AgXje6Pg8aM
         Q/kiRLQgfrehKzebg2JtkrH63aqG01bYaa9BcE9lpPBlmqj09wSnD3rLri9cuYICCMfN
         IcffMtY2+ZY1Q6JxcMJwiFpmU93f0tBWuNSICNXVKjsuQhSsSPxdeUxrhnLewpLgHzIe
         WlRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885408; x=1775490208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        b=TKdVsPzdjHqSOyTGDl9NqACNWLxmaxcLzD0FMDtIpRNYlOk35MfwJR8KbeZwGYLJBo
         +ODcP1sK/vgoFGZk+rgOk649KyjhZLI6xhxzSbwChvcPDnTp2W4l1IEFuztGx73b7G4a
         X4VBIYifaAwqXQje3iRmsobs/OuH5motTEoAaxENhoRFbhGW8ESXp6Y/QLvAPP7HYdA/
         Uw5Qnvm2YT/nQxqiE9i50ABo9yQHJytU046v1i1CLO2SW4DW+GwRsm/GnppuFDc0ZqSK
         ZfY/jHP9iDK/tiw8qggn0FYpLZ9rWEU144DINwjurZNNc6izSXftZ3TIZnCbTi3zTu6a
         zoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885408; x=1775490208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        b=HtyMG9f4pO52VhZ0SYYKbCSnPci1qkWpRnGLrHXCzhRqJGMFxGTexeIyiJa8XZO5cl
         0hlBFrUeQ/70TebGgR91sQg0lYQKLggmsEGmDGcY5d8tsYiMpAbcNiXeyQEZ2KnKcpYZ
         rbVVApRDJ1vFEtza5cbcyEy5Yrf3x4wIQAVdd3woptO8P0ElWH5COCDI5zNEgqjb/TFB
         wKPMhoJOfAq6Ds19mHHxuHbVFZalNSlU6tHNZSvKli4OpWVZpMm8ztKZEHAIZR03PEEN
         PDvv2O7RZ29Y2Aq477tQr7PIO3lk/6l15WDuQ1ze1+cTDdLLQbz+c878WmGdjotzMbGQ
         xH4g==
X-Forwarded-Encrypted: i=1; AJvYcCV68/STs6u6VN3SVUTmaYIaX7zejhUCPmKkNs7rX3/YTXen11jobUgWmjMSDxCuAHAnJITL@lists.linux.dev
X-Gm-Message-State: AOJu0YwLxKlJXvyQCVz+bpkqEFmn04Kzsx4wuJDaYCqYpSYg1o10S18Q
	j8IDdCW9YMoS/usElSSuGzkf9PACQW3eM3Ps86Pg+Z9UHTfAQzNRzCRH+hJHUIXleoYWRw218uP
	T/gH9/UCq73NjyWDHmVGsVbWfMLrIsQk=
X-Gm-Gg: ATEYQzxr5AD8oti5KCfulCkMBZzCorPd0YcQZ7MqbdTwUIL+NrQ2SGKl+g/D51CWhnP
	MP2JQxDYF03naMfI+gugjDWxAaJAAlXLCTAgj5KbrGpErqqgJ1nhx9oQTASvtVWnrNxBcGapx97
	mjdLdRnIxmgWfUHQhRIY8FiQqydi1QsC79nIZVMJC1bNb1mCAW6IAV0sNgFhXsQoFwANxKAAXln
	duR6f/Ge2SBc/DfFaEBYPH7S0B2anLe4KDQ4HW45ljbaCQLTCxY6ut84OdWPiUMTdDWNz0uNT6O
	HKdRzfC33kHxRlKO
X-Received: by 2002:a5d:5f96:0:b0:439:ca9b:1f61 with SMTP id
 ffacd0b85a97d-43b9e9e8366mr21373296f8f.17.1774885407741; Mon, 30 Mar 2026
 08:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324224532.3733468-9-joannelkoong@gmail.com> <202603281401.HP3uX5G1-lkp@intel.com>
In-Reply-To: <202603281401.HP3uX5G1-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 30 Mar 2026 08:43:16 -0700
X-Gm-Features: AQROBzBlRnEc1XLiqyDMwQ1GSgp5676iHS2GTSkOtDm3v-siK_erACaW3pkAlq4
Message-ID: <CAJnrk1Z=yMy3FSt7wvCDgGCr-NQD4M=na2sAGsRM=KoTH2Nazw@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] fuse: add zero-copy over io-uring
To: kernel test robot <lkp@intel.com>
Cc: axboe@kernel.dk, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	miklos@szeredi.hu, bschubert@ddn.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 6:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Joanne,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mszeredi-fuse/for-next]
> [also build test ERROR on linus/master v7.0-rc5 next-20260327]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

As noted in the cover letter, this series has a dependency on two
prior patchsets submitted to the io-uring tree. This series is for the
io-uring tree, not the fuse tree.

Thanks,
Joanne
