Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5200198E77
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478374; cv=none; b=Dn2px2Up+GuMazXPOzhxbDEPUs29EhW/UxT5Jxl++mXQHs4omNolbfKvEFJci8eosnY36RJ1liyrco7biXNmtCCAovBWJ0i1yLDO4yiCRtjuZ/bU+t1p+zq33JYVdXcr1cZjhrfdxRk2hq/UerYzroByMRBsxPA02xV7QawBn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478374; c=relaxed/simple;
	bh=SCs06lfwISgbAl6dysqPzcHli4y9o5NXwiDyldWSqXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuRJis3IDHRbIIBAkPc8G3zQDMrWGJB8+w1TFX3UeX/qs7bxC66LmCENw1F7RggtxGtOu97HeODQjagh1Zpk/TjVQXFR91k+K+lvp6CNxdYKkfgZK3OOx+hQ/pgyy5/FwQ1T5qtnCujEzJn/nfbtlJmuNdpcW1lYxb/LmwcDN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks+wqF/J; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks+wqF/J"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-717839f9eb6so772673b3a.3
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478372; x=1729083172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=Ks+wqF/J8v2egDZ2xfGPArmptN8Nqt43XuB3wZUM4VfwmaLc0DDO6ajHdQv7e03z50
         ZAL5bXFHND0MBnfqKpPPmcxbeTSlTVXUnY8/ZoL2VwgWJM+qkl5JgmLBPybOsaROX9of
         2FBq7C9334wZGB8BxuL9BOmRXZ9BnOn9tG7SHV55Kdl56+9K6tlRmR4m+VHUYXvBMF0O
         WqcT4Bj9q7qcjZbseUHWstt/cpxCY/UJ8/SR9nSbLTC/ffrblzyjXCwtqyJHNgm6ENZ9
         MkoLJZSllpGe0HXuV8CXBzoN5nXw9bn2lj4Iq3G4Uo3d7aB+BRuNu3cp+W9IpOD0xNKF
         Aiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478372; x=1729083172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=OeL3i95hE3awf6NvmKmwZzC/p8vscAGz+OeC9Yp7ZDO/BHuocAX7JfTehn4fNFhrFS
         KbDSw1IRCrBziU/N3r7qsQTmn7AiLAFvU1kuvq6px0iUvI454/6nlDY/0JighVvn8EGn
         fzbbt6EQ86mN0in0yduavv1oen+VCRF1eLtnie22VprMpMe0ulrZ2LGkBXMbBD4AMKiK
         Zjg3PsuPgUTzd912ymiyGP37Icl6Cnu1DX/b0myiJ1OtMo8iHP6FUPv/edJsaI0rxfbx
         479KQkLMuRwzn9oWdXmSxFbjMetmFcSGkJA/tCQIV+wK4Jfd8SzXOq3g7CyR9spPZI74
         g3uA==
X-Forwarded-Encrypted: i=1; AJvYcCWfZ/HieusQCwp4rECKJfro0nFo8ZzQoMbUoX6gi7MwdQ/RH7t/db9j+TobeIM5eANDhT+6@lists.linux.dev
X-Gm-Message-State: AOJu0Yx59GW0K13yvmlGEsLkKcaENIMwjgJTIAC993JkedBA4WF8rnlK
	gdjWzL2T7Krdu3Wn+EIp9f6LPNgTQWacDlgT3e/uk6dwMN11CfABUOnRCPunN0PH30BTVHkO0YW
	J6yS4xI35GoQ1nWgNKFv9YPt8rSc=
X-Google-Smtp-Source: AGHT+IGDZlk0vSxNbCEp4HYgbqEEEFHlGnksvL3nu9Tb4gLrogFMgZPPcAKSAMsknVA0x9W3GfxEWQHF/YqSRwqrI40=
X-Received: by 2002:a05:6a20:3948:b0:1cf:308f:f87b with SMTP id
 adf61e73a8af0-1d8a3c08378mr1749012637.4.1728478372129; Wed, 09 Oct 2024
 05:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr> <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
 <20241009-tamale-revisit-7d2606c5fdf3@spud> <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
In-Reply-To: <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:52:39 +0200
Message-ID: <CANiq72mZh+=18tWY8E5xA18E0SRQGO+ApgR9sU=+3b9jrVGTDg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Alexandre Ghiti <alex@ghiti.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:34=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Ok, thanks for the explanation: do checkpatch and the documentation need
> to be updated then? Is that a known issue?
>
>  From https://docs.kernel.org/process/submitting-patches.html:
>
> "If your patch fixes a bug in a specific commit, e.g. you found an issue
> using git bisect, please use the =E2=80=98Fixes:=E2=80=99 tag with the fi=
rst 12
> characters of the SHA-1 ID, and the one line summary."

I think Geert (Cc'd) wanted to change those docs -- I am not sure if
the idea is to go with 13 or more, though.

In any case, even if there is a conflict, we have the title.

Cheers,
Miguel
