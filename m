Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35261AB533
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325619; cv=none; b=sKSSLwXFjbMp6ACBpg34pZuqFQcUYuvxEUOBfOX/sTi1JLn43P0kfQe1P19XO/DaZYsy8d7CLrEYDMvek8l7e8efCJvyOBGDautsvaQiW8AR2X8HvuPZ9JP1HwVMVLvnve/UhVL/rjxfoN4sdmPxFbn0AT5xWRVgb9DkJaJDVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325619; c=relaxed/simple;
	bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeYmw0nuailqY87W6OtJ6apN1iZ9bAPSqm9x7pDj5La65kFGOjkocDj42VPDz02RvDdymjNqkg9hfn5nvd3cK08f6xrH5CMjw/pqtw2hAiaQGekU3kbuDSVpN1Ea3qAb2a0d8Oy2301jINF3IOHSoda2OEfWE+2tWVfeaUbxpi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTT3jTgz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTT3jTgz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso118733995e9.2
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736325616; x=1736930416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
        b=hTT3jTgznnRY7SDxdTXAKGaqBkrZbX26+M+xwc7a5zgpOzlksHErZ/LuKtRuPx3Q/1
         U79lZdtF7zTaDnPs1Ane5nKHX8rOzug1DXVRAI/WAFG9IEkez6EaxerMBzuFKrTbpXSA
         CfQqp6+QklRFmEU+FXW+aJL0kxdwtEn+F0H7JxngViwREvpHbaFTgPfNztExa2vPYyfF
         v776ZSIRzgVv7Dd8u51WnRRi28NT37DJrRZW9lLEE6dAoE21JNV5qjmfeEDuWR/DTO2n
         AqyUttGNLKcTBSkX071/FcG/8Zimf32DI+83ORk2G98eSOjKmt+pEuWjgU7fE4CHncTP
         LEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325616; x=1736930416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
        b=jOUA/5/TNa8HksvqdQE1J2DMWh39jLKKgg83xEGCU97/yyl6OXN6FJUxv/+Zl5n/SK
         hxrArFjWriLE40kNW19G7QZOLRGqCSzB0m+dJLH7KOnEe4MI3dkzGTv0XTsSPFQaiiPu
         4lcM3KudyBC8/xHfVPcr9kaFnHc5xtNKb17zfYQVn7XPBoAAivwpGypJlQZrxd2zB/eZ
         FGPEiQL5KgC7SqEPbI9vqbEKM1j8zwD/KXelJfRX2K9jyZ7tdnmZEiPs3uskGxLbw6pQ
         HWvDcFAX/7RfvparfdmhdiBAV7SJWSuqxHIJTK9nHs6jczUPjxv4nFp+lYsnbmvuyXwq
         oPqw==
X-Forwarded-Encrypted: i=1; AJvYcCUmaMhXx2Bgpm86tt4HsdkoeJI+rfCdG+ArDwNZ1MRChDCWLNLtaTAeEHGnXoZta5ni4EDl@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3e0Ay2OCWo2r+b3X8370jDObQAJvN1KYT/IbMUAuWUn/4S3Gl
	YqzjOpAfh8fXkOJ5kjtv5RSpyT+J+Vk6O+YS+/r9SoFJDcuqMfJ5bQ2YT76fWwV0YIUvXBQWn6P
	q9Al3CrRkPEe82KK8T+fGti0hy10uBGvrVfF7PPEbxZ4/7c0l/A==
X-Gm-Gg: ASbGnctmLWU7VRkq7qD2wmINw6z6JpmN4dK8F2nK82VnFB68Z7wIT9Dq+PT6V7WoXGj
	gJD48R3t2G1C5i48O9MEihpUa5LnyarvLc/lk1RtoHjqmEY5B1oFb9XMQlHz7zyg1jcMK
X-Google-Smtp-Source: AGHT+IFl8H+0Y5zTJzlBfI5aIydyFDaWJ1GV39q6UZ01B11fzHBRDnHXE0FV7FUDOqKvCczWXUZt4FhIPpZacI5ligg=
X-Received: by 2002:a5d:47c4:0:b0:385:f892:c8fe with SMTP id
 ffacd0b85a97d-38a87306ddcmr1605877f8f.21.1736325615885; Wed, 08 Jan 2025
 00:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311507.14xdiaIX-lkp@intel.com> <Z3OyANq7fAkCs+Qi@rli9-mobl>
 <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com> <Z33NUGpt7FM6FKuJ@rli9-mobl>
In-Reply-To: <Z33NUGpt7FM6FKuJ@rli9-mobl>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 09:40:02 +0100
X-Gm-Features: AbW1kvZq1qORT0gFbWfSwaaryRaKvr2Sdho2Mc5xAhDXDEz__7FPQG8iIFou4rQ
Message-ID: <CAH5fLgj0X6AkUjv72axApE7=+47qXSPFdqp71dSPG7URsFpbMA@mail.gmail.com>
Subject: Re: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded`
 in crate `$crate::bindings`
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 1:57=E2=80=AFAM Philip Li <philip.li@intel.com> wrot=
e:
>
> On Mon, Jan 06, 2025 at 12:49:43PM +0100, Alice Ryhl wrote:
> > On Tue, Dec 31, 2024 at 9:58=E2=80=AFAM Philip Li <philip.li@intel.com>=
 wrote:
> > >
> > > On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> > > > Hi Alice,
> > > >
> > > > FYI, the error/warning still remains.
> > >
> > > Kindly ignore this report, which had already been discussed in [1]
> > >
> > > [1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy2=
1BJQGGYdZSZA+KV=3DoP6q9iJg@mail.gmail.com/
> >
> > Would it be possible to upgrade bindgen used by this robot? Please see:
> > https://lore.kernel.org/all/CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh=
9FycDYGQ@mail.gmail.com/
>
> Sorry, i missed this suggestion. Sure, the bot side will follow up to
> upgrade bindgen, so far, it follows scripts/min-tool-version.sh to choose
> which version to use.

Thanks!

Alice
