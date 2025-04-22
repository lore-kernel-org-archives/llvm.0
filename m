Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D41FE45B
	for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335970; cv=none; b=KiTP+nGylvhAlfOTGXM2htSStX9Ob3IOW+4f2WovWj0IpTisLc6OTa/n6K87wcFe3dgRq0plFDSHt2N1vcH8BPyrJ/rtpBvWeS6qXbtTMKD/iLuJ59AlgxF6N00YSLjQ50RqNpIAIeUvcIEtdyKf+7svk9rdK/zDBmxYvr8WyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335970; c=relaxed/simple;
	bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvIgCumgFk3LDUdMWFPNu/07is4LoMVegxHAGGWscvPAgqKIVnnw/RMC/nTC8NIyEisFdypM82dFXwZrNgK2sAD5nsw54Jqr7HnU6ZHiVLcaw5inBQwwVkAl1OvA13zWufUp5S/GZJ1K60HJlKWR+NLqzI82rlHpZn2FpS6mA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcW7/Rqo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcW7/Rqo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5f28ecbcaso465712a12.0
        for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335968; x=1745940768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
        b=GcW7/RqovY7BbsfBQIa+s8TBjU+IQBO9U8/fm7gT1+3yagY/51iJKB/6O7OiWfxu8P
         8W5bphbys55TNdnCkMybrMSCBvXyT5CipZRvc6MAxbwedUmb/ErPBuA4Z09QUKoDj3Yl
         LGf84qpJyw2ChQd/hcyYJ2bqZeLU1vei/UGa0/z8c68lPhCp9iTM+0qV4bIM0grq2BZP
         v8ObzRfpFaVti52JuCcMe/hguEatbvlPxUd+ITNhAHywIMEhEHeWk+o7rWrViH9DA0v5
         G0g/FkKxjP7gH1vcwmUnLMRn8dw6TsXaYrBUodLJZPa4lCc05NyEG/mw2oGe2A3XqAAd
         ZoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335968; x=1745940768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
        b=MTv7Buf0NZRGEH7VGJIs302ITLCM4eJSc9Rorwayl+kOuMNs/rPJl4YnO9YhCDaa3Q
         8lFWLJceXn6iIHFzhbFQYzukVNU1nXjalQkpvUD12MrPOZkronPCX8FciAC5oUem+J8a
         iC2j58JHE7zhl/YgmZ90dHm+goCxD/WrcsAyVFaju2q6vh/dITs5fZ3NfiyH70W32/uL
         UB8w3cY7YZ7KdvL4EDTV2KkhtYFi9zkGRLSX5Mp1lTQzbBO4WbyPG1gFTmLTkgeHJdbx
         8IBF35/PrU/JpRIDXHMUcOjK21AouiX5p+D77PZkPSGAuX9KGE3ILnzGEdsv3iTUqMap
         qtzg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ez+bPj/8TFDD6EvVLp/Fyq+UXq3RonbDMqzrxENWjHESMNR93xFS7HExOJJ9a0chKp9c@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2yefcSod3Ycy4P9FZqaxyo3iWzAeEy1mJrWOmt6gxrQqRSyZE
	7GCOhndWao3QCWC1GqV0Ux85yd4NhX12zT3uj8oJ/r2fHb7JWXtpy9b3sVLhT3NKHVe3k5Iu8k8
	nclM7K/R8FaF8qmqi8QL8C0XtoR8=
X-Gm-Gg: ASbGncvxIfBzVD+9T85HL8FJgKUzw8A9xM2L5Wl3bupc5XPf/VKaAubaAOQq3XyVqKJ
	/CX+f9BfIRvsoKeMeJNloSch22EoK0JDYNg1fiRPex8mBDxfo+k7q8ReFoFhZTVWSi6aoXQt+LC
	g65fKX6MHggiIXTQ7KcQ9VrA==
X-Google-Smtp-Source: AGHT+IE4k3qmenB2kafCYTV14I6rIbjlGAOhs2dY1THietnVOi9X9wnempMQ5qfY8fdWb6E9LzDysHlOZ2hKTE3pwvs=
X-Received: by 2002:a17:90b:1c0a:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-3087bb3f364mr8784892a91.1.1745335968072; Tue, 22 Apr 2025
 08:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
 <20250422125824.30525-1-contact@arnaud-lcm.com> <CANiq72n41Oj4K-yZCWbNXJQEEjTqjXHYgrkffAg_mUg8dKLWQg@mail.gmail.com>
 <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
In-Reply-To: <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 17:32:36 +0200
X-Gm-Features: ATxdqUGLGad79DCYWTc2GUf7UvBVG5jfl201Q-Z7BM1Apnk-7A7USXEN5LtVCAU
Message-ID: <CANiq72=UOOyf-esnRUCR0_gxFptdpNOymCz02vgesdNL7zTvHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] checkpatch.pl: warn about // comments on private
 Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:37=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> As mentioned earlier, we can reduce the score of any heuristic which
> could lead to any important false positive.
> In my opinion, as long as the heuristic is relevant, we always have the
> possibility to diminish the score associated with the heuristic, hence
> preventing unnecessary false positives.

Definitely (my comment above for this one was just a note, i.e. there
may be nothing to change -- I just thought the commit message referred
to just checking "Return" and not "Returns", since it said
"imperative").

> I think that you are definitely more experienced with what's done
> commonly in rust code. Let's maybe change this heuristic definition with
> @ related to types or some other annotation. Do you have some example I
> could have a look to come in the next version with a relevant list of @
> we can encounter.

What does "references" mean in that heuristic? If you mean external
links to some URL, then we typically use Markdown for those. The
inline ones like `<https://...>`happen in both comments and docs. The
`[...]: https://...` ones are way less common in comments I think (I
can't find one).

As for `@`, if you mean the actual character, I grepped for it in Rust
files with the /.*@ regex and found just ~13 matches, and all were the
emails and disambiguators I mentioned. So I don't think we really use
it for "references" (assuming I understand what that means).

I guess you already looked in some `rust/kernel/` files -- some of
those are really the best examples of how docs and comments should
generally be written.

Thanks!

Cheers,
Miguel
