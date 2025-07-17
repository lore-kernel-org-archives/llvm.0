Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BF291C30
	for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745883; cv=none; b=gg6kUE1gdlmeBgJyAXLoEKSrRGsIBqJv+5On5fJlq5tIersbWqA/NFnDTOXVsnVtfQmyrVSU9+zMcXa1yFYzpuQh1/fefepC5TJgyKxq9GfZCiFsvpRoXiPpuSBuXLM0wUESs+eohwo8W5mYt9qo9tURljoS2d/NyjDQ4cjN/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745883; c=relaxed/simple;
	bh=cQaqVDgy4SckeQJyFWnR3lim3RXCi4FuZHi/y1GNXJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvygcKmQB9ThMInNaLbosDJFa+CczfdCLaOD+RbXXR+XrrIq2yelqwfQxoVWpZqFrKovuad1Qk0Usjr8nwNM2RsiFe8q5p7efj5axQkYsJs+zdCRA668UMBJBKX+N0L+mmL50GuOtQUcpY4mJj6jB+NJjy6xKR2+KsID3psQgow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1hHEXKZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1hHEXKZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313336f8438so143422a91.0
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752745881; x=1753350681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoOezcET8UmypwzwvlrLUte+8S0VuNqGvHQFe8FNIeo=;
        b=V1hHEXKZxJSMLUZd2T2YBZehmWeW3NbVj/NjggrueBQKtq+Dr+c6MAEqf5BiUyrlvn
         nvBPWuUWCMpd1V1wYJ4CHxjzF30wiA4qjKw/TfZ75SFAuKODUpo/oVGQY/hs8eNl77BU
         XsEG5/zX0MBs7hEGMhAJRPWgTz8ljDHJh2Zhk+aPs/AO73XMLjuyMT0GYXdN99YMyDMN
         7Up1EAUDIBDa0FpVZnW/ttPOYYkQ99aIv9orAmxZUZLgePTaYxP/ZPqAQTm12vZxPFOp
         9xZ/hii0x3yvZT44flobtY4fP2BO6orj7LNTeRKVxng2TbawVq+zYi9DiNj899brFDHe
         pX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745881; x=1753350681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoOezcET8UmypwzwvlrLUte+8S0VuNqGvHQFe8FNIeo=;
        b=cfiZCugnuKwytmOansihAHpmJoXKhsgLRib3SVAmPm8T6I6MQcNQZnp2aHLDBjm/WI
         NDRcCUnOv6Afd6Owdi8ZHVI9R9Y++dPXrrl30OF9u34B2V7vHQo2XXB+LtKNOlLrYsYy
         4yje5km66C9Cw7nxUSTGagGBreQhedMnw3I4DQZ0IrrcftLeIDS1bjjpEILxbTw19cqM
         TUjNsE7TdBj7MsXAqNkLm/wD/erdQVaWvXhfBviLP+iv1qe2ec9gy2RMhpBhpWyLdRJj
         8A4KQ0oAXOGUxLrq67EyU/SXgfDq0H/he1xNiSvF0SlMHYOeT5rIzMv9iVimL6hXvsN7
         gN9w==
X-Forwarded-Encrypted: i=1; AJvYcCVAaT4EauFJ9HX7+kZD3qlFooq/ho7vzFyVM7D08vGX+NQ1REOjmCoB2EkAhfrMZeFZOM1u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4FVB+JNwCjFigkfKiCBIaZ8wEESuI5oIwYb3h9Qa79k5o0aN9
	AJWVNfL/RISIrOGL/7yn/wGB+oBEFmtsySlTCJr1CIAflr9jYs6Uh6gf0q0sBzkPMD1/B/hRaz4
	ck6RLyNLSFNLSm405DxOHOXjF9OJ59/8=
X-Gm-Gg: ASbGncuzeifIH/UZd8adRi0F3azqZT6TD9+lRklgpqjNXvF6e0iUOaCwi1pZhFWN+tT
	jy85sHyNW1tl9jnlp6Cy0qk8kDDdhMErkhDqW8cvqnkR/o3bLioPGxxqMZMaKfPbWtEw60KEh+/
	GsoLHST8UxUcCURwbK+Sn/rOqEXRpDq5G4FIGpgwcA2lv1wwxm2E0RWoTQDAHwR/Vx8OzIZy6CR
	7X93+26
X-Google-Smtp-Source: AGHT+IHE3RFua6d6j8prMWudh7Xejt5xhZFdrWjbGlRuZ6pE6iadIeZ5MEbdWSZJS9fjWLKxIh9W/S1HkVJI8kJs+So=
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c9e7767fbmr3584725a91.5.1752745881278; Thu, 17 Jul 2025
 02:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717085300.work.146-kees@kernel.org>
In-Reply-To: <20250717085300.work.146-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 11:51:09 +0200
X-Gm-Features: Ac12FXwEMlRfz5cT5iny1Ggmin54LlImEScdSudxaMw40mhL-yA8t_7Hq-Yl4KY
Message-ID: <CANiq72kPmb+7Ygk_Qvsiq+22EJVSPjjwn4whdLuTGCPwvTAssQ@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __kcfi_salt
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 10:53=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Add support for Clang's coming "kcfi_salt" attribute, which is designed
> to allow for KCFI prototype hashes to be separated[1]. For example,
> normally two "void func(void)" functions would have the same KCFI hash,
> but if they wanted their indirect calls to be distinguishable by KCFI,
> one could add __kcfi_salt("foo").

It would be nice to have a quick sentence inline summarizing how it
will be used, e.g. what kind of functions will need to be annotated.

> To test the result, add a corresponding LKDTM test, CFI_FORWARD_SALT.

Sounds good.

> + * clang: https://clang.llvm.org/docs/AttributeReference.html#kcfi-salt

I guess this anchor will eventually work -- I see you asked about it at:

    https://github.com/llvm/llvm-project/pull/141846#discussion_r2209236363

From what I see, this still has to land in LLVM, right? So I guess
there is still time to land this (and the discussion started years
ago), but if you need to take it quickly as a base for some other work
or similar:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
