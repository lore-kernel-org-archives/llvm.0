Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EA34DB61
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770848605; cv=pass; b=kmbEM3IDHkkGbrrbYdyqy6+Ptr07cQFdG/5DUM3cmYczlBel1k/xwONZcTJqUs8JZVgbp/YqZ5kPwXw8YngAnlP13iTdzxKTfvymYUWdxE+gdMtCdwojQrx2PEfeCLWd0EYUXKWNc/pZIPMQ4S8CTqDJ/cevp7F2uk55F4RI2mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770848605; c=relaxed/simple;
	bh=t7CmiueZQTFgB9OhTdQVtK4rAbqMocYVGmzF4dRfH2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPpY8qP8wkpn0UyEU0sgEFWGy8mVLcmKBm0BELckrRYZ2HSkwdYqBhMw8zhbCILnh3t2zLOxipTMk0cn1zDBqKLZJHxtgqaX8MdW8Rb/W4BFbC3DgVyv8pMpS6QdV+SJ900KzWovmRCyY4QoMpW0erMKrihdQGHP8ptIq+zagto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2Fv4sSJ; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2Fv4sSJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2baacadad3eso846eec.2
        for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 14:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770848603; cv=none;
        d=google.com; s=arc-20240605;
        b=S1gHeYriQ0iJsJ/wjGqRrljT+q2FosUe+PdKTZT9vb78s0PR/xkRHewKd/WABunLSf
         J0S7sxTxmuXC7Dxr6tmD4ozONaUBXaGRTOgaMdwh643WAO18h2/PdqKPcyZyEpVq9C+a
         nhc87m1ZIZipUqWDcuaYyQ6brHGQK/Q6DTlQcSU4vtx4qSU5eJyuFc9uo+b/HGAnmA+q
         Mw4MQU3wCIcGI8UulW/IQsWrCkmXcr5xeEgECkvnaCAa0coZt5X2r7PWWVlp88UD5Ick
         tegtlmQQBVf5X16GLgO50h1fMSOFZfaX0XiE803eU+Tfob/w+QpBL2Q8ahr83IhQXxzC
         ZLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        fh=hRrTue7erFo165HsNotmSjMMvrBxt27OKWTYiB1gin4=;
        b=j4HA+wVXphr2Rm/sfCRTFQRlWUPpGsYQ9SdYez1fShtqaxFXj6rj1mXirHF8wYWgjf
         /J0x2/DQ5bAsVZHD4DDhEYkaheBxmIosLcr4iAyCMQB7904EMObdaJX8E+wJiuoy3/SN
         +Lf9+92KiBUUBGpGcJ0WyW7e+2oj9UhiqRt6fXHYUlycvUs7psdVXfM/XEJd3GOXtsxp
         9iyyfcvvSjELD+yNNWAXKPZersutxw7xAzwGHbs7VERnnYI7q5pXM7hF+8885PMhP5mq
         oLvokjIqltylmkdJDiI4Qjvy1GWmEt9h+jzqHgkQyf/Zytc+Sx3YP9zfJ8EiGxtpHjDM
         MK/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770848603; x=1771453403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=a2Fv4sSJqbaH7OeOJ5B9AMDsVGUkQy+e4kaju8z44FJrrvCA8QZxb4k3IDsGTGFz4V
         02r9GseL1jVwmMmneEPR9tHZc6ElrbtxCqBhCYeN+uWjn1LnwC3ZY8QGB36sFgjE3OnF
         mb72hWhPdDv9dnL5QkkiN9x2sTM+9dSrCTI2+3TRrYz7H5dxl/Z7/POj7fMLgLUURzMM
         z8idTeTj6OMNfBUo/eKS6kp8JSTJuaybG3ZYEiNiDdol2m/c+CmoAkBqItZ+o6qhYtGn
         o4fzTEuXIYG734g4q6xGZiemQwHbHVw3Ct0Q6vEkEEYQ9LY9RoW2BwG5SZYxSQUf6QfA
         MrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770848603; x=1771453403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RfH/ZJAACI/swH2C3a/IoB6OapnQajyNzXEzxpMU19Q=;
        b=xMfI6n87N062MaXIv/PEYcdZeY296yGop18ga1T8yB3SdFqiVoDYaSnomm5k/Q9LlO
         Yenfehb3EwKY4A4FwZLdwm/iFsFLh6a+OIwWvShaSlF5bCQp/zeMO9cDhrj8VyxOtV5i
         GIn7iuBNaObg9wAQQ80guzIUDNTJwWGVXZ8sEABGfChpj0H38+SppF7nDvafj7bsn7Jt
         itDvzu8JouciLsMg9srVV2bkKY+f8XugZH3c2a74eIQOMA1xqytDjIk6W/QomgFstqUO
         gE63vwhTDOorFtm9yyuqcb9Zr/SoQtY5zH+oKUh0/nZ9VWA0BZAM8mcyYD8VzozSxVsa
         6eMw==
X-Forwarded-Encrypted: i=1; AJvYcCUNEuEttTjOCDUpdQ1I6KlyDpinD5y0HvhK5wSUvfilgnPYeP04ixBAWLkF3agu/E5jVmDD@lists.linux.dev
X-Gm-Message-State: AOJu0YyJKLvPW1NgPc9TOwqTBzNyTc6BGqPckRjAcAtT77rBziBpNldQ
	RLnph3vc1tvOKJVbCnVVtV+Znt9J/6tlZvNQR65JRDb5KXaHw8gGMUF8ONKE3fGDxLH+ALj5sfo
	O0tjo1RMyyxj6Y9JbzWIk/DyZyt42g58=
X-Gm-Gg: AZuq6aJNF3k393lYz3AElSls1OM87qWb0/554iB/f39WUU5+KCipVB8kOSnj71CfEuh
	6oI1hd9kBYNTwI+NlvmwTOzBZuxT4hylmSAwI7Jn/DKPK+g5mr/JvNw4v9IGxRrsxWqblPvsxmE
	ZhZBDZvUTapGqcLFvz5g5AL/hfg3HTyP9AE5FUGXo8noUscDXLnuh454gYT6OfVLyqezrrJCVAV
	VL9hHr5p9kXf6Q6QjWjOn+VJ7K7sEyuAoowXMuFv1n46YcKCUdnhc8res+xnL/3E+2vjwRNdUwH
	NWomUpTbHaGJImgORjUDHj5RzBc0LHRkDp0NOoMl9y63gU1PIz+JqYyNPcdas6t247YiEU6AYAe
	CuqwSotpBKBHDf10ty6WX77pz
X-Received: by 2002:a05:7300:cb0f:b0:2ba:7d5a:a816 with SMTP id
 5a478bee46e88-2baa8079874mr215051eec.4.1770848603104; Wed, 11 Feb 2026
 14:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 23:23:08 +0100
X-Gm-Features: AZwV_QiUruFZTWSfo62Op58oUYH2ayIoiaQzk5z1Tco-BdUXIDPQzuMLaoXlnas
Message-ID: <CANiq72=-8urJufUuZLnRtm6qKCUhsSd=kPF=_a3ga=nk-iMV5A@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Fixed as well for Rust 1.95.0 (expected 2026-04-16) when using the
LLVM they provide.

  https://github.com/rust-lang/rust/pull/152428

Cheers,
Miguel
