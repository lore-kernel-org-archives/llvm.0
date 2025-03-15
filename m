Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F118D64B;
	Sat, 15 Mar 2025 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742054012; cv=none; b=C1aJIz50GKYjyY9HjMlSqpTX+UXZ4HluoAzZ+hHmsZJ8RrTgkFg8cJAt5Km2T9y9fSGEFuExKsNKaLAI32uNZ3llchZI2l2aIc3pRgYwtIZPQn7thcdOrSuzhqROyulqo93A3cpOP2OwRgjZJ71H4mLagaIMGhFeluP2xBI3J24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742054012; c=relaxed/simple;
	bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrybLdDCclDZg0Mh/FbqNw/A6Ritc0IFe3h/AoxW8M9Ok6LNYSqWvYBQB1Ex4pC6JIvnqE2juiMQn5rnXQw8CsyBdbhvR8O7/vyS+VUXhp+XYScKJsgTJmoJbPEnAU5lbqKhB4/9M6OYAZrkPeKTclGpPbMVMdU0fkMk0kwF2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMHDNJA6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMHDNJA6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso135904a91.3;
        Sat, 15 Mar 2025 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054010; x=1742658810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
        b=QMHDNJA6cID1UHXXv/n22XPLiwDGa/dzHAntfuJ+Ff9qKzzbZ8IsNyjItO8NFxTMsv
         t6rJjdMa853GrJ43qlN0GcZHqjFZGwTA341lJJmF1s4vxTTxTIk0H3zWGIIsUBAeQsTd
         5o4EdTo4LdMMpwXA4JzLRzGq2gmcuxMAp53QsU9dOm9fx/G0+4ux6sWyLISP+7sdPntZ
         +4xh73LinkTAnbzEhNNI1Kl1ZlVfKcgYldA3IAyZ6vDYQ7FuvmAuAqTX7A2pxMspnawH
         wonGAwwUxcLWKdOrFLUWV5juP/99foMgsEC5w7/ZIc94xq5J87kyFonsKY+f05P1hjRm
         FKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054010; x=1742658810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
        b=aYmbet6OVi0kNEtnVakI/+5L35Kd+8gGgXAq9tpmx9ycDcxmChN95rFSHez2Wz/G88
         KaJsM2gfUo54RjQLQ/3xOr13FEfMcTswL2RnUMbTAWqFouFMPxdNuwVRmbhRU9Ku7zhc
         vrixin+XQOeC1DXaJ2c/ASgDVVZIfV0l+NkHwnlSN3Sf57EkOL7XocXCKgGTFF9nDiW1
         UJv8sqk3Ph2EUnewjPAYnNaEgOKv3+lCcMNjhFV4cT2v54cShr9r5nbvOFLuOqZ7OUwB
         nkrkhTUJbXho9wIHkTtIGM7+N46EQuSi2UA4hWGHEN0PCPEYuAwnCfVOA28koR8aIF9c
         JaIg==
X-Forwarded-Encrypted: i=1; AJvYcCW78fvy/g1xWE4OLiCihAy96CaWeigDF0VPD/MhLZD28vK9HoHt/TyH9GPmyNJi7THwEwl7@lists.linux.dev, AJvYcCXMaKOCK2YCiA189zJIWMsVU9mLbHW5rFuIe+4U6Nu6PdBn8KV4UwAo3T180rgnoAeqqlt2V7W4Snhad70k9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzU9MonnKgibl0jCWQQteCSVaNOpZwdV7grJX+Na8yTe07wbxNa
	0Gdk9quuJGB2eo2Tp1OnORJQ48kdpm17Rrh2PJLKU6ciqWzp+IIG53OX8s6cNIKBlERCCuxDg0p
	QqNuxAhM63qCrK4NoohM5pKRROOjv20SR8rw=
X-Gm-Gg: ASbGnctPeug5YJxNJA3u74RDdMuF8BpM8KDy24MAic1AB8PKDNlSd7cUcFTkvZaHFr9
	L20jqByiI68FZ6ouPMDomsLUnXSrv9xfSvdLEwEjYoMaPAOWGwilV45Q2cseBFjcsKn2mh9zUR1
	cYmH6wCi0OdrJBo2mkAmoiY0otSw==
X-Google-Smtp-Source: AGHT+IHoJdqiFffFIEX4PGH+eNGg8dU9mGGXsxE9RJVlD3AJ3VsW474CP9GQiqncyttxQgyMVKiY1B3MtSw9bjEU4N0=
X-Received: by 2002:a17:90b:1652:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30151d4c068mr3167505a91.4.1742054009887; Sat, 15 Mar 2025
 08:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl> <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
 <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com> <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
In-Reply-To: <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 16:53:17 +0100
X-Gm-Features: AQ5f1JpLxa31TkNsANiRg7vQHqmi3abo8scORrGuk6pzhcuxvWRzBjzKlLEuvo8
Message-ID: <CANiq72kL2stNAfmm2HxMXntL2vbHkR0rxrHMRgLu0iG4+mV=dg@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Mar 2025 at 11:16, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The 0day bot provides the reproducer, which only executes
> "make olddefconfig" && "make prepare".

I got confused here for a bit, because the bot runs other targets too
(e.g. `rustfmtcheck`), but I didn't know see it in the reproducer, so
I thought perhaps it did not show it. But I see now that the
reproducer scripts are different in each case (e.g.
https://lore.kernel.org/rust-for-linux/Z9IpZucc6V067mh6@rli9-mobl/).

So you are completely right -- what happened is that I fixed the ICE
issue first, which I checked did not reproduce when combined with the
`--test` flag, and then when I found the second issue (flag not
existing) I didn't expand it to the other case that passes
`--remap-path-prefix`. Sorry...

I am sending v2 -- this time around I will do my usual full test
matrix, just in case I am missing something else...

Cheers,
Miguel
