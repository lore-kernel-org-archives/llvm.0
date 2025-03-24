Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EEE19E7D0
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742809073; cv=none; b=hFbG0WDEBo14mY6FDq8GPYx3SaIvm5YQqFasHwXkQR5LKHAHocE9r4d8UaSImIy2gL7M8W5MJFm8SF8Hr7Vsejwk/9OCkjkvQDHLFDRyA/x4NW83ZPwcU3/E/nAX/+Hn6SatukjnodZWJo8zVUODQ54seQcg2Pes7D9QI375U9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742809073; c=relaxed/simple;
	bh=F09joWCE15FJHzvmnuhZZDe0J85P+cppG5qFK6Ig3eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfMaQy9qWFYD8rL3NE5g0aXxcwPQtKzHqbTwS4OcYDVSYutXODo18e+iFjBNPO0qeJGYsz8DzzjudRajEWlszs8Ge5GpgdzVypOgZs6Pi1HOYWkYyEGd6qLYOGaWFv0gkGntOQaq6gP0AQmOpvToSFw7c4q6heqLgKxxFbK/8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry1EEYYd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry1EEYYd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227c7e4d5feso1539725ad.2
        for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742809071; x=1743413871; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F09joWCE15FJHzvmnuhZZDe0J85P+cppG5qFK6Ig3eM=;
        b=Ry1EEYYdH4DbdEPk+KmLM4vk/iLN73GbxvzzRIx4J808wJDjqB1VZuSAALdK4rZZ7z
         DcHb40hlaSDFkDjoJMe2jmCMV7zwxYJf8e17XaXI4qCoChqMelszaXNO6gSr8zB8Iznm
         9ZYQNbGs7LwBTAcZrhURmpMLrQaS5YpHshi+wGthHToDnIMVA+7OEVaodtYZl853S475
         w0L3Um3tHhAJ6ftCDXZw1GOpr1mm5pUVTqJlHvHYrvlJvjC4bNYUoR6+xI/7qKY6qr2f
         8+KNldUm6/ulFtH/ZuoG8jl+scjUleMHdyOEaTxcUhkYt7j2YHMVCx4BtFdWNUhr5ufB
         tHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742809071; x=1743413871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F09joWCE15FJHzvmnuhZZDe0J85P+cppG5qFK6Ig3eM=;
        b=ZMpbodaByMyVM13n82ZYta8BBsjgJ4ooaauU5olygvvN8iwf+Qxl7Hray1R4fdDcGp
         WO1FSrexShZqdW/vx67ype0I5gNSV+Zv6jaigS3le+U1x0C0bJT8et7VwelBeVwpwPwK
         fttfR7PatL0VCQ5aU2vqEEg2IVAgzH7PyWajaLj8b6IZ88mJvgKWZT6Gvorintq0Facl
         vqh4UWTXgDgbadQLRu8/8k/mgwRblpPmXo39WnML+q7yOJnhdboG4ljFFHGFlXXTlXFu
         2agcnHd3WP4laTsvZcbtQSEqVjtPrIkLANUvcwd1PNJRR9xoTKqIU6i8UhL3tTpp7ETA
         SGug==
X-Forwarded-Encrypted: i=1; AJvYcCXRX3EJl5w4KPg4FZXFYclu+Zxk/BSZpeWmugYa3x0AvmnHynIheHeG0K8uyqq/29mnsPPX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl3UQHzTcg4Vjl0sWbRqcy3kgRoyDWG0/Rh+Zf2hsMlzxgA6Pl
	8tXZVY5OlC2EQihI0bu8t6HrOG85lv0BcKzQdju/uI6++Tu96w2jMsmYYKUtgcjpPyyerp9r4fD
	04Oxz59gcinTcQzoC4e8gjB6Aiuc=
X-Gm-Gg: ASbGncsNU1zmEx3suVhNhNwtIVJBYiKOKnOhZOHXit4HDbGSUQJ773gWQJJB1G450bb
	7NQwdGcU9psWNKzJTbHA2spHoP8/3ZeyeGG27lPfxtbHaZQq1g35kKgOmPVBhjd2sQA/IrDXNYX
	5N0BaQtjzb5FHGITJcGp0540ShzQ==
X-Google-Smtp-Source: AGHT+IEdykui222hm/ZWYGLSJ8TexC3iOARKnbXgoXKpded+UXemeqbT/BZzY3q6RLfstwRMsEnNOERjQExhvXa3/JQ=
X-Received: by 2002:a17:902:d511:b0:223:364f:7a5 with SMTP id
 d9443c01a7336-227913b871dmr50503065ad.11.1742809070900; Mon, 24 Mar 2025
 02:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
In-Reply-To: <20250324061835.1693125-1-kunwu.chan@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 10:37:38 +0100
X-Gm-Features: AQ5f1Jqf8saODp4jWXHiWsm4m-HG1gDbjXnY9txF5lZmpm0WlV9pTLQSxoUMJEE
Message-ID: <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for CondVar
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 7:19=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>

Nit: I typically use Link after Suggested-by, to mimic what the docs
require about Reported-by with Link. (No need to resend a new version
just for this :)

> - Remove '#[inline]' for notify()

It is good that the commit matches the log now, though I wonder if in
the future we may want the `#[inline]` for `notify` anyway, even if
LLVM does that one on its own today.

Cheers,
Miguel
