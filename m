Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CAD18787A;
	Fri, 10 Jan 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507811; cv=none; b=gdXcIjjNU104mmA3wP9L8QaphBIwzbMOunxEQAmpMHqjzsu4RRvklj8211gQMReJAAfLGfBG38MDa/MSAHq088ROmyad4i0FdGfMk5KKDCRn7js8x85ddch0orj5jw6XrqtQrJRYjh+2YaGoPwlpDOmcDnB2L5HKi/vlsQfXdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507811; c=relaxed/simple;
	bh=n8qQb0zR1hYN5wtZf7LW+CHfwc3NWyAOaCCpLXVYVFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8e5BXBcdYEP8ksyAy7NfhPDRLwJlNzO3ftCpVHyVUtJGmS+Nup6LWoEjGywSsw2CNx/MUtyiteIpTQ8V/bUnTWBuZtetfEm3GcnUv5mS0AlFWXO+xvq/CHAwvUGos8TD4tG5PB8iK0xR16XpsX4US+npDsHEIS8XD5+tZeo4GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaQ8J13U; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaQ8J13U"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef6ee55225so393167a91.0;
        Fri, 10 Jan 2025 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736507809; x=1737112609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2xATKuzby+pI+lcil7Erl5IxGsbheqxq50Sx1NALsI=;
        b=VaQ8J13Un9SKFG5SMZ9EB2rZNuCAqo6/8B0MIUhAunl/i1lFiun060GySwnwxr1Egd
         2wbRB41HkZJKCVfgbbRZgmRI0yKB5CWnDQk5noqjNHnuMYQNGpBSLzwNMVCISH8DWXmF
         qUWUm7wrrIQxAk0jwvHwGrN72a6IIByq4z2pm611nPtbnZwu7ZKpo9i70OZV2Dqk7nTs
         61uQ9FS3joDDne0rZ7Eav7B3NvGvFepuqyTG6UsaUxeOtxdMgFPkPuIDMhXErHtgBkCo
         SRFRZf9mpKxqwZnsc/DmvI2xfyV2JqxiaOxw88KZS4kIon85M797BddSTUq6hHdOHrMu
         deOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507809; x=1737112609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2xATKuzby+pI+lcil7Erl5IxGsbheqxq50Sx1NALsI=;
        b=ZqL+7Bx21kTCIbOjVBcUY+o72AF5ZH/b975LAl214WvnGpzbY5in9456VKI4iRNDcG
         pPOfTrILIDdyv+jryZpSIodXHiYUlSiZzn4iSay534u8tezhxRv27UWuLSW11tKhvdIx
         DqxX2E2XpPQ8mda1ZkpckcTVUwVaS2g9iZUh1pDhJ0iCHOGiXLm0UBmPIlsBClASembt
         zKwlq0CdiBIwkIFDqWw2YO6njyvWa1h8Y2lT6JjPFnNAEvd7J1N2A/MdV9EbVXSBS5Lx
         fcDSczfGzPaRtgsP6AVRrQ/soCCUimkWiHO7eR3kQMd12LOMfngFGXGwHy3ppoBUuhJD
         s56w==
X-Forwarded-Encrypted: i=1; AJvYcCULrHbcejP4WHa8ZgKCSQtFsX4p/rdQyMAZHCzp15LEu8fupSMZWdR7DIKvOHhjPvG71wS6@lists.linux.dev, AJvYcCWOxZ4PW5CKq5WL8YqEG+yOc06FZ6wetWkO65/rlJYSDVYr2xERLm6e0dhsQP12q8fkNIS+WPaiGREsCUVHwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwPqzjBddC7WCwHlUrg9TgsLmHCUtTvptBCUlv+ytYbbuLogkQ
	bZnwSxFcKcKQwod77gJ/E3AAiYe1IXfHo7yx/Z2V9wdoGIP2k48n5g0z/jmuDOinjGZpnz4IT2L
	yNuH8UT7uzpYs0haB5lfbqRDQIu4=
X-Gm-Gg: ASbGnctviuiPnc69ayreEF+YUUrJ66R7NgpLk7HKkh8c2VErHL6CF+rbVtTt5D05Wor
	IutJLJbmy9x17qxROZTL4orUmgM4OtrAFZLLo+w==
X-Google-Smtp-Source: AGHT+IEZ3LiCgaKM2pt11/adB6e7hLinDuLKOXwdC38XEzNoaeZ8cYtzlq3RtjyBIypMRgvoZ1kBEzAbvnGfmX2hTRc=
X-Received: by 2002:a17:90b:2709:b0:2ee:d372:91bd with SMTP id
 98e67ed59e1d1-2f548f1a252mr5717385a91.2.1736507809112; Fri, 10 Jan 2025
 03:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501101527.4qvP3A25-lkp@intel.com> <1481889.1736497282@warthog.procyon.org.uk>
In-Reply-To: <1481889.1736497282@warthog.procyon.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 12:16:37 +0100
X-Gm-Features: AbW1kvasfCYeen7KuyPlceWOHfpbIBco9f861jrTpVr5UMbMZS19ak8eAF_HwNg
Message-ID: <CANiq72mGE_UQsXpP38XVdzGS5MO_=Reist+drLfQOqpQ816z2g@mail.gmail.com>
Subject: Re: [dhowells-fs:crypto-krb5 7/8] net/rxrpc/rxgk.c:273:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
To: David Howells <dhowells@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 9:21=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> I think this is a clang bug.  The lines prior to that:

> show req being initialised directly above the if-statement that is being
> flagged.  Did "sizeof(*req)" cause the issue?

Note `ret` vs. `req`, i.e. it is complaining about `ret` (the former)
being used uninitialized when `req` (the latter) is true.

Cheers,
Miguel
