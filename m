Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64660BA2D
	for <llvm@lists.linux.dev>; Sun, 20 Jul 2025 20:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753042363; cv=none; b=jeMSiBiyE6wbCEC+Yq9Vh1IpoAGGllXX6jyay7QW4js55NfhF/REvS0ByKjQ8WN36dpFIJv8VbSp8YdTOWP+0UfKapILmaJ+WwJlK182RMKPxJuGVtdp67Zi+sIbg50YxGR2w9nVLlcVtfdWoCrQJ8G7Q9Elef104LxNFH5b2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753042363; c=relaxed/simple;
	bh=SpnUeWa4iBYi5sLuPFGfCFkry72Jp5Kw04SeOFJYdQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AH2g5PD4wFdETkodU5Bis5XuqsIbm8DeL3D92PZz3QUlfJeYqnduKKZ1rnnVdzwDrEcyk12HxhSMUybNARyLOT2K89gSXo1+oE+qqiJW1u3eMJu9kYKP0+8jcH8VBSZyOvaMAr9SU7lASgXyRB7e0q3QAg2bO2SQpmh88I4GwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/Pv51c8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/Pv51c8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313290ea247so636866a91.3
        for <llvm@lists.linux.dev>; Sun, 20 Jul 2025 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753042362; x=1753647162; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etzXpykV+IAsHrqvhUJ2iZLlQ0JMugH8eiLxcqfvD5k=;
        b=k/Pv51c86yFpJyuMYmNHpBRsRVW7olRmn161zwB1Mmfa8IXWlDCrTZhzmy/oiXJCI7
         w4+BVegEZyuaFQ2MBLQAngtCyvnY5zEdMu6ZCStLD6DMPELFWflzrZrGD9H84A1tcGqZ
         kCc4qFqO5Jhza35Z20gqLvhJW8u53k2X2NwpC1B3Owb1b/bvbLHJbC6RUBECOMGxs0lj
         cmfeKAYUUYetVj6HdnQjHo9wtasu7Fku9ql+r8oibxdMvxz8DaE9bvNVKOsXqDUkKuPR
         8PeBPJIUwpqJA7NdgMw3zQAVnSgNIRCFUXj0Rr0rkaE9myyqGk0ACY05K207Abswcqtf
         WnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753042362; x=1753647162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etzXpykV+IAsHrqvhUJ2iZLlQ0JMugH8eiLxcqfvD5k=;
        b=nCIx/QK5zmls5qXqxCwT9e0YI7wjNATbSG19Z/DxHQfD9PGFS21EK9oooxCeLoudq3
         m4g5FkbaP0XBoPeHTq4cUvkca2kEROztmJEI5ERRER2/m9lfpczcBACVinADhqERX8Lt
         Vnzz/BZLRFFBvzf+fPFfuo4Wex0K2v8/Nt1KHC/kVrU+Q59wopeU/b3zxvFRRggtYtD0
         Z8/MBVNciMefFpOmBrOz0JncxqL/igR2c9QGOv9OB8KFPxTSw6hN5JaS20GiPVug9cfw
         PtGBHHc46swVfJSsTa7wrCnLiEifb3oKfraaeKIUhjfvvlwxkqw4FBJuRCpMQz7ubDDL
         cBgw==
X-Forwarded-Encrypted: i=1; AJvYcCWHSI4MR8FzDOFxv9OkUyal7veZ8V0yzoSD48UraATgvazmOGRsJGskLQYdrAf1e9qGcRCp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6jRwsdmhyVt90+TnJty4OFcza5BJDGWO9R/tdpsaa7ADYdnBV
	o+33lCNywtZMotIrzr5P3wfg9Q+/tgyiTpAB2K4xsomzD589B2j9430I+3Hiig7kPMlnhmZ/5Xl
	i4PdoKixfu6xOGZWupWhXe2JCgWUFYyI=
X-Gm-Gg: ASbGncufMdisMkFsidnbK36ogTCfwSX2BdmHiadgco/IIltg9tgzw1RGwgMkk7zIp+K
	gN+2X4PspKN9xCKfj+w6P9DllKsPSG8WkpBEP7MSUlBODQ6ykKaUkoZMettyeeZEJJTs322LjLt
	dUZsjqM7FYF9AoTJMFBd3bmHAN7nvpgSO3L7jV2afknyj2hIFn2cRTho7Noj8ujP0yuSBSsaVJi
	7+afOOR
X-Google-Smtp-Source: AGHT+IHaf2vQgbbOXGHUrdq4gopF+bBKLxRIRv2pUm1D3d9SJ9v/Cu2UvI6qDhehsJ9HXQbSIbNKuJLWbXt1J/Bgey4=
X-Received: by 2002:a17:90a:e18c:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-31c9e77394emr10209840a91.4.1753042361675; Sun, 20 Jul 2025
 13:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717085300.work.146-kees@kernel.org> <CANiq72kPmb+7Ygk_Qvsiq+22EJVSPjjwn4whdLuTGCPwvTAssQ@mail.gmail.com>
 <CANiq72nqg79xB=iV4GCH8XCak2jCn+XxUX4Hm1s6n5L=5cLuvw@mail.gmail.com> <CABCJKufPphD3en91N89yekUam4Nv7+C7YPJMv7h2SmZcyhGhdA@mail.gmail.com>
In-Reply-To: <CABCJKufPphD3en91N89yekUam4Nv7+C7YPJMv7h2SmZcyhGhdA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Jul 2025 22:12:29 +0200
X-Gm-Features: Ac12FXwyfbcRSAsV9U7kTZFZ9-dp7QOJairlY32p58YOVbnTtpCxcLWD7oKvd_E
Message-ID: <CANiq72k6ggtS-TCnws0xY8K-w=+vjGSjaXR-OO5YG=DGAjnsug@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __kcfi_salt
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 6:48=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> I would definitely like to see Rust support for this too. Otherwise,
> we would have to drop the attribute when Rust is enabled to avoid CFI
> type mismatches with C code.

Thanks for confirming -- added then to:

    https://github.com/Rust-for-Linux/linux/issues/354

I will ask upstream when it lands in LLVM.

Cheers,
Miguel
